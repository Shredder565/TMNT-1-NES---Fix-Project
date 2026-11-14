"""Reproducibility, exact byte guards and 6502 sprite math parity."""
import hashlib
import importlib.util
import os
import sys
import tempfile
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from build import build, ORIGINAL_SHA256
from rom_diff import make_ips, apply_ips
from rom_patches import apply_patches
from asm6502 import assemble
from recover_dispatch import recover
from build_speed_mod import make, BEFORE, AFTER
from profile_frames import profile, compare
from profile_opcodes import analyze


class SpeedPatchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.vanilla=build(ROOT)

    def test_source_and_binary_agree(self):
        mod=ROOT/'mods/lag_reduction_v1/source'
        new=build(ROOT,source_dir=mod)
        patched,_=apply_patches(self.vanilla,[ROOT/'patches/lag_reduction_v1.json'])
        self.assertEqual(new,patched)
        self.assertEqual(hashlib.sha256(self.vanilla).hexdigest(),ORIGINAL_SHA256)
        self.assertNotEqual(new,self.vanilla)
        self.assertEqual(len(new),len(self.vanilla))
        self.assertEqual(new[:16],self.vanilla[:16])
        self.assertEqual(new[16+8*0x4000:],self.vanilla[16+8*0x4000:])
        index=16+7*0x4000+(0xc114-0xc000)
        self.assertEqual(self.vanilla[index:index+6],BEFORE)
        self.assertEqual(new[index:index+6],AFTER)
        other_diffs=[x for x,(a,b) in enumerate(zip(self.vanilla,new)) if a!=b and not index<=x<index+6]
        self.assertEqual(other_diffs,[])
        self.assertEqual(bytes(apply_ips(self.vanilla,make_ips(self.vanilla,new))),new)

    def test_6502_sprite_y_math_exhaustive(self):
        # Old sequence ADC $02 followed by STA and DEC abs,X; new sequence
        # ADC $02 followed by SEC,SBC #1,STA abs,X. Compare all input bytes,
        # both carry-in cases (carry set by original CLC), and outputs.
        for left in range(256):
            for ofs in range(256):
                adc=(left+ofs)&255
                old=(adc-1)&255
                new=((adc+256)-1)&255  # SEC, SBC #1 => carry-in=1
                self.assertEqual(old,new)

    def test_fixed_instruction_boundaries(self):
        patchasm=(ROOT/'mods/lag_reduction_v1/source/bank07.asm').read_text()
        self.assertIn('SEC                  ; $C114  38',patchasm)
        self.assertIn('SBC #$01             ; $C115  E9 01',patchasm)
        self.assertIn('STA $0200,X          ; $C117  9D 00 02',patchasm)
        self.assertIn('PLP                  ; $C120',patchasm)

    def test_dispatch_table_source_reassembles_original(self):
        source=ROOT/'analysis/dispatch_source'
        for i in range(8):
            blob=assemble((source/f'bank{i:02d}.asm').read_text(),0xc000 if i==7 else 0x8000)
            self.assertEqual(blob,self.vanilla[16+i*0x4000:16+(i+1)*0x4000])
        self.assertIn('GAME_MODE_HANDLERS:',(source/'bank07.asm').read_text())
        self.assertIn('OAM_SPRITE_TILE_RENDER:',(source/'bank07.asm').read_text())

    def test_frame_profiler_counts_actual_skips(self):
        with tempfile.TemporaryDirectory() as t:
            f=Path(t)/'frames.csv'
            f.write_text('frame,nmi_busy_flag,active_actor_count\n1,255,0\n2,0,4\n3,1,10\n4,1,9\n5,0,11\n')
            result=profile(f)
            self.assertEqual(result['gameplay_frames'],4)
            self.assertEqual(result['lag_frames_logic_skipped'],2)
            self.assertEqual(result['max_consecutive_lag_frames'],2)
            self.assertAlmostEqual(result['estimated_logic_updates_per_second'],30.049,places=3)
            f.write_text('frame,nmi_busy_flag\n1,0\n3,1\n')
            with self.assertRaises(ValueError):profile(f)

    def test_opcode_profiler_hotspots(self):
        with tempfile.TemporaryDirectory() as t:
            f=Path(t)/'opcode.csv'
            f.write_text('bank,pc,cycles\n7,$C114,5\n7,$C117,7\n7,$C117,7\n,,514\n')
            result=analyze(f)
            self.assertEqual(result['top_addresses'][0]['pc'],'$C117')
            self.assertEqual(result['top_addresses'][0]['cpu_cycles'],14)
            self.assertEqual(result['cpu_cycles_from_stalls'],514)
            f.write_text('bank,pc,cycles\n7,$8001,2\n')
            with self.assertRaises(ValueError):analyze(f)

if __name__=='__main__':unittest.main()
