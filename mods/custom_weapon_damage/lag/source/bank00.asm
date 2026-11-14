; TMNT NES 1989, MMC1 PRG bank 00
; CPU window $8000-$BFFF; 16KB bank, fixed byte size.
; Experimental static recovery + existing entry points; byte-exact, NOT fully validated.
; WARNING: statically discovered code is incomplete; data may contain code.
; Edit operations/operands in place; preserve lengths for safe roundtrips.
.org $8000

    .byte $00 ; $8000
    LDA $66              ; $8001  A5 66
    BMI B00_8054         ; $8003  30 4F
    LDY #$00             ; $8005  A0 00
    STY $64              ; $8007  84 64
    STY $65              ; $8009  84 65
B00_800B:
    BIT $2002            ; $800B  2C 02 20
    BVS B00_800B         ; $800E  70 FB
    LDA $03C2            ; $8010  AD C2 03
    BEQ B00_801B         ; $8013  F0 06
    LDA $03E9            ; $8015  AD E9 03
    BNE B00_801B         ; $8018  D0 01
    RTS                  ; $801A  60
B00_801B:
    LDA $5C              ; $801B  A5 5C
    BEQ B00_8054         ; $801D  F0 35
    LDA $34              ; $801F  A5 34
    CMP #$06             ; $8021  C9 06
    BNE B00_8054         ; $8023  D0 2F
    LDX $29              ; $8025  A6 29
    LDY $2A              ; $8027  A4 2A
B00_8029:
    BIT $66              ; $8029  24 66
    BMI B00_8054         ; $802B  30 27
    BIT $2002            ; $802D  2C 02 20
    BVC B00_8029         ; $8030  50 F7
    LDA #$80             ; $8032  A9 80
    STA $66              ; $8034  85 66
    STX $2006            ; $8036  8E 06 20
    STY $2006            ; $8039  8C 06 20
    LDA $2002            ; $803C  AD 02 20
    LDA #$00             ; $803F  A9 00
    STA $2005            ; $8041  8D 05 20
    STA $2005            ; $8044  8D 05 20
    LDA $A2              ; $8047  A5 A2
    BPL B00_8054         ; $8049  10 09
    LDA $FF              ; $804B  A5 FF
    AND #$FE             ; $804D  29 FE
    STA $FF              ; $804F  85 FF
    STA $2000            ; $8051  8D 00 20
B00_8054:
    RTS                  ; $8054  60
    .byte $AD, $C2, $03, $F0, $01, $60, $A4, $3F, $F0, $03, $4C, $F0, $81, $A5, $1E, $6A ; $8055
    .byte $A8, $90, $01, $60, $A5, $22, $C9, $30, $90, $01, $60, $A5, $5C, $D0, $01, $60 ; $8065
    .byte $98, $29, $06, $4A, $20, $02, $C7, $84, $80, $CC, $80, $1F ; $8075
    STA ($7A,X)          ; $8081  81 7A
    STA ($A9,X)          ; $8083  81 A9
    ASL A                ; $8085  0A
    JSR B00_842B         ; $8086  20 2B 84
    ADC #$21             ; $8089  69 21
    JSR $CA94            ; $808B  20 94 CA
    LDA #$00             ; $808E  A9 00
    JSR B00_846E         ; $8090  20 6E 84
    LDA #$C2             ; $8093  A9 C2
    JSR B00_841D         ; $8095  20 1D 84
    LDA #$0A             ; $8098  A9 0A
    JSR B00_842B         ; $809A  20 2B 84
    ADC #$61             ; $809D  69 61
    JSR $CA94            ; $809F  20 94 CA
    LDA #$01             ; $80A2  A9 01
    JSR B00_846E         ; $80A4  20 6E 84
    LDA #$C8             ; $80A7  A9 C8
    JSR B00_841D         ; $80A9  20 1D 84
    LDA $B0              ; $80AC  A5 B0
    BNE B00_80C9         ; $80AE  D0 19
    LDY $48              ; $80B0  A4 48
    DEY                  ; $80B2  88
    BNE B00_80C9         ; $80B3  D0 14
    LDY $5D              ; $80B5  A4 5D
    DEY                  ; $80B7  88
    BNE B00_80C9         ; $80B8  D0 0F
    LDA #$04             ; $80BA  A9 04
    JSR B00_842B         ; $80BC  20 2B 84
    ADC #$6E             ; $80BF  69 6E
    JSR $CA94            ; $80C1  20 94 CA
    LDA #$03             ; $80C4  A9 03
    JSR B00_846E         ; $80C6  20 6E 84
B00_80C9:
    JMP B00_8181         ; $80C9  4C 81 81
    .byte $A5, $48, $C9, $05, $D0, $2C, $A5, $5D, $C9, $01, $D0, $26, $A5, $4F, $D0, $22 ; $80CC
    .byte $A5, $50, $25, $52, $C9, $02, $D0, $1A, $A5, $51, $C9, $40, $D0, $14, $A9, $88 ; $80DC
    .byte $20, $92, $CA, $A9, $2B, $20, $94, $CA, $A9, $E0, $20, $94, $CA, $A9, $00, $20 ; $80EC
    .byte $94, $CA, $A9, $08, $20, $92, $CA, $A5, $29, $20, $94, $CA, $A9, $2C, $18, $65 ; $80FC
    .byte $2A, $20, $94, $CA, $A4, $67, $B9, $77, $00, $A2, $00, $86, $08, $20, $AC, $81 ; $810C
    .byte $4C, $81, $81, $A4, $48, $88, $D0, $05, $A4, $5D, $88, $F0, $1D, $A9, $08, $20 ; $811C
    .byte $2B, $84, $69, $6C, $20, $94, $CA, $A5, $B0, $F0, $05, $A2, $05, $BD, $60, $05 ; $812C
    .byte $A2, $05, $86, $08, $20, $AC, $81, $4C, $81, $81, $A9, $04, $20, $2B, $84, $69 ; $813C
    .byte $6E, $20, $94, $CA, $A0, $00, $A5, $BB, $C9, $3C, $90, $06, $38, $E9, $3C, $C8 ; $814C
    .byte $D0, $F6, $48, $98, $D0, $02, $A9, $0A, $20, $92, $CA, $A9, $2E, $20, $92, $CA ; $815C
    .byte $68, $20, $25, $C7, $A5, $01, $20, $94, $CA, $A5, $00, $4C, $94, $CA, $A4, $2A ; $816C
    .byte $A5, $29, $20, $E8, $82 ; $817C
B00_8181:
    LDA $5B              ; $8181  A5 5B
    BNE B00_8186         ; $8183  D0 01
    RTS                  ; $8185  60
B00_8186:
    LDA $1E              ; $8186  A5 1E
    AND #$08             ; $8188  29 08
    BEQ B00_818D         ; $818A  F0 01
    RTS                  ; $818C  60
B00_818D:
    LDA #$02             ; $818D  A9 02
    JSR B00_842B         ; $818F  20 2B 84
    ADC #$38             ; $8192  69 38
    JSR $CA94            ; $8194  20 94 CA
    LDA #$02             ; $8197  A9 02
    JSR B00_846E         ; $8199  20 6E 84
    LDA $29              ; $819C  A5 29
    JSR $CA94            ; $819E  20 94 CA
    LDA $2A              ; $81A1  A5 2A
    CLC                  ; $81A3  18
    ADC #$58             ; $81A4  69 58
    JSR $CA94            ; $81A6  20 94 CA
    JMP $CA9F            ; $81A9  4C 9F CA
B00_81AC:
    STA $01              ; $81AC  85 01
    LSR A                ; $81AE  4A
    LSR A                ; $81AF  4A
    LSR A                ; $81B0  4A
    LSR A                ; $81B1  4A
    TAY                  ; $81B2  A8
    LDA #$08             ; $81B3  A9 08
    STA $00              ; $81B5  85 00
B00_81B7:
    LDA #$30             ; $81B7  A9 30
    DEY                  ; $81B9  88
    BPL B00_81E8         ; $81BA  10 2C
    LDA $01              ; $81BC  A5 01
    AND #$0F             ; $81BE  29 0F
    BEQ B00_81CF         ; $81C0  F0 0D
    CMP #$08             ; $81C2  C9 08
    BCC B00_81E2         ; $81C4  90 1C
    LDA #$00             ; $81C6  A9 00
    STA $01              ; $81C8  85 01
    LDA #$30             ; $81CA  A9 30
    JMP B00_81E8         ; $81CC  4C E8 81
B00_81CF:
    LDA $08              ; $81CF  A5 08
    CMP #$05             ; $81D1  C9 05
    BNE B00_81DD         ; $81D3  D0 08
    LDA $B0              ; $81D5  A5 B0
    BEQ B00_81E8         ; $81D7  F0 0F
    LDA $5E              ; $81D9  A5 5E
    BEQ B00_81E8         ; $81DB  F0 0B
B00_81DD:
    LDA #$32             ; $81DD  A9 32
    JMP B00_81E8         ; $81DF  4C E8 81
B00_81E2:
    LDA #$00             ; $81E2  A9 00
    STA $01              ; $81E4  85 01
    LDA #$31             ; $81E6  A9 31
B00_81E8:
    JSR $CA92            ; $81E8  20 92 CA
    DEC $00              ; $81EB  C6 00
    BNE B00_81B7         ; $81ED  D0 C8
    RTS                  ; $81EF  60
    .byte $A5, $3E, $88, $F0, $06, $38, $E9, $3A, $4C, $FE, $81, $38, $E9, $20, $C9, $0B ; $81F0
    .byte $90, $01, $60, $4A, $20, $02, $C7, $DC, $82, $CA, $82, $A2, $82, $48, $82, $3B ; $8200
    .byte $82, $13, $82, $20, $23, $DF, $A4, $54, $A5, $3F, $C9, $02, $D0, $01, $C8, $B9 ; $8210
    .byte $A2, $84, $85, $84, $A0, $00, $C9, $21, $D0, $02, $A0, $80, $84, $85, $A9, $D0 ; $8220
    .byte $20, $37, $84, $69, $50, $20, $94, $CA, $4C, $A4, $CA, $A9, $D0, $20, $37, $84 ; $8230
    .byte $69, $00, $20, $94, $CA, $4C, $A4, $CA, $A9, $A0, $20, $43, $84, $69, $A0, $20 ; $8240
    .byte $94, $CA, $20, $A4, $CA, $A9, $90, $20, $94, $CA, $A5, $84, $29, $08, $09, $23 ; $8250
    .byte $20, $94, $CA, $A5, $84, $29, $03, $0A, $0A, $0A, $0A, $09, $C0, $85, $00, $A5 ; $8260
    .byte $85, $4A ; $8270
    LSR A                ; $8272  4A
    LSR A                ; $8273  4A
    LSR A                ; $8274  4A
    ORA $00              ; $8275  05 00
    STA $00              ; $8277  85 00
    JSR $CA94            ; $8279  20 94 CA
    JSR $CA9B            ; $827C  20 9B CA
    LDA #$05             ; $827F  A9 05
    STA $01              ; $8281  85 01
    LDA $84              ; $8283  A5 84
    AND #$08             ; $8285  29 08
    BEQ B00_828B         ; $8287  F0 02
    INC $01              ; $8289  E6 01
B00_828B:
    LDY #$07             ; $828B  A0 07
    LDA #$00             ; $828D  A9 00
B00_828F:
    STA ($00),Y          ; $828F  91 00
    DEY                  ; $8291  88
    BPL B00_828F         ; $8292  10 FB
    LDY #$0F             ; $8294  A0 0F
B00_8296:
    LDA ($00),Y          ; $8296  B1 00
    AND #$F0             ; $8298  29 F0
    STA ($00),Y          ; $829A  91 00
    DEY                  ; $829C  88
    CPY #$07             ; $829D  C0 07
    BNE B00_8296         ; $829F  D0 F5
    RTS                  ; $82A1  60
    .byte $A9, $0A, $20, $37, $84, $69, $21, $20, $94, $CA, $A9, $00, $20, $6E, $84, $A9 ; $82A2
    .byte $C2, $20, $1D, $84, $A9, $0A, $20, $37, $84, $69, $61, $20, $94, $CA, $A9, $01 ; $82B2
    .byte $20, $6E, $84, $A9, $C8, $4C, $1D, $84, $A9, $08, $20, $37, $84, $69, $2C, $20 ; $82C2
    .byte $94, $CA, $A4, $67, $B9, $77, $00, $4C, $AC, $81, $A5, $84, $85, $29, $A5, $85 ; $82D2
    .byte $85, $2A, $A4, $85, $A5, $84 ; $82E2
B00_82E8:
    STA $08              ; $82E8  85 08
    STY $09              ; $82EA  84 09
    LDY $67              ; $82EC  A4 67
    LDA $0073,Y          ; $82EE  B9 73 00
    STA $0A              ; $82F1  85 0A
    LDA $00A8,Y          ; $82F3  B9 A8 00
    STA $0B              ; $82F6  85 0B
    LDA #$08             ; $82F8  A9 08
    JSR $CA92            ; $82FA  20 92 CA
    LDA $08              ; $82FD  A5 08
    JSR $CA94            ; $82FF  20 94 CA
    LDA $09              ; $8302  A5 09
    CLC                  ; $8304  18
    ADC #$35             ; $8305  69 35
    JSR $CA94            ; $8307  20 94 CA
    LDA $67              ; $830A  A5 67
    ASL A                ; $830C  0A
    ASL A                ; $830D  0A
    ADC #$40             ; $830E  69 40
    STA $0C              ; $8310  85 0C
    JSR $CA94            ; $8312  20 94 CA
    CLC                  ; $8315  18
    ADC #$02             ; $8316  69 02
    JSR $CA94            ; $8318  20 94 CA
    JSR $CAA4            ; $831B  20 A4 CA
    LDA $0A              ; $831E  A5 0A
    STA $0D              ; $8320  85 0D
    BEQ B00_8338         ; $8322  F0 14
    ASL A                ; $8324  0A
    ASL A                ; $8325  0A
    ADC #$4C             ; $8326  69 4C
    STA $0D              ; $8328  85 0D
    INC $0D              ; $832A  E6 0D
    JSR $CA94            ; $832C  20 94 CA
    CLC                  ; $832F  18
    ADC #$02             ; $8330  69 02
    JSR $CA94            ; $8332  20 94 CA
    JMP B00_833B         ; $8335  4C 3B 83
B00_8338:
    JSR B00_8409         ; $8338  20 09 84
B00_833B:
    JSR $CAA4            ; $833B  20 A4 CA
    LDY $48              ; $833E  A4 48
    LDA $8402,Y          ; $8340  B9 02 84
    BEQ B00_835C         ; $8343  F0 17
    LDA $A7              ; $8345  A5 A7
    BEQ B00_8356         ; $8347  F0 0D
    LDA #$34             ; $8349  A9 34
    JSR $CA94            ; $834B  20 94 CA
    LDA #$36             ; $834E  A9 36
    JSR $CA94            ; $8350  20 94 CA
    JMP B00_835F         ; $8353  4C 5F 83
B00_8356:
    JSR B00_8409         ; $8356  20 09 84
    JMP B00_835F         ; $8359  4C 5F 83
B00_835C:
    JSR $CA9F            ; $835C  20 9F CA
B00_835F:
    LDA #$08             ; $835F  A9 08
    JSR $CA92            ; $8361  20 92 CA
    LDA $08              ; $8364  A5 08
    JSR $CA94            ; $8366  20 94 CA
    LDA $09              ; $8369  A5 09
    CLC                  ; $836B  18
    ADC #$55             ; $836C  69 55
    JSR $CA94            ; $836E  20 94 CA
    INC $0C              ; $8371  E6 0C
    LDA $0C              ; $8373  A5 0C
    JSR $CA94            ; $8375  20 94 CA
    CLC                  ; $8378  18
    ADC #$02             ; $8379  69 02
    JSR $CA94            ; $837B  20 94 CA
    JSR $CAA4            ; $837E  20 A4 CA
    LDA $0D              ; $8381  A5 0D
    BEQ B00_8391         ; $8383  F0 0C
    JSR $CA94            ; $8385  20 94 CA
    CLC                  ; $8388  18
    ADC #$02             ; $8389  69 02
    JSR $CA94            ; $838B  20 94 CA
    JMP B00_8394         ; $838E  4C 94 83
B00_8391:
    JSR B00_8413         ; $8391  20 13 84
B00_8394:
    JSR $CAA4            ; $8394  20 A4 CA
    LDY $48              ; $8397  A4 48
    LDA $8402,Y          ; $8399  B9 02 84
    BEQ B00_83B5         ; $839C  F0 17
    LDA $A7              ; $839E  A5 A7
    BEQ B00_83AF         ; $83A0  F0 0D
    LDA #$35             ; $83A2  A9 35
    JSR $CA94            ; $83A4  20 94 CA
    LDA #$37             ; $83A7  A9 37
    JSR $CA94            ; $83A9  20 94 CA
    JMP B00_83B8         ; $83AC  4C B8 83
B00_83AF:
    JSR B00_8413         ; $83AF  20 13 84
    JMP B00_83B8         ; $83B2  4C B8 83
B00_83B5:
    JSR $CA9F            ; $83B5  20 9F CA
B00_83B8:
    LDA #$05             ; $83B8  A9 05
    JSR $CA92            ; $83BA  20 92 CA
    LDA $08              ; $83BD  A5 08
    JSR $CA94            ; $83BF  20 94 CA
    LDA $09              ; $83C2  A5 09
    CLC                  ; $83C4  18
    ADC #$78             ; $83C5  69 78
    JSR $CA94            ; $83C7  20 94 CA
    LDY $67              ; $83CA  A4 67
    LDA $00A8,Y          ; $83CC  B9 A8 00
    BEQ B00_83E1         ; $83CF  F0 10
    JSR $C725            ; $83D1  20 25 C7
    LDA $01              ; $83D4  A5 01
    JSR $CA94            ; $83D6  20 94 CA
    LDA $00              ; $83D9  A5 00
    JSR $CA94            ; $83DB  20 94 CA
    JMP B00_83E4         ; $83DE  4C E4 83
B00_83E1:
    JSR $CA9F            ; $83E1  20 9F CA
B00_83E4:
    JSR $CAA4            ; $83E4  20 A4 CA
    LDY $48              ; $83E7  A4 48
    LDA $8402,Y          ; $83E9  B9 02 84
    BEQ B00_83FF         ; $83EC  F0 11
    LDA $A7              ; $83EE  A5 A7
    BEQ B00_83FF         ; $83F0  F0 0D
    JSR $C725            ; $83F2  20 25 C7
    LDA $01              ; $83F5  A5 01
    JSR $CA94            ; $83F7  20 94 CA
    LDA $00              ; $83FA  A5 00
    JMP $CA94            ; $83FC  4C 94 CA
B00_83FF:
    JMP $CA9F            ; $83FF  4C 9F CA
    .byte $00, $00, $01, $01, $00, $00, $00 ; $8402
B00_8409:
    LDA #$3C             ; $8409  A9 3C
    JSR $CA94            ; $840B  20 94 CA
    LDA #$3E             ; $840E  A9 3E
    JMP $CA94            ; $8410  4C 94 CA
B00_8413:
    LDA #$3D             ; $8413  A9 3D
    JSR $CA94            ; $8415  20 94 CA
    LDA #$3F             ; $8418  A9 3F
    JMP $CA94            ; $841A  4C 94 CA
B00_841D:
    STA $00              ; $841D  85 00
    LDA #$00             ; $841F  A9 00
    STA $01              ; $8421  85 01
    JSR B00_8450         ; $8423  20 50 84
    LDA #$0A             ; $8426  A9 0A
    JMP $CA92            ; $8428  4C 92 CA
B00_842B:
    JSR $CA92            ; $842B  20 92 CA
    LDA $29              ; $842E  A5 29
    JSR $CA94            ; $8430  20 94 CA
    LDA $2A              ; $8433  A5 2A
    CLC                  ; $8435  18
    RTS                  ; $8436  60
    .byte $20, $92, $CA, $A5, $84 ; $8437
B00_843C:
    JSR $CA94            ; $843C  20 94 CA
    LDA $85              ; $843F  A5 85
    CLC                  ; $8441  18
    RTS                  ; $8442  60
B00_8443:
    JSR $CA92            ; $8443  20 92 CA
    LDA $84              ; $8446  A5 84
    CMP #$21             ; $8448  C9 21
    BNE B00_843C         ; $844A  D0 F0
    LDA #$22             ; $844C  A9 22
    BNE B00_843C         ; $844E  D0 EC
B00_8450:
    LDY #$02             ; $8450  A0 02
B00_8452:
    LDA ($00),Y          ; $8452  B1 00
    PHA                  ; $8454  48
    LSR A                ; $8455  4A
    LSR A                ; $8456  4A
    LSR A                ; $8457  4A
    LSR A                ; $8458  4A
    BNE B00_845D         ; $8459  D0 02
    LDA #$0A             ; $845B  A9 0A
B00_845D:
    JSR $CA94            ; $845D  20 94 CA
    PLA                  ; $8460  68
    AND #$0F             ; $8461  29 0F
    BNE B00_8467         ; $8463  D0 02
    LDA #$0A             ; $8465  A9 0A
B00_8467:
    JSR $CA92            ; $8467  20 92 CA
    DEY                  ; $846A  88
    BPL B00_8452         ; $846B  10 E5
    RTS                  ; $846D  60
B00_846E:
    ASL A                ; $846E  0A
    TAY                  ; $846F  A8
    LDA $8489,Y          ; $8470  B9 89 84
    STA $00              ; $8473  85 00
    LDA $848A,Y          ; $8475  B9 8A 84
    STA $01              ; $8478  85 01
    LDY #$00             ; $847A  A0 00
B00_847C:
    LDA ($00),Y          ; $847C  B1 00
    CMP #$FF             ; $847E  C9 FF
    BEQ B00_8488         ; $8480  F0 06
    JSR $CA92            ; $8482  20 92 CA
    INY                  ; $8485  C8
    BNE B00_847C         ; $8486  D0 F4
B00_8488:
    RTS                  ; $8488  60
    .byte $91, $84, $95, $84, $99, $84, $9D, $84, $1F, $2F, $0B, $FF, $17, $18, $00, $FF ; $8489
    .byte $00, $00, $02, $FF, $00, $00, $00, $00, $FF, $29, $20, $23, $2A, $21, $29, $20 ; $8499
    .byte $23, $2A, $21, $E3, $20, $94, $23, $14, $14, $1D, $10, $16, $14, $00, $1C, $24 ; $84A9
    .byte $23, $10, $1D, $23, $00, $1D, $18, $1D, $19, $10, $0C, $00, $9B, $23, $24, $21 ; $84B9
    .byte $23, $1B, $14, $22, $00, $2F, $00, $2B, $00, $1C, $18, $21, $10, $16, $14, $00 ; $84C9
    .byte $22, $23, $24, $13, $18, $1E, $22, $2D, $05, $00, $9A, $24, $22, $10, $0B, $00 ; $84D9
    .byte $00, $10, $1B, $1B, $00, $21, $18, $16, $17, $23, $22, $00, $21, $14, $22, $14 ; $84E9
    .byte $21, $25, $14, $13, $0B, $06, $00, $98, $23, $21, $10, $13, $14, $1C, $10, $21 ; $84F9
    .byte $1A, $00, $24, $22, $14, $00, $16, $21, $10, $1D, $23, $14, $13, $00, $23, $1E ; $8509
    .byte $08, $00, $99, $1A, $1E, $1D, $10, $1C, $18, $00, $24, $1D, $13, $14, $21, $00 ; $8519
    .byte $1B, $18, $12, $14, $1D, $22, $14, $00, $15, $21, $1E, $1C, $07, $00, $94, $1C ; $8529
    .byte $18, $21, $10, $16, $14, $00, $22, $23, $24, $13, $18, $1E, $22, $2D, $00, $24 ; $8539
    .byte $22, $10, $0B, $52, $00, $8D, $23, $1C, $00, $10, $1D, $13, $00, $2B, $00, $01 ; $8549
    .byte $09, $08, $09, $0E, $00, $98, $1A, $1E, $1D, $10, $1C, $18, $00, $18, $1D, $13 ; $8559
    .byte $24, $22, $23, $21, $28, $00, $12, $1E, $0B, $2D, $1B, $23, $13, $0B, $0E, $00 ; $8569
    .byte $8B, $1B, $18, $12, $14, $1D, $22, $14, $13, $00, $11, $28, $0F, $00, $98, $1D ; $8579
    .byte $18, $1D, $23, $14, $1D, $13, $1E, $00, $1E, $15, $00, $10, $1C, $14, $21, $18 ; $8589
    .byte $12, $10, $00, $18, $1D, $12, $0B, $2C, $00, $90, $24, $1B, $23, $21, $10, $00 ; $8599
    .byte $16, $10, $1C, $14, $22, $00, $18, $22, $00, $10, $0D, $00, $97, $21, $14, $16 ; $85A9
    .byte $18, $22, $23, $14, $21, $14, $13, $00, $23, $21, $10, $13, $14, $1C, $10, $21 ; $85B9
    .byte $1A, $00, $1E, $15, $07, $00, $9B, $24, $1B, $23, $21, $10, $00, $22, $1E, $15 ; $85C9
    .byte $23, $26, $10, $21, $14, $00, $12, $1E, $21, $1F, $1E, $21, $10, $23, $18, $1E ; $85D9
    .byte $1D, $0B, $FF ; $85E9
B00_85EC:
    LDA #$30             ; $85EC  A9 30
    STA $4000,X          ; $85EE  9D 00 40
    BNE B00_8605         ; $85F1  D0 12
B00_85F3:
    LDA $0116,X          ; $85F3  BD 16 01
    AND #$41             ; $85F6  29 41
    ORA $0196            ; $85F8  0D 96 01
    BNE B00_85EC         ; $85FB  D0 EF
    LDA $014C,X          ; $85FD  BD 4C 01
    JSR B00_8721         ; $8600  20 21 87
    LDX #$00             ; $8603  A2 00
B00_8605:
    LDA $0178,X          ; $8605  BD 78 01
    STA $4002,Y          ; $8608  99 02 40
    LDA $0146,X          ; $860B  BD 46 01
    STA $4003,Y          ; $860E  99 03 40
    RTS                  ; $8611  60
B00_8612:
    LDA $0199            ; $8612  AD 99 01
    BEQ B00_8643         ; $8615  F0 2C
    CMP #$01             ; $8617  C9 01
    BNE B00_861E         ; $8619  D0 03
    JMP B00_9016         ; $861B  4C 16 90
