#!/usr/bin/env python3
"""Build a CUSTOM NES weapon damage mod from a small, editable JSON config.

Derived from the supplied 1989 USA source. Verifies every changed ROM byte is
within the 8-byte primary weapon table (plus the known 6-byte lag experiment
when requested). Never touches the source/checkpoint or CHR banks in place.

Example:
  python tools/edit_weapon_damage.py --config config/weapon_damage.json --variant lag
"""
import argparse
import hashlib
import json
import re
import shutil
from pathlib import Path
from build import ROOT, build, ORIGINAL_SHA256
from rom_diff import make_ips, apply_ips

NAMES=('leonardo','raphael','michelangelo','donatello')
LABELS={
    'leonardo':'LEONARDO_NORMAL_WEAPON_DAMAGE',
    'raphael':'RAPHAEL_WEAPON_DAMAGE',
    'michelangelo':'MICHELANGELO_WEAPON_DAMAGE',
    'donatello':'DONATELLO_WEAPON_DAMAGE',
}
TABLE_OFFSET=16+6*0x4000+(0x9BCB-0x8000)
SPEED_OFFSET=16+7*0x4000+(0xC114-0xC000)


def validate_config(path):
    values=json.loads(Path(path).read_text(encoding='utf-8'))
    if not isinstance(values,dict) or set(values)!=set(NAMES):
        raise ValueError('Damage config must contain precisely leonardo, raphael, michelangelo, donatello')
    for name,stats in values.items():
        if not isinstance(stats,dict) or set(stats)!={'normal','low_energy'}:
            raise ValueError(f'{name} needs exactly normal and low_energy values')
        for key,val in stats.items():
            # Explicitly exclude booleans (bool subclasses int).
            if type(val) is not int or not 1<=val<=254:
                raise ValueError(f'{name}.{key} must be an integer 1..254')
    return values


def apply_damage_labels(bank06,values):
    for name in NAMES:
        label=LABELS[name]
        if name=='leonardo':
            # Leonardo's two standalone labels originally permit separate edits.
            for part,one in [('LEONARDO_NORMAL_WEAPON_DAMAGE','normal'),
                             ('LEONARDO_LOW_HP_WEAPON_DAMAGE','low_energy')]:
                # Limit to immediate next source line to avoid a blind number replace.
                pattern=r'(?m)^('+re.escape(part)+r':\n\s*\.byte )\$[0-9A-Fa-f]{2}(\s*;[^\n]*)'
                replacement=lambda m: m.group(1)+f'${values[name][one]:02X}'+m.group(2)
                bank06,count=re.subn(pattern,replacement,bank06)
                if count!=1:raise AssertionError(f'{part} not found exactly once')
        else:
            pattern=r'(?m)^('+re.escape(label)+r':\n\s*\.byte )\$[0-9A-Fa-f]{2},\s*\$[0-9A-Fa-f]{2}(\s*;[^\n]*)'
            replacement=lambda m: m.group(1)+f'${values[name]["normal"]:02X}, ${values[name]["low_energy"]:02X}'+m.group(2)
            bank06,count=re.subn(pattern,replacement,bank06)
            if count!=1:raise AssertionError(f'{label} not found exactly once')
    return bank06


def make(config,variant='base',root=ROOT):
    root=Path(root)
    values=validate_config(config)
    if variant not in ('base','lag'):raise ValueError('variant must be base or lag')
    vanilla=build(root)
    if hashlib.sha256(vanilla).hexdigest()!=ORIGINAL_SHA256:
        raise ValueError('Unsupported base ROM; this editor is guarded to NES USA SHA256')
    base_profile='leonardo_equal_donatello' if variant=='base' else 'leonardo_plus_lag_experiment'
    src_root=root/'mods'/base_profile/'source'
    dest=root/'mods'/'custom_weapon_damage'/variant/'source'
    dest.mkdir(parents=True,exist_ok=True)
    for i in range(8):
        shutil.copy2(src_root/f'bank{i:02d}.asm',dest/f'bank{i:02d}.asm')
    bank06=(dest/'bank06.asm').read_text(encoding='utf-8')
    (dest/'bank06.asm').write_text(apply_damage_labels(bank06,values),encoding='utf-8')
    compiled=build(root,source_dir=dest)
    expected=bytearray(vanilla)
    expected[TABLE_OFFSET:TABLE_OFFSET+8]=bytes(values[n][k] for n in NAMES for k in ('normal','low_energy'))
    if variant=='lag':
        # The ONLY additional modifications are the previously audited sprite
        # instruction swap at bank7 $C114-$C119. No claimed runtime 60fps.
        expected[SPEED_OFFSET:SPEED_OFFSET+6]=bytes.fromhex('38 E9 01 9D 00 02')
    if compiled!=bytes(expected):
        differences=[hex(i) for i,(a,b) in enumerate(zip(compiled,expected)) if a!=b]
        raise AssertionError(f'Unapproved changes: {differences[:15]}')
    outfile=root/'build'/f'TMNT_Custom_Weapon_Damage_{variant}.nes'
    outfile.parent.mkdir(parents=True,exist_ok=True)
    outfile.write_bytes(compiled)
    ips=make_ips(vanilla,compiled)
    if apply_ips(vanilla,ips)!=compiled:raise AssertionError('IPS patch failed round-trip')
    patchfile=outfile.with_suffix('.ips')
    patchfile.write_bytes(ips)
    return {'variant':variant,'table_values':values,'source_dir':str(dest.relative_to(root)),
            'rom':str(outfile.relative_to(root)),'ips':str(patchfile.relative_to(root)),
            'rom_sha256':hashlib.sha256(compiled).hexdigest(),
            'rom_changed_byte_count':sum(a!=b for a,b in zip(vanilla,compiled)),
            'gameplay_validation':'NOT TESTED on NES emulator; source compilation and bytes verified'}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--config',type=Path,default=ROOT/'config/weapon_damage.json')
    p.add_argument('--variant',choices=['base','lag'],default='base')
    args=p.parse_args()
    print(json.dumps(make(args.config,args.variant),indent=2))

if __name__=='__main__':main()
