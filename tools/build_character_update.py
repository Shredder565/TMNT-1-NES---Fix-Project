#!/usr/bin/env python3
"""Reproducibly build TMNT NES with Leonardo's base damage equal to Donatello's.

Creates two *separate* ROM variants: a conservative Leonardo-only version and
one combining it with the earlier, unbenchmarked sprite-cycle optimization.
All binary changes are guarded and individually checked; this tool DOES NOT
implement no-respawn (requires execution-tested per-spawn persistence).
"""
import csv
import hashlib
import json
import shutil
import sys
from pathlib import Path

from asm6502 import assemble
from build import ROOT, build, ORIGINAL_SHA256
from rom_patches import apply_patches
from rom_diff import make_ips, apply_ips

BANK = 6
DAMAGE_ADDR = 0x9BCB
DAMAGE_OFFSET = 16 + BANK * 0x4000 + (DAMAGE_ADDR - 0x8000)
BEFORE = bytes.fromhex('07 0A')
AFTER = bytes.fromhex('0F 10')
# Initial recovered-source line starts with a five-byte non-damage sentinel;
# the next eight bytes are damage for the four turtle primary weapons.
ORIG_DAMAGE_LINE = '    .byte $23, $27, $89, $8A, $FF, $07, $0A, $09, $09, $07, $0C, $0F, $10, $12, $14, $0E ; $9BC6'
NEW_DAMAGE_LINES = '''    .byte $23, $27, $89, $8A, $FF ; $9BC6 ; preceding enemy-type data
LEONARDO_NORMAL_WEAPON_DAMAGE:
    .byte $0F                 ; $9BCB ; Leo normal (was $07, now Don's $0F)
LEONARDO_LOW_HP_WEAPON_DAMAGE:
    .byte $10                 ; $9BCC ; Leo below $40 energy (was $0A, now Don's $10)
RAPHAEL_WEAPON_DAMAGE:
    .byte $09, $09            ; $9BCD ; unchanged
MICHELANGELO_WEAPON_DAMAGE:
    .byte $07, $0C            ; $9BCF ; unchanged
DONATELLO_WEAPON_DAMAGE:
    .byte $0F, $10            ; $9BD1 ; unchanged
    .byte $12, $14, $0E       ; $9BD3 ; special-weapon data, unchanged'''
SOURCE_ANNOTATIONS = {
    'B06_8146:': 'ENEMY_AREA_SPAWN_ENTRY:',
    'B06_8225:': 'ENEMY_SPAWN_ACTOR_ALLOC:',
    'B06_8277:': 'ENEMY_INITIAL_HP_FROM_TYPE:',
    'B06_9913:': 'ENEMY_HIT_HANDLER:',
    'B06_999E:': 'ENEMY_WEAPON_DAMAGE_APPLY:',
    'B06_99AC:': 'ENEMY_DEATH_ON_HP_ZERO:',
}


def _source_with_damage(root):
    source = (root/'analysis/exploratory_source/bank06.asm').read_text(encoding='utf8')
    if source.count(ORIG_DAMAGE_LINE) != 1:
        raise AssertionError('Cannot find original $9BC6 damage table exactly once')
    source = source.replace(ORIG_DAMAGE_LINE, NEW_DAMAGE_LINES)
    for marker, alias in SOURCE_ANNOTATIONS.items():
        if source.count(marker+'\n') != 1:
            raise AssertionError(f'Expected exactly one {marker} in recovered source')
        source = source.replace(marker+'\n', alias+'\n'+marker+'\n', 1)
    return source


def _make_profile(root, variant, bank7_source):
    dest = root/'mods'/variant/'source'
    dest.mkdir(parents=True,exist_ok=True)
    original_set = root/'analysis/exploratory_source'
    for bank in range(8):
        shutil.copy2(original_set/f'bank{bank:02d}.asm',dest/f'bank{bank:02d}.asm')
    (dest/'bank06.asm').write_text(_source_with_damage(root),encoding='utf8')
    if bank7_source is not None:
        shutil.copy2(bank7_source,dest/'bank07.asm')
    return dest


def _enemy_hp_candidates(root):
    """Produce a research *candidate* list, not runtime spawn rules."""
    origin=build(root)
    report=root/'analysis/enemy_hp_type_candidates.csv'
    report.parent.mkdir(parents=True,exist_ok=True)
    rows=[]
    for typ in range(0x100):
        if typ<0x80:
            base=0x8749
            idx=typ
        else:
            base=0x883D
            idx=typ&0x7F
        addr=base+2*idx
        if addr+1>0xBFFF:
            continue
        romoff=16 + 6*0x4000 + addr-0x8000
        hp=origin[romoff]
        second=origin[romoff+1]
        if hp == 0 or hp == 0xFF:
            continue
        rows.append({
            'enemy_type':f'${typ:02X}', 'initial_hit_points_decimal':hp,
            'secondary_attribute_hex':f'${second:02X}',
            'hp_table_cpu_address':f'${addr:04X}',
            'candidate_32_plus_hp':'yes' if hp>=32 else 'no',
            'boss_type_70_to_7f':'yes' if 0x70<=typ<=0x7F else 'no',
            'note':'Candidate based on static table; actual spawn usage not verified'
        })
    with report.open('w',newline='',encoding='utf8') as f:
        w=csv.DictWriter(f,fieldnames=rows[0].keys())
        w.writeheader();w.writerows(rows)
    return report


