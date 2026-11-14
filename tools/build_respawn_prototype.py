#!/usr/bin/env python3
"""Optional, UNTESTED stronger-enemy no-respawn prototype for TMNT (NES/USA).

This is experimental PRG-RAM instrumentation, NOT gameplay-validated or a
finished fix. Enable only in an emulator with mapper-1 8KB PRG-RAM support.
Never overwrite the validated Leonardo-only ROM.
"""
import hashlib
import json
import shutil
from pathlib import Path
from asm6502 import assemble, parse, operand_mode
from cpu6502 import SIZE
from build import ROOT, build
from rom_diff import make_ips, apply_ips, changed_runs
from build_character_update import make as make_leo

CAVE_START=0xBD92
RESET_ENTRY=0xBFD8
CAVE_LENGTH=RESET_ENTRY-CAVE_START
PROFILE='leonardo_strong_enemy_respawn_PROTOTYPE'

CAVE=r''' ; --- EXPERIMENTAL no-respawn hook begins at CPU $BD92 (PRG bank 6) ---
; MMC1 PRG-RAM: $6000..$607F slot identity and scratch; 256 exact-match
; killed-spawn records in six parallel pages at $6800..$6DFF.
; Each record key = level ($48), room ($5D), spawn list ($42/$43), spawn ($1A).
; Mark ONLY normal enemies with table starting HP >= $20; exclude bosses
; $70..$7F and timed-wave enemies ($0605!=0 in subareas).
RESPAWN_SPAWN_CHECK:
    TYA
    PHA                 ; original EED3 allocator Y must be restored
    LDA $5C
    BEQ RESPAWN_SPAWN_STATIC
    LDA $0605
    BNE RESPAWN_SPAWN_ALLOWED ; ignore timed waves
RESPAWN_SPAWN_STATIC:
    JSR RESPAWN_LOAD_CURRENT
    JSR RESPAWN_FIND
    BCS RESPAWN_SPAWN_DENIED
RESPAWN_SPAWN_ALLOWED:
    PLA
    TAY
    JSR $EED3           ; original allocator; carry is preserved by RTS
    RTS
RESPAWN_SPAWN_DENIED:
    PLA
    TAY
    SEC                 ; caller BCS=>RTS, nothing allocated
    RTS

RESPAWN_LOAD_CURRENT:
    LDA $48
    STA $6070
    LDA $5D
    STA $6071
    LDA $42
    STA $6072
    LDA $43
    STA $6073
    LDA $1A
    STA $6074
    RTS

RESPAWN_FIND:
    LDA $6070
    EOR $6071
    EOR $6072
    EOR $6073
    EOR $6074
    TAY
    STY $6075           ; first probe index for full-table detection
RESPAWN_FIND_LOOP:
    LDA $6D00,Y
    BEQ RESPAWN_FIND_MISS
    CMP #$A5
    BNE RESPAWN_FIND_NEXT
    LDA $6800,Y
    CMP $6070
    BNE RESPAWN_FIND_NEXT
    LDA $6900,Y
    CMP $6071
    BNE RESPAWN_FIND_NEXT
    LDA $6A00,Y
    CMP $6072
    BNE RESPAWN_FIND_NEXT
    LDA $6B00,Y
    CMP $6073
    BNE RESPAWN_FIND_NEXT
    LDA $6C00,Y
    CMP $6074
    BNE RESPAWN_FIND_NEXT
    SEC
    RTS
RESPAWN_FIND_NEXT:
    INY
    CPY $6075
    BNE RESPAWN_FIND_LOOP
RESPAWN_FIND_MISS:
    CLC
    RTS

RESPAWN_RECORD_ORIGIN:
    LDA #$00
    STA $6000,X         ; clear stale origin whenever an actor is allocated
    LDA $0560,X
    CMP #$20            ; strength threshold 32 initial HP
    BCC RESPAWN_RECORD_EXIT
    CMP #$FF            ; invulnerable entries are not ordinary enemies
    BEQ RESPAWN_RECORD_EXIT
    LDA $0440,X
    CMP #$70
    BCC RESPAWN_RECORD_NOT_BOSS
    CMP #$80
    BCC RESPAWN_RECORD_EXIT
RESPAWN_RECORD_NOT_BOSS:
    LDA $5C
    BEQ RESPAWN_RECORD_STATIC
    LDA $0605
    BNE RESPAWN_RECORD_EXIT
RESPAWN_RECORD_STATIC:
    LDA #$A5
    STA $6000,X
    LDA $48
    STA $6010,X
    LDA $5D
    STA $6020,X
    LDA $42
    STA $6030,X
    LDA $43
    STA $6040,X
    LDA $1A
    STA $6050,X
    LDA $0440,X
    STA $6060,X
RESPAWN_RECORD_EXIT:
    LDY #$C2            ; displaced instruction originally at $8298
    LDA $0480,X         ; displaced instruction originally at $829A
    JMP $829D           ; return to original BPL branch

RESPAWN_MARK_DEAD:
    LDA #$00
    STA $0560,X         ; two displaced instructions from $99AC
    LDA $6000,X
    CMP #$A5
    BNE RESPAWN_DEATH_EXIT
    LDA $0440,X
    CMP $6060,X
    BNE RESPAWN_DEATH_EXIT
    TYA
    PHA
    LDA $6010,X
    STA $6070
    LDA $6020,X
    STA $6071
    LDA $6030,X
    STA $6072
    LDA $6040,X
    STA $6073
    LDA $6050,X
    STA $6074
    JSR RESPAWN_FIND
    BCS RESPAWN_DEATH_RESTORE
    LDA $6D00,Y
    BNE RESPAWN_DEATH_RESTORE ; full table, don't overwrite existing record
    LDA $6070
    STA $6800,Y
    LDA $6071
    STA $6900,Y
    LDA $6072
    STA $6A00,Y
    LDA $6073
    STA $6B00,Y
    LDA $6074
    STA $6C00,Y
    LDA #$A5
    STA $6D00,Y         ; mark valid LAST for atomic record visibility
RESPAWN_DEATH_RESTORE:
    PLA
    TAY
RESPAWN_DEATH_EXIT:
    LDA #$00            ; original post-instruction A and Z/N (STA doesn't set flags)
    RTS
'''


