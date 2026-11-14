#!/usr/bin/env python3
"""Build byte-for-byte original TMNT NES (USA) from editable assembly and CHR assets.

No external compiler, Python packages, or copy of the retail ROM are required
once the source/graphics banks have been extracted into the project.
"""
import argparse
import hashlib
import sys
from pathlib import Path
from asm6502 import assemble

ROOT=Path(__file__).resolve().parents[1]
ORIGINAL_SHA256='dc9acc00f081ffc396ec4c8477904e1a5046c242081ebadabef3503ee0d99628'


def build(root=ROOT, source_dir=None):
    header=(root/'assets/header.bin').read_bytes()
    assert len(header)==16 and header[:4]==b'NES\x1a', 'Invalid header'
    assert (header[4],header[5])==(8,16),'Unexpected PRG/CHR configuration'
    source_dir=Path(source_dir) if source_dir is not None else root/'asm/prg'
    prg=[]
    for i in range(8):
        path=source_dir/f'bank{i:02d}.asm'
        bank=assemble(path.read_text(encoding='utf-8'),0xc000 if i==7 else 0x8000)
        prg.append(bank)
    chr_banks=[]
    for i in range(16):
        path=root/'assets/chr'/f'chr{i:02d}.chr'
        bank=path.read_bytes()
        if len(bank)!=8192:raise ValueError(f'{path} must be 8192 bytes')
        chr_banks.append(bank)
    result=header+b''.join(prg)+b''.join(chr_banks)
    assert len(result)==262160
    return result


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',type=Path,default=ROOT/'build/Teenage Mutant Ninja Turtles (Rebuilt).nes')
    parser.add_argument('--verify-original',type=Path,help='Compare rebuilt bytes against uploaded original ROM')
    parser.add_argument('--expect-vanilla',action='store_true',help='Require original SHA256; omit after modding')
    parser.add_argument('--source-dir',type=Path,
                        help='Use another 8-bank source directory, e.g. analysis/exploratory_source')
    parser.add_argument('--patch-file',type=Path,action='append',default=[],
                        help='Apply expected-byte guarded JSON patches (repeatable)')
    args=parser.parse_args()
    blob=build(source_dir=args.source_dir)
    if args.patch_file:
        from rom_patches import apply_patches
        blob,patch_log=apply_patches(blob,args.patch_file)
        for name,idx,offset,old,new,note in patch_log:
            print(f'patch {name} #{idx} at ROM +{offset:#06x}: {old.hex(" ")} -> {new.hex(" ")} {note}')
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_bytes(blob)
    sha=hashlib.sha256(blob).hexdigest()
    print(f'Built {args.output} ({len(blob)} bytes); SHA256={sha}')
    if args.expect_vanilla and sha!=ORIGINAL_SHA256:
        print('FAIL: not an exact match for supplied original',file=sys.stderr)
        sys.exit(1)
    if args.verify_original:
        ref=args.verify_original.read_bytes()
        if blob!=ref:
            print('FAIL: output differs from original',file=sys.stderr)
            mismatch=next((i for i,(a,b) in enumerate(zip(blob,ref)) if a!=b),None)
            print('First difference at ROM offset',hex(mismatch) if mismatch is not None else '(size)',file=sys.stderr)
            sys.exit(1)
        print('PASS: binary-identical to supplied original')
    if args.expect_vanilla:print('PASS: matches uploaded USA ROM SHA256')

if __name__=='__main__':main()
