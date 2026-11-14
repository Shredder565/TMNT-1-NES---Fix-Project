; TMNT NES 1989, MMC1 PRG bank 07
; CPU window $C000-$FFFF; 16KB bank, fixed byte size.
; Experimental static recovery + existing entry points; byte-exact, NOT fully validated.
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
    .byte $00, $A2, $07, $9D, $C2, $03, $CA, $10, $FA, $60 ; $C6C8
B07_C6D2:
    LDX #$30             ; $C6D2  A2 30
    BNE B07_C6D8         ; $C6D4  D0 02
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
B07_C792:
    TYA                  ; $C792  98
    ASL A                ; $C793  0A
    TAY                  ; $C794  A8
    LDA $C821,Y          ; $C795  B9 21 C8
    CLC                  ; $C798  18
    ADC $0480            ; $C799  6D 80 04
    STA $00              ; $C79C  85 00
    LDA $C822,Y          ; $C79E  B9 22 C8
    CLC                  ; $C7A1  18
    ADC $0460            ; $C7A2  6D 60 04
    STA $01              ; $C7A5  85 01
    JMP B07_C7C7         ; $C7A7  4C C7 C7
    .byte $98, $0A, $A8, $B9, $21, $C8, $18, $6D, $E0, $04, $18, $6D, $80, $04, $85, $00 ; $C7AA
    .byte $B9, $22, $C8, $18, $6D, $B0, $04, $18, $6D, $60, $04, $85, $01 ; $C7BA
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
    .byte $00, $99, $C8, $00, $88, $10, $F7, $60 ; $C8A1
B07_C8A9:
    STA $10              ; $C8A9  85 10
    STY $11              ; $C8AB  84 11
    LDY #$00             ; $C8AD  A0 00
B07_C8AF:
    LDA #$00             ; $C8AF  A9 00
    STA $12              ; $C8B1  85 12
    LDA $00C2,Y          ; $C8B3  B9 C2 00
    AND #$0F             ; $C8B6  29 0F
    STA $12              ; $C8B8  85 12
    LDA $10              ; $C8BA  A5 10
    AND #$0F             ; $C8BC  29 0F
    CLC                  ; $C8BE  18
    ADC $12              ; $C8BF  65 12
    JSR B07_C90B         ; $C8C1  20 0B C9
    LDA $00              ; $C8C4  A5 00
    STA $14              ; $C8C6  85 14
    LDA $00C2,Y          ; $C8C8  B9 C2 00
    LSR A                ; $C8CB  4A
    LSR A                ; $C8CC  4A
    LSR A                ; $C8CD  4A
    LSR A                ; $C8CE  4A
    STA $12              ; $C8CF  85 12
    LDA $10              ; $C8D1  A5 10
    LSR A                ; $C8D3  4A
    LSR A                ; $C8D4  4A
    LSR A                ; $C8D5  4A
    LSR A                ; $C8D6  4A
    CLC                  ; $C8D7  18
    ADC $01              ; $C8D8  65 01
    CLC                  ; $C8DA  18
    ADC $12              ; $C8DB  65 12
    JSR B07_C90B         ; $C8DD  20 0B C9
    LDA $00              ; $C8E0  A5 00
    ASL A                ; $C8E2  0A
    ASL A                ; $C8E3  0A
    ASL A                ; $C8E4  0A
    ASL A                ; $C8E5  0A
    ORA $14              ; $C8E6  05 14
    STA $00C2,Y          ; $C8E8  99 C2 00
    LDA $01              ; $C8EB  A5 01
    BEQ B07_C8F9         ; $C8ED  F0 0A
    CPY #$01             ; $C8EF  C0 01
    BEQ B07_C8FF         ; $C8F1  F0 0C
    CLC                  ; $C8F3  18
    ADC $11              ; $C8F4  65 11
    JMP B07_C8FF         ; $C8F6  4C FF C8
B07_C8F9:
    CPY #$01             ; $C8F9  C0 01
    BEQ B07_C90A         ; $C8FB  F0 0D
    LDA $11              ; $C8FD  A5 11
B07_C8FF:
    STA $10              ; $C8FF  85 10
    INY                  ; $C901  C8
    CPY #$03             ; $C902  C0 03
    BEQ B07_C90A         ; $C904  F0 04
    CPY #$06             ; $C906  C0 06
    BNE B07_C8AF         ; $C908  D0 A5
B07_C90A:
    RTS                  ; $C90A  60
B07_C90B:
    PHA                  ; $C90B  48
    LDA #$00             ; $C90C  A9 00
    STA $00              ; $C90E  85 00
    STA $01              ; $C910  85 01
    PLA                  ; $C912  68
B07_C913:
    CMP #$0A             ; $C913  C9 0A
    BCC B07_C91D         ; $C915  90 06
    SBC #$0A             ; $C917  E9 0A
    INC $01              ; $C919  E6 01
    BNE B07_C913         ; $C91B  D0 F6
B07_C91D:
    STA $00              ; $C91D  85 00
    RTS                  ; $C91F  60
    .byte $A9, $E1, $A0, $FF, $20, $30, $C9, $8D, $C6, $03, $8C, $C5, $03, $60, $A0, $00 ; $C920
    .byte $18, $6D, $C6, $03, $48, $98, $6D, $C5, $03, $A8, $68, $60 ; $C930
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
B07_CA9B:
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
    .byte $BA, $E6, $34, $60 ; $CBA3
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
    .byte $A5, $5C, $F0, $08, $AD, $09, $06, $D0, $03, $20, $20, $CF, $E6, $34, $A9, $10 ; $CBBF
    .byte $85, $3D, $AD, $09, $06, $F0, $06, $A9, $00, $8D, $09, $06, $60, $AD, $E2, $03 ; $CBCF
    .byte $F0, $06, $A9, $00, $8D, $E2, $03, $60, $20, $C0, $CE, $A5, $5C, $F0, $16, $A4 ; $CBDF
    .byte $48, $88, $D0, $09, $A4, $5D, $D0, $05, $A9, $6B, $4C, $F0, $CE, $A4, $48, $B9 ; $CBEF
    .byte $12, $CC, $4C, $F0, $CE, $A4, $48, $B9, $0C, $CC, $4C, $F0, $CE, $53, $53, $53 ; $CBFF
    .byte $53, $57, $53, $5B, $5F, $6B, $5B, $6F, $6B, $A5, $3D, $F0, $0E, $C6, $3D, $D0 ; $CC0F
    .byte $04, $A9, $00, $85, $36, $20, $E0, $DE, $4C, $42, $D0, $A5, $B5, $F0, $03, $4C ; $CC1F
    .byte $9C, $CC, $A5, $1E, $29, $7F, $D0, $13, $A5, $9E, $C9, $FF, $F0, $0D, $A5, $9D ; $CC2F
    .byte $18, $69, $01, $85, $9D, $A5, $9E, $69, $00, $85, $9E, $A5, $1E, $29, $01, $F0 ; $CC3F
    .byte $1F, $20, $2A, $D0, $24, $A2, $30, $12, $20, $F3, $CF, $20, $00, $D0, $20, $F6 ; $CC4F
    .byte $E3, $20, $42, $D0, $20, $BB, $DE, $4C, $22, $D0, $20, $E0, $DE, $4C, $42, $D0 ; $CC5F
    .byte $A5, $3F, $D0, $0B, $AD, $FC, $03, $D0, $06, $20, $10, $CF, $20, $42, $CF, $20 ; $CC6F
    .byte $18, $CF, $20, $4A, $CF, $20, $CD, $CF, $20, $C5, $CF, $20, $42, $D0, $20, $E0 ; $CC7F
    .byte $DE, $20, $4D, $D0, $20, $45, $E1, $A9, $00, $8D, $D5, $03, $60, $A5, $1E, $29 ; $CC8F
    .byte $01, $F0, $09, $20, $3A, $D0, $20, $42, $D0, $4C, $E0, $DE, $A5, $B5, $29, $7F ; $CC9F
    .byte $C9, $0D, $F0, $04, $C9, $10, $D0, $06, $20, $CD, $CF, $4C, $C4, $CC, $C9, $06 ; $CCAF
    .byte $D0, $03, $20, $D5, $CF, $20, $42, $D0, $20, $4D, $D0, $4C, $E0, $DE, $A9, $C2 ; $CCBF
    .byte $8D, $50, $04, $A9, $1F, $20, $56, $CE, $A4, $67, $A9, $00, $99, $A8, $00, $99 ; $CCCF
    .byte $73, $00, $8D, $40, $05, $85, $89, $85, $B0, $85, $5E, $85, $7E, $85, $88, $85 ; $CCDF
    .byte $36, $85, $8C, $A9, $01, $8D, $17, $06, $20, $39, $EF, $4C, $F1, $CD, $20, $62 ; $CCEF
    .byte $C9, $A2, $0C, $20, $82, $C9, $A9, $08, $85, $34, $60, $A9, $01, $85, $36, $8D ; $CCFF
    .byte $D9, $03, $E6, $9D, $D0, $3F, $E6, $9E, $F0, $0B, $A5, $9E, $C9, $FF, $D0, $35 ; $CD0F
    .byte $A9, $8B, $4C, $F0, $CE, $C6, $46, $D0, $03, $4C, $67, $CD, $20, $62, $C9, $A9 ; $CD1F
    .byte $06, $20, $58, $CA, $A9, $07, $20, $58, $CA, $A9, $49, $8D, $00, $04, $A9, $60 ; $CD2F
    .byte $8D, $60, $04, $A9, $60, $8D, $80, $04, $A9, $02, $8D, $50, $04, $A9, $00, $85 ; $CD3F
    .byte $26, $A9, $0A, $85, $34, $60, $A9, $01, $8D, $D9, $03, $A5, $30, $29, $10, $F0 ; $CD4F
    .byte $3D, $A5, $26, $4A, $29, $01, $F0, $09, $A9, $00, $85, $34, $85, $2E, $4C, $A3 ; $CD5F
    .byte $C6, $A5, $48, $85, $2E, $20, $D6, $C6, $A5, $2E, $85, $48, $85, $5D, $C9, $05 ; $CD6F
    .byte $D0, $07, $A2, $01, $86, $5C, $CA, $86, $5D, $A9, $80, $85, $77, $85, $78, $85 ; $CD7F
    .byte $79, $85, $7A, $A9, $02, $85, $34, $A9, $00, $85, $2E, $E6, $36, $60, $A5, $30 ; $CD8F
    .byte $29, $20, $F0, $02, $E6, $26, $A5, $26, $4A, $29, $01, $AA, $BD, $B2, $CD, $8D ; $CD9F
    .byte $60, $04, $60, $70, $88 ; $CDAF
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
    .byte $A9, $06, $20, $A5, $CE, $4C, $F6, $80, $A9, $05, $20, $A5, $CE, $4C, $01, $80 ; $CF10
    .byte $A9, $06, $20, $A5, $CE, $4C, $CC, $85, $A9, $05, $20, $A7, $CE, $20, $77, $80 ; $CF20
    .byte $4C, $D0, $CE ; $CF30
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
B07_CFA2:
    LDA #$04             ; $CFA2  A9 04
    JSR B07_CEA7         ; $CFA4  20 A7 CE
    JSR $96F3            ; $CFA7  20 F3 96
    JMP B07_CED0         ; $CFAA  4C D0 CE
    .byte $A9, $04, $20, $A7, $CE, $20, $1D, $97, $4C, $D0, $CE, $A9, $04, $20, $A5, $CE ; $CFAD
    .byte $20, $9A, $AA, $A9, $05, $4C, $A5, $CE, $A9, $06, $20, $A5, $CE, $4C, $35, $95 ; $CFBD
