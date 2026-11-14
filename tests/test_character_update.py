"""Exact-binary audits for Leonardo buff and NES rebuilds."""
import sys
import hashlib
import unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from build import build, ORIGINAL_SHA256
from build_character_update import DAMAGE_OFFSET, BEFORE, AFTER
from rom_patches import apply_patches
from rom_diff import make_ips, apply_ips

class CharacterUpdateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.clean=build(ROOT)

    def test_unchanged_original_byte_identical(self):
        self.assertEqual(hashlib.sha256(self.clean).hexdigest(),ORIGINAL_SHA256)

    def test_leo_damage_equal_both_don_modes(self):
        old=self.clean
        new=build(ROOT,source_dir=ROOT/'mods/leonardo_equal_donatello/source')
        self.assertEqual(old[DAMAGE_OFFSET:DAMAGE_OFFSET+2],BEFORE)
        self.assertEqual(old[DAMAGE_OFFSET+6:DAMAGE_OFFSET+8],AFTER)
        self.assertEqual(new[DAMAGE_OFFSET:DAMAGE_OFFSET+2],new[DAMAGE_OFFSET+6:DAMAGE_OFFSET+8])
        self.assertEqual(new[DAMAGE_OFFSET:DAMAGE_OFFSET+2],AFTER)
        self.assertEqual(new[DAMAGE_OFFSET+2:DAMAGE_OFFSET+6],old[DAMAGE_OFFSET+2:DAMAGE_OFFSET+6])
        for i in range(len(old)):
            if old[i]!=new[i]:self.assertIn(i,(DAMAGE_OFFSET,DAMAGE_OFFSET+1))
        expected,_=apply_patches(old,[ROOT/'patches/leonardo_equal_donatello.json'])
        self.assertEqual(new,expected)
        self.assertEqual(apply_ips(old,make_ips(old,new)),new)

    def test_primary_weapon_table_6502_index_logic(self):
        rom=build(ROOT,source_dir=ROOT/'mods/leonardo_equal_donatello/source')
        for turtle_index in range(4):
            for low_health in (False,True):
                # At B6:$9988 the game doubles turtle ID, incrementing for
                # energy below $40. $99A2 subtracts this indexed damage.
                index=2*turtle_index+int(low_health)
                attack=rom[DAMAGE_OFFSET+index]
                if turtle_index in (0,3):
                    self.assertEqual(attack,(16 if low_health else 15))
                else:
                    self.assertEqual(attack,self.clean[DAMAGE_OFFSET+index])

    def test_combined_variant_only_intended_changes(self):
        new=build(ROOT,source_dir=ROOT/'mods/leonardo_plus_lag_experiment/source')
        expected,_=apply_patches(self.clean,[ROOT/'patches/leonardo_equal_donatello.json',ROOT/'patches/lag_reduction_v1.json'])
        self.assertEqual(new,expected)
        self.assertEqual(new[0x20010:],self.clean[0x20010:])
        self.assertEqual(new[:16],self.clean[:16])

if __name__=='__main__':unittest.main()
