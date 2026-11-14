#!/usr/bin/env python3
"""Small strict two-pass bank assembler for the generated editable TMNT source.

Supported: labels, .org, .byte, .word, all official 6502 mnemonics.
The bank layout is fixed, so edits must not change the total bytes or move
code to addresses with existing data until a relocation/linker stage is added.
"""
import argparse
import re
from pathlib import Path
from cpu6502 import OPS, SIZE, BRANCHES

HEX = re.compile(r'^\$([0-9A-Fa-f]+)$')
NAME = re.compile(r'^[A-Za-z_][A-Za-z_0-9]*$')


def value(atom, labels):
    atom = atom.strip()
    if atom in labels:
        return labels[atom]
    if atom.startswith('$'):
        return int(atom[1:], 16)
    if atom.startswith('%'):
        return int(atom[1:], 2)
    if atom.isdecimal():
        return int(atom)
    if atom.startswith('<'):
        return value(atom[1:],labels) & 0xFF
    if atom.startswith('>'):
        return (value(atom[1:],labels) >> 8) & 0xFF
    raise ValueError(f'Unknown symbol/expression: {atom}')


def operand_mode(name, raw):
    raw=raw.strip()
    if name in BRANCHES: return 'rel',raw
    if not raw: return 'imp',''
    if raw.upper()=='A':return 'acc',''
    if raw.startswith('#'): return 'imm',raw[1:]
    m=re.fullmatch(r'\(\s*(.*?)\s*,\s*X\s*\)',raw,re.I)
    if m:return 'indx',m.group(1)
    m=re.fullmatch(r'\(\s*(.*?)\s*\)\s*,\s*Y',raw,re.I)
    if m:return 'indy',m.group(1)
    m=re.fullmatch(r'\(\s*(.*?)\s*\)',raw,re.I)
    if m:return 'ind',m.group(1)
    m=re.fullmatch(r'(.*?),\s*([XY])',raw,re.I)
    if m:
        expr,idx=m.group(1).strip(),m.group(2).lower()
        digits=HEX.fullmatch(expr)
        zero = bool(digits and len(digits.group(1))<=2)
        return (('zp' if zero else 'abs')+idx),expr
    digits=HEX.fullmatch(raw)
    zero = bool(digits and len(digits.group(1))<=2)
    return ('zp' if zero else 'abs'), raw


def parse(source):
    program=[]
    for n,line in enumerate(source.splitlines(),1):
        line=line.split(';',1)[0].strip()
        if not line:continue
        if line.endswith(':'):
            label=line[:-1]
            if not NAME.fullmatch(label):raise ValueError(f'line {n}: bad label {label}')
            program.append((n,'label',label,''));continue
        parts=line.split(None,1)
        key=parts[0].upper()
        arg=parts[1].strip() if len(parts)>1 else ''
        if key not in ('.ORG','.BYTE','.WORD') and key not in OPS:
            raise ValueError(f'line {n}: unsupported instruction/directive {key}')
        program.append((n,key,arg,''))
    return program


def assemble(source, base, expected_size=0x4000):
    program=parse(source)
    labels={}
    pc=base
    for n,key,arg,_ in program:
        try:
            if key=='label':
                if arg in labels: raise ValueError(f'duplicate label {arg}')
                labels[arg]=pc
            elif key=='.ORG': pc=value(arg,labels)
            elif key=='.BYTE':pc+=len([p for p in arg.split(',') if p.strip()])
            elif key=='.WORD':pc+=2*len([p for p in arg.split(',') if p.strip()])
            else:
                mode,expr=operand_mode(key,arg)
                if mode not in OPS[key]:raise ValueError(f'{key} does not support addressing {mode}')
                pc+=SIZE[mode]
        except Exception as exc:raise ValueError(f'line {n}: {exc}') from exc
    out=bytearray(expected_size)
    covered=bytearray(expected_size)
    pc=base

    def emit(n, payload):
        nonlocal pc
        lo=pc-base
        hi=lo+len(payload)
        if lo<0 or hi>expected_size:
            raise ValueError(f'line {n}: out of range ${pc:04X}')
        if any(covered[lo:hi]):
            raise ValueError(f'line {n}: overlapping writes at ${pc:04X}')
        out[lo:hi]=payload
        covered[lo:hi]=b'\x01'*len(payload)
        pc+=len(payload)

    for n,key,arg,_ in program:
        try:
            if key=='label':continue
            if key=='.ORG':
                pc=value(arg,labels)
                continue
            if key=='.BYTE':
                vals=[value(p,labels) for p in arg.split(',') if p.strip()]
                if any(v<0 or v>255 for v in vals):raise ValueError('.byte value out of range')
                emit(n,bytes(vals));continue
            if key=='.WORD':
                vals=[value(p,labels) for p in arg.split(',') if p.strip()]
                if any(v<0 or v>65535 for v in vals):raise ValueError('.word value out of range')
                emit(n,b''.join(v.to_bytes(2,'little') for v in vals));continue
            mode,expr=operand_mode(key,arg)
            if mode not in OPS[key]:raise ValueError(f'invalid mode {mode}')
            opcode=OPS[key][mode]
            v=value(expr,labels) if expr else None
            if mode=='rel':
                rel=v-(pc+2)
                if not -128<=rel<=127:raise ValueError(f'branch target out of range: {expr} at ${pc:04X}')
                payload=bytes([opcode,rel&255])
            elif SIZE[mode]==1:payload=bytes([opcode])
            elif SIZE[mode]==2:
                if not 0<=v<=255:raise ValueError(f'one byte operand out of range: {expr}')
                payload=bytes([opcode,v])
            else:
                if not 0<=v<=65535:raise ValueError('address out of range')
                payload=bytes([opcode,v&255,v>>8])
            emit(n,payload)
        except Exception as exc:raise ValueError(f'line {n}: {exc}') from exc
    if not all(covered):
        missing=covered.index(0)
        raise ValueError(f'bank contains unwritten bytes, first at ${base+missing:04X}')
    return bytes(out)

if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('source',type=Path)
    parser.add_argument('output',type=Path)
    parser.add_argument('--base',default='0x8000')
    args=parser.parse_args()
    args.output.write_bytes(assemble(args.source.read_text(),int(args.base,0)))