B07_CFCD:
    LDA #$06             ; $CFCD  A9 06
    JSR B07_CEA5         ; $CFCF  20 A5 CE
    JMP $8005            ; $CFD2  4C 05 80
    .byte $A9, $06, $20, $A5, $CE, $4C, $01, $80, $A9, $06, $20, $A7, $CE, $20, $05, $80 ; $CFD5
    .byte $4C, $D0, $CE, $A9, $06, $20, $A7, $CE, $20, $01, $80, $4C, $D0, $CE, $A5, $3F ; $CFE5
    .byte $F0, $01, $60, $A9, $01, $20, $A5, $CE, $4C, $B9, $D7, $A9, $01, $20, $A5, $CE ; $CFF5
    .byte $4C, $6E, $DC, $A9, $01, $20, $A5, $CE, $20, $6E, $DC, $A9, $06, $4C, $A5, $CE ; $D005
    .byte $A9, $01, $20, $A5, $CE, $20, $B9, $D7, $A9, $06, $4C, $A5, $CE, $A9, $04, $20 ; $D015
    .byte $A5, $CE, $4C, $D9, $A9, $A9, $04, $20, $A5, $CE, $4C, $45, $97, $A9, $06, $20 ; $D025
    .byte $A5, $CE, $4C, $98, $A8, $A9, $06, $20, $A5, $CE, $4C, $47, $9F, $A9, $00, $20 ; $D035
    .byte $A7, $CE, $20, $01, $80, $4C, $D0, $CE, $A9, $00, $20, $A7, $CE, $20, $55, $80 ; $D045
    .byte $4C, $D0, $CE, $48, $A9, $05, $20, $A5, $CE, $68, $20, $70, $B1, $A9, $06, $4C ; $D055
    .byte $A5, $CE, $AD, $00, $80, $48, $20, $72, $D0, $68, $4C, $A7, $CE ; $D065
B07_D072:
    LDA #$04             ; $D072  A9 04
    JSR B07_CEA5         ; $D074  20 A5 CE
    JSR $9745            ; $D077  20 45 97
    LDA #$05             ; $D07A  A9 05
    JSR B07_CEA5         ; $D07C  20 A5 CE
    JSR $8001            ; $D07F  20 01 80
    LDA #$06             ; $D082  A9 06
    JSR B07_CEA5         ; $D084  20 A5 CE
    .byte $20 ; $D087
B07_D088:
    CMP $4CCF            ; $D088  CD CF 4C
    EOR $E1              ; $D08B  45 E1
    LDA #$04             ; $D08D  A9 04
    JSR B07_CEA5         ; $D08F  20 A5 CE
    JSR $9745            ; $D092  20 45 97
    LDA #$06             ; $D095  A9 06
    JSR B07_CEA5         ; $D097  20 A5 CE
    JSR B07_CFCD         ; $D09A  20 CD CF
    JSR B07_E145         ; $D09D  20 45 E1
    LDA #$03             ; $D0A0  A9 03
    JMP B07_CEA5         ; $D0A2  4C A5 CE
    .byte $A9, $04, $20, $A7, $CE, $20, $35, $9F, $4C, $D0, $CE ; $D0A5
B07_D0B0:
    LDA #$04             ; $D0B0  A9 04
    JSR B07_CEA7         ; $D0B2  20 A7 CE
    JSR $9F35            ; $D0B5  20 35 9F
    JMP B07_CED0         ; $D0B8  4C D0 CE
    .byte $A9, $04, $20, $A7, $CE, $20, $57, $A6, $4C, $D0, $CE ; $D0BB
B07_D0C6:
    LDA #$04             ; $D0C6  A9 04
    JSR B07_CEA7         ; $D0C8  20 A7 CE
    JSR $A69F            ; $D0CB  20 9F A6
    JMP B07_CED0         ; $D0CE  4C D0 CE
    .byte $A9, $04, $20, $A7, $CE, $20, $62, $96, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE ; $D0D1
    .byte $20, $83, $A9, $4C, $D0, $CE, $A9, $04, $20, $A7, $CE, $20, $F0, $A5, $4C, $D0 ; $D0E1
    .byte $CE ; $D0F1
B07_D0F2:
    PHA                  ; $D0F2  48
    LDA #$04             ; $D0F3  A9 04
    JSR B07_CEA7         ; $D0F5  20 A7 CE
    PLA                  ; $D0F8  68
    JSR $A6AF            ; $D0F9  20 AF A6
    PHP                  ; $D0FC  08
    JSR B07_CED0         ; $D0FD  20 D0 CE
    PLP                  ; $D100  28
    RTS                  ; $D101  60
    .byte $A2, $00 ; $D102
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
    .byte $48, $A9, $05, $20, $A7, $CE, $68, $20, $81, $83, $4C, $D0, $CE, $A9, $03, $20 ; $D121
    .byte $A5, $CE, $4C, $1C, $A9, $A9, $06, $20, $A7, $CE, $20, $0E, $FE, $4C, $D0, $CE ; $D131
    .byte $A9, $02, $20, $A5, $CE, $4C, $B2, $B5, $A9, $02, $20, $A5, $CE, $4C, $BE, $B5 ; $D141
    .byte $AD, $00, $80, $48, $20, $5C, $D1, $68, $4C, $A7, $CE ; $D151
B07_D15C:
    LDA #$03             ; $D15C  A9 03
    JSR B07_CEA7         ; $D15E  20 A7 CE
    LDA #$00             ; $D161  A9 00
    STA $D0              ; $D163  85 D0
B07_D165:
    JSR $A91C            ; $D165  20 1C A9
    JSR B07_CA9B         ; $D168  20 9B CA
    JSR B07_C4B3         ; $D16B  20 B3 C4
    JSR B07_C26C         ; $D16E  20 6C C2
    LDA $D0              ; $D171  A5 D0
    CMP #$06             ; $D173  C9 06
    BCC B07_D165         ; $D175  90 EE
    LDA $67              ; $D177  A5 67
    ASL A                ; $D179  0A
    TAX                  ; $D17A  AA
    PHA                  ; $D17B  48
    LDA $D1C1,X          ; $D17C  BD C1 D1
    JSR B07_CA58         ; $D17F  20 58 CA
    PLA                  ; $D182  68
    TAX                  ; $D183  AA
    LDA $D1C2,X          ; $D184  BD C2 D1
    JSR B07_F72E         ; $D187  20 2E F7
    LDA #$00             ; $D18A  A9 00
    STA $D0              ; $D18C  85 D0
    STA $94              ; $D18E  85 94
    STA $0596            ; $D190  8D 96 05
    LDA #$01             ; $D193  A9 01
    STA $9F              ; $D195  85 9F
    STA $8E              ; $D197  85 8E
    JSR $B695            ; $D199  20 95 B6
    JSR $ADD1            ; $D19C  20 D1 AD
    JMP B07_CED0         ; $D19F  4C D0 CE
    .byte $AD, $00, $80, $48, $20, $AD, $D1, $68, $4C, $A7, $CE ; $D1A2
B07_D1AD:
    LDA #$03             ; $D1AD  A9 03
    JSR B07_CEA7         ; $D1AF  20 A7 CE
    LDA $94              ; $D1B2  A5 94
    CMP #$03             ; $D1B4  C9 03
    BCS B07_D1BB         ; $D1B6  B0 03
    JSR $B695            ; $D1B8  20 95 B6
