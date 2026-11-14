"""Guard configurable weapon tuning and meaningful 60fps trace thresholds."""
import json
import sys
import tempfile
import unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from edit_weapon_damage import make,validate_config,TABLE_OFFSET
from check_crowded_lag import crowded,gate
from build import build

class TuningAndLagGateTests(unittest.TestCase):
    def test_config_matches_existing_leonardo_profile_and_modified_source(self):
        config=ROOT/'config/weapon_damage.json'
        for variant,profile in [('base','leonardo_equal_donatello'),
                                ('lag','leonardo_plus_lag_experiment')]:
            with self.subTest(variant=variant):
                report=make(config,variant)
                actual=(ROOT/report['rom']).read_bytes()
                expected=build(ROOT,source_dir=ROOT/'mods'/profile/'source')
                self.assertEqual(actual,expected)
                self.assertEqual(len(actual),262160)
                self.assertEqual(actual[0x20010:],build(ROOT)[0x20010:])

    def test_invalid_values_are_rejected(self):
        with tempfile.TemporaryDirectory() as t:
            f=Path(t)/'bad.json'
            original=validate_config(ROOT/'config/weapon_damage.json')
            for bad in [0,255,-1,True,'15']:
                payload=json.loads(json.dumps(original))
                payload['leonardo']['normal']=bad
                f.write_text(json.dumps(payload))
                with self.subTest(value=bad),self.assertRaises(ValueError):
                    validate_config(f)

    def test_custom_values_touch_only_authorized_damage_table(self):
        with tempfile.TemporaryDirectory() as t:
            f=Path(t)/'custom.json'
            payload=validate_config(ROOT/'config/weapon_damage.json')
            payload['leonardo']['normal']=20
            payload['michelangelo']['low_energy']=13
            f.write_text(json.dumps(payload))
            # Only affects generated profiles in this workspace, never base source.
            report=make(f,'base')
            edited=(ROOT/report['rom']).read_bytes()
            clean=build(ROOT)
            diffs=[i for i,(a,b) in enumerate(zip(clean,edited)) if a!=b]
            self.assertEqual(set(diffs),set(range(TABLE_OFFSET,TABLE_OFFSET+8))-{TABLE_OFFSET+2,TABLE_OFFSET+3,TABLE_OFFSET+4,TABLE_OFFSET+6,TABLE_OFFSET+7})
            # Restore the default generated profile so release is deterministic.
            make(ROOT/'config/weapon_damage.json','base')

    def test_60fps_gate_fails_when_crowded_scene_skips_logic(self):
        with tempfile.TemporaryDirectory() as t:
            orig=Path(t)/'a.csv';mod=Path(t)/'b.csv'
            hdr='frame,nmi_busy_flag,active_actor_count\n'
            orig.write_text(hdr+''.join(f'{i},{int(i%8==0)},9\n' for i in range(400)))
            mod.write_text(hdr+''.join(f'{i},{int(i%20==0)},9\n' for i in range(400)))
            r=gate(orig,mod)
            self.assertFalse(r['passed'])
            self.assertEqual(r['modified']['crowded_lag_frames'],20)
            mod.write_text(hdr+''.join(f'{i},0,9\n' for i in range(400)))
            self.assertTrue(gate(orig,mod)['passed'])
            mod.write_text(hdr+''.join(f'{i},0,3\n' for i in range(400)))
            with self.assertRaises(ValueError):crowded(mod)

if __name__=='__main__':unittest.main()
