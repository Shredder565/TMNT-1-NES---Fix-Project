"""Execute the actual NES 6502 weapon-damage instructions, not a Python copy.

The miniature harness stubs hardware/allocator and does NOT simulate a full game.
Test verifies isolated damage selection, subtract and HP handling only.
"""
import sys
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from build import build
from test_respawn_prototype import MiniCPU

DAMAGE_OFFSET=16+6*0x4000+(0x9BCB-0x8000)

class CombatExecutionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.roms={
            'original':build(ROOT),
            'leonardo':build(ROOT,source_dir=ROOT/'mods/leonardo_equal_donatello/source'),
            'leo_lag':build(ROOT,source_dir=ROOT/'mods/leonardo_plus_lag_experiment/source'),
            'no_respawn_prototype':build(ROOT,source_dir=ROOT/'mods/leonardo_strong_enemy_respawn_PROTOTYPE/source'),
        }

    def test_actual_weapon_dispatch_and_enemy_hp_result(self):
        for variant,rom in self.roms.items():
            with self.subTest(variant=variant):
                for turtle in range(4):
                    for low_health in (False,True):
                        damage=rom[DAMAGE_OFFSET+2*turtle+int(low_health)]
                        for enemy_hp in (1,damage-1,damage,damage+1,40,255):
                            if enemy_hp <= 0:continue
                            with self.subTest(turtle=turtle,low_health=low_health,enemy_hp=enemy_hp):
                                c=MiniCPU(rom)
                                c.x=5
                                c.ram[0x67]=turtle
                                c.ram[0x5B]=0   # normal turtle-index path
                                c.ram[0x77+turtle]=(0x20 if low_health else 0x50)
                                c.ram[0x0565]=enemy_hp
                                c.ram[0x0445]=0x4D   # ordinary enemy type
                                # Actual code from $9978 through the selected
                                # table lookup and subtract at $99A2.
                                c.pc=0x9978
                                stop=0x99B1 if enemy_hp<=damage else 0x9A7E
                                c.run(0x9978,stop)
                                self.assertEqual(c.ram[0x0565],max(0,enemy_hp-damage))

    def test_leonardo_damage_parity_not_hitbox_parity(self):
        rom=self.roms['leonardo']
        self.assertEqual(rom[DAMAGE_OFFSET:DAMAGE_OFFSET+2],rom[DAMAGE_OFFSET+6:DAMAGE_OFFSET+8])
        # This test deliberately makes no claims about sword reach/collision
        # rectangles or enemy-frame invulnerability; those remain unknown.

if __name__=='__main__':unittest.main()