B00_861E:
    CMP #$02             ; $861E  C9 02
    BNE B00_862E         ; $8620  D0 0C
    LDA $0198            ; $8622  AD 98 01
    CMP #$20             ; $8625  C9 20
    BNE B00_862E         ; $8627  D0 05
    LDA #$00             ; $8629  A9 00
    STA $010D            ; $862B  8D 0D 01
B00_862E:
    INC $0198            ; $862E  EE 98 01
    LDA #$2F             ; $8631  A9 2F
    CMP $0198            ; $8633  CD 98 01
    BNE B00_8643         ; $8636  D0 0B
    LDA #$00             ; $8638  A9 00
    STA $0198            ; $863A  8D 98 01
    INC $0197            ; $863D  EE 97 01
    DEC $0199            ; $8640  CE 99 01
B00_8643:
    RTS                  ; $8643  60
    JSR B00_8612         ; $8644  20 12 86
    LDX #$00             ; $8647  A2 00
    LDY #$00             ; $8649  A0 00
B00_864B:
    STX $0192            ; $864B  8E 92 01
    STY $0193            ; $864E  8C 93 01
    LDA $010A,X          ; $8651  BD 0A 01
    BEQ B00_8659         ; $8654  F0 03
    JSR B00_8671         ; $8656  20 71 86
B00_8659:
    INX                  ; $8659  E8
    CPX #$06             ; $865A  E0 06
    BEQ B00_8670         ; $865C  F0 12
    CPX #$05             ; $865E  E0 05
    BNE B00_8667         ; $8660  D0 05
    LDA #$0C             ; $8662  A9 0C
    JMP B00_866C         ; $8664  4C 6C 86
B00_8667:
    TXA                  ; $8667  8A
    ASL A                ; $8668  0A
    ASL A                ; $8669  0A
    AND #$0F             ; $866A  29 0F
B00_866C:
    TAY                  ; $866C  A8
    JMP B00_864B         ; $866D  4C 4B 86
B00_8670:
    RTS                  ; $8670  60
B00_8671:
    JSR B00_8F96         ; $8671  20 96 8F
    LDA $0116,X          ; $8674  BD 16 01
    DEC $0104,X          ; $8677  DE 04 01
    BNE B00_867F         ; $867A  D0 03
    JMP B00_891F         ; $867C  4C 1F 89
B00_867F:
    CPX #$02             ; $867F  E0 02
    BCS B00_8670         ; $8681  B0 ED
    AND #$41             ; $8683  29 41
    BNE B00_8670         ; $8685  D0 E9
    LDA $018E,X          ; $8687  BD 8E 01
    BMI B00_86B0         ; $868A  30 24
    LDA $0110,X          ; $868C  BD 10 01
    STA $E2              ; $868F  85 E2
    LDA $018E,X          ; $8691  BD 8E 01
    AND #$10             ; $8694  29 10
    BEQ B00_869D         ; $8696  F0 05
    LDA $E2              ; $8698  A5 E2
    ASL A                ; $869A  0A
    STA $E2              ; $869B  85 E2
B00_869D:
    LDA $0104,X          ; $869D  BD 04 01
B00_86A0:
    SEC                  ; $86A0  38
    SBC $E2              ; $86A1  E5 E2
    BEQ B00_86E3         ; $86A3  F0 3E
    BCS B00_86A0         ; $86A5  B0 F9
B00_86A7:
    LDA $0116,X          ; $86A7  BD 16 01
    AND #$06             ; $86AA  29 06
    CMP #$06             ; $86AC  C9 06
    BEQ B00_86C5         ; $86AE  F0 15
B00_86B0:
    LDA $0116,X          ; $86B0  BD 16 01
    AND #$10             ; $86B3  29 10
    BEQ B00_86C5         ; $86B5  F0 0E
    DEC $0180,X          ; $86B7  DE 80 01
    BNE B00_86C5         ; $86BA  D0 09
    INC $0180,X          ; $86BC  FE 80 01
    JSR B00_8857         ; $86BF  20 57 88
    JSR B00_8BDA         ; $86C2  20 DA 8B
B00_86C5:
    DEC $0166,X          ; $86C5  DE 66 01
    BNE B00_8670         ; $86C8  D0 A6
    INC $0166,X          ; $86CA  FE 66 01
    JSR B00_87B0         ; $86CD  20 B0 87
    LDA $0116,X          ; $86D0  BD 16 01
    AND #$06             ; $86D3  29 06
    TAY                  ; $86D5  A8
    LDA $8FB0,Y          ; $86D6  B9 B0 8F
    STA $E2              ; $86D9  85 E2
    LDA $8FB1,Y          ; $86DB  B9 B1 8F
    STA $E3              ; $86DE  85 E3
    JMP ($00E2)          ; $86E0  6C E2 00
B00_86E3:
    LDA $017A,X          ; $86E3  BD 7A 01
    STA $EC              ; $86E6  85 EC
    LDA $017C,X          ; $86E8  BD 7C 01
    STA $ED              ; $86EB  85 ED
    JSR B00_8C24         ; $86ED  20 24 8C
    JMP B00_86A7         ; $86F0  4C A7 86
B00_86F3:
    LDA $0164,X          ; $86F3  BD 64 01
    ASL A                ; $86F6  0A
    TAY                  ; $86F7  A8
    LDA $BEB0,Y          ; $86F8  B9 B0 BE
    STA $E2              ; $86FB  85 E2
    LDA $BEB1,Y          ; $86FD  B9 B1 BE
    STA $E3              ; $8700  85 E3
B00_8702:
    LDA $0168,X          ; $8702  BD 68 01
    TAY                  ; $8705  A8
    LDA ($E2),Y          ; $8706  B1 E2
    CMP #$FB             ; $8708  C9 FB
    BCS B00_875E         ; $870A  B0 52
    CMP #$10             ; $870C  C9 10
    BCC B00_8717         ; $870E  90 07
    LSR A                ; $8710  4A
    LSR A                ; $8711  4A
    LSR A                ; $8712  4A
    LSR A                ; $8713  4A
    STA $0166,X          ; $8714  9D 66 01
B00_8717:
    INC $0168,X          ; $8717  FE 68 01
    LDA ($E2),Y          ; $871A  B1 E2
    AND #$0F             ; $871C  29 0F
B00_871E:
    STA $014C,X          ; $871E  9D 4C 01
B00_8721:
    ORA $014C,X          ; $8721  1D 4C 01
    BEQ B00_8736         ; $8724  F0 10
    SEC                  ; $8726  38
    SBC $0176,X          ; $8727  FD 76 01
    BCC B00_8750         ; $872A  90 24
    BEQ B00_8750         ; $872C  F0 22
    SEC                  ; $872E  38
    SBC $0197            ; $872F  ED 97 01
    BCC B00_8750         ; $8732  90 1C
    BEQ B00_8750         ; $8734  F0 1A
B00_8736:
    STA $E2              ; $8736  85 E2
    LDA $0116,X          ; $8738  BD 16 01
    AND #$20             ; $873B  29 20
    BNE B00_8754         ; $873D  D0 15
    LDA $E2              ; $873F  A5 E2
    ORA $0158,X          ; $8741  1D 58 01
B00_8744:
    JSR B00_8CE8         ; $8744  20 E8 8C
    BCS B00_874C         ; $8747  B0 03
    STA $4000,X          ; $8749  9D 00 40
B00_874C:
    LDX $0192            ; $874C  AE 92 01
    RTS                  ; $874F  60
B00_8750:
    LDA #$01             ; $8750  A9 01
    BNE B00_8736         ; $8752  D0 E2
B00_8754:
    LDA $018C,X          ; $8754  BD 8C 01
    AND #$F0             ; $8757  29 F0
    ORA $E2              ; $8759  05 E2
    JMP B00_8744         ; $875B  4C 44 87
B00_875E:
    CMP #$FE             ; $875E  C9 FE
    BEQ B00_8770         ; $8760  F0 0E
    BCS B00_87E3         ; $8762  B0 7F
    INC $0168,X          ; $8764  FE 68 01
    LDA $0168,X          ; $8767  BD 68 01
    STA $016C,X          ; $876A  9D 6C 01
    JMP B00_8702         ; $876D  4C 02 87
B00_8770:
    INY                  ; $8770  C8
    INC $016A,X          ; $8771  FE 6A 01
    LDA ($E2),Y          ; $8774  B1 E2
    CMP $016A,X          ; $8776  DD 6A 01
    BNE B00_878C         ; $8779  D0 11
    LDA #$00             ; $877B  A9 00
    STA $016A,X          ; $877D  9D 6A 01
    STA $016C,X          ; $8780  9D 6C 01
    INC $0168,X          ; $8783  FE 68 01
    INC $0168,X          ; $8786  FE 68 01
    JMP B00_8702         ; $8789  4C 02 87
B00_878C:
    LDA $016C,X          ; $878C  BD 6C 01
    STA $0168,X          ; $878F  9D 68 01
    JMP B00_8702         ; $8792  4C 02 87
    .byte $DE, $68, $01, $30, $49, $DE, $4C, $01, $30, $06, $BD, $4C, $01, $4C, $1E, $87 ; $8795
    .byte $FE, $4C, $01, $60, $BD, $16, $01, $29, $02, $D0, $4A ; $87A5
B00_87B0:
    LDA $0116,X          ; $87B0  BD 16 01
    AND #$06             ; $87B3  29 06
    CMP #$06             ; $87B5  C9 06
    BEQ B00_87ED         ; $87B7  F0 34
    LDA $0104,X          ; $87B9  BD 04 01
    CMP $016E,X          ; $87BC  DD 6E 01
    BCS B00_87ED         ; $87BF  B0 2C
    LDA $0116,X          ; $87C1  BD 16 01
    ORA #$06             ; $87C4  09 06
    STA $0116,X          ; $87C6  9D 16 01
    LDA $018C,X          ; $87C9  BD 8C 01
    AND #$0C             ; $87CC  29 0C
    BNE B00_87EE         ; $87CE  D0 1E
    JMP B00_87D3         ; $87D0  4C D3 87
B00_87D3:
    LDA $018C,X          ; $87D3  BD 8C 01
    AND #$02             ; $87D6  29 02
    BEQ B00_87E2         ; $87D8  F0 08
    LDA $0116,X          ; $87DA  BD 16 01
    ORA #$20             ; $87DD  09 20
    STA $0116,X          ; $87DF  9D 16 01
B00_87E2:
    RTS                  ; $87E2  60
B00_87E3:
    LDA $0116,X          ; $87E3  BD 16 01
    ORA #$04             ; $87E6  09 04
    AND #$FD             ; $87E8  29 FD
    STA $0116,X          ; $87EA  9D 16 01
B00_87ED:
    RTS                  ; $87ED  60
B00_87EE:
    LSR A                ; $87EE  4A
    LSR A                ; $87EF  4A
    STA $E2              ; $87F0  85 E2
    JSR B00_87D3         ; $87F2  20 D3 87
    LDA $E2              ; $87F5  A5 E2
    JMP B00_871E         ; $87F7  4C 1E 87
    .byte $BD, $8E, $01, $30, $2A, $84, $E2, $BD, $8E, $01, $29, $0F, $85, $E4, $BD, $90 ; $87FA
    .byte $01, $38, $E9, $01, $29, $03, $38, $E5, $E4, $29, $03, $E0, $01, $D0, $02, $09 ; $880A
    .byte $04, $A8, $B9, $9E, $01, $85, $EC, $B9, $A6, $01, $85, $ED, $20, $EA, $8B, $BD ; $881A
    .byte $8C, $01, $29, $0C, $D0, $BD, $DE, $74, $01, $D0, $B8, $BD, $72, $01, $D0, $02 ; $882A
    .byte $A9, $01, $9D, $74, $01, $DE, $4C, $01, $30, $0F, $A9, $01, $DD, $4C, $01, $F0 ; $883A
    .byte $02, $B0, $06, $BD, $4C, $01, $4C, $21, $87, $FE, $4C, $01, $60 ; $884A
B00_8857:
    LDA $0184,X          ; $8857  BD 84 01
    ASL A                ; $885A  0A
    TAY                  ; $885B  A8
    LDA $BEE2,Y          ; $885C  B9 E2 BE
    STA $E2              ; $885F  85 E2
    LDA $BEE3,Y          ; $8861  B9 E3 BE
    STA $E3              ; $8864  85 E3
    LDA $0186,X          ; $8866  BD 86 01
    TAY                  ; $8869  A8
    LDA ($E2),Y          ; $886A  B1 E2
    CMP #$FB             ; $886C  C9 FB
    BCS B00_88E2         ; $886E  B0 72
    CMP #$10             ; $8870  C9 10
    BCC B00_887B         ; $8872  90 07
    LSR A                ; $8874  4A
    LSR A                ; $8875  4A
    LSR A                ; $8876  4A
    LSR A                ; $8877  4A
    STA $0180,X          ; $8878  9D 80 01
B00_887B:
    INC $0186,X          ; $887B  FE 86 01
    LDA ($E2),Y          ; $887E  B1 E2
    AND #$0F             ; $8880  29 0F
    STA $E2              ; $8882  85 E2
    CMP #$08             ; $8884  C9 08
    BCS B00_888F         ; $8886  B0 07
    JSR B00_889D         ; $8888  20 9D 88
    JSR B00_88B2         ; $888B  20 B2 88
    RTS                  ; $888E  60
B00_888F:
    LDA #$10             ; $888F  A9 10
    SEC                  ; $8891  38
    SBC $E2              ; $8892  E5 E2
    STA $E2              ; $8894  85 E2
    JSR B00_889D         ; $8896  20 9D 88
    JSR B00_88C8         ; $8899  20 C8 88
    RTS                  ; $889C  60
B00_889D:
    LDA $0182,X          ; $889D  BD 82 01
    TAX                  ; $88A0  AA
    LDA $E2              ; $88A1  A5 E2
B00_88A3:
    DEX                  ; $88A3  CA
    BEQ B00_88AC         ; $88A4  F0 06
    CLC                  ; $88A6  18
    ADC $E2              ; $88A7  65 E2
    JMP B00_88A3         ; $88A9  4C A3 88
B00_88AC:
    LDX $0192            ; $88AC  AE 92 01
    STA $E2              ; $88AF  85 E2
    RTS                  ; $88B1  60
B00_88B2:
    CLC                  ; $88B2  18
    ADC $017A,X          ; $88B3  7D 7A 01
    STA $EC              ; $88B6  85 EC
    BCC B00_88C2         ; $88B8  90 08
    LDA $017C,X          ; $88BA  BD 7C 01
    STA $ED              ; $88BD  85 ED
    INC $ED              ; $88BF  E6 ED
    RTS                  ; $88C1  60
B00_88C2:
    LDA $017C,X          ; $88C2  BD 7C 01
    STA $ED              ; $88C5  85 ED
    RTS                  ; $88C7  60
B00_88C8:
    LDA $017A,X          ; $88C8  BD 7A 01
    SEC                  ; $88CB  38
    SBC $E2              ; $88CC  E5 E2
    BCS B00_88DA         ; $88CE  B0 0A
    STA $EC              ; $88D0  85 EC
    LDA $017C,X          ; $88D2  BD 7C 01
    STA $ED              ; $88D5  85 ED
    DEC $ED              ; $88D7  C6 ED
    RTS                  ; $88D9  60
B00_88DA:
    STA $EC              ; $88DA  85 EC
    LDA $017C,X          ; $88DC  BD 7C 01
    STA $ED              ; $88DF  85 ED
    RTS                  ; $88E1  60
B00_88E2:
    CMP #$FE             ; $88E2  C9 FE
    BEQ B00_88F4         ; $88E4  F0 0E
    BCS B00_8919         ; $88E6  B0 31
    INC $0186,X          ; $88E8  FE 86 01
    LDA $0186,X          ; $88EB  BD 86 01
    STA $0188,X          ; $88EE  9D 88 01
    JMP B00_8857         ; $88F1  4C 57 88
B00_88F4:
    INY                  ; $88F4  C8
    INC $018A,X          ; $88F5  FE 8A 01
    LDA ($E2),Y          ; $88F8  B1 E2
    CMP $018A,X          ; $88FA  DD 8A 01
    BNE B00_8910         ; $88FD  D0 11
    LDA #$00             ; $88FF  A9 00
    STA $018A,X          ; $8901  9D 8A 01
    STA $0188,X          ; $8904  9D 88 01
    INC $0186,X          ; $8907  FE 86 01
    INC $0186,X          ; $890A  FE 86 01
    JMP B00_8857         ; $890D  4C 57 88
B00_8910:
    LDA $0188,X          ; $8910  BD 88 01
    STA $0186,X          ; $8913  9D 86 01
    JMP B00_8857         ; $8916  4C 57 88
B00_8919:
    LDA #$FF             ; $8919  A9 FF
    STA $0180,X          ; $891B  9D 80 01
    RTS                  ; $891E  60
B00_891F:
    LSR A                ; $891F  4A
    BCC B00_8925         ; $8920  90 03
    JMP B00_89CD         ; $8922  4C CD 89
B00_8925:
    LDA $0192            ; $8925  AD 92 01
    CMP #$03             ; $8928  C9 03
    BEQ B00_8951         ; $892A  F0 25
    LDA ($E0),Y          ; $892C  B1 E0
    AND #$F0             ; $892E  29 F0
    CMP #$C0             ; $8930  C9 C0
    BCS B00_8937         ; $8932  B0 03
    JMP B00_8B3E         ; $8934  4C 3E 8B
B00_8937:
    AND #$30             ; $8937  29 30
    LSR A                ; $8939  4A
    LSR A                ; $893A  4A
    LSR A                ; $893B  4A
    TAX                  ; $893C  AA
    LDA $8FC4,X          ; $893D  BD C4 8F
    STA $E2              ; $8940  85 E2
    LDA $8FC5,X          ; $8942  BD C5 8F
    STA $E3              ; $8945  85 E3
    LDX $0192            ; $8947  AE 92 01
    LDA ($E0),Y          ; $894A  B1 E0
    AND #$0F             ; $894C  29 0F
    JMP ($00E2)          ; $894E  6C E2 00
B00_8951:
    LDA ($E0),Y          ; $8951  B1 E0
    AND #$F0             ; $8953  29 F0
    CMP #$F0             ; $8955  C9 F0
    BNE B00_8960         ; $8957  D0 07
    LDA ($E0),Y          ; $8959  B1 E0
    AND #$0F             ; $895B  29 0F
    JMP B00_8E66         ; $895D  4C 66 8E
B00_8960:
    CMP #$D0             ; $8960  C9 D0
    BEQ B00_8967         ; $8962  F0 03
    JMP B00_8C71         ; $8964  4C 71 8C
B00_8967:
    LDA ($E0),Y          ; $8967  B1 E0
    AND #$0F             ; $8969  29 0F
    STA $0110,X          ; $896B  9D 10 01
    INY                  ; $896E  C8
    JMP B00_8951         ; $896F  4C 51 89
B00_8972:
    LDA ($E0),Y          ; $8972  B1 E0
    LSR A                ; $8974  4A
    LSR A                ; $8975  4A
    LSR A                ; $8976  4A
    LSR A                ; $8977  4A
    CMP #$0C             ; $8978  C9 0C
    BNE B00_897D         ; $897A  D0 01
    RTS                  ; $897C  60
B00_897D:
    TAX                  ; $897D  AA
    STA $0195            ; $897E  8D 95 01
    LDA $89C1,X          ; $8981  BD C1 89
    LDX $0192            ; $8984  AE 92 01
    CMP #$8F             ; $8987  C9 8F
    BCS B00_898E         ; $8989  B0 03
    JMP B00_9057         ; $898B  4C 57 90
B00_898E:
    SEC                  ; $898E  38
    SBC #$8F             ; $898F  E9 8F
    STA $0194            ; $8991  8D 94 01
    TYA                  ; $8994  98
    PHA                  ; $8995  48
    LDA $0194            ; $8996  AD 94 01
    ASL A                ; $8999  0A
    ASL A                ; $899A  0A
    TAY                  ; $899B  A8
    LDA #$0F             ; $899C  A9 0F
    STA $4015            ; $899E  8D 15 40
    LDA $FE41,Y          ; $89A1  B9 41 FE
    STA $4010            ; $89A4  8D 10 40
    LDA $FE42,Y          ; $89A7  B9 42 FE
    STA $4011            ; $89AA  8D 11 40
    LDA $FE43,Y          ; $89AD  B9 43 FE
    STA $4012            ; $89B0  8D 12 40
    LDA $FE44,Y          ; $89B3  B9 44 FE
    STA $4013            ; $89B6  8D 13 40
    LDA #$1F             ; $89B9  A9 1F
    STA $4015            ; $89BB  8D 15 40
    PLA                  ; $89BE  68
    TAY                  ; $89BF  A8
    RTS                  ; $89C0  60
    .byte $02, $03, $04, $05, $06, $02, $02, $02, $02, $02, $02, $8F ; $89C1
B00_89CD:
    LDA ($E0),Y          ; $89CD  B1 E0
    CPX #$05             ; $89CF  E0 05
    BEQ B00_89D3         ; $89D1  F0 00
B00_89D3:
    CMP #$FB             ; $89D3  C9 FB
    BCC B00_89DC         ; $89D5  90 05
    AND #$0F             ; $89D7  29 0F
    JMP B00_8E66         ; $89D9  4C 66 8E
B00_89DC:
    CPX #$05             ; $89DC  E0 05
    BEQ B00_8A06         ; $89DE  F0 26
    CMP #$F8             ; $89E0  C9 F8
    BCC B00_8A06         ; $89E2  90 22
    AND #$0F             ; $89E4  29 0F
    CMP #$09             ; $89E6  C9 09
    BEQ B00_89FC         ; $89E8  F0 12
    BCC B00_89F2         ; $89EA  90 06
    INY                  ; $89EC  C8
    LDA ($E0),Y          ; $89ED  B1 E0
    JMP B00_8A3F         ; $89EF  4C 3F 8A
B00_89F2:
    INY                  ; $89F2  C8
    LDA ($E0),Y          ; $89F3  B1 E0
    STA $0110,X          ; $89F5  9D 10 01
    INY                  ; $89F8  C8
    JMP B00_89CD         ; $89F9  4C CD 89
B00_89FC:
    INY                  ; $89FC  C8
    LDA ($E0),Y          ; $89FD  B1 E0
    STA $0158,X          ; $89FF  9D 58 01
    INY                  ; $8A02  C8
    JMP B00_89CD         ; $8A03  4C CD 89
B00_8A06:
    AND #$F0             ; $8A06  29 F0
    CMP #$00             ; $8A08  C9 00
    BNE B00_8A71         ; $8A0A  D0 65
    LDA ($E0),Y          ; $8A0C  B1 E0
    AND #$0F             ; $8A0E  29 0F
    BNE B00_8A15         ; $8A10  D0 03
    JMP B00_8A71         ; $8A12  4C 71 8A
B00_8A15:
    STA $0110,X          ; $8A15  9D 10 01
    INY                  ; $8A18  C8
    LDA ($E0),Y          ; $8A19  B1 E0
    CPX #$02             ; $8A1B  E0 02
    BEQ B00_8A62         ; $8A1D  F0 43
    CPX #$05             ; $8A1F  E0 05
    BNE B00_8A2B         ; $8A21  D0 08
    LDA #$30             ; $8A23  A9 30
    STA $0158,X          ; $8A25  9D 58 01
    JMP B00_8A69         ; $8A28  4C 69 8A
B00_8A2B:
    STA $0158,X          ; $8A2B  9D 58 01
    INY                  ; $8A2E  C8
    LDA ($E0),Y          ; $8A2F  B1 E0
    CMP #$88             ; $8A31  C9 88
    BEQ B00_8A55         ; $8A33  F0 20
    LDA $0116,X          ; $8A35  BD 16 01
    ORA #$80             ; $8A38  09 80
    STA $0116,X          ; $8A3A  9D 16 01
    LDA ($E0),Y          ; $8A3D  B1 E0
B00_8A3F:
    CPX #$04             ; $8A3F  E0 04
    BNE B00_8A46         ; $8A41  D0 03
    STA $019A            ; $8A43  8D 9A 01
B00_8A46:
    JSR B00_8CE8         ; $8A46  20 E8 8C
    BCS B00_8A4E         ; $8A49  B0 03
    STA $4001,X          ; $8A4B  9D 01 40
B00_8A4E:
    LDX $0192            ; $8A4E  AE 92 01
    INY                  ; $8A51  C8
B00_8A52:
    JMP B00_89CD         ; $8A52  4C CD 89
B00_8A55:
    LDA $0116,X          ; $8A55  BD 16 01
    AND #$7F             ; $8A58  29 7F
    STA $0116,X          ; $8A5A  9D 16 01
    LDA #$7F             ; $8A5D  A9 7F
    JMP B00_8A3F         ; $8A5F  4C 3F 8A
B00_8A62:
    STA $4008            ; $8A62  8D 08 40
    INY                  ; $8A65  C8
    JMP B00_89CD         ; $8A66  4C CD 89
B00_8A69:
    CMP #$00             ; $8A69  C9 00
    BNE B00_8A52         ; $8A6B  D0 E5
    INY                  ; $8A6D  C8
    JMP B00_89CD         ; $8A6E  4C CD 89
B00_8A71:
    LDA $0110,X          ; $8A71  BD 10 01
    STA $0104,X          ; $8A74  9D 04 01
    LDA ($E0),Y          ; $8A77  B1 E0
    CPX #$02             ; $8A79  E0 02
    BEQ B00_8A99         ; $8A7B  F0 1C
    LSR A                ; $8A7D  4A
    LSR A                ; $8A7E  4A
    LSR A                ; $8A7F  4A
    LSR A                ; $8A80  4A
    STA $0152,X          ; $8A81  9D 52 01
    LDA $0158,X          ; $8A84  BD 58 01
    AND #$10             ; $8A87  29 10
    BEQ B00_8AB1         ; $8A89  F0 26
    LDA $0152,X          ; $8A8B  BD 52 01
    ORA $0158,X          ; $8A8E  1D 58 01
B00_8A91:
    JSR B00_8CE8         ; $8A91  20 E8 8C
    BCS B00_8A99         ; $8A94  B0 03
    STA $4000,X          ; $8A96  9D 00 40
