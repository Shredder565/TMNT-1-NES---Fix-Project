; TMNT NES 1989, MMC1 PRG bank 07
; CPU window $C000-$FFFF; 16KB bank, fixed byte size.
; Auto-discovered reachable instructions and literal raw data.
; WARNING: statically discovered code is incomplete; data may contain code.
; Edit operations/operands in place; preserve lengths for safe roundtrips.
.org $C000

    .byte $07 ; $C000
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
B07_C10A:
    LDA ($00),Y          ; $C10A  B1 00
    INY                  ; $C10C  C8
    CMP #$80             ; $C10D  C9 80
    ROR A                ; $C10F  6A
    PHP                  ; $C110  08
    CLC                  ; $C111  18
    ADC $02              ; $C112  65 02
    STA $0200,X          ; $C114  9D 00 02
    DEC $0200,X          ; $C117  DE 00 02
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
B07_C3A3:
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
B07_C412:
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
B07_C551:
    INC $1E              ; $C551  E6 1E
    LDA $1B              ; $C553  A5 1B
    JSR B07_C702         ; $C555  20 02 C7
    .byte $64, $C5, $27, $C6, $5C, $C6, $69, $C6, $07, $CB, $99, $C6, $A5, $1C, $20, $02 ; $C558
    .byte $C7, $71, $C5, $9C, $C5, $E1, $C5, $0F, $C6, $A9, $00, $85, $24, $A5, $FF, $29 ; $C568
    .byte $FC, $85, $FF, $20, $C0, $CE, $20, $D2, $C6, $20, $62, $C9, $A9, $0F, $20, $8A ; $C578
    .byte $CE, $A9, $21, $20, $2E, $F7, $20, $7E, $F7, $A9, $26, $20, $2C, $D2, $20, $B9 ; $C588
    .byte $C6, $E6, $1C, $60, $A5, $30, $29, $30, $D0, $05, $20, $A8, $C6, $D0, $67, $A5 ; $C598
    .byte $2E, $D0, $03, $20, $C0, $CE, $A9, $00, $85, $24, $A5, $FF, $29, $FC, $85, $FF ; $C5A8
    .byte $20, $D2, $C6, $20, $62, $C9, $20, $3C, $C9, $A9, $0F, $20, $8A, $CE, $A9, $00 ; $C5B8
    .byte $20, $6F, $CE, $20, $B9, $C6, $E6, $1C, $A5, $2E, $D0, $05, $A9, $4E, $20, $F0 ; $C5C8
    .byte $CE, $A9, $00, $85, $26, $60, $4C, $9C, $C6, $20, $A8, $C6, $F0, $F8, $A9, $40 ; $C5D8
    .byte $8D, $80, $04, $A9, $02, $8D, $50, $04, $A9, $00, $8D, $00, $04, $A6, $26, $BD ; $C5E8
    .byte $25, $C6, $8D, $60, $04, $A5, $F5, $29, $10, $F0, $0B, $A9, $3C, $20, $F0, $CE ; $C5F8
    .byte $A9, $80, $85, $3A, $E6, $1C, $60, $A5, $3A, $29, $08, $0A, $0A, $0A, $0A, $65 ; $C608
    .byte $26, $20, $58, $CA, $C6, $3A, $D0, $EE, $A9, $02, $4C, $A3, $C6, $B6, $C6, $A6 ; $C618
    .byte $1C, $D0, $15, $20, $D2, $C6, $A9, $00, $A0, $40, $20, $BD, $C6, $A9, $01, $85 ; $C628
    .byte $24, $85, $39, $85, $5C, $E6, $1C, $60, $A5, $30, $29, $30, $D0, $0C, $20, $3D ; $C638
    .byte $D2, $A5, $37, $D0, $05, $20, $A8, $C6, $D0, $BC, $A2, $00, $86, $2E, $86, $1B ; $C648
    .byte $E8, $86, $1C, $60, $20, $D2, $C6, $A9, $00, $85, $24, $20, $C2, $C6, $4C, $9C ; $C658
    .byte $C6, $A9, $00, $85, $34, $20, $D6, $C6, $E6, $5C, $A9, $00, $85, $C2, $85, $C3 ; $C668
    .byte $85, $C4, $A9, $03, $85, $46, $A9, $80, $85, $77, $85, $78, $85, $79, $85, $7A ; $C678
    .byte $A9, $00, $85, $BF, $85, $A7, $85, $A8, $85, $A9, $85, $AA, $85, $AB, $4C, $9C ; $C688
    .byte $C6, $4C, $89, $D2, $E6, $1B, $A9, $00, $85, $1C, $60, $85, $1B, $4C, $9E, $C6 ; $C698
    .byte $A5, $3A, $05, $3B, $F0, $0A, $A5, $3A, $D0, $02, $C6, $3B, $C6, $3A, $A9, $01 ; $C6A8
    .byte $60, $A9, $00, $A0, $01, $85, $3A, $84, $3B, $60, $A5, $26, $85, $25, $60, $A9 ; $C6B8
    .byte $00, $A2, $07, $9D, $C2, $03, $CA, $10, $FA, $60, $A2, $30, $D0, $02, $A2, $48 ; $C6C8
    .byte $A9, $00, $95, $00, $E8, $E0, $C8, $D0, $03, $E8, $E8, $E8, $E0, $E0, $D0, $F2 ; $C6D8
    .byte $A2, $00, $9D, $00, $04, $9D, $00, $05, $9D, $00, $06, $9D, $00, $07, $E8, $D0 ; $C6E8
    .byte $F1, $A2, $C0, $9D, $00, $03, $E8, $D0, $FA, $60 ; $C6F8
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
    .byte $18, $75, $00, $95, $00, $90, $02, $F6, $01, $60, $A0, $00, $84, $00, $84, $01 ; $C71B
    .byte $C9, $0A, $90, $06, $E9, $0A, $E6, $01, $D0, $F6, $85, $00, $09, $00, $D0, $04 ; $C72B
    .byte $A9, $0A, $85, $00, $A5, $01, $D0, $04, $A9, $0A, $85, $01, $60 ; $C73B
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
    .byte $6D, $C6, $03, $48, $98, $6D, $C5, $03, $A8, $68, $60, $20, $62, $C9, $A9, $00 ; $C931
    .byte $85, $FD, $85, $FC, $A5, $FF, $29, $FC, $85, $FF, $A9, $01, $20, $A5, $CE, $A2 ; $C941
    .byte $02, $20, $82, $C9, $A9, $21, $20, $2E, $F7, $20, $7E, $F7, $A9, $00, $4C, $58 ; $C951
    .byte $CA, $A2, $00, $20, $82, $C9, $A9, $00, $A0, $3F, $99, $C0, $05, $99, $C0, $06 ; $C961
    .byte $88, $10, $F7, $60, $A9, $E8, $85, $FC, $A9, $01, $0A, $8D, $DF, $03, $4C, $89 ; $C971
    .byte $C9, $A9, $00, $85, $FC, $8D, $DF, $03, $BD, $CE, $E3, $85, $00, $BD, $CF, $E3 ; $C981
    .byte $85, $01, $20, $B3, $C4, $A9, $00, $85, $FD, $AD, $02, $20, $A0, $01, $B1, $00 ; $C991
    .byte $8D, $06, $20, $88, $B1, $00, $8D, $06, $20, $A2, $00, $A9, $02, $20, $1B, $C7 ; $C9A1
    .byte $A0, $00, $B1, $00, $C9, $FF, $F0, $3E, $C9, $7F, $F0, $32, $A8, $10, $1D, $29 ; $C9B1
    .byte $7F, $85, $02, $A0, $01, $B1, $00, $8D, $07, $20, $C4, $02, $F0, $03, $C8, $D0 ; $C9C1
    .byte $F4, $A9, $01, $18, $65, $02, $20, $1B, $C7, $4C, $B1, $C9, $A0, $01, $85, $02 ; $C9D1
    .byte $B1, $00, $A4, $02, $8D, $07, $20, $88, $D0, $FA, $A9, $02, $D0, $E8, $A9, $01 ; $C9E1
    .byte $20, $1B, $C7, $4C, $9A, $C9, $A9, $03, $85, $20, $4C, $84, $C4, $00, $20, $78 ; $C9F1
    .byte $00, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00, $40 ; $CA01
    .byte $00, $7F, $00, $28, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00 ; $CA11
    .byte $78, $00, $78, $00, $20, $00, $FF, $00, $23, $60, $32, $60, $32, $7F, $00, $2B ; $CA21
    .byte $60, $32, $60, $32, $FF, $AB, $21, $89, $16, $10, $1C, $14, $00, $1E, $25, $14 ; $CA31
    .byte $21, $FF, $00, $20, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00, $78, $00 ; $CA41
    .byte $78, $00, $78, $00, $40, $00, $FF, $A8, $A9, $03, $85, $03, $98, $85, $02, $0A ; $CA51
    .byte $A8, $B9, $B7, $CA, $85, $00, $B9, $B8, $CA, $85, $01, $A6, $22, $A0, $00, $B1 ; $CA61
    .byte $00, $C8, $C9, $FF, $F0, $21, $C9, $FE, $F0, $1D, $9D, $00, $03, $A5, $02, $10 ; $CA71
    .byte $0B, $A5, $03, $D0, $05, $9D, $00, $03, $F0, $02, $C6, $03, $E8, $D0, $E0, $A9 ; $CA81
    .byte $FF ; $CA91
B07_CA92:
    LDX $22              ; $CA92  A6 22
B07_CA94:
    STA $0300,X          ; $CA94  9D 00 03
    INX                  ; $CA97  E8
    STX $22              ; $CA98  86 22
    RTS                  ; $CA9A  60
B07_CA9B:
    LDA #$00             ; $CA9B  A9 00
    BEQ B07_CA92         ; $CA9D  F0 F3
B07_CA9F:
    LDA #$00             ; $CA9F  A9 00
    JSR B07_CA94         ; $CAA1  20 94 CA
    LDA #$00             ; $CAA4  A9 00
    BEQ B07_CA94         ; $CAA6  F0 EC
    LDA #$FF             ; $CAA8  A9 FF
    LDX $23              ; $CAAA  A6 23
    STA $0360,X          ; $CAAC  9D 60 03
    INX                  ; $CAAF  E8
    STX $23              ; $CAB0  86 23
    RTS                  ; $CAB2  60
    .byte $A9, $00, $F0, $F3, $D6, $CA, $F7, $CA, $FF, $CA, $D3, $AA, $DA, $AA, $E1, $AA ; $CAB3
    .byte $E4, $CA, $EB, $CA, $EF, $AA, $F4, $AA, $F9, $AA, $FE, $AA, $E8, $AA, $01, $20 ; $CAC3
    .byte $00, $00, $FE, $0A, $22, $CB, $1F, $24, $22, $17, $00, $22, $23, $10, $21, $23 ; $CAD3
    .byte $FE, $03, $22, $0D, $14, $1D, $13, $FE, $08, $21, $AD, $12, $1E, $1D, $23, $18 ; $CAE3
    .byte $1D, $24, $14, $FE, $04, $23, $E3, $AA, $AA, $AA, $AA, $FE, $04, $22, $0F, $E4 ; $CAF3
    .byte $FA, $FB, $FC, $FE, $AD, $EA, $03, $D0, $10, $A5, $34, $C9, $06, $90, $0A, $20 ; $CB03
    .byte $B9, $CD, $A5, $35, $F0, $03, $4C, $2E, $D1, $A9, $00, $8D, $EA, $03, $A5, $34 ; $CB13
    .byte $20, $02, $C7, $3E, $CB, $54, $CB, $D0, $D2, $5C, $CB, $C8, $D4, $BF, $CB, $18 ; $CB23
    .byte $CC, $CD, $CC, $0A, $CD, $57, $CB, $55, $CD, $FD, $CC, $A9, $00, $8D, $E7, $03 ; $CB33
    .byte $A5, $45, $29, $03, $A8, $B9, $50, $CB, $85, $55, $E6, $34, $60, $04, $03, $02 ; $CB43
    .byte $04, $E6, $34, $60, $A9, $02, $85, $34, $60, $A5, $5C, $D0, $06, $20, $C7, $C6 ; $CB53
    .byte $20, $A7, $CB, $A0, $00, $A5, $48, $C9, $04, $D0, $08, $A5, $5D, $C9, $06, $D0 ; $CB63
    .byte $02, $A0, $80, $84, $A2, $A9, $01, $85, $3C, $A9, $01, $85, $36, $20, $62, $C9 ; $CB73
    .byte $20, $4B, $D3, $AD, $09, $06, $D0, $19, $20, $BC, $EF, $A4, $5C, $F0, $12, $A4 ; $CB83
    .byte $5D, $88, $D0, $0D, $A4, $48, $88, $D0, $08, $A9, $8C, $85, $BB, $A9, $1E, $85 ; $CB93
    .byte $BA, $E6, $34, $60, $A0, $00, $B9, $4F, $00, $99, $95, $00, $C8, $C0, $04, $90 ; $CBA3
    .byte $F5, $AD, $80, $04, $85, $99, $AD, $60, $04, $85, $9A, $60, $A5, $5C, $F0, $08 ; $CBB3
    .byte $AD, $09, $06, $D0, $03, $20, $20, $CF, $E6, $34, $A9, $10, $85, $3D, $AD, $09 ; $CBC3
    .byte $06, $F0, $06, $A9, $00, $8D, $09, $06, $60, $AD, $E2, $03, $F0, $06, $A9, $00 ; $CBD3
    .byte $8D, $E2, $03, $60, $20, $C0, $CE, $A5, $5C, $F0, $16, $A4, $48, $88, $D0, $09 ; $CBE3
    .byte $A4, $5D, $D0, $05, $A9, $6B, $4C, $F0, $CE, $A4, $48, $B9, $12, $CC, $4C, $F0 ; $CBF3
    .byte $CE, $A4, $48, $B9, $0C, $CC, $4C, $F0, $CE, $53, $53, $53, $53, $57, $53, $5B ; $CC03
    .byte $5F, $6B, $5B, $6F, $6B, $A5, $3D, $F0, $0E, $C6, $3D, $D0, $04, $A9, $00, $85 ; $CC13
    .byte $36, $20, $E0, $DE, $4C, $42, $D0, $A5, $B5, $F0, $03, $4C, $9C, $CC, $A5, $1E ; $CC23
    .byte $29, $7F, $D0, $13, $A5, $9E, $C9, $FF, $F0, $0D, $A5, $9D, $18, $69, $01, $85 ; $CC33
    .byte $9D, $A5, $9E, $69, $00, $85, $9E, $A5, $1E, $29, $01, $F0, $1F, $20, $2A, $D0 ; $CC43
    .byte $24, $A2, $30, $12, $20, $F3, $CF, $20, $00, $D0, $20, $F6, $E3, $20, $42, $D0 ; $CC53
    .byte $20, $BB, $DE, $4C, $22, $D0, $20, $E0, $DE, $4C, $42, $D0, $A5, $3F, $D0, $0B ; $CC63
    .byte $AD, $FC, $03, $D0, $06, $20, $10, $CF, $20, $42, $CF, $20, $18, $CF, $20, $4A ; $CC73
    .byte $CF, $20, $CD, $CF, $20, $C5, $CF, $20, $42, $D0, $20, $E0, $DE, $20, $4D, $D0 ; $CC83
    .byte $20, $45, $E1, $A9, $00, $8D, $D5, $03, $60, $A5, $1E, $29, $01, $F0, $09, $20 ; $CC93
    .byte $3A, $D0, $20, $42, $D0, $4C, $E0, $DE, $A5, $B5, $29, $7F, $C9, $0D, $F0, $04 ; $CCA3
    .byte $C9, $10, $D0, $06, $20, $CD, $CF, $4C, $C4, $CC, $C9, $06, $D0, $03, $20, $D5 ; $CCB3
    .byte $CF, $20, $42, $D0, $20, $4D, $D0, $4C, $E0, $DE, $A9, $C2, $8D, $50, $04, $A9 ; $CCC3
    .byte $1F, $20, $56, $CE, $A4, $67, $A9, $00, $99, $A8, $00, $99, $73, $00, $8D, $40 ; $CCD3
    .byte $05, $85, $89, $85, $B0, $85, $5E, $85, $7E, $85, $88, $85, $36, $85, $8C, $A9 ; $CCE3
    .byte $01, $8D, $17, $06, $20, $39, $EF, $4C, $F1, $CD, $20, $62, $C9, $A2, $0C, $20 ; $CCF3
    .byte $82, $C9, $A9, $08, $85, $34, $60, $A9, $01, $85, $36, $8D, $D9, $03, $E6, $9D ; $CD03
    .byte $D0, $3F, $E6, $9E, $F0, $0B, $A5, $9E, $C9, $FF, $D0, $35, $A9, $8B, $4C, $F0 ; $CD13
    .byte $CE, $C6, $46, $D0, $03, $4C, $67, $CD, $20, $62, $C9, $A9, $06, $20, $58, $CA ; $CD23
    .byte $A9, $07, $20, $58, $CA, $A9, $49, $8D, $00, $04, $A9, $60, $8D, $60, $04, $A9 ; $CD33
    .byte $60, $8D, $80, $04, $A9, $02, $8D, $50, $04, $A9, $00, $85, $26, $A9, $0A, $85 ; $CD43
    .byte $34, $60, $A9, $01, $8D, $D9, $03, $A5, $30, $29, $10, $F0, $3D, $A5, $26, $4A ; $CD53
    .byte $29, $01, $F0, $09, $A9, $00, $85, $34, $85, $2E, $4C, $A3, $C6, $A5, $48, $85 ; $CD63
    .byte $2E, $20, $D6, $C6, $A5, $2E, $85, $48, $85, $5D, $C9, $05, $D0, $07, $A2, $01 ; $CD73
    .byte $86, $5C, $CA, $86, $5D, $A9, $80, $85, $77, $85, $78, $85, $79, $85, $7A, $A9 ; $CD83
    .byte $02, $85, $34, $A9, $00, $85, $2E, $E6, $36, $60, $A5, $30, $29, $20, $F0, $02 ; $CD93
    .byte $E6, $26, $A5, $26, $4A, $29, $01, $AA, $BD, $B2, $CD, $8D, $60, $04, $60, $70 ; $CDA3
    .byte $88, $A5, $F5, $85, $CB, $60, $A5, $1E, $29, $01, $D0, $F5, $A5, $24, $0D, $ED ; $CDB3
    .byte $03, $05, $36, $05, $20, $05, $3F, $05, $3D, $05, $B5, $05, $D2, $D0, $E6, $AD ; $CDC3
    .byte $10, $05, $C9, $16, $F0, $DF, $A4, $67, $B9, $77, $00, $F0, $D8, $A5, $F5, $05 ; $CDD3
    .byte $CB, $A4, $35, $D0, $1E, $29, $10, $F0, $69, $A9, $3E, $20, $F0, $CE, $A0, $00 ; $CDE3
    .byte $84, $D0, $8C, $00, $04, $C8, $84, $35, $A5, $FF, $85, $A1, $AD, $00, $04, $8D ; $CDF3
    .byte $50, $05, $60, $29, $10, $F0, $4B, $A5, $5B, $F0, $0B, $A4, $67, $B9, $73, $00 ; $CE03
    .byte $D0, $04, $A9, $00, $85, $5B, $A9, $00, $85, $35, $85, $94, $AD, $50, $05, $8D ; $CE13
    .byte $00, $04, $20, $62, $C9, $A5, $27, $20, $6F, $CE, $A5, $28, $20, $8A, $CE, $A5 ; $CE23
    .byte $34, $C9, $07, $F0, $08, $A9, $01, $8D, $09, $06, $8D, $D5, $03, $A9, $03, $38 ; $CE33
    .byte $ED, $17, $06, $85, $34, $A9, $00, $8D, $17, $06, $A5, $A1, $85, $FF, $A5, $4F ; $CE43
    .byte $85, $FD, $60 ; $CE53
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
    .byte $85, $CF, $AD, $00, $80, $85, $59, $A9, $00, $20, $A7, $CE, $24, $2F, $30, $0B ; $CEF0
    .byte $A9, $80, $85, $2F, $A5, $CF, $20, $57, $90, $06, $2F ; $CF00
