; TMNT NES 1989, MMC1 PRG bank 07
; CPU window $C000-$FFFF; 16KB bank, fixed byte size.
; Static dispatch-assisted recovery; new roots are NOT execution-traced.
; WARNING: statically discovered code is incomplete; data may contain code.
; Edit operations/operands in place; preserve lengths for safe roundtrips.
.org $C000

    .byte $07 ; $C000
OAM_SPRITE_BUILDER:
B07_C001:
    LDA #$02             ; $C001  A9 02
    JSR B07_CEA7         ; $C003  20 A7 CE
    LDA #$40             ; $C006  A9 40
    STA $08              ; $C008  85 08
    LDA #$00             ; $C00A  A9 00
    STA $0B              ; $C00C  85 0B
    STA $0C              ; $C00E  85 0C
    LDA $35              ; $C010  A5 35
    BNE B07_C089         ; $C012  D0 75
    JSR B07_C190         ; $C014  20 90 C1
    LDA $34              ; $C017  A5 34
    CMP #$06             ; $C019  C9 06
    BNE B07_C022         ; $C01B  D0 05
    LDA $1E              ; $C01D  A5 1E
    LSR A                ; $C01F  4A
    BCS B07_C088         ; $C020  B0 66
B07_C022:
    LDA #$01             ; $C022  A9 01
    STA $0A              ; $C024  85 0A
    LDA #$00             ; $C026  A9 00
    STA $0D              ; $C028  85 0D
    JSR B07_C0C3         ; $C02A  20 C3 C0
    LDA #$40             ; $C02D  A9 40
    SEC                  ; $C02F  38
    SBC $08              ; $C030  E5 08
    ASL A                ; $C032  0A
    ASL A                ; $C033  0A
    STA $09              ; $C034  85 09
    LDA #$00             ; $C036  A9 00
    STA $0A              ; $C038  85 0A
    LDA $2D              ; $C03A  A5 2D
B07_C03C:
    CLC                  ; $C03C  18
    ADC #$3C             ; $C03D  69 3C
    CMP $09              ; $C03F  C5 09
    BCC B07_C03C         ; $C041  90 F9
    STA $2D              ; $C043  85 2D
    STA $0B              ; $C045  85 0B
    LDA #$0F             ; $C047  A9 0F
    STA $0C              ; $C049  85 0C
    LDA $1E              ; $C04B  A5 1E
    LSR A                ; $C04D  4A
    AND #$03             ; $C04E  29 03
    TAY                  ; $C050  A8
    LDA $C097,Y          ; $C051  B9 97 C0
    STA $0D              ; $C054  85 0D
B07_C056:
    JSR B07_C0C3         ; $C056  20 C3 C0
    LDA $08              ; $C059  A5 08
    BEQ B07_C088         ; $C05B  F0 2B
    INC $0D              ; $C05D  E6 0D
    LDA $0D              ; $C05F  A5 0D
    AND #$0F             ; $C061  29 0F
    STA $0D              ; $C063  85 0D
    BNE B07_C069         ; $C065  D0 02
    INC $0D              ; $C067  E6 0D
B07_C069:
    DEC $0C              ; $C069  C6 0C
    BNE B07_C056         ; $C06B  D0 E9
    JSR B07_C1C6         ; $C06D  20 C6 C1
    LDA $08              ; $C070  A5 08
    BEQ B07_C088         ; $C072  F0 14
    LDX $0B              ; $C074  A6 0B
B07_C076:
    LDA #$F4             ; $C076  A9 F4
    STA $0200,X          ; $C078  9D 00 02
    TXA                  ; $C07B  8A
    CLC                  ; $C07C  18
B07_C07D:
    ADC #$C4             ; $C07D  69 C4
    CMP $09              ; $C07F  C5 09
    BCC B07_C07D         ; $C081  90 FA
    TAX                  ; $C083  AA
    DEC $08              ; $C084  C6 08
    BNE B07_C076         ; $C086  D0 EE
B07_C088:
    RTS                  ; $C088  60
B07_C089:
    LDX #$00             ; $C089  A2 00
    LDA #$F4             ; $C08B  A9 F4
B07_C08D:
    STA $0200,X          ; $C08D  9D 00 02
    INX                  ; $C090  E8
    INX                  ; $C091  E8
    INX                  ; $C092  E8
    INX                  ; $C093  E8
    BNE B07_C08D         ; $C094  D0 F7
    RTS                  ; $C096  60
    .byte $00, $0C, $04, $08 ; $C097
B07_C09B:
    LDA $03E7            ; $C09B  AD E7 03
    BEQ B07_C0A5         ; $C09E  F0 05
    CPX $03E7            ; $C0A0  EC E7 03
    BEQ B07_C0A9         ; $C0A3  F0 04
B07_C0A5:
    CPX #$01             ; $C0A5  E0 01
    BNE B07_C0B6         ; $C0A7  D0 0D
B07_C0A9:
    LDA $86F7,Y          ; $C0A9  B9 F7 86
    STA $00              ; $C0AC  85 00
    LDA $86F8,Y          ; $C0AE  B9 F8 86
    STA $01              ; $C0B1  85 01
    JMP B07_C0F2         ; $C0B3  4C F2 C0
B07_C0B6:
    LDA $8001,Y          ; $C0B6  B9 01 80
    STA $00              ; $C0B9  85 00
    LDA $8002,Y          ; $C0BB  B9 02 80
    STA $01              ; $C0BE  85 01
    JMP B07_C0F2         ; $C0C0  4C F2 C0
B07_C0C3:
    LDX $0C              ; $C0C3  A6 0C
    LDA $0450,X          ; $C0C5  BD 50 04
    STA $05              ; $C0C8  85 05
    AND #$02             ; $C0CA  29 02
    BEQ B07_C088         ; $C0CC  F0 BA
    LDA $0400,X          ; $C0CE  BD 00 04
    BEQ B07_C088         ; $C0D1  F0 B5
    ASL A                ; $C0D3  0A
    TAY                  ; $C0D4  A8
    BCC B07_C09B         ; $C0D5  90 C4
    STY $12              ; $C0D7  84 12
    LDA $27              ; $C0D9  A5 27
    ASL A                ; $C0DB  0A
    TAY                  ; $C0DC  A8
    LDA $C22C,Y          ; $C0DD  B9 2C C2
    STA $10              ; $C0E0  85 10
    LDA $C22D,Y          ; $C0E2  B9 2D C2
    STA $11              ; $C0E5  85 11
    LDY $12              ; $C0E7  A4 12
    LDA ($10),Y          ; $C0E9  B1 10
    STA $00              ; $C0EB  85 00
    INY                  ; $C0ED  C8
    LDA ($10),Y          ; $C0EE  B1 10
    STA $01              ; $C0F0  85 01
B07_C0F2:
    LDA $0460,X          ; $C0F2  BD 60 04
    STA $02              ; $C0F5  85 02
    LDA $0480,X          ; $C0F7  BD 80 04
    STA $03              ; $C0FA  85 03
    LDA $0430,X          ; $C0FC  BD 30 04
    STA $04              ; $C0FF  85 04
    LDY #$00             ; $C101  A0 00
    LDA ($00),Y          ; $C103  B1 00
    INY                  ; $C105  C8
    STA $06              ; $C106  85 06
    LDX $0B              ; $C108  A6 0B
OAM_SPRITE_TILE_RENDER:
B07_C10A:
    LDA ($00),Y          ; $C10A  B1 00
    INY                  ; $C10C  C8
    CMP #$80             ; $C10D  C9 80
    ROR A                ; $C10F  6A
    PHP                  ; $C110  08
    CLC                  ; $C111  18
    ADC $02              ; $C112  65 02
    SEC                  ; $C114  38
    SBC #$01             ; $C115  E9 01
    STA $0200,X          ; $C117  9D 00 02
    LDA ($00),Y          ; $C11A  B1 00
    INY                  ; $C11C  C8
    STA $0201,X          ; $C11D  9D 01 02
    PLP                  ; $C120  28
    LDA ($00),Y          ; $C121  B1 00
    BCS B07_C128         ; $C123  B0 03
    INY                  ; $C125  C8
    STA $07              ; $C126  85 07
B07_C128:
    LDA $04              ; $C128  A5 04
    AND #$03             ; $C12A  29 03
    PHP                  ; $C12C  08
    LDA $07              ; $C12D  A5 07
    PLP                  ; $C12F  28
    BEQ B07_C134         ; $C130  F0 02
    AND #$E0             ; $C132  29 E0
B07_C134:
    EOR $04              ; $C134  45 04
    STA $17              ; $C136  85 17
    LDA $05              ; $C138  A5 05
    LSR A                ; $C13A  4A
    PHP                  ; $C13B  08
    LDA $17              ; $C13C  A5 17
    BCC B07_C142         ; $C13E  90 02
    EOR #$40             ; $C140  49 40
B07_C142:
    STA $0202,X          ; $C142  9D 02 02
    PLP                  ; $C145  28
    LDA ($00),Y          ; $C146  B1 00
    INY                  ; $C148  C8
    BCC B07_C14F         ; $C149  90 04
    EOR #$FF             ; $C14B  49 FF
    SBC #$07             ; $C14D  E9 07
B07_C14F:
    STA $17              ; $C14F  85 17
    LDA $03              ; $C151  A5 03
    BMI B07_C17E         ; $C153  30 29
    LDA $17              ; $C155  A5 17
    BMI B07_C177         ; $C157  30 1E
B07_C159:
    CLC                  ; $C159  18
    ADC $03              ; $C15A  65 03
B07_C15C:
    STA $0203,X          ; $C15C  9D 03 02
    LDA $0A              ; $C15F  A5 0A
    BNE B07_C189         ; $C161  D0 26
    TXA                  ; $C163  8A
B07_C164:
    CLC                  ; $C164  18
    ADC #$C4             ; $C165  69 C4
    CMP $09              ; $C167  C5 09
    BCC B07_C164         ; $C169  90 F9
    TAX                  ; $C16B  AA
B07_C16C:
    DEC $08              ; $C16C  C6 08
    BEQ B07_C176         ; $C16E  F0 06
B07_C170:
    DEC $06              ; $C170  C6 06
    BNE B07_C10A         ; $C172  D0 96
    STX $0B              ; $C174  86 0B
B07_C176:
    RTS                  ; $C176  60
B07_C177:
    CLC                  ; $C177  18
    ADC $03              ; $C178  65 03
    BCS B07_C15C         ; $C17A  B0 E0
    BCC B07_C170         ; $C17C  90 F2
B07_C17E:
    LDA $17              ; $C17E  A5 17
    BMI B07_C159         ; $C180  30 D7
    CLC                  ; $C182  18
    ADC $03              ; $C183  65 03
    BCS B07_C170         ; $C185  B0 E9
    BCC B07_C15C         ; $C187  90 D3
B07_C189:
    INX                  ; $C189  E8
    INX                  ; $C18A  E8
    INX                  ; $C18B  E8
    INX                  ; $C18C  E8
    JMP B07_C16C         ; $C18D  4C 6C C1
B07_C190:
    LDA $3C              ; $C190  A5 3C
    BEQ B07_C1C5         ; $C192  F0 31
    LDA #$C1             ; $C194  A9 C1
    STA $16              ; $C196  85 16
    LDX #$00             ; $C198  A2 00
B07_C19A:
    LDA $16              ; $C19A  A5 16
    STA $0200,X          ; $C19C  9D 00 02
    LDA #$0F             ; $C19F  A9 0F
    STA $0201,X          ; $C1A1  9D 01 02
    LDA #$03             ; $C1A4  A9 03
    STA $0202,X          ; $C1A6  9D 02 02
    LDA #$F8             ; $C1A9  A9 F8
    STA $0203,X          ; $C1AB  9D 03 02
    SEC                  ; $C1AE  38
    LDA $16              ; $C1AF  A5 16
    SBC #$10             ; $C1B1  E9 10
    BCS B07_C1B7         ; $C1B3  B0 02
    SBC #$0F             ; $C1B5  E9 0F
B07_C1B7:
    STA $16              ; $C1B7  85 16
    INX                  ; $C1B9  E8
    INX                  ; $C1BA  E8
    INX                  ; $C1BB  E8
    INX                  ; $C1BC  E8
    DEC $08              ; $C1BD  C6 08
    CPX #$3C             ; $C1BF  E0 3C
    BCC B07_C19A         ; $C1C1  90 D7
    STX $0B              ; $C1C3  86 0B
B07_C1C5:
    RTS                  ; $C1C5  60
B07_C1C6:
    LDA $03D9            ; $C1C6  AD D9 03
    BNE B07_C22B         ; $C1C9  D0 60
    LDA #$08             ; $C1CB  A9 08
    STA $12              ; $C1CD  85 12
    LDA #$60             ; $C1CF  A9 60
    STA $13              ; $C1D1  85 13
    LDA $063F            ; $C1D3  AD 3F 06
    AND #$0F             ; $C1D6  29 0F
    TAY                  ; $C1D8  A8
    BEQ B07_C1E4         ; $C1D9  F0 09
    LDA #$AA             ; $C1DB  A9 AA
    JSR B07_C1FA         ; $C1DD  20 FA C1
    LDA $08              ; $C1E0  A5 08
    BEQ B07_C22B         ; $C1E2  F0 47
B07_C1E4:
    LDA $063F            ; $C1E4  AD 3F 06
    BPL B07_C1F4         ; $C1E7  10 0B
    LDA #$AC             ; $C1E9  A9 AC
    LDY #$01             ; $C1EB  A0 01
    JSR B07_C1FA         ; $C1ED  20 FA C1
    LDA $08              ; $C1F0  A5 08
    BEQ B07_C22B         ; $C1F2  F0 37
B07_C1F4:
    LDY $12              ; $C1F4  A4 12
    BEQ B07_C22B         ; $C1F6  F0 33
    LDA #$AE             ; $C1F8  A9 AE
B07_C1FA:
    STA $11              ; $C1FA  85 11
    LDX $0B              ; $C1FC  A6 0B
B07_C1FE:
    LDA #$D0             ; $C1FE  A9 D0
    STA $0200,X          ; $C200  9D 00 02
    LDA $11              ; $C203  A5 11
    STA $0201,X          ; $C205  9D 01 02
    LDA #$03             ; $C208  A9 03
    STA $0202,X          ; $C20A  9D 02 02
    LDA $13              ; $C20D  A5 13
    STA $0203,X          ; $C20F  9D 03 02
    CLC                  ; $C212  18
    ADC #$08             ; $C213  69 08
    STA $13              ; $C215  85 13
    TXA                  ; $C217  8A
B07_C218:
    CLC                  ; $C218  18
    ADC #$C4             ; $C219  69 C4
    CMP $09              ; $C21B  C5 09
    BCC B07_C218         ; $C21D  90 F9
    TAX                  ; $C21F  AA
    DEC $12              ; $C220  C6 12
    DEC $08              ; $C222  C6 08
    BEQ B07_C229         ; $C224  F0 03
    DEY                  ; $C226  88
    BNE B07_C1FE         ; $C227  D0 D5
B07_C229:
    STX $0B              ; $C229  86 0B
B07_C22B:
    RTS                  ; $C22B  60
    .byte $69, $91, $F3, $95, $95, $99, $D0, $9A, $56, $9C, $12, $9E, $25, $A0, $9F, $A1 ; $C22C
    .byte $0E, $A3, $AA, $A4, $33, $A7, $78, $AB, $A8, $AC, $A8, $AC, $A8, $AC, $A8, $AC ; $C23C
    .byte $2C, $88, $DA, $8C, $50, $C2, $19, $AE, $19, $AE, $50, $C2, $50, $C2, $50, $C2 ; $C24C
    .byte $50, $C2, $50, $C2, $50, $C2, $50, $C2, $50, $C2, $50, $C2, $50, $C2, $50, $C2 ; $C25C
VBLANK_PPU_TRANSFER:
B07_C26C:
    LDA $22              ; $C26C  A5 22
    CMP #$28             ; $C26E  C9 28
    BCS B07_C2AB         ; $C270  B0 39
    LDA $2B              ; $C272  A5 2B
    BEQ B07_C2AB         ; $C274  F0 35
    LDA #$00             ; $C276  A9 00
    STA $2B              ; $C278  85 2B
    LDA $FF              ; $C27A  A5 FF
    AND #$7B             ; $C27C  29 7B
    STA $2000            ; $C27E  8D 00 20
    LDA $2002            ; $C281  AD 02 20
    LDA #$3F             ; $C284  A9 3F
    STA $2006            ; $C286  8D 06 20
    LDA #$00             ; $C289  A9 00
    STA $2006            ; $C28B  8D 06 20
    LDY #$00             ; $C28E  A0 00
B07_C290:
    LDA $059F,Y          ; $C290  B9 9F 05
    STA $2007            ; $C293  8D 07 20
    INY                  ; $C296  C8
    CPY #$20             ; $C297  C0 20
    BCC B07_C290         ; $C299  90 F5
    LDA #$3F             ; $C29B  A9 3F
    STA $2006            ; $C29D  8D 06 20
    LDA #$00             ; $C2A0  A9 00
    STA $2006            ; $C2A2  8D 06 20
    STA $2006            ; $C2A5  8D 06 20
    STA $2006            ; $C2A8  8D 06 20
B07_C2AB:
    LDY #$00             ; $C2AB  A0 00
B07_C2AD:
    LDX $0300,Y          ; $C2AD  BE 00 03
    BEQ B07_C303         ; $C2B0  F0 51
    BMI B07_C2E0         ; $C2B2  30 2C
    LDA $0301,Y          ; $C2B4  B9 01 03
    PHA                  ; $C2B7  48
    BMI B07_C2DA         ; $C2B8  30 20
    LDA $FF              ; $C2BA  A5 FF
B07_C2BC:
    AND #$7F             ; $C2BC  29 7F
    STA $2000            ; $C2BE  8D 00 20
    PLA                  ; $C2C1  68
    STA $2006            ; $C2C2  8D 06 20
    LDA $0302,Y          ; $C2C5  B9 02 03
    STA $2006            ; $C2C8  8D 06 20
    INY                  ; $C2CB  C8
    INY                  ; $C2CC  C8
    INY                  ; $C2CD  C8
B07_C2CE:
    LDA $0300,Y          ; $C2CE  B9 00 03
    STA $2007            ; $C2D1  8D 07 20
    INY                  ; $C2D4  C8
    DEX                  ; $C2D5  CA
    BNE B07_C2CE         ; $C2D6  D0 F6
    BEQ B07_C2AD         ; $C2D8  F0 D3
B07_C2DA:
    LDA $FF              ; $C2DA  A5 FF
    ORA #$04             ; $C2DC  09 04
    BNE B07_C2BC         ; $C2DE  D0 DC
B07_C2E0:
    LDA $FF              ; $C2E0  A5 FF
    STA $2000            ; $C2E2  8D 00 20
    LDA $0301,Y          ; $C2E5  B9 01 03
    STA $2006            ; $C2E8  8D 06 20
    LDA $0302,Y          ; $C2EB  B9 02 03
    STA $2006            ; $C2EE  8D 06 20
    DEX                  ; $C2F1  CA
    BPL B07_C2FD         ; $C2F2  10 09
    LDA $0303,Y          ; $C2F4  B9 03 03
B07_C2F7:
    STA $2007            ; $C2F7  8D 07 20
    DEX                  ; $C2FA  CA
    BMI B07_C2F7         ; $C2FB  30 FA
B07_C2FD:
    INY                  ; $C2FD  C8
    INY                  ; $C2FE  C8
    INY                  ; $C2FF  C8
    INY                  ; $C300  C8
    BNE B07_C2AD         ; $C301  D0 AA
B07_C303:
    STX $0300            ; $C303  8E 00 03
    STX $22              ; $C306  86 22
    LDA $FF              ; $C308  A5 FF
    ORA #$80             ; $C30A  09 80
    STA $2000            ; $C30C  8D 00 20
    RTS                  ; $C30F  60
B07_C310:
    LDX #$FF             ; $C310  A2 FF
    STX $1F              ; $C312  86 1F
    TXS                  ; $C314  9A
    INX                  ; $C315  E8
    STX $2003            ; $C316  8E 03 20
    LDA #$1F             ; $C319  A9 1F
    STA $9FFF            ; $C31B  8D FF 9F
    LSR A                ; $C31E  4A
    STA $9FFF            ; $C31F  8D FF 9F
    LSR A                ; $C322  4A
    STA $9FFF            ; $C323  8D FF 9F
    LSR A                ; $C326  4A
    STA $9FFF            ; $C327  8D FF 9F
    LSR A                ; $C32A  4A
    STA $9FFF            ; $C32B  8D FF 9F
    LDA #$07             ; $C32E  A9 07
    STA $FFFF            ; $C330  8D FF FF
    LSR A                ; $C333  4A
    STA $FFFF            ; $C334  8D FF FF
    LSR A                ; $C337  4A
    STA $FFFF            ; $C338  8D FF FF
    LSR A                ; $C33B  4A
    STA $FFFF            ; $C33C  8D FF FF
    LSR A                ; $C33F  4A
    STA $FFFF            ; $C340  8D FF FF
B07_C343:
    LDA $2002            ; $C343  AD 02 20
    BPL B07_C343         ; $C346  10 FB
B07_C348:
    LDA $2002            ; $C348  AD 02 20
    BPL B07_C348         ; $C34B  10 FB
    INC $1F              ; $C34D  E6 1F
    JMP B07_C352         ; $C34F  4C 52 C3
B07_C352:
    LDA #$1F             ; $C352  A9 1F
    JSR B07_CE56         ; $C354  20 56 CE
    LDA #$01             ; $C357  A9 01
    JSR B07_CEA5         ; $C359  20 A5 CE
    LDA #$0F             ; $C35C  A9 0F
    JSR B07_CE8A         ; $C35E  20 8A CE
    LDA #$00             ; $C361  A9 00
    JSR B07_CE6F         ; $C363  20 6F CE
    JSR B07_C4B3         ; $C366  20 B3 C4
    JSR B07_C498         ; $C369  20 98 C4
    LDX #$00             ; $C36C  A2 00
    TXA                  ; $C36E  8A
    STA $00              ; $C36F  85 00
    STA $01              ; $C371  85 01
    LDY #$F9             ; $C373  A0 F9
B07_C375:
    DEY                  ; $C375  88
    STA ($00),Y          ; $C376  91 00
    BNE B07_C375         ; $C378  D0 FB
    INC $01              ; $C37A  E6 01
    LDY #$04             ; $C37C  A0 04
    LDX #$08             ; $C37E  A2 08
B07_C380:
    STA ($00),Y          ; $C380  91 00
    INY                  ; $C382  C8
    BNE B07_C380         ; $C383  D0 FB
    INC $01              ; $C385  E6 01
    CPX $01              ; $C387  E4 01
    BNE B07_C380         ; $C389  D0 F5
    LDA #$01             ; $C38B  A9 01
    STA $21              ; $C38D  85 21
    JSR B07_CEC0         ; $C38F  20 C0 CE
    JSR B07_C4A3         ; $C392  20 A3 C4
B07_C395:
    INC $45              ; $C395  E6 45
    CLC                  ; $C397  18
    LDA $45              ; $C398  A5 45
    ADC $1E              ; $C39A  65 1E
    EOR $1E              ; $C39C  45 1E
    STA $45              ; $C39E  85 45
    JMP B07_C395         ; $C3A0  4C 95 C3
NMI_HANDLER:
    PHA                  ; $C3A3  48
    TXA                  ; $C3A4  8A
    PHA                  ; $C3A5  48
    TYA                  ; $C3A6  98
    PHA                  ; $C3A7  48
    LDA $2002            ; $C3A8  AD 02 20
    LDA #$00             ; $C3AB  A9 00
    STA $66              ; $C3AD  85 66
    LDY $1F              ; $C3AF  A4 1F
    BEQ B07_C3CE         ; $C3B1  F0 1B
    BMI B07_C40D         ; $C3B3  30 58
    JSR B07_C460         ; $C3B5  20 60 C4
    LDA $F0              ; $C3B8  A5 F0
    BMI B07_C40D         ; $C3BA  30 51
    LDA $8000            ; $C3BC  AD 00 80
    PHA                  ; $C3BF  48
    LDA #$80             ; $C3C0  A9 80
    STA $66              ; $C3C2  85 66
    JSR B07_CED5         ; $C3C4  20 D5 CE
    PLA                  ; $C3C7  68
    JSR B07_CEA7         ; $C3C8  20 A7 CE
    JMP B07_C40D         ; $C3CB  4C 0D C4
B07_C3CE:
    INC $1F              ; $C3CE  E6 1F
    LDY #$02             ; $C3D0  A0 02
    STY $4014            ; $C3D2  8C 14 40
    JSR B07_C4B3         ; $C3D5  20 B3 C4
    JSR B07_C26C         ; $C3D8  20 6C C2
    LDA $FE              ; $C3DB  A5 FE
    LDX $20              ; $C3DD  A6 20
    BEQ B07_C3E7         ; $C3DF  F0 06
    DEC $20              ; $C3E1  C6 20
    BEQ B07_C3E7         ; $C3E3  F0 02
    AND #$E7             ; $C3E5  29 E7
B07_C3E7:
    STA $2001            ; $C3E7  8D 01 20
    JSR B07_C460         ; $C3EA  20 60 C4
    JSR B07_CED5         ; $C3ED  20 D5 CE
    JSR B07_C532         ; $C3F0  20 32 C5
    JSR B07_F481         ; $C3F3  20 81 F4
    JSR B07_C001         ; $C3F6  20 01 C0
    JSR B07_C551         ; $C3F9  20 51 C5
    JSR B07_C4C6         ; $C3FC  20 C6 C4
    JSR B07_C413         ; $C3FF  20 13 C4
    LDA #$00             ; $C402  A9 00
    STA $1F              ; $C404  85 1F
    LDX $22              ; $C406  A6 22
    STA $0300,X          ; $C408  9D 00 03
    INC $22              ; $C40B  E6 22
B07_C40D:
    PLA                  ; $C40D  68
    TAY                  ; $C40E  A8
    PLA                  ; $C40F  68
    TAX                  ; $C410  AA
    PLA                  ; $C411  68
IRQ_HANDLER:
    RTI                  ; $C412  40
B07_C413:
    LDA $A2              ; $C413  A5 A2
    BEQ B07_C434         ; $C415  F0 1D
    LDA $35              ; $C417  A5 35
    BNE B07_C429         ; $C419  D0 0E
    LDA $FF              ; $C41B  A5 FF
    AND #$FE             ; $C41D  29 FE
    STA $00              ; $C41F  85 00
    LDA $50              ; $C421  A5 50
    AND #$01             ; $C423  29 01
    ORA $00              ; $C425  05 00
    STA $FF              ; $C427  85 FF
B07_C429:
    LDA $FD              ; $C429  A5 FD
    STA $03DE            ; $C42B  8D DE 03
    LDA $FC              ; $C42E  A5 FC
    STA $03DD            ; $C430  8D DD 03
    RTS                  ; $C433  60
B07_C434:
    LDA $03E0            ; $C434  AD E0 03
    STA $03E1            ; $C437  8D E1 03
    LDA $03DF            ; $C43A  AD DF 03
    STA $03E0            ; $C43D  8D E0 03
    LDA $03DB            ; $C440  AD DB 03
    STA $03DD            ; $C443  8D DD 03
    LDA $03DC            ; $C446  AD DC 03
    STA $03DE            ; $C449  8D DE 03
    LDA $FC              ; $C44C  A5 FC
    STA $03DB            ; $C44E  8D DB 03
    LDA $FD              ; $C451  A5 FD
    STA $03DC            ; $C453  8D DC 03
    LDA $FF              ; $C456  A5 FF
    AND #$FD             ; $C458  29 FD
    ORA $03E1            ; $C45A  0D E1 03
    STA $FF              ; $C45D  85 FF
    RTS                  ; $C45F  60
B07_C460:
    LDA $20              ; $C460  A5 20
    BNE B07_C48D         ; $C462  D0 29
    LDA $2002            ; $C464  AD 02 20
    LDA #$20             ; $C467  A9 20
    STA $2006            ; $C469  8D 06 20
    LDA #$00             ; $C46C  A9 00
    STA $2006            ; $C46E  8D 06 20
    LDA $2002            ; $C471  AD 02 20
    LDA $03DE            ; $C474  AD DE 03
    STA $2005            ; $C477  8D 05 20
    LDY $03DD            ; $C47A  AC DD 03
    DEY                  ; $C47D  88
    DEY                  ; $C47E  88
    DEY                  ; $C47F  88
    DEY                  ; $C480  88
    STY $2005            ; $C481  8C 05 20
B07_C484:
    LDA $FF              ; $C484  A5 FF
    ORA #$80             ; $C486  09 80
    STA $FF              ; $C488  85 FF
    STA $2000            ; $C48A  8D 00 20
B07_C48D:
    RTS                  ; $C48D  60
B07_C48E:
    LDA $FF              ; $C48E  A5 FF
    AND #$7F             ; $C490  29 7F
    STA $2000            ; $C492  8D 00 20
    STA $FF              ; $C495  85 FF
    RTS                  ; $C497  60
B07_C498:
    LDA #$0F             ; $C498  A9 0F
    STA $4015            ; $C49A  8D 15 40
    LDA #$C0             ; $C49D  A9 C0
    STA $4017            ; $C49F  8D 17 40
    RTS                  ; $C4A2  60
B07_C4A3:
    LDA #$B0             ; $C4A3  A9 B0
    STA $FF              ; $C4A5  85 FF
    STA $2000            ; $C4A7  8D 00 20
    LDA #$18             ; $C4AA  A9 18
    STA $FE              ; $C4AC  85 FE
    LDA #$05             ; $C4AE  A9 05
    STA $20              ; $C4B0  85 20
    RTS                  ; $C4B2  60
B07_C4B3:
    JSR B07_C48E         ; $C4B3  20 8E C4
    LDA #$00             ; $C4B6  A9 00
    STA $2006            ; $C4B8  8D 06 20
    STA $2006            ; $C4BB  8D 06 20
    LDA $FE              ; $C4BE  A5 FE
    AND #$E7             ; $C4C0  29 E7
    STA $2001            ; $C4C2  8D 01 20
    RTS                  ; $C4C5  60
B07_C4C6:
    LDA $31              ; $C4C6  A5 31
    STA $06              ; $C4C8  85 06
    JSR B07_C4D6         ; $C4CA  20 D6 C4
    LDA $30              ; $C4CD  A5 30
    STA $31              ; $C4CF  85 31
    ORA $06              ; $C4D1  05 06
    STA $30              ; $C4D3  85 30
    RTS                  ; $C4D5  60
B07_C4D6:
    LDX #$00             ; $C4D6  A2 00
    JSR B07_C50D         ; $C4D8  20 0D C5
    LDX #$02             ; $C4DB  A2 02
    JSR B07_C50D         ; $C4DD  20 0D C5
    LDA $00              ; $C4E0  A5 00
    CMP $02              ; $C4E2  C5 02
    BNE B07_C502         ; $C4E4  D0 1C
    LDA $01              ; $C4E6  A5 01
    CMP $03              ; $C4E8  C5 03
    BNE B07_C502         ; $C4EA  D0 16
    LDX #$00             ; $C4EC  A2 00
    JSR B07_C4F2         ; $C4EE  20 F2 C4
    INX                  ; $C4F1  E8
B07_C4F2:
    LDA $00,X            ; $C4F2  B5 00
    TAY                  ; $C4F4  A8
    EOR $F7,X            ; $C4F5  55 F7
    AND $00,X            ; $C4F7  35 00
    STA $30,X            ; $C4F9  95 30
    STA $F5,X            ; $C4FB  95 F5
    STY $32,X            ; $C4FD  94 32
    STY $F7,X            ; $C4FF  94 F7
    RTS                  ; $C501  60
B07_C502:
    LDA #$00             ; $C502  A9 00
    STA $30              ; $C504  85 30
    STA $F5              ; $C506  85 F5
    STA $31              ; $C508  85 31
    STA $F6              ; $C50A  85 F6
    RTS                  ; $C50C  60
B07_C50D:
    LDY #$01             ; $C50D  A0 01
    STY $4016            ; $C50F  8C 16 40
    DEY                  ; $C512  88
    STY $4016            ; $C513  8C 16 40
    LDY #$08             ; $C516  A0 08
B07_C518:
    LDA $4016            ; $C518  AD 16 40
    STA $04              ; $C51B  85 04
    LSR A                ; $C51D  4A
    ORA $04              ; $C51E  05 04
    LSR A                ; $C520  4A
    ROL $00,X            ; $C521  36 00
    LDA $4017            ; $C523  AD 17 40
    STA $05              ; $C526  85 05
    LSR A                ; $C528  4A
    ORA $05              ; $C529  05 05
    LSR A                ; $C52B  4A
    ROL $01,X            ; $C52C  36 01
    DEY                  ; $C52E  88
    BNE B07_C518         ; $C52F  D0 E7
    RTS                  ; $C531  60
B07_C532:
    LDA $3F              ; $C532  A5 3F
    BEQ B07_C537         ; $C534  F0 01
    RTS                  ; $C536  60
B07_C537:
    LDA $0360            ; $C537  AD 60 03
    BEQ B07_C550         ; $C53A  F0 14
    LDY #$60             ; $C53C  A0 60
B07_C53E:
    LDA $035F,Y          ; $C53E  B9 5F 03
    STA $02FF,Y          ; $C541  99 FF 02
    DEY                  ; $C544  88
    BNE B07_C53E         ; $C545  D0 F7
    LDA $23              ; $C547  A5 23
    STA $22              ; $C549  85 22
    STY $23              ; $C54B  84 23
    STY $0360            ; $C54D  8C 60 03
B07_C550:
    RTS                  ; $C550  60
FRAME_STATE_DISPATCH:
B07_C551:
    INC $1E              ; $C551  E6 1E
    LDA $1B              ; $C553  A5 1B
    JSR B07_C702         ; $C555  20 02 C7
FRAME_STATE_HANDLERS: ; fixed-length little-endian CPU data pointers
    .word $C564, $C627, $C65C, $C669, $CB07, $C699 ; $C558
B07_C564:
    LDA $1C              ; $C564  A5 1C
    JSR B07_C702         ; $C566  20 02 C7
FRAME_SUBSTATE_HANDLERS: ; fixed-length little-endian CPU data pointers
    .word $C571, $C59C, $C5E1, $C60F ; $C569
B07_C571:
    LDA #$00             ; $C571  A9 00
    STA $24              ; $C573  85 24
    LDA $FF              ; $C575  A5 FF
    AND #$FC             ; $C577  29 FC
    STA $FF              ; $C579  85 FF
    JSR B07_CEC0         ; $C57B  20 C0 CE
    JSR B07_C6D2         ; $C57E  20 D2 C6
    JSR B07_C962         ; $C581  20 62 C9
    LDA #$0F             ; $C584  A9 0F
    JSR B07_CE8A         ; $C586  20 8A CE
    LDA #$21             ; $C589  A9 21
    JSR B07_F72E         ; $C58B  20 2E F7
    JSR B07_F77E         ; $C58E  20 7E F7
    LDA #$26             ; $C591  A9 26
    JSR B07_D22C         ; $C593  20 2C D2
    JSR B07_C6B9         ; $C596  20 B9 C6
    INC $1C              ; $C599  E6 1C
    RTS                  ; $C59B  60
B07_C59C:
    LDA $30              ; $C59C  A5 30
    AND #$30             ; $C59E  29 30
    BNE B07_C5A7         ; $C5A0  D0 05
    JSR B07_C6A8         ; $C5A2  20 A8 C6
    BNE B07_C60E         ; $C5A5  D0 67
