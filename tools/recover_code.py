#!/usr/bin/env python3
"""Incremental bank-aware 6502 source recovery for TMNT NES (USA).

Produces *exploratory* assembly with conservative existing instruction starts
preserved, and additional hypotheses suggested by local absolute calls / jumps.
Byte-perfect recompilation is necessary but DOES NOT prove guessed code is code.
An optional emulator execute log supplies executed instruction roots; when the
log includes the active physical PRG bank it avoids mapper ambiguity.

Trace CSV expected: bank,pc  (bank 0-7, pc like 0x8101 or $C3A3).
The mapper's active PRG bank is required for $8000-$BFFF entries. For $C000+
use bank 7 when MMC1 is in the usual fixed-last-bank mode.
"""
import argparse
import csv
import json
import re
import sys
from collections import Counter, defaultdict, deque
from pathlib import Path

from cpu6502 import DECODE, SIZE
from disasm6502 import trace, source_for_bank
from asm6502 import assemble

ROOT = Path(__file__).resolve().parents[1]
BASELINE = ROOT / 'asm' / 'prg'
PRIMARY_BASENAME = 'Teenage Mutant Ninja Turtles (USA).nes'
HEX_PC_RE = re.compile(r'; \$([0-9A-Fa-f]{4})\s+[0-9A-Fa-f]{2}(?:\s|$)')


def parse_number(x):
    x = str(x).strip()
    return int(x[1:], 16) if x.startswith('$') else int(x, 0)


def read_banks(rom):
    raw = rom.read_bytes()
    if len(raw) != 262160 or raw[:4] != b'NES\x1a' or raw[4] != 8 or raw[5] != 16:
        raise ValueError('Expected TMNT 1989 8 PRG bank / 16 CHR bank NES ROM')
    return [raw[16+i*0x4000:16+(i+1)*0x4000] for i in range(8)]


def existing_instructions(bank_index, source_dir=BASELINE):
    """Existing disassembly's explicit instructions are locked in as roots."""
    return {int(m.group(1), 16) for m in HEX_PC_RE.finditer((source_dir / f'bank{bank_index:02d}.asm').read_text())}


def read_exec_roots(paths):
    result = defaultdict(set)
    errors = []
    for p in paths:
        with Path(p).open(newline='') as handle:
            reader = csv.DictReader(handle)
            if reader.fieldnames is None or not {'bank','pc'}.issubset(set(reader.fieldnames)):
                raise ValueError(f'{p} needs columns bank,pc')
            for line, row in enumerate(reader, 2):
                try:
                    bank, pc = parse_number(row['bank']), parse_number(row['pc'])
                    base = 0xC000 if bank == 7 else 0x8000
                    if not 0<=bank<8 or not base<=pc<base+0x4000:
                        raise ValueError('wrong bank or unmappable PC')
                    result[bank].add(pc)
                except (ValueError,TypeError) as e:
                    errors.append(f'{p}:{line}: {e}')
    if errors:
        raise ValueError('\n'.join(errors[:12]))
    return result


def straight_line_probe(data, address, base):
    """Score only a short contiguous basic-block-like sequence.

    This is a heuristic, not proof: jump tables/data can resemble CPU code.
    """
    pc=address
    uses=Counter()
    ending='INVALID'
    while base<=pc<base+0x4000 and pc-address<=256:
        o=pc-base
        opcode=data[o]
        if opcode not in DECODE:
            break
        name,mode=DECODE[opcode]
        size=SIZE[mode]
        if o+size>0x4000:
            break
        uses['bytes']+=size
        uses['instructions']+=1
        if name in ('BNE','BEQ','BPL','BMI','BCC','BCS','BVC','BVS'):
            uses['branches']+=1
        if name in ('JSR',):uses['calls']+=1
        if name in ('LDA','LDX','LDY'):uses['loads']+=1
        if name in ('STA','STX','STY'):uses['stores']+=1
        pc+=size
        if name in ('RTS','RTI','JMP','BRK'):
            ending=name
            break
    return uses,ending


