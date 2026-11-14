"""Extended source recovery, character data, patch safety, IPS, and pointers."""
import json
import hashlib
import sys
import tempfile
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from build import build, ORIGINAL_SHA256
from asm6502 import assemble
from rom_patches import apply_patches, parse_bytes
from rom_diff import make_ips, apply_ips, changed_runs, offset_detail
from pointer_tables import addresses, COUNTS
from chr_editor import encode, decode
from recover_code import run, read_exec_roots
from character_blocks import from_sheet, into_sheet, validate


class AdvancedTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.rom=build()

    def test_provisional_source_rebuilds_exact_rom(self):
        data=bytearray((ROOT/'assets/header.bin').read_bytes())
        for i in range(8):
            text=(ROOT/'analysis/exploratory_source'/f'bank{i:02d}.asm').read_text()
            data.extend(assemble(text,0xC000 if i==7 else 0x8000))
        for i in range(16):
            data.extend((ROOT/'assets/chr'/f'chr{i:02d}.chr').read_bytes())
        self.assertEqual(hashlib.sha256(data).hexdigest(),ORIGINAL_SHA256)
        self.assertEqual(data,self.rom)

    def test_pointer_tables_are_real_little_endian_addresses(self):
        for bank,n in COUNTS.items():
            with self.subTest(bank=bank):
                pointer_list,raw=addresses(bank)
                self.assertEqual(len(pointer_list),n)
                self.assertIn('.word', (ROOT/'asm/prg'/f'bank{bank:02d}.asm').read_text())
                self.assertEqual(pointer_list[0],0x8001 if bank==1 else 0x80C9)
                for i,value in enumerate(pointer_list):
                    self.assertEqual(value,int.from_bytes(raw[1+i*2:3+i*2],'little'))

    def test_guarded_manifest_patch_prg_and_chr(self):
        first_prg=0x10+5*0x4000+1
        first_chr=0x20010
        old=self.rom
        with tempfile.TemporaryDirectory() as d:
            path=Path(d)/'mod.json'
            doc={'name':'verification-only test', 'patches':[
                 {'region':'prg','bank':5,'cpu_address':'$8001',
                  'expect':f'{old[first_prg]:02X}', 'replace':'00'},
                 {'region':'chr','bank':0,'tile':0,'tile_byte':0,
                  'expect':f'{old[first_chr]:02X}', 'replace':'EF'}]}
            path.write_text(json.dumps(doc))
            mod,log=apply_patches(old,[path])
            self.assertEqual(len(log),2)
            self.assertEqual(mod[first_prg],0)
            self.assertEqual(mod[first_chr],0xEF)
            diff=[i for i,(a,b) in enumerate(zip(old,mod)) if a!=b]
            self.assertEqual(diff,[first_prg,first_chr])
            doc['patches'][0]['expect']='11 22'
            path.write_text(json.dumps(doc))
            with self.assertRaises(ValueError):apply_patches(old,[path])

    def test_ips_roundtrip(self):
        new=bytearray(self.rom)
        new[123]^=0x80
        new[0x20010+7*8192+3]^=0x01
        ips=make_ips(self.rom,new)
        self.assertEqual(apply_ips(self.rom,ips),new)
        self.assertEqual(sum(len(after) for _,_,after in changed_runs(self.rom,new)),2)
        self.assertEqual(offset_detail(0x20010+7*8192)[0:2],('chr',7))

    def test_parse_bytes_keeps_zeros(self):
        self.assertEqual(parse_bytes('A9 00 20 0F'),bytes([0xA9,0,0x20,0x0F]))
        self.assertEqual(parse_bytes('0xA9, 0x00'),bytes([0xA9,0]))
        self.assertEqual(parse_bytes('$A9 $00'),bytes([0xA9,0]))

    def test_chr_pixel_change_only_affects_its_tile(self):
        raw=(ROOT/'assets/chr'/'chr00.chr').read_bytes()
        pixels=bytearray(decode(raw))
        original=bytes(pixels)
        pixels[0]=(pixels[0]+1)%4
        updated=encode(pixels)
        self.assertEqual(len(updated),8192)
        self.assertEqual(len([i for i,(a,b) in enumerate(zip(raw,updated)) if a!=b]),1)
        self.assertNotEqual(original,decode(updated))

    def test_multi_tile_character_block_roundtrip(self):
        sheet=decode((ROOT/'assets/chr'/'chr05.chr').read_bytes())
        for tile,cols,rows in ((0,4,4),(91,3,3),(256,8,2)):
            with self.subTest(tile=tile):
                validate(5,tile,cols,rows)
                part=from_sheet(sheet,tile,cols,rows)
                self.assertEqual(into_sheet(sheet,tile,cols,rows,part),sheet)
                modified=bytearray(part)
                modified[0]=(modified[0]+1)%4
                edited=into_sheet(sheet,tile,cols,rows,modified)
                self.assertEqual(sum(a!=b for a,b in zip(sheet,edited)),1)
        with self.assertRaises(ValueError):validate(5,15,2,2)

    def test_trace_root_acceptance_and_preserve_baseline(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp)
            trace_file=root/'trace.csv'
            trace_file.write_text('bank,pc\n5,$8001\n7,$FFD8\n')
            self.assertEqual(read_exec_roots([trace_file])[7],{0xFFD8})
            rom=root/'rom.nes'
            rom.write_bytes(self.rom)
            out=root/'source'
            results=run(rom,out,[trace_file],include_hypotheses=False)
            self.assertEqual(results['banks'][7]['execution_trace_pc_count'],1)
            for i in range(8):
                asm=(out/f'bank{i:02d}.asm').read_text()
                rebuilt=assemble(asm,0xC000 if i==7 else 0x8000)
                base=16+i*0x4000
                self.assertEqual(rebuilt,self.rom[base:base+0x4000])
            trace_file.write_text('bank,pc\n5,$C001\n')
            with self.assertRaises(ValueError):read_exec_roots([trace_file])


if __name__=='__main__':unittest.main()