B07_CF0B:
    LDA $59              ; $CF0B  A5 59
    JMP B07_CEA7         ; $CF0D  4C A7 CE
    .byte $A9, $06, $20, $A5, $CE, $4C, $F6, $80, $A9, $05, $20, $A5, $CE, $4C, $01, $80 ; $CF10
    .byte $A9, $06, $20, $A5, $CE, $4C, $CC, $85, $A9, $05, $20, $A7, $CE, $20, $77, $80 ; $CF20
    .byte $4C, $D0, $CE ; $CF30
B07_CF33:
    LDA #$06             ; $CF33  A9 06
    JSR B07_CEA5         ; $CF35  20 A5 CE
    JSR $BD64            ; $CF38  20 64 BD
    ROL $10              ; $CF3B  26 10
    LDA #$05             ; $CF3D  A9 05
    JMP B07_CEA5         ; $CF3F  4C A5 CE
    .byte $A9, $04, $20, $A5, $CE, $4C, $94, $AB, $A9, $04, $20, $A5, $CE, $4C, $54, $B5 ; $CF42
    .byte $A9, $04, $20, $A7, $CE, $20, $BE, $AC, $4C, $D0, $CE, $A9, $06, $20, $A5, $CE ; $CF52
    .byte $20, $C5, $BB, $A9, $05, $4C, $A5, $CE, $A9, $06, $20, $A5, $CE, $20, $29, $BD ; $CF62
    .byte $4C, $65, $CF, $A9, $05, $20, $A7, $CE, $20, $E6, $BA, $85, $9C, $4C, $D0, $CE ; $CF72
    .byte $85, $11, $A9, $05, $20, $A5, $CE, $A5, $11, $20, $01, $81, $26, $11, $84, $10 ; $CF82
    .byte $A9, $06, $4C, $A5, $CE, $A9, $04, $20, $A7, $CE, $20, $12, $97, $4C, $D0, $CE ; $CF92
    .byte $A9, $04, $20, $A7, $CE, $20, $F3, $96, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE ; $CFA2
    .byte $20, $1D, $97, $4C, $D0, $CE, $A9, $04, $20, $A5, $CE, $20, $9A, $AA, $A9, $05 ; $CFB2
    .byte $4C, $A5, $CE, $A9, $06, $20, $A5, $CE, $4C, $35, $95, $A9, $06, $20, $A5, $CE ; $CFC2
    .byte $4C, $05, $80, $A9, $06, $20, $A5, $CE, $4C, $01, $80, $A9, $06, $20, $A7, $CE ; $CFD2
    .byte $20, $05, $80, $4C, $D0, $CE, $A9, $06, $20, $A7, $CE, $20, $01, $80, $4C, $D0 ; $CFE2
    .byte $CE, $A5, $3F, $F0, $01, $60, $A9, $01, $20, $A5, $CE, $4C, $B9, $D7, $A9, $01 ; $CFF2
    .byte $20, $A5, $CE, $4C, $6E, $DC, $A9, $01, $20, $A5, $CE, $20, $6E, $DC, $A9, $06 ; $D002
    .byte $4C, $A5, $CE, $A9, $01, $20, $A5, $CE, $20, $B9, $D7, $A9, $06, $4C, $A5, $CE ; $D012
    .byte $A9, $04, $20, $A5, $CE, $4C, $D9, $A9, $A9, $04, $20, $A5, $CE, $4C, $45, $97 ; $D022
    .byte $A9, $06, $20, $A5, $CE, $4C, $98, $A8, $A9, $06, $20, $A5, $CE, $4C, $47, $9F ; $D032
    .byte $A9, $00, $20, $A7, $CE, $20, $01, $80, $4C, $D0, $CE, $A9, $00, $20, $A7, $CE ; $D042
    .byte $20, $55, $80, $4C, $D0, $CE, $48, $A9, $05, $20, $A5, $CE, $68, $20, $70, $B1 ; $D052
    .byte $A9, $06, $4C, $A5, $CE, $AD, $00, $80, $48, $20, $72, $D0, $68, $4C, $A7, $CE ; $D062
    .byte $A9, $04, $20, $A5, $CE, $20, $45, $97, $A9, $05, $20, $A5, $CE, $20, $01, $80 ; $D072
    .byte $A9, $06, $20, $A5, $CE, $20, $CD, $CF, $4C, $45, $E1, $A9, $04, $20, $A5, $CE ; $D082
    .byte $20, $45, $97, $A9, $06, $20, $A5, $CE, $20, $CD, $CF, $20, $45, $E1, $A9, $03 ; $D092
    .byte $4C, $A5, $CE, $A9, $04, $20, $A7, $CE, $20, $35, $9F, $4C, $D0, $CE, $A9, $04 ; $D0A2
    .byte $20, $A7, $CE, $20, $35, $9F, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE, $20, $57 ; $D0B2
    .byte $A6, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE, $20, $9F, $A6, $4C, $D0, $CE, $A9 ; $D0C2
    .byte $04, $20, $A7, $CE, $20, $62, $96, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE, $20 ; $D0D2
    .byte $83, $A9, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE, $20, $F0, $A5, $4C, $D0, $CE ; $D0E2
    .byte $48, $A9, $04, $20, $A7, $CE, $68, $20, $AF, $A6, $08, $20, $D0, $CE, $28, $60 ; $D0F2
    .byte $A2, $00 ; $D102
B07_D104:
    PHA                  ; $D104  48
    LDA #$06             ; $D105  A9 06
    JSR B07_CEA7         ; $D107  20 A7 CE
    PLA                  ; $D10A  68
    JSR $8081            ; $D10B  20 81 80
    JMP B07_CED0         ; $D10E  4C D0 CE
B07_D111:
    PHA                  ; $D111  48
    LDA #$06             ; $D112  A9 06
    JSR B07_CEA7         ; $D114  20 A7 CE
    PLA                  ; $D117  68
    JSR $8272            ; $D118  20 72 82
    PHP                  ; $D11B  08
    JSR B07_CED0         ; $D11C  20 D0 CE
    PLP                  ; $D11F  28
    RTS                  ; $D120  60
    .byte $48, $A9, $05, $20, $A7, $CE, $68, $20, $81, $83, $4C, $D0, $CE, $A9, $03, $20 ; $D121
    .byte $A5, $CE, $4C, $1C, $A9, $A9, $06, $20, $A7, $CE, $20, $0E, $FE, $4C, $D0, $CE ; $D131
    .byte $A9, $02, $20, $A5, $CE, $4C, $B2, $B5, $A9, $02, $20, $A5, $CE, $4C, $BE, $B5 ; $D141
    .byte $AD, $00, $80, $48, $20, $5C, $D1, $68, $4C, $A7, $CE, $A9, $03, $20, $A7, $CE ; $D151
    .byte $A9, $00, $85, $D0, $20, $1C, $A9, $20, $9B, $CA, $20, $B3, $C4, $20, $6C, $C2 ; $D161
    .byte $A5, $D0, $C9, $06, $90, $EE, $A5, $67, $0A, $AA, $48, $BD, $C1, $D1, $20, $58 ; $D171
    .byte $CA, $68, $AA, $BD, $C2, $D1, $20, $2E, $F7, $A9, $00, $85, $D0, $85, $94, $8D ; $D181
    .byte $96, $05, $A9, $01, $85, $9F, $85, $8E, $20, $95, $B6, $20, $D1, $AD, $4C, $D0 ; $D191
    .byte $CE, $AD, $00, $80, $48, $20, $AD, $D1, $68, $4C, $A7, $CE, $A9, $03, $20, $A7 ; $D1A1
    .byte $CE, $A5, $94, $C9, $03, $B0, $03, $20, $95, $B6, $20, $D1, $AD, $4C, $D0, $CE ; $D1B1
    .byte $03, $00, $04, $01, $05, $02, $0C, $03, $20, $A7, $CE, $20, $82, $C9, $4C, $D0 ; $D1C1
    .byte $CE, $A9, $03, $20, $A5, $CE, $4C, $E2, $BA, $A9, $03, $20, $A5, $CE, $4C, $F7 ; $D1D1
    .byte $BA, $A0, $00, $4C, $00, $D2, $A0, $01, $4C, $00, $D2, $A0, $02, $4C, $00, $D2 ; $D1E1
    .byte $A0, $03, $4C, $00, $D2, $A0, $04, $4C, $00, $D2, $A0, $05, $4C, $00, $D2, $A9 ; $D1F1
    .byte $03, $20, $A7, $CE, $20, $0B, $D2, $4C, $D0, $CE, $98, $20, $02, $C7, $C8, $BB ; $D201
    .byte $F5, $BB, $78, $BC, $1E, $BC, $1E, $BC, $88, $BC, $85, $10, $A9, $01, $20, $A5 ; $D211
    .byte $CE, $A6, $10, $20, $82, $C9, $A9, $03, $4C, $A5, $CE, $85, $10, $A9, $00, $20 ; $D221
    .byte $A5, $CE, $A6, $10, $20, $82, $C9, $A9, $07, $4C, $A5, $CE, $A9, $03, $20, $A7 ; $D231
    .byte $CE, $20, $FB, $BC, $4C, $D0, $CE, $A9, $06, $20, $A5, $CE, $20, $01, $80, $A9 ; $D241
    .byte $03, $4C, $A5, $CE, $A9, $04, $20, $A5, $CE, $20, $62, $96, $A9, $03, $4C, $A5 ; $D251
    .byte $CE, $A9, $01, $20, $A5, $CE, $20, $7A, $BE, $A9, $03, $4C, $A5, $CE, $A9, $01 ; $D261
    .byte $20, $A5, $CE, $20, $E2, $BE, $A9, $03, $4C, $A5, $CE, $A9, $01, $20, $A5, $CE ; $D271
    .byte $20, $B7, $BE, $A9, $03, $4C, $A5, $CE, $A9, $04, $20, $A5, $CE, $4C, $69, $BB ; $D281
    .byte $A9, $02, $20, $A5, $CE, $98, $20, $B7, $B8, $A9, $03, $85, $21, $4C, $D0, $CE ; $D291
    .byte $A9, $02, $20, $A5, $CE, $20, $18, $B9, $A9, $03, $85, $21, $4C, $D0, $CE, $A9 ; $D2A1
    .byte $02, $20, $A7, $CE, $4C, $59, $BD, $A9, $02, $20, $A7, $CE, $4C, $59, $BD, $A9 ; $D2B1
    .byte $02, $20, $A7, $CE, $4C, $6C, $BD, $A9, $02, $20, $A7, $CE, $4C, $20, $BE, $A9 ; $D2C1
    .byte $00, $8D, $D6, $03, $E6, $34, $20, $3D, $EF, $20, $D1, $D0, $A9, $1F, $20, $56 ; $D2D1
    .byte $CE, $A5, $5C, $D0, $1C, $A5, $5D, $0A, $0A, $A8, $B9, $79, $D6, $85, $4F, $B9 ; $D2E1
    .byte $7A, $D6, $85, $50, $B9, $7B, $D6, $85, $51, $B9, $7C, $D6, $85, $52, $4C, $3E ; $D2F1
    .byte $D3, $A5, $48, $C9, $05, $D0, $04, $A9, $00, $85, $5D, $A5, $48, $0A, $A8, $B9 ; $D301
    .byte $8D, $D6, $85, $00, $B9, $8E, $D6, $85, $01, $A5, $5D, $0A, $0A, $A8, $B1, $00 ; $D311
    .byte $85, $4F, $C8, $B1, $00, $85, $50, $C8, $B1, $00, $85, $51, $C8, $B1, $00, $85 ; $D321
    .byte $52, $A5, $48, $C9, $05, $F0, $06, $85, $5D, $A9, $00, $85, $5C, $A5, $48, $C9 ; $D331
    .byte $02, $D0, $06, $20, $8D, $F1, $20, $97, $CF, $60, $A9, $01, $20, $A7, $CE, $A5 ; $D341
    .byte $5C, $D0, $13, $4C, $25, $D4, $18, $69, $02, $65, $5D, $4C, $7F, $D3, $A9, $0C ; $D351
    .byte $D0, $1C, $A9, $01, $D0, $18, $A9, $17, $85, $A3, $A5, $48, $C9, $04, $F0, $E6 ; $D361
    .byte $C9, $03, $D0, $0A, $A5, $5D, $F0, $06, $C9, $11, $F0, $E2, $A5, $48, $0A, $A8 ; $D371
    .byte $B9, $15, $80, $85, $4B, $B9, $16, $80, $85, $4C, $B9, $33, $80, $85, $4D, $B9 ; $D381
    .byte $34, $80, $85, $4E, $A5, $48, $0A, $A8, $B9, $5D, $80, $85, $60, $B9, $5E, $80 ; $D391
    .byte $85, $61, $B9, $9E, $F4, $85, $00, $B9, $9F, $F4, $85, $01, $A5, $5D, $0A, $A8 ; $D3A1
    .byte $B1, $00, $85, $49, $C8, $B1, $00, $85, $4A, $A5, $48, $0A, $A8, $B9, $3B, $D6 ; $D3B1
    .byte $85, $00, $B9, $3C, $D6, $85, $01, $A4, $5D, $B1, $00, $20, $18, $F7, $20, $48 ; $D3C1
    .byte $D5, $A5, $48, $C9, $05, $D0, $10, $A5, $5D, $C9, $03, $D0, $0A, $AD, $09, $06 ; $D3D1
    .byte $D0, $05, $A9, $20, $20, $2E, $F7, $20, $74, $D5, $AD, $09, $06, $D0, $03, $20 ; $D3E1
    .byte $51, $D5, $A5, $58, $F0, $0B, $A5, $57, $18, $69, $45, $20, $2E, $F7, $4C, $16 ; $D3F1
    .byte $D4, $20, $5E, $F7, $A5, $5E, $C9, $03, $D0, $0B, $A5, $7B, $C9, $03, $D0, $05 ; $D401
    .byte $A9, $11, $20, $2E, $F7, $20, $36, $D5, $20, $E0, $DE, $A9, $FF, $85, $A4, $A9 ; $D411
    .byte $01, $85, $65, $60, $A9, $00, $85, $3F, $8D, $07, $06, $A9, $1E, $85, $A3, $A9 ; $D421
    .byte $10, $20, $6F, $CE, $A4, $5D, $B9, $C8, $D5, $20, $8A, $CE, $A5, $5D, $0A, $A8 ; $D431
    .byte $B9, $01, $80, $85, $4B, $B9, $02, $80, $85, $4C, $B9, $0B, $80, $85, $4D, $B9 ; $D441
    .byte $0C, $80, $85, $4E, $B9, $51, $80, $85, $60, $B9, $52, $80, $85, $61, $B9, $AA ; $D451
    .byte $F4, $85, $49, $B9, $AB, $F4, $85, $4A, $20, $36, $D5, $20, $E0, $DE, $A9, $FE ; $D461
    .byte $85, $A4, $A9, $01, $85, $65, $A4, $5D, $B9, $36, $D6, $20, $18, $F7, $4C, $48 ; $D471
    .byte $D5, $E6, $34, $A9, $1E, $20, $56, $CE, $A9, $01, $20, $A7, $CE, $20, $62, $C9 ; $D481
    .byte $A2, $16, $20, $82, $C9, $A9, $23, $85, $29, $A9, $00, $85, $2A, $AD, $09, $06 ; $D491
    .byte $D0, $1C, $A2, $14, $20, $82, $C9, $A2, $00, $8A, $9D, $00, $07, $E8, $D0, $FA ; $D4A1
    .byte $A2, $07, $A9, $44, $9D, $58, $07, $9D, $D8, $07, $CA, $10, $F7, $60, $A5, $A1 ; $D4B1
    .byte $85, $FF, $A5, $4F, $85, $FD, $60, $A5, $A2, $30, $B6, $A9, $1F, $20, $56, $CE ; $D4C1
    .byte $A9, $01, $20, $A7, $CE, $E6, $A4, $30, $3C, $A5, $A4, $0A, $0A, $0A, $18, $65 ; $D4D1
    .byte $51, $85, $0A, $A5, $52, $69, $00, $85, $0B, $20, $23, $DF, $A5, $4F, $18, $69 ; $D4E1
    .byte $08, $29, $F0, $85, $08, $A5, $50, $69, $00, $85, $09, $20, $FC, $DE, $20, $35 ; $D4F1
    .byte $DA, $A9, $10, $85, $0D, $20, $08, $DD, $A5, $A4, $C5, $A3, $D0, $06, $E6, $34 ; $D501
    .byte $A9, $00, $85, $A3, $60, $A5, $5C, $F0, $01, $60, $A5, $52, $D0, $07, $A5, $51 ; $D511
    .byte $29, $F8, $D0, $01, $60, $A5, $51, $38, $E9, $08, $85, $0A, $A5, $52, $E9, $00 ; $D521
    .byte $85, $0B, $4C, $EA, $D4, $A5, $28, $38, $E9, $0D, $0A, $A8, $B9, $93, $FC, $85 ; $D531
    .byte $62, $B9, $94, $FC, $85, $63, $60 ; $D541