def guess_roots(bank, index, minimum=20):
    """Consider JMP/JSR operand references within the SAME physical PRG bank.

    We do not use fixed bank calls as switchable bank roots, since the mapping
    isn't necessarily known at call time. Candidates are speculative.
    """
    base=0xC000 if index==7 else 0x8000
    refs=Counter()
    for p in range(1,0x3FFD):
        if bank[p] not in (0x20,0x4C):
            continue
        a = bank[p+1] | (bank[p+2]<<8)
        if base<=a<base+0x4000:
            refs[a]+=1
    ranked=[]
    for a,nrefs in refs.items():
        score,ending=straight_line_probe(bank,a,base)
        if (score['bytes'] >= minimum and
            score['branches']+score['calls']>=1 and
            score['loads']+score['stores']>=1 and
            ending in ('JMP','RTS','RTI')):
            ranked.append((a,nrefs,score,ending))
    # More xrefs + longer sequences come first. Baseline and executed roots
    # always take priority in the global trace.
    return sorted(ranked,key=lambda r:(-r[1],-r[2]['bytes'],r[0]))


def merge_disassembly(bank, base, baseline, dynamic, hypotheses, data_ranges=()):
    """Lock existing instructions, extend only into previously raw bytes.

    The previously disassembled instructions are protected against speculative
    roots that might otherwise start in their operand bytes or bridge gaps.
    """
    instructions={}
    occupied=set()
    targets=set()
    foreign=set()
    # Inline jump tables can follow JSR dispatch routines. Without a
    # data barrier, linear disassembly would treat pointer bytes as opcodes.
    known_data=set()
    for start, length in data_ranges:
        if not base<=start<base+len(bank) or length<=0 or start+length>base+len(bank):
            raise ValueError(f'bad data range ${start:04X} ({length} bytes)')
        known_data.update(range(start,start+length))
    def decode(pc):
        off=pc-base
        if not 0<=off<len(bank) or bank[off] not in DECODE:
            return None
        name,mode=DECODE[bank[off]]
        n=SIZE[mode]
        if off+n>len(bank) or any(q in known_data for q in range(pc,pc+n)):return None
        raw=bank[off:off+n]
        imm=(raw[1] if n==2 else raw[1]|(raw[2]<<8)) if n>1 else None
        target=None
        if mode=='rel':
            target=(pc+2+(raw[1] if raw[1]<128 else raw[1]-256))&65535
        elif name in ('JMP','JSR') and mode=='abs':
            target=imm
        return name,mode,imm,n,target
    for pc in sorted(baseline):
        entry=decode(pc)
        if entry is None:raise ValueError(f'old instruction cannot decode ${pc:04X}')
        indexes=range(pc-base,pc-base+entry[3])
        if any(n in occupied for n in indexes):
            raise ValueError(f'overlapping baseline instruction ${pc:04X}')
        occupied.update(indexes)
        instructions[pc]=entry
    # Only entry points already recovered and new entry roots are considered.
    # All old branch/call targets should have named labels when decoded.
    for pc, (name,mode,imm,n,target) in instructions.items():
        if target is not None and target in baseline:
            targets.add(target)
    queue=deque([(a,'observed') for a in sorted(dynamic)] +
                [(a,'candidate') for a in hypotheses if a not in baseline and a not in dynamic])
    processed=set()
    candidate_accepted=set()
    while queue:
        pc,reason=queue.popleft()
        if pc in processed:continue
        processed.add(pc)
        begin=pc
        while base<=pc<base+len(bank):
            if pc in instructions:
                if pc==begin and reason=='observed':targets.add(pc)
                break
            entry=decode(pc)
            if entry is None:break
            name,mode,imm,n,target=entry
            indexes=range(pc-base,pc-base+n)
            if any(z in occupied for z in indexes):break
            instructions[pc]=entry
            occupied.update(indexes)
            if pc==begin:
                candidate_accepted.add(pc)
                targets.add(pc)
            if target is not None:
                if mode=='rel':
                    if base<=target<base+len(bank):queue.append((target,'branch'))
                elif name in ('JSR','JMP') and mode=='abs':
                    if base<=target<base+len(bank):queue.append((target,'call'))
                    else:foreign.add((pc,target,name))
            if name in ('RTS','RTI','BRK','JMP'):break
            pc+=n
    # Cross-references to any decoded addresses become assembler labels.
    for pc,(name,mode,imm,n,target) in instructions.items():
        if target in instructions and (mode=='rel' or (name in ('JSR','JMP') and mode=='abs')):
            targets.add(target)
    return instructions,targets,foreign,candidate_accepted


