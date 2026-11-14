#!/usr/bin/env python3
"""Extract exact PRG assembly plus exact raw CHR from your own original ROM.

This regenerates asm/prg files. BACK UP MANUAL EDITS FIRST!
"""
import argparse
import hashlib
from pathlib import Path
from disasm6502 import generate

ROOT=Path(__file__).resolve().parents[1]

def extract(source,root=ROOT):
    rom=source.read_bytes()
    if len(rom)!=262160 or rom[:4]!=b'NES\x1A' or (rom[4],rom[5])!=(8,16):
        raise ValueError('Expected a 16-byte header + 128KiB PRG + 128KiB CHR')
    mapper=(rom[6]>>4)|(rom[7]&0xf0)
    if mapper!=1:raise ValueError(f'Expected Mapper 1 (MMC1), got {mapper}')
    (root/'assets/chr').mkdir(parents=True,exist_ok=True)
    (root/'assets/header.bin').write_bytes(rom[:16])
    chr_start=16+8*0x4000
    for i in range(16):
        (root/'assets/chr'/f'chr{i:02d}.chr').write_bytes(rom[chr_start+i*8192:chr_start+(i+1)*8192])
    vectors,cross,report,foreign=generate(source,root/'asm/prg')
    return vectors,cross,report,foreign

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('original_rom',type=Path)
    args=parser.parse_args()
    vectors,cross,report,foreign=extract(args.original_rom)
    print('Interrupt vectors (NMI, RESET, IRQ):',', '.join(f'${v:04X}' for v in vectors))
    print('Bank  instructions  code_bytes  %classified  targets  cross-bank')
    for i,base,count,code_bytes,pct,targets,foreign_refs in report:
        print(f'{i:02d}    {count:6d}        {code_bytes:6d}  {pct:7.1f}%       {targets:5d}    {foreign_refs:5d}')

if __name__=='__main__':main()