B07_D548:
    LDY $67              ; $D548  A4 67
    LDA $D675,Y          ; $D54A  B9 75 D6
    STA $05B1            ; $D54D  8D B1 05
    RTS                  ; $D550  60
    .byte $A5, $48, $0A, $A8, $B9, $CE, $D5, $85, $00, $B9, $CF, $D5, $85, $01, $A5, $5D ; $D551
    .byte $0A, $A8, $B1, $00, $20, $8A, $CE, $C8, $B1, $00, $8D, $04, $06, $20, $6F, $CE ; $D561
    .byte $4C, $5E, $F7, $A0, $00, $A5, $51, $85, $00, $A5, $52, $4A, $66, $00, $4A, $66 ; $D571
    .byte $00, $4A, $66, $00, $4A, $66, $00, $B9, $A7, $D5, $C5, $00, $F0, $05, $C8, $C0 ; $D581
    .byte $10, $D0, $F4, $B9, $B7, $D5, $85, $29, $A0, $00, $84, $2A, $C9, $21, $F0, $01 ; $D591
    .byte $60, $A0, $80, $84, $2A, $60, $00, $0C, $18, $24, $30, $3C, $48, $54, $60, $6C ; $D5A1
    .byte $78, $84, $90, $9C, $A8, $B4, $29, $20, $23, $2A, $21, $29, $20, $23, $2A, $21 ; $D5B1
    .byte $29, $20, $23, $2A, $21, $29, $20, $12, $13, $12, $14, $14, $0F, $DA, $D5, $E6 ; $D5C1
    .byte $D5, $EA, $D5, $F8, $D5, $1C, $D6, $2E, $D6, $15, $00, $15, $00, $15, $00, $15 ; $D5D1
    .byte $01, $15, $01, $15, $04, $16, $00, $18, $11, $15, $02, $15, $02, $15, $02, $17 ; $D5E1
    .byte $02, $17, $02, $15, $02, $17, $02, $17, $03, $18, $04, $18, $03, $18, $03, $18 ; $D5F1
    .byte $04, $18, $04, $18, $04, $18, $03, $18, $04, $18, $04, $18, $04, $18, $04, $18 ; $D601
    .byte $04, $18, $04, $18, $04, $18, $03, $18, $04, $0D, $04, $15, $05, $15, $05, $19 ; $D611
    .byte $06, $19, $06, $19, $06, $19, $05, $0E, $0C, $19, $05, $19, $05, $1A, $00, $1A ; $D621
    .byte $04, $1A, $07, $16, $0C, $00, $04, $07, $0A, $0F, $47, $D6, $4D, $D6, $4F, $D6 ; $D631
    .byte $56, $D6, $68, $D6, $71, $D6, $01, $01, $01, $01, $02, $02, $05, $06, $09, $08 ; $D641
    .byte $08, $09, $09, $08, $09, $0C, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B ; $D651
    .byte $0B, $0B, $0B, $0B, $0B, $0B, $0E, $11, $11, $10, $10, $10, $10, $12, $10, $10 ; $D661
    .byte $13, $14, $15, $16, $12, $16, $27, $14, $20, $00, $B0, $00, $00, $00, $00, $00 ; $D671
    .byte $E0, $00, $A0, $00, $00, $03, $00, $03, $80, $01, $A0, $00, $99, $D6, $B1, $D6 ; $D681
    .byte $B9, $D6, $D5, $D6, $1D, $D7, $39, $D7, $10, $00, $B0, $00, $D0, $00, $00, $01 ; $D691
    .byte $D8, $00, $30, $00, $90, $00, $04, $00, $00, $01, $B0, $00, $08, $00, $30, $00 ; $D6A1
    .byte $18, $00, $00, $00, $FD, $00, $00, $00, $48, $00, $2C, $00, $B0, $03, $00, $00 ; $D6B1
    .byte $48, $00, $B8, $02, $20, $01, $90, $03, $C0, $02, $10, $03, $28, $02, $BC, $01 ; $D6C1
    .byte $28, $02, $BC, $01, $00, $03, $00, $03, $A8, $02, $F0, $01, $F8, $01, $40, $02 ; $D6D1
    .byte $E8, $01, $94, $02, $B8, $01, $00, $03, $C8, $00, $18, $02, $D8, $00, $60, $02 ; $D6E1
    .byte $00, $00, $B4, $02, $00, $00, $00, $02, $00, $00, $8B, $00, $58, $00, $00, $00 ; $D6F1
    .byte $98, $01, $C0, $00, $00, $03, $C0, $00, $E8, $02, $40, $00, $68, $01, $70, $00 ; $D701
    .byte $08, $01, $10, $00, $08, $01, $10, $00, $08, $01, $10, $00, $F8, $00, $3A, $01 ; $D711
    .byte $00, $00, $5A, $00, $C8, $01, $1A, $00, $C6, $01, $DA, $01, $00, $00, $DA, $01 ; $D721
    .byte $80, $01, $A0, $00, $80, $01, $A0, $00, $00, $05, $00, $00, $80, $78, $80, $88 ; $D731
    .byte $80, $7C, $80, $A8, $80, $78, $53, $D7, $5F, $D7, $63, $D7, $71, $D7, $95, $D7 ; $D741
    .byte $A3, $D7, $90, $78, $90, $A8, $90, $78, $B0, $78, $A8, $80, $80, $80, $80, $A0 ; $D751
    .byte $70, $50, $80, $80, $80, $30, $80, $80, $80, $78, $80, $78, $80, $78, $80, $78 ; $D761
    .byte $78, $AC, $80, $90, $80, $90, $80, $60, $90, $D0, $80, $60, $80, $90, $48, $80 ; $D771
    .byte $60, $78, $38, $78, $80, $80, $80, $90, $80, $90, $70, $78, $80, $78, $80, $80 ; $D781
    .byte $80, $80, $80, $80, $70, $90, $A0, $78, $50, $78, $50, $78, $60, $90, $80, $78 ; $D791
    .byte $80, $78, $80, $78, $80, $78, $80, $78, $80, $78, $A0, $88, $60, $30, $A0, $90 ; $D7A1
    .byte $80, $A0, $80, $A8, $60, $78, $60, $78, $A4, $6B, $D0, $0B, $A5, $4F, $05, $50 ; $D7B1
    .byte $D0, $04, $05, $A6, $D0, $01, $60, $A5, $34, $C9, $03, $D0, $01, $60, $A5, $5C ; $D7C1
    .byte $D0, $03, $4C, $C4, $DA, $A5, $4F, $85, $01, $A9, $00, $85, $00, $A5, $C0, $10 ; $D7D1
    .byte $02, $C6, $00, $A5, $C1, $18, $65, $6C, $85, $6C, $A5, $C0, $65, $4F, $85, $4F ; $D7E1
    .byte $A5, $00, $65, $50, $85, $50, $10, $08, $A9, $00, $85, $50, $85, $4F, $85, $6C ; $D7F1
    .byte $A5, $4F, $48, $38, $E5, $01, $85, $40, $68, $45, $A6, $29, $08, $D0, $07, $A5 ; $D801
    .byte $50, $05, $4F, $F0, $01, $60, $A4, $6B, $88, $B9, $C2, $DA, $18, $65, $4F, $29 ; $D811
    .byte $F8, $85, $08, $A5, $50, $69, $00, $85, $09, $A5, $51, $85, $0A, $A5, $52, $85 ; $D821
    .byte $0B, $20, $FC, $DE, $20, $35, $DA, $A9, $00, $85, $71, $A5, $22, $85, $72, $20 ; $D831
    .byte $23, $DF, $A0, $00, $84, $00, $B1, $49, $85, $01, $A4, $54, $88, $30, $09, $A5 ; $D841
    .byte $00, $18, $65, $01, $85, $00, $D0, $F4, $A5, $00, $65, $09, $A8, $C8, $C8, $B1 ; $D851
    .byte $49, $48, $4A, $4A, $4A, $4A, $85, $01, $68, $0A, $0A, $0A, $0A, $85, $00, $A5 ; $D861
    .byte $60, $85, $04, $A5, $61, $85, $05, $A0, $03, $A5, $04, $18, $65, $00, $85, $04 ; $D871
    .byte $A5, $05, $65, $01, $85, $05, $88, $D0, $F0, $A9, $06, $85, $0D, $20, $23, $DF ; $D881
    .byte $20, $CF, $D8, $A5, $0A, $18, $69, $20, $85, $0A, $A5, $0B, $69, $00, $85, $0B ; $D891
    .byte $C6, $0D, $D0, $E9, $20, $7D, $DF, $A5, $08, $29, $0F, $F0, $01, $60, $A5, $08 ; $D8A1
    .byte $2A, $2A, $2A, $2A, $29, $07, $09, $C0, $85, $00, $A9, $05, $85, $01, $A9, $23 ; $D8B1
    .byte $85, $03, $20, $02, $DA, $E6, $01, $A9, $2B, $85, $03, $4C, $02, $DA, $A5, $53 ; $D8C1
    .byte $4A, $4A, $29, $38, $85, $0E, $A5, $08, $4A, $4A, $4A, $4A, $4A, $05, $0E, $A8 ; $D8D1
    .byte $B1, $04, $48, $20, $24, $DE, $A9, $03, $20, $A5, $CE, $68, $A8, $B1, $4D, $85 ; $D8E1
    .byte $13, $20, $FA, $D8, $A9, $01, $4C, $A5, $CE, $A5, $71, $D0, $15, $A5, $22, $D0 ; $D8F1
    .byte $11, $A9, $02, $20, $92, $CA, $A5, $6F, $09, $80, $20, $94, $CA, $A5, $70, $20 ; $D901
    .byte $94, $CA, $A5, $53, $29, $10, $85, $0E, $A5, $08, $4A, $29, $0C, $05, $0E, $4A ; $D911
    .byte $4A, $A8, $B9, $B2, $DA, $48, $20, $52, $D9, $68, $A8, $20, $37, $D9, $C8, $C8 ; $D921
    .byte $C8, $C8, $A5, $17, $85, $13, $B1, $10, $E6, $71, $20, $94, $CA, $20, $46, $DE ; $D931
    .byte $C8, $C8, $C8, $C8, $B1, $10, $E6, $71, $20, $92, $CA, $20, $7D, $D9, $4C, $5F ; $D941
    .byte $DA, $A5, $08, $29, $0F, $F0, $01, $60, $98, $D0, $0F, $A5, $13, $48, $29, $03 ; $D951
    .byte $85, $13, $68, $4A, $4A, $4A, $4A, $4C, $78, $D9, $A5, $13, $48, $4A, $4A, $29 ; $D961
    .byte $03, $85, $13, $68, $2A, $2A, $2A, $29, $03, $85, $17, $60, $A5, $08, $29, $0F ; $D971
    .byte $F0, $01, $60, $84, $1A, $A5, $13, $48, $20, $92, $D9, $68, $85, $13, $A4, $1A ; $D981
    .byte $60, $A5, $70, $48, $2A, $A5, $6F, $2A, $2A, $2A, $2A, $29, $38, $85, $16, $68 ; $D991
    .byte $4A, $4A, $29, $07, $05, $16, $09, $C0, $85, $14, $A0, $05, $A5, $6F, $29, $08 ; $D9A1
    .byte $F0, $01, $C8, $84, $15, $A0, $00, $B1, $14, $85, $16, $A5, $70, $2A, $2A, $A5 ; $D9B1
    .byte $70, $29, $02, $69, $00, $20, $02, $C7, $D1, $D9, $E3, $D9, $D8, $D9, $F2, $D9 ; $D9C1
    .byte $A5, $16, $29, $FC, $4C, $FD, $D9, $A5, $16, $29, $F3, $06, $13, $06, $13, $4C ; $D9D1
    .byte $FD, $D9, $A5, $16, $29, $CF, $06, $13, $06, $13, $06, $13, $06, $13, $4C, $FD ; $D9E1
    .byte $D9, $A5, $16, $29, $3F, $18, $66, $13, $66, $13, $66, $13, $05, $13, $91, $14 ; $D9F1
    .byte $60, $A9, $08, $85, $17, $A9, $02, $20, $92, $CA, $A5, $03, $09, $80, $20, $94 ; $DA01
    .byte $CA, $A4, $17, $B9, $B9, $DA, $A8, $18, $65, $00, $20, $94, $CA, $B1, $00, $20 ; $DA11
    .byte $94, $CA, $A4, $17, $B9, $B8, $DA, $A8, $B1, $00, $20, $92, $CA, $C6, $17, $C6 ; $DA21
    .byte $17, $D0, $D2, $60, $A5, $15, $29, $01, $0A, $0A, $0A, $85, $6F, $A5, $14, $48 ; $DA31
    .byte $2A, $2A, $2A, $29, $03, $09, $20, $05, $6F, $85, $6F, $68, $0A, $0A, $29, $C0 ; $DA41
    .byte $85, $70, $A5, $08, $4A, $4A, $4A, $29, $1F, $05, $70, $85, $70, $60, $84, $1A ; $DA51
    .byte $A5, $70, $18, $69, $40, $85, $70, $A5, $6F, $69, $00, $85, $6F, $A5, $6F, $29 ; $DA61
    .byte $07, $C9, $03, $D0, $2D, $A5, $70, $C9, $C0, $90, $27, $A5, $70, $29, $3F, $85 ; $DA71
    .byte $70, $A5, $6F, $29, $FC, $49, $08, $85, $6F, $20, $7D, $DF, $A4, $0D, $88, $F0 ; $DA81
    .byte $11, $A9, $02, $20, $92, $CA, $A5, $6F, $09, $80, $20, $94, $CA, $A5, $70, $20 ; $DA91
    .byte $92, $CA, $A4, $1A, $60, $40, $02, $00, $C0, $FD, $FF, $40, $01, $00, $C0, $FE ; $DAA1
    .byte $FF, $00, $01, $02, $03, $08, $09, $0A, $0B, $38, $18, $30, $10, $28, $08, $20 ; $DAB1
    .byte $00, $04, $FC, $A9, $00, $85, $00, $88, $D0, $04, $A9, $06, $85, $00, $AD, $06 ; $DAC1
    .byte $06, $F0, $06, $E6, $00, $E6, $00, $E6, $00, $A5, $4F, $85, $01, $A4, $00, $B9 ; $DAD1
    .byte $62, $DC, $18, $65, $6C, $85, $6C, $B9, $63, $DC, $65, $4F, $85, $4F, $48, $B9 ; $DAE1
    .byte $64, $DC, $65, $50, $85, $50, $68, $38, $E5, $01, $85, $40, $A5, $4F, $45, $A6 ; $DAF1
    .byte $29, $08, $D0, $07, $A5, $4F, $05, $50, $F0, $01, $60, $A4, $6B, $88, $B9, $C2 ; $DB01
    .byte $DA, $18, $65, $4F, $29, $F8, $85, $08, $A5, $50, $69, $00, $85, $09, $A5, $51 ; $DB11
    .byte $29, $F0, $85, $0A, $A5, $52, $85, $0B, $20, $FC, $DE, $20, $35, $DA, $A9, $0F ; $DB21
    .byte $85, $0D, $20, $23, $DF, $20, $71, $DB, $A5, $0A, $18, $69, $10, $85, $0A, $A5 ; $DB31
    .byte $0B, $69, $00, $85, $0B, $C6, $0D, $D0, $E9, $A5, $08, $29, $0F, $F0, $01, $60 ; $DB41
    .byte $A5, $08, $2A, $2A, $2A, $2A, $29, $07, $09, $C0, $85, $00, $A9, $05, $85, $01 ; $DB51
    .byte $A9, $23, $85, $03, $20, $E4, $DB, $E6, $01, $A9, $2B, $85, $03, $4C, $E4, $DB ; $DB61
    .byte $A0, $00, $84, $00, $B1, $49, $85, $01, $A4, $54, $88, $30, $09, $A5, $00, $18 ; $DB71
    .byte $65, $01, $85, $00, $D0, $F4, $A5, $00, $65, $09, $A8, $C8, $C8, $B1, $49, $48 ; $DB81
    .byte $4A, $4A, $85, $01, $68, $6A, $6A, $6A, $29, $C0, $85, $00, $A5, $60, $18, $65 ; $DB91
    .byte $00, $85, $04, $A5, $61, $65, $01, $85, $05, $A5, $53, $4A, $4A, $29, $38, $85 ; $DBA1
    .byte $0E, $A5, $08, $4A, $4A, $4A, $4A, $4A, $05, $0E, $A8, $B1, $04, $48, $20, $24 ; $DBB1
    .byte $DE, $A9, $04, $20, $A5, $CE, $68, $A8, $B1, $4D, $85, $13, $20, $FC, $DE, $20 ; $DBC1
    .byte $35, $DA, $20, $17, $DC, $A5, $08, $29, $0F, $D0, $03, $20, $92, $D9, $A9, $01 ; $DBD1
    .byte $4C, $A5, $CE, $A9, $08, $85, $17, $A9, $02, $20, $AA, $CA, $A5, $03, $09, $80 ; $DBE1
    .byte $20, $AC, $CA, $A4, $17, $B9, $B9, $DA, $A8, $18, $65, $00, $20, $AC, $CA, $B1 ; $DBF1
    .byte $00, $20, $AC, $CA, $A4, $17, $B9, $B8, $DA, $A8, $B1, $00, $20, $AA, $CA, $C6 ; $DC01
    .byte $17, $C6, $17, $D0, $D2, $60, $A9, $02, $20, $92, $CA, $A5, $6F, $09, $80, $20 ; $DC11
    .byte $94, $CA, $A5, $70, $20, $94, $CA, $A5, $53, $29, $18, $4A, $85, $0E, $A5, $08 ; $DC21
    .byte $29, $18, $4A, $4A, $4A, $05, $0E, $48, $A8, $B9, $F2, $DD, $A8, $20, $58, $DC ; $DC31
    .byte $68, $A8, $B1, $10, $E6, $71, $20, $94, $CA, $20, $46, $DE, $C8, $C8, $C8, $C8 ; $DC41
    .byte $B1, $10, $E6, $71, $4C, $92, $CA, $A5, $08, $29, $0F, $F0, $01, $60, $4C, $09 ; $DC51
    .byte $DE, $00, $02, $00, $00, $03, $00, $00, $FE, $FF, $00, $FD, $FF, $A5, $3D, $F0 ; $DC61
    .byte $01, $60, $A5, $3F, $F0, $0F, $A5, $3E, $F0, $0B, $A5, $3F, $85, $6A, $A5, $51 ; $DC71
    .byte $29, $07, $F0, $4B, $60, $A4, $6A, $D0, $01, $60, $A9, $00, $88, $D0, $02, $A9 ; $DC81
    .byte $06, $A8, $AD, $06, $06, $F0, $03, $C8, $C8, $C8, $A5, $51, $85, $01, $B9, $5A ; $DC91
    .byte $E0, $18, $65, $6D, $85, $6D, $B9, $5B, $E0, $65, $51, $85, $51, $48, $B9, $5C ; $DCA1
    .byte $E0, $65, $52, $85, $52, $68, $38, $E5, $01, $85, $41, $A5, $51, $45, $B7, $29 ; $DCB1
    .byte $08, $D0, $0C, $60, $A5, $51, $05, $52, $D0, $04, $05, $B7, $D0, $01, $60, $A5 ; $DCC1
    .byte $6A, $0A, $A8, $88, $88, $A5, $5C, $D0, $10, $B9, $56, $E0, $18, $65, $51, $29 ; $DCD1
    .byte $F8, $85, $0A, $B9, $57, $E0, $4C, $F5, $DC, $B9, $52, $E0, $18, $65, $51, $85 ; $DCE1
    .byte $0A, $B9, $53, $E0, $65, $52, $85, $0B, $A5, $4F, $18, $69, $08, $29, $F0, $85 ; $DCF1
    .byte $08, $A5, $50, $69, $00, $85, $09, $20, $23, $DF, $20, $8D, $DF, $20, $19, $E0 ; $DD01
    .byte $20, $FC, $DE, $20, $53, $DF, $A9, $10, $85, $0D, $A9, $00, $85, $71, $A5, $22 ; $DD11
    .byte $85, $72, $A4, $5C, $B9, $89, $DD, $20, $A7, $CE, $20, $8B, $DD, $A5, $08, $18 ; $DD21
    .byte $69, $10, $85, $08, $A5, $09, $69, $00, $85, $09, $C6, $0D, $D0, $EC, $A9, $01 ; $DD31
    .byte $20, $A7, $CE, $A5, $0A, $29, $08, $D0, $3E, $20, $FC, $DE, $A5, $14, $4A, $4A ; $DD41
    .byte $29, $38, $09, $C0, $85, $00, $A9, $23, $85, $03, $A9, $05, $85, $01, $A5, $15 ; $DD51
    .byte $6A, $90, $06, $A9, $2B, $85, $03, $E6, $01, $A9, $08, $20, $92, $CA, $A5, $03 ; $DD61
    .byte $20, $94, $CA, $A5, $00, $20, $94, $CA, $A0, $00, $B1, $00, $9D, $00, $03, $E8 ; $DD71
    .byte $C8, $C0, $08, $D0, $F5, $86, $22, $60, $04, $03, $A5, $08, $4A, $4A, $4A, $4A ; $DD81
    .byte $4A, $08, $85, $00, $A9, $00, $A4, $09, $C4, $B1, $F0, $02, $A9, $08, $18, $65 ; $DD91
    .byte $00, $A8, $B9, $B0, $03, $85, $B3, $A4, $B2, $28, $90, $02, $C8, $C8, $84, $1A ; $DDA1
    .byte $20, $24, $DE, $A4, $B3, $B1, $4D, $85, $13, $20, $C3, $DD, $20, $1A, $DE, $4C ; $DDB1
    .byte $3E, $E0, $A9, $02, $20, $92, $CA, $A5, $6F, $20, $94, $CA, $A5, $70, $20, $94 ; $DDC1
    .byte $CA, $A4, $1A, $B1, $10, $20, $94, $CA, $E6, $71, $20, $3A, $DE, $A4, $1A, $B9 ; $DDD1
    .byte $F2, $DD, $A8, $20, $02, $DE, $A4, $1A, $C8, $B1, $10, $20, $92, $CA, $E6, $71 ; $DDE1
    .byte $60, $00, $00, $01, $01, $00, $00, $01, $01, $02, $02, $03, $03, $02, $02, $03 ; $DDF1
    .byte $03, $A5, $0A, $29, $08, $F0, $01, $60, $98, $F0, $07, $46, $13, $46, $13, $88 ; $DE01
    .byte $D0, $F9, $A5, $13, $29, $03, $85, $13, $60, $A5, $0A, $29, $08, $F0, $01, $60 ; $DE11
    .byte $4C, $92, $D9, $48, $4A, $4A, $4A, $4A, $A8, $68, $0A, $0A, $0A, $0A, $18, $65 ; $DE21
    .byte $4B, $85, $10, $98, $65, $4C, $85, $11, $60, $84, $03, $A8, $A5, $0A, $29, $08 ; $DE31
    .byte $F0, $0C, $4C, $A2, $DE, $84, $03, $A8, $A5, $08, $29, $0F, $D0, $53, $98, $20 ; $DE41
    .byte $A5, $DE, $85, $02, $A5, $70, $29, $02, $F0, $08, $06, $02, $06, $02, $06, $02 ; $DE51
    .byte $06, $02, $A5, $70, $4A, $4A, $48, $4A, $29, $18, $85, $00, $68, $29, $07, $05 ; $DE61
    .byte $00, $85, $00, $A5, $6F, $6A, $6A, $6A, $6A, $29, $60, $85, $01, $6A, $29, $80 ; $DE71
    .byte $05, $01, $05, $00, $85, $00, $A9, $07, $85, $01, $A0, $00, $B1, $00, $48, $A5 ; $DE81
    .byte $70, $29, $02, $F0, $05, $68, $29, $0F, $10, $03, $68, $29, $F0, $05, $02, $91 ; $DE91
    .byte $00, $A4, $03, $60, $85, $00, $A0, $00, $B1, $62, $C9, $FF, $F0, $08, $C5, $00 ; $DEA1
    .byte $B0, $04, $C8, $C8, $D0, $F2, $C8, $B1, $62, $60, $A9, $00, $8D, $08, $06, $A5 ; $DEB1
    .byte $4F, $05, $50, $D0, $07, $A9, $02, $8D, $08, $06, $D0, $12, $A5, $4F, $18, $69 ; $DEC1
    .byte $02, $A5, $50, $69, $01, $A0, $00, $D1, $49, $90, $03, $EE, $08, $06, $60, $A5 ; $DED1
    .byte $4F, $85, $FD, $A5, $51, $85, $0A, $A5, $52, $85, $0B, $20, $FC, $DE, $A5, $14 ; $DEE1
    .byte $85, $FC, $A5, $15, $29, $01, $0A, $8D, $DF, $03, $60, $A5, $0A, $85, $14, $A5 ; $DEF1
    .byte $0B, $85, $15, $A0, $00, $A5, $15, $D0, $06, $A5, $14, $C9, $F0, $90, $10, $A5 ; $DF01
    .byte $14, $38, $E9, $F0, $85, $14, $A5, $15, $E9, $00, $85, $15, $C8, $D0, $E6, $84 ; $DF11
    .byte $15, $60, $A5, $0A, $85, $53, $A5, $0B, $85, $54, $A0, $00, $A9, $C0, $85, $00 ; $DF21
    .byte $A5, $5C, $D0, $01, $60, $A5, $54, $D0, $06, $A5, $53, $C5, $00, $90, $10, $A5 ; $DF31
    .byte $53, $38, $E5, $00, $85, $53, $A5, $54, $E9, $00, $85, $54, $C8, $D0, $E6, $84 ; $DF41
    .byte $54, $60, $A5, $15, $29, $01, $0A, $0A, $0A, $85, $6F, $A5, $14, $48, $2A, $2A ; $DF51
    .byte $2A, $29, $03, $09, $20, $05, $6F, $85, $6F, $68, $0A, $0A, $29, $E0, $85, $70 ; $DF61
    .byte $A5, $08, $4A, $4A, $4A, $29, $1F, $05, $70, $85, $70, $60, $A4, $72, $A5, $71 ; $DF71
    .byte $99, $00, $03, $A9, $00, $85, $71, $A5, $22, $85, $72, $60, $A0, $00, $84, $00 ; $DF81
    .byte $B1, $49, $85, $01, $A4, $54, $88, $30, $09, $A5, $00, $18, $65, $01, $85, $00 ; $DF91
    .byte $D0, $F4, $A5, $00, $18, $65, $09, $A8, $C8, $C8, $B1, $49, $85, $02, $C9, $FF ; $DFA1
    .byte $D0, $02, $E6, $02, $C8, $B1, $49, $85, $03, $C9, $FF, $D0, $02, $E6, $03, $A5 ; $DFB1
    .byte $02, $20, $DB, $DF, $A5, $04, $85, $B1, $A5, $05, $85, $B2, $A5, $03, $20, $DB ; $DFC1
    .byte $DF, $A5, $04, $85, $B3, $A5, $05, $85, $B4, $60, $A4, $5C, $D0, $11, $48, $4A ; $DFD1
    .byte $4A, $85, $01, $68, $6A, $6A, $6A, $29, $C0, $85, $00, $A0, $01, $D0, $10, $48 ; $DFE1
    .byte $4A, $4A, $4A, $4A, $85, $01, $68, $0A, $0A, $0A, $0A, $85, $00, $A0, $03, $A5 ; $DFF1
    .byte $60, $85, $04, $A5, $61, $85, $05, $A5, $04, $18, $65, $00, $85, $04, $A5, $05 ; $E001
    .byte $65, $01, $85, $05, $88, $D0, $F0, $60, $A5, $53, $4A, $4A, $29, $38, $A8, $A2 ; $E011
    .byte $00, $B1, $B1, $9D, $B0, $03, $B1, $B3, $9D, $B8, $03, $C8, $E8, $E0, $08, $D0 ; $E021
    .byte $F0, $A5, $09, $85, $B1, $A5, $53, $29, $18, $4A, $85, $B2, $60, $A5, $70, $18 ; $E031
    .byte $69, $02, $85, $70, $29, $1F, $F0, $01, $60, $A5, $70, $38, $E9, $20, $85, $70 ; $E041
    .byte $60, $F8, $FF, $C0, $00, $FC, $FF, $E4, $00, $00, $02, $00, $00, $03, $00, $00 ; $E051
    .byte $FE, $FF, $00, $FD, $FF, $A4, $67, $B9, $73, $00, $C9, $02, $F0, $16, $20, $BB ; $E061
    .byte $EE, $90, $01, $60, $20, $AA, $E0, $A6, $67, $D6, $A8, $D0, $06, $A9, $00, $95 ; $E071
    .byte $73, $85, $5B, $60, $20, $BB, $EE, $90, $01, $60, $20, $AA, $E0, $20, $BB, $EE ; $E081
    .byte $B0, $E5, $20, $AA, $E0, $A9, $FF, $9D, $B0, $04, $20, $BB, $EE, $B0, $D8, $20 ; $E091
    .byte $AA, $E0, $A9, $01, $9D, $B0, $04, $D0, $CE, $20, $48, $EF, $AD, $50, $04, $29 ; $E0A1
    .byte $01, $09, $C2, $9D, $50, $04, $A4, $67, $B9, $73, $00, $A8, $B9, $FF, $E0, $9D ; $E0B1
    .byte $70, $05, $B9, $03, $E1, $9D, $40, $04, $A9, $0A, $9D, $30, $06, $A9, $03, $9D ; $E0C1
    .byte $20, $04, $AD, $80, $04, $9D, $80, $04, $AD, $60, $04, $9D, $60, $04, $AD, $70 ; $E0D1
    .byte $05, $C9, $84, $D0, $09, $BD, $60, $04, $18, $69, $0C, $9D, $60, $04, $A9, $05 ; $E0E1
    .byte $9D, $E0, $04, $AD, $50, $04, $6A, $90, $03, $A9, $FB, $9D, $E0, $04, $60, $D7 ; $E0F1
    .byte $D7, $D6, $D5, $1A, $1A, $27, $28, $20, $27, $E1, $AD, $70, $05, $18, $69, $0C ; $E101
    .byte $8D, $71, $05, $60, $20, $27, $E1, $A5, $67, $0A, $0A, $6D, $20, $05, $A8, $B9 ; $E111
    .byte $35, $E1, $8D, $71, $05, $60, $A2, $01, $A9, $C2, $8D, $51, $04, $AD, $20, $04 ; $E121
    .byte $8D, $21, $04, $60, $B1, $B0, $B2, $B2, $B4, $B3, $B5, $B5, $B7, $B6, $B8, $B8 ; $E131
    .byte $BA, $B9, $BB, $BB, $A5, $5C, $D0, $03, $4C, $E5, $E1, $20, $52, $E1, $4C, $25 ; $E141
    .byte $E3, $A2, $01, $AD, $71, $05, $D0, $01, $60, $C9, $D8, $D0, $03, $4C, $85, $E3 ; $E151
    .byte $AD, $50, $04, $10, $0E, $AD, $11, $04, $C9, $FF, $F0, $07, $AD, $40, $05, $29 ; $E161
    .byte $40, $F0, $05, $A2, $01, $4C, $48, $EF, $20, $18, $E2, $AD, $01, $04, $D0, $01 ; $E171
    .byte $60, $AD, $71, $05, $38, $E9, $9C, $0A, $A8, $B9, $3F, $E2, $85, $00, $B9, $40 ; $E181
    .byte $E2, $85, $01, $AD, $11, $04, $0A, $A8, $88, $88, $B1, $00, $85, $02, $AD, $51 ; $E191
    .byte $04, $6A, $B0, $09, $AD, $81, $04, $18, $65, $02, $4C, $B4, $E1, $AD, $81, $04 ; $E1A1
    .byte $38, $E5, $02, $8D, $81, $04, $C8, $B1, $00, $18, $6D, $61, $04, $8D, $61, $04 ; $E1B1
    .byte $AD, $80, $04, $C9, $1D, $B0, $09, $AD, $50, $04, $29, $01, $F0, $15, $D0, $0B ; $E1C1
    .byte $C9, $E4, $90, $0F, $AD, $50, $04, $29, $01, $D0, $08, $AD, $51, $04, $29, $FD ; $E1D1
    .byte $8D, $51, $04, $60, $20, $18, $E2, $AD, $01, $04, $F0, $F7, $AC, $11, $04, $C8 ; $E1E1
    .byte $D0, $07, $8C, $01, $04, $8C, $71, $05, $60, $AD, $71, $05, $38, $E9, $B0, $0A ; $E1F1
    .byte $A8, $B9, $DD, $E2, $85, $00, $B9, $DE, $E2, $85, $01, $AD, $11, $04, $0A, $A8 ; $E201
    .byte $B1, $00, $85, $02, $4C, $9F, $E1, $AD, $60, $04, $8D, $61, $04, $AD, $70, $04 ; $E211
    .byte $8D, $71, $04, $AD, $80, $04, $8D, $81, $04, $AD, $90, $04, $8D, $91, $04, $AD ; $E221
    .byte $50, $04, $6A, $AD, $51, $04, $29, $FE, $69, $00, $8D, $51, $04, $60, $57, $E2 ; $E231
    .byte $5F, $E2, $65, $E2, $6D, $E2, $77, $E2, $7B, $E2, $85, $E2, $91, $E2, $9D, $E2 ; $E241
    .byte $A9, $E2, $BD, $E2, $CD, $E2, $0B, $FB, $16, $FE, $0F, $EC, $03, $E0, $FA, $E9 ; $E251
    .byte $1B, $F8, $17, $11, $0F, $00, $15, $0F, $0D, $20, $07, $28, $FD, $01, $06, $01 ; $E261
    .byte $11, $F1, $04, $D8, $04, $D8, $FD, $01, $23, $FE, $05, $FA, $08, $FC, $10, $0C ; $E271
    .byte $06, $30, $06, $30, $0B, $01, $0E, $0D, $16, $08, $1A, $04, $07, $ED, $F9, $F8 ; $E281
    .byte $04, $01, $12, $F9, $1B, $FF, $19, $0E, $14, $10, $02, $08, $04, $09, $12, $00 ; $E291
    .byte $1B, $06, $19, $15, $14, $17, $02, $0F, $08, $FA, $0E, $F9, $10, $F4, $04, $E8 ; $E2A1
    .byte $FE, $E9, $FD, $ED, $0C, $FA, $0C, $ED, $0C, $E8, $04, $E8, $08, $FA, $FE, $E9 ; $E2B1
    .byte $17, $F9, $17, $09, $10, $0B, $0F, $F6, $11, $F4, $15, $01, $08, $01, $FE, $F1 ; $E2C1
    .byte $17, $00, $17, $10, $10, $12, $0F, $FD, $11, $FB, $15, $08, $F5, $E2, $F9, $E2 ; $E2D1
    .byte $FD, $E2, $01, $E3, $05, $E3, $09, $E3, $0D, $E3, $11, $E3, $15, $E3, $19, $E3 ; $E2E1
    .byte $1D, $E3, $21, $E3, $04, $EF, $04, $EF, $FE, $12, $FE, $12, $0D, $01, $0D, $01 ; $E2F1
    .byte $04, $EF, $04, $EF, $FE, $12, $FE, $12, $0D, $01, $0D, $01, $06, $EF, $03, $EF ; $E301
    .byte $00, $12, $FD, $12, $0D, $01, $0D, $FE, $04, $EF, $04, $EF, $FE, $12, $FE, $12 ; $E311
    .byte $11, $01, $11, $01, $A2, $0D, $AD, $45, $04, $C9, $73, $F0, $01, $60, $AD, $05 ; $E321
    .byte $04, $38, $E9, $82, $C9, $08, $90, $03, $4C, $48, $EF, $0A, $A8, $B9, $75, $E3 ; $E331
    .byte $85, $00, $B9, $76, $E3, $85, $01, $AD, $55, $04, $6A, $90, $09, $A5, $00, $49 ; $E341
    .byte $FF, $18, $69, $01, $85, $00, $AD, $85, $04, $18, $65, $00, $9D, $80, $04, $AD ; $E351
    .byte $65, $04, $18, $65, $01, $9D, $60, $04, $A9, $94, $9D, $00, $04, $AD, $55, $04 ; $E361
    .byte $9D, $50, $04, $60, $0B, $F3, $0B, $F3, $0C, $ED, $0C, $ED, $05, $ED, $05, $ED ; $E371
    .byte $05, $ED, $05, $ED, $A2, $01, $20, $0A, $EF, $A5, $40, $49, $FF, $38, $6D, $81 ; $E381
    .byte $04, $8D, $81, $04, $A5, $7E, $4A, $4A, $4A, $29, $1E, $A8, $B9, $C4, $E3, $18 ; $E391
    .byte $6D, $81, $04, $8D, $81, $04, $B9, $C5, $E3, $18, $6D, $61, $04, $C9, $F0, $B0 ; $E3A1
    .byte $0F, $8D, $61, $04, $85, $01, $AD, $81, $04, $85, $00, $20, $C7, $C7, $F0, $B3 ; $E3B1
    .byte $4C, $48, $EF, $00, $00, $00, $FF, $00, $01, $FF, $00, $01, $00, $FE, $C9, $FD ; $E3C1
    .byte $BC, $28, $CA, $36, $CA, $48, $B9, $36, $CA, $36, $CA, $36, $B0, $99, $B1, $19 ; $E3D1
    .byte $B3, $A9, $B7, $41, $B9, $43, $CA, $46, $B9, $D4, $BC, $8D, $BB, $E1, $B4, $42 ; $E3E1
    .byte $B5, $EE, $BD, $AC, $84, $AD, $E4, $03, $D0, $01, $60, $A5, $51, $05, $52, $D0 ; $E3F1
    .byte $F9, $A5, $48, $C9, $02, $F0, $05, $C9, $03, $F0, $37, $60, $A5, $5D, $C9, $04 ; $E401
    .byte $D0, $E8, $AD, $E4, $03, $29, $01, $F0, $E1, $A9, $01, $85, $07, $AD, $B8, $E4 ; $E411
    .byte $85, $00, $AD, $B9, $E4, $85, $01, $AD, $C0, $E4, $85, $02, $AD, $C1, $E4, $85 ; $E421
    .byte $03, $20, $97, $E4, $90, $0B, $A9, $00, $85, $12, $20, $C8, $E4, $A9, $00, $85 ; $E431
    .byte $5E, $60, $A5, $5D, $F0, $01, $60, $AD, $E4, $03, $29, $0E, $D0, $01, $60, $A9 ; $E441
    .byte $03, $85, $17, $A5, $17, $A8, $A9, $00, $85, $07, $B9, $52, $E6, $2D, $E4, $03 ; $E451
    .byte $F0, $04, $A9, $01, $85, $07, $A5, $17, $0A, $A8, $B9, $B8, $E4, $85, $00, $B9 ; $E461
    .byte $B9, $E4, $85, $01, $B9, $C0, $E4, $85, $02, $B9, $C1, $E4, $85, $03, $20, $97 ; $E471
    .byte $E4, $90, $0E, $A4, $17, $B9, $56, $E6, $85, $12, $20, $C8, $E4, $A9, $00, $85 ; $E481
    .byte $5E, $C6, $17, $D0, $BE, $60, $A5, $4F, $38, $E5, $03, $A5, $50, $E5, $02, $B0 ; $E491
    .byte $14, $A5, $50, $18, $69, $01, $85, $08, $A5, $4F, $38, $E5, $01, $A5, $08, $E5 ; $E4A1
    .byte $00, $90, $02, $38, $60, $18, $60, $03, $70, $01, $B0, $02, $B0, $03, $B0, $03 ; $E4B1
    .byte $F8, $02, $38, $03, $38, $04, $78, $A9, $00, $85, $0E, $A5, $01, $85, $09, $38 ; $E4C1
    .byte $E5, $4F, $85, $0D, $A5, $00, $85, $08, $E5, $50, $B0, $0C, $A5, $0D, $85, $0E ; $E4D1
    .byte $A5, $4F, $85, $09, $A5, $50, $85, $08, $A4, $12, $B9, $5A, $E6, $85, $10, $B9 ; $E4E1
    .byte $5B, $E6, $85, $11, $A5, $4F, $18, $69, $F0, $85, $0C, $A5, $50, $69, $00, $85 ; $E4F1
    .byte $0D, $A5, $03, $85, $0B, $38, $E5, $0C, $A5, $02, $85, $0A, $E5, $0D, $90, $08 ; $E501
    .byte $A5, $0C, $85, $0B, $A5, $0D, $85, $0A, $A5, $07, $D0, $03, $4C, $A3, $E5, $A5 ; $E511
    .byte $09, $29, $F8, $85, $09, $A5, $0B, $29, $F8, $85, $0B, $38, $E5, $09, $85, $0C ; $E521
    .byte $A5, $0A, $E5, $08, $B0, $01, $60, $A5, $22, $85, $16, $A5, $0C, $18, $69, $08 ; $E531
    .byte $85, $0C, $4A, $4A, $4A, $85, $0C, $85, $0D, $20, $92, $CA, $A9, $22, $20, $94 ; $E541
    .byte $CA, $A5, $09, $4A, $4A, $4A, $18, $69, $40, $85, $15, $20, $94, $CA, $A5, $0E ; $E551
    .byte $49, $FF, $18, $69, $01, $4A, $4A, $4A, $A8, $B1, $10, $20, $94, $CA, $E6, $15 ; $E561
    .byte $A5, $15, $C9, $60, $90, $27, $C6, $0D, $A5, $0C, $38, $E5, $0D, $A6, $16, $9D ; $E571
    .byte $00, $03, $A5, $0D, $20, $92, $CA, $A9, $22, $20, $94, $CA, $A9, $40, $20, $94 ; $E581
    .byte $CA, $A9, $40, $85, $15, $C8, $A5, $0D, $D0, $CF, $4C, $A3, $E5, $C8, $C6, $0D ; $E591
    .byte $D0, $C7, $A5, $09, $18, $69, $10, $85, $09, $4A, $4A, $4A, $4A, $4A, $AA, $A5 ; $E5A1
    .byte $0C, $4A, $85, $0D, $D0, $01, $60, $A5, $0D, $38, $E9, $01, $85, $0D, $85, $0F ; $E5B1
    .byte $F0, $F4, $A5, $09, $29, $10, $D0, $1A, $A5, $07, $D0, $08, $BD, $48, $07, $29 ; $E5C1
    .byte $0F, $4C, $DC, $E5, $BD, $48, $07, $29, $0F, $09, $80, $9D, $48, $07, $C6, $0D ; $E5D1
    .byte $F0, $1F, $A5, $07, $D0, $08, $BD, $48, $07, $29, $F0, $4C, $F6, $E5, $BD, $48 ; $E5E1
    .byte $07, $29, $F0, $09, $08, $9D, $48, $07, $E8, $8A, $29, $07, $AA, $C6, $0D, $D0 ; $E5F1
    .byte $C7, $A5, $48, $C9, $02, $D0, $08, $A9, $60, $85, $05, $A9, $03, $85, $06, $A5 ; $E601
    .byte $12, $C9, $02, $D0, $3B, $A9, $A8, $85, $05, $A9, $03, $85, $06, $A5, $4F, $38 ; $E611
    .byte $E5, $05, $A5, $50, $E5, $06, $90, $28, $A9, $0F, $38, $E5, $0F, $90, $21, $F0 ; $E621
    .byte $1F, $85, $0F, $BD, $48, $07, $29, $0F, $9D, $48, $07, $C6, $0F, $F0, $11, $BD ; $E631
    .byte $48, $07, $29, $F0, $9D, $48, $07, $E8, $8A, $29, $07, $AA, $C6, $0F, $D0, $E3 ; $E641
    .byte $60, $01, $02, $04, $08, $00, $00, $00, $02, $5E, $E6, $70, $E6, $FE, $FE, $FE ; $E651
    .byte $FD, $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC, $FD, $FD, $FD, $FE, $FE, $FE, $FE ; $E661
    .byte $FE, $FE, $FD, $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC ; $E671
    .byte $FC, $FC, $FC, $FD, $FD, $FD, $FE, $FE, $FE, $A2, $00, $20, $89, $EF, $20, $8D ; $E681
    .byte $F1, $20, $38, $E8, $AD, $80, $04, $85, $04, $AD, $60, $04, $85, $05, $20, $89 ; $E691
    .byte $F0, $20, $38, $E8, $A5, $5D, $0A, $A8, $B1, $00, $85, $42, $C8, $B1, $00, $85 ; $E6A1
    .byte $43, $A5, $AC, $8D, $FD, $03, $A5, $AD, $8D, $FE, $03, $A0, $20, $A5, $48, $C9 ; $E6B1
    .byte $05, $D0, $02, $A0, $28, $84, $08, $A0, $00, $B1, $42, $C9, $FF, $D0, $01, $60 ; $E6C1
    .byte $C5, $7F, $D0, $26, $C8, $B1, $42, $38, $E5, $AC, $10, $07, $85, $00, $A9, $00 ; $E6D1
    .byte $38, $E5, $00, $C5, $08, $B0, $13, $C8, $B1, $42, $38, $E5, $AD, $10, $07, $85 ; $E6E1
    .byte $00, $A9, $00, $38, $E5, $00, $C5, $08, $90, $10, $A5, $42, $18, $69, $0B, $85 ; $E6F1
    .byte $42, $A5, $43, $69, $00, $85, $43, $4C, $C8, $E6, $A9, $01, $8D, $EA, $03, $C8 ; $E701
    .byte $B1, $42, $F0, $0B, $A5, $5C, $F0, $05, $A9, $01, $8D, $E2, $03, $B1, $42, $85 ; $E711
    .byte $5C, $C8, $B1, $42, $85, $00, $C9, $05, $90, $26, $C9, $09, $B0, $22, $A5, $48 ; $E721
    .byte $C9, $04, $D0, $1C, $A5, $55, $C9, $02, $90, $08, $C9, $05, $90, $08, $A9, $02 ; $E731
    .byte $D0, $02, $A9, $04, $85, $55, $A5, $5D, $C5, $55, $D0, $04, $A9, $06, $85, $00 ; $E741
    .byte $A5, $00, $85, $5D, $C8, $B1, $42, $8D, $80, $04, $C8, $B1, $42, $8D, $60, $04 ; $E751
    .byte $C8, $B1, $42, $85, $50, $C8, $B1, $42, $85, $4F, $C8, $B1, $42, $85, $52, $C8 ; $E761
    .byte $B1, $42, $85, $51, $A5, $5C, $D0, $2C, $A5, $5D, $C9, $02, $D0, $3C, $20, $BB ; $E771
    .byte $E7, $A2, $05, $AD, $93, $05, $9D, $70, $05, $AD, $94, $05, $38, $E5, $4F, $9D ; $E781
    .byte $80, $04, $AD, $95, $05, $38, $E5, $51, $9D, $60, $04, $20, $A2, $CF, $A9, $C8 ; $E791
    .byte $9D, $50, $04, $60, $A0, $16, $20, $92, $C7, $C9, $09, $F0, $04, $C9, $0A, $D0 ; $E7A1
    .byte $09, $A0, $11, $A9, $06, $20, $F2, $D0, $B0, $05, $A9, $00, $8D, $10, $05, $A9 ; $E7B1
    .byte $07, $8D, $EE, $03, $AD, $E2, $03, $D0, $03, $20, $C0, $CE, $20, $C6, $D0, $20 ; $E7C1
    .byte $B0, $D0, $20, $BC, $EF, $A2, $01, $20, $3F, $EF, $A2, $00, $20, $89, $EF, $A9 ; $E7D1
    .byte $00, $8D, $90, $04, $8D, $70, $04, $8D, $30, $04, $8D, $00, $04, $8D, $70, $05 ; $E7E1
    .byte $8D, $20, $05, $8D, $01, $04, $85, $6E, $85, $58, $85, $AE, $85, $B0, $85, $7E ; $E7F1
    .byte $85, $88, $85, $8C, $85, $9D, $85, $9E, $85, $C5, $85, $C6, $85, $C7, $8D, $F7 ; $E801
    .byte $03, $8D, $F8, $03, $8D, $F9, $03, $8D, $FA, $03, $8D, $E4, $03, $8D, $E7, $03 ; $E811
    .byte $8D, $EB, $03, $85, $A6, $85, $B7, $A9, $01, $85, $82, $8D, $40, $05, $A9, $10 ; $E821
    .byte $85, $3D, $A9, $03, $85, $34, $60, $A5, $5C, $D0, $04, $A9, $06, $D0, $02, $A5 ; $E831
    .byte $48, $0A, $A8, $B9, $4F, $E8, $85, $00, $B9, $50, $E8, $85, $01, $60, $00, $EB ; $E841
    .byte $75, $EB, $8E, $EB, $27, $EC, $CF, $ED, $63, $EE, $5D, $E8, $67, $E8, $CB, $E8 ; $E851
    .byte $ED, $E8, $72, $E9, $C8, $EA, $00, $48, $78, $01, $03, $28, $18, $00, $00, $00 ; $E861
    .byte $00, $00, $88, $A2, $01, $05, $30, $9C, $00, $00, $00, $C0, $01, $18, $78, $01 ; $E871
    .byte $03, $C8, $18, $02, $00, $00, $00, $01, $48, $A8, $01, $02, $28, $18, $00, $00 ; $E881
    .byte $00, $00, $02, $87, $28, $01, $00, $28, $18, $00, $00, $00, $00, $02, $C8, $B8 ; $E891
    .byte $01, $00, $C8, $18, $03, $00, $00, $00, $03, $48, $54, $01, $01, $AA, $34, $02 ; $E8A1
    .byte $00, $00, $00, $03, $48, $A8, $01, $01, $28, $18, $00, $00, $00, $00, $03, $A8 ; $E8B1
    .byte $20, $01, $04, $2C, $8C, $00, $00, $00, $00, $FF, $00, $48, $54, $01, $00, $28 ; $E8C1
    .byte $5A, $00, $00, $00, $00, $00, $98, $78, $01, $00, $28, $9C, $00, $00, $01, $80 ; $E8D1
    .byte $01, $78, $3C, $01, $01, $60, $60, $00, $00, $01, $80, $FF, $00, $C8, $A0, $01 ; $E8E1
    .byte $00, $38, $8C, $00, $00, $00, $C0, $04, $C8, $80, $01, $01, $38, $8C, $00, $00 ; $E8F1
    .byte $00, $00, $04, $28, $48, $01, $01, $C8, $24, $02, $00, $01, $80, $0C, $A8, $30 ; $E901
    .byte $01, $05, $38, $8C, $01, $00, $00, $00, $0C, $68, $C8, $01, $05, $C8, $18, $05 ; $E911
    .byte $00, $00, $C0, $0C, $88, $A0, $01, $06, $38, $8C, $00, $00, $01, $80, $0D, $68 ; $E921
    .byte $D0, $01, $04, $38, $8C, $01, $00, $01, $80, $0E, $08, $D0, $01, $04, $78, $4C ; $E931
    .byte $05, $FE, $01, $80, $0F, $C8, $30, $01, $02, $38, $8C, $00, $00, $01, $80, $10 ; $E941
    .byte $28, $60, $01, $02, $B8, $8C, $03, $00, $01, $80, $11, $48, $70, $01, $03, $38 ; $E951
    .byte $8C, $00, $00, $01, $80, $11, $A8, $70, $01, $03, $B8, $8C, $03, $00, $01, $80 ; $E961
    .byte $FF, $00, $28, $C8, $01, $09, $C8, $18, $00, $00, $00, $00, $00, $D8, $58, $01 ; $E971
    .byte $0A, $48, $18, $00, $00, $00, $00, $01, $28, $C8, $01, $0E, $C8, $18, $03, $00 ; $E981
    .byte $00, $00, $01, $88, $88, $01, $0F, $48, $18, $00, $00, $00, $00, $01, $98, $48 ; $E991
    .byte $01, $10, $28, $18, $00, $00, $00, $00, $01, $D8, $58, $01, $0B, $C8, $18, $01 ; $E9A1
    .byte $00, $00, $00, $01, $E8, $D8, $01, $0E, $28, $18, $00, $00, $00, $00, $02, $88 ; $E9B1
    .byte $D8, $01, $0D, $A8, $18, $01, $00, $00, $00, $03, $68, $A8, $01, $0D, $28, $18 ; $E9C1
    .byte $00, $00, $00, $00, $03, $C8, $D8, $01, $0C, $C8, $18, $00, $00, $00, $00, $04 ; $E9D1
    .byte $38, $28, $01, $09, $28, $18, $00, $00, $00, $00, $06, $18, $28, $01, $0B, $28 ; $E9E1
    .byte $18, $00, $00, $00, $00, $07, $D8, $28, $01, $0C, $28, $18, $00, $00, $00, $00 ; $E9F1
    .byte $08, $48, $18, $01, $08, $C8, $18, $00, $00, $00, $00, $08, $48, $68, $01, $08 ; $EA01
    .byte $28, $18, $00, $00, $00, $00, $08, $58, $D8, $01, $07, $C8, $18, $00, $00, $00 ; $EA11
    .byte $00, $08, $A8, $B8, $01, $06, $C8, $18, $04, $00, $00, $00, $09, $48, $98, $01 ; $EA21
    .byte $05, $48, $18, $00, $00, $00, $00, $09, $58, $C8, $01, $06, $28, $18, $00, $00 ; $EA31
    .byte $00, $00, $0A, $68, $68, $01, $02, $A8, $18, $00, $00, $00, $00, $0A, $78, $A8 ; $EA41
    .byte $01, $02, $48, $18, $00, $00, $00, $00, $0A, $E8, $D8, $01, $01, $C8, $18, $04 ; $EA51
    .byte $00, $00, $00, $0B, $28, $58, $01, $01, $28, $18, $00, $00, $00, $00, $0B, $98 ; $EA61
    .byte $D8, $01, $00, $38, $8C, $05, $00, $01, $80, $0C, $48, $18, $01, $07, $28, $18 ; $EA71
    .byte $00, $00, $00, $00, $0C, $98, $98, $01, $05, $C8, $18, $03, $00, $00, $00, $0D ; $EA81
    .byte $E8, $C8, $01, $04, $68, $18, $00, $00, $00, $00, $0E, $68, $16, $01, $03, $C8 ; $EA91
    .byte $18, $00, $00, $00, $00, $0E, $68, $48, $01, $03, $28, $18, $00, $00, $00, $00 ; $EAA1
    .byte $0E, $38, $C8, $01, $04, $28, $18, $00, $00, $00, $00, $0F, $78, $98, $01, $00 ; $EAB1
    .byte $38, $8C, $00, $00, $01, $80, $FF, $00, $78, $D2, $01, $01, $2C, $8C, $00, $00 ; $EAC1
    .byte $00, $C0, $02, $48, $88, $01, $02, $48, $0C, $00, $00, $00, $00, $04, $78, $B2 ; $EAD1
    .byte $01, $00, $2E, $8C, $00, $00, $01, $80, $06, $68, $48, $01, $04, $6A, $0C, $00 ; $EAE1
    .byte $00, $00, $00, $08, $48, $48, $01, $03, $48, $0C, $00, $00, $00, $00, $FF, $0C ; $EAF1
    .byte $EB, $23, $EB, $3A, $EB, $46, $EB, $5D, $EB, $69, $EB, $00, $28, $18, $00, $00 ; $EB01
    .byte $80, $78, $00, $10, $00, $B0, $03, $C8, $1A, $00, $00, $80, $B8, $00, $50, $01 ; $EB11
    .byte $00, $FF, $00, $28, $10, $00, $00, $80, $A8, $00, $D0, $01, $00, $02, $AA, $3E ; $EB21
    .byte $00, $00, $80, $78, $00, $D8, $00, $C8, $FF, $00, $28, $14, $00, $00, $80, $78 ; $EB31
    .byte $00, $D8, $00, $30, $FF, $00, $28, $18, $00, $00, $34, $74, $00, $00, $00, $00 ; $EB41
    .byte $02, $C8, $18, $00, $00, $80, $78, $00, $A0, $00, $04, $FF, $00, $28, $88, $00 ; $EB51
    .byte $00, $A8, $78, $01, $00, $00, $B0, $FF, $02, $28, $98, $00, $00, $80, $78, $00 ; $EB61
    .byte $08, $00, $30, $FF, $77, $EB, $00, $28, $58, $00, $01, $58, $58, $00, $00, $00 ; $EB71
    .byte $00, $06, $28, $A8, $00, $01, $80, $90, $00, $18, $00, $00, $FF, $9C, $EB, $A8 ; $EB81
    .byte $EB, $BF, $EB, $D6, $EB, $ED, $EB, $04, $EC, $1B, $EC, $03, $38, $88, $00, $02 ; $EB91
    .byte $80, $78, $00, $48, $00, $2C, $FF, $00, $38, $88, $00, $02, $C8, $78, $04, $00 ; $EBA1
    .byte $00, $0C, $08, $C8, $18, $00, $02, $80, $4C, $03, $B0, $00, $00, $FF, $08, $38 ; $EBB1
    .byte $88, $00, $02, $80, $78, $00, $48, $02, $B8, $0B, $B8, $88, $00, $02, $80, $78 ; $EBC1
    .byte $00, $A8, $02, $E8, $FF, $08, $38, $88, $00, $02, $80, $78, $01, $C8, $02, $F8 ; $EBD1
    .byte $0B, $B8, $88, $00, $02, $80, $78, $02, $27, $02, $F8, $FF, $0F, $38, $88, $00 ; $EBE1
    .byte $02, $80, $78, $02, $E8, $02, $5C, $14, $78, $48, $00, $02, $80, $78, $03, $88 ; $EBF1
    .byte $02, $5C, $FF, $01, $38, $88, $00, $02, $80, $78, $02, $28, $01, $BC, $0B, $C8 ; $EC01
    .byte $18, $00, $02, $80, $78, $01, $E0, $02, $58, $FF, $04, $38, $88, $00, $02, $80 ; $EC11
    .byte $78, $02, $08, $02, $2C, $FF, $49, $EC, $60, $EC, $77, $EC, $8E, $EC, $A5, $EC ; $EC21
    .byte $BC, $EC, $D3, $EC, $EA, $EC, $01, $ED, $18, $ED, $2F, $ED, $3B, $ED, $52, $ED ; $EC31
    .byte $69, $ED, $80, $ED, $97, $ED, $B9, $ED, $0C, $38, $88, $00, $03, $78, $AC, $03 ; $EC41
    .byte $00, $03, $00, $11, $38, $88, $00, $03, $98, $78, $03, $00, $02, $74, $FF, $00 ; $EC51
    .byte $28, $18, $00, $03, $80, $78, $02, $A8, $01, $F0, $04, $C8, $18, $00, $03, $80 ; $EC61
    .byte $78, $02, $68, $02, $70, $FF, $00, $48, $18, $00, $03, $80, $78, $01, $F8, $02 ; $EC71
    .byte $40, $00, $A8, $18, $00, $03, $80, $78, $01, $E8, $02, $00, $FF, $00, $C8, $18 ; $EC81
    .byte $00, $03, $80, $78, $01, $E8, $02, $94, $00, $28, $18, $00, $03, $80, $78, $01 ; $EC91
    .byte $E8, $02, $E0, $FF, $00, $28, $18, $00, $03, $80, $D8, $01, $B8, $03, $00, $00 ; $ECA1
    .byte $68, $18, $00, $03, $80, $D8, $01, $68, $03, $00, $FF, $00, $48, $18, $00, $03 ; $ECB1
    .byte $80, $78, $00, $C8, $02, $18, $03, $C8, $18, $00, $03, $80, $A8, $00, $18, $03 ; $ECC1
    .byte $00, $FF, $00, $28, $18, $00, $03, $80, $78, $00, $D8, $02, $60, $04, $C8, $18 ; $ECD1
    .byte $00, $03, $80, $78, $00, $28, $02, $50, $FF, $00, $28, $18, $00, $03, $48, $78 ; $ECE1
    .byte $00, $00, $02, $B4, $00, $C8, $18, $00, $03, $60, $78, $00, $00, $02, $52, $FF ; $ECF1
    .byte $00, $28, $18, $00, $03, $48, $78, $00, $00, $02, $00, $00, $C8, $10, $00, $03 ; $ED01
    .byte $48, $78, $00, $00, $01, $94, $FF, $00, $28, $18, $00, $03, $38, $78, $00, $00 ; $ED11
    .byte $00, $C4, $00, $C8, $18, $00, $03, $28, $78, $00, $00, $00, $60, $FF, $00, $48 ; $ED21
    .byte $18, $00, $03, $80, $68, $00, $58, $00, $00, $FF, $00, $28, $18, $00, $03, $80 ; $ED31
    .byte $78, $01, $98, $00, $C0, $01, $C8, $18, $00, $03, $80, $68, $01, $58, $00, $00 ; $ED41
    .byte $FF, $00, $28, $18, $00, $03, $D8, $78, $03, $00, $00, $C0, $00, $C8, $18, $00 ; $ED51
    .byte $03, $C8, $78, $03, $00, $00, $70, $FF, $00, $28, $18, $00, $03, $80, $78, $02 ; $ED61
    .byte $E8, $00, $40, $01, $A8, $18, $00, $03, $80, $78, $02, $08, $00, $70, $FF, $00 ; $ED71
    .byte $28, $18, $00, $03, $80, $78, $01, $68, $00, $70, $03, $C8, $18, $00, $03, $80 ; $ED81
    .byte $78, $00, $A8, $00, $60, $FF, $00, $48, $18, $00, $03, $80, $78, $01, $08, $00 ; $ED91
    .byte $10, $01, $C8, $18, $01, $0F, $C8, $A8, $01, $00, $00, $00, $01, $C8, $A8, $01 ; $EDA1
    .byte $0F, $C8, $18, $01, $00, $00, $00, $FF, $00, $28, $18, $00, $03, $80, $6C, $01 ; $EDB1
    .byte $18, $00, $00, $0E, $88, $90, $01, $11, $1C, $18, $00, $00, $00, $00, $E1, $ED ; $EDC1
    .byte $ED, $ED, $F9, $ED, $10, $EE, $27, $EE, $3E, $EE, $62, $EE, $4A, $EE, $56, $EE ; $EDD1
    .byte $04, $2E, $8C, $00, $04, $80, $78, $00, $F8, $01, $3A, $FF, $03, $2C, $8C, $00 ; $EDE1
    .byte $04, $78, $78, $00, $00, $00, $5A, $FF, $00, $48, $18, $00, $04, $80, $78, $01 ; $EDF1
    .byte $C8, $00, $1A, $0D, $70, $90, $01, $05, $90, $8C, $00, $00, $00, $00, $FF, $00 ; $EE01
    .byte $48, $18, $00, $04, $80, $78, $01, $C6, $01, $DA, $0E, $70, $90, $01, $07, $90 ; $EE11
    .byte $8C, $00, $00, $00, $00, $FF, $00, $68, $18, $00, $04, $68, $78, $00, $00, $01 ; $EE21
    .byte $DA, $13, $70, $90, $01, $08, $90, $8C, $00, $00, $00, $00, $FF, $00, $90, $8C ; $EE31
    .byte $01, $02, $70, $8C, $01, $00, $02, $40, $FF, $00, $90, $8C, $01, $03, $70, $8C ; $EE41
    .byte $04, $00, $01, $80, $FF, $00, $90, $8C, $01, $04, $70, $8C, $04, $00, $02, $40 ; $EE51
    .byte $FF, $FF, $6B, $EE, $82, $EE, $A4, $EE, $BA, $EE, $08, $60, $6C, $01, $01, $A2 ; $EE61
    .byte $6C, $03, $00, $00, $00, $1C, $60, $6C, $01, $01, $A2, $6C, $02, $00, $02, $40 ; $EE71
    .byte $FF, $03, $A2, $6C, $01, $00, $60, $6C, $01, $00, $00, $C0, $0E, $A2, $6C, $01 ; $EE81
    .byte $00, $60, $6C, $00, $00, $03, $00, $14, $5E, $8C, $01, $02, $60, $8C, $00, $00 ; $EE91
    .byte $00, $C0, $FF, $09, $60, $8C, $01, $01, $5E, $8C, $00, $00, $03, $C0, $07, $5E ; $EEA1
    .byte $8C, $01, $03, $80, $20, $00, $00, $00, $00, $FF, $A2, $02, $A9, $04, $D0, $16 ; $EEB1
    .byte $A2, $0E, $A9, $0F, $D0, $10 ; $EEC1
