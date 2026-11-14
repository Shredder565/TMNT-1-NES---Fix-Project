#!/usr/bin/env python3
"""Compare two equal-size NES ROMs; report changed banks and emit IPS patch.

python tools/rom_diff.py ORIGINAL.nes MODIFIED.nes --ips mod.ips --csv changes.csv
The user must already possess the original ROM to apply an IPS file.
"""
import argparse
import csv
from pathlib import Path

ROM_BYTES=262160
CHR_START=0x20010


def offset_detail(offset):
    if offset<16:return 'header',-1,offset,''
    if offset<CHR_START:
        n=offset-16
        bank,pos=divmod(n,0x4000)
        cpu=(0xC000 if bank==7 else 0x8000)+pos
        return 'prg',bank,pos,f'CPU ${cpu:04X}'
    bank,pos=divmod(offset-CHR_START,0x2000)
    return 'chr',bank,pos,f'tile {pos//16}, byte {pos%16}'


def changed_runs(original,modified):
    if len(original)!=len(modified) or len(original)!=ROM_BYTES:
        raise ValueError('Expected two 262160-byte NES ROMs')
    i=0
    while i<len(original):
        if original[i]==modified[i]:
            i+=1
            continue
        start=i
        while i<len(original) and original[i]!=modified[i] and i-start<65535:
            i+=1
        yield start,original[start:i],modified[start:i]


def make_ips(original,modified):
    output=bytearray(b'PATCH')
    for offset,old,new in changed_runs(original,modified):
        output+=offset.to_bytes(3,'big')+len(new).to_bytes(2,'big')+new
    return bytes(output)+b'EOF'


def apply_ips(original,patch):
    if not patch.startswith(b'PATCH'):raise ValueError('Not IPS')
    out=bytearray(original)
    pc=5
    while patch[pc:pc+3]!=b'EOF':
        offset=int.from_bytes(patch[pc:pc+3],'big')
        size=int.from_bytes(patch[pc+3:pc+5],'big')
        pc+=5
        if size==0:
            run_length=int.from_bytes(patch[pc:pc+2],'big')
            data=bytes([patch[pc+2]])*run_length
            pc+=3
        else:
            data=patch[pc:pc+size]
            pc+=size
        if offset+len(data)>len(out):raise ValueError('IPS patch exceeds ROM size')
        out[offset:offset+len(data)]=data
    return bytes(out)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original',type=Path)
    parser.add_argument('modified',type=Path)
    parser.add_argument('--ips',type=Path,help='Write portable IPS patch')
    parser.add_argument('--csv',type=Path,help='Write byte-by-byte bank map of changes')
    args=parser.parse_args()
    old,new=args.original.read_bytes(),args.modified.read_bytes()
    runs=list(changed_runs(old,new))
    count=sum(len(c) for _,_,c in runs)
    print(f'{count} changed byte(s), {len(runs)} edit region(s)')
    for offset,prior,after in runs[:25]:
        region,bank,pos,description=offset_detail(offset)
        print(f'  ROM +{offset:06X}  {region} bank {bank}  +{pos:04X} {description}: '
              f'{prior[:16].hex(" ")} -> {after[:16].hex(" ")}')
    if args.csv:
        args.csv.parent.mkdir(parents=True,exist_ok=True)
        with args.csv.open('w',newline='') as f:
            writer=csv.writer(f)
            writer.writerow(['rom_offset_hex','region','bank','bank_offset_hex','mapped_details','before','after'])
            for offset,prior,after in runs:
                for i,(a,b) in enumerate(zip(prior,after)):
                    region,bank,pos,detail=offset_detail(offset+i)
                    writer.writerow([f'{offset+i:06X}',region,bank,f'{pos:04X}',detail,f'{a:02X}',f'{b:02X}'])
        print('Wrote',args.csv)
    if args.ips:
        args.ips.parent.mkdir(parents=True,exist_ok=True)
        patch=make_ips(old,new)
        if apply_ips(old,patch)!=new:raise RuntimeError('Self-verification of IPS file failed')
        args.ips.write_bytes(patch)
        print('Wrote',args.ips)


if __name__=='__main__':main()