B00_8A99:
    LDX $0192            ; $8A99  AE 92 01
    LDA ($E0),Y          ; $8A9C  B1 E0
    AND #$0F             ; $8A9E  29 0F
    CPX #$05             ; $8AA0  E0 05
    BEQ B00_8AA9         ; $8AA2  F0 05
    STA $ED              ; $8AA4  85 ED
    INY                  ; $8AA6  C8
    LDA ($E0),Y          ; $8AA7  B1 E0
B00_8AA9:
    STA $EC              ; $8AA9  85 EC
    JSR B00_8BDA         ; $8AAB  20 DA 8B
    JMP B00_8F86         ; $8AAE  4C 86 8F
B00_8AB1:
    LDA $0158,X          ; $8AB1  BD 58 01
    JMP B00_8A91         ; $8AB4  4C 91 8A
B00_8AB7:
    LDA ($E0),Y          ; $8AB7  B1 E0
    AND #$0F             ; $8AB9  29 0F
    TAX                  ; $8ABB  AA
    INX                  ; $8ABC  E8
    LDA $0154            ; $8ABD  AD 54 01
    STA $E2              ; $8AC0  85 E2
    BEQ B00_8ADB         ; $8AC2  F0 17
    CMP #$80             ; $8AC4  C9 80
    BCS B00_8AE6         ; $8AC6  B0 1E
    INC $E2              ; $8AC8  E6 E2
    LDA $E2              ; $8ACA  A5 E2
B00_8ACC:
    DEX                  ; $8ACC  CA
    BEQ B00_8AD7         ; $8ACD  F0 08
    CLC                  ; $8ACF  18
    ADC $E2              ; $8AD0  65 E2
    BCS B00_8ADB         ; $8AD2  B0 07
    JMP B00_8ACC         ; $8AD4  4C CC 8A
B00_8AD7:
    CMP #$80             ; $8AD7  C9 80
    BCC B00_8ADD         ; $8AD9  90 02
B00_8ADB:
    LDA #$90             ; $8ADB  A9 90
B00_8ADD:
    STA $4008            ; $8ADD  8D 08 40
    STA $019C            ; $8AE0  8D 9C 01
    JMP B00_8B70         ; $8AE3  4C 70 8B
B00_8AE6:
    SEC                  ; $8AE6  38
    SBC #$80             ; $8AE7  E9 80
    JMP B00_8ADD         ; $8AE9  4C DD 8A
B00_8AEC:
    LDA #$01             ; $8AEC  A9 01
    STA $0166,X          ; $8AEE  9D 66 01
    LDA $0152,X          ; $8AF1  BD 52 01
    JSR B00_871E         ; $8AF4  20 1E 87
    LDA $0164,X          ; $8AF7  BD 64 01
    AND #$0F             ; $8AFA  29 0F
    STA $0168,X          ; $8AFC  9D 68 01
    LDA $0116,X          ; $8AFF  BD 16 01
    AND #$9B             ; $8B02  29 9B
    ORA #$02             ; $8B04  09 02
    STA $0116,X          ; $8B06  9D 16 01
    JMP B00_8B70         ; $8B09  4C 70 8B
B00_8B0C:
    AND #$7F             ; $8B0C  29 7F
    STA $E4              ; $8B0E  85 E4
    TXA                  ; $8B10  8A
    SEC                  ; $8B11  38
    SBC $E4              ; $8B12  E5 E4
    BCS B00_8B89         ; $8B14  B0 73
    SEC                  ; $8B16  38
    SBC #$E8             ; $8B17  E9 E8
    TAX                  ; $8B19  AA
    LDA $8FCC,X          ; $8B1A  BD CC 8F
    STA $EC              ; $8B1D  85 EC
    LDA $8FCD,X          ; $8B1F  BD CD 8F
    STA $ED              ; $8B22  85 ED
    JMP B00_8B94         ; $8B24  4C 94 8B
B00_8B27:
    LDA $0116,X          ; $8B27  BD 16 01
    AND #$DF             ; $8B2A  29 DF
    STA $0116,X          ; $8B2C  9D 16 01
    LDA $018C,X          ; $8B2F  BD 8C 01
    LSR A                ; $8B32  4A
    BCC B00_8B3D         ; $8B33  90 08
    LDA $0116,X          ; $8B35  BD 16 01
    ORA #$20             ; $8B38  09 20
    STA $0116,X          ; $8B3A  9D 16 01
B00_8B3D:
    RTS                  ; $8B3D  60
B00_8B3E:
    JSR B00_8C71         ; $8B3E  20 71 8C
    CPX #$02             ; $8B41  E0 02
    BNE B00_8B48         ; $8B43  D0 03
    JMP B00_8AB7         ; $8B45  4C B7 8A
B00_8B48:
    JSR B00_8B27         ; $8B48  20 27 8B
    LDA $0164,X          ; $8B4B  BD 64 01
    BMI B00_8AEC         ; $8B4E  30 9C
    LDA #$00             ; $8B50  A9 00
    STA $0168,X          ; $8B52  9D 68 01
    STA $016C,X          ; $8B55  9D 6C 01
    STA $016A,X          ; $8B58  9D 6A 01
    STA $0166,X          ; $8B5B  9D 66 01
    INC $0166,X          ; $8B5E  FE 66 01
    STY $E4              ; $8B61  84 E4
    JSR B00_86F3         ; $8B63  20 F3 86
    LDY $E4              ; $8B66  A4 E4
    LDA $0116,X          ; $8B68  BD 16 01
    AND #$99             ; $8B6B  29 99
    STA $0116,X          ; $8B6D  9D 16 01
B00_8B70:
    LDA ($E0),Y          ; $8B70  B1 E0
    AND #$F0             ; $8B72  29 F0
    LSR A                ; $8B74  4A
    LSR A                ; $8B75  4A
    LSR A                ; $8B76  4A
    TAX                  ; $8B77  AA
    TYA                  ; $8B78  98
    PHA                  ; $8B79  48
    LDY $0192            ; $8B7A  AC 92 01
    LDA $0161,Y          ; $8B7D  B9 61 01
    BEQ B00_8B8A         ; $8B80  F0 08
    BMI B00_8B0C         ; $8B82  30 88
    TXA                  ; $8B84  8A
    CLC                  ; $8B85  18
    ADC $0161,Y          ; $8B86  79 61 01
B00_8B89:
    TAX                  ; $8B89  AA
B00_8B8A:
    LDA $8FE4,X          ; $8B8A  BD E4 8F
    STA $EC              ; $8B8D  85 EC
    LDA $8FE5,X          ; $8B8F  BD E5 8F
    STA $ED              ; $8B92  85 ED
B00_8B94:
    PLA                  ; $8B94  68
    TAY                  ; $8B95  A8
    LDX $0192            ; $8B96  AE 92 01
    LDA $015E,X          ; $8B99  BD 5E 01
    TAX                  ; $8B9C  AA
B00_8B9D:
    CPX #$05             ; $8B9D  E0 05
    BEQ B00_8BA8         ; $8B9F  F0 07
    LSR $ED              ; $8BA1  46 ED
    ROR $EC              ; $8BA3  66 EC
    INX                  ; $8BA5  E8
    BNE B00_8B9D         ; $8BA6  D0 F5
B00_8BA8:
    LDX $0192            ; $8BA8  AE 92 01
    CPX #$02             ; $8BAB  E0 02
    BEQ B00_8BD4         ; $8BAD  F0 25
    LDA $018E,X          ; $8BAF  BD 8E 01
    BMI B00_8BB7         ; $8BB2  30 03
    JSR B00_8C24         ; $8BB4  20 24 8C
B00_8BB7:
    LDA $EC              ; $8BB7  A5 EC
    STA $017A,X          ; $8BB9  9D 7A 01
    LDA $ED              ; $8BBC  A5 ED
    STA $017C,X          ; $8BBE  9D 7C 01
    LDA $0116,X          ; $8BC1  BD 16 01
    AND #$10             ; $8BC4  29 10
    BEQ B00_8BD4         ; $8BC6  F0 0C
    LDA $017E,X          ; $8BC8  BD 7E 01
    BNE B00_8BD4         ; $8BCB  D0 07
    TYA                  ; $8BCD  98
    PHA                  ; $8BCE  48
    JSR B00_8857         ; $8BCF  20 57 88
    PLA                  ; $8BD2  68
    TAY                  ; $8BD3  A8
B00_8BD4:
    JSR B00_8BDA         ; $8BD4  20 DA 8B
    JMP B00_8F86         ; $8BD7  4C 86 8F
B00_8BDA:
    CPX #$02             ; $8BDA  E0 02
    BEQ B00_8BFD         ; $8BDC  F0 1F
    LDA $0180,X          ; $8BDE  BD 80 01
    CMP #$FF             ; $8BE1  C9 FF
    BNE B00_8BE6         ; $8BE3  D0 01
    RTS                  ; $8BE5  60
B00_8BE6:
    CPX #$05             ; $8BE6  E0 05
    BEQ B00_8BFD         ; $8BE8  F0 13
    LDA $ED              ; $8BEA  A5 ED
    CMP $0146,X          ; $8BEC  DD 46 01
    BNE B00_8BFF         ; $8BEF  D0 0E
    LDA $0116,X          ; $8BF1  BD 16 01
    BMI B00_8BFD         ; $8BF4  30 07
    LDA $0158,X          ; $8BF6  BD 58 01
    AND #$10             ; $8BF9  29 10
    BNE B00_8C0C         ; $8BFB  D0 0F
B00_8BFD:
    LDA $ED              ; $8BFD  A5 ED
B00_8BFF:
    STA $0146,X          ; $8BFF  9D 46 01
    ORA #$08             ; $8C02  09 08
    JSR B00_8CE8         ; $8C04  20 E8 8C
    BCS B00_8C0C         ; $8C07  B0 03
    STA $4003,X          ; $8C09  9D 03 40
B00_8C0C:
    LDA $EC              ; $8C0C  A5 EC
    LDX $0192            ; $8C0E  AE 92 01
    CPX #$02             ; $8C11  E0 02
    BCS B00_8C18         ; $8C13  B0 03
    STA $0178,X          ; $8C15  9D 78 01
B00_8C18:
    JSR B00_8CE8         ; $8C18  20 E8 8C
    BCS B00_8C20         ; $8C1B  B0 03
    STA $4002,X          ; $8C1D  9D 02 40
B00_8C20:
    LDX $0192            ; $8C20  AE 92 01
    RTS                  ; $8C23  60
B00_8C24:
    STY $E2              ; $8C24  84 E2
    LDA $0190,X          ; $8C26  BD 90 01
    CPX #$01             ; $8C29  E0 01
    BNE B00_8C2F         ; $8C2B  D0 02
    ORA #$04             ; $8C2D  09 04
B00_8C2F:
    TAY                  ; $8C2F  A8
    LDA $ED              ; $8C30  A5 ED
    STA $01A6,Y          ; $8C32  99 A6 01
    LDA $EC              ; $8C35  A5 EC
    STA $019E,Y          ; $8C37  99 9E 01
    LDA $018E,X          ; $8C3A  BD 8E 01
    AND #$40             ; $8C3D  29 40
    BEQ B00_8C5C         ; $8C3F  F0 1B
    LDA $018E,X          ; $8C41  BD 8E 01
    AND #$BF             ; $8C44  29 BF
    STA $018E,X          ; $8C46  9D 8E 01
    LDA #$03             ; $8C49  A9 03
    STA $E4              ; $8C4B  85 E4
B00_8C4D:
    INY                  ; $8C4D  C8
    LDA $ED              ; $8C4E  A5 ED
    STA $01A6,Y          ; $8C50  99 A6 01
    LDA $EC              ; $8C53  A5 EC
    STA $019E,Y          ; $8C55  99 9E 01
    DEC $E4              ; $8C58  C6 E4
    BNE B00_8C4D         ; $8C5A  D0 F1
B00_8C5C:
    LDY $E2              ; $8C5C  A4 E2
    INC $0190,X          ; $8C5E  FE 90 01
    LDA $0190,X          ; $8C61  BD 90 01
    AND #$03             ; $8C64  29 03
    STA $0190,X          ; $8C66  9D 90 01
    RTS                  ; $8C69  60
B00_8C6A:
    JSR B00_8F86         ; $8C6A  20 86 8F
    DEY                  ; $8C6D  88
    JMP B00_8972         ; $8C6E  4C 72 89
B00_8C71:
    LDA ($E0),Y          ; $8C71  B1 E0
    AND #$0F             ; $8C73  29 0F
    STA $E2              ; $8C75  85 E2
    BEQ B00_8C86         ; $8C77  F0 0D
    LDA $0110,X          ; $8C79  BD 10 01
B00_8C7C:
    CLC                  ; $8C7C  18
    ADC $0110,X          ; $8C7D  7D 10 01
    DEC $E2              ; $8C80  C6 E2
    BNE B00_8C7C         ; $8C82  D0 F8
    BEQ B00_8C89         ; $8C84  F0 03
B00_8C86:
    LDA $0110,X          ; $8C86  BD 10 01
B00_8C89:
    STA $0104,X          ; $8C89  9D 04 01
    CPX #$02             ; $8C8C  E0 02
    BCS B00_8CAB         ; $8C8E  B0 1B
    LDA $0116,X          ; $8C90  BD 16 01
    AND #$10             ; $8C93  29 10
    BEQ B00_8CAB         ; $8C95  F0 14
    LDA $017E,X          ; $8C97  BD 7E 01
    STA $0180,X          ; $8C9A  9D 80 01
    INC $0180,X          ; $8C9D  FE 80 01
    LDA #$00             ; $8CA0  A9 00
    STA $0186,X          ; $8CA2  9D 86 01
    STA $018A,X          ; $8CA5  9D 8A 01
    STA $0188,X          ; $8CA8  9D 88 01
B00_8CAB:
    CPX #$02             ; $8CAB  E0 02
    BEQ B00_8CBC         ; $8CAD  F0 0D
    CPX #$03             ; $8CAF  E0 03
    BEQ B00_8C6A         ; $8CB1  F0 B7
    LDA $0170,X          ; $8CB3  BD 70 01
    JSR B00_8CBD         ; $8CB6  20 BD 8C
    STA $016E,X          ; $8CB9  9D 6E 01
B00_8CBC:
    RTS                  ; $8CBC  60
B00_8CBD:
    AND #$0F             ; $8CBD  29 0F
    STA $E2              ; $8CBF  85 E2
    LDA #$00             ; $8CC1  A9 00
    STA $E4              ; $8CC3  85 E4
    STA $E5              ; $8CC5  85 E5
B00_8CC7:
    DEC $E2              ; $8CC7  C6 E2
    BMI B00_8CD9         ; $8CC9  30 0E
    CLC                  ; $8CCB  18
    LDA $0104,X          ; $8CCC  BD 04 01
    ADC $E4              ; $8CCF  65 E4
    STA $E4              ; $8CD1  85 E4
    BCC B00_8CC7         ; $8CD3  90 F2
    INC $E5              ; $8CD5  E6 E5
    BNE B00_8CC7         ; $8CD7  D0 EE
B00_8CD9:
    ASL A                ; $8CD9  0A
    ROL $E5              ; $8CDA  26 E5
    ASL A                ; $8CDC  0A
    ROL $E5              ; $8CDD  26 E5
    ASL A                ; $8CDF  0A
    ROL $E5              ; $8CE0  26 E5
    ASL A                ; $8CE2  0A
    ROL $E5              ; $8CE3  26 E5
    LDA $E5              ; $8CE5  A5 E5
    RTS                  ; $8CE7  60
B00_8CE8:
    PHA                  ; $8CE8  48
    CPX #$00             ; $8CE9  E0 00
    BEQ B00_8CF3         ; $8CEB  F0 06
    LDX $0193            ; $8CED  AE 93 01
B00_8CF0:
    CLC                  ; $8CF0  18
    PLA                  ; $8CF1  68
    RTS                  ; $8CF2  60
B00_8CF3:
    LDA $010E            ; $8CF3  AD 0E 01
    BEQ B00_8CF0         ; $8CF6  F0 F8
    SEC                  ; $8CF8  38
    PLA                  ; $8CF9  68
    RTS                  ; $8CFA  60
    .byte $20, $75, $8C, $A9, $00, $E0, $02, $D0, $06, $20, $45, $8F, $4C, $14, $8D, $A9 ; $8CFB
    .byte $30, $20, $E8, $8C, $B0, $03, $9D, $00, $40, $AE, $92, $01, $BD, $16, $01, $09 ; $8D0B
    .byte $40, $9D, $16, $01, $4C, $86, $8F, $9D, $10, $01, $C8, $B1, $E0, $E0, $02, $F0 ; $8D1B
    .byte $3D, $29, $F0, $9D, $58, $01, $B1, $E0, $29, $0F, $9D, $52, $01, $C8, $B1, $E0 ; $8D2B
    .byte $9D, $64, $01, $10, $04, $A9, $00, $F0, $03, $BD, $52, $01, $9D, $76, $01, $C8 ; $8D3B
B00_8D4B:
    LDA ($E0),Y          ; $8D4B  B1 E0
    AND #$0F             ; $8D4D  29 0F
    STA $0170,X          ; $8D4F  9D 70 01
    LDA ($E0),Y          ; $8D52  B1 E0
    LSR A                ; $8D54  4A
    LSR A                ; $8D55  4A
    LSR A                ; $8D56  4A
    LSR A                ; $8D57  4A
    STA $0172,X          ; $8D58  9D 72 01
    LDA $0172,X          ; $8D5B  BD 72 01
    BNE B00_8D62         ; $8D5E  D0 02
    LDA #$01             ; $8D60  A9 01
B00_8D62:
    STA $0174,X          ; $8D62  9D 74 01
    INY                  ; $8D65  C8
    JMP B00_8925         ; $8D66  4C 25 89
    .byte $8D, $54, $01, $C8, $4C, $25, $89, $C9, $06, $B0, $07, $9D, $5E, $01, $C8, $4C ; $8D69
    .byte $25, $89, $29, $0F, $38, $E9, $06, $0A, $AA, $BD, $92, $8D, $85, $E2, $BD, $93 ; $8D79
    .byte $8D, $85, $E3, $AE, $92, $01, $6C, $E2, $00, $A0, $8D, $AA, $8D, $B4, $8D, $B8 ; $8D89
    .byte $8D, $E5, $8D, $F8, $8D, $43, $8E, $C8, $B1, $E0, $9D, $10, $01, $C8, $4C, $25 ; $8D99
    .byte $89, $C8, $B1, $E0, $9D, $64, $01, $C8, $4C, $25, $89, $C8, $4C, $4B, $8D, $C8 ; $8DA9
    .byte $B1, $E0, $F0, $15, $29, $0F, $F0, $1C, $B1, $E0, $9D, $8C, $01, $BD, $16, $01 ; $8DB9
    .byte $09, $20, $9D, $16, $01, $C8, $4C, $25, $89, $BD, $16, $01, $29, $DF, $9D, $16 ; $8DC9
    .byte $01, $4C, $CE, $8D, $B1, $E0, $9D, $58, $01, $4C, $CE, $8D, $C8, $B1, $E0, $30 ; $8DD9
    .byte $08, $0A, $9D, $61, $01, $C8, $4C, $25, $89, $0A, $09, $80, $4C, $EB, $8D, $C8 ; $8DE9
    .byte $B1, $E0, $F0, $3B, $29, $F0, $4A, $4A, $4A, $4A, $C9, $00, $F0, $16, $85, $E2 ; $8DF9
    .byte $C6, $E2, $F0, $0D, $BD, $10, $01, $18, $7D, $10, $01, $C6, $E2, $D0, $F9, $F0 ; $8E09
    .byte $03, $BD, $10, $01, $9D, $7E, $01, $B1, $E0, $29, $0F, $9D, $82, $01, $C8, $B1 ; $8E19
    .byte $E0, $9D, $84, $01, $BD, $16, $01, $09, $10, $9D, $16, $01, $4C, $CE, $8D, $BD ; $8E29
    .byte $16, $01, $29, $EF, $9D, $16, $01, $4C, $CE, $8D, $C8, $B1, $E0, $F0, $17, $C9 ; $8E39
    .byte $04, $90, $05, $38, $E9, $03, $09, $10, $09, $40, $9D, $8E, $01, $A9, $00, $9D ; $8E49
    .byte $90, $01, $C8, $4C, $25, $89, $A9, $80, $9D, $8E, $01, $D0, $F5 ; $8E59
B00_8E66:
    CMP #$0E             ; $8E66  C9 0E
    BEQ B00_8EB2         ; $8E68  F0 48
    BCC B00_8E6F         ; $8E6A  90 03
    JMP B00_8F10         ; $8E6C  4C 10 8F
B00_8E6F:
    CMP #$0D             ; $8E6F  C9 0D
    BEQ B00_8E82         ; $8E71  F0 0F
    CMP #$0B             ; $8E73  C9 0B
    BEQ B00_8EA0         ; $8E75  F0 29
    LDA ($E0),Y          ; $8E77  B1 E0
    AND #$0F             ; $8E79  29 0F
    STA $0176,X          ; $8E7B  9D 76 01
    INY                  ; $8E7E  C8
    JMP B00_8925         ; $8E7F  4C 25 89
B00_8E82:
    JSR B00_8FA3         ; $8E82  20 A3 8F
    INY                  ; $8E85  C8
    TYA                  ; $8E86  98
    CLC                  ; $8E87  18
    ADC $E0              ; $8E88  65 E0
    STA $013A,X          ; $8E8A  9D 3A 01
    LDA #$00             ; $8E8D  A9 00
    TAY                  ; $8E8F  A8
    ADC $E1              ; $8E90  65 E1
    STA $0140,X          ; $8E92  9D 40 01
    LDA $0116,X          ; $8E95  BD 16 01
    ORA #$08             ; $8E98  09 08
    STA $0116,X          ; $8E9A  9D 16 01
    JMP B00_8EC5         ; $8E9D  4C C5 8E
B00_8EA0:
    INY                  ; $8EA0  C8
    TYA                  ; $8EA1  98
    CLC                  ; $8EA2  18
    ADC $E0              ; $8EA3  65 E0
    STA $012E,X          ; $8EA5  9D 2E 01
    LDA #$00             ; $8EA8  A9 00
    ADC $E1              ; $8EAA  65 E1
    STA $0134,X          ; $8EAC  9D 34 01
    JMP B00_8EC8         ; $8EAF  4C C8 8E
B00_8EB2:
    INC $011C,X          ; $8EB2  FE 1C 01
    LDA $011C,X          ; $8EB5  BD 1C 01
    INY                  ; $8EB8  C8
    CMP ($E0),Y          ; $8EB9  D1 E0
    BEQ B00_8ED4         ; $8EBB  F0 17
    BMI B00_8EEA         ; $8EBD  30 2B
    DEC $011C,X          ; $8EBF  DE 1C 01
    JSR B00_8FA3         ; $8EC2  20 A3 8F
B00_8EC5:
    JSR B00_8F96         ; $8EC5  20 96 8F
B00_8EC8:
    LDA $0116,X          ; $8EC8  BD 16 01
    LSR A                ; $8ECB  4A
    BCS B00_8ED1         ; $8ECC  B0 03
    JMP B00_8925         ; $8ECE  4C 25 89
B00_8ED1:
    JMP B00_89CD         ; $8ED1  4C CD 89
B00_8ED4:
    LDA #$00             ; $8ED4  A9 00
    STA $011C,X          ; $8ED6  9D 1C 01
    INY                  ; $8ED9  C8
    TYA                  ; $8EDA  98
    CLC                  ; $8EDB  18
    ADC $E0              ; $8EDC  65 E0
    STA $E0              ; $8EDE  85 E0
    LDA #$00             ; $8EE0  A9 00
    TAY                  ; $8EE2  A8
    ADC $E1              ; $8EE3  65 E1
    STA $E1              ; $8EE5  85 E1
    JMP B00_8EC8         ; $8EE7  4C C8 8E
B00_8EEA:
    LDA $012E,X          ; $8EEA  BD 2E 01
    STA $0122,X          ; $8EED  9D 22 01
    LDA $0134,X          ; $8EF0  BD 34 01
    STA $0128,X          ; $8EF3  9D 28 01
    JMP B00_8EC5         ; $8EF6  4C C5 8E
B00_8EF9:
    LDA $013A,X          ; $8EF9  BD 3A 01
    STA $E0              ; $8EFC  85 E0
    LDA $0140,X          ; $8EFE  BD 40 01
    STA $E1              ; $8F01  85 E1
    LDA $0116,X          ; $8F03  BD 16 01
    AND #$F7             ; $8F06  29 F7
    STA $0116,X          ; $8F08  9D 16 01
    LDY #$00             ; $8F0B  A0 00
    JMP B00_8EC8         ; $8F0D  4C C8 8E
B00_8F10:
    LDA $0116,X          ; $8F10  BD 16 01
    AND #$08             ; $8F13  29 08
    BEQ B00_8F1A         ; $8F15  F0 03
    JMP B00_8EF9         ; $8F17  4C F9 8E
B00_8F1A:
    LDA $010A,X          ; $8F1A  BD 0A 01
    STA $E4              ; $8F1D  85 E4
    LDA #$00             ; $8F1F  A9 00
    STA $010A,X          ; $8F21  9D 0A 01
    TXA                  ; $8F24  8A
    ASL A                ; $8F25  0A
    TAX                  ; $8F26  AA
    LDA $8FB8,X          ; $8F27  BD B8 8F
    STA $E2              ; $8F2A  85 E2
    LDA $8FB9,X          ; $8F2C  BD B9 8F
    STA $E3              ; $8F2F  85 E3
    LDX $0192            ; $8F31  AE 92 01
    JMP ($00E2)          ; $8F34  6C E2 00
    .byte $A9, $30, $20, $E8, $8C, $B0, $03, $9D, $00, $40, $AE, $92, $01, $60 ; $8F37
B00_8F45:
    LDA #$0B             ; $8F45  A9 0B
    STA $4015            ; $8F47  8D 15 40
    LDA #$00             ; $8F4A  A9 00
    STA $4008            ; $8F4C  8D 08 40
    LDA #$0F             ; $8F4F  A9 0F
    STA $4015            ; $8F51  8D 15 40
    RTS                  ; $8F54  60
    .byte $AE, $93, $01, $A9, $30, $9D, $00, $40, $A9, $7F, $9D, $01, $40, $BD, $0A, $01 ; $8F55
    .byte $F0, $06, $AC, $93, $01, $20, $F3, $85, $AE, $92, $01, $60, $A9, $30, $8D, $0C ; $8F65
    .byte $40, $A5, $E4, $C9, $83, $F0, $04, $C9, $7F, $D0, $15, $A9, $FF, $8D, $9D, $01 ; $8F75
    .byte $60 ; $8F85