def cave_size(cave=CAVE):
    pc=CAVE_START
    for line,key,arg,_ in parse(cave):
        if key=='label':continue
        if key=='.ORG': raise AssertionError('Cave source cannot relocate itself')
        if key=='.BYTE': pc+=len(arg.split(','))
        elif key=='.WORD':pc+=2*len(arg.split(','))
        else:
            mode,_=operand_mode(key,arg)
            pc+=SIZE[mode]
    return pc-CAVE_START


def source_for_prototype(original_source):
    src=original_source
    patches={
        '    JSR $EED3            ; $8162  20 D3 EE':
        '    JSR RESPAWN_SPAWN_CHECK ; $8162; original JSR $EED3 redirected to spawn guard',
        '    JSR $EED3            ; $8225  20 D3 EE':
        '    JSR RESPAWN_SPAWN_CHECK ; $8225; original JSR $EED3 redirected to spawn guard',
        '    JSR $EED3            ; $82C9  20 D3 EE':
        '    JSR RESPAWN_SPAWN_CHECK ; $82C9; third spawn-list allocator path, previously uncovered',
        '    LDY #$C2             ; $8298  A0 C2\n    LDA $0480,X          ; $829A  BD 80 04':
        '    JMP RESPAWN_RECORD_ORIGIN ; $8298; record actor origin and run displaced bytes\n'
        '    .byte $80, $04        ; $829B ; orphaned argument of displaced LDA; NOT executed',
        '    LDA #$00             ; $99AC  A9 00\n    STA $0560,X          ; $99AE  9D 60 05':
        '    JSR RESPAWN_MARK_DEAD ; $99AC; record death of a qualifying static enemy\n'
        '    .byte $EA, $EA        ; $99AF ; two NOPs preserve instruction address $99B1',
    }
    for old,new in patches.items():
        if src.count(old)!=1:
            raise AssertionError(f'Instruction hook guard failed: {old!r}')
        src=src.replace(old,new)
    # A dense $FF run is established as free code space. It must remain an
    # identical-length region and must not touch CPU $BFD8 or the vectors.
    lines=src.splitlines()
    start=next(i for i,s in enumerate(lines) if s.endswith('; $BD92') and s.lstrip().startswith('.byte $FF'))
    end=next(i for i,s in enumerate(lines) if s.endswith('; $BFD2') and s.lstrip().startswith('.byte $FF'))
    blob='\n'.join(lines[start:end+1])
    if len(blob.splitlines())!=37:
        raise AssertionError('Expected 36 full FF lines plus mixed reset-vector-entry line')
    for line in lines[start:end]:
        if '.byte '+', '.join(['$FF']*16) not in line:
            raise AssertionError('Cave contains non-FF data')
    if '$D8, $78, $EE, $FF, $FF, $4C, $10, $C3' not in lines[end]:
        raise AssertionError('Vanilla reset-vector trampoline differs')
    codelen=cave_size()
    if codelen>CAVE_LENGTH:
        raise AssertionError(f'No-respawn prototype cave needs {codelen} bytes, only {CAVE_LENGTH} free')
    pad=CAVE_LENGTH-codelen
    # The fixed-sized assembler checks that EVERY byte of bank 6 is written.
    padlines=['    .byte '+', '.join(['$FF']*min(16,pad-k))
              for k in range(0,pad,16)]
    replacement=CAVE+'\n'.join(padlines)+'\n'
    replacement+='    .byte $D8, $78, $EE, $FF, $FF, $4C, $10, $C3, $00, $00 ; $BFD8; original mirrored reset bytes\n'
    # Prior line starts at BFD2 and holds six $FF values; now all have been
    # included in cave padding, so no leading FFs at vector location.
    lines[start:end+1]=[replacement.rstrip('\n')]
    return '\n'.join(lines)+'\n', codelen