B07_D1BB:
    JSR $ADD1            ; $D1BB  20 D1 AD
    JMP B07_CED0         ; $D1BE  4C D0 CE
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
    .byte $C9, $03, $D0, $0A, $A5, $5D, $F0, $06, $C9, $11, $F0, $E2, $A5, $48 ; $D371
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
    .byte $E6, $34, $A9, $1E, $20, $56, $CE, $A9, $01, $20, $A7, $CE, $20, $62, $C9, $A2 ; $D482
    .byte $16, $20, $82, $C9, $A9, $23, $85, $29, $A9, $00, $85, $2A, $AD, $09, $06, $D0 ; $D492
    .byte $1C, $A2, $14, $20, $82, $C9, $A2, $00, $8A, $9D, $00, $07, $E8, $D0, $FA, $A2 ; $D4A2
    .byte $07, $A9, $44, $9D, $58, $07, $9D, $D8, $07, $CA, $10, $F7, $60, $A5, $A1, $85 ; $D4B2
    .byte $FF, $A5, $4F, $85, $FD, $60, $A5, $A2, $30, $B6, $A9, $1F, $20, $56, $CE, $A9 ; $D4C2
    .byte $01, $20, $A7, $CE, $E6, $A4, $30, $3C, $A5, $A4, $0A, $0A, $0A, $18, $65, $51 ; $D4D2
    .byte $85, $0A, $A5, $52, $69, $00, $85, $0B ; $D4E2
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
    .byte $A5, $5C, $F0, $01, $60, $A5, $52, $D0, $07, $A5, $51, $29, $F8, $D0, $01, $60 ; $D516
    .byte $A5, $51, $38, $E9, $08, $85, $0A, $A5, $52, $E9, $00, $85, $0B, $4C, $EA, $D4 ; $D526
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
    .byte $60, $78, $A4, $6B, $D0, $0B, $A5, $4F, $05, $50, $D0, $04, $05, $A6, $D0, $01 ; $D7B7
    .byte $60, $A5, $34, $C9, $03, $D0, $01, $60, $A5, $5C, $D0, $03, $4C, $C4, $DA, $A5 ; $D7C7
    .byte $4F, $85, $01, $A9, $00, $85, $00, $A5, $C0, $10, $02, $C6, $00, $A5, $C1, $18 ; $D7D7
    .byte $65, $6C, $85, $6C, $A5, $C0, $65, $4F, $85, $4F, $A5, $00, $65, $50, $85, $50 ; $D7E7
    .byte $10, $08, $A9, $00, $85, $50, $85, $4F, $85, $6C, $A5, $4F, $48, $38, $E5, $01 ; $D7F7
    .byte $85, $40, $68, $45, $A6, $29, $08, $D0, $07, $A5, $50, $05, $4F, $F0, $01, $60 ; $D807
    .byte $A4, $6B, $88, $B9, $C2, $DA, $18, $65, $4F, $29, $F8, $85, $08, $A5, $50, $69 ; $D817
    .byte $00, $85, $09, $A5, $51, $85, $0A, $A5, $52, $85, $0B, $20, $FC, $DE, $20, $35 ; $D827
    .byte $DA, $A9, $00, $85, $71, $A5, $22, $85, $72, $20, $23, $DF, $A0, $00, $84, $00 ; $D837
    .byte $B1, $49, $85, $01, $A4, $54, $88, $30, $09, $A5, $00, $18, $65, $01, $85, $00 ; $D847
    .byte $D0, $F4, $A5, $00, $65, $09, $A8, $C8, $C8, $B1, $49, $48, $4A, $4A, $4A, $4A ; $D857
    .byte $85, $01, $68, $0A, $0A, $0A, $0A, $85, $00, $A5, $60, $85, $04, $A5, $61, $85 ; $D867
    .byte $05, $A0, $03, $A5, $04, $18, $65, $00, $85, $04, $A5, $05, $65, $01, $85, $05 ; $D877
    .byte $88, $D0, $F0, $A9, $06, $85, $0D, $20, $23, $DF, $20, $CF, $D8, $A5, $0A, $18 ; $D887
    .byte $69, $20, $85, $0A, $A5, $0B, $69, $00, $85, $0B, $C6, $0D, $D0, $E9, $20, $7D ; $D897
    .byte $DF, $A5, $08, $29, $0F, $F0, $01, $60, $A5, $08, $2A, $2A, $2A, $2A, $29, $07 ; $D8A7
    .byte $09, $C0, $85, $00, $A9, $05, $85, $01, $A9, $23, $85, $03, $20, $02, $DA, $E6 ; $D8B7
    .byte $01, $A9, $2B, $85, $03, $4C, $02, $DA ; $D8C7
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
    CMP ($D9),Y          ; $D9C9  D1 D9
    .byte $E3, $D9, $D8, $D9, $F2, $D9, $A5, $16, $29, $FC, $4C, $FD, $D9, $A5, $16, $29 ; $D9CB
    .byte $F3, $06, $13, $06, $13, $4C, $FD, $D9, $A5, $16, $29, $CF, $06, $13, $06, $13 ; $D9DB
    .byte $06, $13, $06, $13, $4C, $FD, $D9, $A5, $16, $29, $3F, $18, $66, $13, $66, $13 ; $D9EB
    .byte $66, $13, $05, $13, $91, $14, $60 ; $D9FB
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
    .byte $00, $02, $00, $00, $03, $00, $00, $FE, $FF, $00, $FD, $FF, $A5, $3D, $F0, $01 ; $DC62
    .byte $60, $A5, $3F, $F0, $0F, $A5, $3E, $F0, $0B, $A5, $3F, $85, $6A, $A5, $51, $29 ; $DC72
    .byte $07, $F0, $4B, $60, $A4, $6A, $D0, $01, $60, $A9, $00, $88, $D0, $02, $A9, $06 ; $DC82
    .byte $A8, $AD, $06, $06, $F0, $03, $C8, $C8, $C8, $A5, $51, $85, $01, $B9, $5A, $E0 ; $DC92
    .byte $18, $65, $6D, $85, $6D, $B9, $5B, $E0, $65, $51, $85, $51, $48, $B9, $5C, $E0 ; $DCA2
    .byte $65, $52, $85, $52, $68, $38, $E5, $01, $85, $41, $A5, $51, $45, $B7, $29, $08 ; $DCB2
    .byte $D0, $0C, $60, $A5, $51, $05, $52, $D0, $04, $05, $B7, $D0, $01, $60, $A5, $6A ; $DCC2
    .byte $0A, $A8, $88, $88, $A5, $5C, $D0, $10, $B9, $56, $E0, $18, $65, $51, $29, $F8 ; $DCD2
    .byte $85, $0A, $B9, $57, $E0, $4C, $F5, $DC, $B9, $52, $E0, $18, $65, $51, $85, $0A ; $DCE2
    .byte $B9, $53, $E0 ; $DCF2
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
    .byte $E0, $A9, $01, $9D, $B0, $04, $D0, $CE ; $E0A2
B07_E0AA:
    JSR B07_EF48         ; $E0AA  20 48 EF
    LDA $0450            ; $E0AD  AD 50 04
    AND #$01             ; $E0B0  29 01
    ORA #$C2             ; $E0B2  09 C2
    STA $0450,X          ; $E0B4  9D 50 04
    LDY $67              ; $E0B7  A4 67
    LDA $0073,Y          ; $E0B9  B9 73 00
    TAY                  ; $E0BC  A8
    LDA $E0FF,Y          ; $E0BD  B9 FF E0
    STA $0570,X          ; $E0C0  9D 70 05
    LDA $E103,Y          ; $E0C3  B9 03 E1
    STA $0440,X          ; $E0C6  9D 40 04
    LDA #$0A             ; $E0C9  A9 0A
    STA $0630,X          ; $E0CB  9D 30 06
    LDA #$03             ; $E0CE  A9 03
    STA $0420,X          ; $E0D0  9D 20 04
    LDA $0480            ; $E0D3  AD 80 04
    STA $0480,X          ; $E0D6  9D 80 04
    LDA $0460            ; $E0D9  AD 60 04
    STA $0460,X          ; $E0DC  9D 60 04
    LDA $0570            ; $E0DF  AD 70 05
    CMP #$84             ; $E0E2  C9 84
    BNE B07_E0EF         ; $E0E4  D0 09
    LDA $0460,X          ; $E0E6  BD 60 04
    CLC                  ; $E0E9  18
    ADC #$0C             ; $E0EA  69 0C
    STA $0460,X          ; $E0EC  9D 60 04
B07_E0EF:
    LDA #$05             ; $E0EF  A9 05
    STA $04E0,X          ; $E0F1  9D E0 04
    LDA $0450            ; $E0F4  AD 50 04
    ROR A                ; $E0F7  6A
    BCC $E0FD            ; $E0F8  90 03
    LDA #$FB             ; $E0FA  A9 FB
    STA $04E0,X          ; $E0FC  9D E0 04
    RTS                  ; $E0FF  60
    .byte $D7, $D7, $D6, $D5, $1A, $1A, $27, $28, $20, $27, $E1, $AD, $70, $05, $18, $69 ; $E100
    .byte $0C, $8D, $71, $05, $60, $20, $27, $E1, $A5, $67, $0A, $0A, $6D, $20, $05, $A8 ; $E110
    .byte $B9, $35, $E1, $8D, $71, $05, $60, $A2, $01, $A9, $C2, $8D, $51, $04, $AD, $20 ; $E120
    .byte $04, $8D, $21, $04, $60, $B1, $B0, $B2, $B2, $B4, $B3, $B5, $B5, $B7, $B6, $B8 ; $E130
    .byte $B8, $BA, $B9, $BB, $BB ; $E140
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
    .byte $AC, $84, $AD, $E4, $03, $D0, $01, $60, $A5, $51, $05, $52, $D0, $F9, $A5, $48 ; $E3F4
    .byte $C9, $02, $F0, $05, $C9, $03, $F0, $37, $60, $A5, $5D, $C9, $04, $D0, $E8, $AD ; $E404
    .byte $E4, $03, $29, $01, $F0, $E1, $A9, $01, $85, $07, $AD, $B8, $E4, $85, $00, $AD ; $E414
    .byte $B9, $E4, $85, $01, $AD, $C0, $E4, $85, $02, $AD, $C1, $E4, $85, $03, $20, $97 ; $E424
    .byte $E4, $90, $0B, $A9, $00, $85, $12, $20, $C8, $E4, $A9, $00, $85, $5E, $60, $A5 ; $E434
    .byte $5D, $F0, $01, $60, $AD, $E4, $03, $29, $0E, $D0, $01, $60, $A9, $03, $85, $17 ; $E444
    .byte $A5, $17, $A8, $A9, $00, $85, $07, $B9, $52, $E6, $2D, $E4, $03, $F0, $04, $A9 ; $E454
    .byte $01, $85, $07, $A5, $17, $0A, $A8, $B9, $B8, $E4, $85, $00, $B9, $B9, $E4, $85 ; $E464
    .byte $01, $B9, $C0, $E4, $85, $02, $B9, $C1, $E4, $85, $03, $20, $97, $E4, $90, $0E ; $E474
    .byte $A4, $17, $B9, $56, $E6, $85, $12, $20, $C8, $E4, $A9, $00, $85, $5E, $C6, $17 ; $E484
    .byte $D0, $BE, $60 ; $E494
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
    .byte $FC, $FC, $FD, $FD, $FD, $FE, $FE, $FE ; $E682