B07_C5A7:
    LDA $2E              ; $C5A7  A5 2E
    BNE B07_C5AE         ; $C5A9  D0 03
    JSR B07_CEC0         ; $C5AB  20 C0 CE
B07_C5AE:
    LDA #$00             ; $C5AE  A9 00
    STA $24              ; $C5B0  85 24
    LDA $FF              ; $C5B2  A5 FF
    AND #$FC             ; $C5B4  29 FC
    STA $FF              ; $C5B6  85 FF
    JSR B07_C6D2         ; $C5B8  20 D2 C6
    JSR B07_C962         ; $C5BB  20 62 C9
    JSR B07_C93C         ; $C5BE  20 3C C9
    LDA #$0F             ; $C5C1  A9 0F
    JSR B07_CE8A         ; $C5C3  20 8A CE
    LDA #$00             ; $C5C6  A9 00
    JSR B07_CE6F         ; $C5C8  20 6F CE
    JSR B07_C6B9         ; $C5CB  20 B9 C6
    INC $1C              ; $C5CE  E6 1C
    LDA $2E              ; $C5D0  A5 2E
    BNE B07_C5D9         ; $C5D2  D0 05
    LDA #$4E             ; $C5D4  A9 4E
    JSR B07_CEF0         ; $C5D6  20 F0 CE
B07_C5D9:
    LDA #$00             ; $C5D9  A9 00
    STA $26              ; $C5DB  85 26
    RTS                  ; $C5DD  60
B07_C5DE:
    JMP B07_C69C         ; $C5DE  4C 9C C6
B07_C5E1:
    JSR B07_C6A8         ; $C5E1  20 A8 C6
    BEQ B07_C5DE         ; $C5E4  F0 F8
    LDA #$40             ; $C5E6  A9 40
    STA $0480            ; $C5E8  8D 80 04
    LDA #$02             ; $C5EB  A9 02
    STA $0450            ; $C5ED  8D 50 04
    LDA #$00             ; $C5F0  A9 00
    STA $0400            ; $C5F2  8D 00 04
    LDX $26              ; $C5F5  A6 26
    LDA $C625,X          ; $C5F7  BD 25 C6
    STA $0460            ; $C5FA  8D 60 04
    LDA $F5              ; $C5FD  A5 F5
    AND #$10             ; $C5FF  29 10
    BEQ B07_C60E         ; $C601  F0 0B
    LDA #$3C             ; $C603  A9 3C
    JSR B07_CEF0         ; $C605  20 F0 CE
    LDA #$80             ; $C608  A9 80
    STA $3A              ; $C60A  85 3A
    INC $1C              ; $C60C  E6 1C
B07_C60E:
    RTS                  ; $C60E  60
B07_C60F:
    LDA $3A              ; $C60F  A5 3A
    AND #$08             ; $C611  29 08
    ASL A                ; $C613  0A
    ASL A                ; $C614  0A
    ASL A                ; $C615  0A
    ASL A                ; $C616  0A
    ADC $26              ; $C617  65 26
    JSR B07_CA58         ; $C619  20 58 CA
    DEC $3A              ; $C61C  C6 3A
    BNE B07_C60E         ; $C61E  D0 EE
    LDA #$02             ; $C620  A9 02
    JMP B07_C6A3         ; $C622  4C A3 C6
    .byte $B6, $C6 ; $C625
B07_C627:
    LDX $1C              ; $C627  A6 1C
    BNE B07_C640         ; $C629  D0 15
    JSR B07_C6D2         ; $C62B  20 D2 C6
    LDA #$00             ; $C62E  A9 00
    LDY #$40             ; $C630  A0 40
    JSR B07_C6BD         ; $C632  20 BD C6
    LDA #$01             ; $C635  A9 01
    STA $24              ; $C637  85 24
    STA $39              ; $C639  85 39
    STA $5C              ; $C63B  85 5C
    INC $1C              ; $C63D  E6 1C
    RTS                  ; $C63F  60
B07_C640:
    LDA $30              ; $C640  A5 30
    AND #$30             ; $C642  29 30
    BNE B07_C652         ; $C644  D0 0C
    JSR B07_D23D         ; $C646  20 3D D2
    LDA $37              ; $C649  A5 37
    BNE B07_C652         ; $C64B  D0 05
    JSR B07_C6A8         ; $C64D  20 A8 C6
    BNE B07_C60E         ; $C650  D0 BC
B07_C652:
    LDX #$00             ; $C652  A2 00
    STX $2E              ; $C654  86 2E
    STX $1B              ; $C656  86 1B
    INX                  ; $C658  E8
    STX $1C              ; $C659  86 1C
    RTS                  ; $C65B  60
B07_C65C:
    JSR B07_C6D2         ; $C65C  20 D2 C6
    LDA #$00             ; $C65F  A9 00
    STA $24              ; $C661  85 24
    JSR B07_C6C2         ; $C663  20 C2 C6
    JMP B07_C69C         ; $C666  4C 9C C6
B07_C669:
    LDA #$00             ; $C669  A9 00
    STA $34              ; $C66B  85 34
    JSR B07_C6D6         ; $C66D  20 D6 C6
    INC $5C              ; $C670  E6 5C
    LDA #$00             ; $C672  A9 00
    STA $C2              ; $C674  85 C2
    STA $C3              ; $C676  85 C3
    STA $C4              ; $C678  85 C4
    LDA #$03             ; $C67A  A9 03
    STA $46              ; $C67C  85 46
    LDA #$80             ; $C67E  A9 80
    STA $77              ; $C680  85 77
    STA $78              ; $C682  85 78
    STA $79              ; $C684  85 79
    STA $7A              ; $C686  85 7A
    LDA #$00             ; $C688  A9 00
    STA $BF              ; $C68A  85 BF
    STA $A7              ; $C68C  85 A7
    STA $A8              ; $C68E  85 A8
    STA $A9              ; $C690  85 A9
    STA $AA              ; $C692  85 AA
    STA $AB              ; $C694  85 AB
    JMP B07_C69C         ; $C696  4C 9C C6
B07_C699:
    JMP B07_D289         ; $C699  4C 89 D2
B07_C69C:
    INC $1B              ; $C69C  E6 1B
B07_C69E:
    LDA #$00             ; $C69E  A9 00
    STA $1C              ; $C6A0  85 1C
    RTS                  ; $C6A2  60
B07_C6A3:
    STA $1B              ; $C6A3  85 1B
    JMP B07_C69E         ; $C6A5  4C 9E C6
B07_C6A8:
    LDA $3A              ; $C6A8  A5 3A
    ORA $3B              ; $C6AA  05 3B
    BEQ B07_C6B8         ; $C6AC  F0 0A
    LDA $3A              ; $C6AE  A5 3A
    BNE B07_C6B4         ; $C6B0  D0 02
    DEC $3B              ; $C6B2  C6 3B
B07_C6B4:
    DEC $3A              ; $C6B4  C6 3A
    LDA #$01             ; $C6B6  A9 01
B07_C6B8:
    RTS                  ; $C6B8  60
B07_C6B9:
    LDA #$00             ; $C6B9  A9 00
    LDY #$01             ; $C6BB  A0 01
B07_C6BD:
    STA $3A              ; $C6BD  85 3A
    STY $3B              ; $C6BF  84 3B
    RTS                  ; $C6C1  60
B07_C6C2:
    LDA $26              ; $C6C2  A5 26
    STA $25              ; $C6C4  85 25
    RTS                  ; $C6C6  60
B07_C6C7:
    LDA #$00             ; $C6C7  A9 00
    LDX #$07             ; $C6C9  A2 07
B07_C6CB:
    STA $03C2,X          ; $C6CB  9D C2 03
    DEX                  ; $C6CE  CA
    BPL B07_C6CB         ; $C6CF  10 FA
    RTS                  ; $C6D1  60
B07_C6D2:
    LDX #$30             ; $C6D2  A2 30
    BNE B07_C6D8         ; $C6D4  D0 02
B07_C6D6:
    LDX #$48             ; $C6D6  A2 48
B07_C6D8:
    LDA #$00             ; $C6D8  A9 00
B07_C6DA:
    STA $00,X            ; $C6DA  95 00
    INX                  ; $C6DC  E8
    CPX #$C8             ; $C6DD  E0 C8
    BNE B07_C6E4         ; $C6DF  D0 03
    INX                  ; $C6E1  E8
    INX                  ; $C6E2  E8
    INX                  ; $C6E3  E8
B07_C6E4:
    CPX #$E0             ; $C6E4  E0 E0
    BNE B07_C6DA         ; $C6E6  D0 F2
    LDX #$00             ; $C6E8  A2 00
B07_C6EA:
    STA $0400,X          ; $C6EA  9D 00 04
    STA $0500,X          ; $C6ED  9D 00 05
    STA $0600,X          ; $C6F0  9D 00 06
    STA $0700,X          ; $C6F3  9D 00 07
    INX                  ; $C6F6  E8
    BNE B07_C6EA         ; $C6F7  D0 F1
    LDX #$C0             ; $C6F9  A2 C0
B07_C6FB:
    STA $0300,X          ; $C6FB  9D 00 03
    INX                  ; $C6FE  E8
    BNE B07_C6FB         ; $C6FF  D0 FA
    RTS                  ; $C701  60
INLINE_TABLE_DISPATCH_HELPER:
B07_C702:
    ASL A                ; $C702  0A
    STY $03              ; $C703  84 03
    TAY                  ; $C705  A8
    INY                  ; $C706  C8
    PLA                  ; $C707  68
    STA $00              ; $C708  85 00
    PLA                  ; $C70A  68
    STA $01              ; $C70B  85 01
    LDA ($00),Y          ; $C70D  B1 00
    STA $02              ; $C70F  85 02
    INY                  ; $C711  C8
    LDA ($00),Y          ; $C712  B1 00
    LDY $03              ; $C714  A4 03
    STA $03              ; $C716  85 03
    JMP ($0002)          ; $C718  6C 02 00
B07_C71B:
    CLC                  ; $C71B  18
    ADC $00,X            ; $C71C  75 00
    STA $00,X            ; $C71E  95 00
    BCC B07_C724         ; $C720  90 02
    INC $01,X            ; $C722  F6 01
B07_C724:
    RTS                  ; $C724  60
    .byte $A0, $00, $84, $00, $84, $01, $C9, $0A, $90, $06, $E9, $0A, $E6, $01, $D0, $F6 ; $C725
    .byte $85, $00, $09, $00, $D0, $04, $A9, $0A, $85, $00, $A5, $01, $D0, $04, $A9, $0A ; $C735
    .byte $85, $01, $60 ; $C745
B07_C748:
    JSR B07_C765         ; $C748  20 65 C7
    CMP #$04             ; $C74B  C9 04
    BEQ B07_C751         ; $C74D  F0 02
    LDA #$00             ; $C74F  A9 00
B07_C751:
    RTS                  ; $C751  60
B07_C752:
    LDA $51              ; $C752  A5 51
    STA $04              ; $C754  85 04
    LDA $4F              ; $C756  A5 4F
    SEC                  ; $C758  38
    SBC #$80             ; $C759  E9 80
    STA $02              ; $C75B  85 02
    LDA $50              ; $C75D  A5 50
    SBC #$00             ; $C75F  E9 00
    STA $03              ; $C761  85 03
    BMI B07_C748         ; $C763  30 E3
B07_C765:
    LDA $00              ; $C765  A5 00
    CLC                  ; $C767  18
    ADC $4F              ; $C768  65 4F
    STA $02              ; $C76A  85 02
    LDA $50              ; $C76C  A5 50
    ADC #$00             ; $C76E  69 00
    STA $03              ; $C770  85 03
    CLC                  ; $C772  18
    LDA $01              ; $C773  A5 01
    ADC $04              ; $C775  65 04
    STA $04              ; $C777  85 04
    LSR $03              ; $C779  46 03
    LDA $04              ; $C77B  A5 04
    ROR A                ; $C77D  6A
    AND #$F8             ; $C77E  29 F8
    STA $04              ; $C780  85 04
    LDA $02              ; $C782  A5 02
    LSR A                ; $C784  4A
    LSR A                ; $C785  4A
    LSR A                ; $C786  4A
    LSR A                ; $C787  4A
    LSR A                ; $C788  4A
    ORA $04              ; $C789  05 04
    TAY                  ; $C78B  A8
    LDA $0700,Y          ; $C78C  B9 00 07
    JMP B07_C816         ; $C78F  4C 16 C8
    .byte $98, $0A, $A8, $B9, $21, $C8, $18, $6D, $80, $04, $85, $00, $B9, $22, $C8, $18 ; $C792
    .byte $6D, $60, $04, $85, $01, $4C, $C7, $C7, $98, $0A, $A8, $B9, $21, $C8, $18, $6D ; $C7A2
    .byte $E0, $04, $18, $6D, $80, $04, $85, $00, $B9, $22, $C8, $18, $6D, $B0, $04, $18 ; $C7B2
    .byte $6D, $60, $04, $85, $01 ; $C7C2
B07_C7C7:
    STY $1A              ; $C7C7  84 1A
    BIT $A2              ; $C7C9  24 A2
    BMI B07_C752         ; $C7CB  30 85
    LDA $00              ; $C7CD  A5 00
    CLC                  ; $C7CF  18
    ADC $4F              ; $C7D0  65 4F
    ROL A                ; $C7D2  2A
    ROL A                ; $C7D3  2A
    ROL A                ; $C7D4  2A
    ROL A                ; $C7D5  2A
    PHP                  ; $C7D6  08
    AND #$07             ; $C7D7  29 07
    STA $00              ; $C7D9  85 00
    LDA $01              ; $C7DB  A5 01
    CLC                  ; $C7DD  18
    ADC $51              ; $C7DE  65 51
    STA $01              ; $C7E0  85 01
    LDA $52              ; $C7E2  A5 52
    ADC #$00             ; $C7E4  69 00
    STA $02              ; $C7E6  85 02
    LDY #$00             ; $C7E8  A0 00
B07_C7EA:
    LDA $02              ; $C7EA  A5 02
    BNE B07_C7F4         ; $C7EC  D0 06
    LDA $01              ; $C7EE  A5 01
    CMP #$F0             ; $C7F0  C9 F0
    BCC B07_C804         ; $C7F2  90 10
B07_C7F4:
    LDA $01              ; $C7F4  A5 01
    SEC                  ; $C7F6  38
    SBC #$F0             ; $C7F7  E9 F0
    STA $01              ; $C7F9  85 01
    LDA $02              ; $C7FB  A5 02
    SBC #$00             ; $C7FD  E9 00
    STA $02              ; $C7FF  85 02
    INY                  ; $C801  C8
    BNE B07_C7EA         ; $C802  D0 E6
B07_C804:
    TYA                  ; $C804  98
    ROR A                ; $C805  6A
    ROR $01              ; $C806  66 01
    LDA $01              ; $C808  A5 01
    AND #$F8             ; $C80A  29 F8
    ORA $00              ; $C80C  05 00
    TAY                  ; $C80E  A8
    STY $0598            ; $C80F  8C 98 05
    LDA $0700,Y          ; $C812  B9 00 07
    PLP                  ; $C815  28
B07_C816:
    BCC B07_C81C         ; $C816  90 04
    LSR A                ; $C818  4A
    LSR A                ; $C819  4A
    LSR A                ; $C81A  4A
    LSR A                ; $C81B  4A
B07_C81C:
    LDY $1A              ; $C81C  A4 1A
    AND #$0F             ; $C81E  29 0F
    RTS                  ; $C820  60
    .byte $06, $F4, $FA, $F4, $06, $15, $FA, $15, $09, $FC, $F7, $FC, $00, $13, $00, $11 ; $C821
    .byte $00, $17, $00, $F8, $07, $00, $F9, $00, $00, $F4, $00, $07, $0A, $00, $F6, $00 ; $C831
    .byte $0A, $15, $00, $15, $09, $0D, $F7, $0D, $08, $07, $F8, $07, $00, $00, $07, $11 ; $C841
    .byte $F9, $11, $00, $F9, $00, $07, $08, $F9, $F8, $F9, $08, $07, $F8, $07, $0D, $00 ; $C851
    .byte $F3, $00, $00, $FC, $09, $0F, $F7, $0F, $09, $F4, $F7, $F4, $09, $00, $F7, $00 ; $C861
    .byte $00, $00, $00, $F0, $FA, $17, $06, $17, $0D, $F9, $F3, $F9, $0D, $07, $F3, $07 ; $C871
    .byte $85, $10, $84, $11, $A0, $03, $D0, $26, $20, $A9, $C8, $A0, $02, $B9, $C2, $00 ; $C881
    .byte $D9, $C8, $00, $F0, $03, $B0, $05, $60, $88, $10, $F2, $60, $A0, $02, $B9, $C2 ; $C891
    .byte $00, $99, $C8, $00, $88, $10, $F7, $60, $85, $10, $84, $11, $A0, $00, $A9, $00 ; $C8A1
    .byte $85, $12, $B9, $C2, $00, $29, $0F, $85, $12, $A5, $10, $29, $0F, $18, $65, $12 ; $C8B1
    .byte $20, $0B, $C9, $A5, $00, $85, $14, $B9, $C2, $00, $4A, $4A, $4A, $4A, $85, $12 ; $C8C1
    .byte $A5, $10, $4A, $4A, $4A, $4A, $18, $65, $01, $18, $65, $12, $20, $0B, $C9, $A5 ; $C8D1
    .byte $00, $0A, $0A, $0A, $0A, $05, $14, $99, $C2, $00, $A5, $01, $F0, $0A, $C0, $01 ; $C8E1
    .byte $F0, $0C, $18, $65, $11, $4C, $FF, $C8, $C0, $01, $F0, $0D, $A5, $11, $85, $10 ; $C8F1
    .byte $C8, $C0, $03, $F0, $04, $C0, $06, $D0, $A5, $60, $48, $A9, $00, $85, $00, $85 ; $C901
    .byte $01, $68, $C9, $0A, $90, $06, $E9, $0A, $E6, $01, $D0, $F6, $85, $00, $60, $A9 ; $C911
    .byte $E1, $A0, $FF, $20, $30, $C9, $8D, $C6, $03, $8C, $C5, $03, $60, $A0, $00, $18 ; $C921
    .byte $6D, $C6, $03, $48, $98, $6D, $C5, $03, $A8, $68, $60 ; $C931
B07_C93C:
    JSR B07_C962         ; $C93C  20 62 C9
    LDA #$00             ; $C93F  A9 00
    STA $FD              ; $C941  85 FD
    STA $FC              ; $C943  85 FC
    LDA $FF              ; $C945  A5 FF
    AND #$FC             ; $C947  29 FC
    STA $FF              ; $C949  85 FF
    LDA #$01             ; $C94B  A9 01
    JSR B07_CEA5         ; $C94D  20 A5 CE
    LDX #$02             ; $C950  A2 02
    JSR B07_C982         ; $C952  20 82 C9
    LDA #$21             ; $C955  A9 21
    JSR B07_F72E         ; $C957  20 2E F7
    JSR B07_F77E         ; $C95A  20 7E F7
    LDA #$00             ; $C95D  A9 00
    JMP B07_CA58         ; $C95F  4C 58 CA
B07_C962:
    LDX #$00             ; $C962  A2 00
    JSR B07_C982         ; $C964  20 82 C9
    LDA #$00             ; $C967  A9 00
    LDY #$3F             ; $C969  A0 3F
B07_C96B:
    STA $05C0,Y          ; $C96B  99 C0 05
    STA $06C0,Y          ; $C96E  99 C0 06
    DEY                  ; $C971  88
    BPL B07_C96B         ; $C972  10 F7
    RTS                  ; $C974  60
    .byte $A9, $E8, $85, $FC, $A9, $01, $0A, $8D, $DF, $03, $4C, $89, $C9 ; $C975
B07_C982:
    LDA #$00             ; $C982  A9 00
    STA $FC              ; $C984  85 FC
    STA $03DF            ; $C986  8D DF 03
    LDA $E3CE,X          ; $C989  BD CE E3
    STA $00              ; $C98C  85 00
    LDA $E3CF,X          ; $C98E  BD CF E3
    STA $01              ; $C991  85 01
    JSR B07_C4B3         ; $C993  20 B3 C4
    LDA #$00             ; $C996  A9 00
    STA $FD              ; $C998  85 FD
B07_C99A:
    LDA $2002            ; $C99A  AD 02 20
    LDY #$01             ; $C99D  A0 01
    LDA ($00),Y          ; $C99F  B1 00
    STA $2006            ; $C9A1  8D 06 20
    DEY                  ; $C9A4  88
    LDA ($00),Y          ; $C9A5  B1 00
    STA $2006            ; $C9A7  8D 06 20
    LDX #$00             ; $C9AA  A2 00
    LDA #$02             ; $C9AC  A9 02
    JSR B07_C71B         ; $C9AE  20 1B C7
B07_C9B1:
    LDY #$00             ; $C9B1  A0 00
    LDA ($00),Y          ; $C9B3  B1 00
    CMP #$FF             ; $C9B5  C9 FF
    BEQ B07_C9F7         ; $C9B7  F0 3E
    CMP #$7F             ; $C9B9  C9 7F
    BEQ B07_C9EF         ; $C9BB  F0 32
    TAY                  ; $C9BD  A8
    BPL B07_C9DD         ; $C9BE  10 1D
    AND #$7F             ; $C9C0  29 7F
    STA $02              ; $C9C2  85 02
    LDY #$01             ; $C9C4  A0 01
B07_C9C6:
    LDA ($00),Y          ; $C9C6  B1 00
    STA $2007            ; $C9C8  8D 07 20
    CPY $02              ; $C9CB  C4 02
    BEQ B07_C9D2         ; $C9CD  F0 03
    INY                  ; $C9CF  C8
    BNE B07_C9C6         ; $C9D0  D0 F4
B07_C9D2:
    LDA #$01             ; $C9D2  A9 01
    CLC                  ; $C9D4  18
    ADC $02              ; $C9D5  65 02
B07_C9D7:
    JSR B07_C71B         ; $C9D7  20 1B C7
    JMP B07_C9B1         ; $C9DA  4C B1 C9
B07_C9DD:
    LDY #$01             ; $C9DD  A0 01
    STA $02              ; $C9DF  85 02
    LDA ($00),Y          ; $C9E1  B1 00
    LDY $02              ; $C9E3  A4 02
B07_C9E5:
    STA $2007            ; $C9E5  8D 07 20
    DEY                  ; $C9E8  88
    BNE B07_C9E5         ; $C9E9  D0 FA
    LDA #$02             ; $C9EB  A9 02
    BNE B07_C9D7         ; $C9ED  D0 E8
B07_C9EF:
    LDA #$01             ; $C9EF  A9 01
    JSR B07_C71B         ; $C9F1  20 1B C7
    JMP B07_C99A         ; $C9F4  4C 9A C9
B07_C9F7:
    LDA #$03             ; $C9F7  A9 03
    STA $20              ; $C9F9  85 20
    JMP B07_C484         ; $C9FB  4C 84 C4
    .byte $00, $20, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00 ; $C9FE
    .byte $78, $00, $40, $00, $7F, $00, $28, $78, $00, $78, $00, $78, $00, $78, $00, $78 ; $CA0E
    .byte $00, $78, $00, $78, $00, $78, $00, $20, $00, $FF, $00, $23, $60, $32, $60, $32 ; $CA1E
    .byte $7F, $00, $2B, $60, $32, $60, $32, $FF, $AB, $21, $89, $16, $10, $1C, $14, $00 ; $CA2E
    .byte $1E, $25, $14, $21, $FF, $00, $20, $78, $00, $78, $00, $78, $00, $78, $00, $78 ; $CA3E
    .byte $00, $78, $00, $78, $00, $78, $00, $40, $00, $FF ; $CA4E
B07_CA58:
    TAY                  ; $CA58  A8
    LDA #$03             ; $CA59  A9 03
    STA $03              ; $CA5B  85 03
    TYA                  ; $CA5D  98
    STA $02              ; $CA5E  85 02
    ASL A                ; $CA60  0A
    TAY                  ; $CA61  A8
    LDA $CAB7,Y          ; $CA62  B9 B7 CA
    STA $00              ; $CA65  85 00
    LDA $CAB8,Y          ; $CA67  B9 B8 CA
    STA $01              ; $CA6A  85 01
    LDX $22              ; $CA6C  A6 22
    LDY #$00             ; $CA6E  A0 00
B07_CA70:
    LDA ($00),Y          ; $CA70  B1 00
    INY                  ; $CA72  C8
    CMP #$FF             ; $CA73  C9 FF
    BEQ B07_CA98         ; $CA75  F0 21
    CMP #$FE             ; $CA77  C9 FE
    BEQ B07_CA98         ; $CA79  F0 1D
    STA $0300,X          ; $CA7B  9D 00 03
    LDA $02              ; $CA7E  A5 02
    BPL B07_CA8D         ; $CA80  10 0B
    LDA $03              ; $CA82  A5 03
    BNE B07_CA8B         ; $CA84  D0 05
    STA $0300,X          ; $CA86  9D 00 03
    BEQ B07_CA8D         ; $CA89  F0 02
B07_CA8B:
    DEC $03              ; $CA8B  C6 03
B07_CA8D:
    INX                  ; $CA8D  E8
    BNE B07_CA70         ; $CA8E  D0 E0
    LDA #$FF             ; $CA90  A9 FF
B07_CA92:
    LDX $22              ; $CA92  A6 22
B07_CA94:
    STA $0300,X          ; $CA94  9D 00 03
    INX                  ; $CA97  E8
B07_CA98:
    STX $22              ; $CA98  86 22
    RTS                  ; $CA9A  60
    LDA #$00             ; $CA9B  A9 00
    BEQ B07_CA92         ; $CA9D  F0 F3
    LDA #$00             ; $CA9F  A9 00
    JSR B07_CA94         ; $CAA1  20 94 CA
    LDA #$00             ; $CAA4  A9 00
    BEQ B07_CA94         ; $CAA6  F0 EC
    LDA #$FF             ; $CAA8  A9 FF
B07_CAAA:
    LDX $23              ; $CAAA  A6 23
B07_CAAC:
    STA $0360,X          ; $CAAC  9D 60 03
    INX                  ; $CAAF  E8
    STX $23              ; $CAB0  86 23
    RTS                  ; $CAB2  60
    .byte $A9, $00, $F0, $F3, $D6, $CA, $F7, $CA, $FF, $CA, $D3, $AA, $DA, $AA, $E1, $AA ; $CAB3
    .byte $E4, $CA, $EB, $CA, $EF, $AA, $F4, $AA, $F9, $AA, $FE, $AA, $E8, $AA, $01, $20 ; $CAC3
    .byte $00, $00, $FE, $0A, $22, $CB, $1F, $24, $22, $17, $00, $22, $23, $10, $21, $23 ; $CAD3
    .byte $FE, $03, $22, $0D, $14, $1D, $13, $FE, $08, $21, $AD, $12, $1E, $1D, $23, $18 ; $CAE3
    .byte $1D, $24, $14, $FE, $04, $23, $E3, $AA, $AA, $AA, $AA, $FE, $04, $22, $0F, $E4 ; $CAF3
    .byte $FA, $FB, $FC, $FE ; $CB03
B07_CB07:
    LDA $03EA            ; $CB07  AD EA 03
    BNE B07_CB1C         ; $CB0A  D0 10
    LDA $34              ; $CB0C  A5 34
    CMP #$06             ; $CB0E  C9 06
    BCC B07_CB1C         ; $CB10  90 0A
    JSR B07_CDB9         ; $CB12  20 B9 CD
    LDA $35              ; $CB15  A5 35
    BEQ B07_CB1C         ; $CB17  F0 03
    JMP B07_D12E         ; $CB19  4C 2E D1
B07_CB1C:
    LDA #$00             ; $CB1C  A9 00
    STA $03EA            ; $CB1E  8D EA 03
    LDA $34              ; $CB21  A5 34
    JSR B07_C702         ; $CB23  20 02 C7
GAME_MODE_HANDLERS: ; fixed-length little-endian CPU data pointers
    .word $CB3E, $CB54, $D2D0, $CB5C, $D4C8, $CBBF, $CC18, $CCCD ; $CB26
    .word $CD0A, $CB57, $CD55, $CCFD ; $CB36
B07_CB3E:
    LDA #$00             ; $CB3E  A9 00
    STA $03E7            ; $CB40  8D E7 03
    LDA $45              ; $CB43  A5 45
    AND #$03             ; $CB45  29 03
    TAY                  ; $CB47  A8
    LDA $CB50,Y          ; $CB48  B9 50 CB
    STA $55              ; $CB4B  85 55
    INC $34              ; $CB4D  E6 34
    RTS                  ; $CB4F  60
    .byte $04, $03, $02, $04 ; $CB50
B07_CB54:
    INC $34              ; $CB54  E6 34
    RTS                  ; $CB56  60
B07_CB57:
    LDA #$02             ; $CB57  A9 02
    STA $34              ; $CB59  85 34
    RTS                  ; $CB5B  60
B07_CB5C:
    LDA $5C              ; $CB5C  A5 5C
    BNE B07_CB66         ; $CB5E  D0 06
    JSR B07_C6C7         ; $CB60  20 C7 C6
    JSR B07_CBA7         ; $CB63  20 A7 CB
B07_CB66:
    LDY #$00             ; $CB66  A0 00
    LDA $48              ; $CB68  A5 48
    CMP #$04             ; $CB6A  C9 04
    BNE B07_CB76         ; $CB6C  D0 08
    LDA $5D              ; $CB6E  A5 5D
    CMP #$06             ; $CB70  C9 06
    BNE B07_CB76         ; $CB72  D0 02
    LDY #$80             ; $CB74  A0 80
B07_CB76:
    STY $A2              ; $CB76  84 A2
    LDA #$01             ; $CB78  A9 01
    STA $3C              ; $CB7A  85 3C
    LDA #$01             ; $CB7C  A9 01
    STA $36              ; $CB7E  85 36
    JSR B07_C962         ; $CB80  20 62 C9
    JSR B07_D34B         ; $CB83  20 4B D3
    LDA $0609            ; $CB86  AD 09 06
    BNE B07_CBA4         ; $CB89  D0 19
    JSR B07_EFBC         ; $CB8B  20 BC EF
    LDY $5C              ; $CB8E  A4 5C
    BEQ B07_CBA4         ; $CB90  F0 12
    LDY $5D              ; $CB92  A4 5D
    DEY                  ; $CB94  88
    BNE B07_CBA4         ; $CB95  D0 0D
    LDY $48              ; $CB97  A4 48
    DEY                  ; $CB99  88
    BNE B07_CBA4         ; $CB9A  D0 08
    LDA #$8C             ; $CB9C  A9 8C
    STA $BB              ; $CB9E  85 BB
    LDA #$1E             ; $CBA0  A9 1E
    STA $BA              ; $CBA2  85 BA
B07_CBA4:
    INC $34              ; $CBA4  E6 34
    RTS                  ; $CBA6  60
B07_CBA7:
    LDY #$00             ; $CBA7  A0 00
B07_CBA9:
    LDA $004F,Y          ; $CBA9  B9 4F 00
    STA $0095,Y          ; $CBAC  99 95 00
    INY                  ; $CBAF  C8
    CPY #$04             ; $CBB0  C0 04
    BCC B07_CBA9         ; $CBB2  90 F5
    LDA $0480            ; $CBB4  AD 80 04
    STA $99              ; $CBB7  85 99
    LDA $0460            ; $CBB9  AD 60 04
    STA $9A              ; $CBBC  85 9A
    RTS                  ; $CBBE  60
B07_CBBF:
    LDA $5C              ; $CBBF  A5 5C
    BEQ B07_CBCB         ; $CBC1  F0 08
    LDA $0609            ; $CBC3  AD 09 06
    BNE B07_CBCB         ; $CBC6  D0 03
    JSR B07_CF20         ; $CBC8  20 20 CF
B07_CBCB:
    INC $34              ; $CBCB  E6 34
    LDA #$10             ; $CBCD  A9 10
    STA $3D              ; $CBCF  85 3D
    LDA $0609            ; $CBD1  AD 09 06
    BEQ B07_CBDC         ; $CBD4  F0 06
    LDA #$00             ; $CBD6  A9 00
    STA $0609            ; $CBD8  8D 09 06
    RTS                  ; $CBDB  60
B07_CBDC:
    LDA $03E2            ; $CBDC  AD E2 03
    BEQ B07_CBE7         ; $CBDF  F0 06
    LDA #$00             ; $CBE1  A9 00
    STA $03E2            ; $CBE3  8D E2 03
    RTS                  ; $CBE6  60
B07_CBE7:
    JSR B07_CEC0         ; $CBE7  20 C0 CE
    LDA $5C              ; $CBEA  A5 5C
    BEQ B07_CC04         ; $CBEC  F0 16
    LDY $48              ; $CBEE  A4 48
    DEY                  ; $CBF0  88
    BNE B07_CBFC         ; $CBF1  D0 09
    LDY $5D              ; $CBF3  A4 5D
    BNE B07_CBFC         ; $CBF5  D0 05
    LDA #$6B             ; $CBF7  A9 6B
    JMP B07_CEF0         ; $CBF9  4C F0 CE
B07_CBFC:
    LDY $48              ; $CBFC  A4 48
    LDA $CC12,Y          ; $CBFE  B9 12 CC
    JMP B07_CEF0         ; $CC01  4C F0 CE
B07_CC04:
    LDY $48              ; $CC04  A4 48
    LDA $CC0C,Y          ; $CC06  B9 0C CC
    JMP B07_CEF0         ; $CC09  4C F0 CE
    .byte $53, $53, $53, $53, $57, $53, $5B, $5F, $6B, $5B, $6F, $6B ; $CC0C
B07_CC18:
    LDA $3D              ; $CC18  A5 3D
    BEQ B07_CC2A         ; $CC1A  F0 0E
    DEC $3D              ; $CC1C  C6 3D
    BNE B07_CC24         ; $CC1E  D0 04
    LDA #$00             ; $CC20  A9 00
    STA $36              ; $CC22  85 36
B07_CC24:
    JSR B07_DEE0         ; $CC24  20 E0 DE
    JMP B07_D042         ; $CC27  4C 42 D0
B07_CC2A:
    LDA $B5              ; $CC2A  A5 B5
    BEQ B07_CC31         ; $CC2C  F0 03
    JMP B07_CC9C         ; $CC2E  4C 9C CC
B07_CC31:
    LDA $1E              ; $CC31  A5 1E
    AND #$7F             ; $CC33  29 7F
    BNE B07_CC4A         ; $CC35  D0 13
    LDA $9E              ; $CC37  A5 9E
    CMP #$FF             ; $CC39  C9 FF
    BEQ B07_CC4A         ; $CC3B  F0 0D
    LDA $9D              ; $CC3D  A5 9D
    CLC                  ; $CC3F  18
    ADC #$01             ; $CC40  69 01
    STA $9D              ; $CC42  85 9D
    LDA $9E              ; $CC44  A5 9E
    ADC #$00             ; $CC46  69 00
    STA $9E              ; $CC48  85 9E