FIXED_RESET = r''' ; CPU $FED6-$FEFF, bank7 42 bytes formerly FF padding.
RESPAWN_RESET_FIXED:
    CLD
    SEI
    INC $FFFF            ; mapper shift reset before writing $6000 PRG-RAM
    LDX #$00
    LDA #$00
RESPAWN_FIXED_RESET_LOOP:
    STA $6D00,X
    STA $6000,X
    INX
    BNE RESPAWN_FIXED_RESET_LOOP
    JMP $C310
'''


def fixed_reset_source(old):
    lines=old.splitlines()
    start=next(i for i,s in enumerate(lines) if s.endswith('; $FED6') and s.lstrip().startswith('.byte $FF'))
    end=next(i for i,s in enumerate(lines) if s.endswith('; $FEF6') and s.lstrip().startswith('.byte $FF'))
    if end-start!=2:
        raise AssertionError('Expected 42 bytes of fixed-bank reset-hook padding')
    for line in lines[start:end]:
        if ', '.join(['$FF']*16) not in line:
            raise AssertionError('Unexpected fixed-bank cave content')
    if ', '.join(['$FF']*10) not in lines[end]:
        raise AssertionError('Unexpected final 10 bytes of fixed-bank cave')
    size=0
    for _,key,arg,_ in parse(FIXED_RESET):
        if key=='label':continue
        mode,_=operand_mode(key,arg)
        size+=SIZE[mode]
    if size>42:
        raise AssertionError(f'Fixed reset {size} bytes cannot fit in $FED6-$FEFF')
    pad=42-size
    replacement=FIXED_RESET+'\n'.join('    .byte '+', '.join(['$FF']*min(16,pad-k))
                                    for k in range(0,pad,16))
    replacement+='\n    .byte $AA, $AA, $AA, $AA, $AA, $AF ; $FF00 original data unchanged'
    lines[start:end+1]=[replacement]
    src='\n'.join(lines)+'\n'
    old_reset='\n'.join([
        'RESET_HANDLER:',
        '    CLD                  ; $FFD8  D8',
        '    SEI                  ; $FFD9  78',
        '    INC $FFFF            ; $FFDA  EE FF FF',
        '    JMP B07_C310         ; $FFDD  4C 10 C3'])
    new_reset='\n'.join([
        'RESET_HANDLER:',
        '    JMP RESPAWN_RESET_FIXED ; $FFD8; safe fixed-bank reset shim',
        '    .byte $FF, $FF       ; $FFDB; displaced operand bytes, not executed',
        '    JMP B07_C310         ; $FFDD; kept at original address, unexecuted'])
    if src.count(old_reset)!=1:raise AssertionError('Bank7 reset handler must be exact match')
    src=src.replace(old_reset,new_reset)
    return src,size