B07_E68A:
    LDX #$00             ; $E68A  A2 00
    JSR B07_EF89         ; $E68C  20 89 EF
    JSR B07_F18D         ; $E68F  20 8D F1
    JSR B07_E838         ; $E692  20 38 E8
    LDA $0480            ; $E695  AD 80 04
    STA $04              ; $E698  85 04
    LDA $0460            ; $E69A  AD 60 04
    STA $05              ; $E69D  85 05
    JSR B07_F089         ; $E69F  20 89 F0
    JSR B07_E838         ; $E6A2  20 38 E8
    LDA $5D              ; $E6A5  A5 5D
    ASL A                ; $E6A7  0A
    TAY                  ; $E6A8  A8
    LDA ($00),Y          ; $E6A9  B1 00
    STA $42              ; $E6AB  85 42
    INY                  ; $E6AD  C8
    LDA ($00),Y          ; $E6AE  B1 00
    STA $43              ; $E6B0  85 43
    LDA $AC              ; $E6B2  A5 AC
    STA $03FD            ; $E6B4  8D FD 03
    LDA $AD              ; $E6B7  A5 AD
    STA $03FE            ; $E6B9  8D FE 03
    LDY #$20             ; $E6BC  A0 20
    LDA $48              ; $E6BE  A5 48
    CMP #$05             ; $E6C0  C9 05
    BNE B07_E6C6         ; $E6C2  D0 02
    LDY #$28             ; $E6C4  A0 28
B07_E6C6:
    STY $08              ; $E6C6  84 08
B07_E6C8:
    LDY #$00             ; $E6C8  A0 00
    LDA ($42),Y          ; $E6CA  B1 42
    CMP #$FF             ; $E6CC  C9 FF
    BNE B07_E6D1         ; $E6CE  D0 01
    RTS                  ; $E6D0  60
B07_E6D1:
    CMP $7F              ; $E6D1  C5 7F
    BNE B07_E6FB         ; $E6D3  D0 26
    INY                  ; $E6D5  C8
    LDA ($42),Y          ; $E6D6  B1 42
    SEC                  ; $E6D8  38
    SBC $AC              ; $E6D9  E5 AC
    BPL B07_E6E4         ; $E6DB  10 07
    STA $00              ; $E6DD  85 00
    LDA #$00             ; $E6DF  A9 00
    SEC                  ; $E6E1  38
    SBC $00              ; $E6E2  E5 00
B07_E6E4:
    CMP $08              ; $E6E4  C5 08
    BCS B07_E6FB         ; $E6E6  B0 13
    INY                  ; $E6E8  C8
    LDA ($42),Y          ; $E6E9  B1 42
    SEC                  ; $E6EB  38
    SBC $AD              ; $E6EC  E5 AD
    BPL B07_E6F7         ; $E6EE  10 07
    STA $00              ; $E6F0  85 00
    LDA #$00             ; $E6F2  A9 00
    SEC                  ; $E6F4  38
    SBC $00              ; $E6F5  E5 00
B07_E6F7:
    CMP $08              ; $E6F7  C5 08
    BCC B07_E70B         ; $E6F9  90 10
B07_E6FB:
    LDA $42              ; $E6FB  A5 42
    CLC                  ; $E6FD  18
    ADC #$0B             ; $E6FE  69 0B
    STA $42              ; $E700  85 42
    LDA $43              ; $E702  A5 43
    ADC #$00             ; $E704  69 00
    STA $43              ; $E706  85 43
    JMP B07_E6C8         ; $E708  4C C8 E6
B07_E70B:
    LDA #$01             ; $E70B  A9 01
    STA $03EA            ; $E70D  8D EA 03
    INY                  ; $E710  C8
    LDA ($42),Y          ; $E711  B1 42
    BEQ B07_E720         ; $E713  F0 0B
    LDA $5C              ; $E715  A5 5C
    BEQ B07_E71E         ; $E717  F0 05
    LDA #$01             ; $E719  A9 01
    STA $03E2            ; $E71B  8D E2 03
B07_E71E:
    LDA ($42),Y          ; $E71E  B1 42
B07_E720:
    STA $5C              ; $E720  85 5C
    INY                  ; $E722  C8
    LDA ($42),Y          ; $E723  B1 42
    STA $00              ; $E725  85 00
    CMP #$05             ; $E727  C9 05
    BCC B07_E751         ; $E729  90 26
    CMP #$09             ; $E72B  C9 09
    BCS B07_E751         ; $E72D  B0 22
    LDA $48              ; $E72F  A5 48
    CMP #$04             ; $E731  C9 04
    BNE B07_E751         ; $E733  D0 1C
    LDA $55              ; $E735  A5 55
    CMP #$02             ; $E737  C9 02
    BCC B07_E743         ; $E739  90 08
    CMP #$05             ; $E73B  C9 05
    BCC B07_E747         ; $E73D  90 08
    LDA #$02             ; $E73F  A9 02
    BNE B07_E745         ; $E741  D0 02
B07_E743:
    LDA #$04             ; $E743  A9 04
B07_E745:
    STA $55              ; $E745  85 55
B07_E747:
    LDA $5D              ; $E747  A5 5D
    CMP $55              ; $E749  C5 55
    BNE B07_E751         ; $E74B  D0 04
    LDA #$06             ; $E74D  A9 06
    STA $00              ; $E74F  85 00
B07_E751:
    LDA $00              ; $E751  A5 00
    STA $5D              ; $E753  85 5D
    INY                  ; $E755  C8
    LDA ($42),Y          ; $E756  B1 42
    STA $0480            ; $E758  8D 80 04
    INY                  ; $E75B  C8
    LDA ($42),Y          ; $E75C  B1 42
    STA $0460            ; $E75E  8D 60 04
    INY                  ; $E761  C8
    LDA ($42),Y          ; $E762  B1 42
    STA $50              ; $E764  85 50
    INY                  ; $E766  C8
    LDA ($42),Y          ; $E767  B1 42
    STA $4F              ; $E769  85 4F
    INY                  ; $E76B  C8
    LDA ($42),Y          ; $E76C  B1 42
    STA $52              ; $E76E  85 52
    INY                  ; $E770  C8
    LDA ($42),Y          ; $E771  B1 42
    STA $51              ; $E773  85 51
    LDA $5C              ; $E775  A5 5C
    BNE B07_E7A5         ; $E777  D0 2C
    LDA $5D              ; $E779  A5 5D
    CMP #$02             ; $E77B  C9 02
    BNE B07_E7BB         ; $E77D  D0 3C
    JSR B07_E7BB         ; $E77F  20 BB E7
    LDX #$05             ; $E782  A2 05
    LDA $0593            ; $E784  AD 93 05
    STA $0570,X          ; $E787  9D 70 05
    LDA $0594            ; $E78A  AD 94 05
    SEC                  ; $E78D  38
    SBC $4F              ; $E78E  E5 4F
    STA $0480,X          ; $E790  9D 80 04
    LDA $0595            ; $E793  AD 95 05
    SEC                  ; $E796  38
    SBC $51              ; $E797  E5 51
    STA $0460,X          ; $E799  9D 60 04
    JSR B07_CFA2         ; $E79C  20 A2 CF
    LDA #$C8             ; $E79F  A9 C8
    STA $0450,X          ; $E7A1  9D 50 04
    RTS                  ; $E7A4  60
B07_E7A5:
    LDY #$16             ; $E7A5  A0 16
    JSR B07_C792         ; $E7A7  20 92 C7
    CMP #$09             ; $E7AA  C9 09
    BEQ B07_E7B2         ; $E7AC  F0 04
    CMP #$0A             ; $E7AE  C9 0A
    BNE B07_E7BB         ; $E7B0  D0 09
B07_E7B2:
    LDY #$11             ; $E7B2  A0 11
    LDA #$06             ; $E7B4  A9 06
    JSR B07_D0F2         ; $E7B6  20 F2 D0
    BCS B07_E7C0         ; $E7B9  B0 05
B07_E7BB:
    LDA #$00             ; $E7BB  A9 00
    STA $0510            ; $E7BD  8D 10 05
B07_E7C0:
    LDA #$07             ; $E7C0  A9 07
    STA $03EE            ; $E7C2  8D EE 03
    LDA $03E2            ; $E7C5  AD E2 03
    BNE B07_E7CD         ; $E7C8  D0 03
    JSR B07_CEC0         ; $E7CA  20 C0 CE
B07_E7CD:
    JSR B07_D0C6         ; $E7CD  20 C6 D0
    JSR B07_D0B0         ; $E7D0  20 B0 D0
    JSR B07_EFBC         ; $E7D3  20 BC EF
    LDX #$01             ; $E7D6  A2 01
    JSR B07_EF3F         ; $E7D8  20 3F EF
    LDX #$00             ; $E7DB  A2 00
    JSR B07_EF89         ; $E7DD  20 89 EF
    LDA #$00             ; $E7E0  A9 00
    STA $0490            ; $E7E2  8D 90 04
    STA $0470            ; $E7E5  8D 70 04
    STA $0430            ; $E7E8  8D 30 04
    STA $0400            ; $E7EB  8D 00 04
    STA $0570            ; $E7EE  8D 70 05
    STA $0520            ; $E7F1  8D 20 05
    STA $0401            ; $E7F4  8D 01 04
    STA $6E              ; $E7F7  85 6E
    STA $58              ; $E7F9  85 58
    STA $AE              ; $E7FB  85 AE
    STA $B0              ; $E7FD  85 B0
    STA $7E              ; $E7FF  85 7E
    STA $88              ; $E801  85 88
    STA $8C              ; $E803  85 8C
    STA $9D              ; $E805  85 9D
    STA $9E              ; $E807  85 9E
    STA $C5              ; $E809  85 C5
    STA $C6              ; $E80B  85 C6
    STA $C7              ; $E80D  85 C7
    STA $03F7            ; $E80F  8D F7 03
    STA $03F8            ; $E812  8D F8 03
    STA $03F9            ; $E815  8D F9 03
    STA $03FA            ; $E818  8D FA 03
    STA $03E4            ; $E81B  8D E4 03
    STA $03E7            ; $E81E  8D E7 03
    STA $03EB            ; $E821  8D EB 03
    STA $A6              ; $E824  85 A6
    STA $B7              ; $E826  85 B7
    LDA #$01             ; $E828  A9 01
    STA $82              ; $E82A  85 82
    STA $0540            ; $E82C  8D 40 05
    LDA #$10             ; $E82F  A9 10
    STA $3D              ; $E831  85 3D
    LDA #$03             ; $E833  A9 03
    STA $34              ; $E835  85 34
    RTS                  ; $E837  60
