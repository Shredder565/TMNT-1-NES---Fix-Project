#!/usr/bin/env python3
"""Conservative bank-aware static disassembly for MMC1 PRG ROM.

Only byte ranges reached through explicit control-flow roots are translated to
instructions. Every other byte stays editable as .byte, never discarded.

This is a STARTING DISASSEMBLY and is not a full dynamic execution trace.
"""
import argparse
import csv
from collections import deque
from pathlib import Path
from cpu6502 import DECODE, SIZE, BRANCHES


def trace(bank, base, roots):
    instructions={}
    occupied=set()
    targets=set()
    outside=set()
    queue=deque((r,'entry') for r in roots)
    followed=set()
    while queue:
        pc,reason=queue.popleft()
        if not base<=pc<base+len(bank):continue
        if pc in followed:continue
        followed.add(pc)
        if reason in ('entry','branch','call','jump'): targets.add(pc)
        while base<=pc<base+len(bank):
            off=pc-base
            if pc in instructions:break
            if off in occupied:break
            op=bank[off]
            if op not in DECODE:break
            name,mode=DECODE[op]
            n=SIZE[mode]
            if off+n>len(bank) or any(i in occupied for i in range(off,off+n)):break
            raw=bank[off:off+n]
            imm = (raw[1] if n==2 else raw[1]|(raw[2]<<8)) if n>1 else None
            target=None
            if mode=='rel':
                delta=raw[1] if raw[1]<128 else raw[1]-256
                target=(pc+2+delta)&0xFFFF
                queue.append((target,'branch'))
            elif name in ('JSR','JMP') and mode=='abs':
                target=imm
                if base<=target<base+len(bank):queue.append((target,'call' if name=='JSR' else 'jump'))
                else:outside.add((pc,target,name))
            instructions[pc]=(name,mode,imm,n,target)
            occupied.update(range(off,off+n))
            if name in ('RTS','RTI','BRK') or (name=='JMP'):
                break
            pc+=n
    targets={t for t in targets if t in instructions}
    return instructions,targets,outside


def operand(name,mode,imm,pc,target,targets,bank_num):
    if mode=='imp':return ''
    if mode=='acc':return 'A'
    if mode=='imm':return f'#$%02X'%imm
    if mode=='rel':return f'B{bank_num:02d}_{target:04X}' if target in targets else f'${target:04X}'
    if mode=='ind':return f'(${imm:04X})'
    if mode in ('indx','indy'):
        return f'(${imm:02X},X)' if mode=='indx' else f'(${imm:02X}),Y'
    v=f'${imm:02X}' if mode.startswith('zp') else f'${imm:04X}'
    if mode=='abs' and name in ('JSR','JMP') and imm in targets:
        v=f'B{bank_num:02d}_{imm:04X}'
    if mode.endswith('x'):v+=',X'
    if mode.endswith('y'):v+=',Y'
    return v


def source_for_bank(bank_num,bank,base,instructions,targets,pointer_tables=None):
    lines=[f'; TMNT NES 1989, MMC1 PRG bank {bank_num:02d}',
           f'; CPU window ${base:04X}-${base+len(bank)-1:04X}; 16KB bank, fixed byte size.',
           '; Auto-discovered reachable instructions and literal raw data.',
           '; WARNING: statically discovered code is incomplete; data may contain code.',
           '; Edit operations/operands in place; preserve lengths for safe roundtrips.',
           f'.org ${base:04X}', '']
    pointer_tables=pointer_tables or {}
    pc=base
    while pc<base+len(bank):
        if bank_num==7 and pc in (0xC3A3,0xC412,0xFFD8):
            lines.append({0xC3A3:'NMI_HANDLER:',0xC412:'IRQ_HANDLER:',0xFFD8:'RESET_HANDLER:'}[pc])
        if pc in pointer_tables:
            name,words=pointer_tables[pc]
            if any(x in instructions for x in range(pc,pc+2*words)):
                raise ValueError(f'{name} overlaps known instruction')
            lines.append(f'{name}: ; fixed-length little-endian CPU data pointers')
            for j in range(0,words,8):
                part=[int.from_bytes(bank[pc-base+2*k:pc-base+2*k+2], 'little') for k in range(j,min(j+8,words))]
                lines.append('    .word '+', '.join(f'${val:04X}' for val in part)+f' ; ${pc+2*j:04X}')
            pc+=2*words
            continue
        if pc in targets:
            lines.append(f'B{bank_num:02d}_{pc:04X}:')
        if pc in instructions:
            name,mode,imm,n,target=instructions[pc]
            arg=operand(name,mode,imm,pc,target,targets,bank_num)
            lines.append(f'    {name:<3} {arg:<16} ; ${pc:04X}  {bank[pc-base:pc-base+n].hex(" ").upper()}')
            pc+=n
        else:
            end=pc+1
            while end<min(base+len(bank),pc+16) and end not in instructions and end not in targets and end not in pointer_tables:
                end+=1
            bs=bank[pc-base:end-base]
            lines.append('    .byte '+', '.join(f'${b:02X}' for b in bs)+f' ; ${pc:04X}')
            pc=end
    lines.append('')
    return '\n'.join(lines)