B07_CC4A:
    LDA $1E              ; $CC4A  A5 1E
    AND #$01             ; $CC4C  29 01
    BEQ B07_CC6F         ; $CC4E  F0 1F
    JSR B07_D02A         ; $CC50  20 2A D0
    BIT $A2              ; $CC53  24 A2
    BMI B07_CC69         ; $CC55  30 12
    JSR B07_CFF3         ; $CC57  20 F3 CF
    JSR B07_D000         ; $CC5A  20 00 D0
    JSR B07_E3F6         ; $CC5D  20 F6 E3
    JSR B07_D042         ; $CC60  20 42 D0
    JSR B07_DEBB         ; $CC63  20 BB DE
    JMP B07_D022         ; $CC66  4C 22 D0
B07_CC69:
    JSR B07_DEE0         ; $CC69  20 E0 DE
    JMP B07_D042         ; $CC6C  4C 42 D0
B07_CC6F:
    LDA $3F              ; $CC6F  A5 3F
    BNE B07_CC7E         ; $CC71  D0 0B
    LDA $03FC            ; $CC73  AD FC 03
    BNE B07_CC7E         ; $CC76  D0 06
    JSR B07_CF10         ; $CC78  20 10 CF
    JSR B07_CF42         ; $CC7B  20 42 CF
B07_CC7E:
    JSR B07_CF18         ; $CC7E  20 18 CF
    JSR B07_CF4A         ; $CC81  20 4A CF
    JSR B07_CFCD         ; $CC84  20 CD CF
    JSR B07_CFC5         ; $CC87  20 C5 CF
    JSR B07_D042         ; $CC8A  20 42 D0
    JSR B07_DEE0         ; $CC8D  20 E0 DE
    JSR B07_D04D         ; $CC90  20 4D D0
    JSR B07_E145         ; $CC93  20 45 E1
    LDA #$00             ; $CC96  A9 00
    STA $03D5            ; $CC98  8D D5 03
    RTS                  ; $CC9B  60
B07_CC9C:
    LDA $1E              ; $CC9C  A5 1E
    AND #$01             ; $CC9E  29 01
    BEQ B07_CCAB         ; $CCA0  F0 09
    JSR B07_D03A         ; $CCA2  20 3A D0
    JSR B07_D042         ; $CCA5  20 42 D0
    JMP B07_DEE0         ; $CCA8  4C E0 DE
B07_CCAB:
    LDA $B5              ; $CCAB  A5 B5
    AND #$7F             ; $CCAD  29 7F
    CMP #$0D             ; $CCAF  C9 0D
    BEQ B07_CCB7         ; $CCB1  F0 04
    CMP #$10             ; $CCB3  C9 10
    BNE B07_CCBD         ; $CCB5  D0 06
B07_CCB7:
    JSR B07_CFCD         ; $CCB7  20 CD CF
    JMP B07_CCC4         ; $CCBA  4C C4 CC
B07_CCBD:
    CMP #$06             ; $CCBD  C9 06
    BNE B07_CCC4         ; $CCBF  D0 03
    JSR B07_CFD5         ; $CCC1  20 D5 CF
B07_CCC4:
    JSR B07_D042         ; $CCC4  20 42 D0
    JSR B07_D04D         ; $CCC7  20 4D D0
    JMP B07_DEE0         ; $CCCA  4C E0 DE
B07_CCCD:
    LDA #$C2             ; $CCCD  A9 C2
    STA $0450            ; $CCCF  8D 50 04
    LDA #$1F             ; $CCD2  A9 1F
    JSR B07_CE56         ; $CCD4  20 56 CE
    LDY $67              ; $CCD7  A4 67
    LDA #$00             ; $CCD9  A9 00
    STA $00A8,Y          ; $CCDB  99 A8 00
    STA $0073,Y          ; $CCDE  99 73 00
    STA $0540            ; $CCE1  8D 40 05
    STA $89              ; $CCE4  85 89
    STA $B0              ; $CCE6  85 B0
    STA $5E              ; $CCE8  85 5E
    STA $7E              ; $CCEA  85 7E
    STA $88              ; $CCEC  85 88
    STA $36              ; $CCEE  85 36
    STA $8C              ; $CCF0  85 8C
    LDA #$01             ; $CCF2  A9 01
    STA $0617            ; $CCF4  8D 17 06
    JSR B07_EF39         ; $CCF7  20 39 EF
    JMP B07_CDF1         ; $CCFA  4C F1 CD
B07_CCFD:
    JSR B07_C962         ; $CCFD  20 62 C9
    LDX #$0C             ; $CD00  A2 0C
    JSR B07_C982         ; $CD02  20 82 C9
    LDA #$08             ; $CD05  A9 08
    STA $34              ; $CD07  85 34
    RTS                  ; $CD09  60
B07_CD0A:
    LDA #$01             ; $CD0A  A9 01
    STA $36              ; $CD0C  85 36
    STA $03D9            ; $CD0E  8D D9 03
    INC $9D              ; $CD11  E6 9D
    BNE B07_CD54         ; $CD13  D0 3F
    INC $9E              ; $CD15  E6 9E
    BEQ B07_CD24         ; $CD17  F0 0B
    LDA $9E              ; $CD19  A5 9E
    CMP #$FF             ; $CD1B  C9 FF
    BNE B07_CD54         ; $CD1D  D0 35
    LDA #$8B             ; $CD1F  A9 8B
    JMP B07_CEF0         ; $CD21  4C F0 CE
B07_CD24:
    DEC $46              ; $CD24  C6 46
    BNE B07_CD2B         ; $CD26  D0 03
    JMP B07_CD67         ; $CD28  4C 67 CD
B07_CD2B:
    JSR B07_C962         ; $CD2B  20 62 C9
    LDA #$06             ; $CD2E  A9 06
    JSR B07_CA58         ; $CD30  20 58 CA
    LDA #$07             ; $CD33  A9 07
    JSR B07_CA58         ; $CD35  20 58 CA
    LDA #$49             ; $CD38  A9 49
    STA $0400            ; $CD3A  8D 00 04
    LDA #$60             ; $CD3D  A9 60
    STA $0460            ; $CD3F  8D 60 04
    LDA #$60             ; $CD42  A9 60
    STA $0480            ; $CD44  8D 80 04
    LDA #$02             ; $CD47  A9 02
    STA $0450            ; $CD49  8D 50 04
    LDA #$00             ; $CD4C  A9 00
    STA $26              ; $CD4E  85 26
    LDA #$0A             ; $CD50  A9 0A
    STA $34              ; $CD52  85 34
B07_CD54:
    RTS                  ; $CD54  60
B07_CD55:
    LDA #$01             ; $CD55  A9 01
    STA $03D9            ; $CD57  8D D9 03
    LDA $30              ; $CD5A  A5 30
    AND #$10             ; $CD5C  29 10
    BEQ B07_CD9D         ; $CD5E  F0 3D
    LDA $26              ; $CD60  A5 26
    LSR A                ; $CD62  4A
    AND #$01             ; $CD63  29 01
    BEQ B07_CD70         ; $CD65  F0 09
B07_CD67:
    LDA #$00             ; $CD67  A9 00
    STA $34              ; $CD69  85 34
    STA $2E              ; $CD6B  85 2E
    JMP B07_C6A3         ; $CD6D  4C A3 C6
B07_CD70:
    LDA $48              ; $CD70  A5 48
    STA $2E              ; $CD72  85 2E
    JSR B07_C6D6         ; $CD74  20 D6 C6
    LDA $2E              ; $CD77  A5 2E
    STA $48              ; $CD79  85 48
    STA $5D              ; $CD7B  85 5D
    CMP #$05             ; $CD7D  C9 05
    BNE B07_CD88         ; $CD7F  D0 07
    LDX #$01             ; $CD81  A2 01
    STX $5C              ; $CD83  86 5C
    DEX                  ; $CD85  CA
    STX $5D              ; $CD86  86 5D
B07_CD88:
    LDA #$80             ; $CD88  A9 80
    STA $77              ; $CD8A  85 77
    STA $78              ; $CD8C  85 78
    STA $79              ; $CD8E  85 79
    STA $7A              ; $CD90  85 7A
    LDA #$02             ; $CD92  A9 02
    STA $34              ; $CD94  85 34
    LDA #$00             ; $CD96  A9 00
    STA $2E              ; $CD98  85 2E
    INC $36              ; $CD9A  E6 36
    RTS                  ; $CD9C  60
B07_CD9D:
    LDA $30              ; $CD9D  A5 30
    AND #$20             ; $CD9F  29 20
    BEQ B07_CDA5         ; $CDA1  F0 02
    INC $26              ; $CDA3  E6 26
B07_CDA5:
    LDA $26              ; $CDA5  A5 26
    LSR A                ; $CDA7  4A
    AND #$01             ; $CDA8  29 01
    TAX                  ; $CDAA  AA
    LDA $CDB2,X          ; $CDAB  BD B2 CD
    STA $0460            ; $CDAE  8D 60 04
    RTS                  ; $CDB1  60
    .byte $70, $88 ; $CDB2
B07_CDB4:
    LDA $F5              ; $CDB4  A5 F5
    STA $CB              ; $CDB6  85 CB
B07_CDB8:
    RTS                  ; $CDB8  60
B07_CDB9:
    LDA $1E              ; $CDB9  A5 1E
    AND #$01             ; $CDBB  29 01
    BNE B07_CDB4         ; $CDBD  D0 F5
    LDA $24              ; $CDBF  A5 24
    ORA $03ED            ; $CDC1  0D ED 03
    ORA $36              ; $CDC4  05 36
    ORA $20              ; $CDC6  05 20
    ORA $3F              ; $CDC8  05 3F
    ORA $3D              ; $CDCA  05 3D
    ORA $B5              ; $CDCC  05 B5
    ORA $D2              ; $CDCE  05 D2
    BNE B07_CDB8         ; $CDD0  D0 E6
    LDA $0510            ; $CDD2  AD 10 05
    CMP #$16             ; $CDD5  C9 16
    BEQ B07_CDB8         ; $CDD7  F0 DF
    LDY $67              ; $CDD9  A4 67
    LDA $0077,Y          ; $CDDB  B9 77 00
    BEQ B07_CDB8         ; $CDDE  F0 D8
    LDA $F5              ; $CDE0  A5 F5
    ORA $CB              ; $CDE2  05 CB
    LDY $35              ; $CDE4  A4 35
    BNE B07_CE06         ; $CDE6  D0 1E
    AND #$10             ; $CDE8  29 10
    BEQ B07_CE55         ; $CDEA  F0 69
    LDA #$3E             ; $CDEC  A9 3E
    JSR B07_CEF0         ; $CDEE  20 F0 CE
B07_CDF1:
    LDY #$00             ; $CDF1  A0 00
    STY $D0              ; $CDF3  84 D0
    STY $0400            ; $CDF5  8C 00 04
    INY                  ; $CDF8  C8
    STY $35              ; $CDF9  84 35
    LDA $FF              ; $CDFB  A5 FF
    STA $A1              ; $CDFD  85 A1
    LDA $0400            ; $CDFF  AD 00 04
    STA $0550            ; $CE02  8D 50 05
    RTS                  ; $CE05  60
B07_CE06:
    AND #$10             ; $CE06  29 10
    BEQ B07_CE55         ; $CE08  F0 4B
    LDA $5B              ; $CE0A  A5 5B
    BEQ B07_CE19         ; $CE0C  F0 0B
    LDY $67              ; $CE0E  A4 67
    LDA $0073,Y          ; $CE10  B9 73 00
    BNE B07_CE19         ; $CE13  D0 04
    LDA #$00             ; $CE15  A9 00
    STA $5B              ; $CE17  85 5B
B07_CE19:
    LDA #$00             ; $CE19  A9 00
    STA $35              ; $CE1B  85 35
    STA $94              ; $CE1D  85 94
    LDA $0550            ; $CE1F  AD 50 05
    STA $0400            ; $CE22  8D 00 04
    JSR B07_C962         ; $CE25  20 62 C9
    LDA $27              ; $CE28  A5 27
    JSR B07_CE6F         ; $CE2A  20 6F CE
    LDA $28              ; $CE2D  A5 28
    JSR B07_CE8A         ; $CE2F  20 8A CE
    LDA $34              ; $CE32  A5 34
    CMP #$07             ; $CE34  C9 07
    BEQ B07_CE40         ; $CE36  F0 08
    LDA #$01             ; $CE38  A9 01
    STA $0609            ; $CE3A  8D 09 06
    STA $03D5            ; $CE3D  8D D5 03
B07_CE40:
    LDA #$03             ; $CE40  A9 03
    SEC                  ; $CE42  38
    SBC $0617            ; $CE43  ED 17 06
    STA $34              ; $CE46  85 34
    LDA #$00             ; $CE48  A9 00
    STA $0617            ; $CE4A  8D 17 06
    LDA $A1              ; $CE4D  A5 A1
    STA $FF              ; $CE4F  85 FF
    LDA $4F              ; $CE51  A5 4F
    STA $FD              ; $CE53  85 FD
B07_CE55:
    RTS                  ; $CE55  60
B07_CE56:
    SEC                  ; $CE56  38
    ROR $F0              ; $CE57  66 F0
    STA $9FFF            ; $CE59  8D FF 9F
    LSR A                ; $CE5C  4A
    STA $9FFF            ; $CE5D  8D FF 9F
    LSR A                ; $CE60  4A
    STA $9FFF            ; $CE61  8D FF 9F
    LSR A                ; $CE64  4A
    STA $9FFF            ; $CE65  8D FF 9F
    LSR A                ; $CE68  4A
    STA $9FFF            ; $CE69  8D FF 9F
    ASL $F0              ; $CE6C  06 F0
    RTS                  ; $CE6E  60
B07_CE6F:
    STA $27              ; $CE6F  85 27
    SEC                  ; $CE71  38
    ROR $F0              ; $CE72  66 F0
    STA $BFFF            ; $CE74  8D FF BF
    LSR A                ; $CE77  4A
    STA $BFFF            ; $CE78  8D FF BF
    LSR A                ; $CE7B  4A
    STA $BFFF            ; $CE7C  8D FF BF
    LSR A                ; $CE7F  4A
    STA $BFFF            ; $CE80  8D FF BF
    LSR A                ; $CE83  4A
    STA $BFFF            ; $CE84  8D FF BF
    ASL $F0              ; $CE87  06 F0
    RTS                  ; $CE89  60
B07_CE8A:
    STA $28              ; $CE8A  85 28
    SEC                  ; $CE8C  38
    ROR $F0              ; $CE8D  66 F0
    STA $DFFF            ; $CE8F  8D FF DF
    LSR A                ; $CE92  4A
    STA $DFFF            ; $CE93  8D FF DF
    LSR A                ; $CE96  4A
    STA $DFFF            ; $CE97  8D FF DF
    LSR A                ; $CE9A  4A
    STA $DFFF            ; $CE9B  8D FF DF
    LSR A                ; $CE9E  4A
    STA $DFFF            ; $CE9F  8D FF DF
    ASL $F0              ; $CEA2  06 F0
    RTS                  ; $CEA4  60
B07_CEA5:
    STA $21              ; $CEA5  85 21
B07_CEA7:
    SEC                  ; $CEA7  38
    ROR $F0              ; $CEA8  66 F0
    STA $FFFF            ; $CEAA  8D FF FF
    LSR A                ; $CEAD  4A
    STA $FFFF            ; $CEAE  8D FF FF
    LSR A                ; $CEB1  4A
    STA $FFFF            ; $CEB2  8D FF FF
    LSR A                ; $CEB5  4A
    STA $FFFF            ; $CEB6  8D FF FF
    LSR A                ; $CEB9  4A
    STA $FFFF            ; $CEBA  8D FF FF
    ASL $F0              ; $CEBD  06 F0
B07_CEBF:
    RTS                  ; $CEBF  60
B07_CEC0:
    LDA $8000            ; $CEC0  AD 00 80
    STA $59              ; $CEC3  85 59
    LDA #$00             ; $CEC5  A9 00
    JSR B07_CEA7         ; $CEC7  20 A7 CE
    JSR $9016            ; $CECA  20 16 90
    JMP B07_CF0B         ; $CECD  4C 0B CF
B07_CED0:
    LDA $21              ; $CED0  A5 21
    JMP B07_CEA7         ; $CED2  4C A7 CE
B07_CED5:
    LDA $F0              ; $CED5  A5 F0
    BMI B07_CEBF         ; $CED7  30 E6
    LDA #$00             ; $CED9  A9 00
    JSR B07_CEA7         ; $CEDB  20 A7 CE
    LDA $2F              ; $CEDE  A5 2F
    BMI B07_CEED         ; $CEE0  30 0B
    LDA #$80             ; $CEE2  A9 80
    STA $2F              ; $CEE4  85 2F
    JSR $8644            ; $CEE6  20 44 86
    LDA #$00             ; $CEE9  A9 00
    STA $2F              ; $CEEB  85 2F
B07_CEED:
    JMP B07_CED0         ; $CEED  4C D0 CE
B07_CEF0:
    STA $CF              ; $CEF0  85 CF
    LDA $8000            ; $CEF2  AD 00 80
    STA $59              ; $CEF5  85 59
    LDA #$00             ; $CEF7  A9 00
    JSR B07_CEA7         ; $CEF9  20 A7 CE
    BIT $2F              ; $CEFC  24 2F
    BMI B07_CF0B         ; $CEFE  30 0B
    LDA #$80             ; $CF00  A9 80
    STA $2F              ; $CF02  85 2F
    LDA $CF              ; $CF04  A5 CF
    JSR $9057            ; $CF06  20 57 90
    ASL $2F              ; $CF09  06 2F
B07_CF0B:
    LDA $59              ; $CF0B  A5 59
    JMP B07_CEA7         ; $CF0D  4C A7 CE
B07_CF10:
    LDA #$06             ; $CF10  A9 06
    JSR B07_CEA5         ; $CF12  20 A5 CE
    JMP $80F6            ; $CF15  4C F6 80
B07_CF18:
    LDA #$05             ; $CF18  A9 05
    JSR B07_CEA5         ; $CF1A  20 A5 CE
    JMP $8001            ; $CF1D  4C 01 80
B07_CF20:
    LDA #$06             ; $CF20  A9 06
    JSR B07_CEA5         ; $CF22  20 A5 CE
    JMP $85CC            ; $CF25  4C CC 85
    .byte $A9, $05, $20, $A7, $CE, $20, $77, $80, $4C, $D0, $CE ; $CF28
    LDA #$06             ; $CF33  A9 06
    JSR B07_CEA5         ; $CF35  20 A5 CE
    JSR $BD64            ; $CF38  20 64 BD
    ROL $10              ; $CF3B  26 10
    LDA #$05             ; $CF3D  A9 05
    JMP B07_CEA5         ; $CF3F  4C A5 CE
B07_CF42:
    LDA #$04             ; $CF42  A9 04
    JSR B07_CEA5         ; $CF44  20 A5 CE
    JMP $AB94            ; $CF47  4C 94 AB
B07_CF4A:
    LDA #$04             ; $CF4A  A9 04
    JSR B07_CEA5         ; $CF4C  20 A5 CE
    JMP $B554            ; $CF4F  4C 54 B5
    .byte $A9, $04, $20, $A7, $CE, $20, $BE, $AC, $4C, $D0, $CE, $A9, $06, $20, $A5, $CE ; $CF52
    .byte $20, $C5, $BB, $A9, $05, $4C, $A5, $CE, $A9, $06, $20, $A5, $CE, $20, $29, $BD ; $CF62
    .byte $4C, $65, $CF, $A9, $05, $20, $A7, $CE, $20, $E6, $BA, $85, $9C, $4C, $D0, $CE ; $CF72
    .byte $85, $11, $A9, $05, $20, $A5, $CE, $A5, $11, $20, $01, $81, $26, $11, $84, $10 ; $CF82
    .byte $A9, $06, $4C, $A5, $CE ; $CF92
B07_CF97:
    LDA #$04             ; $CF97  A9 04
    JSR B07_CEA7         ; $CF99  20 A7 CE
    JSR $9712            ; $CF9C  20 12 97
    JMP B07_CED0         ; $CF9F  4C D0 CE
    .byte $A9, $04, $20, $A7, $CE, $20, $F3, $96, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE ; $CFA2
    .byte $20, $1D, $97, $4C, $D0, $CE, $A9, $04, $20, $A5, $CE, $20, $9A, $AA, $A9, $05 ; $CFB2
    .byte $4C, $A5, $CE ; $CFC2
B07_CFC5:
    LDA #$06             ; $CFC5  A9 06
    JSR B07_CEA5         ; $CFC7  20 A5 CE
    JMP $9535            ; $CFCA  4C 35 95
B07_CFCD:
    LDA #$06             ; $CFCD  A9 06
    JSR B07_CEA5         ; $CFCF  20 A5 CE
    JMP $8005            ; $CFD2  4C 05 80
B07_CFD5:
    LDA #$06             ; $CFD5  A9 06
    JSR B07_CEA5         ; $CFD7  20 A5 CE
    JMP $8001            ; $CFDA  4C 01 80
    .byte $A9, $06, $20, $A7, $CE, $20, $05, $80, $4C, $D0, $CE, $A9, $06, $20, $A7, $CE ; $CFDD
    .byte $20, $01, $80, $4C, $D0, $CE ; $CFED
B07_CFF3:
    LDA $3F              ; $CFF3  A5 3F
    BEQ B07_CFF8         ; $CFF5  F0 01
    RTS                  ; $CFF7  60
B07_CFF8:
    LDA #$01             ; $CFF8  A9 01
    JSR B07_CEA5         ; $CFFA  20 A5 CE
    JMP B07_D7B9         ; $CFFD  4C B9 D7
B07_D000:
    LDA #$01             ; $D000  A9 01
    JSR B07_CEA5         ; $D002  20 A5 CE
    JMP B07_DC6E         ; $D005  4C 6E DC
    .byte $A9, $01, $20, $A5, $CE, $20, $6E, $DC, $A9, $06, $4C, $A5, $CE, $A9, $01, $20 ; $D008
    .byte $A5, $CE, $20, $B9, $D7, $A9, $06, $4C, $A5, $CE ; $D018
B07_D022:
    LDA #$04             ; $D022  A9 04
    JSR B07_CEA5         ; $D024  20 A5 CE
    JMP $A9D9            ; $D027  4C D9 A9
B07_D02A:
    LDA #$04             ; $D02A  A9 04
    JSR B07_CEA5         ; $D02C  20 A5 CE
    JMP $9745            ; $D02F  4C 45 97
    .byte $A9, $06, $20, $A5, $CE, $4C, $98, $A8 ; $D032
B07_D03A:
    LDA #$06             ; $D03A  A9 06
    JSR B07_CEA5         ; $D03C  20 A5 CE
    JMP $9F47            ; $D03F  4C 47 9F
B07_D042:
    LDA #$00             ; $D042  A9 00
    JSR B07_CEA7         ; $D044  20 A7 CE
    JSR $8001            ; $D047  20 01 80
    JMP B07_CED0         ; $D04A  4C D0 CE
B07_D04D:
    LDA #$00             ; $D04D  A9 00
    JSR B07_CEA7         ; $D04F  20 A7 CE
    JSR $8055            ; $D052  20 55 80
    JMP B07_CED0         ; $D055  4C D0 CE
    .byte $48, $A9, $05, $20, $A5, $CE, $68, $20, $70, $B1, $A9, $06, $4C, $A5, $CE, $AD ; $D058
    .byte $00, $80, $48, $20, $72, $D0, $68, $4C, $A7, $CE, $A9, $04, $20, $A5, $CE, $20 ; $D068
    .byte $45, $97, $A9, $05, $20, $A5, $CE, $20, $01, $80, $A9, $06, $20, $A5, $CE, $20 ; $D078
    .byte $CD, $CF, $4C, $45, $E1, $A9, $04, $20, $A5, $CE, $20, $45, $97, $A9, $06, $20 ; $D088
    .byte $A5, $CE, $20, $CD, $CF, $20, $45, $E1, $A9, $03, $4C, $A5, $CE, $A9, $04, $20 ; $D098
    .byte $A7, $CE, $20, $35, $9F, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE, $20, $35, $9F ; $D0A8
    .byte $4C, $D0, $CE, $A9, $04, $20, $A7, $CE, $20, $57, $A6, $4C, $D0, $CE, $A9, $04 ; $D0B8
    .byte $20, $A7, $CE, $20, $9F, $A6, $4C, $D0, $CE ; $D0C8
B07_D0D1:
    LDA #$04             ; $D0D1  A9 04
    JSR B07_CEA7         ; $D0D3  20 A7 CE
    JSR $9662            ; $D0D6  20 62 96
    JMP B07_CED0         ; $D0D9  4C D0 CE
    .byte $A9, $04, $20, $A7, $CE, $20, $83, $A9, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE ; $D0DC
    .byte $20, $F0, $A5, $4C, $D0, $CE, $48, $A9, $04, $20, $A7, $CE, $68, $20, $AF, $A6 ; $D0EC
    .byte $08, $20, $D0, $CE, $28, $60, $A2, $00 ; $D0FC
    PHA                  ; $D104  48
    LDA #$06             ; $D105  A9 06
    JSR B07_CEA7         ; $D107  20 A7 CE
    PLA                  ; $D10A  68
    JSR $8081            ; $D10B  20 81 80
    JMP B07_CED0         ; $D10E  4C D0 CE
    PHA                  ; $D111  48
    LDA #$06             ; $D112  A9 06
    JSR B07_CEA7         ; $D114  20 A7 CE
    PLA                  ; $D117  68
    JSR $8272            ; $D118  20 72 82
    PHP                  ; $D11B  08
    JSR B07_CED0         ; $D11C  20 D0 CE
    PLP                  ; $D11F  28
    RTS                  ; $D120  60
    .byte $48, $A9, $05, $20, $A7, $CE, $68, $20, $81, $83, $4C, $D0, $CE ; $D121
B07_D12E:
    LDA #$03             ; $D12E  A9 03
    JSR B07_CEA5         ; $D130  20 A5 CE
    JMP $A91C            ; $D133  4C 1C A9
    .byte $A9, $06, $20, $A7, $CE, $20, $0E, $FE, $4C, $D0, $CE, $A9, $02, $20, $A5, $CE ; $D136
    .byte $4C, $B2, $B5, $A9, $02, $20, $A5, $CE, $4C, $BE, $B5, $AD, $00, $80, $48, $20 ; $D146
    .byte $5C, $D1, $68, $4C, $A7, $CE, $A9, $03, $20, $A7, $CE, $A9, $00, $85, $D0, $20 ; $D156
    .byte $1C, $A9, $20, $9B, $CA, $20, $B3, $C4, $20, $6C, $C2, $A5, $D0, $C9, $06, $90 ; $D166
    .byte $EE, $A5, $67, $0A, $AA, $48, $BD, $C1, $D1, $20, $58, $CA, $68, $AA, $BD, $C2 ; $D176
    .byte $D1, $20, $2E, $F7, $A9, $00, $85, $D0, $85, $94, $8D, $96, $05, $A9, $01, $85 ; $D186
    .byte $9F, $85, $8E, $20, $95, $B6, $20, $D1, $AD, $4C, $D0, $CE, $AD, $00, $80, $48 ; $D196
    .byte $20, $AD, $D1, $68, $4C, $A7, $CE, $A9, $03, $20, $A7, $CE, $A5, $94, $C9, $03 ; $D1A6
    .byte $B0, $03, $20, $95, $B6, $20, $D1, $AD, $4C, $D0, $CE, $03, $00, $04, $01, $05 ; $D1B6
    .byte $02, $0C, $03, $20, $A7, $CE, $20, $82, $C9, $4C, $D0, $CE, $A9, $03, $20, $A5 ; $D1C6
    .byte $CE, $4C, $E2, $BA, $A9, $03, $20, $A5, $CE, $4C, $F7, $BA, $A0, $00, $4C, $00 ; $D1D6
    .byte $D2, $A0, $01, $4C, $00, $D2, $A0, $02, $4C, $00, $D2, $A0, $03, $4C, $00, $D2 ; $D1E6
    .byte $A0, $04, $4C, $00, $D2, $A0, $05, $4C, $00, $D2, $A9, $03, $20, $A7, $CE, $20 ; $D1F6
    .byte $0B, $D2, $4C, $D0, $CE, $98, $20, $02, $C7 ; $D206
SWITCHABLE_BANK_HANDLERS: ; fixed-length little-endian CPU data pointers
    .word $BBC8, $BBF5, $BC78, $BC1E, $BC1E, $BC88 ; $D20F
    .byte $85, $10, $A9, $01, $20, $A5, $CE, $A6, $10, $20, $82, $C9, $A9, $03, $4C, $A5 ; $D21B
    .byte $CE ; $D22B
B07_D22C:
    STA $10              ; $D22C  85 10
    LDA #$00             ; $D22E  A9 00
    JSR B07_CEA5         ; $D230  20 A5 CE
    LDX $10              ; $D233  A6 10
    JSR B07_C982         ; $D235  20 82 C9
    LDA #$07             ; $D238  A9 07
    JMP B07_CEA5         ; $D23A  4C A5 CE
B07_D23D:
    LDA #$03             ; $D23D  A9 03
    JSR B07_CEA7         ; $D23F  20 A7 CE
    JSR $BCFB            ; $D242  20 FB BC
    JMP B07_CED0         ; $D245  4C D0 CE
    .byte $A9, $06, $20, $A5, $CE, $20, $01, $80, $A9, $03, $4C, $A5, $CE, $A9, $04, $20 ; $D248
    .byte $A5, $CE, $20, $62, $96, $A9, $03, $4C, $A5, $CE, $A9, $01, $20, $A5, $CE, $20 ; $D258
    .byte $7A, $BE, $A9, $03, $4C, $A5, $CE, $A9, $01, $20, $A5, $CE, $20, $E2, $BE, $A9 ; $D268
    .byte $03, $4C, $A5, $CE, $A9, $01, $20, $A5, $CE, $20, $B7, $BE, $A9, $03, $4C, $A5 ; $D278
    .byte $CE ; $D288
B07_D289:
    LDA #$04             ; $D289  A9 04
    JSR B07_CEA5         ; $D28B  20 A5 CE
    JMP $BB69            ; $D28E  4C 69 BB
    .byte $A9, $02, $20, $A5, $CE, $98, $20, $B7, $B8, $A9, $03, $85, $21, $4C, $D0, $CE ; $D291
    .byte $A9, $02, $20, $A5, $CE, $20, $18, $B9, $A9, $03, $85, $21, $4C, $D0, $CE, $A9 ; $D2A1
    .byte $02, $20, $A7, $CE, $4C, $59, $BD, $A9, $02, $20, $A7, $CE, $4C, $59, $BD, $A9 ; $D2B1
    .byte $02, $20, $A7, $CE, $4C, $6C, $BD, $A9, $02, $20, $A7, $CE, $4C, $20, $BE ; $D2C1
B07_D2D0:
    LDA #$00             ; $D2D0  A9 00
    STA $03D6            ; $D2D2  8D D6 03
    INC $34              ; $D2D5  E6 34
    JSR B07_EF3D         ; $D2D7  20 3D EF
    JSR B07_D0D1         ; $D2DA  20 D1 D0
    LDA #$1F             ; $D2DD  A9 1F
    JSR B07_CE56         ; $D2DF  20 56 CE
    LDA $5C              ; $D2E2  A5 5C
    BNE B07_D302         ; $D2E4  D0 1C
    LDA $5D              ; $D2E6  A5 5D
    ASL A                ; $D2E8  0A
    ASL A                ; $D2E9  0A
    TAY                  ; $D2EA  A8
    LDA $D679,Y          ; $D2EB  B9 79 D6
    STA $4F              ; $D2EE  85 4F
    LDA $D67A,Y          ; $D2F0  B9 7A D6
    STA $50              ; $D2F3  85 50
    LDA $D67B,Y          ; $D2F5  B9 7B D6
    STA $51              ; $D2F8  85 51
    LDA $D67C,Y          ; $D2FA  B9 7C D6
    STA $52              ; $D2FD  85 52
    JMP B07_D33E         ; $D2FF  4C 3E D3
B07_D302:
    LDA $48              ; $D302  A5 48
    CMP #$05             ; $D304  C9 05
    BNE B07_D30C         ; $D306  D0 04
    LDA #$00             ; $D308  A9 00
    STA $5D              ; $D30A  85 5D
B07_D30C:
    LDA $48              ; $D30C  A5 48
    ASL A                ; $D30E  0A
    TAY                  ; $D30F  A8
    LDA $D68D,Y          ; $D310  B9 8D D6
    STA $00              ; $D313  85 00
    LDA $D68E,Y          ; $D315  B9 8E D6
    STA $01              ; $D318  85 01
    LDA $5D              ; $D31A  A5 5D
    ASL A                ; $D31C  0A
    ASL A                ; $D31D  0A
    TAY                  ; $D31E  A8
    LDA ($00),Y          ; $D31F  B1 00
    STA $4F              ; $D321  85 4F
    INY                  ; $D323  C8
    LDA ($00),Y          ; $D324  B1 00
    STA $50              ; $D326  85 50
    INY                  ; $D328  C8
    LDA ($00),Y          ; $D329  B1 00
    STA $51              ; $D32B  85 51
    INY                  ; $D32D  C8
    LDA ($00),Y          ; $D32E  B1 00
    STA $52              ; $D330  85 52
    LDA $48              ; $D332  A5 48
    CMP #$05             ; $D334  C9 05
    BEQ B07_D33E         ; $D336  F0 06
    STA $5D              ; $D338  85 5D
    LDA #$00             ; $D33A  A9 00
    STA $5C              ; $D33C  85 5C
B07_D33E:
    LDA $48              ; $D33E  A5 48
    CMP #$02             ; $D340  C9 02
    BNE B07_D34A         ; $D342  D0 06
    JSR B07_F18D         ; $D344  20 8D F1
    JSR B07_CF97         ; $D347  20 97 CF
B07_D34A:
    RTS                  ; $D34A  60
B07_D34B:
    LDA #$01             ; $D34B  A9 01
    JSR B07_CEA7         ; $D34D  20 A7 CE
    LDA $5C              ; $D350  A5 5C
    BNE B07_D367         ; $D352  D0 13
    JMP B07_D425         ; $D354  4C 25 D4
B07_D357:
    CLC                  ; $D357  18
    ADC #$02             ; $D358  69 02
    ADC $5D              ; $D35A  65 5D
    JMP B07_D37F         ; $D35C  4C 7F D3
B07_D35F:
    LDA #$0C             ; $D35F  A9 0C
    BNE B07_D37F         ; $D361  D0 1C
    LDA #$01             ; $D363  A9 01
    BNE B07_D37F         ; $D365  D0 18
B07_D367:
    LDA #$17             ; $D367  A9 17
    STA $A3              ; $D369  85 A3
    LDA $48              ; $D36B  A5 48
    CMP #$04             ; $D36D  C9 04
    BEQ B07_D357         ; $D36F  F0 E6
    CMP #$03             ; $D371  C9 03
    BNE B07_D37F         ; $D373  D0 0A
    LDA $5D              ; $D375  A5 5D
    BEQ B07_D37F         ; $D377  F0 06
    CMP #$11             ; $D379  C9 11
    BEQ B07_D35F         ; $D37B  F0 E2
    LDA $48              ; $D37D  A5 48