B07_E838:
    LDA $5C              ; $E838  A5 5C
    BNE B07_E840         ; $E83A  D0 04
    LDA #$06             ; $E83C  A9 06
    BNE B07_E842         ; $E83E  D0 02
B07_E840:
    LDA $48              ; $E840  A5 48
B07_E842:
    ASL A                ; $E842  0A
    TAY                  ; $E843  A8
    LDA $E84F,Y          ; $E844  B9 4F E8
    STA $00              ; $E847  85 00
    LDA $E850,Y          ; $E849  B9 50 E8
    STA $01              ; $E84C  85 01
    RTS                  ; $E84E  60
    .byte $00, $EB, $75, $EB, $8E, $EB, $27, $EC, $CF, $ED, $63, $EE, $5D, $E8, $67, $E8 ; $E84F
    .byte $CB, $E8, $ED, $E8, $72, $E9, $C8, $EA, $00, $48, $78, $01, $03, $28, $18, $00 ; $E85F
    .byte $00, $00, $00, $00, $88, $A2, $01, $05, $30, $9C, $00, $00, $00, $C0, $01, $18 ; $E86F
    .byte $78, $01, $03, $C8, $18, $02, $00, $00, $00, $01, $48, $A8, $01, $02, $28, $18 ; $E87F
    .byte $00, $00, $00, $00, $02, $87, $28, $01, $00, $28, $18, $00, $00, $00, $00, $02 ; $E88F
    .byte $C8, $B8, $01, $00, $C8, $18, $03, $00, $00, $00, $03, $48, $54, $01, $01, $AA ; $E89F
    .byte $34, $02, $00, $00, $00, $03, $48, $A8, $01, $01, $28, $18, $00, $00, $00, $00 ; $E8AF
    .byte $03, $A8, $20, $01, $04, $2C, $8C, $00, $00, $00, $00, $FF, $00, $48, $54, $01 ; $E8BF
    .byte $00, $28, $5A, $00, $00, $00, $00, $00, $98, $78, $01, $00, $28, $9C, $00, $00 ; $E8CF
    .byte $01, $80, $01, $78, $3C, $01, $01, $60, $60, $00, $00, $01, $80, $FF, $00, $C8 ; $E8DF
    .byte $A0, $01, $00, $38, $8C, $00, $00, $00, $C0, $04, $C8, $80, $01, $01, $38, $8C ; $E8EF
    .byte $00, $00, $00, $00, $04, $28, $48, $01, $01, $C8, $24, $02, $00, $01, $80, $0C ; $E8FF
    .byte $A8, $30, $01, $05, $38, $8C, $01, $00, $00, $00, $0C, $68, $C8, $01, $05, $C8 ; $E90F
    .byte $18, $05, $00, $00, $C0, $0C, $88, $A0, $01, $06, $38, $8C, $00, $00, $01, $80 ; $E91F
    .byte $0D, $68, $D0, $01, $04, $38, $8C, $01, $00, $01, $80, $0E, $08, $D0, $01, $04 ; $E92F
    .byte $78, $4C, $05, $FE, $01, $80, $0F, $C8, $30, $01, $02, $38, $8C, $00, $00, $01 ; $E93F
    .byte $80, $10, $28, $60, $01, $02, $B8, $8C, $03, $00, $01, $80, $11, $48, $70, $01 ; $E94F
    .byte $03, $38, $8C, $00, $00, $01, $80, $11, $A8, $70, $01, $03, $B8, $8C, $03, $00 ; $E95F
    .byte $01, $80, $FF, $00, $28, $C8, $01, $09, $C8, $18, $00, $00, $00, $00, $00, $D8 ; $E96F
    .byte $58, $01, $0A, $48, $18, $00, $00, $00, $00, $01, $28, $C8, $01, $0E, $C8, $18 ; $E97F
    .byte $03, $00, $00, $00, $01, $88, $88, $01, $0F, $48, $18, $00, $00, $00, $00, $01 ; $E98F
    .byte $98, $48, $01, $10, $28, $18, $00, $00, $00, $00, $01, $D8, $58, $01, $0B, $C8 ; $E99F
    .byte $18, $01, $00, $00, $00, $01, $E8, $D8, $01, $0E, $28, $18, $00, $00, $00, $00 ; $E9AF
    .byte $02, $88, $D8, $01, $0D, $A8, $18, $01, $00, $00, $00, $03, $68, $A8, $01, $0D ; $E9BF
    .byte $28, $18, $00, $00, $00, $00, $03, $C8, $D8, $01, $0C, $C8, $18, $00, $00, $00 ; $E9CF
    .byte $00, $04, $38, $28, $01, $09, $28, $18, $00, $00, $00, $00, $06, $18, $28, $01 ; $E9DF
    .byte $0B, $28, $18, $00, $00, $00, $00, $07, $D8, $28, $01, $0C, $28, $18, $00, $00 ; $E9EF
    .byte $00, $00, $08, $48, $18, $01, $08, $C8, $18, $00, $00, $00, $00, $08, $48, $68 ; $E9FF
    .byte $01, $08, $28, $18, $00, $00, $00, $00, $08, $58, $D8, $01, $07, $C8, $18, $00 ; $EA0F
    .byte $00, $00, $00, $08, $A8, $B8, $01, $06, $C8, $18, $04, $00, $00, $00, $09, $48 ; $EA1F
    .byte $98, $01, $05, $48, $18, $00, $00, $00, $00, $09, $58, $C8, $01, $06, $28, $18 ; $EA2F
    .byte $00, $00, $00, $00, $0A, $68, $68, $01, $02, $A8, $18, $00, $00, $00, $00, $0A ; $EA3F
    .byte $78, $A8, $01, $02, $48, $18, $00, $00, $00, $00, $0A, $E8, $D8, $01, $01, $C8 ; $EA4F
    .byte $18, $04, $00, $00, $00, $0B, $28, $58, $01, $01, $28, $18, $00, $00, $00, $00 ; $EA5F
    .byte $0B, $98, $D8, $01, $00, $38, $8C, $05, $00, $01, $80, $0C, $48, $18, $01, $07 ; $EA6F
    .byte $28, $18, $00, $00, $00, $00, $0C, $98, $98, $01, $05, $C8, $18, $03, $00, $00 ; $EA7F
    .byte $00, $0D, $E8, $C8, $01, $04, $68, $18, $00, $00, $00, $00, $0E, $68, $16, $01 ; $EA8F
    .byte $03, $C8, $18, $00, $00, $00, $00, $0E, $68, $48, $01, $03, $28, $18, $00, $00 ; $EA9F
    .byte $00, $00, $0E, $38, $C8, $01, $04, $28, $18, $00, $00, $00, $00, $0F, $78, $98 ; $EAAF
    .byte $01, $00, $38, $8C, $00, $00, $01, $80, $FF, $00, $78, $D2, $01, $01, $2C, $8C ; $EABF
    .byte $00, $00, $00, $C0, $02, $48, $88, $01, $02, $48, $0C, $00, $00, $00, $00, $04 ; $EACF
    .byte $78, $B2, $01, $00, $2E, $8C, $00, $00, $01, $80, $06, $68, $48, $01, $04, $6A ; $EADF
    .byte $0C, $00, $00, $00, $00, $08, $48, $48, $01, $03, $48, $0C, $00, $00, $00, $00 ; $EAEF
    .byte $FF, $0C, $EB, $23, $EB, $3A, $EB, $46, $EB, $5D, $EB, $69, $EB, $00, $28, $18 ; $EAFF
    .byte $00, $00, $80, $78, $00, $10, $00, $B0, $03, $C8, $1A, $00, $00, $80, $B8, $00 ; $EB0F
    .byte $50, $01, $00, $FF, $00, $28, $10, $00, $00, $80, $A8, $00, $D0, $01, $00, $02 ; $EB1F
    .byte $AA, $3E, $00, $00, $80, $78, $00, $D8, $00, $C8, $FF, $00, $28, $14, $00, $00 ; $EB2F
    .byte $80, $78, $00, $D8, $00, $30, $FF, $00, $28, $18, $00, $00, $34, $74, $00, $00 ; $EB3F
    .byte $00, $00, $02, $C8, $18, $00, $00, $80, $78, $00, $A0, $00, $04, $FF, $00, $28 ; $EB4F
    .byte $88, $00, $00, $A8, $78, $01, $00, $00, $B0, $FF, $02, $28, $98, $00, $00, $80 ; $EB5F
    .byte $78, $00, $08, $00, $30, $FF, $77, $EB, $00, $28, $58, $00, $01, $58, $58, $00 ; $EB6F
    .byte $00, $00, $00, $06, $28, $A8, $00, $01, $80, $90, $00, $18, $00, $00, $FF, $9C ; $EB7F
    .byte $EB, $A8, $EB, $BF, $EB, $D6, $EB, $ED, $EB, $04, $EC, $1B, $EC, $03, $38, $88 ; $EB8F
    .byte $00, $02, $80, $78, $00, $48, $00, $2C, $FF, $00, $38, $88, $00, $02, $C8, $78 ; $EB9F
    .byte $04, $00, $00, $0C, $08, $C8, $18, $00, $02, $80, $4C, $03, $B0, $00, $00, $FF ; $EBAF
    .byte $08, $38, $88, $00, $02, $80, $78, $00, $48, $02, $B8, $0B, $B8, $88, $00, $02 ; $EBBF
    .byte $80, $78, $00, $A8, $02, $E8, $FF, $08, $38, $88, $00, $02, $80, $78, $01, $C8 ; $EBCF
    .byte $02, $F8, $0B, $B8, $88, $00, $02, $80, $78, $02, $27, $02, $F8, $FF, $0F, $38 ; $EBDF
    .byte $88, $00, $02, $80, $78, $02, $E8, $02, $5C, $14, $78, $48, $00, $02, $80, $78 ; $EBEF
    .byte $03, $88, $02, $5C, $FF, $01, $38, $88, $00, $02, $80, $78, $02, $28, $01, $BC ; $EBFF
    .byte $0B, $C8, $18, $00, $02, $80, $78, $01, $E0, $02, $58, $FF, $04, $38, $88, $00 ; $EC0F
    .byte $02, $80, $78, $02, $08, $02, $2C, $FF, $49, $EC, $60, $EC, $77, $EC, $8E, $EC ; $EC1F
    .byte $A5, $EC, $BC, $EC, $D3, $EC, $EA, $EC, $01, $ED, $18, $ED, $2F, $ED, $3B, $ED ; $EC2F
    .byte $52, $ED, $69, $ED, $80, $ED, $97, $ED, $B9, $ED, $0C, $38, $88, $00, $03, $78 ; $EC3F
    .byte $AC, $03, $00, $03, $00, $11, $38, $88, $00, $03, $98, $78, $03, $00, $02, $74 ; $EC4F
    .byte $FF, $00, $28, $18, $00, $03, $80, $78, $02, $A8, $01, $F0, $04, $C8, $18, $00 ; $EC5F
    .byte $03, $80, $78, $02, $68, $02, $70, $FF, $00, $48, $18, $00, $03, $80, $78, $01 ; $EC6F
    .byte $F8, $02, $40, $00, $A8, $18, $00, $03, $80, $78, $01, $E8, $02, $00, $FF, $00 ; $EC7F
    .byte $C8, $18, $00, $03, $80, $78, $01, $E8, $02, $94, $00, $28, $18, $00, $03, $80 ; $EC8F
    .byte $78, $01, $E8, $02, $E0, $FF, $00, $28, $18, $00, $03, $80, $D8, $01, $B8, $03 ; $EC9F
    .byte $00, $00, $68, $18, $00, $03, $80, $D8, $01, $68, $03, $00, $FF, $00, $48, $18 ; $ECAF
    .byte $00, $03, $80, $78, $00, $C8, $02, $18, $03, $C8, $18, $00, $03, $80, $A8, $00 ; $ECBF
    .byte $18, $03, $00, $FF, $00, $28, $18, $00, $03, $80, $78, $00, $D8, $02, $60, $04 ; $ECCF
    .byte $C8, $18, $00, $03, $80, $78, $00, $28, $02, $50, $FF, $00, $28, $18, $00, $03 ; $ECDF
    .byte $48, $78, $00, $00, $02, $B4, $00, $C8, $18, $00, $03, $60, $78, $00, $00, $02 ; $ECEF
    .byte $52, $FF, $00, $28, $18, $00, $03, $48, $78, $00, $00, $02, $00, $00, $C8, $10 ; $ECFF
    .byte $00, $03, $48, $78, $00, $00, $01, $94, $FF, $00, $28, $18, $00, $03, $38, $78 ; $ED0F
    .byte $00, $00, $00, $C4, $00, $C8, $18, $00, $03, $28, $78, $00, $00, $00, $60, $FF ; $ED1F
    .byte $00, $48, $18, $00, $03, $80, $68, $00, $58, $00, $00, $FF, $00, $28, $18, $00 ; $ED2F
    .byte $03, $80, $78, $01, $98, $00, $C0, $01, $C8, $18, $00, $03, $80, $68, $01, $58 ; $ED3F
    .byte $00, $00, $FF, $00, $28, $18, $00, $03, $D8, $78, $03, $00, $00, $C0, $00, $C8 ; $ED4F
    .byte $18, $00, $03, $C8, $78, $03, $00, $00, $70, $FF, $00, $28, $18, $00, $03, $80 ; $ED5F
    .byte $78, $02, $E8, $00, $40, $01, $A8, $18, $00, $03, $80, $78, $02, $08, $00, $70 ; $ED6F
    .byte $FF, $00, $28, $18, $00, $03, $80, $78, $01, $68, $00, $70, $03, $C8, $18, $00 ; $ED7F
    .byte $03, $80, $78, $00, $A8, $00, $60, $FF, $00, $48, $18, $00, $03, $80, $78, $01 ; $ED8F
    .byte $08, $00, $10, $01, $C8, $18, $01, $0F, $C8, $A8, $01, $00, $00, $00, $01, $C8 ; $ED9F
    .byte $A8, $01, $0F, $C8, $18, $01, $00, $00, $00, $FF, $00, $28, $18, $00, $03, $80 ; $EDAF
    .byte $6C, $01, $18, $00, $00, $0E, $88, $90, $01, $11, $1C, $18, $00, $00, $00, $00 ; $EDBF
    .byte $E1, $ED, $ED, $ED, $F9, $ED, $10, $EE, $27, $EE, $3E, $EE, $62, $EE, $4A, $EE ; $EDCF
    .byte $56, $EE, $04, $2E, $8C, $00, $04, $80, $78, $00, $F8, $01, $3A, $FF, $03, $2C ; $EDDF
    .byte $8C, $00, $04, $78, $78, $00, $00, $00, $5A, $FF, $00, $48, $18, $00, $04, $80 ; $EDEF
    .byte $78, $01, $C8, $00, $1A, $0D, $70, $90, $01, $05, $90, $8C, $00, $00, $00, $00 ; $EDFF
    .byte $FF, $00, $48, $18, $00, $04, $80, $78, $01, $C6, $01, $DA, $0E, $70, $90, $01 ; $EE0F
    .byte $07, $90, $8C, $00, $00, $00, $00, $FF, $00, $68, $18, $00, $04, $68, $78, $00 ; $EE1F
    .byte $00, $01, $DA, $13, $70, $90, $01, $08, $90, $8C, $00, $00, $00, $00, $FF, $00 ; $EE2F
    .byte $90, $8C, $01, $02, $70, $8C, $01, $00, $02, $40, $FF, $00, $90, $8C, $01, $03 ; $EE3F
    .byte $70, $8C, $04, $00, $01, $80, $FF, $00, $90, $8C, $01, $04, $70, $8C, $04, $00 ; $EE4F
    .byte $02, $40, $FF, $FF, $6B, $EE, $82, $EE, $A4, $EE, $BA, $EE, $08, $60, $6C, $01 ; $EE5F
    .byte $01, $A2, $6C, $03, $00, $00, $00, $1C, $60, $6C, $01, $01, $A2, $6C, $02, $00 ; $EE6F
    .byte $02, $40, $FF, $03, $A2, $6C, $01, $00, $60, $6C, $01, $00, $00, $C0, $0E, $A2 ; $EE7F
    .byte $6C, $01, $00, $60, $6C, $00, $00, $03, $00, $14, $5E, $8C, $01, $02, $60, $8C ; $EE8F
    .byte $00, $00, $00, $C0, $FF, $09, $60, $8C, $01, $01, $5E, $8C, $00, $00, $03, $C0 ; $EE9F
    .byte $07, $5E, $8C, $01, $03, $80, $20, $00, $00, $00, $00, $FF ; $EEAF