def generate(rom_path,out_dir):
    rom=rom_path.read_bytes()
    assert rom[:4]==b'NES\x1A' and rom[4]==8 and rom[5]==16 and (rom[6]>>4|rom[7]&0xf0)==1
    prg=rom[16:16+8*0x4000]
    banks=[prg[i*0x4000:(i+1)*0x4000] for i in range(8)]
    base7=0xC000
    vector_values=[int.from_bytes(banks[7][off:off+2],'little') for off in (0x3ffa,0x3ffc,0x3ffe)]
    assert all(0xC000<=v<=0xFFFF for v in vector_values)
    # Fixed-bank callers and switchable-bank callers inform each other.
    # Do not classify banks 1-4 as code purely because another bank calls an
    # address: their leading bytes are pointer/tile data, not routine prologues.
    fixed_roots=set(vector_values)
    switch_roots=set()
    for _ in range(12):
        code7,targ7,foreign7=trace(banks[7],base7,
                                    [vector_values[1],vector_values[0],vector_values[2]]+
                                    sorted(fixed_roots-set(vector_values)))
        discovered_switch={tgt for _,tgt,_ in foreign7 if 0x8000<=tgt<=0xBFFF}
        new_switch=switch_roots | discovered_switch
        discovered_fixed=set()
        for i in (0,5,6):
            roots=[0x8001]+sorted(new_switch-{0x8001})
            _code,_labels,outs=trace(banks[i],0x8000,roots)
            discovered_fixed.update(tgt for _,tgt,_ in outs if 0xC000<=tgt<=0xFFFF)
        new_fixed=fixed_roots | discovered_fixed
        if new_fixed==fixed_roots and new_switch==switch_roots: break
        fixed_roots,switch_roots=new_fixed,new_switch
    # Repeat final pass with converged roots.
    code7,targ7,foreign7=trace(banks[7],base7,
                                [vector_values[1],vector_values[0],vector_values[2]]+
                                sorted(fixed_roots-set(vector_values)))
    cross_refs=switch_roots
    reports=[]
    all_outside=[]
    out_dir.mkdir(parents=True,exist_ok=True)
    for i,bank in enumerate(banks):
        base=0xC000 if i==7 else 0x8000
        if i==7: code,targets,outs=code7,targ7,foreign7
        else:
            roots=([0x8001]+sorted(cross_refs-{0x8001})) if i in (0,5,6) else []
            code,targets,outs=trace(bank,base,roots)
        table={0x8001:('BANK01_DATA_POINTERS',52)} if i==1 else (
            {0x8001:('BANK02_SCRIPT_POINTERS',100)} if i==2 else {})
        (out_dir/f'bank{i:02d}.asm').write_text(source_for_bank(i,bank,base,code,targets,pointer_tables=table))
        bytes_code=sum(x[3] for x in code.values())
        reports.append((i,base,len(code),bytes_code,round(100*bytes_code/len(bank),1),len(targets),len(outs)))
        all_outside.extend((i,*x) for x in outs)
    return vector_values, cross_refs, reports, all_outside

if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('rom',type=Path)
    parser.add_argument('out',type=Path)
    args=parser.parse_args()
    print(generate(args.rom,args.out))