B07_D37F:
    ASL A                ; $D37F  0A
    TAY                  ; $D380  A8
    LDA $8015,Y          ; $D381  B9 15 80
    STA $4B              ; $D384  85 4B
    LDA $8016,Y          ; $D386  B9 16 80
    STA $4C              ; $D389  85 4C
    LDA $8033,Y          ; $D38B  B9 33 80
    STA $4D              ; $D38E  85 4D
    LDA $8034,Y          ; $D390  B9 34 80
    STA $4E              ; $D393  85 4E
    LDA $48              ; $D395  A5 48
    ASL A                ; $D397  0A
    TAY                  ; $D398  A8
    LDA $805D,Y          ; $D399  B9 5D 80
    STA $60              ; $D39C  85 60
    LDA $805E,Y          ; $D39E  B9 5E 80
    STA $61              ; $D3A1  85 61
    LDA $F49E,Y          ; $D3A3  B9 9E F4
    STA $00              ; $D3A6  85 00
    LDA $F49F,Y          ; $D3A8  B9 9F F4
    STA $01              ; $D3AB  85 01
    LDA $5D              ; $D3AD  A5 5D
    ASL A                ; $D3AF  0A
    TAY                  ; $D3B0  A8
    LDA ($00),Y          ; $D3B1  B1 00
    STA $49              ; $D3B3  85 49
    INY                  ; $D3B5  C8
    LDA ($00),Y          ; $D3B6  B1 00
    STA $4A              ; $D3B8  85 4A
    LDA $48              ; $D3BA  A5 48
    ASL A                ; $D3BC  0A
    TAY                  ; $D3BD  A8
    LDA $D63B,Y          ; $D3BE  B9 3B D6
    STA $00              ; $D3C1  85 00
    LDA $D63C,Y          ; $D3C3  B9 3C D6
    STA $01              ; $D3C6  85 01
    LDY $5D              ; $D3C8  A4 5D
    LDA ($00),Y          ; $D3CA  B1 00
    JSR B07_F718         ; $D3CC  20 18 F7
    JSR B07_D548         ; $D3CF  20 48 D5
    LDA $48              ; $D3D2  A5 48
    CMP #$05             ; $D3D4  C9 05
    BNE B07_D3E8         ; $D3D6  D0 10
    LDA $5D              ; $D3D8  A5 5D
    CMP #$03             ; $D3DA  C9 03
    BNE B07_D3E8         ; $D3DC  D0 0A
    LDA $0609            ; $D3DE  AD 09 06
    BNE B07_D3E8         ; $D3E1  D0 05
    LDA #$20             ; $D3E3  A9 20
    JSR B07_F72E         ; $D3E5  20 2E F7
B07_D3E8:
    JSR B07_D574         ; $D3E8  20 74 D5
    LDA $0609            ; $D3EB  AD 09 06
    BNE B07_D3F3         ; $D3EE  D0 03
    JSR B07_D551         ; $D3F0  20 51 D5
B07_D3F3:
    LDA $58              ; $D3F3  A5 58
    BEQ B07_D402         ; $D3F5  F0 0B
    LDA $57              ; $D3F7  A5 57
    CLC                  ; $D3F9  18
    ADC #$45             ; $D3FA  69 45
    JSR B07_F72E         ; $D3FC  20 2E F7
    JMP B07_D416         ; $D3FF  4C 16 D4
B07_D402:
    JSR B07_F75E         ; $D402  20 5E F7
    LDA $5E              ; $D405  A5 5E
    CMP #$03             ; $D407  C9 03
    BNE B07_D416         ; $D409  D0 0B
    LDA $7B              ; $D40B  A5 7B
    CMP #$03             ; $D40D  C9 03
    BNE B07_D416         ; $D40F  D0 05
    LDA #$11             ; $D411  A9 11
    JSR B07_F72E         ; $D413  20 2E F7
B07_D416:
    JSR B07_D536         ; $D416  20 36 D5
    JSR B07_DEE0         ; $D419  20 E0 DE
    LDA #$FF             ; $D41C  A9 FF
    STA $A4              ; $D41E  85 A4
    LDA #$01             ; $D420  A9 01
    STA $65              ; $D422  85 65
    RTS                  ; $D424  60
B07_D425:
    LDA #$00             ; $D425  A9 00
    STA $3F              ; $D427  85 3F
    STA $0607            ; $D429  8D 07 06
    LDA #$1E             ; $D42C  A9 1E
    STA $A3              ; $D42E  85 A3
    LDA #$10             ; $D430  A9 10
    JSR B07_CE6F         ; $D432  20 6F CE
    LDY $5D              ; $D435  A4 5D
    LDA $D5C8,Y          ; $D437  B9 C8 D5
    JSR B07_CE8A         ; $D43A  20 8A CE
    LDA $5D              ; $D43D  A5 5D
    ASL A                ; $D43F  0A
    TAY                  ; $D440  A8
    LDA $8001,Y          ; $D441  B9 01 80
    STA $4B              ; $D444  85 4B
    LDA $8002,Y          ; $D446  B9 02 80
    STA $4C              ; $D449  85 4C
    LDA $800B,Y          ; $D44B  B9 0B 80
    STA $4D              ; $D44E  85 4D
    LDA $800C,Y          ; $D450  B9 0C 80
    STA $4E              ; $D453  85 4E
    LDA $8051,Y          ; $D455  B9 51 80
    STA $60              ; $D458  85 60
    LDA $8052,Y          ; $D45A  B9 52 80
    STA $61              ; $D45D  85 61
    LDA $F4AA,Y          ; $D45F  B9 AA F4
    STA $49              ; $D462  85 49
    LDA $F4AB,Y          ; $D464  B9 AB F4
    STA $4A              ; $D467  85 4A
    JSR B07_D536         ; $D469  20 36 D5
    JSR B07_DEE0         ; $D46C  20 E0 DE
    LDA #$FE             ; $D46F  A9 FE
    STA $A4              ; $D471  85 A4
    LDA #$01             ; $D473  A9 01
    STA $65              ; $D475  85 65
    LDY $5D              ; $D477  A4 5D
    LDA $D636,Y          ; $D479  B9 36 D6
    JSR B07_F718         ; $D47C  20 18 F7
    JMP B07_D548         ; $D47F  4C 48 D5
B07_D482:
    INC $34              ; $D482  E6 34
    LDA #$1E             ; $D484  A9 1E
    JSR B07_CE56         ; $D486  20 56 CE
    LDA #$01             ; $D489  A9 01
    JSR B07_CEA7         ; $D48B  20 A7 CE
    JSR B07_C962         ; $D48E  20 62 C9
    LDX #$16             ; $D491  A2 16
    JSR B07_C982         ; $D493  20 82 C9
    LDA #$23             ; $D496  A9 23
    STA $29              ; $D498  85 29
    LDA #$00             ; $D49A  A9 00
    STA $2A              ; $D49C  85 2A
    LDA $0609            ; $D49E  AD 09 06
    BNE B07_D4BF         ; $D4A1  D0 1C
    LDX #$14             ; $D4A3  A2 14
    JSR B07_C982         ; $D4A5  20 82 C9
    LDX #$00             ; $D4A8  A2 00
    TXA                  ; $D4AA  8A
B07_D4AB:
    STA $0700,X          ; $D4AB  9D 00 07
    INX                  ; $D4AE  E8
    BNE B07_D4AB         ; $D4AF  D0 FA
    LDX #$07             ; $D4B1  A2 07
    LDA #$44             ; $D4B3  A9 44
B07_D4B5:
    STA $0758,X          ; $D4B5  9D 58 07
    STA $07D8,X          ; $D4B8  9D D8 07
    DEX                  ; $D4BB  CA
    BPL B07_D4B5         ; $D4BC  10 F7
    RTS                  ; $D4BE  60
B07_D4BF:
    LDA $A1              ; $D4BF  A5 A1
    STA $FF              ; $D4C1  85 FF
    LDA $4F              ; $D4C3  A5 4F
    STA $FD              ; $D4C5  85 FD
    RTS                  ; $D4C7  60
B07_D4C8:
    LDA $A2              ; $D4C8  A5 A2
    BMI B07_D482         ; $D4CA  30 B6
    LDA #$1F             ; $D4CC  A9 1F
    JSR B07_CE56         ; $D4CE  20 56 CE
    LDA #$01             ; $D4D1  A9 01
    JSR B07_CEA7         ; $D4D3  20 A7 CE
    INC $A4              ; $D4D6  E6 A4
    BMI B07_D516         ; $D4D8  30 3C
    LDA $A4              ; $D4DA  A5 A4
    ASL A                ; $D4DC  0A
    ASL A                ; $D4DD  0A
    ASL A                ; $D4DE  0A
    CLC                  ; $D4DF  18
    ADC $51              ; $D4E0  65 51
    STA $0A              ; $D4E2  85 0A
    LDA $52              ; $D4E4  A5 52
    ADC #$00             ; $D4E6  69 00
    STA $0B              ; $D4E8  85 0B
B07_D4EA:
    JSR B07_DF23         ; $D4EA  20 23 DF
    LDA $4F              ; $D4ED  A5 4F
    CLC                  ; $D4EF  18
    ADC #$08             ; $D4F0  69 08
    AND #$F0             ; $D4F2  29 F0
    STA $08              ; $D4F4  85 08
    LDA $50              ; $D4F6  A5 50
    ADC #$00             ; $D4F8  69 00
    STA $09              ; $D4FA  85 09
    JSR B07_DEFC         ; $D4FC  20 FC DE
    JSR B07_DA35         ; $D4FF  20 35 DA
    LDA #$10             ; $D502  A9 10
    STA $0D              ; $D504  85 0D
    JSR B07_DD08         ; $D506  20 08 DD
    LDA $A4              ; $D509  A5 A4
    CMP $A3              ; $D50B  C5 A3
    BNE B07_D515         ; $D50D  D0 06
    INC $34              ; $D50F  E6 34
    LDA #$00             ; $D511  A9 00
    STA $A3              ; $D513  85 A3
B07_D515:
    RTS                  ; $D515  60
B07_D516:
    LDA $5C              ; $D516  A5 5C
    BEQ B07_D51B         ; $D518  F0 01
    RTS                  ; $D51A  60
B07_D51B:
    LDA $52              ; $D51B  A5 52
    BNE B07_D526         ; $D51D  D0 07
    LDA $51              ; $D51F  A5 51
    AND #$F8             ; $D521  29 F8
    BNE B07_D526         ; $D523  D0 01
    RTS                  ; $D525  60
B07_D526:
    LDA $51              ; $D526  A5 51
    SEC                  ; $D528  38
    SBC #$08             ; $D529  E9 08
    STA $0A              ; $D52B  85 0A
    LDA $52              ; $D52D  A5 52
    SBC #$00             ; $D52F  E9 00
    STA $0B              ; $D531  85 0B
    JMP B07_D4EA         ; $D533  4C EA D4
B07_D536:
    LDA $28              ; $D536  A5 28
    SEC                  ; $D538  38
    SBC #$0D             ; $D539  E9 0D
    ASL A                ; $D53B  0A
    TAY                  ; $D53C  A8
    LDA $FC93,Y          ; $D53D  B9 93 FC
    STA $62              ; $D540  85 62
    LDA $FC94,Y          ; $D542  B9 94 FC
    STA $63              ; $D545  85 63
    RTS                  ; $D547  60
B07_D548:
    LDY $67              ; $D548  A4 67
    LDA $D675,Y          ; $D54A  B9 75 D6
    STA $05B1            ; $D54D  8D B1 05
    RTS                  ; $D550  60
B07_D551:
    LDA $48              ; $D551  A5 48
    ASL A                ; $D553  0A
    TAY                  ; $D554  A8
    LDA $D5CE,Y          ; $D555  B9 CE D5
    STA $00              ; $D558  85 00
    LDA $D5CF,Y          ; $D55A  B9 CF D5
    STA $01              ; $D55D  85 01
    LDA $5D              ; $D55F  A5 5D
    ASL A                ; $D561  0A
    TAY                  ; $D562  A8
    LDA ($00),Y          ; $D563  B1 00
    JSR B07_CE8A         ; $D565  20 8A CE
    INY                  ; $D568  C8
    LDA ($00),Y          ; $D569  B1 00
    STA $0604            ; $D56B  8D 04 06
    JSR B07_CE6F         ; $D56E  20 6F CE
    JMP B07_F75E         ; $D571  4C 5E F7
B07_D574:
    LDY #$00             ; $D574  A0 00
    LDA $51              ; $D576  A5 51
    STA $00              ; $D578  85 00
    LDA $52              ; $D57A  A5 52
    LSR A                ; $D57C  4A
    ROR $00              ; $D57D  66 00
    LSR A                ; $D57F  4A
    ROR $00              ; $D580  66 00
    LSR A                ; $D582  4A
    ROR $00              ; $D583  66 00
    LSR A                ; $D585  4A
    ROR $00              ; $D586  66 00
B07_D588:
    LDA $D5A7,Y          ; $D588  B9 A7 D5
    CMP $00              ; $D58B  C5 00
    BEQ B07_D594         ; $D58D  F0 05
    INY                  ; $D58F  C8
    CPY #$10             ; $D590  C0 10
    BNE B07_D588         ; $D592  D0 F4
B07_D594:
    LDA $D5B7,Y          ; $D594  B9 B7 D5
    STA $29              ; $D597  85 29
    LDY #$00             ; $D599  A0 00
    STY $2A              ; $D59B  84 2A
    CMP #$21             ; $D59D  C9 21
    BEQ B07_D5A2         ; $D59F  F0 01
    RTS                  ; $D5A1  60
B07_D5A2:
    LDY #$80             ; $D5A2  A0 80
    STY $2A              ; $D5A4  84 2A
    RTS                  ; $D5A6  60
    .byte $00, $0C, $18, $24, $30, $3C, $48, $54, $60, $6C, $78, $84, $90, $9C, $A8, $B4 ; $D5A7
    .byte $29, $20, $23, $2A, $21, $29, $20, $23, $2A, $21, $29, $20, $23, $2A, $21, $29 ; $D5B7
    .byte $20, $12, $13, $12, $14, $14, $0F, $DA, $D5, $E6, $D5, $EA, $D5, $F8, $D5, $1C ; $D5C7
    .byte $D6, $2E, $D6, $15, $00, $15, $00, $15, $00, $15, $01, $15, $01, $15, $04, $16 ; $D5D7
    .byte $00, $18, $11, $15, $02, $15, $02, $15, $02, $17, $02, $17, $02, $15, $02, $17 ; $D5E7
    .byte $02, $17, $03, $18, $04, $18, $03, $18, $03, $18, $04, $18, $04, $18, $04, $18 ; $D5F7
    .byte $03, $18, $04, $18, $04, $18, $04, $18, $04, $18, $04, $18, $04, $18, $04, $18 ; $D607
    .byte $03, $18, $04, $0D, $04, $15, $05, $15, $05, $19, $06, $19, $06, $19, $06, $19 ; $D617
    .byte $05, $0E, $0C, $19, $05, $19, $05, $1A, $00, $1A, $04, $1A, $07, $16, $0C, $00 ; $D627
    .byte $04, $07, $0A, $0F, $47, $D6, $4D, $D6, $4F, $D6, $56, $D6, $68, $D6, $71, $D6 ; $D637
    .byte $01, $01, $01, $01, $02, $02, $05, $06, $09, $08, $08, $09, $09, $08, $09, $0C ; $D647
    .byte $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B ; $D657
    .byte $0E, $11, $11, $10, $10, $10, $10, $12, $10, $10, $13, $14, $15, $16, $12, $16 ; $D667
    .byte $27, $14, $20, $00, $B0, $00, $00, $00, $00, $00, $E0, $00, $A0, $00, $00, $03 ; $D677
    .byte $00, $03, $80, $01, $A0, $00, $99, $D6, $B1, $D6, $B9, $D6, $D5, $D6, $1D, $D7 ; $D687
    .byte $39, $D7, $10, $00, $B0, $00, $D0, $00, $00, $01, $D8, $00, $30, $00, $90, $00 ; $D697
    .byte $04, $00, $00, $01, $B0, $00, $08, $00, $30, $00, $18, $00, $00, $00, $FD, $00 ; $D6A7
    .byte $00, $00, $48, $00, $2C, $00, $B0, $03, $00, $00, $48, $00, $B8, $02, $20, $01 ; $D6B7
    .byte $90, $03, $C0, $02, $10, $03, $28, $02, $BC, $01, $28, $02, $BC, $01, $00, $03 ; $D6C7
    .byte $00, $03, $A8, $02, $F0, $01, $F8, $01, $40, $02, $E8, $01, $94, $02, $B8, $01 ; $D6D7
    .byte $00, $03, $C8, $00, $18, $02, $D8, $00, $60, $02, $00, $00, $B4, $02, $00, $00 ; $D6E7
    .byte $00, $02, $00, $00, $8B, $00, $58, $00, $00, $00, $98, $01, $C0, $00, $00, $03 ; $D6F7
    .byte $C0, $00, $E8, $02, $40, $00, $68, $01, $70, $00, $08, $01, $10, $00, $08, $01 ; $D707
    .byte $10, $00, $08, $01, $10, $00, $F8, $00, $3A, $01, $00, $00, $5A, $00, $C8, $01 ; $D717
    .byte $1A, $00, $C6, $01, $DA, $01, $00, $00, $DA, $01, $80, $01, $A0, $00, $80, $01 ; $D727
    .byte $A0, $00, $00, $05, $00, $00, $80, $78, $80, $88, $80, $7C, $80, $A8, $80, $78 ; $D737
    .byte $53, $D7, $5F, $D7, $63, $D7, $71, $D7, $95, $D7, $A3, $D7, $90, $78, $90, $A8 ; $D747
    .byte $90, $78, $B0, $78, $A8, $80, $80, $80, $80, $A0, $70, $50, $80, $80, $80, $30 ; $D757
    .byte $80, $80, $80, $78, $80, $78, $80, $78, $80, $78, $78, $AC, $80, $90, $80, $90 ; $D767
    .byte $80, $60, $90, $D0, $80, $60, $80, $90, $48, $80, $60, $78, $38, $78, $80, $80 ; $D777
    .byte $80, $90, $80, $90, $70, $78, $80, $78, $80, $80, $80, $80, $80, $80, $70, $90 ; $D787
    .byte $A0, $78, $50, $78, $50, $78, $60, $90, $80, $78, $80, $78, $80, $78, $80, $78 ; $D797
    .byte $80, $78, $80, $78, $A0, $88, $60, $30, $A0, $90, $80, $A0, $80, $A8, $60, $78 ; $D7A7
    .byte $60, $78 ; $D7B7
B07_D7B9:
    LDY $6B              ; $D7B9  A4 6B
    BNE B07_D7C8         ; $D7BB  D0 0B
    LDA $4F              ; $D7BD  A5 4F
    ORA $50              ; $D7BF  05 50
    BNE B07_D7C7         ; $D7C1  D0 04
    ORA $A6              ; $D7C3  05 A6
    BNE B07_D7C8         ; $D7C5  D0 01
B07_D7C7:
    RTS                  ; $D7C7  60
B07_D7C8:
    LDA $34              ; $D7C8  A5 34
    CMP #$03             ; $D7CA  C9 03
    BNE B07_D7CF         ; $D7CC  D0 01
    RTS                  ; $D7CE  60
B07_D7CF:
    LDA $5C              ; $D7CF  A5 5C
    BNE B07_D7D6         ; $D7D1  D0 03
    JMP B07_DAC4         ; $D7D3  4C C4 DA
B07_D7D6:
    LDA $4F              ; $D7D6  A5 4F
    STA $01              ; $D7D8  85 01
    LDA #$00             ; $D7DA  A9 00
    STA $00              ; $D7DC  85 00
    LDA $C0              ; $D7DE  A5 C0
    BPL B07_D7E4         ; $D7E0  10 02
    DEC $00              ; $D7E2  C6 00
B07_D7E4:
    LDA $C1              ; $D7E4  A5 C1
    CLC                  ; $D7E6  18
    ADC $6C              ; $D7E7  65 6C
    STA $6C              ; $D7E9  85 6C
    LDA $C0              ; $D7EB  A5 C0
    ADC $4F              ; $D7ED  65 4F
    STA $4F              ; $D7EF  85 4F
    LDA $00              ; $D7F1  A5 00
    ADC $50              ; $D7F3  65 50
    STA $50              ; $D7F5  85 50
    BPL B07_D801         ; $D7F7  10 08
    LDA #$00             ; $D7F9  A9 00
    STA $50              ; $D7FB  85 50
    STA $4F              ; $D7FD  85 4F
    STA $6C              ; $D7FF  85 6C
B07_D801:
    LDA $4F              ; $D801  A5 4F
    PHA                  ; $D803  48
    SEC                  ; $D804  38
    SBC $01              ; $D805  E5 01
    STA $40              ; $D807  85 40
    PLA                  ; $D809  68
    EOR $A6              ; $D80A  45 A6
    AND #$08             ; $D80C  29 08
    BNE B07_D817         ; $D80E  D0 07
    LDA $50              ; $D810  A5 50
    ORA $4F              ; $D812  05 4F
    BEQ B07_D817         ; $D814  F0 01
    RTS                  ; $D816  60
B07_D817:
    LDY $6B              ; $D817  A4 6B
    DEY                  ; $D819  88
    LDA $DAC2,Y          ; $D81A  B9 C2 DA
    CLC                  ; $D81D  18
    ADC $4F              ; $D81E  65 4F
    AND #$F8             ; $D820  29 F8
    STA $08              ; $D822  85 08
    LDA $50              ; $D824  A5 50
    ADC #$00             ; $D826  69 00
    STA $09              ; $D828  85 09
    LDA $51              ; $D82A  A5 51
    STA $0A              ; $D82C  85 0A
    LDA $52              ; $D82E  A5 52
    STA $0B              ; $D830  85 0B
    JSR B07_DEFC         ; $D832  20 FC DE
    JSR B07_DA35         ; $D835  20 35 DA
    LDA #$00             ; $D838  A9 00
    STA $71              ; $D83A  85 71
    LDA $22              ; $D83C  A5 22
    STA $72              ; $D83E  85 72
    JSR B07_DF23         ; $D840  20 23 DF
    LDY #$00             ; $D843  A0 00
    STY $00              ; $D845  84 00
    LDA ($49),Y          ; $D847  B1 49
    STA $01              ; $D849  85 01
    LDY $54              ; $D84B  A4 54
B07_D84D:
    DEY                  ; $D84D  88
    BMI B07_D859         ; $D84E  30 09
    LDA $00              ; $D850  A5 00
    CLC                  ; $D852  18
    ADC $01              ; $D853  65 01
    STA $00              ; $D855  85 00
    BNE B07_D84D         ; $D857  D0 F4
B07_D859:
    LDA $00              ; $D859  A5 00
    ADC $09              ; $D85B  65 09
    TAY                  ; $D85D  A8
    INY                  ; $D85E  C8
    INY                  ; $D85F  C8
    LDA ($49),Y          ; $D860  B1 49
    PHA                  ; $D862  48
    LSR A                ; $D863  4A
    LSR A                ; $D864  4A
    LSR A                ; $D865  4A
    LSR A                ; $D866  4A
    STA $01              ; $D867  85 01
    PLA                  ; $D869  68
    ASL A                ; $D86A  0A
    ASL A                ; $D86B  0A
    ASL A                ; $D86C  0A
    ASL A                ; $D86D  0A
    STA $00              ; $D86E  85 00
    LDA $60              ; $D870  A5 60
    STA $04              ; $D872  85 04
    LDA $61              ; $D874  A5 61
    STA $05              ; $D876  85 05
    LDY #$03             ; $D878  A0 03
B07_D87A:
    LDA $04              ; $D87A  A5 04
    CLC                  ; $D87C  18
    ADC $00              ; $D87D  65 00
    STA $04              ; $D87F  85 04
    LDA $05              ; $D881  A5 05
    ADC $01              ; $D883  65 01
    STA $05              ; $D885  85 05
    DEY                  ; $D887  88
    BNE B07_D87A         ; $D888  D0 F0
    LDA #$06             ; $D88A  A9 06
    STA $0D              ; $D88C  85 0D
B07_D88E:
    JSR B07_DF23         ; $D88E  20 23 DF
    JSR B07_D8CF         ; $D891  20 CF D8
    LDA $0A              ; $D894  A5 0A
    CLC                  ; $D896  18
    ADC #$20             ; $D897  69 20
    STA $0A              ; $D899  85 0A
    LDA $0B              ; $D89B  A5 0B
    ADC #$00             ; $D89D  69 00
    STA $0B              ; $D89F  85 0B
    DEC $0D              ; $D8A1  C6 0D
    BNE B07_D88E         ; $D8A3  D0 E9
    JSR B07_DF7D         ; $D8A5  20 7D DF
    LDA $08              ; $D8A8  A5 08
    AND #$0F             ; $D8AA  29 0F
    BEQ B07_D8AF         ; $D8AC  F0 01
    RTS                  ; $D8AE  60
B07_D8AF:
    LDA $08              ; $D8AF  A5 08
    ROL A                ; $D8B1  2A
    ROL A                ; $D8B2  2A
    ROL A                ; $D8B3  2A
    ROL A                ; $D8B4  2A
    AND #$07             ; $D8B5  29 07
    ORA #$C0             ; $D8B7  09 C0
    STA $00              ; $D8B9  85 00
    LDA #$05             ; $D8BB  A9 05
    STA $01              ; $D8BD  85 01
    LDA #$23             ; $D8BF  A9 23
    STA $03              ; $D8C1  85 03
    JSR B07_DA02         ; $D8C3  20 02 DA
    INC $01              ; $D8C6  E6 01
    LDA #$2B             ; $D8C8  A9 2B
    STA $03              ; $D8CA  85 03
    JMP B07_DA02         ; $D8CC  4C 02 DA
B07_D8CF:
    LDA $53              ; $D8CF  A5 53
    LSR A                ; $D8D1  4A
    LSR A                ; $D8D2  4A
    AND #$38             ; $D8D3  29 38
    STA $0E              ; $D8D5  85 0E
    LDA $08              ; $D8D7  A5 08
    LSR A                ; $D8D9  4A
    LSR A                ; $D8DA  4A
    LSR A                ; $D8DB  4A
    LSR A                ; $D8DC  4A
    LSR A                ; $D8DD  4A
    ORA $0E              ; $D8DE  05 0E
    TAY                  ; $D8E0  A8
    LDA ($04),Y          ; $D8E1  B1 04
    PHA                  ; $D8E3  48
    JSR B07_DE24         ; $D8E4  20 24 DE
    LDA #$03             ; $D8E7  A9 03
    JSR B07_CEA5         ; $D8E9  20 A5 CE
    PLA                  ; $D8EC  68
    TAY                  ; $D8ED  A8
    LDA ($4D),Y          ; $D8EE  B1 4D
    STA $13              ; $D8F0  85 13
    JSR B07_D8FA         ; $D8F2  20 FA D8
    LDA #$01             ; $D8F5  A9 01
    JMP B07_CEA5         ; $D8F7  4C A5 CE
B07_D8FA:
    LDA $71              ; $D8FA  A5 71
    BNE B07_D913         ; $D8FC  D0 15
    LDA $22              ; $D8FE  A5 22
    BNE B07_D913         ; $D900  D0 11
    LDA #$02             ; $D902  A9 02
    JSR B07_CA92         ; $D904  20 92 CA
    LDA $6F              ; $D907  A5 6F
    ORA #$80             ; $D909  09 80
    JSR B07_CA94         ; $D90B  20 94 CA
    LDA $70              ; $D90E  A5 70
    JSR B07_CA94         ; $D910  20 94 CA
B07_D913:
    LDA $53              ; $D913  A5 53
    AND #$10             ; $D915  29 10
    STA $0E              ; $D917  85 0E
    LDA $08              ; $D919  A5 08
    LSR A                ; $D91B  4A
    AND #$0C             ; $D91C  29 0C
    ORA $0E              ; $D91E  05 0E
    LSR A                ; $D920  4A
    LSR A                ; $D921  4A
    TAY                  ; $D922  A8
    LDA $DAB2,Y          ; $D923  B9 B2 DA
    PHA                  ; $D926  48
    JSR B07_D952         ; $D927  20 52 D9
    PLA                  ; $D92A  68
    TAY                  ; $D92B  A8
    JSR B07_D937         ; $D92C  20 37 D9
    INY                  ; $D92F  C8
    INY                  ; $D930  C8
    INY                  ; $D931  C8
    INY                  ; $D932  C8
    LDA $17              ; $D933  A5 17
    STA $13              ; $D935  85 13
B07_D937:
    LDA ($10),Y          ; $D937  B1 10
    INC $71              ; $D939  E6 71
    JSR B07_CA94         ; $D93B  20 94 CA
    JSR B07_DE46         ; $D93E  20 46 DE
    INY                  ; $D941  C8
    INY                  ; $D942  C8
    INY                  ; $D943  C8
    INY                  ; $D944  C8
    LDA ($10),Y          ; $D945  B1 10
    INC $71              ; $D947  E6 71
    JSR B07_CA92         ; $D949  20 92 CA
    JSR B07_D97D         ; $D94C  20 7D D9
    JMP B07_DA5F         ; $D94F  4C 5F DA
B07_D952:
    LDA $08              ; $D952  A5 08
    AND #$0F             ; $D954  29 0F
    BEQ B07_D959         ; $D956  F0 01
    RTS                  ; $D958  60
B07_D959:
    TYA                  ; $D959  98
    BNE B07_D96B         ; $D95A  D0 0F
    LDA $13              ; $D95C  A5 13
    PHA                  ; $D95E  48
    AND #$03             ; $D95F  29 03
    STA $13              ; $D961  85 13
    PLA                  ; $D963  68
    LSR A                ; $D964  4A
    LSR A                ; $D965  4A
    LSR A                ; $D966  4A
    LSR A                ; $D967  4A
    JMP B07_D978         ; $D968  4C 78 D9
B07_D96B:
    LDA $13              ; $D96B  A5 13
    PHA                  ; $D96D  48
    LSR A                ; $D96E  4A
    LSR A                ; $D96F  4A
    AND #$03             ; $D970  29 03
    STA $13              ; $D972  85 13
    PLA                  ; $D974  68
    ROL A                ; $D975  2A
    ROL A                ; $D976  2A
    ROL A                ; $D977  2A
B07_D978:
    AND #$03             ; $D978  29 03
    STA $17              ; $D97A  85 17
    RTS                  ; $D97C  60
B07_D97D:
    LDA $08              ; $D97D  A5 08
    AND #$0F             ; $D97F  29 0F
    BEQ B07_D984         ; $D981  F0 01
    RTS                  ; $D983  60
B07_D984:
    STY $1A              ; $D984  84 1A
    LDA $13              ; $D986  A5 13
    PHA                  ; $D988  48
    JSR B07_D992         ; $D989  20 92 D9
    PLA                  ; $D98C  68
    STA $13              ; $D98D  85 13
    LDY $1A              ; $D98F  A4 1A
    RTS                  ; $D991  60
B07_D992:
    LDA $70              ; $D992  A5 70
    PHA                  ; $D994  48
    ROL A                ; $D995  2A
    LDA $6F              ; $D996  A5 6F
    ROL A                ; $D998  2A
    ROL A                ; $D999  2A
    ROL A                ; $D99A  2A
    ROL A                ; $D99B  2A
    AND #$38             ; $D99C  29 38
    STA $16              ; $D99E  85 16
    PLA                  ; $D9A0  68
    LSR A                ; $D9A1  4A
    LSR A                ; $D9A2  4A
    AND #$07             ; $D9A3  29 07
    ORA $16              ; $D9A5  05 16
    ORA #$C0             ; $D9A7  09 C0
    STA $14              ; $D9A9  85 14
    LDY #$05             ; $D9AB  A0 05
    LDA $6F              ; $D9AD  A5 6F
    AND #$08             ; $D9AF  29 08
    BEQ B07_D9B4         ; $D9B1  F0 01
    INY                  ; $D9B3  C8
B07_D9B4:
    STY $15              ; $D9B4  84 15
    LDY #$00             ; $D9B6  A0 00
    LDA ($14),Y          ; $D9B8  B1 14
    STA $16              ; $D9BA  85 16
    LDA $70              ; $D9BC  A5 70
    ROL A                ; $D9BE  2A
    ROL A                ; $D9BF  2A
    LDA $70              ; $D9C0  A5 70
    AND #$02             ; $D9C2  29 02
    ADC #$00             ; $D9C4  69 00
    JSR B07_C702         ; $D9C6  20 02 C7
MOVEMENT_STATE_HANDLERS: ; fixed-length little-endian CPU data pointers
    .word $D9D1, $D9E3, $D9D8, $D9F2 ; $D9C9
B07_D9D1:
    LDA $16              ; $D9D1  A5 16
    AND #$FC             ; $D9D3  29 FC
    JMP B07_D9FD         ; $D9D5  4C FD D9
B07_D9D8:
    LDA $16              ; $D9D8  A5 16
    AND #$F3             ; $D9DA  29 F3
    ASL $13              ; $D9DC  06 13
    ASL $13              ; $D9DE  06 13
    JMP B07_D9FD         ; $D9E0  4C FD D9
B07_D9E3:
    LDA $16              ; $D9E3  A5 16
    AND #$CF             ; $D9E5  29 CF
    ASL $13              ; $D9E7  06 13
    ASL $13              ; $D9E9  06 13
    ASL $13              ; $D9EB  06 13
    ASL $13              ; $D9ED  06 13
    JMP B07_D9FD         ; $D9EF  4C FD D9
B07_D9F2:
    LDA $16              ; $D9F2  A5 16
    AND #$3F             ; $D9F4  29 3F
    CLC                  ; $D9F6  18
    ROR $13              ; $D9F7  66 13
    ROR $13              ; $D9F9  66 13
    ROR $13              ; $D9FB  66 13
B07_D9FD:
    ORA $13              ; $D9FD  05 13
    STA ($14),Y          ; $D9FF  91 14
    RTS                  ; $DA01  60
B07_DA02:
    LDA #$08             ; $DA02  A9 08
    STA $17              ; $DA04  85 17
B07_DA06:
    LDA #$02             ; $DA06  A9 02
    JSR B07_CA92         ; $DA08  20 92 CA
    LDA $03              ; $DA0B  A5 03
    ORA #$80             ; $DA0D  09 80
    JSR B07_CA94         ; $DA0F  20 94 CA
    LDY $17              ; $DA12  A4 17
    LDA $DAB9,Y          ; $DA14  B9 B9 DA
    TAY                  ; $DA17  A8
    CLC                  ; $DA18  18
    ADC $00              ; $DA19  65 00
    JSR B07_CA94         ; $DA1B  20 94 CA
    LDA ($00),Y          ; $DA1E  B1 00
    JSR B07_CA94         ; $DA20  20 94 CA
    LDY $17              ; $DA23  A4 17
    LDA $DAB8,Y          ; $DA25  B9 B8 DA
    TAY                  ; $DA28  A8
    LDA ($00),Y          ; $DA29  B1 00
    JSR B07_CA92         ; $DA2B  20 92 CA
    DEC $17              ; $DA2E  C6 17
    DEC $17              ; $DA30  C6 17
    BNE B07_DA06         ; $DA32  D0 D2
    RTS                  ; $DA34  60
B07_DA35:
    LDA $15              ; $DA35  A5 15
    AND #$01             ; $DA37  29 01
    ASL A                ; $DA39  0A
    ASL A                ; $DA3A  0A
    ASL A                ; $DA3B  0A
    STA $6F              ; $DA3C  85 6F
    LDA $14              ; $DA3E  A5 14
    PHA                  ; $DA40  48
    ROL A                ; $DA41  2A
    ROL A                ; $DA42  2A
    ROL A                ; $DA43  2A
    AND #$03             ; $DA44  29 03
    ORA #$20             ; $DA46  09 20
    ORA $6F              ; $DA48  05 6F
    STA $6F              ; $DA4A  85 6F
    PLA                  ; $DA4C  68
    ASL A                ; $DA4D  0A
    ASL A                ; $DA4E  0A
    AND #$C0             ; $DA4F  29 C0
    STA $70              ; $DA51  85 70
    LDA $08              ; $DA53  A5 08
    LSR A                ; $DA55  4A
    LSR A                ; $DA56  4A
    LSR A                ; $DA57  4A
    AND #$1F             ; $DA58  29 1F
    ORA $70              ; $DA5A  05 70
    STA $70              ; $DA5C  85 70
    RTS                  ; $DA5E  60