B07_EEBB:
    LDX #$02             ; $EEBB  A2 02
    LDA #$04             ; $EEBD  A9 04
    BNE B07_EED7         ; $EEBF  D0 16
    LDX #$0E             ; $EEC1  A2 0E
    LDA #$0F             ; $EEC3  A9 0F
    BNE B07_EED7         ; $EEC5  D0 10
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
    .byte $A2, $01, $D0, $0F, $A2, $05, $D0, $02, $A2, $00 ; $EF35
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
B07_EF89:
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
B07_F089:
    LDA $5D              ; $F089  A5 5D
    ASL A                ; $F08B  0A
    TAY                  ; $F08C  A8
    LDA ($00),Y          ; $F08D  B1 00
    STA $08              ; $F08F  85 08
    INY                  ; $F091  C8
    LDA ($00),Y          ; $F092  B1 00
    STA $09              ; $F094  85 09
    LDA $5C              ; $F096  A5 5C
    BNE B07_F09E         ; $F098  D0 04
    LDA #$06             ; $F09A  A9 06
    BNE B07_F0A0         ; $F09C  D0 02
B07_F09E:
    LDA $48              ; $F09E  A5 48
B07_F0A0:
    ASL A                ; $F0A0  0A
    TAY                  ; $F0A1  A8
    LDA $F120,Y          ; $F0A2  B9 20 F1
    STA $00              ; $F0A5  85 00
    LDA $F121,Y          ; $F0A7  B9 21 F1
    STA $01              ; $F0AA  85 01
    LDY $5D              ; $F0AC  A4 5D
    LDA ($00),Y          ; $F0AE  B1 00
    STA $10              ; $F0B0  85 10
    LDA $4F              ; $F0B2  A5 4F
    CLC                  ; $F0B4  18
    ADC $04              ; $F0B5  65 04
    STA $AC              ; $F0B7  85 AC
    LDA $50              ; $F0B9  A5 50
    ADC #$00             ; $F0BB  69 00
    STA $00              ; $F0BD  85 00
    LDA $5C              ; $F0BF  A5 5C
    BNE B07_F0D5         ; $F0C1  D0 12
    LDA $68              ; $F0C3  A5 68
    CLC                  ; $F0C5  18
    ADC $05              ; $F0C6  65 05
    STA $AD              ; $F0C8  85 AD
    LDA $69              ; $F0CA  A5 69
    ADC #$00             ; $F0CC  69 00
    BNE B07_F0FE         ; $F0CE  D0 2E
    LDA $00              ; $F0D0  A5 00
    JMP B07_F10A         ; $F0D2  4C 0A F1
B07_F0D5:
    LDA $68              ; $F0D5  A5 68
    CLC                  ; $F0D7  18
    ADC $05              ; $F0D8  65 05
    BCC B07_F0E2         ; $F0DA  90 06
    CLC                  ; $F0DC  18
    ADC #$40             ; $F0DD  69 40
    JMP B07_F0E9         ; $F0DF  4C E9 F0
B07_F0E2:
    CMP #$C0             ; $F0E2  C9 C0
    BCC B07_F0F3         ; $F0E4  90 0D
    SEC                  ; $F0E6  38
    SBC #$C0             ; $F0E7  E9 C0
B07_F0E9:
    STA $AD              ; $F0E9  85 AD
    LDA $69              ; $F0EB  A5 69
    CLC                  ; $F0ED  18
    ADC #$01             ; $F0EE  69 01
    JMP B07_F0FE         ; $F0F0  4C FE F0
B07_F0F3:
    STA $AD              ; $F0F3  85 AD
    LDA $69              ; $F0F5  A5 69
    BNE B07_F0FE         ; $F0F7  D0 05
    LDA $00              ; $F0F9  A5 00
    JMP B07_F10A         ; $F0FB  4C 0A F1