B00_8F86:
    INY                  ; $8F86  C8
    TYA                  ; $8F87  98
    CLC                  ; $8F88  18
    ADC $E0              ; $8F89  65 E0
    STA $0122,X          ; $8F8B  9D 22 01
    LDA #$00             ; $8F8E  A9 00
    ADC $E1              ; $8F90  65 E1
    STA $0128,X          ; $8F92  9D 28 01
    RTS                  ; $8F95  60
B00_8F96:
    LDY #$00             ; $8F96  A0 00
    LDA $0122,X          ; $8F98  BD 22 01
    STA $E0              ; $8F9B  85 E0
    LDA $0128,X          ; $8F9D  BD 28 01
    STA $E1              ; $8FA0  85 E1
    RTS                  ; $8FA2  60
B00_8FA3:
    INY                  ; $8FA3  C8
    LDA ($E0),Y          ; $8FA4  B1 E0
    STA $0122,X          ; $8FA6  9D 22 01
    INY                  ; $8FA9  C8
    LDA ($E0),Y          ; $8FAA  B1 E0
    STA $0128,X          ; $8FAC  9D 28 01
    RTS                  ; $8FAF  60
    .byte $F3, $86, $95, $87, $A9, $87, $FA, $87, $37, $8F, $37, $8F, $45, $8F, $71, $8F ; $8FB0
    .byte $55, $8F, $37, $8F, $FB, $8C, $22, $8D, $70, $8D, $66, $8E, $5C, $0D, $9C, $0C ; $8FC0
    .byte $E8, $0B, $3C, $0B, $9C, $0A, $02, $0A, $72, $09, $EC, $08, $6C, $08, $F2, $07 ; $8FD0
    .byte $80, $07, $14, $07, $AE, $06, $4E, $06, $F4, $05, $9E, $05, $4E, $05, $01, $05 ; $8FE0
    .byte $B9, $04, $76, $04, $36, $04, $F9, $03, $C0, $03, $8A, $03, $57, $03, $27, $03 ; $8FF0
    .byte $FA, $02, $CF, $02, $A7, $02, $81, $02, $5D, $02, $3B, $02, $1B, $02, $FD, $01 ; $9000
    .byte $E0, $01, $C5, $01, $8B, $91 ; $9010
B00_9016:
    LDA $010D            ; $9016  AD 0D 01
    CMP #$83             ; $9019  C9 83
    BNE B00_901E         ; $901B  D0 01
    RTS                  ; $901D  60
B00_901E:
    STX $E2              ; $901E  86 E2
    STY $E3              ; $9020  84 E3
    LDA #$00             ; $9022  A9 00
    TAY                  ; $9024  A8
B00_9025:
    STA $010A,Y          ; $9025  99 0A 01
    INY                  ; $9028  C8
    CPY #$06             ; $9029  C0 06
    BCC B00_9025         ; $902B  90 F8
    STA $0180            ; $902D  8D 80 01
    STA $0181            ; $9030  8D 81 01
    STA $0198            ; $9033  8D 98 01
    STA $0199            ; $9036  8D 99 01
    STA $0197            ; $9039  8D 97 01
    LDX $E2              ; $903C  A6 E2
    LDY $E3              ; $903E  A4 E3
    JSR B00_8F45         ; $9040  20 45 8F
    LDA #$30             ; $9043  A9 30
    STA $4000            ; $9045  8D 00 40
    STA $4004            ; $9048  8D 04 40
    STA $400C            ; $904B  8D 0C 40
    LDA #$7F             ; $904E  A9 7F
    STA $4001            ; $9050  8D 01 40
    STA $4005            ; $9053  8D 05 40
    RTS                  ; $9056  60
B00_9057:
    STA $0194            ; $9057  8D 94 01
    CMP #$8F             ; $905A  C9 8F
    BCC B00_9061         ; $905C  90 03
    JMP B00_898E         ; $905E  4C 8E 89
B00_9061:
    CMP #$4B             ; $9061  C9 4B
    BCC B00_9095         ; $9063  90 30
    LDA $010D            ; $9065  AD 0D 01
    CMP #$83             ; $9068  C9 83
    BNE B00_906D         ; $906A  D0 01
    RTS                  ; $906C  60
B00_906D:
    LDA #$00             ; $906D  A9 00
    STA $0180            ; $906F  8D 80 01
    STA $0181            ; $9072  8D 81 01
    LDA $0194            ; $9075  AD 94 01
    CMP #$77             ; $9078  C9 77
    BEQ B00_9083         ; $907A  F0 07
    CMP #$7F             ; $907C  C9 7F
    BEQ B00_908E         ; $907E  F0 0E
    JSR B00_9016         ; $9080  20 16 90
B00_9083:
    LDA $0194            ; $9083  AD 94 01
    CMP #$83             ; $9086  C9 83
    BEQ B00_908E         ; $9088  F0 04
    CMP #$7F             ; $908A  C9 7F
    BNE B00_90B2         ; $908C  D0 24
B00_908E:
    LDA #$00             ; $908E  A9 00
    STA $019D            ; $9090  8D 9D 01
    BEQ B00_90B2         ; $9093  F0 1D
B00_9095:
    CMP #$16             ; $9095  C9 16
    BNE B00_909F         ; $9097  D0 06
    CMP $010F            ; $9099  CD 0F 01
    BNE B00_909F         ; $909C  D0 01
    RTS                  ; $909E  60
B00_909F:
    LDA $010B            ; $909F  AD 0B 01
    CMP #$77             ; $90A2  C9 77
    BNE B00_90B2         ; $90A4  D0 0C
    LDA $0194            ; $90A6  AD 94 01
    CMP #$07             ; $90A9  C9 07
    BCC B00_90B2         ; $90AB  90 05
    CMP #$3E             ; $90AD  C9 3E
    BCS B00_90B2         ; $90AF  B0 01
    RTS                  ; $90B1  60
B00_90B2:
    TXA                  ; $90B2  8A
    PHA                  ; $90B3  48
    TYA                  ; $90B4  98
    PHA                  ; $90B5  48
    LDA $9014            ; $90B6  AD 14 90
    STA $E8              ; $90B9  85 E8
    LDA $9015            ; $90BB  AD 15 90
    STA $E9              ; $90BE  85 E9
    LDA #$03             ; $90C0  A9 03
    STA $EA              ; $90C2  85 EA
B00_90C4:
    LDA $0194            ; $90C4  AD 94 01
    CLC                  ; $90C7  18
    ADC $E8              ; $90C8  65 E8
    STA $E8              ; $90CA  85 E8
    LDA #$00             ; $90CC  A9 00
    ADC $E9              ; $90CE  65 E9
    STA $E9              ; $90D0  85 E9
    DEC $EA              ; $90D2  C6 EA
    BNE B00_90C4         ; $90D4  D0 EE
    LDY #$00             ; $90D6  A0 00
    STY $EB              ; $90D8  84 EB
    LDA ($E8),Y          ; $90DA  B1 E8
    LSR A                ; $90DC  4A
    LSR A                ; $90DD  4A
    LSR A                ; $90DE  4A
    AND #$03             ; $90DF  29 03
    STA $EA              ; $90E1  85 EA
B00_90E3:
    LDA $EB              ; $90E3  A5 EB
    ASL A                ; $90E5  0A
    CLC                  ; $90E6  18
    ADC $EB              ; $90E7  65 EB
    TAY                  ; $90E9  A8
    LDA ($E8),Y          ; $90EA  B1 E8
    AND #$07             ; $90EC  29 07
    TAX                  ; $90EE  AA
    LDA $0194            ; $90EF  AD 94 01
    CMP $010A,X          ; $90F2  DD 0A 01
    BCS B00_90FA         ; $90F5  B0 03
    JMP B00_9174         ; $90F7  4C 74 91
B00_90FA:
    LDA #$00             ; $90FA  A9 00
    STA $010A,X          ; $90FC  9D 0A 01
    INY                  ; $90FF  C8
    LDA ($E8),Y          ; $9100  B1 E8
    STA $0122,X          ; $9102  9D 22 01
    STA $E6              ; $9105  85 E6
    INY                  ; $9107  C8
    LDA ($E8),Y          ; $9108  B1 E8
    STA $0128,X          ; $910A  9D 28 01
    STA $E7              ; $910D  85 E7
    LDA #$F8             ; $910F  A9 F8
    STA $0146,X          ; $9111  9D 46 01
    LDA #$01             ; $9114  A9 01
    STA $0104,X          ; $9116  9D 04 01
    CPX #$03             ; $9119  E0 03
    BCS B00_9133         ; $911B  B0 16
    CPX #$02             ; $911D  E0 02
    BEQ B00_912E         ; $911F  F0 0D
    LDA #$00             ; $9121  A9 00
    STA $0176,X          ; $9123  9D 76 01
    STA $018C,X          ; $9126  9D 8C 01
    LDA #$80             ; $9129  A9 80
    STA $018E,X          ; $912B  9D 8E 01
B00_912E:
    LDA #$00             ; $912E  A9 00
    STA $0161,X          ; $9130  9D 61 01
B00_9133:
    LDA #$00             ; $9133  A9 00
    STA $011C,X          ; $9135  9D 1C 01
    TAY                  ; $9138  A8
    LDA ($E6),Y          ; $9139  B1 E6
    INY                  ; $913B  C8
    CMP #$30             ; $913C  C9 30
    BCC B00_9147         ; $913E  90 07
    DEY                  ; $9140  88
    STY $0198            ; $9141  8C 98 01
    STY $0197            ; $9144  8C 97 01
B00_9147:
    TYA                  ; $9147  98
    STA $0116,X          ; $9148  9D 16 01
    LDA $0194            ; $914B  AD 94 01
    STA $010A,X          ; $914E  9D 0A 01
    TXA                  ; $9151  8A
    CMP #$01             ; $9152  C9 01
    BCC B00_9182         ; $9154  90 2C
    CPX #$05             ; $9156  E0 05
    BNE B00_915F         ; $9158  D0 05
    LDA #$0C             ; $915A  A9 0C
    JMP B00_9163         ; $915C  4C 63 91
B00_915F:
    ASL A                ; $915F  0A
    ASL A                ; $9160  0A
    AND #$0F             ; $9161  29 0F
B00_9163:
    TAX                  ; $9163  AA
    LDA #$00             ; $9164  A9 00
    CPX #$08             ; $9166  E0 08
    BEQ B00_916C         ; $9168  F0 02
    LDA #$30             ; $916A  A9 30
B00_916C:
    STA $4000,X          ; $916C  9D 00 40
    LDA #$7F             ; $916F  A9 7F
    STA $4001,X          ; $9171  9D 01 40
B00_9174:
    INC $EB              ; $9174  E6 EB
    DEC $EA              ; $9176  C6 EA
    BPL B00_917F         ; $9178  10 05
    PLA                  ; $917A  68
    TAY                  ; $917B  A8
    PLA                  ; $917C  68
    TAX                  ; $917D  AA
    RTS                  ; $917E  60
B00_917F:
    JMP B00_90E3         ; $917F  4C E3 90