B07_DA5F:
    STY $1A              ; $DA5F  84 1A
    LDA $70              ; $DA61  A5 70
    CLC                  ; $DA63  18
    ADC #$40             ; $DA64  69 40
    STA $70              ; $DA66  85 70
    LDA $6F              ; $DA68  A5 6F
    ADC #$00             ; $DA6A  69 00
    STA $6F              ; $DA6C  85 6F
    LDA $6F              ; $DA6E  A5 6F
    AND #$07             ; $DA70  29 07
    CMP #$03             ; $DA72  C9 03
    BNE B07_DAA3         ; $DA74  D0 2D
    LDA $70              ; $DA76  A5 70
    CMP #$C0             ; $DA78  C9 C0
    BCC B07_DAA3         ; $DA7A  90 27
    LDA $70              ; $DA7C  A5 70
    AND #$3F             ; $DA7E  29 3F
    STA $70              ; $DA80  85 70
    LDA $6F              ; $DA82  A5 6F
    AND #$FC             ; $DA84  29 FC
    EOR #$08             ; $DA86  49 08
    STA $6F              ; $DA88  85 6F
    JSR B07_DF7D         ; $DA8A  20 7D DF
    LDY $0D              ; $DA8D  A4 0D
    DEY                  ; $DA8F  88
    BEQ B07_DAA3         ; $DA90  F0 11
    LDA #$02             ; $DA92  A9 02
    JSR B07_CA92         ; $DA94  20 92 CA
    LDA $6F              ; $DA97  A5 6F
    ORA #$80             ; $DA99  09 80
    JSR B07_CA94         ; $DA9B  20 94 CA
    LDA $70              ; $DA9E  A5 70
    JSR B07_CA92         ; $DAA0  20 92 CA
B07_DAA3:
    LDY $1A              ; $DAA3  A4 1A
    RTS                  ; $DAA5  60
    .byte $40, $02, $00, $C0, $FD, $FF, $40, $01, $00, $C0, $FE, $FF, $00, $01, $02, $03 ; $DAA6
    .byte $08, $09, $0A, $0B, $38, $18, $30, $10, $28, $08, $20, $00, $04, $FC ; $DAB6
B07_DAC4:
    LDA #$00             ; $DAC4  A9 00
    STA $00              ; $DAC6  85 00
    DEY                  ; $DAC8  88
    BNE B07_DACF         ; $DAC9  D0 04
    LDA #$06             ; $DACB  A9 06
    STA $00              ; $DACD  85 00
B07_DACF:
    LDA $0606            ; $DACF  AD 06 06
    BEQ B07_DADA         ; $DAD2  F0 06
    INC $00              ; $DAD4  E6 00
    INC $00              ; $DAD6  E6 00
    INC $00              ; $DAD8  E6 00
B07_DADA:
    LDA $4F              ; $DADA  A5 4F
    STA $01              ; $DADC  85 01
    LDY $00              ; $DADE  A4 00
    LDA $DC62,Y          ; $DAE0  B9 62 DC
    CLC                  ; $DAE3  18
    ADC $6C              ; $DAE4  65 6C
    STA $6C              ; $DAE6  85 6C
    LDA $DC63,Y          ; $DAE8  B9 63 DC
    ADC $4F              ; $DAEB  65 4F
    STA $4F              ; $DAED  85 4F
    PHA                  ; $DAEF  48
    LDA $DC64,Y          ; $DAF0  B9 64 DC
    ADC $50              ; $DAF3  65 50
    STA $50              ; $DAF5  85 50
    PLA                  ; $DAF7  68
    SEC                  ; $DAF8  38
    SBC $01              ; $DAF9  E5 01
    STA $40              ; $DAFB  85 40
    LDA $4F              ; $DAFD  A5 4F
    EOR $A6              ; $DAFF  45 A6
    AND #$08             ; $DB01  29 08
    BNE B07_DB0C         ; $DB03  D0 07
    LDA $4F              ; $DB05  A5 4F
    ORA $50              ; $DB07  05 50
    BEQ B07_DB0C         ; $DB09  F0 01
    RTS                  ; $DB0B  60
B07_DB0C:
    LDY $6B              ; $DB0C  A4 6B
    DEY                  ; $DB0E  88
    LDA $DAC2,Y          ; $DB0F  B9 C2 DA
    CLC                  ; $DB12  18
    ADC $4F              ; $DB13  65 4F
    AND #$F8             ; $DB15  29 F8
    STA $08              ; $DB17  85 08
    LDA $50              ; $DB19  A5 50
    ADC #$00             ; $DB1B  69 00
    STA $09              ; $DB1D  85 09
    LDA $51              ; $DB1F  A5 51
    AND #$F0             ; $DB21  29 F0
    STA $0A              ; $DB23  85 0A
    LDA $52              ; $DB25  A5 52
    STA $0B              ; $DB27  85 0B
    JSR B07_DEFC         ; $DB29  20 FC DE
    JSR B07_DA35         ; $DB2C  20 35 DA
    LDA #$0F             ; $DB2F  A9 0F
    STA $0D              ; $DB31  85 0D
B07_DB33:
    JSR B07_DF23         ; $DB33  20 23 DF
    JSR B07_DB71         ; $DB36  20 71 DB
    LDA $0A              ; $DB39  A5 0A
    CLC                  ; $DB3B  18
    ADC #$10             ; $DB3C  69 10
    STA $0A              ; $DB3E  85 0A
    LDA $0B              ; $DB40  A5 0B
    ADC #$00             ; $DB42  69 00
    STA $0B              ; $DB44  85 0B
    DEC $0D              ; $DB46  C6 0D
    BNE B07_DB33         ; $DB48  D0 E9
    LDA $08              ; $DB4A  A5 08
    AND #$0F             ; $DB4C  29 0F
    BEQ B07_DB51         ; $DB4E  F0 01
    RTS                  ; $DB50  60
B07_DB51:
    LDA $08              ; $DB51  A5 08
    ROL A                ; $DB53  2A
    ROL A                ; $DB54  2A
    ROL A                ; $DB55  2A
    ROL A                ; $DB56  2A
    AND #$07             ; $DB57  29 07
    ORA #$C0             ; $DB59  09 C0
    STA $00              ; $DB5B  85 00
    LDA #$05             ; $DB5D  A9 05
    STA $01              ; $DB5F  85 01
    LDA #$23             ; $DB61  A9 23
    STA $03              ; $DB63  85 03
    JSR B07_DBE4         ; $DB65  20 E4 DB
    INC $01              ; $DB68  E6 01
    LDA #$2B             ; $DB6A  A9 2B
    STA $03              ; $DB6C  85 03
    JMP B07_DBE4         ; $DB6E  4C E4 DB
B07_DB71:
    LDY #$00             ; $DB71  A0 00
    STY $00              ; $DB73  84 00
    LDA ($49),Y          ; $DB75  B1 49
    STA $01              ; $DB77  85 01
    LDY $54              ; $DB79  A4 54
B07_DB7B:
    DEY                  ; $DB7B  88
    BMI B07_DB87         ; $DB7C  30 09
    LDA $00              ; $DB7E  A5 00
    CLC                  ; $DB80  18
    ADC $01              ; $DB81  65 01
    STA $00              ; $DB83  85 00
    BNE B07_DB7B         ; $DB85  D0 F4
B07_DB87:
    LDA $00              ; $DB87  A5 00
    ADC $09              ; $DB89  65 09
    TAY                  ; $DB8B  A8
    INY                  ; $DB8C  C8
    INY                  ; $DB8D  C8
    LDA ($49),Y          ; $DB8E  B1 49
    PHA                  ; $DB90  48
    LSR A                ; $DB91  4A
    LSR A                ; $DB92  4A
    STA $01              ; $DB93  85 01
    PLA                  ; $DB95  68
    ROR A                ; $DB96  6A
    ROR A                ; $DB97  6A
    ROR A                ; $DB98  6A
    AND #$C0             ; $DB99  29 C0
    STA $00              ; $DB9B  85 00
    LDA $60              ; $DB9D  A5 60
    CLC                  ; $DB9F  18
    ADC $00              ; $DBA0  65 00
    STA $04              ; $DBA2  85 04
    LDA $61              ; $DBA4  A5 61
    ADC $01              ; $DBA6  65 01
    STA $05              ; $DBA8  85 05
    LDA $53              ; $DBAA  A5 53
    LSR A                ; $DBAC  4A
    LSR A                ; $DBAD  4A
    AND #$38             ; $DBAE  29 38
    STA $0E              ; $DBB0  85 0E
    LDA $08              ; $DBB2  A5 08
    LSR A                ; $DBB4  4A
    LSR A                ; $DBB5  4A
    LSR A                ; $DBB6  4A
    LSR A                ; $DBB7  4A
    LSR A                ; $DBB8  4A
    ORA $0E              ; $DBB9  05 0E
    TAY                  ; $DBBB  A8
    LDA ($04),Y          ; $DBBC  B1 04
    PHA                  ; $DBBE  48
    JSR B07_DE24         ; $DBBF  20 24 DE
    LDA #$04             ; $DBC2  A9 04
    JSR B07_CEA5         ; $DBC4  20 A5 CE
    PLA                  ; $DBC7  68
    TAY                  ; $DBC8  A8
    LDA ($4D),Y          ; $DBC9  B1 4D
    STA $13              ; $DBCB  85 13
    JSR B07_DEFC         ; $DBCD  20 FC DE
    JSR B07_DA35         ; $DBD0  20 35 DA
    JSR B07_DC17         ; $DBD3  20 17 DC
    LDA $08              ; $DBD6  A5 08
    AND #$0F             ; $DBD8  29 0F
    BNE B07_DBDF         ; $DBDA  D0 03
    JSR B07_D992         ; $DBDC  20 92 D9
B07_DBDF:
    LDA #$01             ; $DBDF  A9 01
    JMP B07_CEA5         ; $DBE1  4C A5 CE
B07_DBE4:
    LDA #$08             ; $DBE4  A9 08
    STA $17              ; $DBE6  85 17
B07_DBE8:
    LDA #$02             ; $DBE8  A9 02
    JSR B07_CAAA         ; $DBEA  20 AA CA
    LDA $03              ; $DBED  A5 03
    ORA #$80             ; $DBEF  09 80
    JSR B07_CAAC         ; $DBF1  20 AC CA
    LDY $17              ; $DBF4  A4 17
    LDA $DAB9,Y          ; $DBF6  B9 B9 DA
    TAY                  ; $DBF9  A8
    CLC                  ; $DBFA  18
    ADC $00              ; $DBFB  65 00
    JSR B07_CAAC         ; $DBFD  20 AC CA
    LDA ($00),Y          ; $DC00  B1 00
    JSR B07_CAAC         ; $DC02  20 AC CA
    LDY $17              ; $DC05  A4 17
    LDA $DAB8,Y          ; $DC07  B9 B8 DA
    TAY                  ; $DC0A  A8
    LDA ($00),Y          ; $DC0B  B1 00
    JSR B07_CAAA         ; $DC0D  20 AA CA
    DEC $17              ; $DC10  C6 17
    DEC $17              ; $DC12  C6 17
    BNE B07_DBE8         ; $DC14  D0 D2
    RTS                  ; $DC16  60
B07_DC17:
    LDA #$02             ; $DC17  A9 02
    JSR B07_CA92         ; $DC19  20 92 CA
    LDA $6F              ; $DC1C  A5 6F
    ORA #$80             ; $DC1E  09 80
    JSR B07_CA94         ; $DC20  20 94 CA
    LDA $70              ; $DC23  A5 70
    JSR B07_CA94         ; $DC25  20 94 CA
    LDA $53              ; $DC28  A5 53
    AND #$18             ; $DC2A  29 18
    LSR A                ; $DC2C  4A
    STA $0E              ; $DC2D  85 0E
    LDA $08              ; $DC2F  A5 08
    AND #$18             ; $DC31  29 18
    LSR A                ; $DC33  4A
    LSR A                ; $DC34  4A
    LSR A                ; $DC35  4A
    ORA $0E              ; $DC36  05 0E
    PHA                  ; $DC38  48
    TAY                  ; $DC39  A8
    LDA $DDF2,Y          ; $DC3A  B9 F2 DD
    TAY                  ; $DC3D  A8
    JSR B07_DC58         ; $DC3E  20 58 DC
    PLA                  ; $DC41  68
    TAY                  ; $DC42  A8
    LDA ($10),Y          ; $DC43  B1 10
    INC $71              ; $DC45  E6 71
    JSR B07_CA94         ; $DC47  20 94 CA
    JSR B07_DE46         ; $DC4A  20 46 DE
    INY                  ; $DC4D  C8
    INY                  ; $DC4E  C8
    INY                  ; $DC4F  C8
    INY                  ; $DC50  C8
    LDA ($10),Y          ; $DC51  B1 10
    INC $71              ; $DC53  E6 71
    JMP B07_CA92         ; $DC55  4C 92 CA
B07_DC58:
    LDA $08              ; $DC58  A5 08
    AND #$0F             ; $DC5A  29 0F
    BEQ B07_DC5F         ; $DC5C  F0 01
    RTS                  ; $DC5E  60
B07_DC5F:
    JMP B07_DE09         ; $DC5F  4C 09 DE
    .byte $00, $02, $00, $00, $03, $00, $00, $FE, $FF, $00, $FD, $FF ; $DC62
B07_DC6E:
    LDA $3D              ; $DC6E  A5 3D
    BEQ B07_DC73         ; $DC70  F0 01
    RTS                  ; $DC72  60
B07_DC73:
    LDA $3F              ; $DC73  A5 3F
    BEQ B07_DC86         ; $DC75  F0 0F
    LDA $3E              ; $DC77  A5 3E
    BEQ B07_DC86         ; $DC79  F0 0B
    LDA $3F              ; $DC7B  A5 3F
    STA $6A              ; $DC7D  85 6A
    LDA $51              ; $DC7F  A5 51
    AND #$07             ; $DC81  29 07
    BEQ B07_DCD0         ; $DC83  F0 4B
    RTS                  ; $DC85  60
B07_DC86:
    LDY $6A              ; $DC86  A4 6A
    BNE B07_DC8B         ; $DC88  D0 01
    RTS                  ; $DC8A  60
B07_DC8B:
    LDA #$00             ; $DC8B  A9 00
    DEY                  ; $DC8D  88
    BNE B07_DC92         ; $DC8E  D0 02
    LDA #$06             ; $DC90  A9 06
B07_DC92:
    TAY                  ; $DC92  A8
    LDA $0606            ; $DC93  AD 06 06
    BEQ B07_DC9B         ; $DC96  F0 03
    INY                  ; $DC98  C8
    INY                  ; $DC99  C8
    INY                  ; $DC9A  C8
B07_DC9B:
    LDA $51              ; $DC9B  A5 51
    STA $01              ; $DC9D  85 01
    LDA $E05A,Y          ; $DC9F  B9 5A E0
    CLC                  ; $DCA2  18
    ADC $6D              ; $DCA3  65 6D
    STA $6D              ; $DCA5  85 6D
    LDA $E05B,Y          ; $DCA7  B9 5B E0
    ADC $51              ; $DCAA  65 51
    STA $51              ; $DCAC  85 51
    PHA                  ; $DCAE  48
    LDA $E05C,Y          ; $DCAF  B9 5C E0
    ADC $52              ; $DCB2  65 52
    STA $52              ; $DCB4  85 52
    PLA                  ; $DCB6  68
    SEC                  ; $DCB7  38
    SBC $01              ; $DCB8  E5 01
    STA $41              ; $DCBA  85 41
    LDA $51              ; $DCBC  A5 51
    EOR $B7              ; $DCBE  45 B7
    AND #$08             ; $DCC0  29 08
    BNE B07_DCD0         ; $DCC2  D0 0C
    RTS                  ; $DCC4  60
    .byte $A5, $51, $05, $52, $D0, $04, $05, $B7, $D0, $01, $60 ; $DCC5
B07_DCD0:
    LDA $6A              ; $DCD0  A5 6A
    ASL A                ; $DCD2  0A
    TAY                  ; $DCD3  A8
    DEY                  ; $DCD4  88
    DEY                  ; $DCD5  88
    LDA $5C              ; $DCD6  A5 5C
    BNE B07_DCEA         ; $DCD8  D0 10
    LDA $E056,Y          ; $DCDA  B9 56 E0
    CLC                  ; $DCDD  18
    ADC $51              ; $DCDE  65 51
    AND #$F8             ; $DCE0  29 F8
    STA $0A              ; $DCE2  85 0A
    LDA $E057,Y          ; $DCE4  B9 57 E0
    JMP B07_DCF5         ; $DCE7  4C F5 DC
B07_DCEA:
    LDA $E052,Y          ; $DCEA  B9 52 E0
    CLC                  ; $DCED  18
    ADC $51              ; $DCEE  65 51
    STA $0A              ; $DCF0  85 0A
    LDA $E053,Y          ; $DCF2  B9 53 E0
B07_DCF5:
    ADC $52              ; $DCF5  65 52
    STA $0B              ; $DCF7  85 0B
    LDA $4F              ; $DCF9  A5 4F
    CLC                  ; $DCFB  18
    ADC #$08             ; $DCFC  69 08
    AND #$F0             ; $DCFE  29 F0
    STA $08              ; $DD00  85 08
    LDA $50              ; $DD02  A5 50
    ADC #$00             ; $DD04  69 00
    STA $09              ; $DD06  85 09
B07_DD08:
    JSR B07_DF23         ; $DD08  20 23 DF
    JSR B07_DF8D         ; $DD0B  20 8D DF
    JSR B07_E019         ; $DD0E  20 19 E0
    JSR B07_DEFC         ; $DD11  20 FC DE
    JSR B07_DF53         ; $DD14  20 53 DF
    LDA #$10             ; $DD17  A9 10
    STA $0D              ; $DD19  85 0D
    LDA #$00             ; $DD1B  A9 00
    STA $71              ; $DD1D  85 71
    LDA $22              ; $DD1F  A5 22
    STA $72              ; $DD21  85 72
    LDY $5C              ; $DD23  A4 5C
    LDA $DD89,Y          ; $DD25  B9 89 DD
    JSR B07_CEA7         ; $DD28  20 A7 CE
B07_DD2B:
    JSR B07_DD8B         ; $DD2B  20 8B DD
    LDA $08              ; $DD2E  A5 08
    CLC                  ; $DD30  18
    ADC #$10             ; $DD31  69 10
    STA $08              ; $DD33  85 08
    LDA $09              ; $DD35  A5 09
    ADC #$00             ; $DD37  69 00
    STA $09              ; $DD39  85 09
    DEC $0D              ; $DD3B  C6 0D
    BNE B07_DD2B         ; $DD3D  D0 EC
    LDA #$01             ; $DD3F  A9 01
    JSR B07_CEA7         ; $DD41  20 A7 CE
    LDA $0A              ; $DD44  A5 0A
    AND #$08             ; $DD46  29 08
    BNE B07_DD88         ; $DD48  D0 3E
    JSR B07_DEFC         ; $DD4A  20 FC DE
    LDA $14              ; $DD4D  A5 14
    LSR A                ; $DD4F  4A
    LSR A                ; $DD50  4A
    AND #$38             ; $DD51  29 38
    ORA #$C0             ; $DD53  09 C0
    STA $00              ; $DD55  85 00
    LDA #$23             ; $DD57  A9 23
    STA $03              ; $DD59  85 03
    LDA #$05             ; $DD5B  A9 05
    STA $01              ; $DD5D  85 01
    LDA $15              ; $DD5F  A5 15
    ROR A                ; $DD61  6A
    BCC B07_DD6A         ; $DD62  90 06
    LDA #$2B             ; $DD64  A9 2B
    STA $03              ; $DD66  85 03
    INC $01              ; $DD68  E6 01
B07_DD6A:
    LDA #$08             ; $DD6A  A9 08
    JSR B07_CA92         ; $DD6C  20 92 CA
    LDA $03              ; $DD6F  A5 03
    JSR B07_CA94         ; $DD71  20 94 CA
    LDA $00              ; $DD74  A5 00
    JSR B07_CA94         ; $DD76  20 94 CA
    LDY #$00             ; $DD79  A0 00
B07_DD7B:
    LDA ($00),Y          ; $DD7B  B1 00
    STA $0300,X          ; $DD7D  9D 00 03
    INX                  ; $DD80  E8
    INY                  ; $DD81  C8
    CPY #$08             ; $DD82  C0 08
    BNE B07_DD7B         ; $DD84  D0 F5
    STX $22              ; $DD86  86 22
B07_DD88:
    RTS                  ; $DD88  60
    .byte $04, $03 ; $DD89
B07_DD8B:
    LDA $08              ; $DD8B  A5 08
    LSR A                ; $DD8D  4A
    LSR A                ; $DD8E  4A
    LSR A                ; $DD8F  4A
    LSR A                ; $DD90  4A
    LSR A                ; $DD91  4A
    PHP                  ; $DD92  08
    STA $00              ; $DD93  85 00
    LDA #$00             ; $DD95  A9 00
    LDY $09              ; $DD97  A4 09
    CPY $B1              ; $DD99  C4 B1
    BEQ B07_DD9F         ; $DD9B  F0 02
    LDA #$08             ; $DD9D  A9 08
B07_DD9F:
    CLC                  ; $DD9F  18
    ADC $00              ; $DDA0  65 00
    TAY                  ; $DDA2  A8
    LDA $03B0,Y          ; $DDA3  B9 B0 03
    STA $B3              ; $DDA6  85 B3
    LDY $B2              ; $DDA8  A4 B2
    PLP                  ; $DDAA  28
    BCC B07_DDAF         ; $DDAB  90 02
    INY                  ; $DDAD  C8
    INY                  ; $DDAE  C8
B07_DDAF:
    STY $1A              ; $DDAF  84 1A
    JSR B07_DE24         ; $DDB1  20 24 DE
    LDY $B3              ; $DDB4  A4 B3
    LDA ($4D),Y          ; $DDB6  B1 4D
    STA $13              ; $DDB8  85 13
    JSR B07_DDC3         ; $DDBA  20 C3 DD
    JSR B07_DE1A         ; $DDBD  20 1A DE
    JMP B07_E03E         ; $DDC0  4C 3E E0
B07_DDC3:
    LDA #$02             ; $DDC3  A9 02
    JSR B07_CA92         ; $DDC5  20 92 CA
    LDA $6F              ; $DDC8  A5 6F
    JSR B07_CA94         ; $DDCA  20 94 CA
    LDA $70              ; $DDCD  A5 70
    JSR B07_CA94         ; $DDCF  20 94 CA
    LDY $1A              ; $DDD2  A4 1A
    LDA ($10),Y          ; $DDD4  B1 10
    JSR B07_CA94         ; $DDD6  20 94 CA
    INC $71              ; $DDD9  E6 71
    JSR B07_DE3A         ; $DDDB  20 3A DE
    LDY $1A              ; $DDDE  A4 1A
    LDA $DDF2,Y          ; $DDE0  B9 F2 DD
    TAY                  ; $DDE3  A8
    JSR B07_DE02         ; $DDE4  20 02 DE
    LDY $1A              ; $DDE7  A4 1A
    INY                  ; $DDE9  C8
    LDA ($10),Y          ; $DDEA  B1 10
    JSR B07_CA92         ; $DDEC  20 92 CA
    INC $71              ; $DDEF  E6 71
    RTS                  ; $DDF1  60
    .byte $00, $00, $01, $01, $00, $00, $01, $01, $02, $02, $03, $03, $02, $02, $03, $03 ; $DDF2
B07_DE02:
    LDA $0A              ; $DE02  A5 0A
    AND #$08             ; $DE04  29 08
    BEQ B07_DE09         ; $DE06  F0 01
    RTS                  ; $DE08  60
B07_DE09:
    TYA                  ; $DE09  98
    BEQ B07_DE13         ; $DE0A  F0 07
B07_DE0C:
    LSR $13              ; $DE0C  46 13
    LSR $13              ; $DE0E  46 13
    DEY                  ; $DE10  88
    BNE B07_DE0C         ; $DE11  D0 F9
B07_DE13:
    LDA $13              ; $DE13  A5 13
    AND #$03             ; $DE15  29 03
    STA $13              ; $DE17  85 13
    RTS                  ; $DE19  60
B07_DE1A:
    LDA $0A              ; $DE1A  A5 0A
    AND #$08             ; $DE1C  29 08
    BEQ B07_DE21         ; $DE1E  F0 01
    RTS                  ; $DE20  60
B07_DE21:
    JMP B07_D992         ; $DE21  4C 92 D9
B07_DE24:
    PHA                  ; $DE24  48
    LSR A                ; $DE25  4A
    LSR A                ; $DE26  4A
    LSR A                ; $DE27  4A
    LSR A                ; $DE28  4A
    TAY                  ; $DE29  A8
    PLA                  ; $DE2A  68
    ASL A                ; $DE2B  0A
    ASL A                ; $DE2C  0A
    ASL A                ; $DE2D  0A
    ASL A                ; $DE2E  0A
    CLC                  ; $DE2F  18
    ADC $4B              ; $DE30  65 4B
    STA $10              ; $DE32  85 10
    TYA                  ; $DE34  98
    ADC $4C              ; $DE35  65 4C
    STA $11              ; $DE37  85 11
    RTS                  ; $DE39  60
B07_DE3A:
    STY $03              ; $DE3A  84 03
    TAY                  ; $DE3C  A8
    LDA $0A              ; $DE3D  A5 0A
    AND #$08             ; $DE3F  29 08
    BEQ B07_DE4F         ; $DE41  F0 0C
    JMP B07_DEA2         ; $DE43  4C A2 DE
B07_DE46:
    STY $03              ; $DE46  84 03
    TAY                  ; $DE48  A8
    LDA $08              ; $DE49  A5 08
    AND #$0F             ; $DE4B  29 0F
    BNE B07_DEA2         ; $DE4D  D0 53
B07_DE4F:
    TYA                  ; $DE4F  98
    JSR B07_DEA5         ; $DE50  20 A5 DE
    STA $02              ; $DE53  85 02
    LDA $70              ; $DE55  A5 70
    AND #$02             ; $DE57  29 02
    BEQ B07_DE63         ; $DE59  F0 08
    ASL $02              ; $DE5B  06 02
    ASL $02              ; $DE5D  06 02
    ASL $02              ; $DE5F  06 02
    ASL $02              ; $DE61  06 02
B07_DE63:
    LDA $70              ; $DE63  A5 70
    LSR A                ; $DE65  4A
    LSR A                ; $DE66  4A
    PHA                  ; $DE67  48
    LSR A                ; $DE68  4A
    AND #$18             ; $DE69  29 18
    STA $00              ; $DE6B  85 00
    PLA                  ; $DE6D  68
    AND #$07             ; $DE6E  29 07
    ORA $00              ; $DE70  05 00
    STA $00              ; $DE72  85 00
    LDA $6F              ; $DE74  A5 6F
    ROR A                ; $DE76  6A
    ROR A                ; $DE77  6A
    ROR A                ; $DE78  6A
    ROR A                ; $DE79  6A
    AND #$60             ; $DE7A  29 60
    STA $01              ; $DE7C  85 01
    ROR A                ; $DE7E  6A
    AND #$80             ; $DE7F  29 80
    ORA $01              ; $DE81  05 01
    ORA $00              ; $DE83  05 00
    STA $00              ; $DE85  85 00
    LDA #$07             ; $DE87  A9 07
    STA $01              ; $DE89  85 01
    LDY #$00             ; $DE8B  A0 00
    LDA ($00),Y          ; $DE8D  B1 00
    PHA                  ; $DE8F  48
    LDA $70              ; $DE90  A5 70
    AND #$02             ; $DE92  29 02
    BEQ B07_DE9B         ; $DE94  F0 05
    PLA                  ; $DE96  68
    AND #$0F             ; $DE97  29 0F
    BPL B07_DE9E         ; $DE99  10 03
B07_DE9B:
    PLA                  ; $DE9B  68
    AND #$F0             ; $DE9C  29 F0
B07_DE9E:
    ORA $02              ; $DE9E  05 02
    STA ($00),Y          ; $DEA0  91 00
B07_DEA2:
    LDY $03              ; $DEA2  A4 03
    RTS                  ; $DEA4  60
B07_DEA5:
    STA $00              ; $DEA5  85 00
    LDY #$00             ; $DEA7  A0 00
B07_DEA9:
    LDA ($62),Y          ; $DEA9  B1 62
    CMP #$FF             ; $DEAB  C9 FF
    BEQ B07_DEB7         ; $DEAD  F0 08
    CMP $00              ; $DEAF  C5 00
    BCS B07_DEB7         ; $DEB1  B0 04
    INY                  ; $DEB3  C8
    INY                  ; $DEB4  C8
    BNE B07_DEA9         ; $DEB5  D0 F2
B07_DEB7:
    INY                  ; $DEB7  C8
    LDA ($62),Y          ; $DEB8  B1 62
    RTS                  ; $DEBA  60
B07_DEBB:
    LDA #$00             ; $DEBB  A9 00
    STA $0608            ; $DEBD  8D 08 06
    LDA $4F              ; $DEC0  A5 4F
    ORA $50              ; $DEC2  05 50
    BNE B07_DECD         ; $DEC4  D0 07
    LDA #$02             ; $DEC6  A9 02
    STA $0608            ; $DEC8  8D 08 06
    BNE B07_DEDF         ; $DECB  D0 12
B07_DECD:
    LDA $4F              ; $DECD  A5 4F
    CLC                  ; $DECF  18
    ADC #$02             ; $DED0  69 02
    LDA $50              ; $DED2  A5 50
    ADC #$01             ; $DED4  69 01
    LDY #$00             ; $DED6  A0 00
    CMP ($49),Y          ; $DED8  D1 49
    BCC B07_DEDF         ; $DEDA  90 03
    INC $0608            ; $DEDC  EE 08 06
B07_DEDF:
    RTS                  ; $DEDF  60
B07_DEE0:
    LDA $4F              ; $DEE0  A5 4F
    STA $FD              ; $DEE2  85 FD
    LDA $51              ; $DEE4  A5 51
    STA $0A              ; $DEE6  85 0A
    LDA $52              ; $DEE8  A5 52
    STA $0B              ; $DEEA  85 0B
    JSR B07_DEFC         ; $DEEC  20 FC DE
    LDA $14              ; $DEEF  A5 14
    STA $FC              ; $DEF1  85 FC
    LDA $15              ; $DEF3  A5 15
    AND #$01             ; $DEF5  29 01
    ASL A                ; $DEF7  0A
    STA $03DF            ; $DEF8  8D DF 03
    RTS                  ; $DEFB  60
B07_DEFC:
    LDA $0A              ; $DEFC  A5 0A
    STA $14              ; $DEFE  85 14
    LDA $0B              ; $DF00  A5 0B
    STA $15              ; $DF02  85 15
    LDY #$00             ; $DF04  A0 00
B07_DF06:
    LDA $15              ; $DF06  A5 15
    BNE B07_DF10         ; $DF08  D0 06
    LDA $14              ; $DF0A  A5 14
    CMP #$F0             ; $DF0C  C9 F0
    BCC B07_DF20         ; $DF0E  90 10
B07_DF10:
    LDA $14              ; $DF10  A5 14
    SEC                  ; $DF12  38
    SBC #$F0             ; $DF13  E9 F0
    STA $14              ; $DF15  85 14
    LDA $15              ; $DF17  A5 15
    SBC #$00             ; $DF19  E9 00
    STA $15              ; $DF1B  85 15
    INY                  ; $DF1D  C8
    BNE B07_DF06         ; $DF1E  D0 E6
B07_DF20:
    STY $15              ; $DF20  84 15
    RTS                  ; $DF22  60
B07_DF23:
    LDA $0A              ; $DF23  A5 0A
    STA $53              ; $DF25  85 53
    LDA $0B              ; $DF27  A5 0B
    STA $54              ; $DF29  85 54
    LDY #$00             ; $DF2B  A0 00
    LDA #$C0             ; $DF2D  A9 C0
    STA $00              ; $DF2F  85 00
    LDA $5C              ; $DF31  A5 5C
    BNE B07_DF36         ; $DF33  D0 01
    RTS                  ; $DF35  60
B07_DF36:
    LDA $54              ; $DF36  A5 54
    BNE B07_DF40         ; $DF38  D0 06
    LDA $53              ; $DF3A  A5 53
    CMP $00              ; $DF3C  C5 00
    BCC B07_DF50         ; $DF3E  90 10
B07_DF40:
    LDA $53              ; $DF40  A5 53
    SEC                  ; $DF42  38
    SBC $00              ; $DF43  E5 00
    STA $53              ; $DF45  85 53
    LDA $54              ; $DF47  A5 54
    SBC #$00             ; $DF49  E9 00
    STA $54              ; $DF4B  85 54
    INY                  ; $DF4D  C8
    BNE B07_DF36         ; $DF4E  D0 E6
B07_DF50:
    STY $54              ; $DF50  84 54
    RTS                  ; $DF52  60
B07_DF53:
    LDA $15              ; $DF53  A5 15
    AND #$01             ; $DF55  29 01
    ASL A                ; $DF57  0A
    ASL A                ; $DF58  0A
    ASL A                ; $DF59  0A
    STA $6F              ; $DF5A  85 6F
    LDA $14              ; $DF5C  A5 14
    PHA                  ; $DF5E  48
    ROL A                ; $DF5F  2A
    ROL A                ; $DF60  2A
    ROL A                ; $DF61  2A
    AND #$03             ; $DF62  29 03
    ORA #$20             ; $DF64  09 20
    ORA $6F              ; $DF66  05 6F
    STA $6F              ; $DF68  85 6F
    PLA                  ; $DF6A  68
    ASL A                ; $DF6B  0A
    ASL A                ; $DF6C  0A
    AND #$E0             ; $DF6D  29 E0
    STA $70              ; $DF6F  85 70
    LDA $08              ; $DF71  A5 08
    LSR A                ; $DF73  4A
    LSR A                ; $DF74  4A
    LSR A                ; $DF75  4A
    AND #$1F             ; $DF76  29 1F
    ORA $70              ; $DF78  05 70
    STA $70              ; $DF7A  85 70
    RTS                  ; $DF7C  60
B07_DF7D:
    LDY $72              ; $DF7D  A4 72
    LDA $71              ; $DF7F  A5 71
    STA $0300,Y          ; $DF81  99 00 03
    LDA #$00             ; $DF84  A9 00
    STA $71              ; $DF86  85 71
    LDA $22              ; $DF88  A5 22
    STA $72              ; $DF8A  85 72
    RTS                  ; $DF8C  60
B07_DF8D:
    LDY #$00             ; $DF8D  A0 00
    STY $00              ; $DF8F  84 00
    LDA ($49),Y          ; $DF91  B1 49
    STA $01              ; $DF93  85 01
    LDY $54              ; $DF95  A4 54
B07_DF97:
    DEY                  ; $DF97  88
    BMI B07_DFA3         ; $DF98  30 09
    LDA $00              ; $DF9A  A5 00
    CLC                  ; $DF9C  18
    ADC $01              ; $DF9D  65 01
    STA $00              ; $DF9F  85 00
    BNE B07_DF97         ; $DFA1  D0 F4
