#!/usr/bin/env python3
"""Produce a deterministic validation report and rebuild checkpoint ROM variants.

This runs code-level validations, NOT NES gameplay emulation. A report must
never label slowdown/no-respawn as confirmed without separate real traces.
"""
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def run(args):
    p=subprocess.run([sys.executable,*args],cwd=ROOT,capture_output=True,text=True)
    if p.returncode:
        print(p.stdout,file=sys.stderr)
        print(p.stderr,file=sys.stderr)
        raise RuntimeError(f'Validation command failed: {args}')
    print('OK:', ' '.join(args))
    return p.stdout+p.stderr


def make_report():
    run(['tools/build.py','--expect-vanilla'])
    run(['tools/build_speed_mod.py'])
    run(['tools/build_character_update.py'])
    run(['tools/build_respawn_prototype.py'])
    for variant in ('base','lag'):
        run(['tools/edit_weapon_damage.py','--variant',variant])
    tests=run(['-m','unittest','discover','-s','tests','-v'])
    match=re.search(r'Ran (\d+) tests',tests)
    if not match or '\nOK\n' not in tests:
        raise RuntimeError('Could not verify unittest success summary')
    roms={}
    names={
        'vanilla':'Teenage Mutant Ninja Turtles (Rebuilt).nes',
        'leonardo_damage_only':'TMNT_Leonardo_Equals_Donatello.nes',
        'leonardo_plus_lag_experiment':'TMNT_Leonardo_And_LagReduction_EXPERIMENTAL.nes',
        'leonardo_plus_lag_plus_respawn_prototype':'TMNT_Leo_Lag_NoRespawn_UNTESTED_PROTOTYPE.nes',
        'custom_damage_base':'TMNT_Custom_Weapon_Damage_base.nes',
        'custom_damage_lag':'TMNT_Custom_Weapon_Damage_lag.nes',
    }
    for key,name in names.items():
        p=ROOT/'build'/name
        raw=p.read_bytes()
        if len(raw)!=262160:raise AssertionError(f'Wrong ROM size for {name}')
        roms[key]={'file':name,'sha256':hashlib.sha256(raw).hexdigest(),'bytes':len(raw)}
    info={
        'project':'TMNT NES (USA) reverse engineering, gameplay modifications',
        'automated_tests_passed':int(match.group(1)),
        'byte_exact_original_rebuild':True,
        'actual_6502_combat_routine_unit_execution':True,
        'strong_enemy_spawn_synthetic_test':True,
        'enemy_respawn_emulator_playtest':'NOT PERFORMED',
        'lag_frame_crowded_scene_replay':'NOT PROVIDED',
        'sustained_60_gameplay_updates_in_crowded_scene':'NOT CONFIRMED',
        'leonardo_hitbox_reach_changed':False,
        'enemy_sprites_replaced':False,
        'roms':roms,
        'next_gate':'Use real NES emulator traces with tools/check_crowded_lag.py and playtest respawn/new-game/boss progression.',
    }
    target=ROOT/'build'/'CHECKPOINT_VALIDATION.json'
    target.write_text(json.dumps(info,indent=2)+'\n',encoding='utf8')
    return info

if __name__=='__main__':
    print(json.dumps(make_report(),indent=2))
