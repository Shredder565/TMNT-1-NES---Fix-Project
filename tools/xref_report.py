#!/usr/bin/env python3
"""Generate call/branch/data read/write cross-reference reports for recovered code.

Instruction starts come from assembled-source comment offsets, not guessing
random bytes. 'exploratory_source' may include false-positive instructions:
consider xrefs from it provisional until verified by an execution trace.
"""
import argparse
import csv
import re
from collections import Counter,defaultdict
from pathlib import Path

from cpu6502 import DECODE, SIZE
from asm6502 import assemble

ROOT=Path(__file__).resolve().parents[1]
EXTRACT_PC=re.compile(r'^\s{4}[A-Z]{3}\b[^;]*;\s*\$([0-9A-F]{4})\s+([0-9A-F]{2})\b',re.M)


def rows_for_bank(bank,src):
    base=0xC000 if bank==7 else 0x8000
    text=(src/f'bank{bank:02d}.asm').read_text()
    raw=assemble(text,base)
    for match in EXTRACT_PC.finditer(text):
        pc=int(match.group(1),16)
        off=pc-base
        name,mode=DECODE[raw[off]]
        n=SIZE[mode]
        bytes_=raw[off:off+n]
        if n==1:continue
        value=bytes_[1] if n==2 else bytes_[1]|(bytes_[2]<<8)
        if mode=='rel':
            value=(pc+2+(bytes_[1] if bytes_[1]<128 else bytes_[1]-256))&65535
        if name in ('JSR','JMP') and mode=='abs':usage='CALL' if name=='JSR' else 'JUMP'
        elif mode=='rel':usage='BRANCH'
        elif mode=='imm':continue
        elif name in ('STA','STX','STY','INC','DEC','ASL','LSR','ROL','ROR') and mode!='acc':usage='WRITE_OR_RMW'
        elif name in ('LDA','LDX','LDY','CMP','CPX','CPY','BIT','ADC','SBC','AND','ORA','EOR'):usage='READ'
        else:usage='OPERAND'
        if mode in ('absx','absy','zpx','zpy','indx','indy'): usage+=' INDEXED'
        if value in range(0x2000,0x4000):system='PPU mirror/register'
        elif value in range(0x4000,0x4018):system='APU/IO register'
        elif value>=0x8000 and usage=='WRITE_OR_RMW':system='MMC1 register (verify mapper writes)'
        elif 0x400<=value<0x700:system='entity RAM candidate (unverified)'
        elif value<0x800:system='CPU RAM'
        elif value>=0x8000:system='ROM or mapper-selected code/data'
        else:system='CPU memory'
        yield dict(bank=bank,pc=f'${pc:04X}',opcode=name,mode=mode,
                   usage=usage,target=f'${value:04X}',category=system)


def generate(source_dir,out_dir):
    out_dir.mkdir(parents=True,exist_ok=True)
    all_rows=[row for b in range(8) for row in rows_for_bank(b,source_dir)]
    with (out_dir/'xrefs.csv').open('w',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=['bank','pc','opcode','mode','usage','target','category'])
        writer.writeheader();writer.writerows(all_rows)
    calls=Counter(row['target'] for row in all_rows if row['usage']=='CALL')
    actor=Counter(row['target'] for row in all_rows if row['category'].startswith('entity RAM'))
    hw=Counter(row['target'] for row in all_rows if row['category'].startswith(('PPU','APU','MMC1')))
    lines=['# Exploratory reference inventory (unverified candidate code included)','',
           'This is **not** a complete or proven call graph. MMC1 bank mappings',
           'and indirect jump tables remain unresolved. CPU addresses in the',
           '`$0400-$06FF` range may be actor slots, but names are hypotheses.','',
           f'- Decoded operand references: {len(all_rows)}',
           f'- Direct calls with absolute target: {sum(calls.values())}',
           '', '## Frequent direct call targets','', '| Address | Direct calls |', '|---|---:|']
    for key,n in calls.most_common(40):lines.append(f'| `{key}` | {n} |')
    lines += ['','## Frequent `$0400-$06FF` RAM operands','','| RAM address | References |','|---|---:|']
    for key,n in actor.most_common(50):lines.append(f'| `{key}` | {n} |')
    lines += ['','## Hardware and mapper operands','','| Address | References |','|---|---:|']
    for key,n in hw.most_common(35):lines.append(f'| `{key}` | {n} |')
    (out_dir/'XREFS.md').write_text('\n'.join(lines)+'\n',encoding='utf8')
    return len(all_rows)


if __name__=='__main__':
    cli=argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--source-dir',type=Path,default=ROOT/'analysis/exploratory_source')
    cli.add_argument('--out',type=Path,default=ROOT/'analysis')
    args=cli.parse_args()
    print('Created',generate(args.source_dir,args.out),'cross references')