B07_DFA3:
    LDA $00              ; $DFA3  A5 00
    CLC                  ; $DFA5  18
    ADC $09              ; $DFA6  65 09
    TAY                  ; $DFA8  A8
    INY                  ; $DFA9  C8
    INY                  ; $DFAA  C8
    LDA ($49),Y          ; $DFAB  B1 49
    STA $02              ; $DFAD  85 02
    CMP #$FF             ; $DFAF  C9 FF
    BNE B07_DFB5         ; $DFB1  D0 02
    INC $02              ; $DFB3  E6 02
B07_DFB5:
    INY                  ; $DFB5  C8
    LDA ($49),Y          ; $DFB6  B1 49
    STA $03              ; $DFB8  85 03
    CMP #$FF             ; $DFBA  C9 FF
    BNE B07_DFC0         ; $DFBC  D0 02
    INC $03              ; $DFBE  E6 03
B07_DFC0:
    LDA $02              ; $DFC0  A5 02
    JSR B07_DFDB         ; $DFC2  20 DB DF
    LDA $04              ; $DFC5  A5 04
    STA $B1              ; $DFC7  85 B1
    LDA $05              ; $DFC9  A5 05
    STA $B2              ; $DFCB  85 B2
    LDA $03              ; $DFCD  A5 03
    JSR B07_DFDB         ; $DFCF  20 DB DF
    LDA $04              ; $DFD2  A5 04
    STA $B3              ; $DFD4  85 B3
    LDA $05              ; $DFD6  A5 05
    STA $B4              ; $DFD8  85 B4
    RTS                  ; $DFDA  60
B07_DFDB:
    LDY $5C              ; $DFDB  A4 5C
    BNE B07_DFF0         ; $DFDD  D0 11
    PHA                  ; $DFDF  48
    LSR A                ; $DFE0  4A
    LSR A                ; $DFE1  4A
    STA $01              ; $DFE2  85 01
    PLA                  ; $DFE4  68
    ROR A                ; $DFE5  6A
    ROR A                ; $DFE6  6A
    ROR A                ; $DFE7  6A
    AND #$C0             ; $DFE8  29 C0
    STA $00              ; $DFEA  85 00
    LDY #$01             ; $DFEC  A0 01
    BNE B07_E000         ; $DFEE  D0 10
B07_DFF0:
    PHA                  ; $DFF0  48
    LSR A                ; $DFF1  4A
    LSR A                ; $DFF2  4A
    LSR A                ; $DFF3  4A
    LSR A                ; $DFF4  4A
    STA $01              ; $DFF5  85 01
    PLA                  ; $DFF7  68
    ASL A                ; $DFF8  0A
    ASL A                ; $DFF9  0A
    ASL A                ; $DFFA  0A
    ASL A                ; $DFFB  0A
    STA $00              ; $DFFC  85 00
    LDY #$03             ; $DFFE  A0 03
B07_E000:
    LDA $60              ; $E000  A5 60
    STA $04              ; $E002  85 04
    LDA $61              ; $E004  A5 61
    STA $05              ; $E006  85 05
B07_E008:
    LDA $04              ; $E008  A5 04
    CLC                  ; $E00A  18
    ADC $00              ; $E00B  65 00
    STA $04              ; $E00D  85 04
    LDA $05              ; $E00F  A5 05
    ADC $01              ; $E011  65 01
    STA $05              ; $E013  85 05
    DEY                  ; $E015  88
    BNE B07_E008         ; $E016  D0 F0
    RTS                  ; $E018  60
B07_E019:
    LDA $53              ; $E019  A5 53
    LSR A                ; $E01B  4A
    LSR A                ; $E01C  4A
    AND #$38             ; $E01D  29 38
    TAY                  ; $E01F  A8
    LDX #$00             ; $E020  A2 00
B07_E022:
    LDA ($B1),Y          ; $E022  B1 B1
    STA $03B0,X          ; $E024  9D B0 03
    LDA ($B3),Y          ; $E027  B1 B3
    STA $03B8,X          ; $E029  9D B8 03
    INY                  ; $E02C  C8
    INX                  ; $E02D  E8
    CPX #$08             ; $E02E  E0 08
    BNE B07_E022         ; $E030  D0 F0
    LDA $09              ; $E032  A5 09
    STA $B1              ; $E034  85 B1
    LDA $53              ; $E036  A5 53
    AND #$18             ; $E038  29 18
    LSR A                ; $E03A  4A
    STA $B2              ; $E03B  85 B2
    RTS                  ; $E03D  60
B07_E03E:
    LDA $70              ; $E03E  A5 70
    CLC                  ; $E040  18
    ADC #$02             ; $E041  69 02
    STA $70              ; $E043  85 70
    AND #$1F             ; $E045  29 1F
    BEQ B07_E04A         ; $E047  F0 01
    RTS                  ; $E049  60
B07_E04A:
    LDA $70              ; $E04A  A5 70
    SEC                  ; $E04C  38
    SBC #$20             ; $E04D  E9 20
    STA $70              ; $E04F  85 70
    RTS                  ; $E051  60
    .byte $F8, $FF, $C0, $00, $FC, $FF, $E4, $00, $00, $02, $00, $00, $03, $00, $00, $FE ; $E052
    .byte $FF, $00, $FD, $FF, $A4, $67, $B9, $73, $00, $C9, $02, $F0, $16, $20, $BB, $EE ; $E062
    .byte $90, $01, $60, $20, $AA, $E0, $A6, $67, $D6, $A8, $D0, $06, $A9, $00, $95, $73 ; $E072
    .byte $85, $5B, $60, $20, $BB, $EE, $90, $01, $60, $20, $AA, $E0, $20, $BB, $EE, $B0 ; $E082
    .byte $E5, $20, $AA, $E0, $A9, $FF, $9D, $B0, $04, $20, $BB, $EE, $B0, $D8, $20, $AA ; $E092
    .byte $E0, $A9, $01, $9D, $B0, $04, $D0, $CE, $20, $48, $EF, $AD, $50, $04, $29, $01 ; $E0A2
    .byte $09, $C2, $9D, $50, $04, $A4, $67, $B9, $73, $00, $A8, $B9, $FF, $E0, $9D, $70 ; $E0B2
    .byte $05, $B9, $03, $E1, $9D, $40, $04, $A9, $0A, $9D, $30, $06, $A9, $03, $9D, $20 ; $E0C2
    .byte $04, $AD, $80, $04, $9D, $80, $04, $AD, $60, $04, $9D, $60, $04, $AD, $70, $05 ; $E0D2
    .byte $C9, $84, $D0, $09, $BD, $60, $04, $18, $69, $0C, $9D, $60, $04, $A9, $05, $9D ; $E0E2
    .byte $E0, $04, $AD, $50, $04, $6A, $90, $03, $A9, $FB, $9D, $E0, $04, $60, $D7, $D7 ; $E0F2
    .byte $D6, $D5, $1A, $1A, $27, $28, $20, $27, $E1, $AD, $70, $05, $18, $69, $0C, $8D ; $E102
    .byte $71, $05, $60, $20, $27, $E1, $A5, $67, $0A, $0A, $6D, $20, $05, $A8, $B9, $35 ; $E112
    .byte $E1, $8D, $71, $05, $60, $A2, $01, $A9, $C2, $8D, $51, $04, $AD, $20, $04, $8D ; $E122
    .byte $21, $04, $60, $B1, $B0, $B2, $B2, $B4, $B3, $B5, $B5, $B7, $B6, $B8, $B8, $BA ; $E132
    .byte $B9, $BB, $BB ; $E142
B07_E145:
    LDA $5C              ; $E145  A5 5C
    BNE B07_E14C         ; $E147  D0 03
    JMP B07_E1E5         ; $E149  4C E5 E1
B07_E14C:
    JSR B07_E152         ; $E14C  20 52 E1
    JMP B07_E325         ; $E14F  4C 25 E3
B07_E152:
    LDX #$01             ; $E152  A2 01
    LDA $0571            ; $E154  AD 71 05
    BNE B07_E15A         ; $E157  D0 01
    RTS                  ; $E159  60
B07_E15A:
    CMP #$D8             ; $E15A  C9 D8
    BNE B07_E161         ; $E15C  D0 03
    JMP B07_E385         ; $E15E  4C 85 E3
B07_E161:
    LDA $0450            ; $E161  AD 50 04
    BPL B07_E174         ; $E164  10 0E
    LDA $0411            ; $E166  AD 11 04
    CMP #$FF             ; $E169  C9 FF
    BEQ B07_E174         ; $E16B  F0 07
    LDA $0540            ; $E16D  AD 40 05
    AND #$40             ; $E170  29 40
    BEQ B07_E179         ; $E172  F0 05
B07_E174:
    LDX #$01             ; $E174  A2 01
    JMP B07_EF48         ; $E176  4C 48 EF
B07_E179:
    JSR B07_E218         ; $E179  20 18 E2
    LDA $0401            ; $E17C  AD 01 04
    BNE B07_E182         ; $E17F  D0 01
    RTS                  ; $E181  60
B07_E182:
    LDA $0571            ; $E182  AD 71 05
    SEC                  ; $E185  38
    SBC #$9C             ; $E186  E9 9C
    ASL A                ; $E188  0A
    TAY                  ; $E189  A8
    LDA $E23F,Y          ; $E18A  B9 3F E2
    STA $00              ; $E18D  85 00
    LDA $E240,Y          ; $E18F  B9 40 E2
    STA $01              ; $E192  85 01
    LDA $0411            ; $E194  AD 11 04
    ASL A                ; $E197  0A
    TAY                  ; $E198  A8
    DEY                  ; $E199  88
    DEY                  ; $E19A  88
    LDA ($00),Y          ; $E19B  B1 00
    STA $02              ; $E19D  85 02
B07_E19F:
    LDA $0451            ; $E19F  AD 51 04
    ROR A                ; $E1A2  6A
    BCS B07_E1AE         ; $E1A3  B0 09
    LDA $0481            ; $E1A5  AD 81 04
    CLC                  ; $E1A8  18
    ADC $02              ; $E1A9  65 02
    JMP B07_E1B4         ; $E1AB  4C B4 E1
B07_E1AE:
    LDA $0481            ; $E1AE  AD 81 04
    SEC                  ; $E1B1  38
    SBC $02              ; $E1B2  E5 02
B07_E1B4:
    STA $0481            ; $E1B4  8D 81 04
    INY                  ; $E1B7  C8
    LDA ($00),Y          ; $E1B8  B1 00
    CLC                  ; $E1BA  18
    ADC $0461            ; $E1BB  6D 61 04
    STA $0461            ; $E1BE  8D 61 04
    LDA $0480            ; $E1C1  AD 80 04
    CMP #$1D             ; $E1C4  C9 1D
    BCS B07_E1D1         ; $E1C6  B0 09
    LDA $0450            ; $E1C8  AD 50 04
    AND #$01             ; $E1CB  29 01
    BEQ B07_E1E4         ; $E1CD  F0 15
    BNE B07_E1DC         ; $E1CF  D0 0B
B07_E1D1:
    CMP #$E4             ; $E1D1  C9 E4
    BCC B07_E1E4         ; $E1D3  90 0F
    LDA $0450            ; $E1D5  AD 50 04
    AND #$01             ; $E1D8  29 01
    BNE B07_E1E4         ; $E1DA  D0 08
B07_E1DC:
    LDA $0451            ; $E1DC  AD 51 04
    AND #$FD             ; $E1DF  29 FD
    STA $0451            ; $E1E1  8D 51 04
B07_E1E4:
    RTS                  ; $E1E4  60
B07_E1E5:
    JSR B07_E218         ; $E1E5  20 18 E2
    LDA $0401            ; $E1E8  AD 01 04
    BEQ B07_E1E4         ; $E1EB  F0 F7
    LDY $0411            ; $E1ED  AC 11 04
    INY                  ; $E1F0  C8
    BNE B07_E1FA         ; $E1F1  D0 07
    STY $0401            ; $E1F3  8C 01 04
    STY $0571            ; $E1F6  8C 71 05
    RTS                  ; $E1F9  60
B07_E1FA:
    LDA $0571            ; $E1FA  AD 71 05
    SEC                  ; $E1FD  38
    SBC #$B0             ; $E1FE  E9 B0
    ASL A                ; $E200  0A
    TAY                  ; $E201  A8
    LDA $E2DD,Y          ; $E202  B9 DD E2
    STA $00              ; $E205  85 00
    LDA $E2DE,Y          ; $E207  B9 DE E2
    STA $01              ; $E20A  85 01
    LDA $0411            ; $E20C  AD 11 04
    ASL A                ; $E20F  0A
    TAY                  ; $E210  A8
    LDA ($00),Y          ; $E211  B1 00
    STA $02              ; $E213  85 02
    JMP B07_E19F         ; $E215  4C 9F E1
B07_E218:
    LDA $0460            ; $E218  AD 60 04
    STA $0461            ; $E21B  8D 61 04
    LDA $0470            ; $E21E  AD 70 04
    STA $0471            ; $E221  8D 71 04
    LDA $0480            ; $E224  AD 80 04
    STA $0481            ; $E227  8D 81 04
    LDA $0490            ; $E22A  AD 90 04
    STA $0491            ; $E22D  8D 91 04
    LDA $0450            ; $E230  AD 50 04
    ROR A                ; $E233  6A
    LDA $0451            ; $E234  AD 51 04
    AND #$FE             ; $E237  29 FE
    ADC #$00             ; $E239  69 00
    STA $0451            ; $E23B  8D 51 04
    RTS                  ; $E23E  60
    .byte $57, $E2, $5F, $E2, $65, $E2, $6D, $E2, $77, $E2, $7B, $E2, $85, $E2, $91, $E2 ; $E23F
    .byte $9D, $E2, $A9, $E2, $BD, $E2, $CD, $E2, $0B, $FB, $16, $FE, $0F, $EC, $03, $E0 ; $E24F
    .byte $FA, $E9, $1B, $F8, $17, $11, $0F, $00, $15, $0F, $0D, $20, $07, $28, $FD, $01 ; $E25F
    .byte $06, $01, $11, $F1, $04, $D8, $04, $D8, $FD, $01, $23, $FE, $05, $FA, $08, $FC ; $E26F
    .byte $10, $0C, $06, $30, $06, $30, $0B, $01, $0E, $0D, $16, $08, $1A, $04, $07, $ED ; $E27F
    .byte $F9, $F8, $04, $01, $12, $F9, $1B, $FF, $19, $0E, $14, $10, $02, $08, $04, $09 ; $E28F
    .byte $12, $00, $1B, $06, $19, $15, $14, $17, $02, $0F, $08, $FA, $0E, $F9, $10, $F4 ; $E29F
    .byte $04, $E8, $FE, $E9, $FD, $ED, $0C, $FA, $0C, $ED, $0C, $E8, $04, $E8, $08, $FA ; $E2AF
    .byte $FE, $E9, $17, $F9, $17, $09, $10, $0B, $0F, $F6, $11, $F4, $15, $01, $08, $01 ; $E2BF
    .byte $FE, $F1, $17, $00, $17, $10, $10, $12, $0F, $FD, $11, $FB, $15, $08, $F5, $E2 ; $E2CF
    .byte $F9, $E2, $FD, $E2, $01, $E3, $05, $E3, $09, $E3, $0D, $E3, $11, $E3, $15, $E3 ; $E2DF
    .byte $19, $E3, $1D, $E3, $21, $E3, $04, $EF, $04, $EF, $FE, $12, $FE, $12, $0D, $01 ; $E2EF
    .byte $0D, $01, $04, $EF, $04, $EF, $FE, $12, $FE, $12, $0D, $01, $0D, $01, $06, $EF ; $E2FF
    .byte $03, $EF, $00, $12, $FD, $12, $0D, $01, $0D, $FE, $04, $EF, $04, $EF, $FE, $12 ; $E30F
    .byte $FE, $12, $11, $01, $11, $01 ; $E31F
B07_E325:
    LDX #$0D             ; $E325  A2 0D
    LDA $0445            ; $E327  AD 45 04
    CMP #$73             ; $E32A  C9 73
    BEQ B07_E32F         ; $E32C  F0 01
    RTS                  ; $E32E  60
B07_E32F:
    LDA $0405            ; $E32F  AD 05 04
    SEC                  ; $E332  38
    SBC #$82             ; $E333  E9 82
    CMP #$08             ; $E335  C9 08
    BCC B07_E33C         ; $E337  90 03
    JMP B07_EF48         ; $E339  4C 48 EF
B07_E33C:
    ASL A                ; $E33C  0A
    TAY                  ; $E33D  A8
    LDA $E375,Y          ; $E33E  B9 75 E3
    STA $00              ; $E341  85 00
    LDA $E376,Y          ; $E343  B9 76 E3
    STA $01              ; $E346  85 01
    LDA $0455            ; $E348  AD 55 04
    ROR A                ; $E34B  6A
    BCC B07_E357         ; $E34C  90 09
    LDA $00              ; $E34E  A5 00
    EOR #$FF             ; $E350  49 FF
    CLC                  ; $E352  18
    ADC #$01             ; $E353  69 01
    STA $00              ; $E355  85 00
B07_E357:
    LDA $0485            ; $E357  AD 85 04
    CLC                  ; $E35A  18
    ADC $00              ; $E35B  65 00
    STA $0480,X          ; $E35D  9D 80 04
    LDA $0465            ; $E360  AD 65 04
    CLC                  ; $E363  18
    ADC $01              ; $E364  65 01
    STA $0460,X          ; $E366  9D 60 04
    LDA #$94             ; $E369  A9 94
    STA $0400,X          ; $E36B  9D 00 04
    LDA $0455            ; $E36E  AD 55 04
    STA $0450,X          ; $E371  9D 50 04
B07_E374:
    RTS                  ; $E374  60
    .byte $0B, $F3, $0B, $F3, $0C, $ED, $0C, $ED, $05, $ED, $05, $ED, $05, $ED, $05, $ED ; $E375
B07_E385:
    LDX #$01             ; $E385  A2 01
    JSR B07_EF0A         ; $E387  20 0A EF
    LDA $40              ; $E38A  A5 40
    EOR #$FF             ; $E38C  49 FF
    SEC                  ; $E38E  38
    ADC $0481            ; $E38F  6D 81 04
    STA $0481            ; $E392  8D 81 04
    LDA $7E              ; $E395  A5 7E
    LSR A                ; $E397  4A
    LSR A                ; $E398  4A
    LSR A                ; $E399  4A
    AND #$1E             ; $E39A  29 1E
    TAY                  ; $E39C  A8
    LDA $E3C4,Y          ; $E39D  B9 C4 E3
    CLC                  ; $E3A0  18
    ADC $0481            ; $E3A1  6D 81 04
    STA $0481            ; $E3A4  8D 81 04
    LDA $E3C5,Y          ; $E3A7  B9 C5 E3
    CLC                  ; $E3AA  18
    ADC $0461            ; $E3AB  6D 61 04
    CMP #$F0             ; $E3AE  C9 F0
    BCS B07_E3C1         ; $E3B0  B0 0F
    STA $0461            ; $E3B2  8D 61 04
    STA $01              ; $E3B5  85 01
    LDA $0481            ; $E3B7  AD 81 04
    STA $00              ; $E3BA  85 00
    JSR B07_C7C7         ; $E3BC  20 C7 C7
    BEQ B07_E374         ; $E3BF  F0 B3
B07_E3C1:
    JMP B07_EF48         ; $E3C1  4C 48 EF
    .byte $00, $00, $00, $FF, $00, $01, $FF, $00, $01, $00, $FE, $C9, $FD, $BC, $28, $CA ; $E3C4
    .byte $36, $CA, $48, $B9, $36, $CA, $36, $CA, $36, $B0, $99, $B1, $19, $B3, $A9, $B7 ; $E3D4
    .byte $41, $B9, $43, $CA, $46, $B9, $D4, $BC, $8D, $BB, $E1, $B4, $42, $B5, $EE, $BD ; $E3E4
    .byte $AC, $84 ; $E3F4
B07_E3F6:
    LDA $03E4            ; $E3F6  AD E4 03
    BNE B07_E3FC         ; $E3F9  D0 01
B07_E3FB:
    RTS                  ; $E3FB  60
B07_E3FC:
    LDA $51              ; $E3FC  A5 51
    ORA $52              ; $E3FE  05 52
    BNE B07_E3FB         ; $E400  D0 F9
    LDA $48              ; $E402  A5 48
    CMP #$02             ; $E404  C9 02
    BEQ B07_E40D         ; $E406  F0 05
    CMP #$03             ; $E408  C9 03
    BEQ B07_E443         ; $E40A  F0 37
    RTS                  ; $E40C  60
B07_E40D:
    LDA $5D              ; $E40D  A5 5D
    CMP #$04             ; $E40F  C9 04
    BNE B07_E3FB         ; $E411  D0 E8
    LDA $03E4            ; $E413  AD E4 03
    AND #$01             ; $E416  29 01
    BEQ B07_E3FB         ; $E418  F0 E1
    LDA #$01             ; $E41A  A9 01
    STA $07              ; $E41C  85 07
    LDA $E4B8            ; $E41E  AD B8 E4
    STA $00              ; $E421  85 00
    LDA $E4B9            ; $E423  AD B9 E4
    STA $01              ; $E426  85 01
    LDA $E4C0            ; $E428  AD C0 E4
    STA $02              ; $E42B  85 02
    LDA $E4C1            ; $E42D  AD C1 E4
    STA $03              ; $E430  85 03
    JSR B07_E497         ; $E432  20 97 E4
    BCC B07_E442         ; $E435  90 0B
    LDA #$00             ; $E437  A9 00
    STA $12              ; $E439  85 12
    JSR B07_E4C8         ; $E43B  20 C8 E4
    LDA #$00             ; $E43E  A9 00
    STA $5E              ; $E440  85 5E
B07_E442:
    RTS                  ; $E442  60
B07_E443:
    LDA $5D              ; $E443  A5 5D
    BEQ B07_E448         ; $E445  F0 01
    RTS                  ; $E447  60
B07_E448:
    LDA $03E4            ; $E448  AD E4 03
    AND #$0E             ; $E44B  29 0E
    BNE B07_E450         ; $E44D  D0 01
    RTS                  ; $E44F  60
B07_E450:
    LDA #$03             ; $E450  A9 03
    STA $17              ; $E452  85 17
B07_E454:
    LDA $17              ; $E454  A5 17
    TAY                  ; $E456  A8
    LDA #$00             ; $E457  A9 00
    STA $07              ; $E459  85 07
    LDA $E652,Y          ; $E45B  B9 52 E6
    AND $03E4            ; $E45E  2D E4 03
    BEQ B07_E467         ; $E461  F0 04
    LDA #$01             ; $E463  A9 01
    STA $07              ; $E465  85 07
B07_E467:
    LDA $17              ; $E467  A5 17
    ASL A                ; $E469  0A
    TAY                  ; $E46A  A8
    LDA $E4B8,Y          ; $E46B  B9 B8 E4
    STA $00              ; $E46E  85 00
    LDA $E4B9,Y          ; $E470  B9 B9 E4
    STA $01              ; $E473  85 01
    LDA $E4C0,Y          ; $E475  B9 C0 E4
    STA $02              ; $E478  85 02
    LDA $E4C1,Y          ; $E47A  B9 C1 E4
    STA $03              ; $E47D  85 03
    JSR B07_E497         ; $E47F  20 97 E4
    BCC B07_E492         ; $E482  90 0E
    LDY $17              ; $E484  A4 17
    LDA $E656,Y          ; $E486  B9 56 E6
    STA $12              ; $E489  85 12
    JSR B07_E4C8         ; $E48B  20 C8 E4
    LDA #$00             ; $E48E  A9 00
    STA $5E              ; $E490  85 5E
B07_E492:
    DEC $17              ; $E492  C6 17
    BNE B07_E454         ; $E494  D0 BE
    RTS                  ; $E496  60
B07_E497:
    LDA $4F              ; $E497  A5 4F
    SEC                  ; $E499  38
    SBC $03              ; $E49A  E5 03
    LDA $50              ; $E49C  A5 50
    SBC $02              ; $E49E  E5 02
    BCS B07_E4B6         ; $E4A0  B0 14
    LDA $50              ; $E4A2  A5 50
    CLC                  ; $E4A4  18
    ADC #$01             ; $E4A5  69 01
    STA $08              ; $E4A7  85 08
    LDA $4F              ; $E4A9  A5 4F
    SEC                  ; $E4AB  38
    SBC $01              ; $E4AC  E5 01
    LDA $08              ; $E4AE  A5 08
    SBC $00              ; $E4B0  E5 00
    BCC B07_E4B6         ; $E4B2  90 02
    SEC                  ; $E4B4  38
    RTS                  ; $E4B5  60
B07_E4B6:
    CLC                  ; $E4B6  18
    RTS                  ; $E4B7  60
    .byte $03, $70, $01, $B0, $02, $B0, $03, $B0, $03, $F8, $02, $38, $03, $38, $04, $78 ; $E4B8
B07_E4C8:
    LDA #$00             ; $E4C8  A9 00
    STA $0E              ; $E4CA  85 0E
    LDA $01              ; $E4CC  A5 01
    STA $09              ; $E4CE  85 09
    SEC                  ; $E4D0  38
    SBC $4F              ; $E4D1  E5 4F
    STA $0D              ; $E4D3  85 0D
    LDA $00              ; $E4D5  A5 00
    STA $08              ; $E4D7  85 08
    SBC $50              ; $E4D9  E5 50
    BCS B07_E4E9         ; $E4DB  B0 0C
    LDA $0D              ; $E4DD  A5 0D
    STA $0E              ; $E4DF  85 0E
    LDA $4F              ; $E4E1  A5 4F
    STA $09              ; $E4E3  85 09
    LDA $50              ; $E4E5  A5 50
    STA $08              ; $E4E7  85 08
B07_E4E9:
    LDY $12              ; $E4E9  A4 12
    LDA $E65A,Y          ; $E4EB  B9 5A E6
    STA $10              ; $E4EE  85 10
    LDA $E65B,Y          ; $E4F0  B9 5B E6
    STA $11              ; $E4F3  85 11
    LDA $4F              ; $E4F5  A5 4F
    CLC                  ; $E4F7  18
    ADC #$F0             ; $E4F8  69 F0
    STA $0C              ; $E4FA  85 0C
    LDA $50              ; $E4FC  A5 50
    ADC #$00             ; $E4FE  69 00
    STA $0D              ; $E500  85 0D
    LDA $03              ; $E502  A5 03
    STA $0B              ; $E504  85 0B
    SEC                  ; $E506  38
    SBC $0C              ; $E507  E5 0C
    LDA $02              ; $E509  A5 02
    STA $0A              ; $E50B  85 0A
    SBC $0D              ; $E50D  E5 0D
    BCC B07_E519         ; $E50F  90 08
    LDA $0C              ; $E511  A5 0C
    STA $0B              ; $E513  85 0B
    LDA $0D              ; $E515  A5 0D
    STA $0A              ; $E517  85 0A
B07_E519:
    LDA $07              ; $E519  A5 07
    BNE B07_E520         ; $E51B  D0 03
    JMP B07_E5A3         ; $E51D  4C A3 E5
B07_E520:
    LDA $09              ; $E520  A5 09
    AND #$F8             ; $E522  29 F8
    STA $09              ; $E524  85 09
    LDA $0B              ; $E526  A5 0B
    AND #$F8             ; $E528  29 F8
    STA $0B              ; $E52A  85 0B
    SEC                  ; $E52C  38
    SBC $09              ; $E52D  E5 09
    STA $0C              ; $E52F  85 0C
    LDA $0A              ; $E531  A5 0A
    SBC $08              ; $E533  E5 08
    BCS B07_E538         ; $E535  B0 01
    RTS                  ; $E537  60
B07_E538:
    LDA $22              ; $E538  A5 22
    STA $16              ; $E53A  85 16
    LDA $0C              ; $E53C  A5 0C
    CLC                  ; $E53E  18
    ADC #$08             ; $E53F  69 08
    STA $0C              ; $E541  85 0C
    LSR A                ; $E543  4A
    LSR A                ; $E544  4A
    LSR A                ; $E545  4A
    STA $0C              ; $E546  85 0C
    STA $0D              ; $E548  85 0D
    JSR B07_CA92         ; $E54A  20 92 CA
    LDA #$22             ; $E54D  A9 22
    JSR B07_CA94         ; $E54F  20 94 CA
    LDA $09              ; $E552  A5 09
    LSR A                ; $E554  4A
    LSR A                ; $E555  4A
    LSR A                ; $E556  4A
    CLC                  ; $E557  18
    ADC #$40             ; $E558  69 40
    STA $15              ; $E55A  85 15
    JSR B07_CA94         ; $E55C  20 94 CA
    LDA $0E              ; $E55F  A5 0E
    EOR #$FF             ; $E561  49 FF
    CLC                  ; $E563  18
    ADC #$01             ; $E564  69 01
    LSR A                ; $E566  4A
    LSR A                ; $E567  4A
    LSR A                ; $E568  4A
    TAY                  ; $E569  A8
B07_E56A:
    LDA ($10),Y          ; $E56A  B1 10
    JSR B07_CA94         ; $E56C  20 94 CA
    INC $15              ; $E56F  E6 15
    LDA $15              ; $E571  A5 15
    CMP #$60             ; $E573  C9 60
    BCC B07_E59E         ; $E575  90 27
    DEC $0D              ; $E577  C6 0D
    LDA $0C              ; $E579  A5 0C
    SEC                  ; $E57B  38
    SBC $0D              ; $E57C  E5 0D
    LDX $16              ; $E57E  A6 16
    STA $0300,X          ; $E580  9D 00 03
    LDA $0D              ; $E583  A5 0D
    JSR B07_CA92         ; $E585  20 92 CA
    LDA #$22             ; $E588  A9 22
    JSR B07_CA94         ; $E58A  20 94 CA
    LDA #$40             ; $E58D  A9 40
    JSR B07_CA94         ; $E58F  20 94 CA
    LDA #$40             ; $E592  A9 40
    STA $15              ; $E594  85 15
    INY                  ; $E596  C8
    LDA $0D              ; $E597  A5 0D
    BNE B07_E56A         ; $E599  D0 CF
    JMP B07_E5A3         ; $E59B  4C A3 E5
B07_E59E:
    INY                  ; $E59E  C8
    DEC $0D              ; $E59F  C6 0D
    BNE B07_E56A         ; $E5A1  D0 C7
B07_E5A3:
    LDA $09              ; $E5A3  A5 09
    CLC                  ; $E5A5  18
    ADC #$10             ; $E5A6  69 10
    STA $09              ; $E5A8  85 09
    LSR A                ; $E5AA  4A
    LSR A                ; $E5AB  4A
    LSR A                ; $E5AC  4A
    LSR A                ; $E5AD  4A
    LSR A                ; $E5AE  4A
    TAX                  ; $E5AF  AA
    LDA $0C              ; $E5B0  A5 0C
    LSR A                ; $E5B2  4A
    STA $0D              ; $E5B3  85 0D
    BNE B07_E5B8         ; $E5B5  D0 01
B07_E5B7:
    RTS                  ; $E5B7  60
B07_E5B8:
    LDA $0D              ; $E5B8  A5 0D
    SEC                  ; $E5BA  38
    SBC #$01             ; $E5BB  E9 01
    STA $0D              ; $E5BD  85 0D
    STA $0F              ; $E5BF  85 0F
    BEQ B07_E5B7         ; $E5C1  F0 F4
    LDA $09              ; $E5C3  A5 09
    AND #$10             ; $E5C5  29 10
    BNE B07_E5E3         ; $E5C7  D0 1A
B07_E5C9:
    LDA $07              ; $E5C9  A5 07
    BNE B07_E5D5         ; $E5CB  D0 08
    LDA $0748,X          ; $E5CD  BD 48 07
    AND #$0F             ; $E5D0  29 0F
    JMP B07_E5DC         ; $E5D2  4C DC E5
B07_E5D5:
    LDA $0748,X          ; $E5D5  BD 48 07
    AND #$0F             ; $E5D8  29 0F
    ORA #$80             ; $E5DA  09 80
B07_E5DC:
    STA $0748,X          ; $E5DC  9D 48 07
    DEC $0D              ; $E5DF  C6 0D
    BEQ B07_E602         ; $E5E1  F0 1F
B07_E5E3:
    LDA $07              ; $E5E3  A5 07
    BNE B07_E5EF         ; $E5E5  D0 08
    LDA $0748,X          ; $E5E7  BD 48 07
    AND #$F0             ; $E5EA  29 F0
    JMP B07_E5F6         ; $E5EC  4C F6 E5
B07_E5EF:
    LDA $0748,X          ; $E5EF  BD 48 07
    AND #$F0             ; $E5F2  29 F0
    ORA #$08             ; $E5F4  09 08
B07_E5F6:
    STA $0748,X          ; $E5F6  9D 48 07
    INX                  ; $E5F9  E8
    TXA                  ; $E5FA  8A
    AND #$07             ; $E5FB  29 07
    TAX                  ; $E5FD  AA
    DEC $0D              ; $E5FE  C6 0D
    BNE B07_E5C9         ; $E600  D0 C7
B07_E602:
    LDA $48              ; $E602  A5 48
    CMP #$02             ; $E604  C9 02
    BNE B07_E610         ; $E606  D0 08
    LDA #$60             ; $E608  A9 60
    STA $05              ; $E60A  85 05
    LDA #$03             ; $E60C  A9 03
    STA $06              ; $E60E  85 06
B07_E610:
    LDA $12              ; $E610  A5 12
    CMP #$02             ; $E612  C9 02
    BNE B07_E651         ; $E614  D0 3B
    LDA #$A8             ; $E616  A9 A8
    STA $05              ; $E618  85 05
    LDA #$03             ; $E61A  A9 03
    STA $06              ; $E61C  85 06
    LDA $4F              ; $E61E  A5 4F
    SEC                  ; $E620  38
    SBC $05              ; $E621  E5 05
    LDA $50              ; $E623  A5 50
    SBC $06              ; $E625  E5 06
    BCC B07_E651         ; $E627  90 28
    LDA #$0F             ; $E629  A9 0F
    SEC                  ; $E62B  38
    SBC $0F              ; $E62C  E5 0F
    BCC B07_E651         ; $E62E  90 21
    BEQ B07_E651         ; $E630  F0 1F
    STA $0F              ; $E632  85 0F
B07_E634:
    LDA $0748,X          ; $E634  BD 48 07
    AND #$0F             ; $E637  29 0F
    STA $0748,X          ; $E639  9D 48 07
    DEC $0F              ; $E63C  C6 0F
    BEQ B07_E651         ; $E63E  F0 11
    LDA $0748,X          ; $E640  BD 48 07
    AND #$F0             ; $E643  29 F0
    STA $0748,X          ; $E645  9D 48 07
    INX                  ; $E648  E8
    TXA                  ; $E649  8A
    AND #$07             ; $E64A  29 07
    TAX                  ; $E64C  AA
    DEC $0F              ; $E64D  C6 0F
    BNE B07_E634         ; $E64F  D0 E3
