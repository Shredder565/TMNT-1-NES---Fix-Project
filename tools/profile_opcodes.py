#!/usr/bin/env python3
"""Analyze bank-aware per-instruction emulator CPU traces for hot addresses.

CSV columns: bank,pc,cycles (optional frame).
cycles is the *actual cost* of one executed instruction including addressing
mode and branch penalties. Do NOT supply one static nominal count per opcode.
Include PPU DMA / DMC stalls as bank/pc empty and positive cycles to account
for CPU time, or their cost will be omitted. $8000-$BFFF bank must be actual
MMC1 physical 16K bank active *at execution*. RAM-executed code can use
bank=-1. This tool does not assert an emulator time budget by itself.
"""
import argparse
import csv
import json
from collections import defaultdict
from pathlib import Path


def number(raw):
    v=str(raw).strip()
    return int(v[1:],16) if v.startswith('$') else int(v,0)


def analyze(file,top=30):
    totals=defaultdict(lambda:[0,0])
    stalls=rows=cycles=0
    with Path(file).open(newline='',encoding='utf-8-sig') as h:
        r=csv.DictReader(h)
        if not {'bank','pc','cycles'}.issubset(r.fieldnames or []):
            raise ValueError('trace must contain bank,pc,cycles')
        for n,line in enumerate(r,2):
            try:
                cost=number(line['cycles'])
                if not 1<=cost<=100000:raise ValueError('invalid cycles')
                rawbank=line['bank'].strip()
                rawpc=line['pc'].strip()
                if not rawbank and not rawpc:
                    stalls+=cost
                else:
                    bank,pc=number(rawbank),number(rawpc)
                    if not -1<=bank<=7 or not 0<=pc<=65535:
                        raise ValueError('out-of-range PC or bank')
                    if bank>=0 and not (0x8000<=pc<0xc000 if bank<7 else 0xc000<=pc<=0xffff):
                        raise ValueError('PC not in expected physical bank window')
                    totals[(bank,pc)][0]+=1
                    totals[(bank,pc)][1]+=cost
                cycles+=cost
                rows+=1
            except (ValueError,TypeError,AttributeError) as e:
                raise ValueError(f'{file}:{n}: {e}') from e
    if not rows:raise ValueError('empty instruction trace')
    ranked=sorted(totals.items(),key=lambda p:-p[1][1])
    return {'file':str(file),'total_traced_events':rows,'total_cpu_cycles_charged':cycles,
            'cpu_cycles_from_stalls':stalls,'unique_bank_pc_opcodes':len(totals),
            'top_addresses':[{'bank':bank,'pc':f'${pc:04X}',
                              'executions':freq,'cpu_cycles':cost,
                              'percent_total':round(cost*100/cycles,3)}
                             for (bank,pc),(freq,cost) in ranked[:top]],
            'limitations':'No emulator trace is included. Instruction hot spots are not the same as per-frame deadline overruns. Never confuse this profiling summary with gameplay validation.'}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('csv',type=Path)
    p.add_argument('--top',type=int,default=30)
    p.add_argument('--json',type=Path)
    a=p.parse_args()
    if a.top<=0:raise ValueError('--top must be positive')
    result=json.dumps(analyze(a.csv,a.top),indent=2)
    print(result)
    if a.json:a.json.write_text(result+'\n')

if __name__=='__main__':main()
