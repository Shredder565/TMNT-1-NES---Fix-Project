"""Validation: assemble all banks, exact known CRC/hash, editability, CHR conversions."""
import hashlib
import sys
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from asm6502 import assemble
from build import build,ORIGINAL_SHA256
from chr_editor import encode,decode

class SourceTests(unittest.TestCase):
    def test_exact_recompile_sha256(self):
        self.assertEqual(hashlib.sha256(build()).hexdigest(),ORIGINAL_SHA256)

    def test_instruction_edit_changes_single_byte_only(self):
        # First reset instruction is CLD at $FFD8. SEC would be same length.
        path=ROOT/'asm/prg/bank07.asm'
        original=path.read_text()
        needle='    CLD '
        self.assertIn(needle,original)
        original_asm=assemble(original,0xc000)
        modified_asm=assemble(original.replace(needle,'    SEC ',1),0xc000)
        diffs=[i for i,(a,b) in enumerate(zip(original_asm,modified_asm)) if a!=b]
        self.assertEqual(len(diffs),1)
        self.assertEqual(original_asm[diffs[0]],0xd8)
        self.assertEqual(modified_asm[diffs[0]],0x38)

    def test_chr_roundtrip_every_bank(self):
        for i in range(16):
            with self.subTest(bank=i):
                raw=(ROOT/'assets/chr'/f'chr{i:02d}.chr').read_bytes()
                self.assertEqual(raw,encode(decode(raw)))

    def test_asm_error_on_size_change(self):
        path=ROOT/'asm/prg/bank00.asm'
        asm=path.read_text()
        with self.assertRaises(ValueError):
            # An extra byte exceeds bank capacity and is rejected.
            assemble(asm+'\n    .byte $00\n',0x8000)

if __name__=='__main__':unittest.main()