B07_E651:
    RTS                  ; $E651  60
    .byte $01, $02, $04, $08, $00, $00, $00, $02, $5E, $E6, $70, $E6, $FE, $FE, $FE, $FD ; $E652
    .byte $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FE ; $E662
    .byte $FE, $FD, $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $E672
    .byte $FC, $FC, $FD, $FD, $FD, $FE, $FE, $FE, $A2, $00, $20, $89, $EF, $20, $8D, $F1 ; $E682
    .byte $20, $38, $E8, $AD, $80, $04, $85, $04, $AD, $60, $04, $85, $05, $20, $89, $F0 ; $E692
    .byte $20, $38, $E8, $A5, $5D, $0A, $A8, $B1, $00, $85, $42, $C8, $B1, $00, $85, $43 ; $E6A2
    .byte $A5, $AC, $8D, $FD, $03, $A5, $AD, $8D, $FE, $03, $A0, $20, $A5, $48, $C9, $05 ; $E6B2
    .byte $D0, $02, $A0, $28, $84, $08, $A0, $00, $B1, $42, $C9, $FF, $D0, $01, $60, $C5 ; $E6C2
    .byte $7F, $D0, $26, $C8, $B1, $42, $38, $E5, $AC, $10, $07, $85, $00, $A9, $00, $38 ; $E6D2
    .byte $E5, $00, $C5, $08, $B0, $13, $C8, $B1, $42, $38, $E5, $AD, $10, $07, $85, $00 ; $E6E2
    .byte $A9, $00, $38, $E5, $00, $C5, $08, $90, $10, $A5, $42, $18, $69, $0B, $85, $42 ; $E6F2
    .byte $A5, $43, $69, $00, $85, $43, $4C, $C8, $E6, $A9, $01, $8D, $EA, $03, $C8, $B1 ; $E702
    .byte $42, $F0, $0B, $A5, $5C, $F0, $05, $A9, $01, $8D, $E2, $03, $B1, $42, $85, $5C ; $E712
    .byte $C8, $B1, $42, $85, $00, $C9, $05, $90, $26, $C9, $09, $B0, $22, $A5, $48, $C9 ; $E722
    .byte $04, $D0, $1C, $A5, $55, $C9, $02, $90, $08, $C9, $05, $90, $08, $A9, $02, $D0 ; $E732
    .byte $02, $A9, $04, $85, $55, $A5, $5D, $C5, $55, $D0, $04, $A9, $06, $85, $00, $A5 ; $E742
    .byte $00, $85, $5D, $C8, $B1, $42, $8D, $80, $04, $C8, $B1, $42, $8D, $60, $04, $C8 ; $E752
    .byte $B1, $42, $85, $50, $C8, $B1, $42, $85, $4F, $C8, $B1, $42, $85, $52, $C8, $B1 ; $E762
    .byte $42, $85, $51, $A5, $5C, $D0, $2C, $A5, $5D, $C9, $02, $D0, $3C, $20, $BB, $E7 ; $E772
    .byte $A2, $05, $AD, $93, $05, $9D, $70, $05, $AD, $94, $05, $38, $E5, $4F, $9D, $80 ; $E782
    .byte $04, $AD, $95, $05, $38, $E5, $51, $9D, $60, $04, $20, $A2, $CF, $A9, $C8, $9D ; $E792
    .byte $50, $04, $60, $A0, $16, $20, $92, $C7, $C9, $09, $F0, $04, $C9, $0A, $D0, $09 ; $E7A2
    .byte $A0, $11, $A9, $06, $20, $F2, $D0, $B0, $05, $A9, $00, $8D, $10, $05, $A9, $07 ; $E7B2
    .byte $8D, $EE, $03, $AD, $E2, $03, $D0, $03, $20, $C0, $CE, $20, $C6, $D0, $20, $B0 ; $E7C2
    .byte $D0, $20, $BC, $EF, $A2, $01, $20, $3F, $EF, $A2, $00, $20, $89, $EF, $A9, $00 ; $E7D2
    .byte $8D, $90, $04, $8D, $70, $04, $8D, $30, $04, $8D, $00, $04, $8D, $70, $05, $8D ; $E7E2
    .byte $20, $05, $8D, $01, $04, $85, $6E, $85, $58, $85, $AE, $85, $B0, $85, $7E, $85 ; $E7F2
    .byte $88, $85, $8C, $85, $9D, $85, $9E, $85, $C5, $85, $C6, $85, $C7, $8D, $F7, $03 ; $E802
    .byte $8D, $F8, $03, $8D, $F9, $03, $8D, $FA, $03, $8D, $E4, $03, $8D, $E7, $03, $8D ; $E812
    .byte $EB, $03, $85, $A6, $85, $B7, $A9, $01, $85, $82, $8D, $40, $05, $A9, $10, $85 ; $E822
    .byte $3D, $A9, $03, $85, $34, $60, $A5, $5C, $D0, $04, $A9, $06, $D0, $02, $A5, $48 ; $E832
    .byte $0A, $A8, $B9, $4F, $E8, $85, $00, $B9, $50, $E8, $85, $01, $60, $00, $EB, $75 ; $E842
    .byte $EB, $8E, $EB, $27, $EC, $CF, $ED, $63, $EE, $5D, $E8, $67, $E8, $CB, $E8, $ED ; $E852
    .byte $E8, $72, $E9, $C8, $EA, $00, $48, $78, $01, $03, $28, $18, $00, $00, $00, $00 ; $E862
    .byte $00, $88, $A2, $01, $05, $30, $9C, $00, $00, $00, $C0, $01, $18, $78, $01, $03 ; $E872
    .byte $C8, $18, $02, $00, $00, $00, $01, $48, $A8, $01, $02, $28, $18, $00, $00, $00 ; $E882
    .byte $00, $02, $87, $28, $01, $00, $28, $18, $00, $00, $00, $00, $02, $C8, $B8, $01 ; $E892
    .byte $00, $C8, $18, $03, $00, $00, $00, $03, $48, $54, $01, $01, $AA, $34, $02, $00 ; $E8A2
    .byte $00, $00, $03, $48, $A8, $01, $01, $28, $18, $00, $00, $00, $00, $03, $A8, $20 ; $E8B2
    .byte $01, $04, $2C, $8C, $00, $00, $00, $00, $FF, $00, $48, $54, $01, $00, $28, $5A ; $E8C2
    .byte $00, $00, $00, $00, $00, $98, $78, $01, $00, $28, $9C, $00, $00, $01, $80, $01 ; $E8D2
    .byte $78, $3C, $01, $01, $60, $60, $00, $00, $01, $80, $FF, $00, $C8, $A0, $01, $00 ; $E8E2
    .byte $38, $8C, $00, $00, $00, $C0, $04, $C8, $80, $01, $01, $38, $8C, $00, $00, $00 ; $E8F2
    .byte $00, $04, $28, $48, $01, $01, $C8, $24, $02, $00, $01, $80, $0C, $A8, $30, $01 ; $E902
    .byte $05, $38, $8C, $01, $00, $00, $00, $0C, $68, $C8, $01, $05, $C8, $18, $05, $00 ; $E912
    .byte $00, $C0, $0C, $88, $A0, $01, $06, $38, $8C, $00, $00, $01, $80, $0D, $68, $D0 ; $E922
    .byte $01, $04, $38, $8C, $01, $00, $01, $80, $0E, $08, $D0, $01, $04, $78, $4C, $05 ; $E932
    .byte $FE, $01, $80, $0F, $C8, $30, $01, $02, $38, $8C, $00, $00, $01, $80, $10, $28 ; $E942
    .byte $60, $01, $02, $B8, $8C, $03, $00, $01, $80, $11, $48, $70, $01, $03, $38, $8C ; $E952
    .byte $00, $00, $01, $80, $11, $A8, $70, $01, $03, $B8, $8C, $03, $00, $01, $80, $FF ; $E962
    .byte $00, $28, $C8, $01, $09, $C8, $18, $00, $00, $00, $00, $00, $D8, $58, $01, $0A ; $E972
    .byte $48, $18, $00, $00, $00, $00, $01, $28, $C8, $01, $0E, $C8, $18, $03, $00, $00 ; $E982
    .byte $00, $01, $88, $88, $01, $0F, $48, $18, $00, $00, $00, $00, $01, $98, $48, $01 ; $E992
    .byte $10, $28, $18, $00, $00, $00, $00, $01, $D8, $58, $01, $0B, $C8, $18, $01, $00 ; $E9A2
    .byte $00, $00, $01, $E8, $D8, $01, $0E, $28, $18, $00, $00, $00, $00, $02, $88, $D8 ; $E9B2
    .byte $01, $0D, $A8, $18, $01, $00, $00, $00, $03, $68, $A8, $01, $0D, $28, $18, $00 ; $E9C2
    .byte $00, $00, $00, $03, $C8, $D8, $01, $0C, $C8, $18, $00, $00, $00, $00, $04, $38 ; $E9D2
    .byte $28, $01, $09, $28, $18, $00, $00, $00, $00, $06, $18, $28, $01, $0B, $28, $18 ; $E9E2
    .byte $00, $00, $00, $00, $07, $D8, $28, $01, $0C, $28, $18, $00, $00, $00, $00, $08 ; $E9F2
    .byte $48, $18, $01, $08, $C8, $18, $00, $00, $00, $00, $08, $48, $68, $01, $08, $28 ; $EA02
    .byte $18, $00, $00, $00, $00, $08, $58, $D8, $01, $07, $C8, $18, $00, $00, $00, $00 ; $EA12
    .byte $08, $A8, $B8, $01, $06, $C8, $18, $04, $00, $00, $00, $09, $48, $98, $01, $05 ; $EA22
    .byte $48, $18, $00, $00, $00, $00, $09, $58, $C8, $01, $06, $28, $18, $00, $00, $00 ; $EA32
    .byte $00, $0A, $68, $68, $01, $02, $A8, $18, $00, $00, $00, $00, $0A, $78, $A8, $01 ; $EA42
    .byte $02, $48, $18, $00, $00, $00, $00, $0A, $E8, $D8, $01, $01, $C8, $18, $04, $00 ; $EA52
    .byte $00, $00, $0B, $28, $58, $01, $01, $28, $18, $00, $00, $00, $00, $0B, $98, $D8 ; $EA62
    .byte $01, $00, $38, $8C, $05, $00, $01, $80, $0C, $48, $18, $01, $07, $28, $18, $00 ; $EA72
    .byte $00, $00, $00, $0C, $98, $98, $01, $05, $C8, $18, $03, $00, $00, $00, $0D, $E8 ; $EA82
    .byte $C8, $01, $04, $68, $18, $00, $00, $00, $00, $0E, $68, $16, $01, $03, $C8, $18 ; $EA92
    .byte $00, $00, $00, $00, $0E, $68, $48, $01, $03, $28, $18, $00, $00, $00, $00, $0E ; $EAA2
    .byte $38, $C8, $01, $04, $28, $18, $00, $00, $00, $00, $0F, $78, $98, $01, $00, $38 ; $EAB2
    .byte $8C, $00, $00, $01, $80, $FF, $00, $78, $D2, $01, $01, $2C, $8C, $00, $00, $00 ; $EAC2
    .byte $C0, $02, $48, $88, $01, $02, $48, $0C, $00, $00, $00, $00, $04, $78, $B2, $01 ; $EAD2
    .byte $00, $2E, $8C, $00, $00, $01, $80, $06, $68, $48, $01, $04, $6A, $0C, $00, $00 ; $EAE2
    .byte $00, $00, $08, $48, $48, $01, $03, $48, $0C, $00, $00, $00, $00, $FF, $0C, $EB ; $EAF2
    .byte $23, $EB, $3A, $EB, $46, $EB, $5D, $EB, $69, $EB, $00, $28, $18, $00, $00, $80 ; $EB02
    .byte $78, $00, $10, $00, $B0, $03, $C8, $1A, $00, $00, $80, $B8, $00, $50, $01, $00 ; $EB12
    .byte $FF, $00, $28, $10, $00, $00, $80, $A8, $00, $D0, $01, $00, $02, $AA, $3E, $00 ; $EB22
    .byte $00, $80, $78, $00, $D8, $00, $C8, $FF, $00, $28, $14, $00, $00, $80, $78, $00 ; $EB32
    .byte $D8, $00, $30, $FF, $00, $28, $18, $00, $00, $34, $74, $00, $00, $00, $00, $02 ; $EB42
    .byte $C8, $18, $00, $00, $80, $78, $00, $A0, $00, $04, $FF, $00, $28, $88, $00, $00 ; $EB52
    .byte $A8, $78, $01, $00, $00, $B0, $FF, $02, $28, $98, $00, $00, $80, $78, $00, $08 ; $EB62
    .byte $00, $30, $FF, $77, $EB, $00, $28, $58, $00, $01, $58, $58, $00, $00, $00, $00 ; $EB72
    .byte $06, $28, $A8, $00, $01, $80, $90, $00, $18, $00, $00, $FF, $9C, $EB, $A8, $EB ; $EB82
    .byte $BF, $EB, $D6, $EB, $ED, $EB, $04, $EC, $1B, $EC, $03, $38, $88, $00, $02, $80 ; $EB92
    .byte $78, $00, $48, $00, $2C, $FF, $00, $38, $88, $00, $02, $C8, $78, $04, $00, $00 ; $EBA2
    .byte $0C, $08, $C8, $18, $00, $02, $80, $4C, $03, $B0, $00, $00, $FF, $08, $38, $88 ; $EBB2
    .byte $00, $02, $80, $78, $00, $48, $02, $B8, $0B, $B8, $88, $00, $02, $80, $78, $00 ; $EBC2
    .byte $A8, $02, $E8, $FF, $08, $38, $88, $00, $02, $80, $78, $01, $C8, $02, $F8, $0B ; $EBD2
    .byte $B8, $88, $00, $02, $80, $78, $02, $27, $02, $F8, $FF, $0F, $38, $88, $00, $02 ; $EBE2
    .byte $80, $78, $02, $E8, $02, $5C, $14, $78, $48, $00, $02, $80, $78, $03, $88, $02 ; $EBF2
    .byte $5C, $FF, $01, $38, $88, $00, $02, $80, $78, $02, $28, $01, $BC, $0B, $C8, $18 ; $EC02
    .byte $00, $02, $80, $78, $01, $E0, $02, $58, $FF, $04, $38, $88, $00, $02, $80, $78 ; $EC12
    .byte $02, $08, $02, $2C, $FF, $49, $EC, $60, $EC, $77, $EC, $8E, $EC, $A5, $EC, $BC ; $EC22
    .byte $EC, $D3, $EC, $EA, $EC, $01, $ED, $18, $ED, $2F, $ED, $3B, $ED, $52, $ED, $69 ; $EC32
    .byte $ED, $80, $ED, $97, $ED, $B9, $ED, $0C, $38, $88, $00, $03, $78, $AC, $03, $00 ; $EC42
    .byte $03, $00, $11, $38, $88, $00, $03, $98, $78, $03, $00, $02, $74, $FF, $00, $28 ; $EC52
    .byte $18, $00, $03, $80, $78, $02, $A8, $01, $F0, $04, $C8, $18, $00, $03, $80, $78 ; $EC62
    .byte $02, $68, $02, $70, $FF, $00, $48, $18, $00, $03, $80, $78, $01, $F8, $02, $40 ; $EC72
    .byte $00, $A8, $18, $00, $03, $80, $78, $01, $E8, $02, $00, $FF, $00, $C8, $18, $00 ; $EC82
    .byte $03, $80, $78, $01, $E8, $02, $94, $00, $28, $18, $00, $03, $80, $78, $01, $E8 ; $EC92
    .byte $02, $E0, $FF, $00, $28, $18, $00, $03, $80, $D8, $01, $B8, $03, $00, $00, $68 ; $ECA2
    .byte $18, $00, $03, $80, $D8, $01, $68, $03, $00, $FF, $00, $48, $18, $00, $03, $80 ; $ECB2
    .byte $78, $00, $C8, $02, $18, $03, $C8, $18, $00, $03, $80, $A8, $00, $18, $03, $00 ; $ECC2
    .byte $FF, $00, $28, $18, $00, $03, $80, $78, $00, $D8, $02, $60, $04, $C8, $18, $00 ; $ECD2
    .byte $03, $80, $78, $00, $28, $02, $50, $FF, $00, $28, $18, $00, $03, $48, $78, $00 ; $ECE2
    .byte $00, $02, $B4, $00, $C8, $18, $00, $03, $60, $78, $00, $00, $02, $52, $FF, $00 ; $ECF2
    .byte $28, $18, $00, $03, $48, $78, $00, $00, $02, $00, $00, $C8, $10, $00, $03, $48 ; $ED02
    .byte $78, $00, $00, $01, $94, $FF, $00, $28, $18, $00, $03, $38, $78, $00, $00, $00 ; $ED12
    .byte $C4, $00, $C8, $18, $00, $03, $28, $78, $00, $00, $00, $60, $FF, $00, $48, $18 ; $ED22
    .byte $00, $03, $80, $68, $00, $58, $00, $00, $FF, $00, $28, $18, $00, $03, $80, $78 ; $ED32
    .byte $01, $98, $00, $C0, $01, $C8, $18, $00, $03, $80, $68, $01, $58, $00, $00, $FF ; $ED42
    .byte $00, $28, $18, $00, $03, $D8, $78, $03, $00, $00, $C0, $00, $C8, $18, $00, $03 ; $ED52
    .byte $C8, $78, $03, $00, $00, $70, $FF, $00, $28, $18, $00, $03, $80, $78, $02, $E8 ; $ED62
    .byte $00, $40, $01, $A8, $18, $00, $03, $80, $78, $02, $08, $00, $70, $FF, $00, $28 ; $ED72
    .byte $18, $00, $03, $80, $78, $01, $68, $00, $70, $03, $C8, $18, $00, $03, $80, $78 ; $ED82
    .byte $00, $A8, $00, $60, $FF, $00, $48, $18, $00, $03, $80, $78, $01, $08, $00, $10 ; $ED92
    .byte $01, $C8, $18, $01, $0F, $C8, $A8, $01, $00, $00, $00, $01, $C8, $A8, $01, $0F ; $EDA2
    .byte $C8, $18, $01, $00, $00, $00, $FF, $00, $28, $18, $00, $03, $80, $6C, $01, $18 ; $EDB2
    .byte $00, $00, $0E, $88, $90, $01, $11, $1C, $18, $00, $00, $00, $00, $E1, $ED, $ED ; $EDC2
    .byte $ED, $F9, $ED, $10, $EE, $27, $EE, $3E, $EE, $62, $EE, $4A, $EE, $56, $EE, $04 ; $EDD2
    .byte $2E, $8C, $00, $04, $80, $78, $00, $F8, $01, $3A, $FF, $03, $2C, $8C, $00, $04 ; $EDE2
    .byte $78, $78, $00, $00, $00, $5A, $FF, $00, $48, $18, $00, $04, $80, $78, $01, $C8 ; $EDF2
    .byte $00, $1A, $0D, $70, $90, $01, $05, $90, $8C, $00, $00, $00, $00, $FF, $00, $48 ; $EE02
    .byte $18, $00, $04, $80, $78, $01, $C6, $01, $DA, $0E, $70, $90, $01, $07, $90, $8C ; $EE12
    .byte $00, $00, $00, $00, $FF, $00, $68, $18, $00, $04, $68, $78, $00, $00, $01, $DA ; $EE22
    .byte $13, $70, $90, $01, $08, $90, $8C, $00, $00, $00, $00, $FF, $00, $90, $8C, $01 ; $EE32
    .byte $02, $70, $8C, $01, $00, $02, $40, $FF, $00, $90, $8C, $01, $03, $70, $8C, $04 ; $EE42
    .byte $00, $01, $80, $FF, $00, $90, $8C, $01, $04, $70, $8C, $04, $00, $02, $40, $FF ; $EE52
    .byte $FF, $6B, $EE, $82, $EE, $A4, $EE, $BA, $EE, $08, $60, $6C, $01, $01, $A2, $6C ; $EE62
    .byte $03, $00, $00, $00, $1C, $60, $6C, $01, $01, $A2, $6C, $02, $00, $02, $40, $FF ; $EE72
    .byte $03, $A2, $6C, $01, $00, $60, $6C, $01, $00, $00, $C0, $0E, $A2, $6C, $01, $00 ; $EE82
    .byte $60, $6C, $00, $00, $03, $00, $14, $5E, $8C, $01, $02, $60, $8C, $00, $00, $00 ; $EE92
    .byte $C0, $FF, $09, $60, $8C, $01, $01, $5E, $8C, $00, $00, $03, $C0, $07, $5E, $8C ; $EEA2
    .byte $01, $03, $80, $20, $00, $00, $00, $00, $FF, $A2, $02, $A9, $04, $D0, $16, $A2 ; $EEB2
    .byte $0E, $A9, $0F, $D0, $10 ; $EEC2
    LDX #$0B             ; $EEC7  A2 0B
    LDA #$0E             ; $EEC9  A9 0E
    BNE B07_EED7         ; $EECB  D0 0A
    LDX #$07             ; $EECD  A2 07
    LDA #$0F             ; $EECF  A9 0F
    BNE B07_EED7         ; $EED1  D0 04
    LDX #$05             ; $EED3  A2 05
    LDA #$0A             ; $EED5  A9 0A
B07_EED7:
    STA $00              ; $EED7  85 00
    INC $00              ; $EED9  E6 00
B07_EEDB:
    LDA $0440,X          ; $EEDB  BD 40 04
    BEQ B07_EEE7         ; $EEDE  F0 07
    INX                  ; $EEE0  E8
    CPX $00              ; $EEE1  E4 00
    BNE B07_EEDB         ; $EEE3  D0 F6
    SEC                  ; $EEE5  38
    RTS                  ; $EEE6  60
B07_EEE7:
    CLC                  ; $EEE7  18
    RTS                  ; $EEE8  60
    .byte $A2, $05, $A9, $0F, $85, $00, $E6, $00, $BD, $40, $04, $D0, $07, $E8, $E4, $00 ; $EEE9
    .byte $D0, $F6, $18, $60, $C9, $10, $90, $F5, $38, $60 ; $EEF9
    LDA $0450,X          ; $EF03  BD 50 04
    AND #$40             ; $EF06  29 40
    BEQ B07_EF20         ; $EF08  F0 16
B07_EF0A:
    JSR B07_EF21         ; $EF0A  20 21 EF
    LDA $04F0,X          ; $EF0D  BD F0 04
    CLC                  ; $EF10  18
    ADC $0490,X          ; $EF11  7D 90 04
    STA $0490,X          ; $EF14  9D 90 04
    LDA $04E0,X          ; $EF17  BD E0 04
    ADC $0480,X          ; $EF1A  7D 80 04
    STA $0480,X          ; $EF1D  9D 80 04
B07_EF20:
    RTS                  ; $EF20  60
B07_EF21:
    LDA $04C0,X          ; $EF21  BD C0 04
    CLC                  ; $EF24  18
    ADC $0470,X          ; $EF25  7D 70 04
    STA $0470,X          ; $EF28  9D 70 04
    LDA $04B0,X          ; $EF2B  BD B0 04
    ADC $0460,X          ; $EF2E  7D 60 04
    STA $0460,X          ; $EF31  9D 60 04
    RTS                  ; $EF34  60
    .byte $A2, $01, $D0, $0F ; $EF35
B07_EF39:
    LDX #$05             ; $EF39  A2 05
    BNE B07_EF3F         ; $EF3B  D0 02
B07_EF3D:
    LDX #$00             ; $EF3D  A2 00
B07_EF3F:
    JSR B07_EF48         ; $EF3F  20 48 EF
    INX                  ; $EF42  E8
    CPX #$10             ; $EF43  E0 10
    BNE B07_EF3F         ; $EF45  D0 F8
    RTS                  ; $EF47  60
B07_EF48:
    LDA #$00             ; $EF48  A9 00
    STA $0400,X          ; $EF4A  9D 00 04
    STA $0440,X          ; $EF4D  9D 40 04
    STA $0450,X          ; $EF50  9D 50 04
    STA $0510,X          ; $EF53  9D 10 05
    STA $0430,X          ; $EF56  9D 30 04
    STA $0460,X          ; $EF59  9D 60 04
    STA $0470,X          ; $EF5C  9D 70 04
    STA $0480,X          ; $EF5F  9D 80 04
    STA $0490,X          ; $EF62  9D 90 04
    STA $0410,X          ; $EF65  9D 10 04
    STA $0420,X          ; $EF68  9D 20 04
    STA $0500,X          ; $EF6B  9D 00 05
    STA $0520,X          ; $EF6E  9D 20 05
    STA $0530,X          ; $EF71  9D 30 05
    STA $0540,X          ; $EF74  9D 40 05
    STA $0550,X          ; $EF77  9D 50 05
    STA $0630,X          ; $EF7A  9D 30 06
    STA $0640,X          ; $EF7D  9D 40 06
    STA $0560,X          ; $EF80  9D 60 05
    STA $0570,X          ; $EF83  9D 70 05
    STA $0580,X          ; $EF86  9D 80 05
    JSR B07_EF93         ; $EF89  20 93 EF
    JSR B07_EF9D         ; $EF8C  20 9D EF
    STA $04B0,X          ; $EF8F  9D B0 04
    RTS                  ; $EF92  60
B07_EF93:
    JSR B07_EFA3         ; $EF93  20 A3 EF
    STA $04E0,X          ; $EF96  9D E0 04
    RTS                  ; $EF99  60
    .byte $20, $A3, $EF ; $EF9A
B07_EF9D:
    LDA #$00             ; $EF9D  A9 00
    STA $04C0,X          ; $EF9F  9D C0 04
    RTS                  ; $EFA2  60
B07_EFA3:
    LDA #$00             ; $EFA3  A9 00
    STA $04F0,X          ; $EFA5  9D F0 04
    RTS                  ; $EFA8  60
    .byte $A2, $01, $A9, $00, $9D, $40, $04, $9D, $70, $05, $9D, $00, $04, $E8, $E0, $05 ; $EFA9
    .byte $D0, $F2, $60 ; $EFB9
B07_EFBC:
    LDX #$00             ; $EFBC  A2 00
B07_EFBE:
    JSR B07_EFC7         ; $EFBE  20 C7 EF
    INX                  ; $EFC1  E8
    CPX #$08             ; $EFC2  E0 08
    BCC B07_EFBE         ; $EFC4  90 F8
    RTS                  ; $EFC6  60
B07_EFC7:
    LDA #$00             ; $EFC7  A9 00
    STA $0650,X          ; $EFC9  9D 50 06
    STA $0658,X          ; $EFCC  9D 58 06
    STA $0660,X          ; $EFCF  9D 60 06
    STA $0668,X          ; $EFD2  9D 68 06
    STA $0670,X          ; $EFD5  9D 70 06
    STA $0618,X          ; $EFD8  9D 18 06
    STA $0620,X          ; $EFDB  9D 20 06
    STA $0688,X          ; $EFDE  9D 88 06
    STA $0690,X          ; $EFE1  9D 90 06
    STA $0698,X          ; $EFE4  9D 98 06
    STA $06A0,X          ; $EFE7  9D A0 06
    STA $06A8,X          ; $EFEA  9D A8 06
    STA $06B0,X          ; $EFED  9D B0 06
    STA $06B8,X          ; $EFF0  9D B8 06
    RTS                  ; $EFF3  60
    .byte $18, $7D, $C0, $04, $9D, $C0, $04, $A9, $00, $7D, $B0, $04, $9D, $B0, $04, $60 ; $EFF4
    .byte $49, $FF, $38, $7D, $C0, $04, $9D, $C0, $04, $A9, $FF, $7D, $B0, $04, $9D, $B0 ; $F004
    .byte $04, $60, $18, $7D, $F0, $04, $9D, $F0, $04, $A9, $00, $7D, $E0, $04, $9D, $E0 ; $F014
    .byte $04, $60, $49, $FF, $38, $7D, $F0, $04, $9D, $F0, $04, $A9, $FF, $7D, $E0, $04 ; $F024
    .byte $9D, $E0, $04, $60, $BD, $60, $04, $38, $ED, $60, $04, $B0, $04, $49, $FF, $69 ; $F034
    .byte $01, $60, $BD, $80, $04, $38, $ED, $80, $04, $B0, $04, $49, $FF, $69, $01, $60 ; $F044
    .byte $BD, $40, $06, $9D, $60, $04, $60, $BD, $60, $04, $9D, $40, $06, $60, $9D, $F0 ; $F054
    .byte $04, $98, $9D, $E0, $04, $60, $9D, $C0, $04, $98, $9D, $B0, $04, $60 ; $F064
    STY $01              ; $F072  84 01
    STA $00              ; $F074  85 00
    LDA $0480,X          ; $F076  BD 80 04
    CLC                  ; $F079  18
    ADC $00              ; $F07A  65 00
    STA $00              ; $F07C  85 00
    LDA $0460,X          ; $F07E  BD 60 04
    CLC                  ; $F081  18
    ADC $01              ; $F082  65 01
    STA $01              ; $F084  85 01
    JMP B07_C7C7         ; $F086  4C C7 C7
    .byte $A5, $5D, $0A, $A8, $B1, $00, $85, $08, $C8, $B1, $00, $85, $09, $A5, $5C, $D0 ; $F089
    .byte $04, $A9, $06, $D0, $02, $A5, $48, $0A, $A8, $B9, $20, $F1, $85, $00, $B9, $21 ; $F099
    .byte $F1, $85, $01, $A4, $5D, $B1, $00, $85, $10, $A5, $4F, $18, $65, $04, $85, $AC ; $F0A9
    .byte $A5, $50, $69, $00, $85, $00, $A5, $5C, $D0, $12, $A5, $68, $18, $65, $05, $85 ; $F0B9
    .byte $AD, $A5, $69, $69, $00, $D0, $2E, $A5, $00, $4C, $0A, $F1, $A5, $68, $18, $65 ; $F0C9
    .byte $05, $90, $06, $18, $69, $40, $4C, $E9, $F0, $C9, $C0, $90, $0D, $38, $E9, $C0 ; $F0D9
    .byte $85, $AD, $A5, $69, $18, $69, $01, $4C, $FE, $F0, $85, $AD, $A5, $69, $D0, $05 ; $F0E9
    .byte $A5, $00, $4C, $0A, $F1, $A8, $A9, $00, $18, $65, $10, $88, $D0, $FB, $18, $65 ; $F0F9
    .byte $00, $85, $7F, $0A, $A8, $B1, $08, $85, $42, $C8, $B1, $08, $85, $43, $60, $01 ; $F109
    .byte $02, $04, $08, $10, $20, $40, $80, $33, $F1, $39, $F1, $3B, $F1, $42, $F1, $54 ; $F119
    .byte $F1, $5D, $F1, $2E, $F1, $02, $02, $05, $04, $03, $04, $03, $04, $03, $02, $02 ; $F129
    .byte $03, $09, $03, $03, $04, $04, $07, $06, $02, $06, $05, $01, $01, $01, $04, $05 ; $F139
    .byte $01, $01, $01, $02, $02, $01, $02, $04, $02, $03, $01, $02, $03, $04, $05, $05 ; $F149
    .byte $01, $03, $01, $01, $07, $04, $09, $01 ; $F159
    LDA $A2              ; $F161  A5 A2
    BMI B07_F179         ; $F163  30 14
    LDA $0480,X          ; $F165  BD 80 04
    STA $00              ; $F168  85 00
    SEC                  ; $F16A  38
    SBC $40              ; $F16B  E5 40
    STA $0480,X          ; $F16D  9D 80 04
    LDA $0460,X          ; $F170  BD 60 04
    SEC                  ; $F173  38
    SBC $41              ; $F174  E5 41
    STA $0460,X          ; $F176  9D 60 04
B07_F179:
    RTS                  ; $F179  60
    LDA $0450,X          ; $F17A  BD 50 04
    AND #$20             ; $F17D  29 20
    BEQ B07_F18C         ; $F17F  F0 0B
    DEC $0500,X          ; $F181  DE 00 05
    LDA $0500,X          ; $F184  BD 00 05
    AND #$03             ; $F187  29 03
    STA $0430,X          ; $F189  9D 30 04
B07_F18C:
    RTS                  ; $F18C  60
B07_F18D:
    LDA $51              ; $F18D  A5 51
    STA $68              ; $F18F  85 68
    LDA $52              ; $F191  A5 52
    STA $69              ; $F193  85 69
    LDY #$00             ; $F195  A0 00
    LDA #$C0             ; $F197  A9 C0
    STA $00              ; $F199  85 00
    LDA $5C              ; $F19B  A5 5C
    BNE B07_F1A0         ; $F19D  D0 01
    RTS                  ; $F19F  60
B07_F1A0:
    LDA $69              ; $F1A0  A5 69
    BNE B07_F1AA         ; $F1A2  D0 06
    LDA $68              ; $F1A4  A5 68
    CMP $00              ; $F1A6  C5 00
    BCC B07_F1BA         ; $F1A8  90 10
B07_F1AA:
    LDA $68              ; $F1AA  A5 68
    SEC                  ; $F1AC  38
    SBC $00              ; $F1AD  E5 00
    STA $68              ; $F1AF  85 68
    LDA $69              ; $F1B1  A5 69
    SBC #$00             ; $F1B3  E9 00
    STA $69              ; $F1B5  85 69
    INY                  ; $F1B7  C8
    BNE B07_F1A0         ; $F1B8  D0 E6