B07_EEC7:
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
B07_EF03:
    LDA $0450,X          ; $EF03  BD 50 04
    AND #$40             ; $EF06  29 40
    BEQ B07_EF20         ; $EF08  F0 16
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
    .byte $A2, $01, $D0, $0F, $A2, $05, $D0, $02, $A2, $00, $20, $48, $EF, $E8, $E0, $10 ; $EF35
    .byte $D0, $F8, $60 ; $EF45
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
    .byte $D0, $F2, $60, $A2, $00, $20, $C7, $EF, $E8, $E0, $08, $90, $F8, $60, $A9, $00 ; $EFB9
    .byte $9D, $50, $06, $9D, $58, $06, $9D, $60, $06, $9D, $68, $06, $9D, $70, $06, $9D ; $EFC9
    .byte $18, $06, $9D, $20, $06, $9D, $88, $06, $9D, $90, $06, $9D, $98, $06, $9D, $A0 ; $EFD9
    .byte $06, $9D, $A8, $06, $9D, $B0, $06, $9D, $B8, $06, $60, $18, $7D, $C0, $04, $9D ; $EFE9
    .byte $C0, $04, $A9, $00, $7D, $B0, $04, $9D, $B0, $04, $60, $49, $FF, $38, $7D, $C0 ; $EFF9
    .byte $04, $9D, $C0, $04, $A9, $FF, $7D, $B0, $04, $9D, $B0, $04, $60, $18, $7D, $F0 ; $F009
    .byte $04, $9D, $F0, $04, $A9, $00, $7D, $E0, $04, $9D, $E0, $04, $60, $49, $FF, $38 ; $F019
    .byte $7D, $F0, $04, $9D, $F0, $04, $A9, $FF, $7D, $E0, $04, $9D, $E0, $04, $60, $BD ; $F029
    .byte $60, $04, $38, $ED, $60, $04, $B0, $04, $49, $FF, $69, $01, $60, $BD, $80, $04 ; $F039
    .byte $38, $ED, $80, $04, $B0, $04, $49, $FF, $69, $01, $60, $BD, $40, $06, $9D, $60 ; $F049
    .byte $04, $60, $BD, $60, $04, $9D, $40, $06, $60, $9D, $F0, $04, $98, $9D, $E0, $04 ; $F059
    .byte $60, $9D, $C0, $04, $98, $9D, $B0, $04, $60 ; $F069