def make(root=ROOT):
    root=Path(root)
    original=build(root)
    if hashlib.sha256(original).hexdigest()!=ORIGINAL_SHA256:
        raise AssertionError('This release is guarded to the supplied TMNT USA ROM')
    if original[DAMAGE_OFFSET:DAMAGE_OFFSET+2]!=BEFORE:
        raise AssertionError('Original ROM does not have expected Leo damage values')
    don=original[DAMAGE_OFFSET+6:DAMAGE_OFFSET+8]
    if don != AFTER:
        raise AssertionError(f'Donatello damage not as expected: {don.hex()}')
    # Verify the damage routine references the two-byte indexed table at the
    # recovered CPU address, not an arbitrary byte sequence.
    sbcaddr=16+6*0x4000+(0x99A2-0x8000)
    if original[sbcaddr:sbcaddr+3]!=bytes.fromhex('F9 CB 9B'):
        raise AssertionError('Weapon-damage SBC indexed-table call site changed')
    patch=root/'patches/leonardo_equal_donatello.json'
    leo,_=apply_patches(original,[patch])
    lag=root/'patches/lag_reduction_v1.json'
    combo,_=apply_patches(original,[patch,lag])
    profiles=[
        ('leonardo_equal_donatello',None,leo,'TMNT_Leonardo_Equals_Donatello.nes'),
        ('leonardo_plus_lag_experiment',root/'mods/lag_reduction_v1/source/bank07.asm',combo,
         'TMNT_Leonardo_And_LagReduction_EXPERIMENTAL.nes')
    ]
    builddir=root/'build'
    builddir.mkdir(exist_ok=True)
    result={}
    for name,bank7,expect,romname in profiles:
        srcdir=_make_profile(root,name,bank7)
        rebuilt=build(root,source_dir=srcdir)
        if rebuilt != expect:
            diffs=[i for i,(o,n) in enumerate(zip(rebuilt,expect)) if o!=n]
            raise AssertionError(f'{name}: assembly and guarded binary disagree: {diffs[:15]}')
        if rebuilt[:16]!=original[:16] or rebuilt[0x20010:]!=original[0x20010:]:
            raise AssertionError(f'{name}: header or CHR unexpectedly changed')
        filename=builddir/romname
        filename.write_bytes(rebuilt)
        patchpath=builddir/(filename.stem+'.ips')
        ips=make_ips(original,rebuilt)
        if apply_ips(original,ips)!=rebuilt:
            raise AssertionError('IPS round-trip mismatch')
        patchpath.write_bytes(ips)
        diffs=[i for i,(a,b) in enumerate(zip(original,rebuilt)) if a!=b]
        permitted={DAMAGE_OFFSET,DAMAGE_OFFSET+1}
        if bank7 is not None:
            permitted.update(range(16+7*0x4000+0x114,16+7*0x4000+0x11A))
        if not set(diffs).issubset(permitted):
            raise AssertionError('Unexpected ROM bytes changed')
        result[name]={
          'rom':str(filename.relative_to(root)),
          'ips':str(patchpath.relative_to(root)),
          'sha256':hashlib.sha256(rebuilt).hexdigest(),
          'changed_rom_offsets':[f'0x{o:05X}' for o in diffs],
          'built_from_editable_6502_asm':True,
          'gameplay_emulator_testing':'not performed',
          'strong_enemy_no_respawn':'NOT IMPLEMENTED',
          'leonardo_damage_equals_donatello':True,
          'sprite_cycle_reduction_unbenchmarked':bank7 is not None,
        }
    hp=_enemy_hp_candidates(root)
    report={
      'project':'TMNT NES (USA)',
      'vanilla_sha256':ORIGINAL_SHA256,
      'weapon_damage_table_cpu_address':'bank 6 $9BCB',
      'leonardo_changed':['normal 7 -> 15','low-energy 10 -> 16'],
      'donatello_unchanged':['normal 15','low-energy 16'],
      'scope':'Attack damage when a weapon hit is registered; weapon reach/hitbox unchanged',
      'strong_enemy_respawn_status':'NOT IMPLEMENTED; see docs/STRONG_ENEMY_RESPAWN_RESEARCH.md',
      'enemy_hp_candidates':str(hp.relative_to(root)),
      'roms':result,
    }
    (builddir/'character_update_report.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf8')
    return report


if __name__=='__main__':
    print(json.dumps(make(),indent=2))