B07_F1BA:
    STY $69              ; $F1BA  84 69
    RTS                  ; $F1BC  60
    .byte $84, $09, $85, $08, $A9, $00, $38, $E5, $08, $A4, $09, $20, $72, $F0, $20, $EF ; $F1BD
    .byte $F1, $F0, $0E, $A4, $09, $A5, $08, $20, $72, $F0, $20, $EF, $F1, $F0, $02, $18 ; $F1CD
    .byte $60, $38, $60, $84, $09, $85, $08, $A9, $00, $38, $E5, $09, $A8, $A5, $08, $4C ; $F1DD
    .byte $C8, $F1, $C9, $02, $F0, $17, $C9, $06, $F0, $07, $C9, $04, $F0, $02, $C9, $0C ; $F1ED
    .byte $60, $AC, $06, $06, $D0, $03, $A0, $01, $60, $A0, $00, $F0, $D4, $A4, $48, $88 ; $F1FD
    .byte $D0, $09, $A4, $4F, $10, $05, $A9, $0D, $85, $B5, $60, $AC, $06, $06, $D0, $E9 ; $F20D
    .byte $4C, $8A, $E6, $85, $00, $29, $80, $D0, $03, $4C, $D3, $F2, $A5, $00, $29, $7F ; $F21D
    .byte $0A, $A8, $B9, $D0, $F3, $85, $08, $C8, $B9, $D0, $F3, $85, $09, $AD, $CA, $03 ; $F22D
    .byte $D0, $4A, $A5, $22, $C9, $38, $90, $03, $4C, $CA, $F2, $AA, $A9, $01, $8D, $CA ; $F23D
    .byte $03, $A0, $00, $8C, $CC, $03, $20, $81, $F2, $20, $81, $F2, $8D, $CD, $03, $20 ; $F24D
    .byte $81, $F2, $8D, $CE, $03, $20, $81, $F2, $8D, $D3, $03, $86, $22, $8C, $CC, $03 ; $F25D
    .byte $18, $60, $A9, $20, $18, $6D, $CE, $03, $8D, $CE, $03, $A9, $00, $6D, $CD, $03 ; $F26D
    .byte $8D, $CD, $03, $60, $B1, $08, $9D, $00, $03, $E8, $C8, $60, $A5, $22, $C9, $38 ; $F27D
    .byte $B0, $3B, $AC, $CC, $03, $B1, $08, $85, $0B, $C8, $B1, $08, $85, $0C, $AD, $CE ; $F28D
    .byte $03, $C5, $0C, $90, $07, $AD, $CD, $03, $C5, $0B, $B0, $23, $A0, $00, $A6, $22 ; $F29D
    .byte $20, $81, $F2, $AD, $CD, $03, $9D, $00, $03, $E8, $AD, $CE, $03, $9D, $00, $03 ; $F2AD
    .byte $E8, $AD, $D3, $03, $9D, $00, $03, $E8, $86, $22, $20, $6F, $F2, $18, $60, $38 ; $F2BD
    .byte $A9, $00, $8D, $CA, $03, $60, $A5, $00, $0A, $A8, $B9, $D8, $F3, $85, $08, $C8 ; $F2CD
    .byte $B9, $D8, $F3, $85, $09, $AD, $CA, $03, $D0, $24, $A9, $01, $8D, $CA, $03, $A0 ; $F2DD
    .byte $00, $8C, $CC, $03, $8C, $D3, $03, $B1, $08, $8D, $CD, $03, $C8, $B1, $08, $8D ; $F2ED
    .byte $CE, $03, $C8, $8C, $CC, $03, $8C, $D3, $03, $A9, $01, $8D, $CB, $03, $CE, $CB ; $F2FD
    .byte $03, $F0, $03, $4C, $C7, $F3, $A9, $04, $8D, $CB, $03, $AC, $CC, $03, $B1, $08 ; $F30D
    .byte $85, $0A, $C9, $FF, $D0, $03, $4C, $C9, $F3, $C9, $FE, $D0, $21, $18, $EE, $CC ; $F31D
    .byte $03, $AC, $CC, $03, $B1, $08, $8D, $CD, $03, $C8, $B1, $08, $8D, $CE, $03, $C8 ; $F32D
    .byte $8C, $CC, $03, $A9, $02, $8D, $D3, $03, $A9, $01, $8D, $CB, $03, $60, $A5, $22 ; $F33D
    .byte $A8, $C9, $38, $B0, $70, $A9, $01, $99, $00, $03, $C8, $AD, $CD, $03, $99, $00 ; $F34D
    .byte $03, $C8, $AD, $CE, $03, $18, $6D, $D3, $03, $99, $00, $03, $C8, $A5, $0A, $29 ; $F35D
    .byte $3F, $99, $00, $03, $C8, $A5, $0A, $29, $80, $F0, $37, $A9, $01, $99, $00, $03 ; $F36D
    .byte $C8, $AD, $CD, $03, $99, $00, $03, $C8, $AD, $CE, $03, $18, $6D, $D3, $03, $38 ; $F37D
    .byte $E9, $20, $99, $00, $03, $B0, $09, $B9, $FF, $02, $38, $E9, $01, $99, $FF, $02 ; $F38D
    .byte $C8, $A5, $0A, $29, $40, $F0, $05, $A9, $3E, $4C, $AB, $F3, $A9, $30, $99, $00 ; $F39D
    .byte $03, $C8, $EE, $CC, $03, $EE, $D3, $03, $84, $22, $A5, $0A, $F0, $05, $A9, $38 ; $F3AD
    .byte $20, $F0, $CE, $18, $60, $A9, $01, $8D, $CB, $03, $18, $60, $38, $A9, $00, $8D ; $F3BD
    .byte $CA, $03, $60, $D2, $F3, $A0, $22, $C0, $00, $23, $C0, $E0, $F3, $0C, $F4, $39 ; $F3CD
    .byte $F4, $5C, $F4, $22, $E2, $23, $17, $18, $22, $00, $18, $22, $00, $22, $17, $21 ; $F3DD
    .byte $14, $13, $13, $14, $21, $0B, $FE, $23, $22, $1B, $18, $22, $23, $14, $1D, $00 ; $F3ED
    .byte $23, $1E, $00, $1C, $14, $2D, $23, $24, $21, $23, $1B, $14, $22, $0B, $FF, $22 ; $F3FD
    .byte $E2, $26, $14, $00, $17, $10, $25, $14, $00, $23, $10, $1A, $14, $1D, $00, $22 ; $F40D
    .byte $1F, $1B, $18, $1D, $23, $14, $21, $0B, $FE, $23, $22, $23, $1E, $00, $16, $14 ; $F41D
    .byte $23, $00, $17, $18, $1C, $00, $11, $10, $12, $1A, $2D, $FF, $22, $E2, $28, $1E ; $F42D
    .byte $24, $00, $1C, $24, $22, $23, $00, $13, $14, $15, $14, $10, $23, $FE, $23, $22 ; $F43D
    .byte $23, $17, $14, $00, $15, $1E, $1E, $23, $00, $12, $1B, $10, $1D, $0B, $FF, $22 ; $F44D
    .byte $E2, $26, $14, $2A, $21, $14, $00, $26, $10, $18, $23, $18, $1D, $16, $00, $15 ; $F45D
    .byte $1E, $21, $00, $28, $1E, $24, $0B, $FE, $23, $22, $17, $10, $2D, $17, $10, $2D ; $F46D
    .byte $17, $10, $2C, $FF ; $F47D
B07_F481:
    LDA #$01             ; $F481  A9 01
    STA $03D9            ; $F483  8D D9 03
    LDA $1B              ; $F486  A5 1B
    CMP #$04             ; $F488  C9 04
    BNE B07_F49D         ; $F48A  D0 11
    LDA $34              ; $F48C  A5 34
    CMP #$08             ; $F48E  C9 08
    BCS B07_F49D         ; $F490  B0 0B
    LDA $5C              ; $F492  A5 5C
    BNE B07_F49D         ; $F494  D0 07
    LDA $35              ; $F496  A5 35
    BNE B07_F49D         ; $F498  D0 03
    STA $03D9            ; $F49A  8D D9 03
B07_F49D:
    RTS                  ; $F49D  60
    .byte $B4, $F4, $C0, $F4, $C4, $F4, $D2, $F4, $F6, $F4, $08, $F5, $10, $F5, $16, $F5 ; $F49E
    .byte $1A, $F5, $35, $F5, $47, $F5, $52, $F5, $58, $F5, $5D, $F5, $63, $F5, $68, $F5 ; $F4AE
    .byte $6C, $F5, $72, $F5, $7D, $F5, $9A, $F5, $A2, $F5, $AD, $F5, $BF, $F5, $CD, $F5 ; $F4BE
    .byte $E4, $F5, $F2, $F5, $FA, $F5, $0E, $F6, $1A, $F6, $1D, $F6, $20, $F6, $23, $F6 ; $F4CE
    .byte $29, $F6, $30, $F6, $33, $F6, $36, $F6, $39, $F6, $3D, $F6, $41, $F6, $44, $F6 ; $F4DE
    .byte $48, $F6, $4E, $F6, $52, $F6, $63, $F6, $66, $F6, $70, $F6, $7E, $F6, $90, $F6 ; $F4EE
    .byte $A1, $F6, $B7, $F6, $B7, $F6, $B7, $F6, $B7, $F6, $BA, $F6, $E6, $F6, $00, $F7 ; $F4FE
    .byte $14, $F7, $02, $02, $00, $01, $02, $03, $02, $01, $04, $05, $05, $05, $06, $07 ; $F50E
    .byte $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $10, $11, $12, $13, $14, $15, $16, $17 ; $F51E
    .byte $18, $19, $1A, $1B, $1C, $1D, $1E, $04, $04, $1F, $20, $21, $22, $23, $24, $25 ; $F52E
    .byte $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $03, $03, $2F, $30, $31, $32, $33 ; $F53E
    .byte $34, $35, $36, $37, $04, $01, $00, $01, $02, $03, $03, $01, $04, $05, $06, $04 ; $F54E
    .byte $01, $07, $08, $09, $0A, $03, $01, $0B, $0C, $0D, $02, $01, $0E, $0F, $02, $02 ; $F55E
    .byte $10, $11, $12, $13, $03, $03, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09 ; $F56E
    .byte $03, $09, $09, $09, $09, $0D, $12, $0C, $13, $09, $09, $0D, $0E, $0F, $10, $11 ; $F57E
    .byte $14, $14, $09, $09, $0A, $0B, $0C, $0D, $14, $14, $15, $16, $03, $02, $00, $01 ; $F58E
    .byte $02, $03, $04, $05, $03, $03, $06, $07, $36, $08, $09, $11, $0A, $0B, $0C, $04 ; $F59E
    .byte $04, $13, $14, $0D, $0E, $0D, $0E, $0F, $10, $11, $12, $13, $14, $0C, $15, $16 ; $F5AE
    .byte $30, $04, $03, $17, $18, $19, $1A, $1B, $26, $27, $1C, $1D, $2A, $2B, $1E, $07 ; $F5BE
    .byte $03, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $1C, $1C, $27, $28, $29, $2A ; $F5CE
    .byte $2B, $1E, $1E, $2B, $2C, $2D, $06, $02, $2E, $2F, $39, $2A, $2A, $2A, $0B, $30 ; $F5DE
    .byte $31, $31, $31, $32, $02, $03, $33, $34, $35, $36, $37, $38, $06, $03, $04, $05 ; $F5EE
    .byte $06, $06, $07, $03, $02, $03, $04, $03, $04, $01, $00, $01, $02, $01, $02, $08 ; $F5FE
    .byte $05, $02, $09, $0A, $0B, $0A, $0D, $1B, $1B, $0C, $28, $28, $01, $01, $0E, $01 ; $F60E
    .byte $01, $0F, $01, $01, $10, $04, $01, $11, $12, $12, $13, $05, $01, $14, $0A, $15 ; $F61E
    .byte $0A, $16, $01, $01, $17, $01, $01, $18, $01, $01, $19, $02, $01, $1A, $1B, $02 ; $F62E
    .byte $01, $1C, $1D, $01, $01, $1E, $02, $01, $1F, $20, $04, $01, $21, $12, $12, $22 ; $F63E
    .byte $02, $01, $23, $24, $03, $05, $25, $26, $FF, $FF, $27, $FF, $FF, $27, $FF, $FF ; $F64E
    .byte $27, $FF, $FF, $28, $29, $01, $01, $2A, $02, $04, $00, $01, $02, $03, $04, $05 ; $F65E
    .byte $06, $07, $03, $04, $08, $09, $0A, $0B, $0C, $0D, $07, $0E, $06, $07, $0F, $06 ; $F66E
    .byte $04, $04, $10, $11, $11, $12, $15, $14, $14, $13, $16, $1E, $15, $15, $17, $18 ; $F67E
    .byte $17, $15, $05, $03, $19, $1A, $1A, $1B, $19, $19, $19, $1B, $16, $19, $19, $19 ; $F68E
    .byte $1F, $17, $18, $05, $04, $1C, $1B, $10, $10, $10, $12, $17, $1D, $1E, $10, $15 ; $F69E
    .byte $1F, $1E, $1B, $17, $12, $12, $18, $17, $18, $01, $01, $1F, $07, $06, $00, $00 ; $F6AE
    .byte $00, $00, $03, $00, $01, $00, $12, $04, $05, $00, $02, $03, $00, $00, $06, $07 ; $F6BE
    .byte $08, $09, $00, $00, $00, $0B, $0A, $0B, $0A, $00, $12, $0C, $0D, $0E, $0C, $00 ; $F6CE
    .byte $00, $00, $11, $0F, $10, $11, $0F, $00, $04, $06, $14, $15, $16, $13, $18, $17 ; $F6DE
    .byte $18, $17, $18, $19, $1A, $1B, $1C, $1D, $13, $1C, $1E, $1F, $20, $1E, $21, $22 ; $F6EE
    .byte $23, $1E, $09, $02, $00, $00, $00, $00, $00, $00, $2B, $2A, $2B, $24, $25, $25 ; $F6FE
    .byte $26, $26, $27, $27, $28, $29, $01, $01, $2C, $2C ; $F70E
B07_F718:
    ASL A                ; $F718  0A
    TAY                  ; $F719  A8
    LDA $F796,Y          ; $F71A  B9 96 F7
    STA $00              ; $F71D  85 00
    LDA $F797,Y          ; $F71F  B9 97 F7
    STA $01              ; $F722  85 01
    LDY #$00             ; $F724  A0 00
    LDX #$00             ; $F726  A2 00
    JSR B07_F740         ; $F728  20 40 F7
    JMP B07_F759         ; $F72B  4C 59 F7
B07_F72E:
    ASL A                ; $F72E  0A
    TAY                  ; $F72F  A8
    LDA $FA36,Y          ; $F730  B9 36 FA
    STA $00              ; $F733  85 00
    LDA $FA37,Y          ; $F735  B9 37 FA
    STA $01              ; $F738  85 01
    LDY #$00             ; $F73A  A0 00
    LDA ($00),Y          ; $F73C  B1 00
    TAX                  ; $F73E  AA
    INY                  ; $F73F  C8
B07_F740:
    LDA ($00),Y          ; $F740  B1 00
    CMP #$FE             ; $F742  C9 FE
    BEQ B07_F759         ; $F744  F0 13
    TXA                  ; $F746  8A
    AND #$03             ; $F747  29 03
    BNE B07_F750         ; $F749  D0 05
    LDA $2C              ; $F74B  A5 2C
    JMP B07_F753         ; $F74D  4C 53 F7
B07_F750:
    LDA ($00),Y          ; $F750  B1 00
    INY                  ; $F752  C8
B07_F753:
    STA $059F,X          ; $F753  9D 9F 05
    INX                  ; $F756  E8
    BNE B07_F740         ; $F757  D0 E7
B07_F759:
    LDA #$01             ; $F759  A9 01
    STA $2B              ; $F75B  85 2B
B07_F75D:
    RTS                  ; $F75D  60
B07_F75E:
    LDY $0604            ; $F75E  AC 04 06
    LDA $F76C,Y          ; $F761  B9 6C F7
    BMI B07_F75D         ; $F764  30 F7
    JSR B07_F72E         ; $F766  20 2E F7
    JMP B07_D548         ; $F769  4C 48 D5
    .byte $04, $05, $0F, $13, $1B, $05, $05, $1F, $05, $19, $FF, $05, $FF, $05, $FF, $05 ; $F76C
    .byte $05, $1A ; $F77C
B07_F77E:
    LDA #$0F             ; $F77E  A9 0F
    BNE B07_F784         ; $F780  D0 02
    LDA #$16             ; $F782  A9 16
B07_F784:
    STA $2C              ; $F784  85 2C
    LDY #$00             ; $F786  A0 00
B07_F788:
    STA $059F,Y          ; $F788  99 9F 05
    INY                  ; $F78B  C8
    INY                  ; $F78C  C8
    INY                  ; $F78D  C8
    INY                  ; $F78E  C8
    CPY #$20             ; $F78F  C0 20
    BNE B07_F788         ; $F791  D0 F5
    JMP B07_F759         ; $F793  4C 59 F7
    .byte $CA, $F7, $E3, $F7, $FC, $F7, $15, $F8, $28, $F8, $41, $F8, $54, $F8, $6D, $F8 ; $F796
    .byte $86, $F8, $9F, $F8, $B8, $F8, $D1, $F8, $EA, $F8, $03, $F9, $1C, $F9, $35, $F9 ; $F7A6
    .byte $4E, $F9, $67, $F9, $80, $F9, $99, $F9, $B2, $F9, $CB, $F9, $E4, $F9, $FD, $F9 ; $F7B6
    .byte $13, $FA, $29, $FA, $00, $10, $20, $01, $11, $21, $06, $26, $37, $00, $00, $00 ; $F7C6
    .byte $09, $16, $2A, $0D, $1A, $26, $0D, $12, $23, $0F, $16, $37, $FE, $01, $16, $20 ; $F7D6
    .byte $06, $26, $36, $00, $00, $00, $00, $2C, $20, $09, $16, $2A, $02, $16, $31, $0D ; $F7E6
    .byte $12, $2B, $0F, $14, $2C, $FE, $01, $16, $20, $06, $26, $36, $01, $11, $21, $07 ; $F7F6
    .byte $17, $28, $09, $16, $2A, $02, $16, $31, $07, $1B, $37, $0F, $16, $25, $FE, $01 ; $F806
    .byte $16, $30, $0F, $00, $10, $01, $2A, $16, $01, $17, $35, $09, $16, $2A, $02, $16 ; $F816
    .byte $31, $FE, $00, $10, $20, $01, $11, $20, $12, $11, $21, $07, $0A, $2A, $09, $16 ; $F826
    .byte $2A, $0D, $1A, $26, $0D, $12, $23, $0F, $16, $37, $FE, $01, $16, $20, $01, $1C ; $F836
    .byte $3C, $00, $06, $26, $00, $10, $20, $09, $16, $2A, $02, $16, $31, $FE, $01, $16 ; $F846
    .byte $20, $01, $1C, $3C, $01, $03, $25, $01, $17, $27, $09, $16, $2A, $06, $17, $37 ; $F856
    .byte $0D, $07, $29, $0F, $12, $2A, $FE, $08, $10, $20, $01, $11, $21, $04, $14, $24 ; $F866
    .byte $08, $0A, $2A, $09, $16, $2A, $0D, $1A, $26, $0D, $12, $23, $0F, $16, $37, $FE ; $F876
    .byte $01, $16, $20, $0B, $1B, $3B, $01, $11, $31, $07, $17, $27, $09, $16, $2A, $02 ; $F886
    .byte $16, $31, $0D, $12, $2B, $0F, $14, $2C, $FE, $01, $16, $20, $0C, $1C, $3C, $10 ; $F896
    .byte $20, $21, $05, $26, $36, $09, $16, $2A, $02, $16, $31, $07, $1B, $37, $0F, $16 ; $F8A6
    .byte $25, $FE, $10, $28, $20, $08, $17, $37, $0B, $1B, $2C, $01, $21, $20, $09, $16 ; $F8B6
    .byte $2A, $0D, $1A, $26, $0D, $12, $23, $0F, $16, $37, $FE, $02, $16, $20, $02, $13 ; $F8C6
    .byte $25, $01, $1B, $3C, $17, $27, $37, $09, $16, $2A, $02, $16, $31, $0D, $12, $2B ; $F8D6
    .byte $0F, $14, $2C, $FE, $01, $16, $20, $0C, $1C, $2C, $10, $20, $21, $00, $10, $30 ; $F8E6
    .byte $09, $16, $2A, $02, $16, $31, $07, $1B, $37, $0D, $16, $25, $FE, $00, $10, $30 ; $F8F6
    .byte $00, $00, $00, $21, $31, $30, $00, $00, $00, $09, $12, $2A, $09, $16, $2A, $0D ; $F906
    .byte $1A, $2B, $0D, $1A, $26, $FE, $02, $16, $31, $00, $12, $10, $06, $17, $26, $08 ; $F916
    .byte $0B, $1B, $09, $16, $2A, $02, $16, $31, $00, $06, $10, $0D, $12, $10, $FE, $0F ; $F926
    .byte $01, $11, $08, $18, $30, $1B, $21, $3C, $07, $17, $37, $09, $16, $2A, $0D, $1A ; $F936
    .byte $26, $0D, $12, $23, $0F, $16, $37, $FE, $01, $16, $20, $06, $17, $37, $01, $13 ; $F946
    .byte $3C, $01, $12, $0F, $09, $16, $2A, $02, $16, $31, $0D, $12, $2B, $0F, $14, $2C ; $F956
    .byte $FE, $01, $16, $20, $06, $26, $36, $01, $12, $3A, $08, $28, $20, $09, $16, $2A ; $F966
    .byte $02, $16, $31, $07, $1B, $37, $0F, $16, $25, $FE, $02, $16, $31, $12, $22, $31 ; $F976
    .byte $07, $14, $23, $00, $10, $30, $09, $16, $2A, $02, $16, $31, $22, $31, $16, $0D ; $F986
    .byte $16, $37, $FE, $0C, $16, $30, $0B, $1B, $3B, $0F, $0B, $28, $06, $26, $36, $09 ; $F996
    .byte $16, $2A, $02, $16, $31, $0D, $12, $2B, $0F, $14, $2C, $FE, $0C, $16, $30, $0C ; $F9A6
    .byte $1C, $3C, $0F, $0B, $28, $00, $10, $30, $09, $16, $2A, $02, $16, $31, $07, $1B ; $F9B6
    .byte $37, $0F, $16, $25, $FE, $01, $16, $30, $08, $28, $30, $0F, $08, $28, $0C, $1C ; $F9C6
    .byte $3C, $09, $16, $2A, $02, $16, $31, $07, $1B, $37, $0F, $16, $25, $FE, $0C, $16 ; $F9D6
    .byte $31, $00, $10, $30, $08, $28, $30, $0B, $1B, $28, $09, $16, $2A, $02, $16, $31 ; $F9E6
    .byte $08, $16, $26, $0F, $1C, $3C, $FE, $06, $26, $36, $07, $26, $36, $00, $10, $36 ; $F9F6
    .byte $0B, $2B, $36, $09, $16, $2A, $00, $10, $36, $0F, $0F, $30, $FE, $0F, $0F, $0F ; $FA06
    .byte $0F, $0F, $0F, $0F, $0F, $0F, $07, $18, $36, $0F, $01, $3C, $0F, $01, $26, $0F ; $FA16
    .byte $26, $36, $FE, $01, $16, $30, $01, $00, $10, $01, $2A, $16, $01, $26, $36, $FE ; $FA26
    .byte $C8, $FA, $CB, $FA, $CE, $FA, $D1, $FA, $DC, $FA, $E4, $FA, $EC, $FA, $44, $FB ; $FA36
    .byte $49, $FB, $4E, $FB, $62, $FB, $66, $FB, $6A, $FB, $6F, $FB, $74, $FB, $F4, $FA ; $FA46
    .byte $24, $FB, $79, $FB, $7D, $FB, $FC, $FA, $81, $FB, $53, $FB, $58, $FB, $5D, $FB ; $FA56
    .byte $D4, $FA, $2F, $FB, $37, $FB, $04, $FB, $7A, $FC, $88, $FC, $5B, $FC, $1C, $FB ; $FA66
    .byte $86, $FB, $6F, $FC, $56, $FC, $0A, $FC, $18, $FC, $23, $FC, $0C, $FB, $14, $FB ; $FA76
    .byte $8B, $FB, $8B, $FB, $8B, $FB, $8B, $FB, $8F, $FB, $3F, $FB, $93, $FB, $98, $FB ; $FA86
    .byte $9D, $FB, $A2, $FB, $A7, $FB, $AC, $FB, $B1, $FB, $B6, $FB, $B6, $FB, $C4, $FB ; $FA96
    .byte $CF, $FB, $DA, $FB, $E5, $FB, $F0, $FB, $FB, $FB, $00, $FC, $05, $FC, $42, $FC ; $FAA6
    .byte $47, $FC, $4C, $FC, $51, $FC, $42, $FC, $42, $FC, $2E, $FC, $33, $FC, $38, $FC ; $FAB6
    .byte $3D, $FC, $0B, $12, $FE, $0B, $16, $FE, $0B, $27, $FE, $0B, $14, $FE, $19, $0F ; $FAC6
    .byte $17, $37, $0F, $1B, $28, $FE, $19, $0F, $14, $3B, $0F, $23, $33, $FE, $19, $08 ; $FAD6
    .byte $24, $37, $0F, $26, $37, $FE, $19, $0F, $17, $37, $0F, $1B, $28, $FE, $19, $16 ; $FAE6
    .byte $26, $37, $0F, $2B, $37, $FE, $19, $08, $14, $37, $0F, $11, $33, $FE, $19, $37 ; $FAF6
    .byte $17, $0B, $0D, $16, $31, $FE, $19, $0F, $26, $36, $0F, $22, $30, $FE, $19, $06 ; $FB06
    .byte $1B, $3A, $0F, $22, $30, $FE, $19, $00, $22, $34, $0F, $17, $38, $FE, $01, $07 ; $FB16
    .byte $27, $38, $07, $26, $36, $0F, $16, $30, $FE, $19, $09, $18, $22, $0D, $07, $26 ; $FB26
    .byte $FE, $19, $0F, $07, $29, $0F, $12, $2A, $FE, $15, $06, $17, $37, $FE, $09, $01 ; $FB36
    .byte $11, $21, $FE, $09, $21, $01, $11, $FE, $09, $11, $21, $01, $FE, $0D, $27, $37 ; $FB46
    .byte $17, $FE, $0D, $37, $17, $27, $FE, $0D, $17, $27, $37, $FE, $1A, $07, $29, $FE ; $FB56
    .byte $1A, $00, $12, $FE, $0D, $01, $17, $37, $FE, $0D, $01, $26, $27, $FE, $0D, $01 ; $FB66
    .byte $37, $17, $FE, $1A, $18, $37, $FE, $1A, $1B, $31, $FE, $0D, $08, $19, $2A, $FE ; $FB76
    .byte $19, $11, $2C, $30, $FE, $0A, $3C, $0C, $FE, $0A, $03, $25, $FE, $09, $12, $32 ; $FB86
    .byte $20, $FE, $09, $13, $24, $20, $FE, $09, $05, $25, $35, $FE, $09, $06, $16, $27 ; $FB96
    .byte $FE, $11, $09, $17, $2A, $FE, $15, $09, $14, $2A, $FE, $15, $16, $26, $37, $FE ; $FBA6
    .byte $01, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $FE, $01, $0F ; $FBB6
    .byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $FE, $01, $0F, $0C, $0F, $06, $0F, $0F ; $FBC6
    .byte $0F, $0F, $0C, $FE, $01, $0F, $1C, $06, $16, $0F, $06, $0F, $01, $1C, $FE, $01 ; $FBD6
    .byte $0F, $2C, $16, $26, $06, $16, $0F, $11, $2C, $FE, $01, $01, $3C, $26, $36, $16 ; $FBE6
    .byte $26, $01, $21, $3C, $FE, $11, $07, $17, $38, $FE, $11, $16, $16, $16, $FE, $11 ; $FBF6
    .byte $30, $30, $30, $FE, $11, $0C, $2A, $31, $0C, $2A, $16, $0C, $2A, $27, $0C, $2A ; $FC06
    .byte $13, $FE, $05, $0C, $12, $1C, $08, $04, $15, $00, $12, $22, $FE, $05, $09, $0B ; $FC16
    .byte $1B, $0F, $08, $13, $0F, $08, $00, $FE, $19, $09, $12, $2A, $FE, $19, $09, $16 ; $FC26
    .byte $2A, $FE, $19, $09, $27, $2A, $FE, $19, $09, $14, $2A, $FE, $01, $0C, $2A, $31 ; $FC36
    .byte $FE, $05, $0C, $2A, $16, $FE, $09, $0C, $2A, $27, $FE, $0D, $0C, $2A, $14, $FE ; $FC46
    .byte $15, $16, $27, $36, $FE, $00, $0C, $2A, $31, $0C, $2A, $16, $0C, $2A, $27, $0C ; $FC56
    .byte $2A, $13, $09, $12, $2A, $02, $16, $31, $FE, $00, $01, $16, $30, $01, $16, $2A ; $FC66
    .byte $16, $27, $10, $FE, $00, $0C, $2A, $16, $0C, $17, $33, $0C, $2A, $17, $0C, $2A ; $FC76
    .byte $13, $FE, $00, $0C, $21, $30, $0C, $16, $23, $0C, $17, $37, $FE, $1F, $FD, $25 ; $FC86
    .byte $FD, $00, $00, $00, $00, $00, $00, $B9, $FC, $C7, $FC, $CF, $FC, $D9, $FC, $EF ; $FC96
    .byte $FC, $F9, $FC, $0B, $FD, $31, $FD, $3D, $FD, $49, $FD, $49, $FD, $49, $FD, $49 ; $FCA6
    .byte $FD, $49, $FD, $5F, $00, $7F, $0C, $DF, $04, $E6, $02, $F9, $00, $FE, $06, $FF ; $FCB6
    .byte $00, $BF, $04, $F6, $00, $FE, $02, $FF, $00, $9C, $04, $A7, $0C, $F9, $00, $FE ; $FCC6
    .byte $02, $FF, $00, $BE, $00, $DF, $04, $E1, $0B, $E3, $01, $E8, $0C, $ED, $0D, $F0 ; $FCD6
    .byte $09, $F2, $02, $F9, $0A, $FE, $02, $FF, $00, $E4, $00, $F9, $04, $FD, $09, $FE ; $FCE6
    .byte $02, $FF, $00, $C1, $00, $DF, $04, $E1, $0B, $EF, $00, $F0, $09, $F1, $02, $FB ; $FCF6
    .byte $07, $FE, $08, $FF, $00, $A7, $00, $B5, $01, $DF, $04, $E1, $0B, $E2, $09, $E4 ; $FD06
    .byte $02, $E9, $0C, $EE, $0D, $FE, $0F, $FF, $00, $F7, $00, $FE, $04, $FF, $00, $0D ; $FD16
    .byte $00, $0F, $04, $F5, $00, $F8, $0C, $FE, $01, $FF, $00, $BB, $00, $BC, $0B, $BF ; $FD26
    .byte $09, $FC, $04, $FE, $02, $FF, $00, $CB, $00, $F8, $04, $FB, $01, $FD, $09, $FE ; $FD36
    .byte $02, $FF, $00, $FF, $00, $A9, $00, $A0, $F8, $20, $72, $F0, $F0, $27, $C9, $02 ; $FD46
    .byte $F0, $23, $C9, $0C, $F0, $1F, $4C, $48, $EF, $A9, $00, $A0, $F8, $20, $72, $F0 ; $FD56
    .byte $F0, $13, $C9, $02, $F0, $0F, $C9, $09, $F0, $0B, $C9, $0A, $F0, $07, $C9, $07 ; $FD66
    .byte $F0, $03, $4C, $48, $EF, $BD, $80, $04, $18, $69, $0A, $C9, $11, $90, $15, $BD ; $FD76
    .byte $60, $04, $A4, $5C, $F0, $08, $69, $3F, $C9, $44, $90, $08, $18, $60, $69, $07 ; $FD86
    .byte $C9, $10, $B0, $F8, $20, $48, $EF, $38, $60, $BD, $10, $04, $C9, $01, $F0, $05 ; $FD96
    .byte $A9, $16, $20, $F0, $CE, $BD, $50, $04, $29, $01, $F0, $08, $A9, $28, $20, $16 ; $FDA6
    .byte $F0, $4C, $BF, $FD, $A9, $28, $20, $26, $F0, $BD, $30, $06, $F0, $04, $DE, $30 ; $FDB6
    .byte $06, $60, $AD, $80, $04, $38, $FD, $80, $04, $B0, $03, $20, $D8, $8F, $C9, $0C ; $FDC6
    .byte $B0, $32, $AD, $60, $04, $38, $FD, $60, $04, $B0, $03, $20, $D8, $8F, $C9, $18 ; $FDD6
    .byte $B0, $22, $A4, $67, $B9, $73, $00, $D0, $0B, $A9, $03, $99, $73, $00, $A9, $01 ; $FDE6
    .byte $85, $5B, $D0, $04, $C9, $03, $D0, $09, $B9, $A8, $00, $18, $69, $01, $99, $A8 ; $FDF6
    .byte $00, $4C, $48, $EF, $20, $7B, $FD, $60, $BD, $40, $04, $0A, $A8, $B9, $3D, $88 ; $FE06
    .byte $9D, $60, $05, $B9, $3E, $88, $9D, $70, $05, $0A, $A8, $B9, $11, $8E, $85, $00 ; $FE16
    .byte $B9, $12, $8E, $85, $01, $A9, $00, $9D, $10, $04, $A8, $B1, $00, $9D, $00, $04 ; $FE26
    .byte $A9, $01, $9D, $20, $04, $A9, $C2, $9D, $50, $04, $60, $0F, $00, $FC, $08, $BD ; $FE36
    .byte $50, $06, $20, $8D, $B9, $90, $68, $98, $48, $B9, $60, $05, $A8, $A5, $6E, $39 ; $FE46
    .byte $18, $F1, $D0, $0C, $68, $A8, $A9, $FF, $99, $30, $06, $A9, $00, $4C, $86, $B9 ; $FE56
    .byte $68, $A8, $8A, $48, $98, $AA, $20, $48, $EF, $68, $AA, $4C, $C7, $EF, $A9, $02 ; $FE66
    .byte $D0, $06, $A9, $01, $D0, $02, $A9, $00, $0A, $A8, $B9, $B6, $FE, $85, $00, $B9 ; $FE76
    .byte $B7, $FE, $85, $01, $DE, $90, $06, $10, $26, $8A, $48, $BD, $88, $06, $A8, $B1 ; $FE86
    .byte $00, $C9, $FF, $D0, $07, $A9, $00, $9D, $88, $06, $F0, $EF, $B1, $00, $9D, $90 ; $FE96
    .byte $06, $FE, $88, $06, $FE, $88, $06, $C8, $B1, $00, $20, $2E, $F7, $68, $AA, $60 ; $FEA6
    .byte $BC, $FE, $C3, $FE, $D0, $FE, $02, $07, $02, $08, $02, $09, $FF, $06, $0C, $06 ; $FEB6
    .byte $0D, $06, $0E, $06, $0E, $06, $0D, $06, $0C, $FF, $01, $17, $01, $16, $01, $15 ; $FEC6
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FED6
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FEE6
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $AA, $AA, $AA, $AA, $AA, $AF ; $FEF6
    .byte $F0, $9E, $9F, $F0, $06, $AE, $7C, $1B, $98, $F0, $00, $03, $00, $0C, $01, $CE ; $FF06
    .byte $01, $80, $00, $00, $00, $00, $00, $0F, $1F, $FF, $FB, $F3, $CF, $F3, $EF, $DE ; $FF16
    .byte $B8, $F9, $A6, $A2, $24, $39, $81, $43, $80, $86, $19, $02, $38, $51, $87, $86 ; $FF26
    .byte $15, $39, $8C, $A6, $55, $4D, $16, $8C, $A3, $45, $45, $90, $CA, $56, $22, $52 ; $FF36
    .byte $70, $D6, $53, $16, $D3, $54, $D7, $4B, $37, $4B, $5B, $6B, $56, $CE, $B5, $5B ; $FF46
    .byte $5D, $59, $B6, $D5, $AB, $D6, $B5, $D7, $6B, $6D, $AD, $AE, $B6, $D6, $B5, $B5 ; $FF56
    .byte $AA, $D6, $AA, $AC, $AA, $A9, $54, $A9, $94, $A4, $A9, $4A, $4A, $8A, $92, $54 ; $FF66
    .byte $A5, $49, $29, $4A, $54, $A5, $29, $52, $A5, $4A, $A5, $54, $A9, $54, $AA, $95 ; $FF76
    .byte $2A, $AA, $94, $95, $2A, $AA, $55, $55, $2A, $56, $66, $AA, $9A, $AA, $B5, $5A ; $FF86
    .byte $AD, $AB, $5A, $B5, $6B, $6B, $6B, $5A, $B5, $AA, $B5, $56, $AA, $D5, $55, $56 ; $FF96
    .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $95, $55, $55, $B5, $56, $AA, $D5, $55, $56 ; $FFA6
    .byte $AA, $AA, $AA, $AA, $AA, $AA, $AA, $95, $55, $55, $FF, $FF, $FF, $FF, $FF, $FF ; $FFB6
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FFC6
    .byte $FF, $FF ; $FFD6
RESET_HANDLER:
    CLD                  ; $FFD8  D8
    SEI                  ; $FFD9  78
    INC $FFFF            ; $FFDA  EE FF FF
    JMP B07_C310         ; $FFDD  4C 10 C3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $53, $54, $49, $4E, $47, $45, $52 ; $FFE0
    .byte $00, $00, $00, $00, $38, $02, $01, $06, $A4, $1B, $A3, $C3, $D8, $FF, $12, $C4 ; $FFF0