B07_F072:
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
B07_F161:
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
B07_F17A:
    LDA $0450,X          ; $F17A  BD 50 04
    AND #$20             ; $F17D  29 20
    BEQ B07_F18C         ; $F17F  F0 0B
    DEC $0500,X          ; $F181  DE 00 05
    LDA $0500,X          ; $F184  BD 00 05
    AND #$03             ; $F187  29 03
    STA $0430,X          ; $F189  9D 30 04
B07_F18C:
    RTS                  ; $F18C  60
    .byte $A5, $51, $85, $68, $A5, $52, $85, $69, $A0, $00, $A9, $C0, $85, $00, $A5, $5C ; $F18D
    .byte $D0, $01, $60, $A5, $69, $D0, $06, $A5, $68, $C5, $00, $90, $10, $A5, $68, $38 ; $F19D
    .byte $E5, $00, $85, $68, $A5, $69, $E9, $00, $85, $69, $C8, $D0, $E6, $84, $69, $60 ; $F1AD
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
    .byte $26, $26, $27, $27, $28, $29, $01, $01, $2C, $2C, $0A, $A8, $B9, $96, $F7, $85 ; $F70E
    .byte $00, $B9, $97, $F7, $85, $01, $A0, $00, $A2, $00, $20, $40, $F7, $4C, $59, $F7 ; $F71E
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
    .byte $05, $1A, $A9, $0F, $D0, $02, $A9, $16, $85, $2C, $A0, $00, $99, $9F, $05, $C8 ; $F77C
    .byte $C8, $C8, $C8, $C0, $20, $D0, $F5, $4C, $59, $F7, $CA, $F7, $E3, $F7, $FC, $F7 ; $F78C
    .byte $15, $F8, $28, $F8, $41, $F8, $54, $F8, $6D, $F8, $86, $F8, $9F, $F8, $B8, $F8 ; $F79C
    .byte $D1, $F8, $EA, $F8, $03, $F9, $1C, $F9, $35, $F9, $4E, $F9, $67, $F9, $80, $F9 ; $F7AC
    .byte $99, $F9, $B2, $F9, $CB, $F9, $E4, $F9, $FD, $F9, $13, $FA, $29, $FA, $00, $10 ; $F7BC
    .byte $20, $01, $11, $21, $06, $26, $37, $00, $00, $00, $09, $16, $2A, $0D, $1A, $26 ; $F7CC
    .byte $0D, $12, $23, $0F, $16, $37, $FE, $01, $16, $20, $06, $26, $36, $00, $00, $00 ; $F7DC
    .byte $00, $2C, $20, $09, $16, $2A, $02, $16, $31, $0D, $12, $2B, $0F, $14, $2C, $FE ; $F7EC
    .byte $01, $16, $20, $06, $26, $36, $01, $11, $21, $07, $17, $28, $09, $16, $2A, $02 ; $F7FC
    .byte $16, $31, $07, $1B, $37, $0F, $16, $25, $FE, $01, $16, $30, $0F, $00, $10, $01 ; $F80C
    .byte $2A, $16, $01, $17, $35, $09, $16, $2A, $02, $16, $31, $FE, $00, $10, $20, $01 ; $F81C
    .byte $11, $20, $12, $11, $21, $07, $0A, $2A, $09, $16, $2A, $0D, $1A, $26, $0D, $12 ; $F82C
    .byte $23, $0F, $16, $37, $FE, $01, $16, $20, $01, $1C, $3C, $00, $06, $26, $00, $10 ; $F83C
    .byte $20, $09, $16, $2A, $02, $16, $31, $FE, $01, $16, $20, $01, $1C, $3C, $01, $03 ; $F84C
    .byte $25, $01, $17, $27, $09, $16, $2A, $06, $17, $37, $0D, $07, $29, $0F, $12, $2A ; $F85C
    .byte $FE, $08, $10, $20, $01, $11, $21, $04, $14, $24, $08, $0A, $2A, $09, $16, $2A ; $F86C
    .byte $0D, $1A, $26, $0D, $12, $23, $0F, $16, $37, $FE, $01, $16, $20, $0B, $1B, $3B ; $F87C
    .byte $01, $11, $31, $07, $17, $27, $09, $16, $2A, $02, $16, $31, $0D, $12, $2B, $0F ; $F88C
    .byte $14, $2C, $FE, $01, $16, $20, $0C, $1C, $3C, $10, $20, $21, $05, $26, $36, $09 ; $F89C
    .byte $16, $2A, $02, $16, $31, $07, $1B, $37, $0F, $16, $25, $FE, $10, $28, $20, $08 ; $F8AC
    .byte $17, $37, $0B, $1B, $2C, $01, $21, $20, $09, $16, $2A, $0D, $1A, $26, $0D, $12 ; $F8BC
    .byte $23, $0F, $16, $37, $FE, $02, $16, $20, $02, $13, $25, $01, $1B, $3C, $17, $27 ; $F8CC
    .byte $37, $09, $16, $2A, $02, $16, $31, $0D, $12, $2B, $0F, $14, $2C, $FE, $01, $16 ; $F8DC
    .byte $20, $0C, $1C, $2C, $10, $20, $21, $00, $10, $30, $09, $16, $2A, $02, $16, $31 ; $F8EC
    .byte $07, $1B, $37, $0D, $16, $25, $FE, $00, $10, $30, $00, $00, $00, $21, $31, $30 ; $F8FC
    .byte $00, $00, $00, $09, $12, $2A, $09, $16, $2A, $0D, $1A, $2B, $0D, $1A, $26, $FE ; $F90C
    .byte $02, $16, $31, $00, $12, $10, $06, $17, $26, $08, $0B, $1B, $09, $16, $2A, $02 ; $F91C
    .byte $16, $31, $00, $06, $10, $0D, $12, $10, $FE, $0F, $01, $11, $08, $18, $30, $1B ; $F92C
    .byte $21, $3C, $07, $17, $37, $09, $16, $2A, $0D, $1A, $26, $0D, $12, $23, $0F, $16 ; $F93C
    .byte $37, $FE, $01, $16, $20, $06, $17, $37, $01, $13, $3C, $01, $12, $0F, $09, $16 ; $F94C
    .byte $2A, $02, $16, $31, $0D, $12, $2B, $0F, $14, $2C, $FE, $01, $16, $20, $06, $26 ; $F95C
    .byte $36, $01, $12, $3A, $08, $28, $20, $09, $16, $2A, $02, $16, $31, $07, $1B, $37 ; $F96C
    .byte $0F, $16, $25, $FE, $02, $16, $31, $12, $22, $31, $07, $14, $23, $00, $10, $30 ; $F97C
    .byte $09, $16, $2A, $02, $16, $31, $22, $31, $16, $0D, $16, $37, $FE, $0C, $16, $30 ; $F98C
    .byte $0B, $1B, $3B, $0F, $0B, $28, $06, $26, $36, $09, $16, $2A, $02, $16, $31, $0D ; $F99C
    .byte $12, $2B, $0F, $14, $2C, $FE, $0C, $16, $30, $0C, $1C, $3C, $0F, $0B, $28, $00 ; $F9AC
    .byte $10, $30, $09, $16, $2A, $02, $16, $31, $07, $1B, $37, $0F, $16, $25, $FE, $01 ; $F9BC
    .byte $16, $30, $08, $28, $30, $0F, $08, $28, $0C, $1C, $3C, $09, $16, $2A, $02, $16 ; $F9CC
    .byte $31, $07, $1B, $37, $0F, $16, $25, $FE, $0C, $16, $31, $00, $10, $30, $08, $28 ; $F9DC
    .byte $30, $0B, $1B, $28, $09, $16, $2A, $02, $16, $31, $08, $16, $26, $0F, $1C, $3C ; $F9EC
    .byte $FE, $06, $26, $36, $07, $26, $36, $00, $10, $36, $0B, $2B, $36, $09, $16, $2A ; $F9FC
    .byte $00, $10, $36, $0F, $0F, $30, $FE, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F ; $FA0C
    .byte $07, $18, $36, $0F, $01, $3C, $0F, $01, $26, $0F, $26, $36, $FE, $01, $16, $30 ; $FA1C
    .byte $01, $00, $10, $01, $2A, $16, $01, $26, $36, $FE, $C8, $FA, $CB, $FA, $CE, $FA ; $FA2C
    .byte $D1, $FA, $DC, $FA, $E4, $FA, $EC, $FA, $44, $FB, $49, $FB, $4E, $FB, $62, $FB ; $FA3C
    .byte $66, $FB, $6A, $FB, $6F, $FB, $74, $FB, $F4, $FA, $24, $FB, $79, $FB, $7D, $FB ; $FA4C
    .byte $FC, $FA, $81, $FB, $53, $FB, $58, $FB, $5D, $FB, $D4, $FA, $2F, $FB, $37, $FB ; $FA5C
    .byte $04, $FB, $7A, $FC, $88, $FC, $5B, $FC, $1C, $FB, $86, $FB, $6F, $FC, $56, $FC ; $FA6C
    .byte $0A, $FC, $18, $FC, $23, $FC, $0C, $FB, $14, $FB, $8B, $FB, $8B, $FB, $8B, $FB ; $FA7C
    .byte $8B, $FB, $8F, $FB, $3F, $FB, $93, $FB, $98, $FB, $9D, $FB, $A2, $FB, $A7, $FB ; $FA8C
    .byte $AC, $FB, $B1, $FB, $B6, $FB, $B6, $FB, $C4, $FB, $CF, $FB, $DA, $FB, $E5, $FB ; $FA9C
    .byte $F0, $FB, $FB, $FB, $00, $FC, $05, $FC, $42, $FC, $47, $FC, $4C, $FC, $51, $FC ; $FAAC
    .byte $42, $FC, $42, $FC, $2E, $FC, $33, $FC, $38, $FC, $3D, $FC, $0B, $12, $FE, $0B ; $FABC
    .byte $16, $FE, $0B, $27, $FE, $0B, $14, $FE, $19, $0F, $17, $37, $0F, $1B, $28, $FE ; $FACC
    .byte $19, $0F, $14, $3B, $0F, $23, $33, $FE, $19, $08, $24, $37, $0F, $26, $37, $FE ; $FADC
    .byte $19, $0F, $17, $37, $0F, $1B, $28, $FE, $19, $16, $26, $37, $0F, $2B, $37, $FE ; $FAEC
    .byte $19, $08, $14, $37, $0F, $11, $33, $FE, $19, $37, $17, $0B, $0D, $16, $31, $FE ; $FAFC
    .byte $19, $0F, $26, $36, $0F, $22, $30, $FE, $19, $06, $1B, $3A, $0F, $22, $30, $FE ; $FB0C
    .byte $19, $00, $22, $34, $0F, $17, $38, $FE, $01, $07, $27, $38, $07, $26, $36, $0F ; $FB1C
    .byte $16, $30, $FE, $19, $09, $18, $22, $0D, $07, $26, $FE, $19, $0F, $07, $29, $0F ; $FB2C
    .byte $12, $2A, $FE, $15, $06, $17, $37, $FE, $09, $01, $11, $21, $FE, $09, $21, $01 ; $FB3C
    .byte $11, $FE, $09, $11, $21, $01, $FE, $0D, $27, $37, $17, $FE, $0D, $37, $17, $27 ; $FB4C
    .byte $FE, $0D, $17, $27, $37, $FE, $1A, $07, $29, $FE, $1A, $00, $12, $FE, $0D, $01 ; $FB5C
    .byte $17, $37, $FE, $0D, $01, $26, $27, $FE, $0D, $01, $37, $17, $FE, $1A, $18, $37 ; $FB6C
    .byte $FE, $1A, $1B, $31, $FE, $0D, $08, $19, $2A, $FE, $19, $11, $2C, $30, $FE, $0A ; $FB7C
    .byte $3C, $0C, $FE, $0A, $03, $25, $FE, $09, $12, $32, $20, $FE, $09, $13, $24, $20 ; $FB8C
    .byte $FE, $09, $05, $25, $35, $FE, $09, $06, $16, $27, $FE, $11, $09, $17, $2A, $FE ; $FB9C
    .byte $15, $09, $14, $2A, $FE, $15, $16, $26, $37, $FE, $01, $0F, $0F, $0F, $0F, $0F ; $FBAC
    .byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $FE, $01, $0F, $0F, $0F, $0F, $0F, $0F, $0F ; $FBBC
    .byte $0F, $0F, $FE, $01, $0F, $0C, $0F, $06, $0F, $0F, $0F, $0F, $0C, $FE, $01, $0F ; $FBCC
    .byte $1C, $06, $16, $0F, $06, $0F, $01, $1C, $FE, $01, $0F, $2C, $16, $26, $06, $16 ; $FBDC
    .byte $0F, $11, $2C, $FE, $01, $01, $3C, $26, $36, $16, $26, $01, $21, $3C, $FE, $11 ; $FBEC
    .byte $07, $17, $38, $FE, $11, $16, $16, $16, $FE, $11, $30, $30, $30, $FE, $11, $0C ; $FBFC
    .byte $2A, $31, $0C, $2A, $16, $0C, $2A, $27, $0C, $2A, $13, $FE, $05, $0C, $12, $1C ; $FC0C
    .byte $08, $04, $15, $00, $12, $22, $FE, $05, $09, $0B, $1B, $0F, $08, $13, $0F, $08 ; $FC1C
    .byte $00, $FE, $19, $09, $12, $2A, $FE, $19, $09, $16, $2A, $FE, $19, $09, $27, $2A ; $FC2C
    .byte $FE, $19, $09, $14, $2A, $FE, $01, $0C, $2A, $31, $FE, $05, $0C, $2A, $16, $FE ; $FC3C
    .byte $09, $0C, $2A, $27, $FE, $0D, $0C, $2A, $14, $FE, $15, $16, $27, $36, $FE, $00 ; $FC4C
    .byte $0C, $2A, $31, $0C, $2A, $16, $0C, $2A, $27, $0C, $2A, $13, $09, $12, $2A, $02 ; $FC5C
    .byte $16, $31, $FE, $00, $01, $16, $30, $01, $16, $2A, $16, $27, $10, $FE, $00, $0C ; $FC6C
    .byte $2A, $16, $0C, $17, $33, $0C, $2A, $17, $0C, $2A, $13, $FE, $00, $0C, $21, $30 ; $FC7C
    .byte $0C, $16, $23, $0C, $17, $37, $FE, $1F, $FD, $25, $FD, $00, $00, $00, $00, $00 ; $FC8C
    .byte $00, $B9, $FC, $C7, $FC, $CF, $FC, $D9, $FC, $EF, $FC, $F9, $FC, $0B, $FD, $31 ; $FC9C
    .byte $FD, $3D, $FD, $49, $FD, $49, $FD, $49, $FD, $49, $FD, $49, $FD, $5F, $00, $7F ; $FCAC
    .byte $0C, $DF, $04, $E6, $02, $F9, $00, $FE, $06, $FF, $00, $BF, $04, $F6, $00, $FE ; $FCBC
    .byte $02, $FF, $00, $9C, $04, $A7, $0C, $F9, $00, $FE, $02, $FF, $00, $BE, $00, $DF ; $FCCC
    .byte $04, $E1, $0B, $E3, $01, $E8, $0C, $ED, $0D, $F0, $09, $F2, $02, $F9, $0A, $FE ; $FCDC
    .byte $02, $FF, $00, $E4, $00, $F9, $04, $FD, $09, $FE, $02, $FF, $00, $C1, $00, $DF ; $FCEC
    .byte $04, $E1, $0B, $EF, $00, $F0, $09, $F1, $02, $FB, $07, $FE, $08, $FF, $00, $A7 ; $FCFC
    .byte $00, $B5, $01, $DF, $04, $E1, $0B, $E2, $09, $E4, $02, $E9, $0C, $EE, $0D, $FE ; $FD0C
    .byte $0F, $FF, $00, $F7, $00, $FE, $04, $FF, $00, $0D, $00, $0F, $04, $F5, $00, $F8 ; $FD1C
    .byte $0C, $FE, $01, $FF, $00, $BB, $00, $BC, $0B, $BF, $09, $FC, $04, $FE, $02, $FF ; $FD2C
    .byte $00, $CB, $00, $F8, $04, $FB, $01, $FD, $09, $FE, $02, $FF, $00, $FF, $00, $A9 ; $FD3C
    .byte $00, $A0, $F8, $20, $72, $F0, $F0, $27, $C9, $02, $F0, $23, $C9, $0C, $F0, $1F ; $FD4C
    .byte $4C, $48, $EF, $A9, $00, $A0, $F8, $20, $72, $F0, $F0, $13, $C9, $02, $F0, $0F ; $FD5C
    .byte $C9, $09, $F0, $0B, $C9, $0A, $F0, $07, $C9, $07, $F0, $03, $4C, $48, $EF, $BD ; $FD6C
    .byte $80, $04, $18, $69, $0A, $C9, $11, $90, $15, $BD, $60, $04, $A4, $5C, $F0, $08 ; $FD7C
    .byte $69, $3F, $C9, $44, $90, $08, $18, $60, $69, $07, $C9, $10, $B0, $F8, $20, $48 ; $FD8C
    .byte $EF, $38, $60, $BD, $10, $04, $C9, $01, $F0, $05, $A9, $16, $20, $F0, $CE, $BD ; $FD9C
    .byte $50, $04, $29, $01, $F0, $08, $A9, $28, $20, $16, $F0, $4C, $BF, $FD, $A9, $28 ; $FDAC
    .byte $20, $26, $F0, $BD, $30, $06, $F0, $04, $DE, $30, $06, $60, $AD, $80, $04, $38 ; $FDBC
    .byte $FD, $80, $04, $B0, $03, $20, $D8, $8F, $C9, $0C, $B0, $32, $AD, $60, $04, $38 ; $FDCC
    .byte $FD, $60, $04, $B0, $03, $20, $D8, $8F, $C9, $18, $B0, $22, $A4, $67, $B9, $73 ; $FDDC
    .byte $00, $D0, $0B, $A9, $03, $99, $73, $00, $A9, $01, $85, $5B, $D0, $04, $C9, $03 ; $FDEC
    .byte $D0, $09, $B9, $A8, $00, $18, $69, $01, $99, $A8, $00, $4C, $48, $EF, $20, $7B ; $FDFC
    .byte $FD, $60, $BD, $40, $04, $0A, $A8, $B9, $3D, $88, $9D, $60, $05, $B9, $3E, $88 ; $FE0C
    .byte $9D, $70, $05, $0A, $A8, $B9, $11, $8E, $85, $00, $B9, $12, $8E, $85, $01, $A9 ; $FE1C
    .byte $00, $9D, $10, $04, $A8, $B1, $00, $9D, $00, $04, $A9, $01, $9D, $20, $04, $A9 ; $FE2C
    .byte $C2, $9D, $50, $04, $60, $0F, $00, $FC, $08, $BD, $50, $06, $20, $8D, $B9, $90 ; $FE3C
    .byte $68, $98, $48, $B9, $60, $05, $A8, $A5, $6E, $39, $18, $F1, $D0, $0C, $68, $A8 ; $FE4C
    .byte $A9, $FF, $99, $30, $06, $A9, $00, $4C, $86, $B9, $68, $A8, $8A, $48, $98, $AA ; $FE5C
    .byte $20, $48, $EF, $68, $AA, $4C, $C7, $EF, $A9, $02, $D0, $06, $A9, $01, $D0, $02 ; $FE6C
    .byte $A9, $00, $0A, $A8, $B9, $B6, $FE, $85, $00, $B9, $B7, $FE, $85, $01, $DE, $90 ; $FE7C
    .byte $06, $10, $26, $8A, $48, $BD, $88, $06, $A8, $B1, $00, $C9, $FF, $D0, $07, $A9 ; $FE8C
    .byte $00, $9D, $88, $06, $F0, $EF, $B1, $00, $9D, $90, $06, $FE, $88, $06, $FE, $88 ; $FE9C
    .byte $06, $C8, $B1, $00, $20, $2E, $F7, $68, $AA, $60, $BC, $FE, $C3, $FE, $D0, $FE ; $FEAC
    .byte $02, $07, $02, $08, $02, $09, $FF, $06, $0C, $06, $0D, $06, $0E, $06, $0E, $06 ; $FEBC
    .byte $0D, $06, $0C, $FF, $01, $17, $01, $16, $01, $15, $FF, $FF, $FF, $FF, $FF, $FF ; $FECC
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FEDC
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FEEC
    .byte $FF, $FF, $FF, $FF, $AA, $AA, $AA, $AA, $AA, $AF, $F0, $9E, $9F, $F0, $06, $AE ; $FEFC
    .byte $7C, $1B, $98, $F0, $00, $03, $00, $0C, $01, $CE, $01, $80, $00, $00, $00, $00 ; $FF0C
    .byte $00, $0F, $1F, $FF, $FB, $F3, $CF, $F3, $EF, $DE, $B8, $F9, $A6, $A2, $24, $39 ; $FF1C
    .byte $81, $43, $80, $86, $19, $02, $38, $51, $87, $86, $15, $39, $8C, $A6, $55, $4D ; $FF2C
    .byte $16, $8C, $A3, $45, $45, $90, $CA, $56, $22, $52, $70, $D6, $53, $16, $D3, $54 ; $FF3C
    .byte $D7, $4B, $37, $4B, $5B, $6B, $56, $CE, $B5, $5B, $5D, $59, $B6, $D5, $AB, $D6 ; $FF4C
    .byte $B5, $D7, $6B, $6D, $AD, $AE, $B6, $D6, $B5, $B5, $AA, $D6, $AA, $AC, $AA, $A9 ; $FF5C
    .byte $54, $A9, $94, $A4, $A9, $4A, $4A, $8A, $92, $54, $A5, $49, $29, $4A, $54, $A5 ; $FF6C
    .byte $29, $52, $A5, $4A, $A5, $54, $A9, $54, $AA, $95, $2A, $AA, $94, $95, $2A, $AA ; $FF7C
    .byte $55, $55, $2A, $56, $66, $AA, $9A, $AA, $B5, $5A, $AD, $AB, $5A, $B5, $6B, $6B ; $FF8C
    .byte $6B, $5A, $B5, $AA, $B5, $56, $AA, $D5, $55, $56, $AA, $AA, $AA, $AA, $AA, $AA ; $FF9C
    .byte $AA, $95, $55, $55, $B5, $56, $AA, $D5, $55, $56, $AA, $AA, $AA, $AA, $AA, $AA ; $FFAC
    .byte $AA, $95, $55, $55, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FFBC
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FFCC
RESET_HANDLER:
B07_FFD8:
    CLD                  ; $FFD8  D8
    SEI                  ; $FFD9  78
    INC $FFFF            ; $FFDA  EE FF FF
    JMP B07_C310         ; $FFDD  4C 10 C3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $53, $54, $49, $4E, $47, $45, $52 ; $FFE0
    .byte $00, $00, $00, $00, $38, $02, $01, $06, $A4, $1B, $A3, $C3, $D8, $FF, $12, $C4 ; $FFF0
