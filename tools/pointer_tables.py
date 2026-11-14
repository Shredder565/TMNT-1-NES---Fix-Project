#!/usr/bin/env python3
"""Inspect the two confirmed address tables; semantics still under study.

bank 1: first 52 little-endian CPU addresses at PRG $8001..$8068.
bank 2: first 100 little-endian CPU addresses at PRG $8001..$80C8.
Use --show to inspect a target's following bytes (not decoded yet).
"""
import argparse
import sys
from pathlib import Path
from asm6502 import assemble

ROOT=Path(__file__).resolve().parents[1]
COUNTS={1:52,2:100}


def addresses(bank,root=ROOT):
    if bank not in COUNTS:raise ValueError('Only banks 1 and 2 mapped')
    asm=(root/'asm/prg'/f'bank{bank:02d}.asm').read_text()
    raw=assemble(asm,0x8000)
    return [int.from_bytes(raw[i:i+2],'little') for i in range(1,1+2*COUNTS[bank],2)],raw


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bank',type=int,choices=COUNTS,default=2)
    parser.add_argument('--show',type=int,help='Show byte content at index')
    args=parser.parse_args()
    table,raw=addresses(args.bank)
    if args.show is None:
        for i,p in enumerate(table):
            print(f'{i:3}  entry @ ${0x8001+2*i:04X} -> ${p:04X}')
    else:
        if not 0<=args.show<len(table):raise SystemExit('Index out of table bounds')
        p=table[args.show]
        print(f'Bank {args.bank} entry {args.show} -> ${p:04X}')
        print('Raw 64 bytes:',raw[p-0x8000:p-0x8000+64].hex(' '))
        print('WARNING: script/data encoding NOT identified yet; do not change lengths.')


if __name__=='__main__':main()
