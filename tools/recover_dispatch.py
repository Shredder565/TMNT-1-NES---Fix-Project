#!/usr/bin/env python3
"""Recover fixed-bank code reachable via documented inline JSR $C702 tables.

These are static dispatch-pointer *hypotheses*, not emulator-observed PCs.
Only entries inside fixed PRG bank 7 are recursively decoded; calls into
switchable $8000-$BFFF cannot be safely assigned to a physical bank without
an MMC1 execution trace. Byte-for-byte roundtrip is mandatory.
"""
import argparse
import json
import shutil
from pathlib import Path
from asm6502 import assemble
from disasm6502 import source_for_bank
from recover_code import BASELINE, read_banks, existing_instructions, merge_disassembly

# Locations established from the instruction sequence
#  JSR $C702; .word handler0, handler1, ...
# at C555, C566, CB23, D20C and D9C6.
TABLES = {
    0xC558: ('FRAME_STATE_HANDLERS', 6),
    0xC569: ('FRAME_SUBSTATE_HANDLERS', 4),
    0xCB26: ('GAME_MODE_HANDLERS', 12),
    0xD20F: ('SWITCHABLE_BANK_HANDLERS', 6),
    0xD9C9: ('MOVEMENT_STATE_HANDLERS', 4),
}
ANNOTATIONS={
    0xC001: 'OAM_SPRITE_BUILDER',
    0xC10A: 'OAM_SPRITE_TILE_RENDER',
    0xC26C: 'VBLANK_PPU_TRANSFER',
    0xC3A3: 'NMI_PER_FRAME_DRIVER',
    0xC551: 'FRAME_STATE_DISPATCH',
    0xC702: 'INLINE_TABLE_DISPATCH_HELPER',
}


def recover(rom, destination):
    banks=read_banks(Path(rom))
    bank=banks[7]
    dest=Path(destination)
    dest.mkdir(parents=True, exist_ok=True)
    for i in range(7):
        shutil.copy2(BASELINE/f'bank{i:02d}.asm',dest/f'bank{i:02d}.asm')
    roots=[]
    pointer_list=[]
    for cpu,(name,count) in TABLES.items():
        entries=[]
        for j in range(count):
            raw=bank[cpu-0xC000+j*2:cpu-0xC000+j*2+2]
            target=int.from_bytes(raw,'little')
            entries.append(target)
            if 0xC000<=target<=0xFFFF:
                roots.append(target)
        pointer_list.append({'cpu_address':f'${cpu:04X}','name':name,
                             'targets':[f'${t:04X}' for t in entries],
                             'note':'CPU bank for $8000-$BFFF targets is unknown until traced'})
    reserved=[(start,2*count) for start,(_,count) in TABLES.items()]
    instructions,targets,foreign,accepted=merge_disassembly(
        bank,0xC000,existing_instructions(7),set(),roots,data_ranges=reserved)
    result=source_for_bank(7,bank,0xC000,instructions,targets,pointer_tables=TABLES)
    result=result.replace('Auto-discovered reachable instructions and literal raw data.',
                          'Static dispatch-assisted recovery; new roots are NOT execution-traced.')
    for cpu,label in ANNOTATIONS.items():
        lines=result.splitlines(keepends=True)
        # Only place named alias on an instruction or existing label boundary.
        for k,line in enumerate(lines):
            if line.startswith(f'B07_{cpu:04X}:'):
                lines.insert(k,label+':\n')
                break
        result=''.join(lines)
    if assemble(result,0xC000)!=bank:
        raise AssertionError('static dispatch source no longer matches exact original bank')
    (dest/'bank07.asm').write_text(result, encoding='utf8')
    report={'methods':'static inline jump tables + guarded recursive disassembly',
            'observed_in_runtime':False,
            'fixed_bank_code_bytes':sum(row[3] for row in instructions.values()),
            'fixed_bank_instruction_count':len(instructions),
            'new_dispatch_root_count':len(set(roots)),
            'new_root_accepted_count':len(accepted),
            'baseline_instruction_count':len(existing_instructions(7)),
            'tables':pointer_list,'foreign_jumps':len(foreign)}
    (dest.parent/'dispatch_report.json').write_text(json.dumps(report,indent=2)+'\n')
    return report


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('rom',type=Path)
    ap.add_argument('--out',type=Path,default=Path('analysis/dispatch_source'))
    args=ap.parse_args()
    print(json.dumps(recover(args.rom,args.out),indent=2))

if __name__=='__main__':main()