B07_F0FE:
    TAY                  ; $F0FE  A8
    LDA #$00             ; $F0FF  A9 00
    CLC                  ; $F101  18
B07_F102:
    ADC $10              ; $F102  65 10
    DEY                  ; $F104  88
    BNE B07_F102         ; $F105  D0 FB
    CLC                  ; $F107  18
    ADC $00              ; $F108  65 00
B07_F10A:
    STA $7F              ; $F10A  85 7F
    ASL A                ; $F10C  0A
    TAY                  ; $F10D  A8
    LDA ($08),Y          ; $F10E  B1 08
    STA $42              ; $F110  85 42
    INY                  ; $F112  C8
    LDA ($08),Y          ; $F113  B1 08
    STA $43              ; $F115  85 43
    RTS                  ; $F117  60
    .byte $01, $02, $04, $08, $10, $20, $40, $80, $33, $F1, $39, $F1, $3B, $F1, $42, $F1 ; $F118
    .byte $54, $F1, $5D, $F1, $2E, $F1, $02, $02, $05, $04, $03, $04, $03, $04, $03, $02 ; $F128
    .byte $02, $03, $09, $03, $03, $04, $04, $07, $06, $02, $06, $05, $01, $01, $01, $04 ; $F138
    .byte $05, $01, $01, $01, $02, $02, $01, $02, $04, $02, $03, $01, $02, $03, $04, $05 ; $F148
    .byte $05, $01, $03, $01, $01, $07, $04, $09, $01 ; $F158
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
    .byte $84, $09, $85, $08, $A9, $00, $38, $E5, $08, $A4, $09 ; $F1BD
B07_F1C8:
    JSR B07_F072         ; $F1C8  20 72 F0
    JSR B07_F1EF         ; $F1CB  20 EF F1
    BEQ B07_F1DE         ; $F1CE  F0 0E
    LDY $09              ; $F1D0  A4 09
    LDA $08              ; $F1D2  A5 08
    JSR B07_F072         ; $F1D4  20 72 F0
    JSR B07_F1EF         ; $F1D7  20 EF F1
    BEQ B07_F1DE         ; $F1DA  F0 02
    CLC                  ; $F1DC  18
    RTS                  ; $F1DD  60
B07_F1DE:
    SEC                  ; $F1DE  38
    RTS                  ; $F1DF  60
    .byte $84, $09, $85, $08, $A9, $00, $38, $E5, $09, $A8, $A5, $08, $4C, $C8, $F1 ; $F1E0
B07_F1EF:
    CMP #$02             ; $F1EF  C9 02
    BEQ B07_F20A         ; $F1F1  F0 17
    CMP #$06             ; $F1F3  C9 06
    BEQ B07_F1FE         ; $F1F5  F0 07
    CMP #$04             ; $F1F7  C9 04
    BEQ B07_F1FD         ; $F1F9  F0 02
    CMP #$0C             ; $F1FB  C9 0C
B07_F1FD:
    RTS                  ; $F1FD  60
B07_F1FE:
    LDY $0606            ; $F1FE  AC 06 06
    BNE B07_F206         ; $F201  D0 03
    LDY #$01             ; $F203  A0 01
    RTS                  ; $F205  60
B07_F206:
    LDY #$00             ; $F206  A0 00
    BEQ B07_F1DE         ; $F208  F0 D4
B07_F20A:
    LDY $48              ; $F20A  A4 48
    DEY                  ; $F20C  88
    BNE B07_F218         ; $F20D  D0 09
    LDY $4F              ; $F20F  A4 4F
    BPL B07_F218         ; $F211  10 05
    LDA #$0D             ; $F213  A9 0D
    STA $B5              ; $F215  85 B5
    RTS                  ; $F217  60
B07_F218:
    LDY $0606            ; $F218  AC 06 06
    BNE B07_F206         ; $F21B  D0 E9
    JMP B07_E68A         ; $F21D  4C 8A E6
    .byte $85, $00, $29, $80, $D0, $03, $4C, $D3, $F2, $A5, $00, $29, $7F, $0A, $A8, $B9 ; $F220
    .byte $D0, $F3, $85, $08, $C8, $B9, $D0, $F3, $85, $09, $AD, $CA, $03, $D0, $4A, $A5 ; $F230
    .byte $22, $C9, $38, $90, $03, $4C, $CA, $F2, $AA, $A9, $01, $8D, $CA, $03, $A0, $00 ; $F240
    .byte $8C, $CC, $03, $20, $81, $F2, $20, $81, $F2, $8D, $CD, $03, $20, $81, $F2, $8D ; $F250
    .byte $CE, $03, $20, $81, $F2, $8D, $D3, $03, $86, $22, $8C, $CC, $03, $18, $60, $A9 ; $F260
    .byte $20, $18, $6D, $CE, $03, $8D, $CE, $03, $A9, $00, $6D, $CD, $03, $8D, $CD, $03 ; $F270
    .byte $60, $B1, $08, $9D, $00, $03, $E8, $C8, $60, $A5, $22, $C9, $38, $B0, $3B, $AC ; $F280
    .byte $CC, $03, $B1, $08, $85, $0B, $C8, $B1, $08, $85, $0C, $AD, $CE, $03, $C5, $0C ; $F290
    .byte $90, $07, $AD, $CD, $03, $C5, $0B, $B0, $23, $A0, $00, $A6, $22, $20, $81, $F2 ; $F2A0
    .byte $AD, $CD, $03, $9D, $00, $03, $E8, $AD, $CE, $03, $9D, $00, $03, $E8, $AD, $D3 ; $F2B0
    .byte $03, $9D, $00, $03, $E8, $86, $22, $20, $6F, $F2, $18, $60, $38, $A9, $00, $8D ; $F2C0
    .byte $CA, $03, $60 ; $F2D0
B07_F2D3:
    LDA $00              ; $F2D3  A5 00
    ASL A                ; $F2D5  0A
    TAY                  ; $F2D6  A8
    LDA $F3D8,Y          ; $F2D7  B9 D8 F3
    STA $08              ; $F2DA  85 08
    INY                  ; $F2DC  C8
    LDA $F3D8,Y          ; $F2DD  B9 D8 F3
    STA $09              ; $F2E0  85 09
    LDA $03CA            ; $F2E2  AD CA 03
    BNE B07_F30B         ; $F2E5  D0 24
    LDA #$01             ; $F2E7  A9 01
    STA $03CA            ; $F2E9  8D CA 03
    LDY #$00             ; $F2EC  A0 00
    STY $03CC            ; $F2EE  8C CC 03
    STY $03D3            ; $F2F1  8C D3 03
    LDA ($08),Y          ; $F2F4  B1 08
    STA $03CD            ; $F2F6  8D CD 03
    INY                  ; $F2F9  C8
    LDA ($08),Y          ; $F2FA  B1 08
    STA $03CE            ; $F2FC  8D CE 03
    INY                  ; $F2FF  C8
    STY $03CC            ; $F300  8C CC 03
    STY $03D3            ; $F303  8C D3 03
    LDA #$01             ; $F306  A9 01
    STA $03CB            ; $F308  8D CB 03
B07_F30B:
    DEC $03CB            ; $F30B  CE CB 03
    BEQ B07_F313         ; $F30E  F0 03
    JMP B07_F3C7         ; $F310  4C C7 F3
B07_F313:
    LDA #$04             ; $F313  A9 04
    STA $03CB            ; $F315  8D CB 03
    LDY $03CC            ; $F318  AC CC 03
    LDA ($08),Y          ; $F31B  B1 08
    STA $0A              ; $F31D  85 0A
    CMP #$FF             ; $F31F  C9 FF
    BNE B07_F326         ; $F321  D0 03
    JMP B07_F3C9         ; $F323  4C C9 F3
B07_F326:
    CMP #$FE             ; $F326  C9 FE
    BNE B07_F34B         ; $F328  D0 21
    CLC                  ; $F32A  18
    INC $03CC            ; $F32B  EE CC 03
    LDY $03CC            ; $F32E  AC CC 03
    LDA ($08),Y          ; $F331  B1 08
    STA $03CD            ; $F333  8D CD 03
    INY                  ; $F336  C8
    LDA ($08),Y          ; $F337  B1 08
    STA $03CE            ; $F339  8D CE 03
    INY                  ; $F33C  C8
    STY $03CC            ; $F33D  8C CC 03
    LDA #$02             ; $F340  A9 02
    STA $03D3            ; $F342  8D D3 03
    LDA #$01             ; $F345  A9 01
    STA $03CB            ; $F347  8D CB 03
    RTS                  ; $F34A  60
B07_F34B:
    LDA $22              ; $F34B  A5 22
    TAY                  ; $F34D  A8
    CMP #$38             ; $F34E  C9 38
    BCS B07_F3C2         ; $F350  B0 70
    LDA #$01             ; $F352  A9 01
    STA $0300,Y          ; $F354  99 00 03
    INY                  ; $F357  C8
    LDA $03CD            ; $F358  AD CD 03
    STA $0300,Y          ; $F35B  99 00 03
    INY                  ; $F35E  C8
    LDA $03CE            ; $F35F  AD CE 03
    CLC                  ; $F362  18
    ADC $03D3            ; $F363  6D D3 03
    STA $0300,Y          ; $F366  99 00 03
    INY                  ; $F369  C8
    LDA $0A              ; $F36A  A5 0A
    AND #$3F             ; $F36C  29 3F
    STA $0300,Y          ; $F36E  99 00 03
    INY                  ; $F371  C8
    LDA $0A              ; $F372  A5 0A
    AND #$80             ; $F374  29 80
    BEQ B07_F3AF         ; $F376  F0 37
    LDA #$01             ; $F378  A9 01
    STA $0300,Y          ; $F37A  99 00 03
    INY                  ; $F37D  C8
    LDA $03CD            ; $F37E  AD CD 03
    STA $0300,Y          ; $F381  99 00 03
    INY                  ; $F384  C8
    LDA $03CE            ; $F385  AD CE 03
    CLC                  ; $F388  18
    ADC $03D3            ; $F389  6D D3 03
    SEC                  ; $F38C  38
    SBC #$20             ; $F38D  E9 20
    STA $0300,Y          ; $F38F  99 00 03
    BCS B07_F39D         ; $F392  B0 09
    LDA $02FF,Y          ; $F394  B9 FF 02
    SEC                  ; $F397  38
    SBC #$01             ; $F398  E9 01
    STA $02FF,Y          ; $F39A  99 FF 02