def run(rom, out_dir, trace_paths=(), include_hypotheses=True, minimum=20):
    banks=read_banks(rom)
    dynamic=read_exec_roots(trace_paths)
    out_dir.mkdir(parents=True,exist_ok=True)
    reports=[]
    candidates=[]
    for i, bank in enumerate(banks):
        base=0xC000 if i==7 else 0x8000
        baseline=existing_instructions(i)
        guessed=guess_roots(bank,i,minimum) if include_hypotheses else []
        roots=sorted(baseline|dynamic[i]) + [a for a,_,_,_ in guessed if a not in baseline and a not in dynamic[i]]
        instructions,targets,foreign,accepted=merge_disassembly(bank,base,baseline,dynamic[i],
                [a for a,_,_,_ in guessed])
        # All of the old trusted instruction starts must survive any promotion.
        missing=baseline-set(instructions)
        if missing:
            raise ValueError(f'bank {i}: lost {len(missing)} existing instruction roots: {sorted(missing)[:6]}')
        pointer_tables={0x8001:('BANK01_DATA_POINTERS',52)} if i==1 else (
            {0x8001:('BANK02_SCRIPT_POINTERS',100)} if i==2 else {})
        asm=source_for_bank(i,bank,base,instructions,targets,pointer_tables=pointer_tables)
        asm=asm.replace('Auto-discovered reachable instructions and literal raw data.',
                        'Experimental static recovery + existing entry points; byte-exact, NOT fully validated.')
        out=(out_dir/f'bank{i:02d}.asm')
        out.write_text(asm,encoding='utf8')
        rebuilt=assemble(asm,base)
        if rebuilt!=bank:
            delta=next(idx for idx,(a,b) in enumerate(zip(rebuilt,bank)) if a!=b)
            raise ValueError(f'bank {i}: source is not binary exact at offset {delta:#x}')
        bytes_code=sum(item[3] for item in instructions.values())
        reports.append(dict(bank=i,base=f'${base:04X}',instructions=len(instructions),
                            decoded_bytes=bytes_code,total_bytes=16384,
                            percent=round(bytes_code/16384*100,2),
                            preserved_original_instruction_starts=len(baseline),
                            execution_trace_pc_count=len(dynamic[i]),
                            tentative_roots=len(guessed),
                            accepted_new_roots=len(accepted),
                            external_xrefs=len(foreign)))
        for a,nrefs,score,ending in guessed:
            candidates.append(dict(bank=i,cpu_address=f'${a:04X}',xrefs=nrefs,
                                   linear_bytes=score['bytes'],branches=score['branches'],
                                   jsr=score['calls'],loads=score['loads'],stores=score['stores'],
                                   ending=ending,
                                   classified_as_instruction=a in instructions,
                                   observed_execution=a in dynamic[i]))
    with (out_dir/'candidate_entries.csv').open('w',newline='') as handle:
        writer=csv.DictWriter(handle,fieldnames=['bank','cpu_address','xrefs','linear_bytes','branches',
                                                 'jsr','loads','stores','ending','classified_as_instruction',
                                                 'observed_execution'])
        writer.writeheader()
        writer.writerows(candidates)
    report={'input_sha256':__import__('hashlib').sha256(rom.read_bytes()).hexdigest(),
            'method':'exploratory absolute-target pattern heuristic; not execution proof',
            'trace_sources':[str(p) for p in trace_paths],
            'total_decoded_bytes':sum(r['decoded_bytes'] for r in reports),
            'total_prg_bytes':131072,
            'total_decoded_percent':round(100*sum(r['decoded_bytes'] for r in reports)/131072,2),
            'banks':reports}
    (out_dir/'coverage.json').write_text(json.dumps(report,indent=2)+'\n')
    return report


def main():
    cli=argparse.ArgumentParser(description=__doc__)
    cli.add_argument('rom',type=Path,help='Uploaded user-owned TMNT NES USA ROM')
    cli.add_argument('--out',type=Path,default=ROOT/'analysis'/'exploratory_source')
    cli.add_argument('--trace',type=Path,action='append',default=[],help='emulator execute CSV: bank,pc')
    cli.add_argument('--no-heuristics',action='store_true')
    cli.add_argument('--min-basic-block-bytes',type=int,default=20)
    args=cli.parse_args()
    report=run(args.rom,args.out,args.trace,not args.no_heuristics,args.min_basic_block_bytes)
    for r in report['banks']:
        print(f"bank {r['bank']}: decoded {r['decoded_bytes']:5d}/16384 ({r['percent']:5.1f}%), "
              f"tentative local roots {r['tentative_roots']}")
    print(f"TOTAL: {report['total_decoded_bytes']} / 131072 ({report['total_decoded_percent']}%)")
    print('WARNING: hypothesis classification is not validated gameplay execution!')


if __name__=='__main__':main()