def make(root=ROOT):
    root=Path(root)
    vanilla=build(root)
    make_leo(root)
    base_src=root/'mods/leonardo_plus_lag_experiment/source'
    dest=root/'mods'/PROFILE/'source'
    dest.mkdir(parents=True,exist_ok=True)
    for i in range(8): shutil.copy2(base_src/f'bank{i:02d}.asm',dest/f'bank{i:02d}.asm')
    bank6=(dest/'bank06.asm').read_text(encoding='utf8')
    modified_src,bytes_used=source_for_prototype(bank6)
    (dest/'bank06.asm').write_text(modified_src,encoding='utf8')
    bank7=(dest/'bank07.asm').read_text(encoding='utf8')
    modified7,reset_bytes=fixed_reset_source(bank7)
    (dest/'bank07.asm').write_text(modified7,encoding='utf8')
    rom=build(root,source_dir=dest)
    assert len(rom)==len(vanilla)
    assert rom[:16]==vanilla[:16] and rom[0x20010:]==vanilla[0x20010:]
    # A vanilla ROM never contained code in the FF cave; no unrelated ROM
    # bytes may be affected except five intentional hook spots, the cave,
    # and the two established mods (Leo+sprite Y).
    allowed=[(0x19BDB,0x19BDD),
        (16+6*0x4000+0x162,16+6*0x4000+0x165),
        (16+6*0x4000+0x225,16+6*0x4000+0x228),
        (16+6*0x4000+0x2C9,16+6*0x4000+0x2CC),
        (16+6*0x4000+0x298,16+6*0x4000+0x29D),
        (16+6*0x4000+0x19AC,16+6*0x4000+0x19B1),
        (16+6*0x4000+0x3D92,16+6*0x4000+0x3FD8),
        (16+7*0x4000+0x114,16+7*0x4000+0x11A),
        (16+7*0x4000+0x3ED6,16+7*0x4000+0x3F00),
        (16+7*0x4000+0x3FD8,16+7*0x4000+0x3FDB)]
    unexpected=[i for i,(a,b) in enumerate(zip(vanilla,rom))
                if a!=b and not any(a<=i<b for a,b in allowed)]
    if unexpected:raise AssertionError(f'Unexpected changes outside cave/hooks: {unexpected[:20]}')
    out=root/'build/TMNT_Leo_Lag_NoRespawn_UNTESTED_PROTOTYPE.nes'
    out.write_bytes(rom)
    ips=root/'build/TMNT_Leo_Lag_NoRespawn_UNTESTED_PROTOTYPE.ips'
    data=make_ips(vanilla,rom)
    assert apply_ips(vanilla,data)==rom
    ips.write_bytes(data)
    report={
      'status':'UNTESTED PROTOTYPE; gameplay/PRG-RAM compatibility not validated',
      'rom':str(out.relative_to(root)),
      'ips':str(ips.relative_to(root)),
      'sha256':hashlib.sha256(rom).hexdigest(),
      'cave_cpu_start':f'${CAVE_START:04X}',
      'cave_cpu_end':f'${RESET_ENTRY-1:04X}',
      'injected_code_bytes':bytes_used,
      'fixed_bank_reset_code_bytes':reset_bytes,
      'cave_capacity_bytes':CAVE_LENGTH,
      'strong_enemy_definition':'static, nonboss enemy with initial HP >=32; waves excluded',
      'persistence':'up to 256 records in mapper-1 8KB PRG-RAM, cleared by bank7 fixed-vector RESET (not by selecting New Game)',
      'hooked_actor_allocator_calls':['$8162','$8225','$82C9'],
      'limitations':['Not run in any NES emulator','Assumes PRG-RAM at $6000 is writable','New Game without RESET keeps defeat history','Sources need execution trace auditing to verify all spawn paths','May mark spawn source stale when reused by an alternate actor allocator','Does not remove respawns from independent timed enemy waves'],
    }
    (root/'build/no_respawn_PROTOTYPE_report.json').write_text(json.dumps(report,indent=2)+'\n')
    return report

if __name__=='__main__':
    print(json.dumps(make(),indent=2))