B07_F39D:
    INY                  ; $F39D  C8
    LDA $0A              ; $F39E  A5 0A
    AND #$40             ; $F3A0  29 40
    BEQ B07_F3A9         ; $F3A2  F0 05
    LDA #$3E             ; $F3A4  A9 3E
    JMP B07_F3AB         ; $F3A6  4C AB F3
B07_F3A9:
    LDA #$30             ; $F3A9  A9 30
B07_F3AB:
    STA $0300,Y          ; $F3AB  99 00 03
    INY                  ; $F3AE  C8
B07_F3AF:
    INC $03CC            ; $F3AF  EE CC 03
    INC $03D3            ; $F3B2  EE D3 03
    STY $22              ; $F3B5  84 22
    LDA $0A              ; $F3B7  A5 0A
    BEQ B07_F3C0         ; $F3B9  F0 05
    LDA #$38             ; $F3BB  A9 38
    JSR B07_CEF0         ; $F3BD  20 F0 CE
B07_F3C0:
    CLC                  ; $F3C0  18
    RTS                  ; $F3C1  60
B07_F3C2:
    LDA #$01             ; $F3C2  A9 01
    STA $03CB            ; $F3C4  8D CB 03
B07_F3C7:
    CLC                  ; $F3C7  18
    RTS                  ; $F3C8  60
B07_F3C9:
    SEC                  ; $F3C9  38
    LDA #$00             ; $F3CA  A9 00
    STA $03CA            ; $F3CC  8D CA 03
    RTS                  ; $F3CF  60
    .byte $D2, $F3, $A0, $22, $C0, $00, $23, $C0, $E0, $F3, $0C, $F4, $39, $F4, $5C, $F4 ; $F3D0
    .byte $22, $E2, $23, $17, $18, $22, $00, $18, $22, $00, $22, $17, $21, $14, $13, $13 ; $F3E0
    .byte $14, $21, $0B, $FE, $23, $22, $1B, $18, $22, $23, $14, $1D, $00, $23, $1E, $00 ; $F3F0
    .byte $1C, $14, $2D, $23, $24, $21, $23, $1B, $14, $22, $0B, $FF, $22, $E2, $26, $14 ; $F400
    .byte $00, $17, $10, $25, $14, $00, $23, $10, $1A, $14, $1D, $00, $22, $1F, $1B, $18 ; $F410
    .byte $1D, $23, $14, $21, $0B, $FE, $23, $22, $23, $1E, $00, $16, $14, $23, $00, $17 ; $F420
    .byte $18, $1C, $00, $11, $10, $12, $1A, $2D, $FF, $22, $E2, $28, $1E, $24, $00, $1C ; $F430
    .byte $24, $22, $23, $00, $13, $14, $15, $14, $10, $23, $FE, $23, $22, $23, $17, $14 ; $F440
    .byte $00, $15, $1E, $1E, $23, $00, $12, $1B, $10, $1D, $0B, $FF, $22, $E2, $26, $14 ; $F450
    .byte $2A, $21, $14, $00, $26, $10, $18, $23, $18, $1D, $16, $00, $15, $1E, $21, $00 ; $F460
    .byte $28, $1E, $24, $0B, $FE, $23, $22, $17, $10, $2D, $17, $10, $2D, $17, $10, $2C ; $F470
    .byte $FF ; $F480
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
    .byte $F0, $03, $4C, $48, $EF ; $FD76
B07_FD7B:
    LDA $0480,X          ; $FD7B  BD 80 04
    CLC                  ; $FD7E  18
    ADC #$0A             ; $FD7F  69 0A
    CMP #$11             ; $FD81  C9 11
    BCC B07_FD9A         ; $FD83  90 15
    LDA $0460,X          ; $FD85  BD 60 04
    LDY $5C              ; $FD88  A4 5C
    BEQ B07_FD94         ; $FD8A  F0 08
    ADC #$3F             ; $FD8C  69 3F
    CMP #$44             ; $FD8E  C9 44
    BCC B07_FD9A         ; $FD90  90 08
B07_FD92:
    CLC                  ; $FD92  18
    RTS                  ; $FD93  60
B07_FD94:
    ADC #$07             ; $FD94  69 07
    CMP #$10             ; $FD96  C9 10
    BCS B07_FD92         ; $FD98  B0 F8
B07_FD9A:
    JSR B07_EF48         ; $FD9A  20 48 EF
    SEC                  ; $FD9D  38
    RTS                  ; $FD9E  60
    .byte $BD, $10, $04, $C9, $01, $F0, $05, $A9, $16, $20, $F0, $CE, $BD, $50, $04, $29 ; $FD9F
    .byte $01, $F0, $08, $A9, $28, $20, $16, $F0, $4C, $BF, $FD, $A9, $28, $20, $26, $F0 ; $FDAF
    .byte $BD, $30, $06, $F0, $04, $DE, $30, $06, $60, $AD, $80, $04, $38, $FD, $80, $04 ; $FDBF
    .byte $B0, $03, $20, $D8, $8F, $C9, $0C, $B0, $32, $AD, $60, $04, $38, $FD, $60, $04 ; $FDCF
    .byte $B0, $03, $20, $D8, $8F, $C9, $18, $B0, $22, $A4, $67, $B9, $73, $00, $D0, $0B ; $FDDF
    .byte $A9, $03, $99, $73, $00, $A9, $01, $85, $5B, $D0, $04, $C9, $03, $D0, $09, $B9 ; $FDEF
    .byte $A8, $00, $18, $69, $01, $99, $A8, $00, $4C, $48, $EF, $20, $7B, $FD, $60, $BD ; $FDFF
    .byte $40, $04, $0A, $A8, $B9, $3D, $88, $9D, $60, $05, $B9, $3E, $88, $9D, $70, $05 ; $FE0F
    .byte $0A, $A8, $B9, $11, $8E, $85, $00, $B9, $12, $8E, $85, $01, $A9, $00, $9D, $10 ; $FE1F
    .byte $04, $A8, $B1, $00, $9D, $00, $04, $A9, $01, $9D, $20, $04, $A9, $C2, $9D, $50 ; $FE2F
    .byte $04, $60, $0F, $00, $FC, $08, $BD, $50, $06, $20, $8D, $B9, $90, $68, $98, $48 ; $FE3F
    .byte $B9, $60, $05, $A8, $A5, $6E, $39, $18, $F1, $D0, $0C, $68, $A8, $A9, $FF, $99 ; $FE4F
    .byte $30, $06, $A9, $00, $4C, $86, $B9, $68, $A8, $8A, $48, $98, $AA, $20, $48, $EF ; $FE5F
    .byte $68, $AA, $4C, $C7, $EF, $A9, $02, $D0, $06, $A9, $01, $D0, $02, $A9, $00, $0A ; $FE6F
    .byte $A8, $B9, $B6, $FE, $85, $00, $B9, $B7, $FE, $85, $01, $DE, $90, $06, $10, $26 ; $FE7F
    .byte $8A, $48, $BD, $88, $06, $A8, $B1, $00, $C9, $FF, $D0, $07, $A9, $00, $9D, $88 ; $FE8F
    .byte $06, $F0, $EF, $B1, $00, $9D, $90, $06, $FE, $88, $06, $FE, $88, $06, $C8, $B1 ; $FE9F
    .byte $00, $20, $2E, $F7, $68, $AA, $60, $BC, $FE, $C3, $FE, $D0, $FE, $02, $07, $02 ; $FEAF
    .byte $08, $02, $09, $FF, $06, $0C, $06, $0D, $06, $0E, $06, $0E, $06, $0D, $06, $0C ; $FEBF
    .byte $FF, $01, $17, $01, $16, $01, $15, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FECF
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FEDF
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FEEF
    .byte $FF, $AA, $AA, $AA, $AA, $AA, $AF, $F0, $9E, $9F, $F0, $06, $AE, $7C, $1B, $98 ; $FEFF
    .byte $F0, $00, $03, $00, $0C, $01, $CE, $01, $80, $00, $00, $00, $00, $00, $0F, $1F ; $FF0F
    .byte $FF, $FB, $F3, $CF, $F3, $EF, $DE, $B8, $F9, $A6, $A2, $24, $39, $81, $43, $80 ; $FF1F
    .byte $86, $19, $02, $38, $51, $87, $86, $15, $39, $8C, $A6, $55, $4D, $16, $8C, $A3 ; $FF2F
    .byte $45, $45, $90, $CA, $56, $22, $52, $70, $D6, $53, $16, $D3, $54, $D7, $4B, $37 ; $FF3F
    .byte $4B, $5B, $6B, $56, $CE, $B5, $5B, $5D, $59, $B6, $D5, $AB, $D6, $B5, $D7, $6B ; $FF4F
    .byte $6D, $AD, $AE, $B6, $D6, $B5, $B5, $AA, $D6, $AA, $AC, $AA, $A9, $54, $A9, $94 ; $FF5F
    .byte $A4, $A9, $4A, $4A, $8A, $92, $54, $A5, $49, $29, $4A, $54, $A5, $29, $52, $A5 ; $FF6F
    .byte $4A, $A5, $54, $A9, $54, $AA, $95, $2A, $AA, $94, $95, $2A, $AA, $55, $55, $2A ; $FF7F
    .byte $56, $66, $AA, $9A, $AA, $B5, $5A, $AD, $AB, $5A, $B5, $6B, $6B, $6B, $5A, $B5 ; $FF8F
    .byte $AA, $B5, $56, $AA, $D5, $55, $56, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $95, $55 ; $FF9F
    .byte $55, $B5, $56, $AA, $D5, $55, $56, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $95, $55 ; $FFAF
    .byte $55, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FFBF
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $FFCF
RESET_HANDLER:
    CLD                  ; $FFD8  D8
    SEI                  ; $FFD9  78
    INC $FFFF            ; $FFDA  EE FF FF
    JMP B07_C310         ; $FFDD  4C 10 C3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $53, $54, $49, $4E, $47, $45, $52 ; $FFE0
    .byte $00, $00, $00, $00, $38, $02, $01, $06, $A4, $1B, $A3, $C3, $D8, $FF, $12, $C4 ; $FFF0