B00_9182:
    ORA #$04             ; $9182  09 04
    TAY                  ; $9184  A8
    LDA $010A,Y          ; $9185  B9 0A 01
    BNE B00_9174         ; $9188  D0 EA
    TXA                  ; $918A  8A
    JMP B00_915F         ; $918B  4C 5F 91
    .byte $05, $3E, $93, $05, $3B, $93, $05, $3F, $93, $05, $45, $93, $05, $57, $93, $05 ; $918E
    .byte $5E, $93, $04, $6B, $93, $0C, $80, $93, $05, $92, $93, $0C, $99, $93, $05, $A8 ; $919E
    .byte $93, $0C, $B7, $93, $05, $C3, $93, $0C, $B7, $93, $05, $D1, $93, $0C, $E7, $93 ; $91AE
    .byte $05, $F7, $93, $0C, $E2, $93, $05, $F5, $93, $0C, $00, $94, $05, $10, $94, $05 ; $91BE
    .byte $15, $94, $0C, $27, $94, $05, $34, $94, $0C, $5C, $94, $05, $6F, $94, $05, $87 ; $91CE
    .byte $94, $0C, $97, $94, $05, $AA, $94, $0C, $D2, $94, $05, $EA, $94, $04, $FC, $94 ; $91DE
    .byte $04, $0C, $95, $0C, $28, $95, $05, $45, $95, $04, $A6, $95, $0C, $59, $95, $05 ; $91EE
    .byte $8E, $95, $05, $91, $95, $05, $AE, $95, $04, $CE, $95, $0C, $36, $96, $05, $61 ; $91FE
    .byte $96, $05, $79, $96, $0C, $8F, $96, $05, $AE, $96, $0C, $BD, $96, $05, $CC, $96 ; $920E
    .byte $04, $E0, $96, $04, $B0, $94, $04, $E1, $96, $04, $16, $97, $04, $32, $97, $0C ; $921E
    .byte $4A, $97, $05, $52, $97, $05, $52, $97, $04, $59, $97, $0C, $63, $97, $05, $8D ; $922E
    .byte $97, $04, $BC, $97, $04, $CC, $97, $04, $9F, $97, $0C, $FA, $97, $05, $09, $98 ; $923E
    .byte $04, $23, $98, $0C, $65, $98, $05, $8F, $98, $04, $B5, $98, $04, $B5, $98, $0C ; $924E
    .byte $46, $99, $05, $B7, $99, $14, $F7, $98, $01, $EC, $98, $05, $23, $99, $14, $1B ; $925E
    .byte $9A, $01, $16, $9A, $05, $4D, $9A, $18, $65, $9A, $01, $18, $9D, $02, $29, $9F ; $926E
    .byte $03, $9A, $A0, $03, $2D, $A1, $18, $34, $A1, $01, $11, $A2, $02, $E0, $A2, $03 ; $927E
    .byte $58, $A3, $18, $A1, $A3, $01, $AB, $A4, $02, $AB, $A5, $03, $8A, $A6, $18, $CC ; $928E
    .byte $A6, $01, $A3, $A7, $02, $99, $A8, $03, $48, $A9, $18, $9E, $A9, $01, $9C, $AA ; $929E
    .byte $02, $81, $AB, $03, $FF, $AB, $18, $5D, $AC, $01, $86, $AC, $02, $97, $AC, $03 ; $92AE
    .byte $DD, $AC, $18, $00, $AD, $01, $0D, $AD, $02, $1C, $AD, $03, $25, $AD, $18, $2D ; $92BE
    .byte $AD, $01, $1D, $AE, $02, $0A, $AF, $03, $BC, $AF, $18, $1B, $B0, $01, $65, $B1 ; $92CE
    .byte $02, $66, $B2, $03, $27, $B3, $18, $A0, $B3, $01, $6C, $B4, $02, $41, $B5, $03 ; $92DE
    .byte $DA, $B5, $18, $35, $B6, $01, $72, $B6, $02, $A9, $B6, $03, $C9, $B6, $18, $D2 ; $92EE
    .byte $B6, $01, $87, $B7, $02, $4F, $B8, $03, $F8, $B8, $18, $E9, $B9, $01, $2C, $BA ; $92FE
    .byte $02, $73, $BA, $03, $98, $BA, $18, $59, $B9, $01, $A3, $B9, $02, $BF, $B9, $03 ; $930E
    .byte $D3, $B9, $18, $BB, $BA, $01, $51, $BC, $02, $1E, $BD, $03, $9F, $BD, $18, $EE ; $931E
    .byte $BD, $01, $34, $BE, $02, $73, $BE, $03, $96, $BE, $06, $41, $FE, $01, $00, $F2 ; $932E
    .byte $FF, $01, $65, $24, $21, $11, $FF, $01, $A2, $A1, $71, $61, $61, $50, $51, $50 ; $933E
    .byte $51, $50, $41, $30, $20, $20, $06, $10, $FF, $01, $B6, $96, $76, $54, $36, $FF ; $934E
    .byte $01, $EE, $76, $34, $43, $24, $13, $12, $12, $10, $10, $10, $FF, $04, $B0, $9C ; $935E
    .byte $51, $40, $70, $FE, $50, $A9, $F8, $01, $00, $00, $05, $B0, $8C, $30, $A0, $10 ; $936E
    .byte $A0, $FF, $01, $B0, $88, $30, $20, $00, $00, $00, $00, $F8, $02, $40, $10, $20 ; $937E
    .byte $10, $10, $10, $FF, $01, $9B, $03, $00, $02, $96, $FF, $06, $B0, $8B, $32, $3B ; $938E
    .byte $0A, $70, $DC, $40, $13, $F8, $06, $30, $11, $FF, $01, $B2, $BC, $BA, $02, $BD ; $939E
    .byte $BA, $B7, $A6, $95, $84, $73, $72, $71, $FF, $03, $B0, $85, $30, $0F, $30, $1B ; $93AE
    .byte $20, $2A, $20, $1E, $FF, $01, $8A, $8E, $8C, $89, $87, $86, $8C, $7D, $7F, $83 ; $93BE
    .byte $8E, $8C, $FF, $02, $9E, $9D, $9A, $9E, $98, $6A, $59, $69, $5C, $7D, $01, $6F ; $93CE
    .byte $6A, $6E, $7F, $FF, $07, $B0, $83, $10, $00, $03, $B0, $83, $80, $D5, $80, $FE ; $93DE
    .byte $71, $94, $51, $A6, $51, $AE, $FF, $07, $10, $02, $8C, $99, $7A, $04, $8A, $8C ; $93EE
    .byte $8E, $FF, $06, $30, $8C, $50, $40, $90, $20, $F8, $01, $00, $00, $F8, $06, $10 ; $93FE
    .byte $20, $FF, $02, $F5, $F3, $F1, $FF, $01, $5A, $79, $97, $B7, $D8, $98, $78, $79 ; $940E
    .byte $7A, $5A, $5A, $5B, $3D, $3D, $3A, $1D, $FF, $04, $B0, $8B, $43, $66, $0C, $70 ; $941E
    .byte $8B, $32, $66, $12, $66, $FF, $01, $00, $ED, $EC, $EB, $EA, $E9, $E8, $E7, $E6 ; $942E
    .byte $E5, $E4, $03, $00, $01, $5D, $5C, $5B, $5A, $59, $58, $57, $56, $55, $54, $53 ; $943E
    .byte $52, $2D, $2C, $2B, $2A, $29, $28, $27, $26, $25, $24, $23, $22, $FF, $03, $B0 ; $944E
    .byte $83, $FB, $00, $00, $50, $A6, $40, $CD, $31, $64, $21, $76, $11, $7F, $FE, $05 ; $945E
    .byte $FF, $01, $FB, $3A, $59, $97, $87, $68, $01, $58, $48, $49, $4A, $3A, $3A, $3B ; $946E
    .byte $2D, $2D, $2A, $1B, $1D, $1D, $FE, $05, $FF, $02, $FB, $01, $D4, $54, $02, $D4 ; $947E
    .byte $54, $FE, $02, $94, $54, $33, $23, $12, $FF, $03, $30, $88, $70, $12, $70, $16 ; $948E
    .byte $70, $20, $70, $17, $02, $B0, $88, $30, $12, $10, $11, $FF, $03, $B8, $98, $55 ; $949E
    .byte $34, $FF, $02, $B0, $88, $80, $FE, $80, $D4, $80, $9C, $80, $7F, $80, $6A, $50 ; $94AE
    .byte $FE, $50, $D4, $50, $9C, $50, $7F, $50, $6A, $30, $FE, $30, $D4, $20, $9C, $20 ; $94BE
    .byte $7F, $20, $6A, $FF, $05, $F0, $9A, $10, $00, $F8, $02, $82, $55, $F8, $03, $10 ; $94CE
    .byte $00, $41, $AA, $10, $00, $32, $21, $10, $00, $12, $21, $FF, $05, $10, $01, $E6 ; $94DE
    .byte $10, $DE, $10, $04, $4A, $3B, $2C, $01, $10, $04, $19, $1A, $1B, $FF, $01, $30 ; $94EE
    .byte $83, $C1, $AE, $91, $58, $80, $80, $10, $00, $F8, $14, $80, $2A, $FF, $01, $70 ; $94FE
    .byte $88, $10, $00, $04, $70, $82, $C0, $FE, $05, $30, $82, $B0, $2A, $90, $2B, $70 ; $950E
    .byte $2A, $50, $2B, $30, $2A, $20, $2B, $10, $2A, $FF, $02, $70, $82, $A0, $20, $01 ; $951E
    .byte $30, $8A, $71, $40, $01, $30, $8A, $92, $A0, $09, $B0, $8A, $52, $A0, $F8, $0A ; $952E
    .byte $32, $A0, $22, $A0, $12, $A0, $FF, $01, $7D, $02, $00, $01, $97, $02, $B3, $03 ; $953E
    .byte $00, $77, $00, $57, $00, $37, $00, $27, $00, $17, $FF, $01, $30, $83, $F3, $34 ; $954E
    .byte $F3, $58, $F3, $84, $B3, $FB, $B4, $54, $94, $EF, $95, $35, $35, $A4, $73, $34 ; $955E
    .byte $73, $58, $53, $84, $33, $A6, $02, $30, $89, $73, $34, $73, $46, $93, $4F, $93 ; $956E
    .byte $58, $B3, $64, $73, $84, $53, $91, $43, $FB, $34, $03, $24, $13, $14, $25, $FF ; $957E
    .byte $01, $7C, $FF, $02, $EA, $DF, $CB, $BA, $A8, $00, $9A, $8B, $00, $7A, $68, $5A ; $958E
    .byte $00, $48, $35, $2F, $00, $1A, $18, $FF, $0F, $B0, $A5, $F8, $30, $60, $22, $FF ; $959E
    .byte $01, $FB, $EE, $EF, $FE, $02, $02, $EF, $E8, $EF, $E8, $EF, $EC, $EB, $EB, $EB ; $95AE
    .byte $DB, $CB, $BD, $AC, $9B, $8B, $AB, $6B, $5B, $03, $4B, $3B, $2C, $1C, $1B, $FF ; $95BE
    .byte $02, $B0, $88, $70, $35, $80, $36, $90, $37, $A0, $38, $B0, $39, $B0, $3A, $B0 ; $95CE
    .byte $3B, $B0, $3C, $B0, $3D, $B0, $3E, $B0, $3F, $B0, $40, $B0, $41, $B0, $42, $B0 ; $95DE
    .byte $43, $B0, $44, $B0, $45, $B0, $46, $B0, $47, $B0, $48, $B0, $49, $B0, $4A, $B0 ; $95EE
    .byte $4B, $B0, $4C, $B0, $4D, $B0, $4E, $B0, $4F, $A0, $50, $A0, $51, $90, $52, $90 ; $95FE
    .byte $53, $80, $54, $80, $55, $70, $56, $70, $57, $60, $58, $60, $59, $50, $5A, $50 ; $960E
    .byte $5B, $40, $5C, $40, $5D, $30, $5E, $30, $5F, $20, $60, $20, $61, $10, $62, $10 ; $961E
    .byte $63, $10, $64, $10, $65, $10, $66, $FF, $01, $B0, $82, $F2, $70, $00, $00, $04 ; $962E
    .byte $B0, $82, $F1, $AB, $F1, $53, $E1, $AB, $D1, $53, $C1, $AB, $B1, $53, $A1, $AB ; $963E
    .byte $91, $53, $81, $AB, $71, $53, $61, $AB, $51, $53, $41, $AB, $31, $53, $21, $AB ; $964E
    .byte $11, $53, $FF, $01, $EC, $02, $DF, $C9, $BF, $01, $B9, $CF, $03, $99, $9F, $04 ; $965E
    .byte $89, $7F, $69, $5F, $05, $49, $3F, $29, $1F, $19, $FF, $03, $EF, $EE, $01, $D7 ; $966E
    .byte $BD, $C8, $04, $C7, $C9, $A7, $A9, $97, $89, $79, $57, $49, $47, $39, $29, $17 ; $967E
    .byte $FF, $01, $B0, $8A, $FB, $60, $21, $60, $42, $60, $84, $FE, $07, $30, $21, $30 ; $968E
    .byte $42, $30, $84, $20, $21, $20, $42, $20, $84, $10, $21, $10, $42, $10, $84, $FF ; $969E
    .byte $01, $77, $01, $FB, $72, $F1, $10, $77, $FE, $04, $00, $32, $00, $12, $FF, $01 ; $96AE
    .byte $30, $A9, $FB, $F8, $01, $F1, $FE, $F8, $01, $50, $1D, $FE, $0C, $FF, $01, $F8 ; $96BE
    .byte $5F, $58, $5F, $59, $01, $FB, $75, $FE, $14, $15, $25, $35, $45, $00, $00, $15 ; $96CE
    .byte $15, $FF, $FF, $03, $70, $88, $FB, $D0, $3C, $50, $1D, $D0, $3C, $50, $1D, $D0 ; $96DE
    .byte $3C, $50, $1D, $D0, $3C, $50, $1D, $D0, $3C, $D0, $3C, $F9, $30, $50, $1D, $50 ; $96EE
    .byte $3C, $00, $00, $30, $3C, $00, $00, $20, $3C, $00, $00, $10, $3C, $F9, $70, $00 ; $96FE
    .byte $00, $00, $00, $00, $00, $FE, $04, $FF, $05, $B0, $9C, $70, $FE, $90, $E2, $B0 ; $970E
    .byte $D5, $F8, $0A, $B0, $BE, $90, $A9, $70, $8E, $F8, $0B, $50, $7F, $30, $7F, $20 ; $971E
    .byte $7F, $10, $7F, $FF, $08, $B0, $9B, $70, $D5, $90, $6A, $02, $B0, $8C, $00, $00 ; $972E
    .byte $08, $B0, $9B, $50, $6A, $30, $6A, $20, $6A, $10, $6A, $FF, $06, $30, $99, $50 ; $973E
    .byte $B0, $10, $B0, $FF, $01, $C7, $82, $77, $42, $12, $FF, $03, $B0, $88, $50, $35 ; $974E
    .byte $20, $1D, $10, $35, $FF, $03, $70, $88, $B0, $12, $B0, $16, $B0, $20, $B0, $17 ; $975E
    .byte $02, $30, $88, $A0, $12, $03, $B0, $88, $B0, $18, $A0, $18, $90, $18, $80, $18 ; $976E
    .byte $70, $18, $60, $18, $50, $18, $40, $18, $30, $18, $20, $18, $10, $18, $FF, $01 ; $977E
    .byte $DF, $03, $D8, $B8, $95, $14, $24, $34, $54, $74, $11, $34, $11, $24, $11, $14 ; $978E
    .byte $FF, $05, $82, $88, $10, $D5, $10, $8E, $10, $A9, $02, $B0, $88, $E0, $6A, $D0 ; $979E
    .byte $6A, $B0, $6A, $A0, $6A, $90, $6A, $70, $6A, $50, $6A, $40, $6A, $FF, $05, $B0 ; $97AE
    .byte $8C, $A0, $4D, $A0, $40, $50, $4B, $50, $3E, $30, $49, $30, $3C, $FF, $03, $70 ; $97BE
    .byte $88, $E0, $EF, $31, $3B, $E0, $BC, $30, $EE, $E0, $9C, $30, $BA, $E0, $74, $21 ; $97CE
    .byte $3B, $70, $BC, $20, $EF, $70, $9C, $20, $BA, $70, $74, $20, $EE, $11, $3B, $20 ; $97DE
    .byte $BC, $10, $EE, $20, $9C, $10, $BA, $20, $74, $11, $3B, $FF, $01, $30, $A2, $D3 ; $97EE
    .byte $8A, $53, $57, $43, $27, $33, $27, $FE, $FF, $FD, $97, $02, $FB, $7E, $5E, $FE ; $97FE
    .byte $13, $FB, $9E, $7E, $FE, $13, $FB, $BE, $9E, $FE, $13, $FB, $CE, $AE, $FE, $13 ; $980E
    .byte $DE, $FE, $FF, $1E, $98, $01, $70, $83, $F1, $F0, $F1, $D0, $F1, $AE, $F1, $8F ; $981E
    .byte $F1, $68, $F1, $40, $F1, $2A, $F1, $0C, $01, $F0, $82, $FB, $F0, $D5, $FE, $0B ; $982E
    .byte $01, $F0, $83, $E1, $10, $D1, $30, $C1, $50, $B1, $70, $A1, $90, $81, $B0, $01 ; $983E
    .byte $F0, $82, $FB, $30, $D5, $FE, $0B, $01, $F0, $83, $31, $10, $31, $30, $21, $50 ; $984E
    .byte $21, $70, $11, $90, $11, $B0, $FF, $04, $F0, $83, $F2, $34, $F9, $B0, $91, $E7 ; $985E
    .byte $F4, $56, $D2, $34, $61, $E7, $D4, $56, $A2, $34, $41, $E7, $A4, $56, $52, $34 ; $986E
    .byte $21, $E7, $54, $56, $32, $34, $11, $E7, $34, $56, $22, $34, $10, $00, $24, $56 ; $987E
    .byte $FF, $02, $EF, $DC, $DF, $CC, $BB, $AA, $BF, $AC, $AF, $9C, $8B, $7A, $8F, $7C ; $988E
    .byte $7F, $6C, $5B, $4A, $5F, $4C, $4F, $3C, $2B, $1A, $3F, $2C, $2F, $2C, $1B, $1A ; $989E
    .byte $2F, $2C, $1F, $1C, $1B, $1A, $FF, $06, $30, $81, $FB, $F1, $CC, $F1, $CD, $21 ; $98AE
    .byte $24, $21, $33, $F1, $CC, $21, $35, $F1, $DD, $F1, $EE, $21, $35, $F1, $EE, $21 ; $98BE
    .byte $3A, $FE, $02, $05, $30, $81, $FB, $F1, $FE, $21, $3A, $21, $3A, $F2, $33, $FE ; $98CE
    .byte $02, $F2, $36, $21, $35, $F2, $42, $21, $22, $21, $54, $F2, $52, $FF, $04, $F0 ; $98DE
    .byte $82, $10, $00, $F8, $02, $10, $00, $ED, $05, $04, $F0, $82, $10, $00, $F8, $04 ; $98EE
    .byte $FB, $F1, $00, $E1, $90, $A1, $CE, $10, $00, $FE, $07, $0A, $F0, $84, $E1, $44 ; $98FE
    .byte $E1, $66, $D1, $88, $C1, $AA, $1B, $CC, $A1, $EE, $92, $11, $72, $33, $52, $55 ; $990E
    .byte $32, $77, $12, $99, $FF, $04, $10, $04, $FB, $ED, $EE, $DD, $10, $FE, $04, $FB ; $991E
    .byte $CE, $CB, $DD, $10, $FE, $03, $04, $9B, $C9, $EC, $DB, $DA, $DC, $EB, $CD, $EE ; $992E
    .byte $0F, $EE, $CE, $AE, $6E, $6E, $3F, $FF, $02, $B0, $81, $FB, $E1, $33, $C1, $55 ; $993E
    .byte $A1, $88, $A1, $DD, $A2, $00, $92, $22, $92, $03, $FE, $07, $FB, $E1, $78, $D1 ; $994E
    .byte $FA, $C2, $02, $B2, $25, $A2, $44, $FE, $07, $FB, $03, $B0, $83, $E2, $22, $D2 ; $995E
    .byte $44, $C2, $66, $01, $B0, $81, $A2, $AF, $FE, $05, $FB, $03, $B0, $83, $A2, $22 ; $996E
    .byte $92, $44, $01, $B0, $81, $54, $A2, $34, $A3, $FE, $02, $FB, $03, $B0, $83, $A2 ; $997E
    .byte $22, $92, $44, $01, $B0, $82, $34, $A2, $FE, $06, $FB, $03, $B0, $83, $82, $22 ; $998E
    .byte $62, $44, $01, $B0, $82, $44, $A2, $FE, $06, $FB, $03, $B0, $83, $42, $22, $32 ; $999E
    .byte $44, $01, $B0, $82, $24, $A2, $FE, $04, $FF, $01, $FB, $EC, $EE, $ED, $AC, $9B ; $99AE
    .byte $9A, $9A, $8A, $8F, $9A, $9B, $8C, $9D, $AE, $FE, $07, $FB, $EE, $EE, $DE, $AF ; $99BE
    .byte $9D, $8C, $7B, $6C, $5D, $4A, $FE, $07, $FB, $8E, $8C, $8D, $7E, $7D, $7D, $6D ; $99CE
    .byte $5E, $5E, $4F, $FE, $05, $FB, $5C, $5D, $5D, $4D, $4D, $3E, $2E, $2F, $FE, $02 ; $99DE
    .byte $FB, $4D, $5D, $6E, $5E, $4E, $3F, $3F, $FE, $06, $FB, $3D, $4D, $5E, $4E, $3E ; $99EE
    .byte $2F, $1F, $FE, $06, $FB, $2D, $3D, $4E, $3E, $2E, $1F, $1F, $FE, $04, $FB, $1D ; $99FE
    .byte $1D, $2E, $2E, $1E, $1F, $FE, $04, $FF, $03, $B0, $8B, $00, $00, $08, $B0, $8B ; $9A0E
    .byte $F0, $22, $FA, $83, $F0, $99, $FA, $8B, $F0, $22, $FA, $83, $C0, $99, $FA, $8B ; $9A1E
    .byte $A0, $22, $FA, $83, $80, $99, $FA, $8B, $60, $22, $FA, $83, $40, $99, $FA, $8B ; $9A2E
    .byte $40, $22, $FA, $83, $30, $99, $FA, $8B, $20, $22, $FA, $83, $10, $99, $FF, $04 ; $9A3E
    .byte $9D, $9B, $9D, $9B, $9C, $9A, $9C, $9A, $9B, $99, $7B, $79, $5A, $58, $49, $47 ; $9A4E
    .byte $38, $36, $27, $25, $16, $14, $FF, $D7, $33, $81, $68, $CF, $CF, $E6, $01, $CC ; $9A5E
    .byte $F3, $FD, $E1, $9B, $F2, $FD, $E1, $9B, $F1, $FD, $E1, $9B, $F0, $E0, $43, $E1 ; $9A6E
    .byte $B4, $44, $E0, $23, $44, $E1, $94, $B3, $74, $94, $40, $FD, $C2, $9C, $E4, $20 ; $9A7E
    .byte $E8, $19, $E9, $31, $E5, $70, $B0, $F1, $E4, $20, $E5, $70, $F0, $B0, $E4, $20 ; $9A8E
    .byte $E5, $70, $B0, $F2, $FD, $D1, $9C, $E8, $1E, $71, $71, $91, $E9, $00, $F0, $D1 ; $9A9E
    .byte $76, $80, $00, $EA, $85, $FD, $18, $9F, $EA, $00, $FD, $C2, $9C, $D1, $38, $81 ; $9AAE
    .byte $00, $E9, $00, $F2, $E4, $2D, $16, $F1, $06, $E5, $B6, $93, $F0, $83, $73, $63 ; $9ABE
    .byte $52, $42, $31, $21, $10, $00, $FD, $D1, $9C, $70, $F2, $70, $F0, $00, $E5, $70 ; $9ACE
    .byte $E4, $90, $F2, $90, $F0, $20, $E5, $90, $E4, $A0, $E9, $00, $FD, $F2, $9B, $90 ; $9ADE
    .byte $F4, $E3, $79, $60, $50, $40, $30, $20, $F5, $10, $00, $E4, $B0, $A0, $90, $F6 ; $9AEE
    .byte $E3, $79, $60, $50, $40, $30, $20, $10, $F0, $D1, $F7, $80, $00, $E3, $69, $50 ; $9AFE
    .byte $40, $30, $20, $F1, $10, $00, $E4, $B0, $F2, $A0, $90, $80, $F4, $E3, $69, $50 ; $9B0E
    .byte $40, $30, $20, $10, $F5, $00, $E4, $B0, $A0, $90, $80, $F6, $E3, $69, $50, $40 ; $9B1E
    .byte $30, $20, $10, $00, $F0, $D7, $78, $84, $19, $E4, $60, $60, $60, $60, $40, $50 ; $9B2E
    .byte $60, $90, $FD, $F2, $9B, $91, $F0, $E3, $69, $50, $40, $30, $20, $F1, $10, $00 ; $9B3E
    .byte $E4, $B0, $F2, $A0, $90, $80, $F4, $E3, $69, $50, $40, $30, $20, $10, $F0, $D7 ; $9B4E
    .byte $77, $85, $19, $E9, $B1, $FD, $DF, $9C, $D7, $FB, $85, $1E, $E9, $71, $E4, $60 ; $9B5E
    .byte $E6, $01, $64, $D7, $32, $81, $00, $E9, $00, $FB, $E2, $B0, $90, $60, $FE, $04 ; $9B6E
    .byte $B0, $90, $E6, $01, $61, $D7, $FB, $85, $1E, $E9, $71, $E4, $60, $E6, $01, $64 ; $9B7E
    .byte $D7, $32, $81, $00, $E9, $00, $FD, $F3, $9C, $E6, $01, $A1, $D7, $FB, $85, $1E ; $9B8E
    .byte $E9, $71, $E4, $60, $E6, $01, $64, $D7, $32, $81, $00, $E9, $00, $FD, $05, $9D ; $9B9E
    .byte $E6, $01, $51, $D7, $F6, $80, $00, $EB, $01, $02, $E4, $60, $F5, $E1, $B1, $F0 ; $9BAE
    .byte $E4, $40, $F5, $E1, $B1, $F0, $E4, $10, $F4, $E1, $B1, $F0, $E4, $00, $F4, $E1 ; $9BBE
    .byte $B1, $F0, $E5, $B0, $F4, $E1, $B0, $F0, $E5, $90, $F3, $E1, $B0, $EB, $00, $FE ; $9BCE
    .byte $FF, $89, $9A, $E0, $43, $E1, $B4, $44, $E0, $23, $44, $E1, $94, $B3, $74, $94 ; $9BDE
    .byte $43, $74, $24, $FF, $D1, $F7, $80, $00, $E4, $B9, $A0, $90, $80, $70, $F1, $60 ; $9BEE
    .byte $50, $40, $F2, $30, $20, $10, $F4, $B9, $A0, $90, $80, $70, $60, $D7, $72, $08 ; $9BFE
    .byte $19, $E9, $31, $EC, $01, $E4, $40, $80, $B0, $B0, $E3, $40, $80, $F0, $D1, $73 ; $9C0E
    .byte $80, $00, $E9, $00, $B9, $A0, $90, $80, $70, $F1, $60, $50, $40, $30, $F2, $20 ; $9C1E
    .byte $10, $B9, $A0, $90, $80, $70, $60, $F0, $EC, $00, $D1, $F7, $80, $00, $E3, $29 ; $9C2E
    .byte $10, $00, $E4, $B0, $A0, $F1, $90, $80, $70, $F2, $60, $50, $40, $F4, $E3, $29 ; $9C3E
    .byte $10, $00, $E4, $B0, $A0, $F5, $90, $D7, $72, $08, $19, $E9, $31, $EC, $01, $E4 ; $9C4E
    .byte $70, $B0, $E3, $20, $20, $70, $B0, $F0, $D1, $73, $80, $00, $E9, $00, $E2, $29 ; $9C5E
    .byte $10, $00, $E3, $B0, $A0, $F1, $90, $80, $70, $60, $F2, $50, $40, $E2, $29, $10 ; $9C6E
    .byte $00, $E3, $B0, $A0, $90, $EC, $00, $F0, $D1, $F7, $80, $00, $E3, $49, $30, $20 ; $9C7E
    .byte $10, $00, $F1, $E4, $B0, $A0, $90, $F2, $80, $70, $60, $F4, $E3, $49, $30, $20 ; $9C8E
    .byte $10, $00, $F5, $E4, $B0, $A0, $90, $80, $70, $60, $F6, $E3, $49, $30, $20, $10 ; $9C9E
    .byte $00, $E4, $B0, $A0, $F0, $E3, $79, $60, $50, $40, $30, $F1, $20, $10, $00, $F2 ; $9CAE
    .byte $E4, $B0, $A0, $FF, $D7, $7A, $84, $19, $E9, $B1, $F2, $E5, $FB, $B0, $FE, $05 ; $9CBE
    .byte $90, $B0, $FF, $D7, $78, $84, $19, $E9, $B1, $E4, $FB, $40, $FE, $05, $20, $40 ; $9CCE
    .byte $FF, $E5, $B0, $B0, $B0, $B0, $90, $90, $B0, $B0, $E4, $20, $10, $00, $E5, $B1 ; $9CDE
    .byte $B0, $E4, $20, $40, $FF, $E1, $40, $20, $40, $20, $E2, $B0, $90, $A0, $B0, $90 ; $9CEE
    .byte $60, $40, $20, $E3, $B0, $90, $FF, $E2, $20, $E3, $B0, $E2, $20, $40, $20, $40 ; $9CFE
    .byte $60, $40, $60, $90, $A0, $B0, $E1, $20, $40, $FF, $D7, $76, $82, $19, $CF, $CF ; $9D0E
    .byte $E6, $01, $F4, $FD, $E1, $9B, $F3, $FD, $E1, $9B, $F2, $FD, $E1, $9B, $F0, $FD ; $9D1E
    .byte $E1, $9B, $EC, $00, $FD, $0B, $9E, $E8, $1E, $E3, $01, $01, $21, $E9, $00, $D1 ; $9D2E
    .byte $75, $80, $00, $FD, $18, $9F, $FD, $0B, $9E, $D7, $78, $85, $1A, $E9, $31, $E3 ; $9D3E
    .byte $00, $E9, $71, $F4, $00, $F1, $E4, $70, $00, $E9, $31, $E3, $20, $E9, $71, $F4 ; $9D4E
    .byte $20, $F1, $E4, $90, $20, $E3, $30, $E9, $00, $FD, $29, $9E, $20, $F4, $E2, $09 ; $9D5E
    .byte $E3, $B0, $A0, $90, $80, $70, $F5, $60, $50, $40, $30, $20, $F6, $E2, $09, $E3 ; $9D6E
    .byte $B0, $A0, $90, $80, $70, $60, $F0, $D1, $37, $80, $00, $E3, $B9, $A0, $90, $80 ; $9D7E
    .byte $70, $F1, $60, $50, $F2, $40, $30, $20, $10, $F4, $B9, $A0, $90, $80, $70, $60 ; $9D8E
    .byte $F5, $50, $40, $30, $20, $10, $F6, $B9, $A0, $90, $80, $70, $60, $50, $F0, $D7 ; $9D9E
    .byte $70, $15, $1A, $E4, $B0, $B0, $B0, $B0, $90, $A0, $B0, $E3, $20, $FD, $29, $9E ; $9DAE
    .byte $21, $F0, $E3, $B9, $A0, $90, $80, $70, $F1, $60, $50, $40, $F2, $30, $20, $10 ; $9DBE
    .byte $F4, $B9, $A0, $90, $80, $70, $60, $F0, $D7, $7A, $89, $11, $E9, $31, $EA, $05 ; $9DCE
    .byte $FD, $DF, $9C, $EA, $00, $D7, $79, $87, $18, $E2, $EC, $02, $E9, $31, $FB, $B0 ; $9DDE
    .byte $90, $60, $FE, $05, $B0, $FD, $F3, $9C, $A0, $B0, $FD, $05, $9D, $50, $60, $EC ; $9DEE
    .byte $00, $D7, $74, $81, $A3, $EB, $21, $00, $BF, $FE, $FF, $32, $9D, $D7, $70, $15 ; $9DFE
    .byte $1A, $E9, $31, $E4, $FB, $40, $FE, $05, $20, $40, $E8, $89, $EB, $37, $04, $78 ; $9E0E
    .byte $E8, $1A, $EB, $00, $FB, $90, $FE, $05, $70, $90, $FF, $D1, $37, $80, $00, $E3 ; $9E1E
    .byte $49, $30, $20, $10, $00, $F1, $E4, $B0, $A0, $F2, $90, $80, $70, $60, $F4, $E3 ; $9E2E
    .byte $49, $30, $20, $10, $00, $E4, $B0, $F5, $A0, $90, $80, $70, $60, $F6, $E3, $49 ; $9E3E
    .byte $30, $20, $10, $00, $E4, $B0, $90, $F0, $D7, $70, $08, $19, $E9, $B1, $EC, $01 ; $9E4E
    .byte $E3, $40, $80, $B0, $D1, $75, $80, $00, $E9, $00, $E2, $49, $30, $20, $F1, $10 ; $9E5E
    .byte $00, $F2, $E3, $B0, $A0, $F3, $90, $80, $F4, $70, $60, $F2, $E2, $49, $30, $20 ; $9E6E
    .byte $F3, $10, $00, $E3, $B0, $F0, $D1, $37, $80, $00, $E3, $79, $60, $50, $40, $30 ; $9E7E
    .byte $F1, $20, $10, $00, $E4, $F2, $B0, $A0, $90, $F4, $E3, $79, $60, $50, $40, $30 ; $9E8E
    .byte $20, $F5, $10, $00, $E4, $B0, $A0, $90, $F6, $E3, $79, $60, $50, $40, $30, $20 ; $9E9E
    .byte $10, $D7, $70, $08, $19, $E9, $B1, $EC, $01, $E3, $70, $B0, $E2, $20, $D1, $75 ; $9EAE
    .byte $80, $00, $E9, $00, $79, $60, $50, $F1, $40, $30, $F2, $20, $10, $F3, $00, $E3 ; $9EBE
    .byte $B0, $F4, $A0, $90, $F2, $E2, $79, $60, $50, $F3, $40, $30, $20, $EC, $00, $D1 ; $9ECE
    .byte $37, $80, $00, $E3, $99, $80, $70, $60, $50, $F1, $40, $30, $F2, $20, $10, $00 ; $9EDE
    .byte $E4, $B0, $F4, $E3, $99, $80, $70, $60, $50, $40, $F5, $30, $20, $10, $00, $E4 ; $9EEE
    .byte $B0, $F6, $E3, $99, $80, $70, $60, $50, $40, $30, $F0, $E2, $09, $E3, $B0, $A0 ; $9EFE
    .byte $90, $80, $F1, $70, $60, $F2, $50, $40, $30, $FF, $26, $10, $00, $E4, $B0, $A0 ; $9F0E
    .byte $90, $80, $70, $60, $50, $40, $30, $20, $10, $00, $FF, $D7, $20, $CF, $CF, $CF ; $9F1E
    .byte $CB, $D1, $20, $E3, $B5, $91, $81, $71, $61, $51, $41, $31, $21, $11, $01, $E4 ; $9F2E
    .byte $B1, $FD, $05, $A0, $0D, $2D, $D1, $17, $FD, $18, $9F, $FD, $05, $A0, $E4, $76 ; $9F3E
    .byte $06, $E3, $2D, $E4, $96, $26, $E3, $36, $FD, $1C, $A0, $96, $E3, $16, $46, $96 ; $9F4E
    .byte $FD, $88, $A0, $E3, $06, $06, $46, $76, $E2, $06, $D1, $20, $E4, $FD, $7D, $A0 ; $9F5E
    .byte $11, $D1, $01, $E4, $B6, $D1, $20, $E3, $FD, $7D, $A0, $10, $00, $E4, $B0, $A0 ; $9F6E
    .byte $90, $80, $70, $60, $50, $D7, $10, $E4, $B0, $B0, $B0, $B0, $90, $A0, $B0, $E3 ; $9F7E
    .byte $20, $FD, $1C, $A0, $E3, $96, $96, $E4, $96, $E3, $96, $FD, $88, $A0, $B6, $D1 ; $9F8E
    .byte $20, $E3, $FD, $7D, $A0, $10, $00, $E4, $B0, $A0, $90, $80, $70, $60, $50, $D1 ; $9F9E
    .byte $01, $FB, $E4, $46, $E2, $46, $FE, $02, $E4, $26, $E2, $26, $E4, $46, $E2, $46 ; $9FAE
    .byte $E3, $76, $66, $56, $4D, $D1, $01, $46, $76, $96, $D7, $13, $FB, $E4, $B0, $B0 ; $9FBE
    .byte $B0, $E3, $B0, $E4, $B0, $E3, $B0, $E4, $B0, $E3, $B1, $E4, $B0, $80, $E3, $80 ; $9FCE
    .byte $E4, $90, $E3, $90, $E4, $A0, $E3, $A0, $FE, $03, $E4, $B0, $E3, $60, $E4, $B0 ; $9FDE
    .byte $90, $E3, $40, $E4, $90, $60, $E3, $10, $E4, $60, $50, $E3, $00, $E4, $50, $40 ; $9FEE
    .byte $B0, $20, $90, $FE, $FF, $3F, $9F, $D1, $01, $E4, $FB, $46, $FE, $05, $26, $46 ; $9FFE
    .byte $7D, $FB, $76, $FE, $07, $FB, $96, $FE, $05, $76, $96, $E3, $0D, $FF, $D1, $20 ; $A00E
    .byte $E4, $49, $30, $20, $10, $00, $E5, $B0, $A0, $90, $80, $70, $61, $D1, $01, $E3 ; $A01E
    .byte $FB, $46, $FE, $07, $E4, $B6, $B6, $86, $86, $46, $46, $D1, $20, $E4, $79, $60 ; $A02E
    .byte $50, $40, $30, $20, $10, $00, $E5, $B0, $A0, $91, $D1, $01, $E3, $FB, $76, $FE ; $A03E
    .byte $07, $26, $26, $E4, $D1, $20, $E3, $79, $60, $50, $40, $30, $20, $10, $00, $E4 ; $A04E
    .byte $B0, $A0, $90, $80, $70, $60, $50, $40, $30, $20, $10, $D1, $20, $E4, $99, $80 ; $A05E
    .byte $70, $60, $50, $40, $30, $20, $10, $00, $E5, $B1, $D1, $01, $E4, $96, $FF, $B9 ; $A06E
    .byte $A0, $90, $80, $70, $60, $50, $40, $30, $20, $FF, $D1, $20, $E3, $09, $E4, $B0 ; $A07E
    .byte $A0, $90, $80, $70, $60, $50, $40, $30, $21, $D1, $01, $FF, $FD, $00, $A1, $FD ; $A08E
    .byte $DD, $A0, $FB, $B0, $2C, $FE, $04, $41, $44, $FD, $DD, $A0, $FB, $B0, $2C, $46 ; $A09E
    .byte $46, $FE, $02, $46, $FD, $00, $A1, $FD, $00, $A1, $FD, $DD, $A0, $D1, $B6, $26 ; $A0AE
    .byte $B6, $41, $24, $B6, $FB, $46, $FE, $04, $FB, $B0, $25, $B6, $41, $24, $B6, $FE ; $A0BE
    .byte $04, $FB, $41, $2F, $C2, $FE, $04, $41, $3B, $46, $46, $FE, $FF, $9D, $A0, $D1 ; $A0CE
    .byte $B0, $25, $B6, $41, $24, $B6, $B0, $25, $B6, $41, $24, $B6, $26, $B6, $41, $24 ; $A0DE
    .byte $B6, $B0, $25, $B6, $41, $2B, $B0, $25, $B6, $41, $24, $B6, $B0, $25, $B6, $41 ; $A0EE
    .byte $24, $FF, $D1, $FB, $B0, $2C, $41, $2B, $B0, $25, $B6, $41, $24, $B6, $26, $B6 ; $A0FE
    .byte $41, $24, $B6, $B0, $25, $B6, $41, $2B, $FE, $03, $B0, $2C, $41, $2B, $B0, $25 ; $A10E
    .byte $B6, $41, $24, $B6, $26, $41, $44, $B6, $B6, $41, $44, $B6, $46, $46, $FF, $FD ; $A11E
    .byte $00, $A1, $FE, $FF, $2D, $A1, $D7, $77, $84, $12, $C7, $E6, $01, $C0, $E6, $07 ; $A12E
    .byte $D7, $75, $82, $1A, $FD, $E6, $A1, $E6, $01, $E4, $25, $E6, $07, $E3, $FB, $A0 ; $A13E
    .byte $F1, $A0, $F2, $A0, $F0, $FE, $02, $E8, $45, $73, $A1, $71, $E6, $01, $AE, $E6 ; $A14E
    .byte $07, $E8, $1A, $FD, $E6, $A1, $E6, $01, $E5, $A5, $E6, $07, $E3, $A0, $F1, $A0 ; $A15E
    .byte $F2, $A0, $F0, $E2, $00, $F1, $00, $F2, $00, $F0, $EB, $21, $04, $E8, $76, $E3 ; $A16E
    .byte $47, $EB, $00, $40, $90, $D7, $33, $81, $12, $EB, $31, $00, $E3, $A7, $EB, $00 ; $A17E
    .byte $31, $E2, $01, $E3, $A1, $91, $A2, $51, $E7, $80, $E8, $1A, $E9, $71, $E2, $50 ; $A18E
    .byte $31, $21, $31, $51, $E7, $81, $E3, $70, $90, $A0, $F1, $A0, $F2, $A0, $F0, $70 ; $A19E
    .byte $F1, $70, $F2, $70, $F0, $40, $F1, $40, $F2, $40, $F0, $A0, $F1, $A0, $F0, $A0 ; $A1AE
    .byte $E9, $00, $E8, $12, $91, $A1, $E9, $71, $E8, $1A, $E2, $FD, $02, $A2, $D1, $32 ; $A1BE
    .byte $80, $00, $25, $20, $30, $40, $50, $60, $70, $80, $90, $A0, $C3, $F1, $22, $30 ; $A1CE
    .byte $40, $50, $CF, $CF, $FE, $FF, $3E, $A1, $E4, $20, $E5, $A0, $E4, $30, $E5, $A0 ; $A1DE
    .byte $E4, $50, $E5, $51, $E4, $20, $E5, $A0, $E4, $20, $E5, $A0, $E4, $30, $50, $E5 ; $A1EE
    .byte $50, $E4, $30, $FF, $FB, $F0, $00, $F3, $00, $F5, $00, $FE, $02, $F0, $10, $F3 ; $A1FE
    .byte $10, $F0, $FF, $D7, $77, $84, $12, $C7, $FD, $D0, $A2, $D7, $77, $85, $1A, $E9 ; $A20E
    .byte $31, $FB, $F0, $E2, $20, $F3, $20, $F5, $20, $FE, $02, $F0, $D7, $70, $05, $45 ; $A21E
    .byte $03, $E9, $00, $21, $01, $21, $F0, $FD, $D0, $A2, $D7, $77, $85, $1A, $E9, $31 ; $A22E
    .byte $F0, $E2, $20, $F3, $20, $F5, $20, $F0, $40, $F3, $40, $F5, $40, $F0, $D7, $70 ; $A23E
    .byte $05, $76, $EB, $21, $04, $07, $EB, $00, $D7, $77, $85, $1A, $00, $20, $F0, $D7 ; $A24E
    .byte $71, $05, $12, $EB, $31, $00, $E9, $31, $E2, $37, $E9, $00, $E3, $71, $E2, $31 ; $A25E
    .byte $21, $01, $22, $E8, $97, $E3, $AA, $EB, $00, $A0, $E2, $00, $E8, $1A, $E9, $31 ; $A26E
    .byte $F0, $20, $F3, $20, $F5, $20, $F0, $00, $F3, $00, $F5, $00, $F0, $E3, $70, $F3 ; $A27E
    .byte $70, $F5, $70, $F0, $E2, $20, $F3, $20, $F1, $E8, $97, $20, $E9, $00, $01, $21 ; $A28E
    .byte $E9, $31, $E8, $1A, $EA, $04, $FD, $02, $A2, $EA, $00, $D1, $75, $80, $00, $65 ; $A29E
    .byte $60, $70, $F1, $80, $90, $F2, $A0, $B0, $F4, $E1, $00, $F5, $10, $20, $C3, $E2 ; $A2AE
    .byte $62, $70, $80, $F6, $90, $A0, $B0, $E1, $00, $10, $20, $E6, $02, $CC, $FE, $FF ; $A2BE
    .byte $16, $A2, $D7, $30, $05, $1A, $E9, $71, $E4, $51, $71, $A2, $51, $51, $70, $A1 ; $A2CE
    .byte $71, $FF, $D7, $10, $C3, $D1, $20, $E3, $25, $20, $10, $00, $E4, $B0, $A0, $90 ; $A2DE
    .byte $80, $70, $60, $50, $40, $30, $20, $10, $00, $E5, $B0, $A0, $90, $80, $70, $60 ; $A2EE
    .byte $50, $D1, $01, $FD, $34, $A3, $E4, $7D, $E3, $0D, $FD, $34, $A3, $0D, $2D, $FD ; $A2FE
    .byte $4A, $A3, $E3, $3D, $EA, $85, $FD, $4A, $A3, $EA, $00, $E3, $2D, $0F, $C4, $06 ; $A30E
    .byte $0D, $E4, $76, $E3, $06, $0F, $C4, $06, $0D, $2D, $E4, $2F, $C4, $D7, $10, $22 ; $A31E
    .byte $91, $23, $FE, $FF, $E3, $A2, $E4, $AF, $C4, $A6, $5F, $C4, $AD, $AD, $A6, $5D ; $A32E
    .byte $E3, $2D, $0D, $0D, $E4, $7F, $C4, $E3, $0D, $0D, $06, $FF, $E3, $3F, $C4, $36 ; $A33E
    .byte $E4, $AF, $C4, $E3, $3D, $3D, $36, $E4, $AD, $FF, $D1, $41, $44, $BD, $B6, $41 ; $A34E
    .byte $4B, $D7, $40, $40, $FB, $D7, $B1, $10, $B0, $41, $10, $B1, $B0, $10, $B0, $41 ; $A35E
    .byte $10, $10, $B1, $B0, $10, $41, $10, $B1, $B0, $10, $B0, $41, $D1, $46, $46, $FE ; $A36E
    .byte $02, $FB, $D7, $B1, $10, $B0, $41, $10, $B1, $B0, $10, $B0, $41, $10, $10, $FE ; $A37E
    .byte $03, $D1, $FB, $B0, $2F, $C3, $FE, $02, $41, $4B, $41, $4B, $CD, $D7, $B3, $FE ; $A38E
    .byte $FF, $62, $A3, $FB, $FD, $98, $A4, $50, $40, $00, $E4, $70, $50, $70, $92, $E7 ; $A39E
    .byte $82, $F1, $E4, $54, $C0, $DA, $B2, $13, $12, $EB, $01, $07, $E2, $21, $EB, $00 ; $A3AE
    .byte $E3, $91, $F0, $FE, $02, $DA, $B5, $82, $12, $C5, $EB, $01, $02, $F1, $E4, $53 ; $A3BE
    .byte $F0, $E7, $85, $E3, $FD, $7D, $A4, $DA, $B4, $82, $12, $EB, $02, $07, $E4, $21 ; $A3CE
    .byte $12, $EB, $00, $DA, $73, $82, $34, $E3, $00, $00, $E4, $90, $E3, $00, $20, $01 ; $A3DE
    .byte $FD, $98, $A4, $00, $70, $80, $91, $F2, $91, $F0, $DA, $75, $82, $19, $EB, $01 ; $A3EE
    .byte $02, $EC, $01, $FD, $88, $A4, $EC, $00, $D5, $75, $85, $17, $FB, $E3, $71, $61 ; $A3FE
    .byte $51, $41, $71, $61, $51, $41, $EB, $01, $02, $E2, $01, $EB, $00, $E4, $21, $EB ; $A40E
    .byte $01, $02, $E2, $21, $41, $EB, $00, $E4, $21, $41, $71, $91, $FE, $02, $E4, $21 ; $A41E
    .byte $E9, $31, $E3, $51, $91, $51, $E2, $01, $E3, $51, $E9, $00, $E4, $21, $E9, $31 ; $A42E
    .byte $E3, $51, $A1, $E9, $00, $D5, $74, $81, $11, $E4, $20, $40, $50, $90, $E3, $00 ; $A43E
    .byte $40, $D5, $74, $84, $11, $51, $91, $E2, $01, $41, $D5, $74, $84, $1C, $E9, $35 ; $A44E
    .byte $FB, $E2, $21, $E3, $B1, $FE, $03, $E2, $21, $01, $EC, $02, $FB, $E2, $11, $E3 ; $A45E
    .byte $91, $E2, $41, $E3, $91, $FE, $02, $E9, $00, $EC, $00, $FE, $FF, $A1, $A3, $70 ; $A46E
    .byte $50, $40, $50, $40, $00, $70, $50, $70, $90, $FF, $E5, $90, $E4, $00, $20, $50 ; $A47E
    .byte $70, $50, $70, $80, $90, $E3, $00, $20, $50, $FF, $DA, $B5, $82, $12, $C5, $F1 ; $A48E
    .byte $EB, $01, $02, $E4, $53, $F0, $E7, $85, $E3, $70, $50, $40, $FF, $FB, $FD, $93 ; $A49E
    .byte $A5, $50, $40, $00, $E5, $70, $50, $70, $90, $EC, $00, $F4, $91, $F0, $DA, $75 ; $A4AE
    .byte $82, $12, $E9, $00, $E4, $54, $C0, $DA, $B0, $13, $12, $EB, $02, $07, $E2, $51 ; $A4BE
    .byte $EB, $00, $01, $FE, $02, $DA, $75, $82, $18, $E5, $71, $71, $21, $E8, $12, $E4 ; $A4CE
    .byte $53, $DA, $70, $11, $19, $EC, $01, $E9, $31, $FD, $7D, $A4, $EC, $00, $DA, $74 ; $A4DE
    .byte $82, $12, $EB, $05, $07, $E3, $21, $12, $EB, $00, $DA, $30, $12, $16, $E9, $71 ; $A4EE
    .byte $E3, $50, $50, $20, $50, $70, $51, $FD, $93, $A5, $00, $70, $80, $FB, $90, $F3 ; $A4FE
    .byte $90, $F0, $FE, $02, $EC, $00, $DA, $35, $85, $19, $EA, $0C, $FD, $88, $A4, $EA ; $A50E
    .byte $00, $E9, $00, $DA, $78, $88, $15, $EC, $01, $FD, $7D, $A5, $20, $FD, $7D, $A5 ; $A51E
    .byte $E2, $50, $E4, $A0, $E2, $50, $50, $20, $50, $70, $E4, $A0, $E7, $84, $EC, $00 ; $A52E
    .byte $E2, $51, $D5, $75, $85, $00, $E4, $70, $90, $A0, $E3, $20, $50, $90, $DA, $79 ; $A53E
    .byte $89, $15, $EC, $01, $E9, $74, $A0, $E2, $20, $50, $90, $70, $F2, $70, $F4, $70 ; $A54E
    .byte $F0, $80, $F2, $80, $F4, $80, $F0, $E6, $04, $93, $F1, $93, $F2, $93, $F3, $93 ; $A55E
    .byte $F4, $93, $F5, $93, $F6, $90, $F0, $E9, $00, $EC, $00, $FE, $FF, $AB, $A4, $FB ; $A56E
    .byte $E2, $00, $E3, $B0, $A0, $90, $FE, $02, $E2, $00, $E4, $70, $E2, $20, $40, $E4 ; $A57E
    .byte $70, $90, $E3, $00, $FF, $DA, $75, $82, $18, $E5, $21, $21, $91, $E8, $12, $E4 ; $A58E
    .byte $53, $DA, $70, $11, $19, $E9, $31, $EC, $01, $70, $50, $40, $FF, $FB, $DA, $10 ; $A59E
    .byte $FD, $65, $A6, $DB, $26, $E3, $01, $DA, $10, $E4, $70, $90, $E3, $00, $E4, $53 ; $A5AE
    .byte $FD, $65, $A6, $D2, $3F, $E3, $0A, $D1, $20, $E2, $60, $50, $40, $30, $20, $10 ; $A5BE
    .byte $00, $E3, $B0, $A0, $90, $E2, $61, $51, $41, $31, $21, $11, $01, $E3, $B1, $A1 ; $A5CE
    .byte $91, $DA, $14, $E4, $53, $FE, $02, $DA, $10, $E4, $71, $71, $21, $D1, $21, $61 ; $A5DE
    .byte $71, $81, $91, $DB, $26, $A1, $DA, $10, $20, $50, $60, $A3, $70, $20, $71, $81 ; $A5EE
    .byte $DA, $14, $95, $FD, $70, $A6, $DA, $10, $FD, $65, $A6, $DB, $20, $E3, $01, $D1 ; $A5FE
    .byte $20, $E2, $40, $30, $20, $10, $00, $E3, $B0, $A0, $90, $80, $70, $E2, $41, $31 ; $A60E
    .byte $21, $11, $01, $E3, $B1, $A1, $91, $81, $71, $DA, $13, $E4, $53, $23, $DA, $10 ; $A61E
    .byte $FD, $88, $A4, $DA, $10, $FB, $E4, $91, $91, $90, $E3, $91, $E4, $90, $91, $91 ; $A62E
    .byte $20, $40, $70, $90, $FE, $02, $71, $71, $70, $E3, $71, $E4, $70, $71, $71, $70 ; $A63E
    .byte $E3, $70, $E4, $80, $E3, $80, $E4, $94, $E3, $90, $E4, $90, $E3, $90, $E4, $93 ; $A64E
    .byte $FD, $70, $A6, $FE, $FF, $AB, $A5, $E4, $21, $21, $91, $D1, $21, $81, $91, $A1 ; $A65E
    .byte $B1, $FF, $D1, $20, $E3, $51, $41, $31, $21, $11, $01, $E4, $B1, $A1, $91, $81 ; $A66E
    .byte $71, $61, $51, $41, $31, $21, $11, $01, $E5, $B1, $A1, $FF, $FB, $DA, $31, $B1 ; $A67E
    .byte $B1, $43, $FD, $C4, $A6, $B1, $B0, $30, $31, $43, $FD, $C4, $A6, $FE, $03, $31 ; $A68E
    .byte $B1, $30, $30, $43, $FD, $C4, $A6, $B1, $B0, $30, $32, $20, $42, $30, $B3, $FB ; $A69E
    .byte $B1, $B1, $41, $21, $B0, $41, $B0, $41, $40, $40, $FE, $03, $43, $20, $20, $21 ; $A6AE
    .byte $43, $B3, $FE, $FF, $8A, $A6, $D7, $20, $20, $D6, $20, $DA, $23, $FF, $D8, $36 ; $A6BE
    .byte $82, $1A, $F2, $E5, $80, $80, $E4, $00, $00, $10, $10, $20, $20, $F0, $E3, $30 ; $A6CE
    .byte $30, $50, $50, $60, $60, $70, $70, $EA, $89, $D8, $34, $81, $1A, $C0, $E9, $71 ; $A6DE
    .byte $FD, $5D, $A7, $E3, $40, $50, $00, $E4, $92, $C0, $FD, $5D, $A7, $00, $00, $EC ; $A6EE
    .byte $01, $90, $E2, $00, $50, $90, $EC, $00, $E9, $F1, $FD, $71, $A7, $91, $70, $E2 ; $A6FE
    .byte $40, $50, $40, $50, $FD, $71, $A7, $90, $70, $50, $E8, $12, $31, $20, $00, $EA ; $A70E
    .byte $03, $D8, $33, $81, $17, $FD, $90, $A7, $70, $70, $70, $70, $EA, $06, $FD, $90 ; $A71E
    .byte $A7, $EA, $03, $E5, $A1, $B1, $EA, $03, $D8, $33, $81, $18, $E3, $C0, $FB, $91 ; $A72E
    .byte $90, $70, $50, $30, $FE, $02, $E4, $30, $40, $50, $C0, $E3, $91, $90, $70, $50 ; $A73E
    .byte $30, $E2, $41, $FB, $50, $40, $FE, $03, $50, $EC, $00, $FE, $FF, $E5, $A6, $FB ; $A74E
    .byte $E4, $40, $50, $90, $FE, $05, $E3, $40, $50, $40, $50, $00, $E4, $91, $E3, $40 ; $A75E
    .byte $40, $50, $FF, $EA, $89, $D8, $F3, $81, $88, $E3, $36, $31, $30, $20, $00, $31 ; $A76E
    .byte $20, $00, $C0, $E4, $80, $90, $A0, $E3, $00, $30, $C0, $D8, $33, $81, $1C, $E3 ; $A77E
    .byte $91, $FF, $EB, $02, $02, $E4, $00, $00, $00, $00, $EB, $00, $00, $00, $00, $00 ; $A78E
    .byte $40, $40, $40, $40, $FF, $D8, $36, $84, $18, $E9, $71, $E3, $80, $80, $60, $60 ; $A79E
    .byte $50, $50, $40, $40, $30, $30, $10, $10, $E4, $B0, $B0, $A0, $A0, $E9, $31, $EA ; $A7AE
    .byte $89, $D8, $31, $05, $1A, $C0, $E9, $71, $FD, $42, $A8, $80, $90, $50, $E8, $49 ; $A7BE
    .byte $32, $C0, $E8, $1A, $FD, $42, $A8, $50, $EC, $01, $E8, $19, $30, $50, $90, $E2 ; $A7CE
    .byte $00, $50, $F0, $EC, $00, $E9, $00, $FD, $58, $A8, $50, $F2, $50, $F0, $30, $E9 ; $A7DE
    .byte $70, $E9, $32, $80, $90, $80, $90, $E9, $72, $FD, $58, $A8, $50, $30, $20, $E8 ; $A7EE
    .byte $12, $01, $E4, $A0, $90, $D8, $36, $83, $17, $E9, $B1, $FD, $8B, $A8, $A0, $A0 ; $A7FE
    .byte $A0, $A0, $EA, $06, $FD, $8B, $A8, $EA, $03, $E3, $31, $41, $E9, $71, $EA, $89 ; $A80E
    .byte $D8, $76, $84, $18, $C0, $E9, $31, $FB, $FD, $81, $A8, $FE, $02, $E4, $30, $40 ; $A81E
    .byte $50, $C0, $FD, $81, $A8, $81, $FB, $90, $80, $FE, $03, $90, $EC, $00, $E9, $31 ; $A82E
    .byte $FE, $FF, $BD, $A7, $FB, $E4, $80, $90, $E3, $50, $FE, $05, $80, $90, $80, $90 ; $A83E
    .byte $50, $E8, $49, $31, $E8, $1A, $80, $80, $90, $FF, $EA, $03, $D8, $77, $84, $12 ; $A84E
    .byte $F1, $EB, $01, $04, $E3, $36, $31, $30, $20, $00, $31, $20, $00, $C0, $E4, $80 ; $A85E
    .byte $90, $A0, $E3, $00, $30, $C0, $EB, $00, $F0, $D8, $37, $85, $1C, $E3, $50, $F2 ; $A86E
    .byte $50, $F0, $FF, $E2, $50, $F2, $50, $F0, $50, $30, $20, $00, $FF, $E4, $00, $00 ; $A87E
    .byte $00, $00, $40, $40, $40, $40, $70, $70, $70, $70, $FF, $EA, $03, $D1, $09, $C0 ; $A88E
    .byte $D8, $11, $E4, $50, $50, $90, $90, $A0, $A0, $B0, $B0, $E3, $00, $00, $20, $20 ; $A89E
    .byte $30, $30, $40, $D1, $01, $46, $FB, $E4, $57, $E3, $59, $C5, $E4, $57, $37, $E3 ; $A8AE
    .byte $39, $C5, $E4, $37, $57, $E3, $59, $C5, $D8, $10, $E4, $31, $D1, $01, $07, $37 ; $A8BE
    .byte $47, $FE, $04, $FD, $26, $A9, $E3, $39, $C5, $E4, $37, $57, $E3, $57, $E4, $37 ; $A8CE
    .byte $D8, $10, $E3, $B1, $D1, $01, $E2, $07, $E3, $B7, $E2, $07, $FD, $26, $A9, $E3 ; $A8DE
    .byte $37, $E4, $37, $E3, $37, $E4, $57, $E3, $57, $37, $27, $07, $E4, $37, $47, $57 ; $A8EE
    .byte $D8, $10, $FB, $E4, $00, $FE, $0E, $20, $20, $FB, $30, $FE, $0C, $31, $41, $D1 ; $A8FE
    .byte $01, $FD, $26, $A9, $E3, $37, $E4, $37, $D8, $10, $E3, $81, $D1, $01, $FB, $97 ; $A90E
    .byte $87, $FE, $03, $97, $FE, $FF, $B4, $A8, $E4, $57, $E3, $59, $C5, $E4, $57, $37 ; $A91E
    .byte $E3, $39, $C5, $E4, $37, $57, $E3, $59, $C5, $D8, $10, $E4, $31, $D1, $01, $07 ; $A92E
    .byte $37, $47, $57, $E3, $59, $C5, $E4, $57, $37, $FF, $D8, $C7, $B0, $40, $40, $40 ; $A93E
    .byte $40, $40, $40, $40, $D8, $FB, $FD, $85, $A9, $FE, $05, $B1, $41, $B0, $B0, $40 ; $A94E
    .byte $B1, $B0, $40, $B0, $B0, $B0, $40, $40, $FB, $FD, $85, $A9, $FE, $03, $FD, $92 ; $A95E
    .byte $A9, $B0, $2E, $B0, $2E, $D8, $FD, $85, $A9, $FD, $92, $A9, $47, $47, $D1, $40 ; $A96E
    .byte $46, $40, $46, $FE, $FF, $52, $A9, $B1, $41, $B0, $B0, $40, $B1, $B0, $40, $B0 ; $A97E
    .byte $B0, $B0, $41, $FF, $B1, $41, $B0, $B0, $40, $B1, $D1, $41, $45, $B7, $B7, $FF ; $A98E
    .byte $E9, $B8, $D4, $B5, $81, $19, $F2, $EB, $01, $02, $FB, $FD, $6E, $AA, $FE, $02 ; $A99E
    .byte $F0, $EC, $03, $FB, $FD, $6E, $AA, $FE, $02, $EB, $00, $FB, $FD, $77, $AA, $FE ; $A9AE
    .byte $02, $F1, $FD, $77, $AA, $F2, $FD, $77, $AA, $EC, $00, $D4, $70, $09, $00, $E3 ; $A9BE
    .byte $03, $03, $E4, $A3, $E3, $03, $F1, $03, $E4, $A3, $FB, $F0, $E3, $33, $53, $F1 ; $A9CE
    .byte $53, $FE, $02, $F0, $03, $03, $E4, $A3, $E3, $03, $F1, $03, $E4, $A3, $F0, $E3 ; $A9DE
    .byte $73, $63, $F1, $63, $F0, $53, $33, $F1, $33, $F0, $03, $03, $E4, $A3, $E3, $03 ; $A9EE
    .byte $F1, $03, $E4, $A3, $FB, $F0, $E3, $33, $53, $F1, $53, $FE, $02, $F0, $61, $71 ; $A9FE
    .byte $A1, $71, $51, $31, $01, $E4, $A1, $B1, $E3, $0B, $E9, $B4, $D4, $B3, $81, $19 ; $AA0E
    .byte $EC, $02, $FB, $E5, $51, $E4, $01, $31, $71, $51, $31, $FE, $03, $EC, $00, $FD ; $AA1E
    .byte $62, $AA, $E8, $14, $E6, $06, $EB, $42, $00, $5F, $EB, $00, $E8, $18, $FD, $62 ; $AA2E
    .byte $AA, $FD, $80, $AA, $E6, $06, $E8, $14, $EB, $42, $00, $E4, $0B, $FD, $8E, $AA ; $AA3E
    .byte $EB, $42, $00, $E3, $0B, $E3, $FD, $8E, $AA, $EB, $41, $00, $E2, $0F, $EB, $00 ; $AA4E
    .byte $FE, $FF, $9E, $A9, $D4, $35, $83, $18, $E3, $53, $73, $83, $A3, $83, $73, $FF ; $AA5E
    .byte $E5, $51, $E4, $01, $31, $71, $51, $31, $FF, $01, $71, $A1, $E3, $21, $01, $E4 ; $AA6E
    .byte $A1, $FF, $E3, $53, $73, $53, $33, $23, $13, $03, $23, $33, $53, $33, $23, $FF ; $AA7E
    .byte $EB, $00, $E8, $18, $E6, $04, $A1, $A1, $A1, $E6, $06, $E8, $14, $FF, $E9, $B1 ; $AA8E
    .byte $D4, $77, $82, $19, $F3, $FB, $FD, $6E, $AA, $FE, $02, $F1, $FB, $FD, $77, $AA ; $AA9E
    .byte $FE, $02, $F0, $FB, $EA, $0C, $FD, $6E, $AA, $FE, $02, $F1, $FD, $6E, $AA, $F2 ; $AAAE
    .byte $FD, $6E, $AA, $EA, $00, $D4, $B0, $08, $27, $E3, $53, $53, $33, $53, $F2, $53 ; $AABE
    .byte $F4, $33, $FB, $F0, $83, $A3, $F3, $A3, $FE, $02, $F0, $53, $53, $33, $53, $F2 ; $AACE
    .byte $53, $F4, $33, $F0, $E2, $03, $E3, $B3, $F3, $B3, $F0, $A3, $83, $F3, $83, $F0 ; $AADE
    .byte $53, $53, $33, $53, $F2, $53, $F4, $33, $FB, $F0, $83, $A3, $F3, $A3, $FE, $02 ; $AAEE
    .byte $F0, $B1, $E2, $01, $31, $01, $E3, $A1, $81, $51, $31, $41, $D8, $B8, $85, $A8 ; $AAFE
    .byte $EB, $53, $00, $5B, $EB, $00, $E9, $B1, $D4, $76, $82, $19, $FB, $E4, $FD, $77 ; $AB0E
    .byte $AA, $FE, $02, $E9, $00, $FD, $60, $AB, $EC, $00, $D6, $B0, $15, $86, $EB, $42 ; $AB1E
    .byte $00, $E3, $AF, $EB, $00, $FD, $60, $AB, $EA, $05, $FD, $80, $AA, $EA, $00, $EC ; $AB2E
    .byte $00, $D6, $B0, $15, $86, $EB, $42, $00, $5B, $FD, $6F, $AB, $EB, $42, $00, $5B ; $AB3E
    .byte $EA, $0C, $FD, $6F, $AB, $EA, $00, $EB, $41, $00, $E2, $5F, $EB, $00, $FE, $FF ; $AB4E
    .byte $9C, $AA, $D4, $B0, $15, $19, $EC, $05, $E3, $A3, $E2, $03, $13, $33, $13, $03 ; $AB5E
    .byte $FF, $EB, $00, $D4, $B8, $82, $19, $E9, $31, $31, $31, $31, $E9, $00, $D6, $B0 ; $AB6E
    .byte $15, $86, $FF, $D4, $09, $FB, $FD, $F6, $AB, $FE, $0E, $E4, $81, $E3, $31, $81 ; $AB7E
    .byte $11, $71, $E2, $11, $E4, $71, $E3, $21, $71, $E4, $01, $71, $E3, $01, $FB, $E4 ; $AB8E
    .byte $51, $E3, $01, $31, $71, $51, $31, $FE, $04, $E4, $81, $E3, $31, $81, $11, $81 ; $AB9E
    .byte $E2, $11, $E4, $61, $E3, $11, $61, $FB, $FD, $F6, $AB, $FE, $04, $D4, $09, $FB ; $ABAE
    .byte $EA, $05, $FD, $F6, $AB, $FE, $07, $EA, $00, $E4, $A1, $E3, $51, $A1, $E4, $81 ; $ABBE
    .byte $E3, $81, $E4, $61, $FB, $FD, $F6, $AB, $FE, $02, $FB, $E4, $51, $E3, $01, $31 ; $ABCE
    .byte $71, $51, $31, $E4, $51, $E3, $01, $31, $E3, $31, $31, $31, $FE, $02, $FB, $FD ; $ABDE
    .byte $F6, $AB, $FE, $02, $FE, $FF, $81, $AB, $E4, $51, $E3, $01, $31, $71, $51, $31 ; $ABEE
    .byte $FF, $D4, $C1, $FB, $13, $FE, $15, $D1, $B0, $2E, $B0, $2E, $B0, $26, $D4, $FB ; $ABFE
    .byte $FD, $51, $AC, $FE, $06, $FB, $B1, $41, $41, $FE, $03, $B1, $FB, $13, $FE, $06 ; $AC0E
    .byte $43, $43, $41, $B1, $FB, $41, $FE, $05, $FB, $FD, $51, $AC, $FE, $03, $FB, $B1 ; $AC1E
    .byte $11, $41, $11, $FE, $02, $21, $41, $41, $41, $FD, $51, $AC, $FB, $B1, $11, $B1 ; $AC2E
    .byte $43, $11, $B1, $11, $B1, $41, $41, $41, $FE, $02, $B1, $FB, $13, $FE, $06, $FE ; $AC3E
    .byte $FF, $01, $AC, $B1, $11, $B1, $43, $11, $B1, $11, $B1, $11, $21, $41, $FF, $EA ; $AC4E
    .byte $81, $D6, $33, $17, $15, $E9, $B1, $FD, $6C, $AC, $FE, $FF, $65, $AC, $FB, $E4 ; $AC5E
    .byte $12, $22, $32, $40, $50, $60, $FE, $02, $32, $42, $52, $60, $70, $80, $32, $42 ; $AC6E
    .byte $50, $30, $00, $E5, $B0, $A0, $80, $FF, $EA, $81, $D6, $70, $17, $16, $E9, $31 ; $AC7E
    .byte $EA, $04, $FD, $6C, $AC, $FE, $FF, $90, $AC, $EA, $81, $D6, $10, $FD, $A2, $AC ; $AC8E
    .byte $FE, $FF, $9B, $AC, $FB, $E4, $60, $E3, $10, $60, $E4, $70, $E3, $20, $70, $E4 ; $AC9E
    .byte $80, $E3, $30, $80, $E4, $90, $A0, $B0, $FE, $02, $E4, $80, $E3, $30, $80, $E4 ; $ACAE
    .byte $90, $E3, $40, $90, $E4, $A0, $E3, $50, $A0, $E4, $B0, $E3, $00, $10, $E4, $80 ; $ACBE
    .byte $E3, $30, $80, $E4, $90, $E3, $40, $90, $A0, $80, $50, $40, $30, $10, $FF, $D6 ; $ACCE
    .byte $FD, $E5, $AC, $FE, $FF, $DD, $AC, $FB, $B0, $10, $10, $41, $10, $FE, $03, $B0 ; $ACDE
    .byte $10, $10, $40, $40, $40, $FB, $B0, $10, $10, $41, $10, $FE, $03, $FB, $40, $FE ; $ACEE
    .byte $06, $FF, $D5, $33, $17, $15, $E9, $B1, $FD, $6C, $AC, $FE, $FF, $06, $AD, $D5 ; $ACFE
    .byte $70, $17, $16, $E9, $31, $EA, $05, $FD, $6C, $AC, $FE, $FF, $90, $AC, $D5, $10 ; $AD0E
    .byte $FD, $A2, $AC, $FE, $FF, $9B, $AC, $D5, $FD, $E5, $AC, $FE, $FF, $25, $AD, $D1 ; $AD1E
    .byte $73, $80, $00, $EB, $01, $02, $FD, $EC, $AD, $D7, $74, $82, $19, $E4, $50, $70 ; $AD2E
    .byte $EB, $00, $D7, $35, $83, $19, $E5, $70, $E4, $20, $D7, $74, $0F, $68, $EB, $02 ; $AD3E
    .byte $06, $FD, $D4, $AD, $E4, $A1, $E9, $00, $E5, $70, $E4, $20, $D7, $74, $0F, $68 ; $AD4E
    .byte $EB, $02, $06, $FD, $D4, $AD, $11, $E9, $00, $D1, $73, $80, $10, $C6, $E3, $21 ; $AD5E
    .byte $31, $42, $D7, $74, $82, $1A, $FD, $0D, $AE, $FD, $03, $AE, $E8, $1B, $E9, $31 ; $AD6E
    .byte $FB, $E2, $00, $E3, $80, $FE, $04, $FB, $E2, $20, $E3, $B0, $FE, $03, $70, $70 ; $AD7E
    .byte $E9, $00, $E4, $70, $71, $A0, $A1, $90, $91, $80, $81, $71, $C1, $D7, $36, $82 ; $AD8E
    .byte $1B, $FB, $E4, $32, $02, $31, $22, $E5, $B2, $E4, $21, $FE, $02, $D7, $35, $83 ; $AD9E
    .byte $1A, $E3, $90, $80, $90, $80, $90, $E2, $00, $E3, $B0, $90, $E8, $AA, $72, $24 ; $ADAE
    .byte $E8, $1A, $FB, $E2, $00, $E3, $B0, $FE, $02, $E2, $00, $30, $20, $00, $FD, $03 ; $ADBE
    .byte $AE, $00, $FE, $FF, $40, $AD, $E3, $21, $21, $11, $22, $22, $01, $E4, $A2, $74 ; $ADCE
    .byte $F0, $D7, $35, $83, $19, $EB, $00, $E9, $B1, $E4, $A2, $E3, $02, $FF, $E4, $77 ; $ADDE
    .byte $61, $51, $41, $31, $F1, $21, $11, $01, $E5, $B1, $A1, $91, $81, $71, $61, $51 ; $ADEE
    .byte $41, $31, $21, $F0, $FF, $E2, $20, $00, $E3, $90, $80, $70, $50, $20, $FF, $E3 ; $ADFE
    .byte $51, $51, $21, $52, $51, $50, $22, $20, $50, $70, $80, $70, $50, $21, $FF, $D1 ; $AE0E
    .byte $B4, $80, $00, $00, $FD, $EC, $AD, $D7, $33, $0F, $19, $E5, $50, $70, $D7, $37 ; $AE1E
    .byte $84, $19, $E4, $00, $70, $FD, $DC, $AE, $31, $00, $70, $FD, $DC, $AE, $61, $D1 ; $AE2E
    .byte $74, $80, $00, $C6, $E3, $71, $81, $92, $D7, $70, $0E, $19, $F2, $E9, $B1, $EA ; $AE3E
    .byte $05, $FD, $0D, $AE, $FD, $03, $AE, $EA, $00, $F0, $D7, $30, $0F, $65, $F3, $EB ; $AE4E
    .byte $15, $04, $E3, $52, $72, $50, $30, $52, $71, $50, $30, $E4, $A0, $F0, $D7, $37 ; $AE5E
    .byte $84, $19, $EB, $00, $E3, $00, $01, $30, $31, $20, $21, $10, $11, $01, $D1, $75 ; $AE6E
    .byte $82, $00, $E4, $94, $A4, $B3, $FD, $F7, $AE, $D7, $77, $83, $AA, $EB, $03, $04 ; $AE7E
    .byte $E4, $B2, $74, $FD, $F7, $AE, $D7, $77, $83, $AA, $EB, $02, $04, $77, $D7, $76 ; $AE8E
    .byte $86, $1A, $EB, $00, $FB, $E2, $00, $E3, $B0, $FE, $02, $E2, $00, $30, $20, $00 ; $AE9E
    .byte $D7, $77, $83, $AA, $EB, $01, $04, $E3, $B2, $74, $D7, $76, $86, $1A, $EB, $00 ; $AEAE
    .byte $E2, $30, $20, $30, $20, $30, $60, $50, $E6, $01, $32, $F3, $63, $F0, $E6, $07 ; $AEBE
    .byte $E9, $31, $EA, $05, $FD, $03, $AE, $EA, $00, $50, $FE, $FF, $2C, $AE, $D7, $33 ; $AECE
    .byte $0F, $58, $EB, $03, $06, $E3, $71, $71, $61, $72, $72, $51, $32, $04, $F0, $D7 ; $AEDE
    .byte $37, $84, $19, $EB, $00, $E4, $32, $52, $FF, $D7, $76, $83, $45, $E3, $00, $E4 ; $AEEE
    .byte $B0, $E3, $00, $E8, $1A, $31, $E8, $45, $30, $20, $00, $FF, $D1, $18, $E4, $77 ; $AEFE
    .byte $61, $51, $41, $31, $21, $11, $01, $E5, $B0, $A1, $91, $81, $71, $61, $51, $41 ; $AF0E
    .byte $31, $21, $D7, $10, $E4, $50, $70, $FD, $9E, $AF, $00, $70, $E3, $01, $E4, $50 ; $AF1E
    .byte $60, $71, $32, $52, $31, $FD, $9E, $AF, $30, $A0, $E3, $31, $E4, $31, $A1, $32 ; $AF2E
    .byte $52, $61, $FB, $E4, $72, $A1, $E3, $00, $10, $20, $FE, $04, $FB, $E4, $51, $E3 ; $AF3E
    .byte $00, $FE, $02, $E4, $50, $E3, $00, $FB, $E4, $71, $E3, $20, $FE, $02, $E4, $70 ; $AF4E
    .byte $E3, $20, $D1, $01, $E4, $06, $76, $E3, $06, $E4, $36, $A6, $E3, $36, $E4, $26 ; $AF5E
    .byte $96, $E3, $26, $E4, $16, $86, $E3, $16, $D7, $10, $E4, $01, $C1, $FB, $E4, $62 ; $AF6E
    .byte $62, $61, $72, $72, $71, $FE, $02, $D1, $01, $FD, $AD, $AF, $76, $76, $76, $76 ; $AF7E
    .byte $FD, $AD, $AF, $D7, $10, $E4, $70, $A0, $E3, $20, $E4, $20, $FE, $FF, $25, $AF ; $AF8E
    .byte $E4, $00, $70, $E3, $01, $E4, $51, $61, $71, $C0, $31, $50, $70, $30, $FF, $FB ; $AF9E
    .byte $E4, $66, $E3, $66, $FE, $04, $FB, $E4, $76, $E3, $76, $FE, $02, $FF, $D7, $21 ; $AFAE
    .byte $10, $10, $40, $40, $B0, $B0, $FB, $D7, $40, $40, $41, $B1, $41, $B1, $40, $B1 ; $AFBE
    .byte $B0, $41, $40, $40, $41, $B1, $41, $40, $B0, $B0, $40, $B0, $B0, $40, $40, $FE ; $AFCE
    .byte $02, $FB, $B1, $41, $B1, $41, $B1, $40, $D1, $B0, $2C, $D7, $B0, $41, $FE, $03 ; $AFDE
    .byte $B1, $41, $B0, $40, $41, $B1, $FB, $40, $FE, $06, $40, $10, $10, $FB, $40, $10 ; $AFEE
    .byte $10, $40, $B0, $B0, $10, $10, $FE, $03, $B0, $41, $40, $40, $FB, $B1, $41, $B1 ; $AFFE
    .byte $41, $B1, $40, $B1, $B0, $40, $40, $FE, $02, $FE, $FF, $C4, $AF, $D6, $78, $84 ; $B00E
    .byte $12, $C3, $EA, $81, $D6, $B2, $81, $18, $EB, $01, $02, $FD, $E7, $B0, $FB, $E9 ; $B01E
    .byte $B1, $D2, $31, $02, $12, $EB, $01, $02, $FD, $F4, $B0, $92, $FD, $FF, $B0, $FD ; $B02E
    .byte $14, $B1, $72, $FD, $FF, $B0, $FD, $F4, $B0, $F0, $E8, $1A, $E5, $72, $52, $71 ; $B03E
    .byte $A0, $F1, $E8, $12, $E6, $02, $FD, $14, $B1, $F0, $E8, $1A, $E5, $72, $52, $71 ; $B04E
    .byte $A0, $F1, $E8, $12, $E6, $02, $E3, $30, $40, $50, $E6, $06, $61, $A1, $61, $50 ; $B05E
    .byte $30, $03, $F0, $E8, $1A, $E5, $71, $A3, $E4, $03, $F2, $E5, $72, $52, $71, $C0 ; $B06E
    .byte $F0, $FE, $02, $D6, $70, $02, $18, $E9, $B1, $E5, $70, $A0, $B0, $E4, $00, $30 ; $B07E
    .byte $90, $A0, $E9, $00, $D6, $B0, $01, $19, $E5, $71, $71, $FD, $20, $B1, $F0, $E5 ; $B08E
    .byte $A1, $A1, $EA, $04, $FD, $20, $B1, $EA, $81, $F0, $EC, $03, $E9, $B5, $D6, $74 ; $B09E
    .byte $82, $18, $F0, $E3, $01, $01, $21, $01, $32, $22, $01, $31, $31, $51, $31, $62 ; $B0AE
    .byte $52, $31, $EC, $00, $E9, $B1, $D6, $72, $00, $15, $E4, $52, $52, $E3, $01, $27 ; $B0BE
    .byte $E4, $82, $81, $E3, $30, $E4, $A2, $A1, $E3, $50, $C1, $EA, $87, $D1, $B2, $80 ; $B0CE
    .byte $00, $C6, $FD, $2F, $B1, $FE, $FF, $20, $B0, $F0, $E4, $02, $E5, $A2, $E4, $01 ; $B0DE
    .byte $33, $53, $72, $52, $72, $FF, $E3, $70, $80, $90, $E6, $06, $E3, $A1, $31, $A1 ; $B0EE
    .byte $FF, $F0, $E8, $1A, $E5, $52, $71, $A3, $E4, $03, $F2, $E5, $72, $52, $71, $C0 ; $B0FE
    .byte $F1, $E8, $12, $E6, $02, $FF, $E3, $50, $60, $70, $E6, $06, $81, $E4, $B1, $E3 ; $B10E
    .byte $81, $FF, $F3, $E3, $01, $21, $32, $52, $31, $22, $02, $21, $32, $51, $30, $C1 ; $B11E
    .byte $FF, $F2, $E3, $00, $10, $F1, $20, $30, $40, $50, $60, $F0, $80, $A0, $B0, $E2 ; $B12E
    .byte $00, $20, $40, $60, $80, $E1, $30, $70, $90, $B0, $E0, $00, $E1, $B0, $A0, $90 ; $B13E
    .byte $80, $F1, $70, $60, $50, $40, $30, $20, $F2, $10, $00, $E2, $B0, $A0, $90, $80 ; $B14E
    .byte $70, $F3, $60, $50, $40, $30, $FF, $D6, $78, $84, $12, $C3, $EA, $81, $D6, $B6 ; $B15E
    .byte $83, $18, $FD, $E7, $B0, $FB, $E9, $B1, $D2, $75, $81, $11, $EB, $62, $05, $FD ; $B16E
    .byte $F4, $B0, $9F, $FD, $36, $B2, $D2, $75, $81, $11, $FD, $14, $B1, $7F, $FD, $36 ; $B17E
    .byte $B2, $D2, $75, $81, $11, $FD, $F4, $B0, $98, $E6, $02, $E8, $11, $FD, $14, $B1 ; $B18E
    .byte $78, $E6, $02, $E8, $11, $30, $40, $50, $E6, $06, $E8, $D8, $61, $A1, $61, $50 ; $B19E
    .byte $30, $0D, $FD, $36, $B2, $FE, $02, $E9, $71, $D6, $30, $01, $17, $E4, $20, $50 ; $B1AE
    .byte $60, $70, $A0, $E3, $00, $10, $E9, $71, $E4, $21, $21, $FD, $49, $B2, $E6, $06 ; $B1BE
    .byte $E8, $17, $F0, $51, $51, $EA, $04, $FD, $49, $B2, $EA, $81, $F0, $E9, $B1, $D6 ; $B1CE
    .byte $70, $01, $18, $E3, $71, $71, $91, $71, $E8, $14, $E6, $01, $90, $E6, $11, $A0 ; $B1DE
    .byte $E6, $06, $92, $71, $E8, $18, $A1, $A1, $E2, $01, $E3, $A1, $E2, $E8, $14, $E6 ; $B1EE
    .byte $01, $00, $E6, $11, $10, $E6, $06, $02, $E3, $A1, $E9, $71, $D6, $70, $01, $15 ; $B1FE
    .byte $02, $02, $51, $77, $32, $31, $80, $52, $51, $A0, $E6, $02, $F3, $A0, $90, $80 ; $B20E
    .byte $70, $60, $50, $EA, $87, $D1, $B3, $80, $00, $FD, $2F, $B1, $20, $10, $00, $E3 ; $B21E
    .byte $B0, $A0, $90, $80, $FE, $FF, $6A, $B1, $E8, $18, $E9, $30, $E4, $F0, $71, $F2 ; $B22E
    .byte $70, $F0, $51, $F2, $50, $F0, $71, $F2, $70, $F0, $FF, $D6, $30, $16, $11, $E3 ; $B23E
    .byte $51, $71, $82, $A2, $81, $72, $52, $71, $82, $A1, $80, $D2, $30, $01, $17, $F2 ; $B24E
    .byte $70, $50, $20, $00, $E4, $B0, $80, $FF, $D6, $12, $C3, $EA, $81, $D3, $06, $E3 ; $B25E
    .byte $05, $E4, $A5, $E3, $03, $D3, $06, $37, $57, $D3, $05, $05, $E4, $A5, $E3, $05 ; $B26E
    .byte $FD, $CC, $B2, $FD, $CC, $B2, $D3, $06, $E4, $71, $A1, $B1, $E3, $01, $31, $E4 ; $B27E
    .byte $51, $61, $D3, $07, $E4, $73, $73, $FD, $06, $B3, $D3, $07, $A3, $A3, $EA, $04 ; $B28E
    .byte $FD, $06, $B3, $EA, $81, $FD, $15, $B3, $EA, $8A, $FD, $15, $B3, $EA, $81, $D3 ; $B29E
    .byte $06, $55, $E3, $05, $53, $E4, $75, $E3, $25, $73, $E4, $85, $E3, $33, $81, $E4 ; $B2AE
    .byte $A5, $E3, $53, $D2, $20, $A3, $C4, $D6, $12, $C7, $FE, $FF, $69, $B2, $D6, $09 ; $B2BE
    .byte $C6, $FB, $D3, $06, $E3, $05, $E4, $A5, $E3, $03, $D3, $07, $37, $57, $D3, $05 ; $B2CE
    .byte $05, $E4, $A5, $E3, $03, $D6, $09, $C7, $FE, $02, $D3, $06, $FB, $05, $E4, $A5 ; $B2DE
    .byte $E3, $03, $35, $55, $33, $FE, $02, $05, $E4, $A5, $E3, $03, $D3, $07, $37, $57 ; $B2EE
    .byte $D3, $05, $05, $E4, $A5, $E3, $05, $FF, $D6, $10, $CB, $D3, $06, $E3, $75, $55 ; $B2FE
    .byte $73, $85, $A3, $81, $71, $51, $FF, $D6, $09, $E3, $01, $01, $D3, $06, $05, $D6 ; $B30E
    .byte $09, $01, $01, $00, $D3, $06, $03, $03, $FF, $D6, $B0, $B1, $B0, $D6, $B2, $42 ; $B31E
    .byte $40, $40, $21, $11, $21, $11, $B1, $40, $41, $40, $D1, $B0, $2F, $C0, $D4, $10 ; $B32E
    .byte $10, $10, $D6, $24, $FD, $83, $B3, $FB, $1B, $15, $15, $FE, $02, $D6, $FD, $83 ; $B33E
    .byte $B3, $41, $43, $D6, $B2, $D4, $22, $42, $D6, $FD, $97, $B3, $21, $11, $FD, $97 ; $B34E
    .byte $B3, $41, $B1, $D6, $FB, $B1, $41, $B1, $40, $B1, $B0, $41, $B1, $41, $FE, $03 ; $B35E
    .byte $B1, $41, $B1, $41, $B0, $FB, $40, $FE, $05, $D6, $40, $41, $10, $40, $10, $40 ; $B36E
    .byte $40, $FE, $FF, $2B, $B3, $FB, $B2, $42, $41, $21, $11, $21, $11, $FE, $07, $D1 ; $B37E
    .byte $FB, $B0, $2F, $C0, $FE, $02, $B0, $2A, $FF, $B1, $B1, $FB, $11, $10, $10, $FE ; $B38E
    .byte $06, $FF, $EA, $85, $FD, $50, $B4, $EA, $00, $FD, $FB, $B3, $E4, $90, $70, $40 ; $B39E
    .byte $30, $20, $00, $FD, $FB, $B3, $E3, $90, $70, $40, $30, $20, $00, $EA, $8C, $D6 ; $B3AE
    .byte $7A, $80, $1C, $FB, $E5, $91, $90, $90, $A3, $FE, $03, $E4, $00, $01, $00, $20 ; $B3BE
    .byte $40, $60, $80, $FB, $E5, $91, $90, $90, $A3, $FE, $02, $90, $91, $90, $A3, $D1 ; $B3CE
    .byte $34, $82, $11, $C8, $EB, $01, $02, $E1, $75, $45, $12, $D8, $BD, $86, $19, $E5 ; $B3DE
    .byte $90, $F2, $90, $F4, $90, $EB, $00, $EA, $00, $FE, $FF, $A7, $B3, $D6, $BD, $86 ; $B3EE
    .byte $19, $E9, $71, $E5, $20, $20, $21, $D6, $32, $18, $12, $E4, $71, $91, $E3, $02 ; $B3FE
    .byte $E4, $B2, $A1, $D6, $BD, $86, $19, $E5, $20, $20, $21, $D6, $32, $18, $12, $E4 ; $B40E
    .byte $71, $91, $E3, $02, $22, $41, $D6, $3D, $86, $19, $E5, $80, $80, $81, $D6, $32 ; $B41E
    .byte $18, $12, $E3, $21, $31, $D6, $3D, $86, $19, $E5, $70, $70, $71, $D6, $32, $18 ; $B42E
    .byte $12, $E3, $01, $21, $D6, $3D, $86, $11, $E5, $51, $21, $01, $23, $D6, $36, $83 ; $B43E
    .byte $19, $FF, $D1, $75, $80, $00, $CB, $F2, $E2, $21, $11, $01, $E3, $F1, $B1, $A1 ; $B44E
    .byte $91, $81, $F0, $71, $61, $51, $41, $31, $21, $11, $01, $E4, $B1, $FF, $FD, $50 ; $B45E
    .byte $B4, $FD, $ED, $B4, $E3, $20, $00, $E4, $90, $80, $70, $50, $E9, $00, $F0, $FD ; $B46E
    .byte $ED, $B4, $E2, $20, $00, $E3, $90, $80, $70, $50, $E9, $00, $F0, $D6, $3A, $86 ; $B47E
    .byte $19, $E9, $B1, $FB, $E4, $71, $70, $70, $E8, $49, $EB, $16, $00, $83, $EB, $00 ; $B48E
    .byte $E8, $19, $FE, $03, $E8, $19, $A0, $A1, $A0, $E9, $31, $E3, $00, $20, $40, $60 ; $B49E
    .byte $E9, $B1, $FB, $71, $70, $70, $E8, $49, $EB, $13, $00, $83, $EB, $00, $E8, $19 ; $B4AE
    .byte $FE, $02, $70, $71, $70, $E8, $49, $EB, $13, $00, $83, $EB, $00, $D6, $38, $84 ; $B4BE
    .byte $18, $E9, $71, $EC, $03, $E2, $70, $40, $10, $E3, $A0, $D8, $3A, $86, $19, $E9 ; $B4CE
    .byte $B1, $E4, $90, $F2, $90, $F4, $90, $E9, $00, $EC, $00, $FE, $FF, $6F, $B4, $D6 ; $B4DE
    .byte $70, $18, $19, $E9, $31, $E3, $20, $20, $20, $F4, $E9, $00, $20, $F0, $E9, $31 ; $B4EE
    .byte $01, $21, $E8, $49, $52, $42, $31, $E8, $19, $E9, $31, $20, $20, $20, $F4, $E9 ; $B4FE
    .byte $00, $20, $F0, $E9, $31, $01, $21, $E8, $49, $52, $72, $91, $E8, $19, $E9, $31 ; $B50E
    .byte $80, $80, $80, $F4, $E9, $00, $80, $F0, $E9, $31, $71, $81, $70, $70, $70, $F4 ; $B51E
    .byte $E9, $00, $70, $F0, $E9, $31, $51, $71, $51, $21, $01, $EB, $24, $04, $23, $EB ; $B52E
    .byte $00, $F1, $FF, $D1, $20, $CB, $E2, $21, $11, $01, $E3, $B1, $A1, $91, $81, $71 ; $B53E
    .byte $61, $51, $41, $31, $21, $11, $01, $E4, $B0, $FB, $FD, $D0, $B5, $CB, $FD, $D0 ; $B54E
    .byte $B5, $C5, $D1, $20, $E2, $B0, $A0, $90, $80, $70, $60, $B0, $A0, $90, $80, $70 ; $B55E
    .byte $60, $80, $70, $60, $50, $40, $30, $20, $10, $00, $E3, $B0, $A0, $90, $80, $70 ; $B56E
    .byte $60, $50, $40, $30, $C5, $D1, $02, $E4, $35, $35, $E3, $3B, $D6, $10, $C3, $D1 ; $B57E
    .byte $02, $E4, $25, $25, $E3, $2B, $D6, $10, $C3, $01, $E4, $91, $71, $93, $C1, $D1 ; $B58E
    .byte $20, $E2, $26, $10, $00, $E3, $B0, $A0, $90, $80, $70, $61, $51, $41, $31, $21 ; $B59E
    .byte $FE, $02, $D3, $06, $FB, $E4, $37, $47, $FE, $03, $67, $87, $D3, $05, $FB, $E3 ; $B5AE
    .byte $37, $47, $FE, $03, $D1, $20, $E4, $9F, $81, $71, $61, $51, $9F, $C7, $FE, $FF ; $B5BE
    .byte $57, $B5, $D1, $02, $E4, $95, $95, $E3, $9B, $D6, $10, $FF, $D1, $B3, $B3, $B3 ; $B5CE
    .byte $B0, $2F, $C6, $C1, $B0, $34, $FD, $02, $B6, $FD, $02, $B6, $FD, $29, $B6, $B5 ; $B5DE
    .byte $BB, $B5, $FB, $B0, $31, $22, $FE, $04, $FD, $29, $B6, $CB, $CB, $B0, $2A, $CB ; $B5EE
    .byte $FE, $FF, $E4, $B5, $FB, $D1, $B0, $24, $B0, $24, $B0, $2A, $CB, $4B, $CB, $4B ; $B5FE
    .byte $CB, $4B, $FE, $02, $FB, $B0, $24, $B0, $24, $B0, $2A, $CB, $4B, $FE, $02, $B5 ; $B60E
    .byte $B5, $BB, $BB, $BB, $40, $2A, $FB, $45, $FE, $06, $FF, $FB, $B0, $2A, $B5, $B5 ; $B61E
    .byte $B0, $3A, $15, $15, $FE, $03, $FF, $D3, $78, $84, $12, $E4, $90, $B0, $E3, $10 ; $B62E
    .byte $20, $40, $60, $70, $D6, $7A, $87, $1E, $E9, $31, $90, $90, $90, $F3, $E9, $00 ; $B63E
    .byte $90, $F0, $D1, $78, $84, $12, $FD, $65, $B6, $12, $22, $42, $62, $72, $D3, $78 ; $B64E
    .byte $84, $6A, $EB, $41, $00, $9F, $FF, $E4, $92, $B2, $E3, $12, $22, $42, $62, $72 ; $B65E
    .byte $92, $B2, $E2, $FF, $D3, $36, $83, $12, $EB, $01, $02, $E4, $90, $B0, $E3, $10 ; $B66E
    .byte $20, $40, $60, $70, $EB, $00, $D6, $38, $84, $19, $10, $10, $10, $F3, $10, $D1 ; $B67E
    .byte $35, $82, $12, $EB, $01, $02, $E4, $92, $B2, $E3, $12, $22, $42, $EB, $00, $FD ; $B68E
    .byte $65, $B6, $D3, $75, $82, $6A, $EB, $42, $00, $1F, $FF, $D3, $10, $C6, $D6, $10 ; $B69E
    .byte $E4, $90, $90, $90, $C0, $D3, $20, $E5, $93, $D1, $20, $A1, $B1, $E4, $01, $11 ; $B6AE
    .byte $21, $31, $41, $51, $61, $71, $81, $D3, $20, $9F, $FF, $D3, $C6, $D1, $FB, $B0 ; $B6BE
    .byte $34, $FE, $03, $FF, $D4, $7A, $88, $1E, $E9, $31, $C5, $E5, $21, $21, $21, $41 ; $B6CE
    .byte $41, $41, $51, $51, $51, $71, $81, $91, $E9, $00, $E6, $01, $93, $93, $D1, $7A ; $B6DE
    .byte $88, $1D, $C0, $E6, $06, $E5, $FD, $7F, $B7, $EA, $8C, $FB, $90, $91, $FE, $03 ; $B6EE
    .byte $90, $E6, $01, $9A, $D6, $71, $0C, $12, $E2, $00, $20, $40, $70, $EA, $00, $D1 ; $B6FE
    .byte $7A, $88, $1A, $C0, $E6, $03, $E9, $31, $E5, $FD, $69, $B7, $93, $71, $51, $41 ; $B70E
    .byte $FD, $69, $B7, $75, $A3, $EA, $8E, $D3, $7D, $88, $1E, $E9, $31, $E5, $B1, $B1 ; $B71E
    .byte $B1, $B1, $E6, $01, $BA, $EA, $82, $D6, $73, $11, $18, $EC, $02, $E9, $39, $E2 ; $B72E
    .byte $50, $40, $30, $20, $10, $00, $E3, $B0, $A0, $90, $E6, $01, $86, $EC, $00, $D3 ; $B73E
    .byte $7A, $88, $1A, $E9, $31, $E5, $FB, $B1, $B3, $FE, $04, $EA, $8E, $D3, $7D, $88 ; $B74E
    .byte $1E, $B3, $E6, $01, $BA, $EA, $00, $FE, $FF, $EC, $B6, $21, $23, $23, $91, $E4 ; $B75E
    .byte $21, $E5, $21, $41, $43, $49, $51, $53, $53, $E4, $01, $51, $E5, $51, $71, $73 ; $B76E
    .byte $FF, $21, $21, $51, $21, $72, $82, $91, $FF, $EA, $8C, $D4, $78, $84, $18, $C5 ; $B77E
    .byte $EC, $04, $E9, $39, $E2, $21, $11, $01, $E3, $B1, $A1, $91, $81, $71, $61, $51 ; $B78E
    .byte $41, $31, $E6, $01, $93, $93, $E9, $00, $EC, $00, $EA, $00, $D6, $70, $0C, $12 ; $B79E
    .byte $E9, $31, $E3, $FD, $7F, $B7, $E9, $31, $E2, $00, $00, $F3, $E9, $00, $00, $F0 ; $B7AE
    .byte $E9, $31, $E3, $90, $90, $F3, $E9, $00, $90, $F0, $E9, $31, $80, $80, $F3, $E9 ; $B7BE
    .byte $00, $80, $F0, $E9, $31, $70, $70, $F3, $E9, $00, $70, $F0, $E9, $31, $50, $70 ; $B7CE
    .byte $90, $E2, $00, $E9, $71, $EA, $82, $D3, $76, $80, $18, $EC, $03, $E9, $3B, $FB ; $B7DE
    .byte $E3, $71, $61, $41, $E4, $B1, $E3, $41, $61, $71, $91, $FE, $03, $B1, $71, $91 ; $B7EE
    .byte $B1, $E2, $11, $21, $41, $61, $FB, $71, $61, $41, $E3, $B1, $E2, $41, $61, $71 ; $B7FE
    .byte $91, $FE, $04, $E9, $00, $EC, $00, $F0, $EA, $82, $D6, $77, $82, $28, $EB, $21 ; $B80E
    .byte $04, $E2, $B4, $EB, $00, $D6, $76, $80, $18, $EC, $02, $E9, $3B, $B0, $A0, $90 ; $B81E
    .byte $80, $70, $60, $50, $40, $30, $20, $10, $EC, $00, $E9, $31, $D6, $30, $0C, $12 ; $B82E
    .byte $E3, $B0, $B1, $A0, $A1, $90, $91, $80, $81, $71, $61, $EA, $00, $FE, $FF, $AA ; $B83E
    .byte $B7, $D4, $0A, $C5, $E3, $91, $81, $71, $61, $51, $41, $31, $21, $11, $01, $E4 ; $B84E
    .byte $B1, $A1, $D1, $01, $E3, $43, $43, $D3, $05, $E4, $93, $93, $E3, $03, $E4, $93 ; $B85E
    .byte $E3, $25, $35, $43, $E4, $FB, $41, $43, $FE, $04, $D1, $20, $E3, $94, $81, $71 ; $B86E
    .byte $61, $51, $41, $31, $20, $10, $00, $E4, $B0, $A0, $90, $80, $D6, $18, $E3, $24 ; $B87E
    .byte $E4, $90, $80, $90, $53, $43, $55, $70, $80, $95, $B0, $E3, $10, $24, $E4, $90 ; $B88E
    .byte $80, $90, $E3, $45, $50, $70, $55, $41, $21, $71, $A1, $E2, $21, $D6, $18, $E2 ; $B89E
    .byte $13, $D1, $20, $13, $00, $E3, $B0, $A0, $90, $80, $70, $60, $50, $D6, $18, $E5 ; $B8AE
    .byte $C5, $D1, $20, $E2, $45, $31, $21, $11, $01, $E3, $B1, $A0, $90, $80, $70, $60 ; $B8BE
    .byte $50, $40, $30, $D6, $18, $E4, $90, $E3, $10, $40, $70, $10, $40, $70, $A0, $40 ; $B8CE
    .byte $70, $A0, $E2, $10, $D4, $14, $E3, $A0, $E2, $10, $40, $70, $D1, $20, $70, $60 ; $B8DE
    .byte $50, $40, $30, $20, $10, $00, $FE, $FF, $65, $B8, $D1, $43, $43, $43, $43, $B3 ; $B8EE
    .byte $B3, $FB, $47, $FE, $06, $40, $26, $40, $26, $FB, $B0, $26, $FE, $04, $B0, $32 ; $B8FE
    .byte $B0, $32, $D1, $BB, $BB, $B0, $3A, $BB, $B0, $2F, $C0, $B0, $2F, $C0, $B0, $34 ; $B90E
    .byte $B0, $34, $FB, $B5, $BB, $B5, $B0, $3A, $FE, $02, $FB, $B0, $34, $FE, $04, $D1 ; $B91E
    .byte $FB, $B5, $B5, $B0, $34, $B5, $B0, $2A, $B0, $3A, $FE, $07, $B5, $FB, $B5, $B0 ; $B92E
    .byte $34, $FE, $02, $B0, $34, $B0, $34, $FB, $B0, $24, $FE, $05, $B0, $2A, $D6, $C9 ; $B93E
    .byte $D1, $FB, $B5, $FE, $0E, $B0, $2A, $FE, $FF, $10, $B9, $D1, $36, $82, $19, $E9 ; $B94E
    .byte $71, $E4, $63, $73, $93, $B3, $E3, $13, $23, $43, $EA, $85, $FD, $90, $B9, $D5 ; $B95E
    .byte $36, $82, $6A, $64, $E9, $00, $EB, $01, $02, $F4, $70, $B0, $70, $F3, $B0, $70 ; $B96E
    .byte $B0, $70, $F2, $B0, $70, $B0, $70, $B0, $70, $F4, $B0, $70, $B0, $F5, $70, $B0 ; $B97E
    .byte $70, $FF, $E2, $24, $04, $E3, $B4, $E8, $3B, $9F, $E8, $19, $E2, $04, $E3, $B4 ; $B98E
    .byte $95, $75, $46, $57, $FF, $D1, $78, $84, $19, $F2, $E3, $23, $43, $63, $F1, $73 ; $B99E
    .byte $93, $B3, $F0, $E2, $13, $FD, $90, $B9, $D8, $78, $84, $EA, $EB, $42, $00, $6F ; $B9AE
    .byte $FF, $D4, $10, $C6, $D5, $10, $E3, $25, $D4, $07, $03, $D1, $10, $C1, $D3, $06 ; $B9BE
    .byte $76, $D5, $20, $2F, $FF, $D1, $FB, $13, $FE, $07, $B4, $44, $44, $40, $23, $14 ; $B9CE
    .byte $14, $B4, $44, $45, $45, $46, $47, $41, $D8, $25, $FF, $D7, $B4, $83, $12, $C3 ; $B9DE
    .byte $E9, $31, $FD, $12, $BA, $E3, $70, $FD, $12, $BA, $E3, $B0, $FD, $12, $BA, $E3 ; $B9EE
    .byte $80, $E8, $18, $90, $90, $90, $90, $E6, $01, $C0, $E8, $9C, $7F, $E6, $07, $EB ; $B9FE
    .byte $21, $05, $96, $FF, $E3, $90, $EC, $02, $20, $E8, $1A, $E4, $91, $E3, $91, $21 ; $BA0E
    .byte $E8, $12, $EC, $00, $70, $00, $E4, $70, $E3, $71, $00, $E4, $70, $FF, $D7, $77 ; $BA1E
    .byte $84, $12, $C3, $E9, $B1, $FD, $57, $BA, $E2, $00, $FD, $57, $BA, $E2, $40, $FD ; $BA2E
    .byte $57, $BA, $E2, $10, $E8, $18, $20, $20, $20, $20, $E6, $01, $C0, $E8, $9A, $0F ; $BA3E
    .byte $E6, $07, $E7, $83, $EB, $22, $00, $27, $FF, $E2, $20, $EC, $02, $E3, $90, $E8 ; $BA4E
    .byte $1A, $21, $E2, $21, $E3, $91, $E8, $12, $EC, $00, $E2, $00, $E3, $70, $00, $E2 ; $BA5E
    .byte $01, $E3, $70, $00, $FF, $D7, $09, $C3, $D1, $01, $FB, $E4, $26, $96, $E3, $2D ; $BA6E
    .byte $E4, $2D, $9D, $26, $96, $E3, $26, $E4, $2D, $96, $E3, $2D, $FE, $03, $E4, $26 ; $BA7E
    .byte $26, $26, $26, $C0, $0E, $C0, $D7, $11, $27, $FF, $D1, $41, $4B, $41, $4B, $D7 ; $BA8E
    .byte $FB, $B0, $B0, $41, $B1, $41, $B0, $B0, $40, $B1, $B0, $40, $B0, $FE, $03, $40 ; $BA9E
    .byte $40, $40, $40, $D1, $C0, $B0, $2E, $B0, $2F, $CF, $CF, $CF, $FF, $D4, $74, $80 ; $BAAE
    .byte $10, $F2, $E4, $00, $20, $F1, $40, $50, $70, $F0, $90, $B0, $D6, $B5, $83, $66 ; $BABE
    .byte $EB, $22, $00, $E3, $09, $E4, $71, $42, $E3, $40, $0B, $02, $00, $01, $09, $02 ; $BACE
    .byte $00, $01, $03, $01, $03, $E4, $83, $79, $41, $72, $E3, $00, $45, $41, $43, $43 ; $BADE
    .byte $E8, $66, $57, $97, $87, $57, $E8, $10, $FB, $E9, $B0, $E3, $01, $F1, $E9, $70 ; $BAEE
    .byte $E9, $31, $EC, $01, $E8, $19, $00, $40, $70, $E2, $00, $40, $70, $E1, $00, $E2 ; $BAFE
    .byte $70, $40, $00, $E3, $70, $40, $00, $E4, $70, $E9, $00, $EC, $00, $F0, $E8, $10 ; $BB0E
    .byte $FE, $02, $E9, $B0, $E3, $01, $F1, $E9, $70, $E9, $31, $EC, $01, $E8, $19, $00 ; $BB1E
    .byte $50, $90, $E2, $00, $50, $90, $E1, $00, $E2, $90, $50, $00, $E3, $90, $50, $00 ; $BB2E
    .byte $E4, $90, $E9, $00, $EC, $00, $F0, $E8, $10, $E9, $B0, $E3, $01, $F1, $E9, $70 ; $BB3E
    .byte $E9, $31, $EC, $01, $E8, $19, $E4, $80, $E3, $00, $50, $80, $E2, $00, $50, $E1 ; $BB4E
    .byte $00, $E2, $80, $50, $00, $E3, $80, $50, $00, $E4, $80, $EC, $00, $E9, $00, $F0 ; $BB5E
    .byte $D6, $B5, $82, $66, $E3, $77, $E2, $01, $E4, $71, $E3, $02, $40, $43, $E9, $31 ; $BB6E
    .byte $41, $EC, $01, $01, $E8, $19, $E9, $70, $F1, $40, $00, $40, $00, $90, $80, $70 ; $BB7E
    .byte $60, $E9, $00, $EC, $00, $F0, $E8, $22, $51, $F2, $E9, $70, $E9, $31, $E8, $19 ; $BB8E
    .byte $EC, $01, $E2, $00, $20, $E3, $90, $F1, $E2, $00, $20, $50, $00, $F0, $20, $50 ; $BB9E
    .byte $90, $20, $50, $90, $E1, $00, $F0, $E9, $00, $E9, $B0, $E8, $22, $EC, $00, $E3 ; $BBAE
    .byte $81, $F2, $E9, $70, $E9, $31, $E8, $19, $EC, $01, $E2, $20, $50, $E3, $B0, $F1 ; $BBBE
    .byte $E2, $20, $50, $80, $20, $F0, $50, $80, $B0, $50, $80, $B0, $E1, $20, $EC, $00 ; $BBCE
    .byte $E9, $00, $D4, $B5, $83, $16, $FB, $FD, $25, $BC, $FD, $25, $BC, $21, $E9, $70 ; $BBDE
    .byte $F1, $51, $E2, $01, $E9, $B0, $F0, $E3, $21, $21, $21, $23, $23, $23, $FE, $02 ; $BBEE
    .byte $E9, $70, $FB, $E4, $41, $F2, $41, $F3, $41, $F0, $41, $41, $41, $FE, $02, $21 ; $BBFE
    .byte $F2, $21, $F3, $21, $F0, $21, $21, $21, $FB, $21, $F2, $21, $F0, $FE, $03, $D1 ; $BC0E
    .byte $73, $80, $00, $FD, $3A, $BC, $FF, $E3, $41, $E9, $70, $F1, $71, $EB, $01, $02 ; $BC1E
    .byte $E2, $01, $EB, $00, $E9, $B0, $F0, $E3, $41, $41, $41, $FF, $E4, $4B, $30, $20 ; $BC2E
    .byte $10, $F1, $00, $E5, $B0, $A0, $90, $F2, $80, $70, $60, $50, $40, $F3, $30, $20 ; $BC3E
    .byte $10, $00, $FF, $D4, $76, $83, $15, $F2, $E4, $40, $50, $70, $F1, $90, $B0, $E3 ; $BC4E
    .byte $F0, $00, $20, $D6, $30, $05, $66, $E9, $71, $EB, $22, $00, $E3, $49, $01, $E4 ; $BC5E
    .byte $72, $E3, $90, $7B, $52, $40, $E8, $18, $71, $E8, $66, $59, $52, $40, $E8, $18 ; $BC6E
    .byte $71, $E8, $66, $53, $31, $23, $02, $20, $49, $E4, $71, $E3, $02, $40, $EB, $00 ; $BC7E
    .byte $95, $91, $EB, $21, $00, $B3, $E2, $03, $E8, $64, $0D, $E8, $18, $E9, $00, $F1 ; $BC8E
    .byte $20, $00, $F0, $E9, $71, $E8, $64, $E3, $BF, $E8, $66, $EB, $22, $00, $E3, $49 ; $BC9E
    .byte $E4, $71, $E3, $02, $40, $7B, $E2, $02, $40, $E8, $18, $71, $E8, $66, $EB, $21 ; $BCAE
    .byte $00, $59, $52, $40, $E8, $18, $71, $E8, $66, $53, $31, $23, $02, $20, $E2, $49 ; $BCBE
    .byte $E3, $01, $42, $70, $EB, $00, $95, $91, $EB, $21, $00, $B3, $E2, $03, $E8, $96 ; $BCCE
    .byte $0F, $2F, $DC, $30, $05, $00, $E2, $0F, $DC, $34, $80, $F8, $EB, $01, $00, $E9 ; $BCDE
    .byte $31, $0F, $D4, $78, $84, $16, $EB, $00, $FB, $E9, $31, $E3, $01, $E9, $71, $F3 ; $BCEE
    .byte $01, $F4, $01, $F0, $E9, $31, $01, $01, $01, $FE, $03, $FB, $01, $F3, $E9, $71 ; $BCFE
    .byte $01, $F0, $E9, $31, $FE, $03, $D1, $75, $80, $00, $EA, $08, $FD, $3A, $BC, $FF ; $BD0E
    .byte $D4, $10, $C3, $D1, $20, $E3, $77, $60, $50, $40, $30, $FD, $5C, $BD, $FB, $FD ; $BD1E
    .byte $95, $BD, $FE, $02, $FD, $5C, $BD, $E3, $D3, $06, $2D, $D3, $05, $21, $23, $27 ; $BD2E
    .byte $23, $E4, $FD, $95, $BD, $D4, $06, $FB, $E3, $05, $01, $01, $01, $05, $01, $01 ; $BD3E
    .byte $01, $E4, $A5, $A1, $A1, $A1, $A3, $A3, $A3, $FE, $03, $E3, $04, $FF, $D3, $06 ; $BD4E
    .byte $E3, $0D, $D3, $05, $01, $03, $07, $03, $D3, $06, $E4, $AD, $D3, $05, $A1, $A3 ; $BD5E
    .byte $A7, $A3, $D3, $06, $9D, $D3, $05, $91, $93, $97, $93, $D3, $06, $8D, $D3, $05 ; $BD6E
    .byte $81, $83, $87, $83, $D3, $06, $7D, $D3, $05, $71, $73, $77, $73, $D3, $06, $6D ; $BD7E
    .byte $D3, $05, $61, $63, $67, $63, $FF, $D3, $06, $7D, $D3, $05, $71, $73, $77, $73 ; $BD8E
    .byte $FF, $D4, $C6, $FB, $FD, $E3, $BD, $FE, $08, $D1, $FB, $BB, $1B, $4B, $15, $B5 ; $BD9E
    .byte $BB, $B0, $2A, $CB, $4B, $FE, $04, $FB, $FD, $E3, $BD, $FE, $04, $D1, $FB, $B0 ; $BDAE
    .byte $2F, $C6, $B0, $26, $B0, $26, $B0, $26, $B0, $2F, $C6, $B0, $26, $B0, $26, $B0 ; $BDBE
    .byte $26, $B0, $2F, $C6, $B0, $26, $B0, $26, $B0, $26, $B0, $2E, $B0, $2E, $B0, $2E ; $BDCE
    .byte $FE, $03, $B0, $26, $FF, $D6, $B1, $11, $41, $10, $B0, $B1, $B1, $41, $B1, $FF ; $BDDE
    .byte $D7, $75, $83, $12, $E3, $20, $00, $20, $F2, $00, $20, $F0, $E4, $90, $E3, $00 ; $BDEE
    .byte $20, $E4, $72, $62, $51, $E8, $1A, $E9, $31, $E5, $90, $E4, $00, $20, $50, $70 ; $BDFE
    .byte $90, $E3, $00, $D1, $73, $80, $00, $26, $E9, $00, $10, $00, $E4, $B0, $A0, $90 ; $BE0E
    .byte $F1, $80, $F2, $70, $F3, $60, $F4, $50, $F5, $40, $C2, $F7, $E3, $26, $10, $00 ; $BE1E
    .byte $F8, $E4, $B0, $A0, $90, $FF, $D7, $37, $84, $12, $E3, $70, $50, $70, $F4, $50 ; $BE2E
    .byte $70, $F0, $20, $50, $70, $E8, $53, $02, $E4, $B2, $A1, $E8, $1A, $20, $50, $70 ; $BE3E
    .byte $A0, $E3, $00, $20, $50, $D1, $35, $80, $00, $76, $60, $50, $40, $30, $20, $F1 ; $BE4E
    .byte $10, $F2, $00, $F3, $E4, $B0, $F4, $A0, $F5, $90, $C2, $F7, $E3, $76, $60, $50 ; $BE5E
    .byte $F8, $40, $30, $20, $FF, $D7, $10, $E4, $70, $50, $70, $E3, $70, $E4, $70, $20 ; $BE6E
    .byte $50, $70, $E3, $02, $E4, $B2, $A1, $20, $50, $70, $A0, $E3, $00, $20, $50, $D1 ; $BE7E
    .byte $20, $76, $40, $30, $20, $10, $00, $FF, $D7, $B0, $40, $42, $40, $40, $40, $D1 ; $BE8E
    .byte $B0, $29, $C9, $B0, $29, $C9, $B0, $2C, $D7, $B0, $FB, $40, $FE, $06, $D1, $40 ; $BE9E
    .byte $29, $FF, $F2, $BE, $F7, $BE, $FC, $BE, $00, $BF, $00, $BF, $00, $BF, $06, $BF ; $BEAE
    .byte $06, $BF, $06, $BF, $11, $BF, $18, $BF, $18, $BF, $18, $BF, $20, $BF, $20, $BF ; $BEBE
    .byte $26, $BF, $2E, $BF, $2E, $BF, $36, $BF, $3E, $BF, $46, $BF, $46, $BF, $50, $BF ; $BECE
    .byte $5B, $BF, $65, $BF, $74, $BF, $84, $BF, $84, $BF, $86, $BF, $8A, $BF, $95, $BF ; $BEDE
    .byte $9E, $BF, $AA, $BF, $17, $16, $25, $14, $FF, $17, $16, $25, $14, $FF, $13, $14 ; $BEEE
    .byte $13, $FF, $16, $17, $16, $15, $14, $FF, $18, $17, $16, $15, $14, $13, $21, $15 ; $BEFE
    .byte $14, $23, $FF, $12, $13, $14, $13, $12, $11, $FF, $17, $16, $25, $14, $21, $22 ; $BF0E
    .byte $11, $FF, $17, $18, $17, $16, $15, $FF, $16, $17, $18, $19, $18, $17, $16, $FF ; $BF1E
    .byte $1A, $19, $18, $17, $16, $15, $10, $FF, $18, $17, $16, $15, $14, $20, $13, $FF ; $BF2E
    .byte $13, $14, $15, $16, $15, $14, $13, $FF, $18, $14, $18, $14, $17, $14, $16, $15 ; $BF3E
    .byte $14, $FF, $16, $25, $24, $13, $12, $51, $14, $13, $12, $11, $FF, $29, $28, $27 ; $BF4E
    .byte $16, $15, $14, $30, $17, $16, $FF, $17, $16, $15, $14, $13, $12, $15, $14, $13 ; $BF5E
    .byte $22, $13, $15, $13, $12, $FF, $20, $FB, $11, $12, $13, $12, $11, $10, $1F, $1E ; $BF6E
    .byte $1D, $1E, $1F, $10, $FE, $FF, $11, $FF, $14, $11, $10, $FF, $FB, $11, $12, $11 ; $BF7E
    .byte $20, $1F, $1E, $1F, $20, $FE, $FF, $FB, $11, $12, $11, $20, $3F, $20, $FE, $FF ; $BF8E
    .byte $16, $14, $12, $11, $10, $FB, $31, $20, $3F, $20, $FE, $FF, $17, $16, $15, $14 ; $BF9E
    .byte $13, $12, $11, $10, $FB, $11, $12, $11, $20, $1F, $1E, $1F, $20, $FE, $FF, $FF ; $BFAE
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $BFBE
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $D8, $78, $EE, $FF, $FF, $4C ; $BFCE
    .byte $10, $C3, $00, $00, $00, $00, $00, $00, $00, $00, $00, $53, $54, $49, $4E, $47 ; $BFDE
    .byte $45, $52, $00, $00, $00, $00, $38, $02, $01, $06, $A4, $1B, $A3, $C3, $D8, $BF ; $BFEE
    .byte $12, $C4 ; $BFFE
