#!/usr/bin/env python3
"""Build TMNT's conservative first-pass sprite-render speed experiment.

This is a 6502-cycle reduction ONLY, not a demonstrated 60 fps fix. The
proposed replacement is proven locally equivalent for the affected sprite Y
coordinate and consumes 3 fewer CPU cycles each time it executes. It cannot
remove whole-frame overruns on its own without an emulator benchmark.
"""
import argparse
import hashlib
import json
import shutil
from pathlib import Path
from asm6502 import assemble
from build import ROOT, build
from rom_patches import apply_patches
from rom_diff import make_ips

CPU_ADDRESS = 0xC114
BEFORE=bytes.fromhex('9d 00 02 de 00 02')
AFTER=bytes.fromhex('38 e9 01 9d 00 02')
OLD_SRC='''    STA $0200,X          ; $C114  9D 00 02
    DEC $0200,X          ; $C117  DE 00 02'''
NEW_SRC='''    SEC                  ; $C114  38
    SBC #$01             ; $C115  E9 01
    STA $0200,X          ; $C117  9D 00 02'''
MOD='lag_reduction_v1'


def make(root=ROOT):
    root=Path(root)
    original=build(root)
    expected=16+7*0x4000+(CPU_ADDRESS-0xC000)
    if original[expected:expected+len(BEFORE)]!=BEFORE:
        raise ValueError('vanilla ROM has unexpected sprite-render instructions')
    baseline=root/'analysis/dispatch_source'
    if not (baseline/'bank07.asm').is_file():
        raise FileNotFoundError('Run tools/recover_dispatch.py on the vanilla rebuild first')
    dest=root/'mods'/MOD/'source'
    dest.mkdir(parents=True,exist_ok=True)
    for bank in range(7):
        shutil.copy2(baseline/f'bank{bank:02d}.asm',dest/f'bank{bank:02d}.asm')
    source=(baseline/'bank07.asm').read_text(encoding='utf8')
    if source.count(OLD_SRC)!=1:
        raise AssertionError('source patch guard failed: expected source instructions not found once')
    patched=source.replace(OLD_SRC,NEW_SRC)
    (dest/'bank07.asm').write_text(patched,encoding='utf8')
    if assemble(patched,0xc000)!=original[16+7*0x4000:16+8*0x4000].replace(BEFORE,AFTER,1):
        # This also guards against a visually plausible edit whose assembly
        # unexpectedly changes another instruction.
        raise AssertionError('source changes must exactly match guarded 6-byte binary patch')
    patched_rom=build(root,source_dir=dest)
    assert patched_rom[expected:expected+len(AFTER)]==AFTER
    assert len(patched_rom)==len(original)
    assert sum(a!=b for a,b in zip(original,patched_rom))<=len(AFTER)
    manifest=root/'patches/lag_reduction_v1.json'
    guarded, _=apply_patches(original,[manifest])
    if patched_rom!=guarded:
        raise AssertionError('source compilation and guarded patch disagree')
    folder=root/'build'
    folder.mkdir(parents=True,exist_ok=True)
    patched_file=folder/'TMNT_NES_Lag_Reduction_v1_EXPERIMENTAL.nes'
    patched_file.write_bytes(patched_rom)
    ips_file=folder/'TMNT_NES_Lag_Reduction_v1.ips'
    ips_file.write_bytes(make_ips(original,patched_rom))
    changed=[i for i,(o,n) in enumerate(zip(original,patched_rom)) if o!=n]
    report={'mod':MOD,'claim':'Cycle-optimized sprite-Y write; NOT proven 60 FPS',
            'rom_original_sha256':hashlib.sha256(original).hexdigest(),
            'rom_modified_sha256':hashlib.sha256(patched_rom).hexdigest(),
            'patch_cpu_address':f'$C{CPU_ADDRESS&0xfff:03X}',
            'prg_bank':7, 'rom_byte_offsets':[f'0x{a:05X}' for a in changed],
            'bytes_changed':len(changed),
            'old_instruction_cycles':12, 'new_instruction_cycles':9,
            'cpu_cycles_saved_per_sprite_tile':3,
            'measurements_of_actual_lag':0,
            'runtime_gameplay_test_passed':False,
            'original_nes_frame_rate_ntsc_hz':60.0988,
            'notes':'Does not add CPU hardware budget; run representative enemy-heavy scenes with an instrumented emulator.'}
    (folder/'lag_reduction_v1_report.json').write_text(json.dumps(report,indent=2)+'\n')
    return patched_file, ips_file, report


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root',type=Path,default=ROOT)
    args=parser.parse_args()
    paths=make(args.root)
    print(f'Experimental ROM: {paths[0]}')
    print(f'Patch: {paths[1]}')
    print(json.dumps(paths[2],indent=2))

if __name__=='__main__':main()
