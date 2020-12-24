;Screen & Sprite Pointers
SCREENRAM                       = $0400
;
; **** ZP FIELDS **** 
;
f04 = $04
f08 = $08
f10 = $10
f12 = $12
f20 = $20
f2A = $2A
f40 = $40
f55 = $55
f75 = $75
f76 = $76
f94 = $94
f9C = $9C
fA9 = $A9
fB6 = $B6
fC6 = $C6
fCE = $CE
fE6 = $E6
;
; **** ZP ABSOLUTE ADRESSES **** 
;
a00 = $00
a01 = $01
a02 = $02
a03 = $03
charToPlot = $04
colourToPlot = $05
a06 = $06
a07 = $07
a08 = $08
a09 = $09
a0A = $0A
a0B = $0B
a0C = $0C
InputJoy = $0D
a0E = $0E
a10 = $10
a11 = $11
a12 = $12
a13 = $13
a14 = $14
a15 = $15
a16 = $16
a17 = $17
a18 = $18
a19 = $19
a1A = $1A
a1B = $1B
a1C = $1C
a1D = $1D
a1E = $1E
a20 = $20
a22 = $22
a23 = $23
a24 = $24
a25 = $25
a26 = $26
a27 = $27
a28 = $28
a29 = $29
a2A = $2A
a2B = $2B
a2C = $2C
a2D = $2D
a2E = $2E
a2F = $2F
a30 = $30
a31 = $31
a32 = $32
a33 = $33
a34 = $34
a35 = $35
a36 = $36
a37 = $37
a38 = $38
a39 = $39
a3A = $3A
a3B = $3B
a3C = $3C
a3D = $3D
a3E = $3E
a3F = $3F
a40 = $40
a41 = $41
a44 = $44
a46 = $46
a48 = $48
zpHi3 = $49
a4C = $4C
a4D = $4D
a4E = $4E
a4F = $4F
a50 = $50
a52 = $52
a53 = $53
a54 = $54
a5A = $5A
a6C = $6C
a84 = $84
a86 = $86
a96 = $96
aA5 = $A5
aA9 = $A9
aC3 = $C3
aC5 = $C5
aC6 = $C6
aC8 = $C8
aCE = $CE
aD6 = $D6
aDD = $DD
aFB = $FB
aFC = $FC
aFD = $FD
aFE = $FE
;
; **** ZP POINTERS **** 
;
p00 = $00
p01 = $01
p02 = $02
p03 = $03
p04 = $04
p06 = $06
p08 = $08
p20 = $20
p21 = $21
p33 = $33
p42 = $42
p43 = $43
zpLo3 = $48
p49 = $49
p4D = $4D
p52 = $52
p53 = $53
p54 = $54
p62 = $62
p7A = $7A
p82 = $82
p8E = $8E
p90 = $90
p96 = $96
pA1 = $A1
pA2 = $A2
pCE = $CE
pE8 = $E8
pFB = $FB
pFD = $FD
;
; **** FIELDS **** 
;
f000A = $000A
f007C = $007C
f00FE = $00FE
SCREEN_PTR_LO = $0340
SCREEN_PTR_HI = $0360
f03FF = $03FF
f0409 = $0409
f0478 = $0478
f0500 = $0500
f0600 = $0600
f0700 = $0700
f0709 = $0709
f077A = $077A
f3C3C = $3C3C
f3C42 = $3C42
f3F00 = $3F00
f4220 = $4220
f4C20 = $4C20
f5220 = $5220
f554F = $554F
f605F = $605F
f6303 = $6303
f7818 = $7818
f7E00 = $7E00
ScreenHeaderText = $8103
ScreenHeaderColors = $8131
f815F = $815F
f83E2 = $83E2
f83E3 = $83E3
f83E4 = $83E4
f87A1 = $87A1
f87A5 = $87A5
f89D3 = $89D3
f912E = $912E
f9131 = $9131
f9134 = $9134
f9137 = $9137
f91F7 = $91F7
f9213 = $9213
f922F = $922F
f924B = $924B
f925F = $925F
f9273 = $9273
f9287 = $9287
f929B = $929B
f92AF = $92AF
f92C3 = $92C3
f92D7 = $92D7
f92EB = $92EB
EnterZoneText = $9412
f9458 = $9458
f9460 = $9460
ExplosionAnimation = $9623
f9627 = $9627
GotYouText = $96E9
ZoneClearedText = $9784
f9840 = $9840
f987B = $987B
TitleTextLine1 = $9903
TitleTextLine2 = $9919
TitleTextLine3 = $992F
TitleTextLine4 = $9945
TitleTextLine5 = $995B
f9971 = $9971
GameOverText = $9AEE
HiScoreText = $9B53
f9B5A = $9B5A
f9C00 = $9C00
f9D00 = $9D00
f9E00 = $9E00
fA980 = $A980
fB01F = $B01F
fBEB0 = $BEB0
fC000 = $C000
fC600 = $C600
fC602 = $C602
fC606 = $C606
fC666 = $C666
fC6C6 = $C6C6
fD4DC = $D4DC
fD5A2 = $D5A2
fD7FF = $D7FF
fD878 = $D878
fD900 = $D900
fDA00 = $DA00
fDB00 = $DB00
fF000 = $F000
fF800 = $F800
fFC02 = $FC02
fFE06 = $FE06
fFEC6 = $FEC6
fFEFC = $FEFC
fFFFF = $FFFF
;
; **** ABSOLUTE ADRESSES **** 
;
a0000 = $0000
a0030 = $0030
a00C6 = $00C6
a00CC = $00CC
a00D8 = $00D8
a0102 = $0102
a017E = $017E
a028D = $028D
a0291 = $0291
charToPlot15 = $0415
a0626 = $0626
a0703 = $0703
a2E2E = $2E2E
a3030 = $3030
a3146 = $3146
a361B = $361B
a381C = $381C
a4000 = $4000
a4001 = $4001
a4002 = $4002
a4003 = $4003
a4004 = $4004
a4554 = $4554
a4555 = $4555
a4E49 = $4E49
a6F6D = $6F6D
a83EC = $83EC
a8A8B = $8A8B
a8D40 = $8D40
a8D8C = $8D8C
a8E58 = $8E58
aB6DB = $B6DB
aC040 = $C040
aCEC8 = $CEC8
aD602 = $D602
aECCF = $ECCF
;
; **** POINTERS **** 
;
p0038 = $0038
p0108 = $0108
p0109 = $0109
p0113 = $0113
p0170 = $0170
p0171 = $0171
p0301 = $0301
p0313 = $0313
p0317 = $0317
p033C = $033C
p0400 = $0400
p040E = $040E
p04A0 = $04A0
p0507 = $0507
p070E = $070E
p070F = $070F
p075E = $075E
p3838 = $3838
p3A16 = $3A16
p6600 = $6600
p9F00 = $9F00
pD6C6 = $D6C6
pDBB6 = $DBB6
;
; **** EXTERNAL JUMPS **** 
;
e0505 = $0505
e2884 = $2884
e3931 = $3931
e4345 = $4345
e494D = $494D
e4C43 = $4C43
e4D41 = $4D41
e4E41 = $4E41
e4F5A = $4F5A
e5020 = $5020
e5453 = $5453
e5645 = $5645
e594D = $594D
e5FDE = $5FDE
Prepare_Init_Charset = $8000
WasteCycles = $8013
Init_ScreenPointerArray = $8022
Screen_GetPointer = $8049
e8058 = $8058
Screen_Plot = $805E
ClearScreen = $8071
Initialize_Game = $8085
e80CB = $80CB
e80D1 = $80D1
e80D7 = $80D7
e80DD = $80DD
DrawScreenHeader = $80E9
DrawSplashScreen = $80FB
e8167 = $8167
e8170 = $8170
e817B = $817B
e819A = $819A
e81BC = $81BC
e8298 = $8298
GameLoop = $83C4
e83DC = $83DC
e83F5 = $83F5
e84A6 = $84A6
e84EB = $84EB
e850A = $850A
e8530 = $8530
e85C6 = $85C6
e8699 = $8699
e86CA = $86CA
e86CD = $86CD
e875A = $875A
e8794 = $8794
e87AA = $87AA
e880F = $880F
e882E = $882E
e8856 = $8856
e8894 = $8894
e88AE = $88AE
e88B8 = $88B8
e88FD = $88FD
e893E = $893E
e898F = $898F
e89CC = $89CC
e89DF = $89DF
e8A31 = $8A31
e8A4E = $8A4E
e8A67 = $8A67
e8A6E = $8A6E
e8A92 = $8A92
e8AE2 = $8AE2
e8B02 = $8B02
e8B46 = $8B46
e8B50 = $8B50
e8B5A = $8B5A
e8B81 = $8B81
e8C43 = $8C43
e8C73 = $8C73
e8CDB = $8CDB
e8D20 = $8D20
e8D27 = $8D27
e8D61 = $8D61
e8DE5 = $8DE5
e8DF4 = $8DF4
e8E33 = $8E33
e8E35 = $8E35
e8E68 = $8E68
e8EE8 = $8EE8
e8EF0 = $8EF0
e8F1E = $8F1E
e8F3D = $8F3D
e8FB4 = $8FB4
e8FC7 = $8FC7
e8FEA = $8FEA
e9010 = $9010
e9026 = $9026
e905F = $905F
e90A4 = $90A4
e90E5 = $90E5
e913B = $913B
e917A = $917A
e9197 = $9197
e91C5 = $91C5
e91DE = $91DE
e9300 = $9300
e933C = $933C
e9382 = $9382
e93F0 = $93F0
e93F3 = $93F3
e941F = $941F
e9469 = $9469
e9496 = $9496
e94A6 = $94A6
e94B6 = $94B6
e94D3 = $94D3
e95AA = $95AA
e95B7 = $95B7
e95FF = $95FF
e962F = $962F
e963F = $963F
e966C = $966C
e96F1 = $96F1
e9852 = $9852
DrawTitleScreen = $9880
e9987 = $9987
e9989 = $9989
e99BB = $99BB
e99CA = $99CA
e99F7 = $99F7
e9A06 = $9A06
e9A26 = $9A26
e9A56 = $9A56
e9AD4 = $9AD4
e9AF7 = $9AF7
e9B30 = $9B30
e9BAA = $9BAA
Init_Charset = $9BB3
eA360 = $A360
;
; **** PREDEFINED LABELS **** 
;
ROM_SETLFSj = $FE00
ROM_CLOSE = $FFC3

        * = $0801

;------------------------------------------------------------------------------------
; 10 SYS 2088
; Used to execute the code at address $0828 (2088 in hex).
;------------------------------------------------------------------------------------
        AND (p08,X)
        .BYTE $00,$FA,$9E,$28,$32,$30,$38,$38,$29,$20 ; 10 SYS 2088

;------------------------------------------------------------------------------------
; Crack Credit
;------------------------------------------------------------------------------------
       .BYTE $43,$52,$41,$43                  ; CRACKED BY RAT.SOFT
       .BYTE $4B,$45,$44,$20,$42,$59,$20,$52
       .BYTE $41,$54,$AB,$53,$4F,$46,$54,$00
       .BYTE $00,$00,$00,$00,$00,$00,$00

;------------------------------------------------------------------------------------
; Copies the game code from $0900 to $8000 and starts executing code
; at $8000. This is the address of the cartridge ROM and is where the code will
; be executed when the game is loaded from a cartridge.
;------------------------------------------------------------------------------------
* = $0828
        LDX #$50
        LDA #$27
        STX aFB
        STA aFC
        LDX #<p9F00
        LDA #>p9F00
        STX aFD
        STA aFE
        LDY #$FF
b083A   LDA (pFB),Y                                                            ; e7FEA
        STA (pFD),Y
        DEY 
        CPY #$FF
b0842   =*+$01                                                                 ; e7FF2
        BNE b083A
        DEC aFC
        DEC aFE
        BMI b083A
        JMP Prepare_Init_Charset

        .BYTE $AA,$AA,$AA,$AA                                  ; Not Reached
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA  ; Not Reached

;------------------------------------------------------------------------------------
; Prepare_Init_Charset
; e8000, f085C
;------------------------------------------------------------------------------------
        LDA #$01                                                                         
        STA a13
        JMP Init_Charset

;------------------------------------------------------------------------------------
;WasteCycles
;------------------------------------------------------------------------------------
b0863   LDA #$08                                                               ; WasteCycles
        STA a5A
b0867   DEY                                                                   ; e8017
        BNE b0867
        DEC a5A
        BNE b0867
        RTS 

;------------------------------------------------------------------------------------
; e801F
;------------------------------------------------------------------------------------
        BNE b0863
        RTS 

;------------------------------------------------------------------------------------
; Init_ScreenPointerArray
; Sets up an array to point to the screen, stored in $0340 and $0360
;------------------------------------------------------------------------------------
        LDA #>SCREENRAM
        STA zpHi3
        LDA #<SCREENRAM
        STA a48
        LDX #$00
b087C   LDA a48                                                                ; e802C
        STA SCREEN_PTR_LO,X
        LDA zpHi3
        STA SCREEN_PTR_HI,X
        LDA a48
        CLC 
        ADC #$28
        STA a48
        LDA zpHi3
        ADC #$00
        STA zpHi3
        INX 
        CPX #$18
        BNE b087C
        RTS 

;------------------------------------------------------------------------------------
;Screen_GetPointer
;------------------------------------------------------------------------------------
        LDX a03
        LDY a02
        LDA SCREEN_PTR_LO,X
        STA a48
        LDA SCREEN_PTR_HI,X
        STA zpHi3
        RTS 

;------------------------------------------------------------------------------------
;e8058
;------------------------------------------------------------------------------------
        JSR Screen_GetPointer
        LDA (zpLo3),Y
        RTS 

;------------------------------------------------------------------------------------
;Screen_Plot
; Plots a char to the screen and sets its colour. Char is stored in charToPlot
;------------------------------------------------------------------------------------
        JSR Screen_GetPointer
        LDA charToPlot
        STA (zpLo3),Y
        LDA zpHi3
        CLC 
        ADC #$D4
        STA zpHi3
        LDA colourToPlot
        STA (zpLo3),Y
        RTS 

;------------------------------------------------------------------------------------
; ClearScreen
; Clear the Screen with spaces
;------------------------------------------------------------------------------------
        LDX #$00
b08C3   LDA #$20                                                               ; e8073
        STA p0400,X
        STA f0500,X
        STA f0600,X
        STA f0700,X
        DEX 
        BNE b08C3
        RTS 

;------------------------------------------------------------------------------------
;Initialize_Game
;------------------------------------------------------------------------------------
        LDA #$00
        LDX #$18
b08D9   STA $D400,X  ;Voice 1: Frequency Control - Low-Byte                    ; e8089
        DEX 
        BNE b08D9
        LDA #$00
        STA a4000
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$30
        LDX #$07
b08EE   STA f14F0,X                                                            ; e809E
        DEX 
        BNE b08EE
        LDA #$A0
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        LDA #$80
        STA a0291
        LDA #$00
        NOP 
        STA $D021    ;Background Color 0
        STA $D020    ;Border Color
        LDA #$18
s0910   =*+$01                                                                 ; e80C0
        STA $D018    ;VIC Memory Control Register
        JSR ClearScreen
        JSR Init_ScreenPointerArray
        JMP DrawSplashScreen

;e80CB
        LDA #$11
        STA $D40B    ;Voice 2: Control Register
        RTS 
;e80D1
        LDA #$21
        STA $D412    ;Voice 3: Control Register
        RTS 
;e80D7
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        RTS 

;e80DD
        LDA #$00
        STA $D412    ;Voice 3: Control Register
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        RTS 

;-------------------------------------------------------
;DrawScreenHeader
;-------------------------------------------------------
        LDX #$2E
b093B   LDA ScreenHeaderText,X
        STA f03FF,X
        LDA ScreenHeaderColors,X
        STA fD7FF,X
        DEX 
        BNE b093B
        RTS 

;-------------------------------------------------------
;DrawSplashScreen
;-------------------------------------------------------
        JSR DrawScreenHeader
        JSR DrawTitleScreen
        JMP e81BC

;ScreenHeaderText
        .BYTE $23,$24,$22,$25,$26,$27              ; MATRIX
        .BYTE $20,$19,$1A,$20,$30,$30,$30          ;  SC 000 
        .BYTE $30,$30,$30,$30,$20,$20,$07,$20      ; 0000  * 
        .BYTE $35,$20,$53,$48,$49,$50,$53,$20      ; 5 SHIPS 
        .BYTE $52,$45,$4D,$41,$49,$4E,$49,$4E      ; REMAININ 
        .BYTE $47,$20,$20,$21,$21,$21,$21,$21      ; G
;ScreenHeaderColors
        .BYTE $21,$43,$43,$43,$43,$43,$43,$40
        .BYTE $44,$44,$40,$47,$47,$47,$47,$47
        .BYTE $47,$47,$40,$40,$45,$40,$43,$40
        .BYTE $44,$44,$44,$44,$44,$43,$47,$47
        .BYTE $47,$47,$47,$47,$47,$47,$47,$47
        .BYTE $47,$44,$44,$44,$44,$44
;f815F
        .BYTE $44,$06
        .BYTE $02,$04,$05,$03,$07,$01,$20,$DD
        .BYTE $80,$A9,$0F,$8D,$18,$D4,$60

;------------------------------------------------------------------------------------
;e8170
;------------------------------------------------------------------------------------
        LDX a02
b09C2   LDY a03                                                                ; e8172
b09C4   DEY                                                                   ; e8174
        BNE b09C4
        DEX 
        BNE b09C2
        RTS 

        LDA #>p04A0
        STA zpHi3
        LDA #<p04A0
        STA a48
b09D3   LDA #$00                                                               ; e8183
        LDY #$26
b09D7   STA (zpLo3),Y                                                            ; e8187
        DEY 
        BNE b09D7
        LDA zpHi3
        PHA 
        CLC 
        ADC #$D4
        STA zpHi3
        LDX a06
        LDA f815F,X
        LDY #$26
b09EB   STA (zpLo3),Y                                                            ; e819B
        DEY 
        BNE b09EB
        LDA a48
        ADC #$28
        STA a48
        PLA 
        ADC #$00
        STA zpHi3
        INC a06
        LDA a06
        CMP #$08
        BNE b0A07
        LDA #$01
        STA a06
b0A07   DEC a07                                                                ; e81B7
        BNE b09D3
        RTS 

;-------------------------------------------------------
;e81BC
;-------------------------------------------------------
        LDA #$02
p0A10   =*+$02
a0A0E   STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$03
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        JSR e80CB
        JSR e80D1
        LDA #$00
        LDX #$08
b0A20   STA f1FFF,X                                                            ; e81D0
        DEX 
        BNE b0A20
        LDA #<p0113
        STA a08
        LDA #>p0113
        STA a09
b0A2E   LDA a09                                                                ; e81DE
        STA a06
        LDA #$14
        SEC 
        SBC a08
        STA a07
        LDA a4000
        STA $D418    ;Select Filter Mode and Volume
        INC a4000
        LDA a4000
        CMP #$10
        BNE b0A4C
        DEC a4000
b0A4C   JSR e817B                                                              ; e81FC
        LDX #$00
b0A51   LDA #$FF                                                               ; e8201
        STA f2000,X
        TXA 
        PHA 
        LDA #<p1080
        STA a02
        LDA #>p1080
        STA a03
        JSR e8170
        PLA 
        TAX 
        JSR WasteCycles
        LDA #$00
        STA f2000,X
        INX 
        CPX #$08
        BNE b0A51
        DEC a09
        BNE b0A7A
        LDA #$07
        STA a09
b0A7A   DEC a08                                                                ; e822A
        BNE b0A2E
        LDX #$08
b0A80   LDA #$FF                                                               ; e8230
        STA f1FFF,X
        TXA 
        PHA 
        LDA #<p10F0
        STA a02
        LDA #>p10F0
        STA a03
        JSR e8170
        PLA 
        TAX 
        DEX 
        BNE b0A80
        LDA #$66
        LDX #$00
b0A9B   STA fD878,X                                                            ; e824B
        STA fD900,X
        STA fDA00,X
        STA fDB00,X
        INX 
        BNE b0A9B
        LDA #<p03
        STA a06
        LDA #>p03
        STA a07
        JSR e80DD
        JSR e80CB
b0AB8   LDX #$60                                                               ; e8268
        LDA #$0F
        STA a4000
b0ABF   STX $D408    ;Voice 2: Frequency Control - High-Byte                   ; e826F
        LDY #$00
b0AC4   DEY                                                                   ; e8274
        BNE b0AC4
        DEX 
        BNE b0ABF
        LDY #$08
b0ACC   LDX a07                                                                ; e827C
        LDA f22D8,X
        STA f1FFF,Y
        INC a07
        DEY 
        BNE b0ACC
        LDA a4000
        SBC #$04
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        DEC a06
        BNE b0AB8
        JSR e9300
        JSR e80DD
        JSR e9382
        LDA #$90
        STA a4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        JSR e80D7
        LDA #>p1514
        STA a0B
        LDA #<p1514
        STA a0A
        LDA #$09
        STA a06
b0B08   LDA #$0F                                                               ; e82B8
        SEC 
        SBC a06
        STA $D418    ;Select Filter Mode and Volume
        LDA a0A
        SEC 
        SBC a06
        STA a02
        LDA a0B
        SBC a06
        SEC 
        STA a03
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        JSR Screen_Plot
        LDA a0A
        CLC 
        ADC a06
        STA a02
        JSR Screen_Plot
        DEC a06
        DEC a02
        INC a03
        LDA #<p0317
        STA charToPlot
        LDA #>p0317
        STA colourToPlot
        JSR Screen_Plot
        LDA a0A
        SEC 
        SBC a06
        STA a02
        DEC charToPlot
        JSR Screen_Plot
        LDA a06
        CLC 
        ADC #$01
        ASL 
        ASL 
        ASL 
        STA a02
        LDA #$00
        STA a03
        JSR e8170
        LDA a06
        CMP #$00
        BNE b0B08
        JSR e80DD
        LDA #$0F
        STA a4000
        JSR e80D1
        LDA #$03
        STA a06
b0B76   LDA #$65                                                               ; e8326
        CLC 
        ADC a06
        LDX #$00
b0B7D   STA fD878,X                                                            ; e832D
        STA fD900,X
        STA fDA00,X
        STA fDB00,X
        DEX 
        BNE b0B7D
        LDA a0A
        STA a02
        LDA a0B
        STA a03
        LDA #<p0507
        STA charToPlot
        LDA #>p0507
        STA colourToPlot
        JSR Screen_Plot
        LDA #$C0
        STA a4004
b0BA4   LDY #$00                                                               ; e8354
b0BA6   DEY                                                                   ; e8356
        BNE b0BA6
        DEC a4004
        LDA a4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        CMP #$80
        BNE b0BA4
        LDA a4000
        SBC #$05
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        DEC a06
        BNE b0B76
        JSR e8167
        LDA #$00
        LDX #$20
b0BCC   STA f1320,X                                                            ; e837C
        DEX 
        BNE b0BCC
        STA a10
        STA a17
        STA a39
        STA a1E
        STA a28
        STA a31
        STA a36
        STA a3D
        STA a40
        STA a0E
        LDA #>p0301
        STA a15
        LDA #<p0301
        STA a14
        STA a16
        LDA #$02
        STA a35
        LDA #$20
        STA a26
        STA a27
        STA a2D
        STA a2E
        LDA #$13
        STA a29
        LDA #$40
        STA a2B
        STA a2C
        LDA #$04
        STA a41
a0C0C   LDA #$0F
p0C0E   STA a4000
        STA $D418    ;Select Filter Mode and Volume

;GameLoop
        JSR e83F5
        JSR e8530
        JSR e85C6
        JSR e8699
        JSR e893E
        JSR e90E5
        JSR e850A
        JMP GameLoop

JOY1 = $DC01
;---------------------------------------------------------------
;e83DC
;---------------------------------------------------------------
        LDA JOY1    ;CIA1: Data Port Register B
        EOR #$1F
        STA InputJoy
        RTS 

;f83E4
        .BYTE $02,$0D,$0E,$0F,$10
        .BYTE $11,$12,$0A,$08,$03,$04,$05,$06
        .BYTE $0A,$13,$14,$15

;---------------------------------------------------------------
;e83F5
;---------------------------------------------------------------
        DEC a0E
        DEC a0E
        BEQ b0C55

b0C4B   LDA a0E                                                                ; e83FB
        CMP #$80
        BEQ b0C52
        RTS 

b0C52   JMP e84EB                                                              ; e8402

b0C55   JSR e83DC                                                              ; e8405
        JSR e94A6
        LDA a0A
        STA a02
        CMP #$03
        BEQ b0C67
        CMP #$25
        BNE b0C6D
b0C67   LDA a41                                                                ; e8417
        AND #$FB
        STA a41
b0C6D   LDA a0B                                                                ; e841D
        STA a03
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        JSR Screen_Plot
        LDA InputJoy
        AND #$01
        BEQ b0C8C
        DEC a03
        LDA a03
        CMP #$06
        BNE b0C8C
        INC a03
b0C8C   LDA InputJoy                                                                ; e843C
        AND #$02
        BEQ b0C9C
        INC a03
        LDA a03
        CMP #$16
        BNE b0C9C
        DEC a03
b0C9C   LDA #$00                                                               ; e844C
        STA a0C
        LDA InputJoy
        AND #$04
        BEQ b0CB4
        LDA #$01
        STA a0C
        DEC a02
        BNE b0CB4
        INC a02
        LDA #$00
        STA a0C
b0CB4   LDA InputJoy                                                                ; e8464
        AND #$08
        BEQ b0CCC
        LDA #$02
        STA a0C
        INC a02
        LDA a02
        CMP #$27
        BNE b0CCC
        DEC a02
        LDA #$00
        STA a0C
b0CCC   JSR e882E                                                              ; e847C
        LDA InputJoy
        AND #$10
        BEQ b0CF2
        LDA a10
        BNE b0CF2
        LDA a0A
        STA a11
        LDA a0B
        STA a12
        DEC a12
        LDA #$01
        STA a10
        LDA #$70
        STA a4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        JSR e80D7
b0CF2   LDA a0C                                                                ; e84A2
        BNE b0D09
        LDA a0A
        STA a02
        LDA a0B
        STA a03
        LDA #<p0507
        STA charToPlot
        LDA #>p0507
        STA colourToPlot
        JMP Screen_Plot

b0D09   LDA a0B                                                                ; e84B9
        STA a03
s0D0D   LDA #$05                                                               ; e84BD
        STA colourToPlot
        LDA a0C
        CMP #$02
        BEQ b0D29
        LDA #$0B
        STA charToPlot
        LDA a0A
        STA a02
        JSR Screen_Plot
        INC charToPlot
        INC a02
        JMP Screen_Plot

b0D29   LDA #$0C                                                               ; e84D9
        STA charToPlot
        LDA a0A
        STA a02
        JSR Screen_Plot
        DEC charToPlot
        DEC a02
        JMP Screen_Plot

;e84EB
        LDA a0C
        BNE b0D40
        RTS 

b0D40   JSR e84A6                                                              ; e84F0
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        INC a02
        LDA a0C
        CMP #$02
        BNE b0D57
        DEC a02
        DEC a02
b0D57   JMP Screen_Plot                                                              ; e8507

;-------------------------------------------------------  
;e850A
;-------------------------------------------------------  
        LDA #$06
        LDA aC5
        CMP #$40
        BNE b0D63
b0D62   RTS                                                                   ; e8512

b0D63   LDA a028D                                                              ; e8513
        AND #$07
        CMP #$07
        BEQ b0D7D
        CMP #$02
        BNE b0D62
b0D70   LDA aC5                                                                ; e8520
        CMP #$40
        BNE b0D70
b0D76   LDA aC5                                                                ; e8526
        CMP #$40
        BEQ b0D76
        RTS 

b0D7D   JMP e94B6                                                              ; e852D

;----------------------------------------------------------------
;e8530
;----------------------------------------------------------------
        DEC a13
        BEQ b0D85
b0D84   RTS                                                                   ; e8534

b0D85   LDA #$20                                                               ; e8535
        STA a13
        LDA a4001
        BEQ b0DA1
        DEC a4001
        DEC a4001
        LDA a4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        BNE b0DA1
        LDA #$00
        STA $D404    ;Voice 1: Control Register
b0DA1   LDA a10                                                                ; e8551
        BEQ b0D84
        AND #$F0
        BEQ b0DBE
        CMP #$10
        BNE b0DB0
        JMP e9010

b0DB0   CMP #$20                                                               ; e8560
        BNE b0DB7
        JMP e90A4

b0DB7   CMP #$30                                                               ; e8567
        BNE b0DBE
        JMP e905F

b0DBE   LDA a10                                                                ; e856E
        AND #$02
        BNE b0DE0
        LDA #$01
        STA colourToPlot
        LDA a11
        STA a02
        LDA a12
        STA a03
        JSR e8856
        LDA #$09
        STA charToPlot
        LDA a10
        EOR #$02
        STA a10
        JMP Screen_Plot

b0DE0   LDA a11                                                                ; e8590
        STA a02
        LDA a12
        STA a03
        LDA #>p6600
        STA colourToPlot
        LDA #<p6600
        STA charToPlot
        JSR Screen_Plot
        DEC a12
        DEC a03
        LDA a03
        CMP #$02
        BNE b0E02
        LDA #$00
        STA a10
        RTS 

b0E02   LDA #>p0108                                                            ; e85B2
        STA colourToPlot
        LDA #<p0108
        STA charToPlot
        LDA a10
        EOR #$02
        STA a10
        JSR e8856
a0E15   =*+$02
        JMP Screen_Plot

;-------------------------------------------------------  
;e85C6
;-------------------------------------------------------  
        LDA a0E
        CMP #$30
        BEQ b0E1D
b0E1C   RTS                                                                   ; e85CC

b0E1D   DEC a16                                                                ; e85CD
        BNE b0E1C
        JSR e88AE
        LDA #$02
        STA a16
        JSR e93F3
        JSR e8794
        LDA a17
        BNE b0E66
        LDA #<p033C
        STA charToPlot
        LDA #>p033C
        STA colourToPlot
        LDA #$00
        STA a02
        LDA a15
        STA a03
        JSR Screen_Plot
        INC charToPlot
        INC a03
        JSR Screen_Plot
        LDA #<p3A16
        STA a03
        LDA #>p3A16
        STA charToPlot
        LDA a14
        STA a02
        JSR Screen_Plot
        INC a02
        INC charToPlot
        LDA #$01
        STA a17
        JMP Screen_Plot

b0E66   LDA #$20                                                               ; e8616
        STA charToPlot
        LDA #$00
        STA a02
        LDA a15
        STA a03
        JSR Screen_Plot
        INC a03
        JSR Screen_Plot
        LDA #$16
        STA a03
        LDA a14
        STA a02
        JSR Screen_Plot
        INC a02
        JSR Screen_Plot
        INC a14
        LDA a14
        CMP #$27
        BNE b0E96
        LDA #$01
        STA a14
b0E96   INC a15                                                                ; e8646
        LDA a15
        CMP #$16
        BNE b0EA2
        LDA #$03
        STA a15
b0EA2   LDA #$00                                                               ; e8652
        STA a17
        LDA #$03
        STA colourToPlot
        LDA a14
        STA a02
        LDA #$02
        STA charToPlot
        JSR Screen_Plot
        LDA #$00
        STA a02
        LDA a15
        STA a03
        LDA #$01
        STA charToPlot
        JSR Screen_Plot
        LDA a36
a0EC6   AND #$80
        BEQ b0ED4
        LDA a14
        CMP a0A
        BNE b0ED4
        LDA #$01
        STA a18
b0ED4   LDA a18                                                                ; e8684
        BEQ b0EEF
        DEC a18
        BNE b0EEF
        LDA a14
        STA a1B
        LDA a15
        STA a1C
        LDA #$01
        STA a1A
        RTS 

;-------------------------------------------------------  
;e8699
;-------------------------------------------------------  
        LDA a13
        CMP #$02
        BEQ b0EF0
b0EEF   RTS                                                                   ; e869F

b0EF0   JSR e88B8                                                              ; e86A0
        JSR e8CDB
        LDA a18
        BNE b0EEF
        LDA a1A
        CMP a1B
        BEQ b0F2F
        LDA #<p6600
s0F03   =*+$01                                                                 ; e86B3
        STA charToPlot
        LDA #>p6600
s0F06   STA colourToPlot                                                                ; e86B6
p0F09   =*+$01
        LDA a1A
s0F0A   STA a02                                                                ; e86BA
        LDA a1C
a0F0E   STA a03
        JSR Screen_Plot
s0F14   =*+$01                                                                 ; e86C4
        INC a1A
        INC a02
        JMP e86CD

b0F1A   JMP e94D3                                                              ; e86CA

        LDA #$01
        STA colourToPlot
        INC a1D
        LDA a1D
        AND #$01
        CLC 
        ADC #$03
        STA charToPlot
        JSR Screen_Plot
b0F2F   LDA #$15                                                               ; e86DF
        STA a03
        LDA a1B
        STA a02
        LDA a1D
        AND #$01
        CLC 
        ADC #$05
        STA charToPlot
b0F40   JSR Screen_Plot                                                              ; e86F0
        DEC a03
        LDA a03
        CMP #$02
        BNE b0F40
        LDA a1B
        CMP a0A
        BEQ b0F1A
        LDA a1A
        CMP a1B
        BEQ b0F58
        RTS 

b0F58   LDA #$15                                                               ; e8708
        STA a03
        LDA #>p6600
        STA colourToPlot
        LDA #<p6600
        STA charToPlot
        LDA a1B
        STA a02
b0F68   JSR Screen_Plot                                                              ; e8718
        DEC a03
        LDA a03
        CMP #$02
        BNE b0F68
        LDA a1C
        STA a03
        LDA #>p070F
        STA colourToPlot
        LDA #<p070F
        STA charToPlot
        JSR Screen_Plot
        LDA a19
        STA a18
        LDA #<p04A0
        STA a06
        LDA #>p04A0
        STA a07
        LDA a41
        ORA #$08
        STA a41
        LDY #$00
b0F96   LDA (p06),Y                                                            ; e8746
        BEQ b0F9D
        JSR e875A
b0F9D   INC a06                                                                ; e874D
        BNE b0F96
        INC a07
        LDA a07
        CMP #$08
        BNE b0F96
        RTS 

        CMP #$20
        BNE b0FAF
        RTS 

b0FAF   LDX #$07                                                               ; e875F
b0FB1   CMP f83E3,X                                                            ; e8761
        BEQ b0FBA
        DEX 
        BNE b0FB1
        RTS 

b0FBA   LDA f83E4,X                                                            ; e876A
        STA (p06),Y
        LDA a41
        AND #$F7
        STA a41
        CPX #$07
        BEQ b0FCA
        RTS 

b0FCA   LDX #$20                                                               ; e877A
b0FCC   LDA f1320,X                                                            ; e877C
        BEQ b0FD9
        DEX 
        BNE b0FCC
        LDA #$0D
        STA (p06),Y
        RTS 

b0FD9   LDA a06                                                                ; e8789
        STA f1300,X
        LDA a07
        STA f1320,X
        RTS 

        LDX #$20
b0FE6   LDA f1320,X                                                            ; e8796
        BEQ b0FEE
        JSR e87AA
b0FEE   DEX                                                                   ; e879E
        BNE b0FE6
        RTS 

        .BYTE $07,$0B ;SLO a0B
        .BYTE $0C,$0C,$20 ;NOP $200C
        .BYTE $02    ;JAM 
        .BYTE $3A    ;NOP 
        .BYTE $3B

;e87AA
        STX $08
        LDA f1300,X
        STA a06
        LDA f1320,X
        STA a07
        LDY #$00
        TYA 
        STA (p06),Y
p100B   LDA a07
        PHA 
        CLC 
s1010   =*+$01                                                                 ; e87C0
        ADC #$D4
        STA a07
        LDA #$66
        STA (p06),Y
        PLA 
        STA a07
        LDA a06
        CLC 
        ADC #$28
        STA a06
        LDA a07
        ADC #$00
        STA a07
        LDA (p06),Y
        LDX #$04
b102B   CMP f87A1,X                                                            ; e87DB
        BNE b1033
        JMP e86CA

b1033   CMP f87A5,X                                                            ; e87E3
        BEQ b1057
        DEX 
        BNE b102B
        LDA #$0A
        STA (p06),Y
        LDA a07
        PHA 
        CLC 
        ADC #$D4
        STA a07
        LDA #$01
        STA (p06),Y
        LDX a08
        LDA a06
        STA f1300,X
        PLA 
        STA f1320,X
        RTS 

b1057   LDX a08                                                                ; e8807
        LDA #$00
        STA f1320,X
        RTS 

b105F   JSR e8058                                                              ; e880F
        BEQ b1075
        LDX a83EC
b1067   CMP a83EC,X                                                            ; e8817
        BEQ b1072
        DEX 
        BNE b1067
        STX a0C
        RTS 

b1072   JMP e86CA                                                              ; e8822

b1075   LDA a02                                                                ; e8825
        STA a0A
        LDA a03
        STA a0B
        RTS 

        LDA a02
p1080   CMP a0A
        BEQ b105F
        LDA a03
        CMP a0B
        BEQ b105F
        LDA a02
        PHA 
        LDA a0A
        STA a02
        JSR e8058
        BNE b109C
        PLA 
        STA a02
        JMP e880F

b109C   LDA a0B                                                                ; e884C
        STA a03
        PLA 
        STA a02
        JMP e880F

        JSR e8058
        CMP #$08
        BEQ b10E3
        LDX #$07
b10AF   CMP f83E3,X                                                            ; e885F
        BEQ b10BA
        DEX 
        BNE b10AF
        JMP e8B81

f10BC   =*+$02
b10BA   LDA f83E2,X                                                            ; e886A
        STA charToPlot
        LDA #$07
        STA colourToPlot
        CPX #$02
        BNE b10DA
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        LDX #$06
        LDY #$01
        JSR e8894
        LDA #$04
        STA a1E
b10DA   JSR Screen_Plot                                                              ; e888A
        LDA #$00
        STA a10
        PLA 
        PLA 
b10E3   RTS                                                                   ; e8893

b10E4   TXA                                                                   ; e8894
        PHA 
b10E6   INC f0409,X                                                            ; e8896
        LDA f0409,X
        CMP #$3A
        BNE b10F8
p10F0   LDA #$30
        STA f0409,X
        DEX 
        BNE b10E6
b10F8   PLA                                                                   ; e88A8
        TAX 
        DEY 
        BNE b10E4
        RTS 

;-------------------------------------------------------
;e88AE
;-------------------------------------------------------
        LDA a2109
        ROL 
        ADC #$00
        STA a1509
        RTS 

        JSR e88FD
        LDA a1E
        BNE b1110
        RTS 

f1111   =*+$01
b1110   LDA a4003                                                              ; e88C0
        CMP #$16
        BNE b112D
        LDA a1E
        ASL 
        ASL 
        CLC 
        ADC a1E
        STA $D418    ;Select Filter Mode and Volume
        LDA #$10
        STA a4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        JSR e80CB
        RTS 

b112D   INC a4003                                                              ; e88DD
        LDA a4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        CMP #$16
        BEQ b113B
b113A   RTS                                                                   ; e88EA

b113B   DEC a1E                                                                ; e88EB
        BNE b113A
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        STA a4003
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        RTS 

        LDA a3D
        BNE b117A
        LDA a39
        BNE b1156
        RTS 

b1156   LDA a4004                                                              ; e8906
        CMP #$30
        BEQ b1167
        DEC a4004
        LDA a4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        RTS 

b1167   DEC a39                                                                ; e8917
        BEQ b1174
        LDA #$40
        STA a4004
        JSR e80D1
        RTS 

b1174   LDA #$00                                                               ; e8924
        STA $D412    ;Voice 3: Control Register
b1179   RTS                                                                   ; e8929

b117A   DEC a3D                                                                ; e892A
        LDA a3D
        STA $D418    ;Select Filter Mode and Volume
        BNE b1179
        LDA #$00
        STA $D412    ;Voice 3: Control Register
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

;-------------------------------------------------------  
;e893E
;-------------------------------------------------------  
        DEC a22
        LDA a22
        CMP #$01
        BEQ b1197
b1196   RTS                                                                   ; e8946

b1197   LDA #$C0                                                               ; e8947
        STA a22
        JSR e8F3D
        LDA a25
        BNE b11A5
        JMP e89CC

b11A5   LDA a26                                                                ; e8955
        BEQ b1196
        CMP #$01
        BEQ b11B2
        DEC a26
        JMP e89CC

b11B2   LDA a24                                                                ; e8962
        CMP a23
        BNE b11F3
        INC a28
        LDX a28
        LDA #$03
        STA f1980,X
        LDA $D012    ;Raster Position
        AND #$01
        BEQ b11D5
        LDA #$1A
        STA f1900,X
        LDA #$81
        STA f1A00,X
        JMP e898F

b11D5   LDA #$1C                                                               ; e8985
        STA f1900,X
        LDA #$80
        STA f1A00,X
        LDA a3F
        AND #$80
        BEQ b11F3
        LDA a25
        AND #$01
        BEQ b11F3
        LDA f1A00,X
        ORA #$04
        STA f1A00,X
b11F3   INC a28                                                                ; e89A3
        LDX a28
        LDA #$1B
        STA f1900,X
        LDA #$03
        STA f1980,X
        LDA #$00
        STA f1A00,X
        DEC a24
        BEQ b120D
        JMP e89CC

b120D   LDA #$40                                                               ; e89BD
        STA f1A00,X
        LDA a27
        STA a26
        LDA a23
        STA a24
        DEC a25
        INC a29
        LDA a29
        CMP #$15
        BNE b1228
        LDA #$13
        STA a29
b1228   LDX a28                                                                ; e89D8
        LDA a28
        BNE b122F
        RTS 

b122F   LDA f1A00,X                                                            ; e89DF
        AND #$80
        BNE b1239
        JMP e8A92

b1239   JSR e8C73                                                              ; e89E9
        LDA f1A00,X
        AND #$04
        BEQ b1246
        JMP e8AE2

b1246   LDA f1900,X                                                            ; e89F6
        STA a02
        LDA f1980,X
        STA a03
        LDA f1A00,X
        AND #$40
        BEQ b1266
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        STX a07
        JSR Screen_Plot
        LDX a07
b1266   LDA f1A00,X                                                            ; e8A16
        AND #$01
        BEQ b1271
        DEC a02
        DEC a02
b1271   INC a02                                                                ; e8A21
        LDA a02
        BEQ b127E
        CMP #$27
        BEQ b127E
        JMP e8A31

b127E   JMP e8A6E                                                              ; e8A2E

        STX a07
        JSR e8058
        LDX a07
        CMP #$00
        BEQ b129E
        CMP #$07
        BEQ b129B
        CMP #$0B
        BEQ b129B
        CMP #$0C
        BEQ b129B
        JMP e8A6E

b129B   JMP e86CA                                                              ; e8A4B

b129E   LDA a02                                                                ; e8A4E
        STA f1900,X
        LDA a03
        STA f1980,X
        LDA #$03
        STA colourToPlot
        LDA a29
        STA charToPlot
        STX a07
        JSR Screen_Plot
        LDX a07
        DEX 
        BEQ b12BD
        JMP e89DF

b12BD   RTS                                                                   ; e8A6D

        INC a03
        LDA f1900,X
        STA a02
        LDA f1A00,X
        EOR #$01
        STA f1A00,X
        LDA a03
        CMP #$15
        BNE b129E
        DEC a03
        LDA f1A00,X
        EOR #$01
        ORA #$06
        STA f1A00,X
        JMP e8A4E

        LDA f1900,X
        STA a02
        LDA f1980,X
        STA a03
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        LDA f1A00,X
        AND #$40
        BEQ b1302
        STX a07
        JSR Screen_Plot
f1300   LDX a07
b1302   LDA f18FF,X                                                            ; e8AB2
        STA f1900,X
        STA a02
        LDA f197F,X
        STA f1980,X
        STA a03
        STX a07
        JSR e8058
        LDX a07
        CMP #$07
        BNE f1320
s131D   JMP e86CA                                                              ; e8ACD

f1320   LDA #>p0313
        STA colourToPlot
        LDA #<p0313
        STA charToPlot
        STX a07
        JSR Screen_Plot
        LDX a07
        JMP e8A67

        LDA f1900,X
        STA a02
        LDA f1980,X
        STA a03
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        LDA f1A00,X
        AND #$40
        BEQ b1352
        STX a07
        JSR Screen_Plot
        LDX a07
b1352   LDA f1A00,X                                                            ; e8B02
        STA a08
        AND #$01
        BEQ b135F
        DEC a02
        DEC a02
b135F   INC a02                                                                ; e8B0F
        LDA a08
        AND #$02
        BEQ b136B
        DEC a03
        DEC a03
b136B   INC a03                                                                ; e8B1B
        STX a07
        JSR e8058
        LDX a07
        CMP #$07
        BEQ b1387
        CMP #$0B
        BEQ b1387
        CMP #$0C
        BNE b138A
        CMP #$00
        BEQ b138A
        JMP e8B5A

b1387   JMP e86CA                                                              ; e8B37

b138A   LDA #$00                                                               ; e8B3A
        STA a09
        LDA a02
        BEQ b13AA
        CMP #$27
        BEQ b13AA
        LDA a03
        CMP #$02
        BEQ b13BD
        CMP #$16
        BEQ b13BD
        LDA a09
        BNE b13A7
        JMP e8A4E

b13A7   JMP e8B02                                                              ; e8B57

b13AA   LDA a08                                                                ; e8B5A
        EOR #$01
        STA f1A00,X
        LDA f1980,X
        STA a03
        LDA #$01
        STA a09
        JMP e8B46

b13BD   LDA f1A00,X                                                            ; e8B6D
        EOR #$02
        STA f1A00,X
        LDA f1900,X
        STA a02
        LDA #$01
        STA a09
        JMP e8B50

        CMP #$13
        BEQ b13E0
        CMP #$14
        BEQ b13E0
        CMP #$15
        BEQ b13E0
        JMP e8E68

b13E0   PHA                                                                   ; e8B90
        LDA a03
        CMP #$03
        BNE b13F1
        LDA a24
        CMP a23
        BEQ b13F1
        PLA 
        JMP e8E68

b13F1   PLA                                                                   ; e8BA1
        LDX a28
b13F4   LDA f1900,X                                                            ; e8BA4
        CMP a02
        BEQ b13FF
b13FB   DEX                                                                   ; e8BAB
        BNE b13F4
        RTS 

f1400   =*+$01
a1401   =*+$02
b13FF   LDA f1980,X                                                            ; e8BAF
        CMP a03
        BNE b13FB
        LDA a10
        AND #$30
        BEQ b1412
        LDA a41
        ORA #$80
        STA a41
f1413   =*+$01
b1412   LDA #$00                                                               ; e8BC2
        STA a10
        LDA #$04
        STA a39
        LDA #$36
        STA a4004
        JSR e80D1
        LDA f1A00,X
        AND #$C0
        CMP #$C0
        BNE b1432
        LDA #$04
        STA a08
        JMP e8C43

b1432   CMP #$40                                                               ; e8BE2
        BNE b1446
        LDA f1A00,X
        ORA f19FF,X
        STA f19FF,X
        LDA #$01
        STA a08
        JMP e8C43

b1446   CMP #$80                                                               ; e8BF6
        BEQ b147A
        STX a07
b144C   DEX                                                                   ; e8BFC
        LDA f1A00,X
        AND #$80
        BEQ b144C
        LDA f1A00,X
        LDX a07
        ORA f1A01,X
        STA f1A01,X
        AND #$04
        BEQ b146B
        LDA f1A01,X
        EOR #$01
        STA f1A01,X
b146B   LDA #$01                                                               ; e8C1B
        STA a08
        LDA #$40
        ORA f19FF,X
        STA f19FF,X
        JMP e8C43

b147A   LDA f1A00,X                                                            ; e8C2A
        ORA f1A01,X
        STA f1A01,X
        AND #$04
        BEQ b148F
        LDA f1A01,X
        EOR #$01
        STA f1A01,X
b148F   LDA #$04                                                               ; e8C3F
        STA a08
        LDA f1901,X
        STA f1900,X
        LDA f1981,X
        STA f1980,X
        LDA f1A01,X
        STA f1A00,X
        CPX a28
        BEQ b14AD
        INX 
        JMP e8C43

b14AD   DEC a28                                                                ; e8C5D
        LDX #$05
        LDY a08
        JSR e8894
        LDA #>p070E
        STA colourToPlot
        LDA #<p070E
        STA charToPlot
        PLA 
        PLA 
        JMP Screen_Plot

        LDA a2A
        CMP #$02
        BPL b14CA
b14C9   RTS                                                                   ; e8C79

b14CA   DEC a2B                                                                ; e8C7A
        BEQ b14E4
        LDA a2A
        CMP charToPlot
        BMI b14C9
        LDA f1900,X
        CMP a0A
        BNE b14C9
        DEC a2D
        BEQ b14E0
b14DF   RTS                                                                   ; e8C8F

b14E0   LDA a2E                                                                ; e8C90
        STA a2D
b14E4   LDA a2C                                                                ; e8C94
        STA a2B
        LDA a0B
        SEC 
        SBC f1980,X
        BVS b14DF
f14F1   =*+$01
f14F0   CMP #$04
        BMI b14DF
        STX a07
        LDX #$20
b14F8   LDA f1320,X                                                            ; e8CA8
        BEQ b1501
        DEX 
        BNE b14F8
        RTS 

b1501   STX a08                                                                ; e8CB1
        LDX a07
        LDA f1900,X
a1509   =*+$01
        STA a02
        LDA f1980,X
        STA a03
        STX a07
        JSR Screen_GetPointer
p1514   TYA 
        CLC 
        ADC a48
        STA a48
        LDA zpHi3
        ADC #$00
        LDX a08
        STA f1320,X
        LDA a48
        STA f1300,X
        LDX a07
        RTS 

        DEC a2F
        BEQ b1530
        RTS 

b1530   LDA a30                                                                ; e8CE0
        STA a2F
        LDA a23
        BNE b153B
        JSR e9B30
b153B   LDA a32                                                                ; e8CEB
        BNE b1540
        RTS 

b1540   LDA a34                                                                ; e8CF0
        BNE b1547
        JMP e8D20

b1547   DEC a32                                                                ; e8CF7
        BEQ b154E
        JMP e8D20

b154E   LDA a33                                                                ; e8CFE
        STA a32
        INC a31
        LDX a31
        LDA #$03
        STA f1B00,X
        LDA $D012    ;Raster Position
        AND #$0F
        CLC 
        ADC #$04
        STA f1A80,X
        LDA $D012    ;Raster Position
        AND #$40
        STA f1B80,X
        DEC a34
        LDX a31
        CPX #$00
        BNE b1577
        RTS 

b1577   LDA f1B80,X                                                            ; e8D27
        AND #$20
        BEQ b1581
        JMP e8EF0

b1581   LDA f1B80,X                                                            ; e8D31
        AND #$01
        BEQ b158B
        JMP e8DF4

b158B   LDA #<p6600                                                            ; e8D3B
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        LDA f1A80,X
        STA a02
        LDA f1B00,X
        STA a03
        LDA f1B80,X
        AND #$40
        BEQ b15A8
        INC a02
        INC a02
b15A8   DEC a02                                                                ; e8D58
        STX a07
        JSR Screen_Plot
        LDX a07
        LDA f1A80,X
        STA a02
        LDA #>p075E
        STA colourToPlot
        LDA #<p075E
        STA charToPlot
        LDA f1B80,X
        AND #$40
        BEQ b15C9
        LDA #$61
        STA charToPlot
b15C9   STX a07                                                                ; e8D79
        JSR Screen_Plot
        LDX a07
        LDA f1B80,X
        AND #$40
        BEQ b15DB
        DEC a02
        DEC a02
b15DB   INC a02                                                                ; e8D8B
        JSR e8058
        BEQ b1629
        LDX a07
        LDA f1A80,X
        STA a02
        INC a03
        LDA f1B80,X
        EOR #$40
        STA f1B80,X
        LDA f1A80,X
        STA a02
        DEC a03
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        JSR Screen_Plot
        LDX a07
        INC f1B00,X
        INC a03
        LDA a03
        CMP #$16
        BNE b1626
        LDA a28
        BNE b1620
        LDA a25
        BNE b1620
        LDA a41
        ORA #$02
        STA a41
b1620   JSR e8E33                                                              ; e8DD0
        JMP e8DE5

b1626   JMP e8D61                                                              ; e8DD6

b1629   LDA a02                                                                ; e8DD9
        LDX a07
        STA f1A80,X
        LDA a03
        STA f1B00,X
        LDA f1B80,X
        EOR #$01
        STA f1B80,X
        DEX 
        BEQ b1643
        JMP e8D27

b1643   RTS                                                                   ; e8DF3

        LDA #$07
        STA colourToPlot
        LDA f1A80,X
        STA a02
        LDA f1B00,X
        STA a03
        LDA f1B80,X
        AND #$40
        BNE b166E
        LDA #$60
        STA charToPlot
        STX a07
        JSR Screen_Plot
        DEC a02
        DEC charToPlot
        JSR Screen_Plot
        LDX a07
        JMP e8DE5

b166E   LDA #$63                                                               ; e8E1E
        STA charToPlot
        STX a07
        JSR Screen_Plot
        INC a02
        DEC charToPlot
        JSR Screen_Plot
        LDX a07
        JMP e8DE5

        STX a07
        LDA f1A81,X
        STA f1A80,X
        LDA f1B01,X
        STA f1B00,X
        LDA f1B81,X
        STA f1B80,X
        CPX a31
        BEQ b169F
        INX 
        JMP e8E35

b169F   LDX a07                                                                ; e8E4F
        DEC a31
        LDA a23
        BEQ b16B1
        LDA a34
        BNE b16B1
        LDA a41
        ORA #$40
        STA a41
b16B1   RTS                                                                   ; e8E61

        LSR f605F,X
        ADC (p62,X)
        .BYTE $63,$A2 ;RRA (pA2,X)
b16BA   =*+$01                                                                 ; e8E6A
        ASL aDD
        ADC (p8E,X)
        BEQ b16C5
        DEX 
        BNE b16BA
        JMP e913B

b16C5   CMP #$62                                                               ; e8E75
        BNE b16CB
        DEC a02
b16CB   CMP #$5F                                                               ; e8E7B
        BNE b16D1
        INC a02
b16D1   CMP #$5E                                                               ; e8E81
        BNE b16D7
        INC a02
b16D7   CMP #$61                                                               ; e8E87
        BNE b16DD
        DEC a02
b16DD   LDX a31                                                                ; e8E8D
        LDA a02
b16E1   CMP f1A80,X                                                            ; e8E91
        BEQ b16EA
b16E6   DEX                                                                   ; e8E96
        BNE b16E1
        RTS 

b16EA   LDA a03                                                                ; e8E9A
        CMP f1B00,X
        BNE b16E6
        LDA #$00
        STA a10
        STX a07
        LDX #$05
        LDY #$01
        JSR e8894
        LDX #$07
        LDY #$06
        JSR e8894
        LDX a07
        LDA #$04
        STA a39
        LDA #$36
        STA a4004
        JSR e80D1
        LDA f1B80,X
        AND #$40
        BNE b1727
        LDA f1A80,X
        CMP #$01
        BEQ b1738
        DEC f1A80,X
        JMP e8EE8

b1727   LDA a02                                                                ; e8ED7
        STA f1A80,X
        JMP e8EE8

        .BYTE $80,$1B ;NOP #$1B
        AND #$01
        BEQ b1738
        INC f1A80,X
b1738   LDA #$2F                                                               ; e8EE8
        STA f1B80,X
        PLA 
        PLA 
        RTS 

        LDA f1A80,X
        STA a02
        LDA f1B00,X
        STA a03
        LDA f1B80,X
        AND #$0F
        BEQ b1777
        AND #$07
        STA colourToPlot
        LDA f1B80,X
        SEC 
        SBC #$01
        STA f1B80,X
        LDA #$64
        STA charToPlot
        STX a07
        JSR Screen_Plot
        INC charToPlot
        INC a02
        JSR Screen_Plot
        LDX a07
        DEX 
        BEQ b1776
        JMP e8D27

b1776   RTS                                                                   ; e8F26

b1777   JSR e8E33                                                              ; e8F27
        LDA #>p6600
        STA colourToPlot
        LDA #<p6600
        STA charToPlot
        JSR Screen_Plot
        INC a02
        JSR Screen_Plot
        JMP e8F1E

;e8F3D
        LDA a37
        BEQ b1795
        DEC a37
        BEQ b1796
b1795   RTS                                                                   ; e8F45

b1796   LDA a38                                                                ; e8F46
        STA a37
        LDA a36
        EOR #$01
        STA a36
        AND #$80
        BEQ b17A7
        JMP e8FEA

b17A7   LDA #$02                                                               ; e8F57
        STA a03
        LDA #$01
        STA colourToPlot
        LDA a35
        STA a02
        LDA a36
        AND #$40
        BNE b17DF
        LDA #$20
        STA charToPlot
        DEC a02
        JSR Screen_Plot
        INC a02
        LDA #$66
        STA charToPlot
        LDA a36
        AND #$01
        BEQ b17D2
        LDA #$68
        STA charToPlot
b17D2   JSR Screen_Plot                                                              ; e8F82
        INC a02
        INC charToPlot
        JSR Screen_Plot
        JMP e8FB4

b17DF   LDA #$20                                                               ; e8F8F
        STA charToPlot
        INC a02
        JSR Screen_Plot
        DEC a02
        LDA #$6B
        STA charToPlot
        LDA a36
        AND #$01
        BEQ b17F8
        LDA #$6D
        STA charToPlot
b17F8   DEC a02                                                                ; e8FA8
        JSR Screen_Plot
        INC a02
f1800   =*+$01
        DEC charToPlot
        JSR Screen_Plot
        LDA a36
        AND #$01
        BEQ b1817
        LDA a36
        AND #$40
        BNE b1814
        INC a35
        INC a35
b1814   DEC a35                                                                ; e8FC4
        RTS 

f1818   =*+$01
b1817   LDA a35                                                                ; e8FC7
        CMP a0A
        BNE b1822
        LDA #$80
        STA a36
b1821   RTS                                                                   ; e8FD1

b1822   BMI b182F                                                              ; e8FD2
        LDA a36
        AND #$40
        BNE b1821
        LDA #$41
        STA a36
b182E   RTS                                                                   ; e8FDE

b182F   LDA a36                                                                ; e8FDF
        AND #$40
        BEQ b182E
        LDA #$01
        STA a36
        RTS 

;e8FEA
        LDA a36
        AND #$01
        CLC 
        ADC #$6E
        STA charToPlot
        LDA #$01
        STA colourToPlot
        LDA #$02
        STA a03
        LDA a35
        STA a02
        JSR Screen_Plot
        LDA a35
        CMP a0A
        BNE b1859
        RTS 

b1859   LDA #$00                                                               ; e9009
        STA a36
        JMP e8FC7

;e9010
        LDA a10
        AND #$02
        BNE b187F
        LDA #>p0171
        STA colourToPlot
        LDA #<p0171
        STA charToPlot
        LDA a11
        STA a02
        LDA a12
        STA a03

;e9026
        LDA a10
        EOR #$02
        STA a10
        JMP Screen_Plot

b187F   LDA #<p6600                                                            ; e902F
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        LDA a11
        STA a02
        LDA a12
        STA a03
        JSR Screen_Plot
        INC a02
        LDA a02
        CMP #$27
        BNE b189F
f189A   LDA #$00
        STA a10
        RTS 

b189F   INC a11                                                                ; e904F
        LDA #>p0170
        STA colourToPlot
        LDA #<p0170
        STA charToPlot
        JSR e8856
        JMP e9026

        LDA a10
        AND #$02
        BNE b18C8
        LDA #>p0170
        STA colourToPlot
        LDA #<p0170
        STA charToPlot
        LDA a11
        STA a02
        LDA a12
        STA a03
        JMP e9026

b18C8   LDA a11                                                                ; e9078
        STA a02
        LDA a12
        STA a03
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        JSR Screen_Plot
        DEC a02
        DEC a11
        BNE b18E6
        LDA #$00
        STA a10
        RTS 

b18E6   LDA #>p0171                                                            ; e9096
        STA colourToPlot
        LDA #<p0171
        STA charToPlot
        JSR e8856
        JMP e9026

        LDA a11
        STA a02
        LDA a12
        STA a03
f18FC   LDA a10
f18FF   =*+$01
        AND #$02
f1901   =*+$01
f1900   BNE b190D
        LDA #>p0108
        STA colourToPlot
        LDA #<p0108
        STA charToPlot
        JMP e9026

b190D   LDA #<p6600                                                            ; e90BD
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        JSR Screen_Plot
        INC a03
        LDA a03
        CMP #$16
        BNE b1925
        LDA #$00
        STA a10
        RTS 

b1925   INC a12                                                                ; e90D5
        LDA #>p0109
        STA colourToPlot
        LDA #<p0109
        STA charToPlot
        JSR e8856
        JMP e9026

;-------------------------------------------------------  
;e90E5
;-------------------------------------------------------  
        DEC a3A
        BEQ b193A
        RTS 

b193A   LDA #$80                                                               ; e90EA
        STA a3A
        INC a3C
        LDX a3B
        CPX #$00
        BNE b1947
        RTS 

b1947   LDA #$00                                                               ; e90F7
        STA a07
        LDA f1D00,X
        AND #$30
        TAY 
        LDA #$72
        CPY #$10
        BNE b1959
        LDA #$75
b1959   CPY #$20                                                               ; e9109
        BNE b195F
        LDA #$78
b195F   CLC                                                                   ; e910F
        ADC a07
        STA charToPlot
        LDA a3C
        AND #$07
        STA colourToPlot
        LDA f1C00,X
        STA a02
        LDA f1C80,X
        STA a03
        STX a07
        JSR Screen_Plot
        LDX a07
        DEX 
        BNE b1947
        RTS 

f197F   .BYTE $72
f1980   .BYTE $73
f1981   .BYTE $74,$75,$76,$77,$78,$79,$7A
        .BYTE $07, $0B,$0C

        LDX #$03
b198D   CMP f912E,X                                                            ; e913D
        BEQ b19BB
        CMP f9131,X
        BEQ b19D7
        CMP f9134,X
        BEQ b19A8
        CMP f9137,X
        BNE b19A4
        JMP e86CA

b19A4   DEX                                                                   ; e9154
        BNE b198D
b19A7   RTS                                                                   ; e9157

b19A8   LDA a10                                                                ; e9158
        AND #$10
        BNE b19A7
        LDA a10
        EOR #$20
        STA a10
        CPX #$01
        BNE b19A7
        JMP e9197

b19BB   LDA a10                                                                ; e916B
        AND #$30
        STA a07
        LDA #$50
        SEC 
        SBC a07
        AND #$30
        STA a07
        LDA a10
        AND #$8F
        ORA a07
        STA a10
        CPX #$01
        BEQ b19E7
        RTS 

b19D7   LDA a10                                                                ; e9187
        AND #$30
        STA a07
        LDA #$30
        SEC 
        SBC a07
        STA a07
        JMP e917A

b19E7   LDX a3B                                                                ; e9197
b19E9   LDA a02                                                                ; e9199
        CMP f1C00,X
        BEQ b19F4
b19F0   DEX                                                                   ; e91A0
        BNE b19E9
        RTS 

b19F4   LDA a03                                                                ; e91A4
        CMP f1C80,X
        BNE b19F0
        LDA f1D00,X
f19FF   =*+$01
f1A00   =*+$02
        JSR e91C5
f1A01   STA f1D00,X
        LDA #$0F
        STA a3D
        LDA #$90
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JSR e80D1
        LDA #$00
        STA a39
        RTS 

        AND #$30
        CMP #$20
        BEQ b1A2A
        CMP #$10
        BEQ b1A25
        LDA #$1F
        STA f1D00,X
        RTS 

b1A25   LDA #$0F                                                               ; e91D5
        STA f1D00,X
b1A2A   LDA f1D00,X                                                            ; e91DA
        RTS 

        LDX a3E
        STX a3B
b1A32   LDA f91F7,X                                                            ; e91E2
        STA f1C00,X
        LDA f9213,X
        STA f1C80,X
        LDA f922F,X
        STA f1D00,X
        DEX 
        BNE b1A32
        RTS 

;f91FB
        .BYTE $13
        .BYTE $14,$13,$14,$01,$04,$07,$0A,$26
        .BYTE $23,$20,$1D,$13,$14,$07,$20,$05
        .BYTE $05,$22,$22,$02,$04,$06,$08,$26
        .BYTE $24,$22,$20,$0D,$0D,$0E,$0E,$0A
        .BYTE $0A,$0A,$0A,$0A,$0A,$0A,$0A,$06
        .BYTE $06,$06,$06,$0E,$15,$0E,$15,$08
        .BYTE $08,$08,$08,$08,$08,$08,$08

f1A80
        .BYTE $1F
f1A81
        .BYTE $0F,$0F,$1F,$1F,$0F,$1F,$0F,$0F
        .BYTE $1F,$0F,$1F,$2F,$2F,$2F,$2F,$0F
        .BYTE $1F,$1F,$0F,$2F,$2F,$2F,$2F,$2F
        .BYTE $2F,$2F,$2F,$01,$02,$03,$00,$02
        .BYTE $02,$02,$02,$00,$03,$03,$03,$02
        .BYTE $03,$03,$00,$03,$03,$03,$03,$06
        .BYTE $06,$06,$00,$07,$07,$07,$07,$00
        .BYTE $08,$08,$08,$09,$0A,$0B,$00,$0B
        .BYTE $0B,$0C,$0D,$00,$00,$00,$14,$00
        .BYTE $08,$09,$00,$19,$0A,$00,$0B,$0C
        .BYTE $00,$0F,$1E,$00,$14,$14,$14,$00
        .BYTE $00,$00,$06,$00,$06,$06,$00,$04
        .BYTE $06,$00,$04,$04,$00,$04,$03,$00
        .BYTE $04,$03,$03,$00,$00,$00,$04,$00
        .BYTE $07,$07,$00,$03,$06,$00,$05,$05
        .BYTE $00,$04,$03,$00,$03,$03,$03

f1B00
        .BYTE $10
f1B01
        .BYTE $0F,$0E,$0D,$0D,$0D,$0C,$0C,$0B
        .BYTE $0B,$0A,$09,$09,$08,$09,$08,$07
        .BYTE $07,$06,$06,$00,$00,$04,$04,$03
        .BYTE $03,$03,$03,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$00
        .BYTE $00,$00,$00,$04,$00,$00,$0C,$00
        .BYTE $00,$10,$00,$00,$14,$00,$00,$00
        .BYTE $1C,$00,$1C,$00,$00,$00,$01,$01
        .BYTE $00,$82,$01,$01,$00,$01,$82,$00
        .BYTE $01,$82,$82,$00,$01,$82,$82

        LDX a2A
        LDA f924B,X
        STA a25
        LDA f925F,X
        STA a23
        STA a24
        LDA f9273,X
        STA a34
        LDA f9287,X
        STA a33
        STA a32
        LDA f929B,X
        STA a30
        STA a2F
        LDA f92AF,X
        STA a18
        STA a19
        LDA f92C3,X
        STA a37
        STA a38
f1B80   =*+$01
f1B81   =*+$02
        LDA f92D7,X
        STA a3E
        LDA f92EB,X
        STA a3F
        JMP e91DE

        LDA #$02
        STA a03
        JSR e9469
        LDA #$20
        STA charToPlot
b1B97   LDA #$00                                                               ; e9347
        STA a02
b1B9B   JSR Screen_Plot                                                              ; e934B
        INC a02
        LDA a02
        CMP #$28
        BNE b1B9B
        INC a03
        LDA a03
        CMP #$17
        BNE b1B97
        LDA #>p03
        STA charToPlot
        LDA #<p03
        STA a03
        LDA #$66
        STA colourToPlot
b1BBA   LDA #$01                                                               ; e936A
        STA a02
b1BBE   JSR Screen_Plot                                                              ; e936E
        INC a02
        LDA a02
        CMP #$27
        BNE b1BBE
        INC a03
        LDA a03
        CMP #$16
        BNE b1BBA
        RTS 

        JSR e933C
        LDA #<p200B
        STA a03
        LDA #>p200B
        STA charToPlot
b1BDD   LDA #$0D                                                               ; e938D
        STA a02
b1BE1   JSR Screen_Plot                                                              ; e9391
        INC a02
        LDA a02
        CMP #$1C
        BNE b1BE1
        INC a03
        LDA a03
        CMP #$0E
        BNE b1BDD
        LDA #<p0C0E
        STA a02
        LDA #>p0C0E
        STA a03
        JSR Screen_GetPointer
f1C00   =*+$01
        LDX #$00
        LDA #$01
        STA colourToPlot
b1C05   LDA EnterZoneText,X                                                            ; e93B5
        STA charToPlot
        STX a0A
        JSR Screen_Plot
        LDX a0A
        INC a02
        INX 
        CPX #$0D
        BNE b1C05
        DEC a02
        DEC a02
        JSR Screen_GetPointer
        INY 
        LDX a2A
b1C22   LDA (zpLo3),Y                                                            ; e93D2
        CLC 
        ADC #$01
        STA (zpLo3),Y
        CMP #$3A
        BNE b1C3A
        LDA #$30
        STA (zpLo3),Y
        DEY 
        LDA (zpLo3),Y
        CLC 
        ADC #$01
        STA (zpLo3),Y
        INY 
b1C3A   DEX                                                                   ; e93EA
        BNE b1C22
        JMP e941F

        JSR WasteCycles
        LDA s2007
        STA a50
        LDX #$07
b1C4A   LDA f1FFF,X                                                            ; e93FA
        STA f2000,X
        DEX 
        BNE b1C4A
        LDA a50
        STA f2000
        LDA a3F
        AND #$80
        BEQ b1C61
        JMP e9496

b1C61   RTS                                                                   ; e9411

;EnterZoneText
        ;ENTER ZONE 00
        .BYTE $45,$4E,$54,$45
        .BYTE $52,$20,$5A,$4F,$4E,$45,$20
        .BYTE $30,$30

;e941F
        LDA #$0F
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        JSR e80DD
        LDA #$E8
        STA a4001
f1C80   =*+$01
        JSR e80CB
b1C82   LDA a4001                                                              ; e9432
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        STA a4002
b1C8B   JSR e93F0                                                              ; e943B
        INC a4002
        LDA a4002
        SBC #$E0
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA a4002
        BNE b1C8B
b1C9F   =*+$01                                                                 ; e944F
        INC a4001
        BNE b1C82
        JSR e80DD
        JMP e933C

;f9459
        .BYTE $30,$30,$30,$30,$FF,$30,$30,$30,$00
        .BYTE $00,$3C,$3C,$3C,$3C,$00,$00

;e9469
        LDA a3F
        BNE b1CC9
        LDX #$08
b1CBF   LDA f9458,X                                                            ; e946F
        STA f1FFF,X
        DEX 
        BNE b1CBF
        RTS 

b1CC9   LDA a3F                                                                ; e9479
        CMP #$01
        BNE b1CDA
        LDX #$08
        LDA #$00
b1CD3   STA f1FFF,X                                                            ; e9483
        DEX 
        BNE b1CD3
        RTS 

b1CDB   =*+$01                                                                 ; e948B
b1CDA   LDX #$08                                                               ; e948A
b1CDD   =*+$01                                                                 ; e948D
b1CDC   LDA f9460,X                                                            ; e948C
        STA f1FFF,X
        DEX 
        BNE b1CDC
        RTS 

        LDX #$08
b1CE8   CLC                                                                   ; e9498
        LDA f1FFF,X
        ROL 
        ADC #$00
        STA f1FFF,X
        DEX 
        BNE b1CE8
b1CF5   RTS                                                                   ; e94A5

        LDA a25
        BNE b1CF5
        LDA a28
        BNE b1CF5
        LDA a34
f1D00   BNE b1CF5
        LDA a31
        BNE b1CF5
        INC a2A
        LDA a2A
        CMP #$15
        BNE b1D10
        DEC a2A
b1D10   LDX #$F8                                                               ; e94C0
        TXS 
        INC charToPlot15
        LDA charToPlot15
        CMP #$3A
        BNE b1D20
        DEC charToPlot15
b1D20   JMP e9852                                                              ; e94D0

        LDA a0B
        STA a03
        LDA #$01
        STA a02
        LDA #<p6600
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
b1D33   JSR Screen_Plot                                                              ; e94E3
        INC a02
        LDA a02
        CMP #$27
        BNE b1D33
        JSR e80DD
        LDA #$08
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        JSR e80D1
        LDA #$10
        STA a07
b1D50   LDA #$60                                                               ; e9500
        JSR e9BAA
b1D55   LDY #$E0                                                               ; e9505
b1D57   DEY                                                                   ; e9507
        BNE b1D57
        LDA a4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC a4004
        LDA a4004
        CMP #$80
        BNE b1D55
        JSR WasteCycles
        LDA #$00
        LDX $D021    ;Background Color 0
        CPX #$F0
        BNE b1D78
        LDA #$06
b1D78   STA $D021    ;Background Color 0                                       ; e9528
        LDA a0A
        STA a02
        LDA a0B
        STA a03
        LDA a07
        AND #$03
        TAX 
        LDA ExplosionAnimation,X
        STA charToPlot
        LDA a07
        AND #$07
        STA colourToPlot
        JSR Screen_Plot
        DEC a07
        BNE b1D50
        LDA #$0F
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        JSR e80DD
        LDA #$04
        STA a4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX #$08
        JSR e80D7
        LDA #$00
b1DB4   STA f1FFF,X                                                            ; e9564
        DEX 
        BNE b1DB4
b1DBA   LDA #$0F                                                               ; e956A
        SEC 
        SBC a4000
        STA a08
        LDA #$07
        STA a09
        LDX a08
        INX 
b1DC9   JSR WasteCycles                                                              ; e9579
        DEX 
        BNE b1DC9
b1DCF   JSR e95AA                                                              ; e957F
        LDA a08
        BEQ b1DEF
        DEC a08
        BEQ b1DDE
        LDA a09
        BNE b1DCF
b1DDE   LDA #<p6600                                                            ; e958E
        STA charToPlot
        LDA #>p6600
        STA colourToPlot
        JSR e95B7
        LDA a4000
        STA $D418    ;Select Filter Mode and Volume
b1DEF   DEC a4000                                                              ; e959F
        BNE b1DBA
        JSR e80DD
        JMP e962F

        LDX a09
        DEC a09
        LDA f9627,X
a1E02   =*+$01
        STA colourToPlot
        LDA #$40
        STA charToPlot
        LDA a0A
        SEC 
        SBC a08
        STA a02
        LDA a0B
        STA a03
        JSR e95FF
        LDA a03
        CLC 
f1E18   ADC a08
        STA a03
        JSR e95FF
        LDA a0B
        SEC 
        SBC a08
        STA a03
        JSR e95FF
        LDA a0A
        STA a02
        JSR e95FF
        LDA a02
        CLC 
        ADC a08
        STA a02
        JSR e95FF
        LDA a0B
        STA a03
        JSR e95FF
        LDA a03
        CLC 
        ADC a08
        STA a03
        JSR e95FF
        LDA a0A
        STA a02
        LDA a02
        AND #$80
        BEQ b1E56
b1E55   RTS                                                                   ; e9605

b1E56   LDA a02                                                                ; e9606
        BEQ b1E55
        CMP #$27
        BPL b1E55
        LDA a03
        AND #$80
        BNE b1E55
        LDA a03
        CMP #$16
        BPL b1E55
        LDA a03
        AND #$FC
        BEQ b1E55
        JMP Screen_Plot

;ExplosionAnimation
        .BYTE $73,$74,$76,$40
;f9627
        .BYTE $00,$06,$02,$04,$05
        .BYTE $03,$07,$01,$CE,$15,$04

        LDA charToPlot15
        CMP #$30
        BEQ b1E8C
        JMP e966C

b1E8C   JMP e9A56                                                              ; e963C

        LDA #$20
        LDX #$00
b1E93   STA f0478,X                                                            ; e9643
        STA f0500,X
        STA f0600,X
        STA f0700,X
        DEX 
        BNE b1E93
        LDA #$00
        LDX #$00
b1EA6   STA f2400,X                                                            ; e9656
        DEX 
        BNE b1EA6
        STA a4002
        STA a4003
        STA a4004
        STA a4001
        JSR e80DD
        RTS 

        JSR e963F
        LDA #>p0A10
        STA a03
        LDA #<p0A10
        STA a02
        LDA #$03
        STA colourToPlot
        LDX #$00
b1ECD   LDA GotYouText,X                                                            ; e967D
        STX a07
        STA charToPlot
        JSR Screen_Plot
        LDX a07
        INC a02
        INX 
        CPX #$08
        BNE b1ECD
        JSR e80DD
        LDA #$0F
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        JSR e80D1
        LDX #$0A
b1EF0   LDA #$20                                                               ; e96A0
        STA a4004
b1EF5   LDY #$00                                                               ; e96A5
b1EF7   DEY                                                                   ; e96A7
        BNE b1EF7
        LDA a4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC a4004
        LDA a4004
        CMP #$40
        BNE b1EF5
        DEX 
        BNE b1EF0
        LDX #$07
b1F0F   LDA #$80                                                               ; e96BF
        STA a4004
b1F14   LDY #$00                                                               ; e96C4
b1F16   DEY                                                                   ; e96C6
        BNE b1F16
        LDA a4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JSR e80D1
        DEC a4004
        BNE b1F14
        LDA a4000
        SEC 
        SBC #$02
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b1F0F
        JMP e8298

;GotYouText
        ; GOT YOU!
        .BYTE $47,$4F,$54,$20,$59,$4F,$55,$7A

        JSR e963F
        LDA #$0F
        STA a4000
        JSR e80DD
        LDA #$00
        STA a07
b1F50   LDA #>p040E                                                            ; e9700
        STA a03
b1F54   LDA #<p040E                                                            ; e9704
        STA a02
        LDA a07
        AND #$07
        TAX 
        LDA f9627,X
        STA colourToPlot
        LDX #$00
b1F64   LDA ZoneClearedText,X                                                            ; e9714
        STA charToPlot
        STX a08
        JSR Screen_Plot
        INC a02
        LDX a08
        INX 
        CPX #$0C
        BNE b1F64
        INC a07
        INC a03
        LDA a03
        CMP #$0B
        BNE b1F54
        LDA #$08
        STA a4003
        JSR e80CB
b1F89   DEY                                                                   ; e9739
        BNE b1F89
        LDA a4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        INC a4003
        LDA a4003
        CMP #$48
        BNE b1F89
        LDA a07
        AND #$C0
        CMP #$C0
        BNE b1F50
        LDX #$07
b1FA6   LDA #$60                                                               ; e9756
        STA a4003
b1FAB   DEY                                                                   ; e975B
        BNE b1FAB
        LDA a4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        DEC a4003
        LDA a4003
        CMP #$30
        BNE b1FAB
        LDA a4000
        SEC 
        SBC #$02
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b1FA6
        LDA a40
        BNE b1FE0
        JMP e8298

;ZoneClearedText
        ; ZONE CLEARED
        .BYTE $5A,$4F,$4E,$45,$20,$43,$4C,$45,$41
        .BYTE $52,$45,$44

b1FE0   LDA #$0F                                                               ; e9790
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        JSR e80DD
        LDX #$08
        LDA #$FF
b1FEF   STA f1FFF,X                                                            ; e979F
        DEX 
        BNE b1FEF
        LDA #$04
        STA colourToPlot
        LDA #>p0F09
        STA a03
b1FFD   LDA #<p0F09                                                            ; e97AD
f2000   =*+$01
f1FFF   STA a02
        LDA #$00
        STA charToPlot
s2007   =*+$02                                                                 ; e97B7
b2005   JSR Screen_Plot                                                              ; e97B5
        INC a02
p200B   =*+$01
        LDA a02
        CMP #$1F
        BNE b2005
        INC a03
        LDA a03
        CMP #$12
        BNE b1FFD
        LDA #>p100B
f201A   STA a03
        LDA #<p100B
        STA a02
s2020   LDX #$00                                                               ; e97D0
        LDA #$07
        STA colourToPlot
b2026   LDA f9840,X                                                            ; e97D6
        STA charToPlot
        STX a08
a202E   =*+$01
        JSR Screen_Plot
        LDX a08
        INC a02
        INX 
        CPX #$12
        BNE b2026
        DEC a02
        DEC a02
        DEC a02
s203F   LDA #$30                                                               ; e97EF
        CLC 
        ADC a40
a2045   =*+$01
        STA charToPlot
        LDA #$03
        STA colourToPlot
        JSR Screen_Plot
        LDX #$04
        LDY a40
        JSR e8894
        LDA #$D0
        STA a07
        JSR e80CB
b205B   LDA a07                                                                ; e980B
        STA a4003
b2060   DEY                                                                   ; e9810
        BNE b2060
        LDA a4003
        SBC #$80
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        INC a4003
        BNE b2060
        JSR WasteCycles
        LDA a07
        AND #$07
        TAX 
        LDA #$FF
        STA f2000,X
        INC a07
        LDA a07
        AND #$07
        TAX 
        LDA #$00
        STA f2000,X
        LDA a07
        BNE b205B
        JMP e8298

;f9840
        ; MYSTERY
        .BYTE $20,$4D,$59,$53,$54,$45,$52,$59
        ; BONUS
        .BYTE $20,$42,$4F,$4E,$55,$53,$20,$20,$20,$20

;e9852
        LDX #$04
b20A4   LDA f1D00,X                                                            ; e9854
        CMP f987B,X
        BNE b20B9
        DEX 
        BNE b20A4
        LDA a3B
        BEQ b20B9
        LDA a41
        ORA #$20
        STA a41
b20B9   LDA #$08                                                               ; e9869
        STA a40
b20BD   LDA a41                                                                ; e986D
        CLC 
        ROL 
        STA a41
        BCS b20C9
        DEC a40
        BNE b20BD
b20C9   JMP e96F1                                                              ; e9879

        .BYTE $0F,$1F,$1F,$0F

;-------------------------------------------------------
; DrawTitleScreen
;-------------------------------------------------------
        JSR $963F
        LDA #$03
        STA $05 
        LDA #$09
        STA $02 
        LDX #$00

b20DD   LDA #$05                                                               ; e988D
        STA a03
        LDA TitleTextLine1,X
        STA charToPlot
        STX a07
        JSR Screen_Plot
        INC a03
        INC a03
        LDA #$07
        STA colourToPlot
        LDX a07
        LDA TitleTextLine2,X
        STA charToPlot
        JSR Screen_Plot
        LDA #$01
f2100   =*+$01
        STA colourToPlot
        INC a03
        INC a03
        LDX a07
a2109   =*+$02
        LDA TitleTextLine3,X
        STA charToPlot
        JSR Screen_Plot
        INC colourToPlot
        LDX a07
        INC a03
        INC a03
        INC colourToPlot
        LDA TitleTextLine4,X
        STA charToPlot
        JSR Screen_Plot
s2121   INC colourToPlot                                                                ; e98D1
        LDX a07
        INC a03
        INC a03
        LDA TitleTextLine5,X
        STA charToPlot
        JSR Screen_Plot
        LDX a07
        LDA #$01
        STA colourToPlot
        INC a03
        INC a03
        LDA f9971,X
        STA charToPlot
        JSR Screen_Plot
        LDX a07
        LDA #$03
        STA colourToPlot
        INC a02
        INX 
        CPX #$16
        BNE b20DD
        JMP e9AF7
        ;RTS

;TitleTextLine1
        ; DESIGN AND PROGRAMMING
        .BYTE $44,$45,$53,$49,$47,$4E
        .BYTE $20,$41,$4E,$44,$20,$50,$52,$4F
        .BYTE $47,$52,$41,$4D,$4D,$49,$4E,$47
;TitleTextLine2
        ; BY JEFF MINTER
        .BYTE $20,$20,$20,$42,$59,$20,$20,$4A
        .BYTE $45,$46,$46,$20,$20,$4D,$49,$4E
        .BYTE $54,$45,$52,$20,$20,$20,$20
;TitleTextLine3
        ;(C) 1983 BY LLAMASOFT
        .BYTE $3F
        .BYTE $20,$20,$31,$39,$38,$33,$20,$42
        .BYTE $59,$20,$4C,$4C,$41,$4D,$41,$53
        .BYTE $4F,$46,$54,$20,$20
;TitleTextLine4
        ;PRESS FIRE TO START
        .BYTE $50,$52,$45
        .BYTE $53,$53,$20,$46,$49,$52,$45,$20
        .BYTE $46,$4F,$52,$20,$53,$54,$41,$52
        .BYTE $54,$20
;TitleTextLine5
        ; SELECT START LEVEL 1
        .BYTE $53,$45,$4C,$45,$43,$54
        .BYTE $20,$53,$54,$41,$52,$54,$20,$4C
        .BYTE $45,$56,$45,$4C,$20,$20,$20,$31
;f9971
        .BYTE $96,$95,$94,$93,$92,$91,$90,$8F
        .BYTE $8E,$8D,$8C,$8B,$8A,$89,$88,$87
        .BYTE $86,$85,$84,$83,$82,$81

;-------------------------------------------------------
;e9987
;-------------------------------------------------------
        LDX #$00
        JSR WasteCycles

        LDA f9B5A,X
        AND #$3F
        CMP #$20
        BNE b21E8
        JMP e99F7

b21E8   CMP #$2E                                                               ; e9998
        BNE b21EF
        JMP e9A06

b21EF   CMP #$00                                                               ; e999F
        BNE b21F6
        JMP e9987

b21F6   CLC                                                                   ; e99A6
        ASL 
        ASL 
        ASL 
        TAY 
        STX a09
        LDX #$00
f2200   =*+$01
b21FF   LDA f2200,Y                                                            ; e99AF
        STA f2400,X
        INY 
        INX 
        CPX #$08
        BNE b21FF
        LDX a09
        LDA #$08
        STA a08
b2211   LDY #$00                                                               ; e99C1
b2213   LDA #$18                                                               ; e99C3
        STA a07
        TYA 
        TAX 
        CLC 
        ROL f2400,X
        PHP 
        TXA 
        CLC 
        ADC #$08
        TAX 
        DEC a07
        BEQ b222B
        PLP 
        JMP e99CA

b222B   PLP                                                                   ; e99DB
        INY 
        CPY #$08
        BNE b2213
        LDX #$0A
b2233   DEY                                                                   ; e99E3
        BNE b2233
        DEX 
        BNE b2233
        JSR WasteCycles
        DEC a08
        BNE b2211
        LDX a09
        INX 
        JMP e9A26

        BRK #$86
        ORA #$A9
        BRK #$A2
        PHP 
b224D   STA f23FF,X                                                            ; e99FD
        DEX 
        BNE b224D
        JMP e99BB

        STX a09
        LDX #$08
b225A   LDA f23B7,X                                                            ; e9A0A
        STA f23FF,X
        DEX 
        BNE b225A
        JMP e99BB

        STX a09
        LDX #$08
b226A   LDA f23C7,X                                                            ; e9A1A
        STA f23FF,X
        DEX 
        BNE b226A
        JMP e99BB

        STX a09
        JSR e83DC
        LDA aC5
        CMP #$04
        BNE b2290
        INC a0626
        LDA a0626
        CMP #$37
        BNE b2290
        LDA #$31
        STA a0626
b2290   LDA InputJoy                                                                ; e9A40
        AND #$10
        BNE b229B
        LDX a09
        JMP e9989

b229B   LDA a0626                                                              ; e9A4B
        SEC 
        SBC #$30
        STA a2A
        JMP e963F

        JSR e963F
        LDA #$07
        STA colourToPlot
        LDX #$00
        LDA #>p0A10
        STA a03
        LDA #<p0A10
        STA a02

b22B7   LDA GameOverText,X
        STA charToPlot
        STX a07
        JSR Screen_Plot
        LDX a07
        INC a02
        INX 
        CPX #$09
        BNE b22B7
        LDA #$0F
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        LDX #$0F
b22D4   LDA #$80                                                               ; e9A84
f22D8   =*+$02
        STA a4002
        STA a4003
        STA a4004
        JSR e80CB
        JSR e80D1
b22E5   LDY #$00                                                               ; e9A95
b22E7   DEY                                                                   ; e9A97
        BNE b22E7
        LDA a4003
        SBC #$70
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        ADC #$80
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC a4002
        INC a4003
        INC a4004
f2300   BNE b22E5
        LDA a4000
        SEC 
        SBC #$01
        STA a4000
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b22D4
        LDX #$01
b2313   LDA f0409,X                                                            ; e9AC3
        CMP f14F0,X
        BEQ b231F
        BMI b2324
        BPL b2330
b231F   INX                                                                   ; e9ACF
        CPX #$08
        BNE b2313
b2324   JSR DrawTitleScreen                                                              ; e9AD4
        JSR DrawScreenHeader
        LDX #$F8
        TXS 
        JMP e81BC

b2330   LDX #$07                                                               ; e9AE0
b2332   LDA f0409,X                                                            ; e9AE2
        STA f14F0,X
        DEX 
        BNE b2332
        JMP e9AD4

;GameOverText
        .BYTE $47,$41,$4D,$45,$20,$4F,$56,$45,$52 ;GAME OVER

;e9AF7
        LDA #$14
        STA a03
        LDX #$00
b234D   LDA HiScoreText,X                                                            ; e9AFD
        STA charToPlot
        LDA #$04
        STA colourToPlot
        TXA 
        CLC 
        ADC #$0C
        STA a02
        STX a07
        JSR Screen_Plot
        LDX a07
        LDA a02
        CLC 
        ADC #$09
        STA a02
        LDA #$03
        STA colourToPlot
        LDA f14F1,X
        STA charToPlot
        JSR Screen_Plot
        LDX a07
        INX 
        CPX #$07
        BNE b234D
        JMP e9987

        LDA #$04
        STA a39
        LDX #$06
b2386   DEC f0409,X                                                            ; e9B36
        LDA f0409,X
        CMP #$2F
        BNE b23A2
        LDA #$39
        STA f0409,X
        DEX 
        BNE b2386
        LDX #$07
        LDA #$30
b239C   STA f0409,X                                                            ; e9B4C
        DEX 
        BNE b239C
b23A2   RTS                                                                   ; e9B52

;HiScoreText
        .BYTE $48,$49,$53,$43,$4F,$52,$45 ; HISCORE

        .BYTE $01,$0C,$0C,$20,$0D,$01,$14
        .BYTE $12,$09,$18,$20,$10,$09
f23B7   .BYTE $0C,$0F
        .BYTE $14,$13,$2E,$2E,$2E,$20,$12,$05
        .BYTE $10,$0F,$12,$14,$20,$14
f23C7   .BYTE $0F,$20
        .BYTE $0A,$0F
        .BYTE $19,$13,$14,$09,$03,$0B
        .BYTE $20,$10,$0F,$12,$14,$20,$0F,$0E
        .BYTE $05,$20,$06,$0F,$12,$20,$03,$0F
        .BYTE $0D,$02,$01,$14,$20,$04,$15,$14
        .BYTE $19,$2E,$2E,$2E,$2E,$2E,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $00,$8D,$04,$40,$A9,$0F

f2400   =*+$01
f23FF   STA $D418    ;Select Filter Mode and Volume
        RTS 

;-------------------------------------------------------------------------------
;Init_Charset
;-------------------------------------------------------------------------------
        LDX #$00
b2405   LDA f9C00,X                                                            ; e9BB5
        STA f2000,X
        LDA f9D00,X
        STA f2100,X
        LDA f9E00,X
        STA f2200,X
        LDA p9F00,X
b241B   =*+$01                                                                 ; e9BCB
        STA f2300,X
        INX 
        BNE b2405
        JMP Initialize_Game

        ; NOPs
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA

;f2450
        .BYTE $18,$18,$18,$E7,$E7,$18,$18,$18
                                                ; CHARACTER $00
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 11100111   ***  ***
                                                ; 11100111   ***  ***
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   

        .BYTE $F0,$20,$10,$BF,$5F,$10,$20,$F0
                                                ; CHARACTER $01
                                                ; 11110000   ****    
                                                ; 00100000     *     
                                                ; 00010000      *    
                                                ; 10111111   * ******
                                                ; 01011111    * *****
                                                ; 00010000      *    
                                                ; 00100000     *     
                                                ; 11110000   ****    

        .BYTE $18,$18,$18,$18,$BD,$D3,$89,$91
                                                ; CHARACTER $02
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 10111101   * **** *
                                                ; 11010011   ** *  **
                                                ; 10001001   *   *  *
                                                ; 10010001   *  *   *

        .BYTE $00,$20,$60,$A3,$2C,$30,$00,$00
                                                ; CHARACTER $03
                                                ; 00000000           
                                                ; 00100000     *     
                                                ; 01100000    **     
                                                ; 10100011   * *   **
                                                ; 00101100     * **  
                                                ; 00110000     **    
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$02,$05,$C8,$30,$00,$00,$00
                                                ; CHARACTER $04
                                                ; 00000000           
                                                ; 00000010         * 
                                                ; 00000101        * *
                                                ; 11001000   **  *   
                                                ; 00110000     **    
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $08,$04,$3E,$20,$10,$10,$08,$08
                                                ; CHARACTER $05
                                                ; 00001000       *   
                                                ; 00000100        *  
                                                ; 00111110     ***** 
                                                ; 00100000     *     
                                                ; 00010000      *    
                                                ; 00010000      *    
                                                ; 00001000       *   
                                                ; 00001000       *   

        .BYTE $08,$08,$10,$10,$08,$04,$02,$04
                                                ; CHARACTER $06
                                                ; 00001000       *   
                                                ; 00001000       *   
                                                ; 00010000      *    
                                                ; 00010000      *    
                                                ; 00001000       *   
                                                ; 00000100        *  
                                                ; 00000010         * 
                                                ; 00000100        *  

        .BYTE $18,$3C,$7E,$3C,$7E,$FF,$FF,$E7
                                                ; CHARACTER $07
                                                ; 00011000      **   
                                                ; 00111100     ****  
                                                ; 01111110    ****** 
                                                ; 00111100     ****  
                                                ; 01111110    ****** 
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 11100111   ***  ***

        .BYTE $18,$18,$18,$18,$3C,$3C,$3C,$18
                                                ; CHARACTER $08
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00011000      **   

        .BYTE $18,$3C,$3C,$3C,$18,$18,$18,$18
                                                ; CHARACTER $09
                                                ; 00011000      **   
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   

        .BYTE $24,$24,$24,$3C,$18,$3C,$3C,$18
                                                ; CHARACTER $0a
                                                ; 00100100     *  *  
                                                ; 00100100     *  *  
                                                ; 00100100     *  *  
                                                ; 00111100     ****  
                                                ; 00011000      **   
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00011000      **   

        .BYTE $01,$03,$07,$03,$07,$0F,$0F,$0E
                                                ; CHARACTER $0b
                                                ; 00000001          *
                                                ; 00000011         **
                                                ; 00000111        ***
                                                ; 00000011         **
                                                ; 00000111        ***
                                                ; 00001111       ****
                                                ; 00001111       ****
                                                ; 00001110       *** 

        .BYTE $80,$C0,$E0,$C0,$E0,$F0,$F0,$70
                                                ; CHARACTER $0c
                                                ; 10000000   *       
                                                ; 11000000   **      
                                                ; 11100000   ***     
                                                ; 11000000   **      
                                                ; 11100000   ***     
                                                ; 11110000   ****    
                                                ; 11110000   ****    
                                                ; 01110000    ***    

        .BYTE $00,$00,$00,$18,$18,$00,$00,$00
                                                ; CHARACTER $0d
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$00,$18,$3C,$3C,$18,$00,$00
                                                ; CHARACTER $0e
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00011000      **   
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00011000      **   
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$00,$3C,$24,$24,$3C,$00,$00
                                                ; CHARACTER $0f
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00111100     ****  
                                                ; 00100100     *  *  
                                                ; 00100100     *  *  
                                                ; 00111100     ****  
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $81,$42,$3C,$24,$24,$3C,$42,$81
                                                ; CHARACTER $10
                                                ; 10000001   *      *
                                                ; 01000010    *    * 
                                                ; 00111100     ****  
                                                ; 00100100     *  *  
                                                ; 00100100     *  *  
                                                ; 00111100     ****  
                                                ; 01000010    *    * 
                                                ; 10000001   *      *

        .BYTE $FF,$C3,$BD,$A5,$A5,$BD,$C3,$FF
                                                ; CHARACTER $11
                                                ; 11111111   ********
                                                ; 11000011   **    **
                                                ; 10111101   * **** *
                                                ; 10100101   * *  * *
                                                ; 10100101   * *  * *
                                                ; 10111101   * **** *
                                                ; 11000011   **    **
                                                ; 11111111   ********

        .BYTE $E7,$C3,$A5,$18,$18,$A5,$C3,$E7
                                                ; CHARACTER $12
                                                ; 11100111   ***  ***
                                                ; 11000011   **    **
                                                ; 10100101   * *  * *
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 10100101   * *  * *
                                                ; 11000011   **    **
                                                ; 11100111   ***  ***

        .BYTE $30,$46,$48,$FF,$FF,$12,$62,$0C
                                                ; CHARACTER $13
                                                ; 00110000     **    
                                                ; 01000110    *   ** 
                                                ; 01001000    *  *   
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 00010010      *  * 
                                                ; 01100010    **   * 
                                                ; 00001100       **  

        .BYTE $C0,$FC,$72,$F8,$1F,$4E,$3F,$03
                                                ; CHARACTER $14
                                                ; 11000000   **      
                                                ; 11111100   ******  
                                                ; 01110010    ***  * 
                                                ; 11111000   *****   
                                                ; 00011111      *****
                                                ; 01001110    *  *** 
                                                ; 00111111     ******
                                                ; 00000011         **

        .BYTE $0B,$2F,$4E,$5E,$7A,$72,$F4,$D0
                                                ; CHARACTER $15
                                                ; 00001011       * **
                                                ; 00101111     * ****
                                                ; 01001110    *  *** 
                                                ; 01011110    * **** 
                                                ; 01111010    **** * 
                                                ; 01110010    ***  * 
                                                ; 11110100   **** *  
                                                ; 11010000   ** *    

        .BYTE $03,$06,$0D,$1B,$36,$6D,$DB,$B6
                                                ; CHARACTER $16
                                                ; 00000011         **
                                                ; 00000110        ** 
                                                ; 00001101       ** *
                                                ; 00011011      ** **
                                                ; 00110110     ** ** 
                                                ; 01101101    ** ** *
                                                ; 11011011   ** ** **
                                                ; 10110110   * ** ** 

        .BYTE $C0,$60,$B0,$D8,$6C,$B6,$DB,$6D
                                                ; CHARACTER $17
                                                ; 11000000   **      
                                                ; 01100000    **     
                                                ; 10110000   * **    
                                                ; 11011000   ** **   
                                                ; 01101100    ** **  
                                                ; 10110110   * ** ** 
                                                ; 11011011   ** ** **
                                                ; 01101101    ** ** *

        .BYTE $30,$30,$48,$48,$84,$84,$02,$02
                                                ; CHARACTER $18
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 01001000    *  *   
                                                ; 01001000    *  *   
                                                ; 10000100   *    *  
                                                ; 10000100   *    *  
                                                ; 00000010         * 
                                                ; 00000010         * 

        .BYTE $00,$3F,$63,$60,$3E,$03,$63,$7E
                                                ; CHARACTER $19
                                                ; 00000000           
                                                ; 00111111     ******
                                                ; 01100011    **   **
                                                ; 01100000    **     
                                                ; 00111110     ***** 
                                                ; 00000011         **
                                                ; 01100011    **   **
                                                ; 01111110    ****** 

        .BYTE $00,$3F,$63,$60,$60,$60,$63,$3F
                                                ; CHARACTER $1a
                                                ; 00000000           
                                                ; 00111111     ******
                                                ; 01100011    **   **
                                                ; 01100000    **     
                                                ; 01100000    **     
                                                ; 01100000    **     
                                                ; 01100011    **   **
                                                ; 00111111     ******

        .BYTE $00,$45,$6D,$55,$45,$45,$00,$00
                                                ; CHARACTER $1b
                                                ; 00000000           
                                                ; 01000101    *   * *
                                                ; 01101101    ** ** *
                                                ; 01010101    * * * *
                                                ; 01000101    *   * *
                                                ; 01000101    *   * *
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$D2,$1A,$96,$12,$D2,$00,$00
                                                ; CHARACTER $1c
                                                ; 00000000           
                                                ; 11010010   ** *  * 
                                                ; 00011010      ** * 
                                                ; 10010110   *  * ** 
                                                ; 00010010      *  * 
                                                ; 11010010   ** *  * 
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$55,$55,$75,$55,$55,$00,$00
                                                ; CHARACTER $1d
                                                ; 00000000           
                                                ; 01010101    * * * *
                                                ; 01010101    * * * *
                                                ; 01110101    *** * *
                                                ; 01010101    * * * *
                                                ; 01010101    * * * *
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$D4,$14,$5C,$54,$D4,$00,$00
                                                ; CHARACTER $1e
                                                ; 00000000           
                                                ; 11010100   ** * *  
                                                ; 00010100      * *  
                                                ; 01011100    * ***  
                                                ; 01010100    * * *  
                                                ; 11010100   ** * *  
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$10,$08,$7C,$08,$10,$00,$00
                                                ; CHARACTER $1f
                                                ; 00000000           
                                                ; 00010000      *    
                                                ; 00001000       *   
                                                ; 01111100    *****  
                                                ; 00001000       *   
                                                ; 00010000      *    
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
                                                ; CHARACTER $20
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$9A,$00,$00,$00,$00,$00,$00
                                                ; CHARACTER $21
                                                ; 00000000           
                                                ; 10011010   *  ** * 
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $FE,$9A,$18,$18,$18,$18,$38,$38
                                                ; CHARACTER $22
                                                ; 11111110   ******* 
                                                ; 10011010   *  ** * 
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00111000     ***   
                                                ; 00111000     ***   

        .BYTE $86,$CE,$BA,$92,$82,$86,$86,$96
                                                ; CHARACTER $23
                                                ; 10000110   *    ** 
                                                ; 11001110   **  *** 
                                                ; 10111010   * *** * 
                                                ; 10010010   *  *  * 
                                                ; 10000010   *     * 
                                                ; 10000110   *    ** 
                                                ; 10000110   *    ** 
                                                ; 10010110   *  * ** 

        .BYTE $1C,$14,$24,$3C,$46,$46,$86,$86
                                                ; CHARACTER $24
                                                ; 00011100      ***  
                                                ; 00010100      * *  
                                                ; 00100100     *  *  
                                                ; 00111100     ****  
                                                ; 01000110    *   ** 
                                                ; 01000110    *   ** 
                                                ; 10000110   *    ** 
                                                ; 10000110   *    ** 

        .BYTE $F8,$84,$84,$F8,$90,$88,$C6,$C6
                                                ; CHARACTER $25
                                                ; 11111000   *****   
                                                ; 10000100   *    *  
                                                ; 10000100   *    *  
                                                ; 11111000   *****   
                                                ; 10010000   *  *    
                                                ; 10001000   *   *   
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 

        .BYTE $FC,$30,$30,$30,$30,$30,$30,$FC
                                                ; CHARACTER $26
                                                ; 11111100   ******  
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 11111100   ******  

        .BYTE $82,$C6,$6C,$38,$38,$6C,$C6,$D6
                                                ; CHARACTER $27
                                                ; 10000010   *     * 
                                                ; 11000110   **   ** 
                                                ; 01101100    ** **  
                                                ; 00111000     ***   
                                                ; 00111000     ***   
                                                ; 01101100    ** **  
                                                ; 11000110   **   ** 
                                                ; 11010110   ** * ** 

        .BYTE $00,$00,$00,$1D,$1E,$1F,$B0,$B0
                                                ; CHARACTER $28
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00011101      *** *
                                                ; 00011110      **** 
                                                ; 00011111      *****
                                                ; 10110000   * **    
                                                ; 10110000   * **    

        .BYTE $B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0
                                                ; CHARACTER $29
                                                ; 10110000   * **    
                                                ; 10110000   * **    
                                                ; 10110000   * **    
                                                ; 10110000   * **    
                                                ; 10110000   * **    
                                                ; 10110000   * **    
                                                ; 10110000   * **    
                                                ; 10110000   * **    

        .BYTE $00,$01,$02,$06,$04,$06,$07,$04
                                                ; CHARACTER $2a
                                                ; 00000000           
                                                ; 00000001          *
                                                ; 00000010         * 
                                                ; 00000110        ** 
                                                ; 00000100        *  
                                                ; 00000110        ** 
                                                ; 00000111        ***
                                                ; 00000100        *  

        .BYTE $05,$0B,$07,$08,$09,$07,$06,$06
                                                ; CHARACTER $2b
                                                ; 00000101        * *
                                                ; 00001011       * **
                                                ; 00000111        ***
                                                ; 00001000       *   
                                                ; 00001001       *  *
                                                ; 00000111        ***
                                                ; 00000110        ** 
                                                ; 00000110        ** 

        .BYTE $07,$08,$07,$08,$09,$00,$00,$07
                                                ; CHARACTER $2c
                                                ; 00000111        ***
                                                ; 00001000       *   
                                                ; 00000111        ***
                                                ; 00001000       *   
                                                ; 00001001       *  *
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000111        ***

        .BYTE $07,$05,$07,$06,$06,$09,$09,$03
                                                ; CHARACTER $2d
                                                ; 00000111        ***
                                                ; 00000101        * *
                                                ; 00000111        ***
                                                ; 00000110        ** 
                                                ; 00000110        ** 
                                                ; 00001001       *  *
                                                ; 00001001       *  *
                                                ; 00000011         **

        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
                                                ; CHARACTER $2e
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $0B,$0B,$0B,$00,$00,$00,$00,$00
                                                ; CHARACTER $2f
                                                ; 00001011       * **
                                                ; 00001011       * **
                                                ; 00001011       * **
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $7C,$FE,$0E,$D6,$E6,$C6,$FE,$7C
                                                ; CHARACTER $30
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00001110       *** 
                                                ; 11010110   ** * ** 
                                                ; 11100110   ***  ** 
                                                ; 11000110   **   ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  

        .BYTE $08,$08,$00,$08,$08,$18,$18,$18
                                                ; CHARACTER $31
                                                ; 00001000       *   
                                                ; 00001000       *   
                                                ; 00000000           
                                                ; 00001000       *   
                                                ; 00001000       *   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   

        .BYTE $FC,$FE,$02,$06,$1C,$70,$FE,$FE
                                                ; CHARACTER $32
                                                ; 11111100   ******  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 00000110        ** 
                                                ; 00011100      ***  
                                                ; 01110000    ***    
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 

        .BYTE $FC,$FE,$02,$3C,$3C,$02,$FE,$FC
                                                ; CHARACTER $33
                                                ; 11111100   ******  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00000010         * 
                                                ; 11111110   ******* 
                                                ; 11111100   ******  

        .BYTE $18,$18,$D8,$D8,$FE,$18,$18,$18
                                                ; CHARACTER $34
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 11011000   ** **   
                                                ; 11011000   ** **   
                                                ; 11111110   ******* 
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   

        .BYTE $FE,$FE,$00,$80,$FC,$06,$FE,$FC
                                                ; CHARACTER $35
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 10000000   *       
                                                ; 11111100   ******  
                                                ; 00000110        ** 
                                                ; 11111110   ******* 
                                                ; 11111100   ******  

        .BYTE $7C,$FE,$00,$C0,$FC,$C6,$FE,$7C
                                                ; CHARACTER $36
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 11000000   **      
                                                ; 11111100   ******  
                                                ; 11000110   **   ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  

        .BYTE $FE,$FE,$06,$0C,$18,$10,$30,$30
                                                ; CHARACTER $37
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000110        ** 
                                                ; 00001100       **  
                                                ; 00011000      **   
                                                ; 00010000      *    
                                                ; 00110000     **    
                                                ; 00110000     **    

        .BYTE $7C,$FE,$06,$C6,$7C,$C6,$FE,$7C
                                                ; CHARACTER $38
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000110        ** 
                                                ; 11000110   **   ** 
                                                ; 01111100    *****  
                                                ; 11000110   **   ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  

        .BYTE $7C,$FE,$06,$C6,$7E,$06,$FE,$7C
                                                ; CHARACTER $39
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000110        ** 
                                                ; 11000110   **   ** 
                                                ; 01111110    ****** 
                                                ; 00000110        ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  

        .BYTE $01,$01,$01,$01,$0B,$0C,$09,$08
                                                ; CHARACTER $3a
                                                ; 00000001          *
                                                ; 00000001          *
                                                ; 00000001          *
                                                ; 00000001          *
                                                ; 00001011       * **
                                                ; 00001100       **  
                                                ; 00001001       *  *
                                                ; 00001000       *   

        .BYTE $80,$80,$80,$80,$D0,$B0,$10,$90
                                                ; CHARACTER $3b
                                                ; 10000000   *       
                                                ; 10000000   *       
                                                ; 10000000   *       
                                                ; 10000000   *       
                                                ; 11010000   ** *    
                                                ; 10110000   * **    
                                                ; 00010000      *    
                                                ; 10010000   *  *    

        .BYTE $00,$00,$00,$00,$F0,$20,$10,$5F
                                                ; CHARACTER $3c
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 11110000   ****    
                                                ; 00100000     *     
                                                ; 00010000      *    
                                                ; 01011111    * *****

        .BYTE $BF,$10,$20,$F0,$00,$00,$00,$00
                                                ; CHARACTER $3d
                                                ; 10111111   * ******
                                                ; 00010000      *    
                                                ; 00100000     *     
                                                ; 11110000   ****    
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$87,$92,$89,$84,$20,$9A,$81
                                                ; CHARACTER $3e
                                                ; 00000000           
                                                ; 10000111   *    ***
                                                ; 10010010   *  *  * 
                                                ; 10001001   *   *  *
                                                ; 10000100   *    *  
                                                ; 00100000     *     
                                                ; 10011010   *  ** * 
                                                ; 10000001   *      *

        .BYTE $3C,$42,$99,$A1,$A1,$99,$42,$3C
                                                ; CHARACTER $3f
                                                ; 00111100     ****  
                                                ; 01000010    *    * 
                                                ; 10011001   *  **  *
                                                ; 10100001   * *    *
                                                ; 10100001   * *    *
                                                ; 10011001   *  **  *
                                                ; 01000010    *    * 
                                                ; 00111100     ****  

        .BYTE $88,$22,$18,$7D,$BC,$10,$42,$14
                                                ; CHARACTER $40
                                                ; 10001000   *   *   
                                                ; 00100010     *   * 
                                                ; 00011000      **   
                                                ; 01111101    ***** *
                                                ; 10111100   * ****  
                                                ; 00010000      *    
                                                ; 01000010    *    * 
                                                ; 00010100      * *  

        .BYTE $06,$0E,$02,$1E,$3E,$66,$C6,$00
                                                ; CHARACTER $41
                                                ; 00000110        ** 
                                                ; 00001110       *** 
                                                ; 00000010         * 
                                                ; 00011110      **** 
                                                ; 00111110     ***** 
                                                ; 01100110    **  ** 
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $FC,$FE,$02,$FC,$86,$FE,$FC,$00
                                                ; CHARACTER $42
                                                ; 11111100   ******  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 11111100   ******  
                                                ; 10000110   *    ** 
                                                ; 11111110   ******* 
                                                ; 11111100   ******  
                                                ; 00000000           

        .BYTE $7C,$FE,$00,$C0,$C0,$FE,$7C,$00
                                                ; CHARACTER $43
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 11000000   **      
                                                ; 11000000   **      
                                                ; 11111110   ******* 
                                                ; 01111100    *****  
                                                ; 00000000           

        .BYTE $FC,$FE,$02,$C6,$C6,$FE,$FC,$00
                                                ; CHARACTER $44
                                                ; 11111100   ******  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 11111110   ******* 
                                                ; 11111100   ******  
                                                ; 00000000           

        .BYTE $FE,$FE,$00,$F0,$C0,$FE,$FE,$00
                                                ; CHARACTER $45
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 11110000   ****    
                                                ; 11000000   **      
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           

        .BYTE $FE,$FE,$00,$F8,$C0,$C0,$C0,$00
                                                ; CHARACTER $46
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 11111000   *****   
                                                ; 11000000   **      
                                                ; 11000000   **      
                                                ; 11000000   **      
                                                ; 00000000           

        .BYTE $7C,$FE,$00,$DE,$C6,$FE,$7C,$00
                                                ; CHARACTER $47
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 11011110   ** **** 
                                                ; 11000110   **   ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  
                                                ; 00000000           

        .BYTE $C6,$C6,$02,$FE,$C6,$C6,$C6,$00
                                                ; CHARACTER $48
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000010         * 
                                                ; 11111110   ******* 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $3C,$3C,$00,$18,$18,$3C,$3C,$00
                                                ; CHARACTER $49
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00000000           
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00000000           

        .BYTE $FE,$FE,$00,$18,$D8,$F8,$70,$00
                                                ; CHARACTER $4a
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 00011000      **   
                                                ; 11011000   ** **   
                                                ; 11111000   *****   
                                                ; 01110000    ***    
                                                ; 00000000           

        .BYTE $CC,$D8,$00,$F0,$D8,$CC,$C6,$00
                                                ; CHARACTER $4b
                                                ; 11001100   **  **  
                                                ; 11011000   ** **   
                                                ; 00000000           
                                                ; 11110000   ****    
                                                ; 11011000   ** **   
                                                ; 11001100   **  **  
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $C0,$C0,$00,$C0,$C0,$FE,$FE,$00
                                                ; CHARACTER $4c
                                                ; 11000000   **      
                                                ; 11000000   **      
                                                ; 00000000           
                                                ; 11000000   **      
                                                ; 11000000   **      
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           

        .BYTE $C6,$EE,$02,$D6,$C6,$C6,$C6,$00
                                                ; CHARACTER $4d
                                                ; 11000110   **   ** 
                                                ; 11101110   *** *** 
                                                ; 00000010         * 
                                                ; 11010110   ** * ** 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $C6,$C6,$02,$D6,$CE,$C6,$C6,$00
                                                ; CHARACTER $4e
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000010         * 
                                                ; 11010110   ** * ** 
                                                ; 11001110   **  *** 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $7C,$FE,$02,$C6,$C6,$FE,$7C,$00
                                                ; CHARACTER $4f
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  
                                                ; 00000000           

        .BYTE $FC,$FE,$02,$FC,$C0,$C0,$C0,$00
                                                ; CHARACTER $50
                                                ; 11111100   ******  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 11111100   ******  
                                                ; 11000000   **      
                                                ; 11000000   **      
                                                ; 11000000   **      
                                                ; 00000000           

        .BYTE $7C,$FE,$02,$C6,$C6,$CE,$7E,$01
                                                ; CHARACTER $51
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 11001110   **  *** 
                                                ; 01111110    ****** 
                                                ; 00000001          *

        .BYTE $FC,$FE,$02,$FC,$D8,$CC,$C6,$00
                                                ; CHARACTER $52
                                                ; 11111100   ******  
                                                ; 11111110   ******* 
                                                ; 00000010         * 
                                                ; 11111100   ******  
                                                ; 11011000   ** **   
                                                ; 11001100   **  **  
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $7C,$FE,$00,$FC,$06,$FE,$7C,$00
                                                ; CHARACTER $53
                                                ; 01111100    *****  
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 11111100   ******  
                                                ; 00000110        ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  
                                                ; 00000000           

        .BYTE $7E,$7E,$00,$18,$18,$18,$18,$00
                                                ; CHARACTER $54
                                                ; 01111110    ****** 
                                                ; 01111110    ****** 
                                                ; 00000000           
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00000000           

        .BYTE $C6,$C6,$02,$C6,$C6,$FE,$7C,$00
                                                ; CHARACTER $55
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000010         * 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 11111110   ******* 
                                                ; 01111100    *****  
                                                ; 00000000           

        .BYTE $C6,$C6,$02,$C6,$C6,$6C,$38,$00
                                                ; CHARACTER $56
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000010         * 
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 01101100    ** **  
                                                ; 00111000     ***   
                                                ; 00000000           

        .BYTE $C6,$C6,$02,$C6,$D6,$EE,$C6,$00
                                                ; CHARACTER $57
                                                ; 11000110   **   ** 
                                                ; 11000110   **   ** 
                                                ; 00000010         * 
                                                ; 11000110   **   ** 
                                                ; 11010110   ** * ** 
                                                ; 11101110   *** *** 
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $C6,$6C,$00,$30,$38,$6C,$C6,$00
                                                ; CHARACTER $58
                                                ; 11000110   **   ** 
                                                ; 01101100    ** **  
                                                ; 00000000           
                                                ; 00110000     **    
                                                ; 00111000     ***   
                                                ; 01101100    ** **  
                                                ; 11000110   **   ** 
                                                ; 00000000           

        .BYTE $CC,$CC,$00,$78,$30,$30,$30,$00
                                                ; CHARACTER $59
                                                ; 11001100   **  **  
                                                ; 11001100   **  **  
                                                ; 00000000           
                                                ; 01111000    ****   
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00000000           

        .BYTE $FE,$FE,$00,$38,$70,$FE,$FE,$00
                                                ; CHARACTER $5a
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           
                                                ; 00111000     ***   
                                                ; 01110000    ***    
                                                ; 11111110   ******* 
                                                ; 11111110   ******* 
                                                ; 00000000           

        .BYTE $7E,$FF,$FF,$FF,$FF,$FF,$FF,$7E
                                                ; CHARACTER $5b
                                                ; 01111110    ****** 
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 01111110    ****** 

        .BYTE $3C,$3C,$FF,$EF,$F7,$FF,$3C,$3C
                                                ; CHARACTER $5c
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 11111111   ********
                                                ; 11101111   *** ****
                                                ; 11110111   **** ***
                                                ; 11111111   ********
                                                ; 00111100     ****  
                                                ; 00111100     ****  

        .BYTE $18,$18,$18,$E7,$E7,$18,$18,$18
                                                ; CHARACTER $5d
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 11100111   ***  ***
                                                ; 11100111   ***  ***
                                                ; 00011000      **   
                                                ; 00011000      **   
                                                ; 00011000      **   

        .BYTE $32,$7B,$FA,$BC,$88,$88,$88,$CC
                                                ; CHARACTER $5e
                                                ; 00110010     **  * 
                                                ; 01111011    **** **
                                                ; 11111010   ***** * 
                                                ; 10111100   * ****  
                                                ; 10001000   *   *   
                                                ; 10001000   *   *   
                                                ; 10001000   *   *   
                                                ; 11001100   **  **  

        .BYTE $03,$07,$0F,$0B,$18,$10,$10,$18
                                                ; CHARACTER $5f
                                                ; 00000011         **
                                                ; 00000111        ***
                                                ; 00001111       ****
                                                ; 00001011       * **
                                                ; 00011000      **   
                                                ; 00010000      *    
                                                ; 00010000      *    
                                                ; 00011000      **   

        .BYTE $10,$98,$90,$E0,$80,$40,$40,$60
                                                ; CHARACTER $60
                                                ; 00010000      *    
                                                ; 10011000   *  **   
                                                ; 10010000   *  *    
                                                ; 11100000   ***     
                                                ; 10000000   *       
                                                ; 01000000    *      
                                                ; 01000000    *      
                                                ; 01100000    **     

        .BYTE $4C,$DE,$5F,$3D,$11,$11,$11,$33
                                                ; CHARACTER $61
                                                ; 01001100    *  **  
                                                ; 11011110   ** **** 
                                                ; 01011111    * *****
                                                ; 00111101     **** *
                                                ; 00010001      *   *
                                                ; 00010001      *   *
                                                ; 00010001      *   *
                                                ; 00110011     **  **

        .BYTE $C0,$E0,$F0,$D0,$18,$08,$08,$18
                                                ; CHARACTER $62
                                                ; 11000000   **      
                                                ; 11100000   ***     
                                                ; 11110000   ****    
                                                ; 11010000   ** *    
                                                ; 00011000      **   
                                                ; 00001000       *   
                                                ; 00001000       *   
                                                ; 00011000      **   

        .BYTE $08,$19,$09,$07,$01,$02,$02,$06
                                                ; CHARACTER $63
                                                ; 00001000       *   
                                                ; 00011001      **  *
                                                ; 00001001       *  *
                                                ; 00000111        ***
                                                ; 00000001          *
                                                ; 00000010         * 
                                                ; 00000010         * 
                                                ; 00000110        ** 

        .BYTE $00,$6F,$6D,$6D,$6D,$6D,$6F,$00
                                                ; CHARACTER $64
                                                ; 00000000           
                                                ; 01101111    ** ****
                                                ; 01101101    ** ** *
                                                ; 01101101    ** ** *
                                                ; 01101101    ** ** *
                                                ; 01101101    ** ** *
                                                ; 01101111    ** ****
                                                ; 00000000           

        .BYTE $00,$BE,$B0,$BE,$B6,$B6,$BE,$00
                                                ; CHARACTER $65
                                                ; 00000000           
                                                ; 10111110   * ***** 
                                                ; 10110000   * **    
                                                ; 10111110   * ***** 
                                                ; 10110110   * ** ** 
                                                ; 10110110   * ** ** 
                                                ; 10111110   * ***** 
                                                ; 00000000           

        .BYTE $18,$10,$18,$7E,$18,$78,$44,$06
                                                ; CHARACTER $66
                                                ; 00011000      **   
                                                ; 00010000      *    
                                                ; 00011000      **   
                                                ; 01111110    ****** 
                                                ; 00011000      **   
                                                ; 01111000    ****   
                                                ; 01000100    *   *  
                                                ; 00000110        ** 

        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
                                                ; CHARACTER $67
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $01,$01,$01,$03,$05,$01,$02,$02
                                                ; CHARACTER $68
                                                ; 00000001          *
                                                ; 00000001          *
                                                ; 00000001          *
                                                ; 00000011         **
                                                ; 00000101        * *
                                                ; 00000001          *
                                                ; 00000010         * 
                                                ; 00000010         * 

        .BYTE $80,$00,$80,$C0,$A0,$80,$40,$40
                                                ; CHARACTER $69
                                                ; 10000000   *       
                                                ; 00000000           
                                                ; 10000000   *       
                                                ; 11000000   **      
                                                ; 10100000   * *     
                                                ; 10000000   *       
                                                ; 01000000    *      
                                                ; 01000000    *      

        .BYTE $18,$08,$18,$7E,$18,$1E,$22,$60
                                                ; CHARACTER $6a
                                                ; 00011000      **   
                                                ; 00001000       *   
                                                ; 00011000      **   
                                                ; 01111110    ****** 
                                                ; 00011000      **   
                                                ; 00011110      **** 
                                                ; 00100010     *   * 
                                                ; 01100000    **     

        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
                                                ; CHARACTER $6b
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $80,$80,$80,$C0,$A0,$80,$40,$40
                                                ; CHARACTER $6c
                                                ; 10000000   *       
                                                ; 10000000   *       
                                                ; 10000000   *       
                                                ; 11000000   **      
                                                ; 10100000   * *     
                                                ; 10000000   *       
                                                ; 01000000    *      
                                                ; 01000000    *      

        .BYTE $01,$00,$01,$03,$05,$01,$02,$02
                                                ; CHARACTER $6d
                                                ; 00000001          *
                                                ; 00000000           
                                                ; 00000001          *
                                                ; 00000011         **
                                                ; 00000101        * *
                                                ; 00000001          *
                                                ; 00000010         * 
                                                ; 00000010         * 

        .BYTE $10,$28,$10,$F8,$94,$10,$28,$28
                                                ; CHARACTER $6e
                                                ; 00010000      *    
                                                ; 00101000     * *   
                                                ; 00010000      *    
                                                ; 11111000   *****   
                                                ; 10010100   *  * *  
                                                ; 00010000      *    
                                                ; 00101000     * *   
                                                ; 00101000     * *   

        .BYTE $10,$28,$12,$3C,$50,$90,$A8,$24
                                                ; CHARACTER $6f
                                                ; 00010000      *    
                                                ; 00101000     * *   
                                                ; 00010010      *  * 
                                                ; 00111100     ****  
                                                ; 01010000    * *    
                                                ; 10010000   *  *    
                                                ; 10101000   * * *   
                                                ; 00100100     *  *  

        .BYTE $00,$00,$70,$FF,$FF,$70,$00,$00
                                                ; CHARACTER $70
                                                ; 00000000           
                                                ; 00000000           
                                                ; 01110000    ***    
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 01110000    ***    
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$00,$0E,$FF,$FF,$0E,$00,$00
                                                ; CHARACTER $71
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00001110       *** 
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 00001110       *** 
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $03,$07,$0E,$1C,$38,$70,$E0,$C0
                                                ; CHARACTER $72
                                                ; 00000011         **
                                                ; 00000111        ***
                                                ; 00001110       *** 
                                                ; 00011100      ***  
                                                ; 00111000     ***   
                                                ; 01110000    ***    
                                                ; 11100000   ***     
                                                ; 11000000   **      

        .BYTE $00,$00,$14,$7C,$26,$7C,$08,$00
                                                ; CHARACTER $73
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00010100      * *  
                                                ; 01111100    *****  
                                                ; 00100110     *  ** 
                                                ; 01111100    *****  
                                                ; 00001000       *   
                                                ; 00000000           

        .BYTE $00,$62,$56,$2A,$24,$54,$6E,$40
                                                ; CHARACTER $74
                                                ; 00000000           
                                                ; 01100010    **   * 
                                                ; 01010110    * * ** 
                                                ; 00101010     * * * 
                                                ; 00100100     *  *  
                                                ; 01010100    * * *  
                                                ; 01101110    ** *** 
                                                ; 01000000    *      

        .BYTE $C0,$E0,$70,$38,$1C,$0E,$07,$03
                                                ; CHARACTER $75
                                                ; 11000000   **      
                                                ; 11100000   ***     
                                                ; 01110000    ***    
                                                ; 00111000     ***   
                                                ; 00011100      ***  
                                                ; 00001110       *** 
                                                ; 00000111        ***
                                                ; 00000011         **

        .BYTE $44,$AA,$91,$7A,$BC,$A2,$D5,$8A
                                                ; CHARACTER $76
                                                ; 01000100    *   *  
                                                ; 10101010   * * * * 
                                                ; 10010001   *  *   *
                                                ; 01111010    **** * 
                                                ; 10111100   * ****  
                                                ; 10100010   * *   * 
                                                ; 11010101   ** * * *
                                                ; 10001010   *   * * 

        .BYTE $00,$00,$00,$00,$00,$60,$60,$00
                                                ; CHARACTER $77
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 01100000    **     
                                                ; 01100000    **     
                                                ; 00000000           

        .BYTE $00,$00,$7E,$FF,$FF,$7E,$00,$00
                                                ; CHARACTER $78
                                                ; 00000000           
                                                ; 00000000           
                                                ; 01111110    ****** 
                                                ; 11111111   ********
                                                ; 11111111   ********
                                                ; 01111110    ****** 
                                                ; 00000000           
                                                ; 00000000           

        .BYTE $00,$00,$00,$00,$00,$60,$20,$40
                                                ; CHARACTER $79
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00000000           
                                                ; 01100000    **     
                                                ; 00100000     *     
                                                ; 01000000    *      

        .BYTE $03,$07,$0E,$1C,$18,$00,$C0,$C0
                                                ; CHARACTER $7a
                                                ; 00000011         **
                                                ; 00000111        ***
                                                ; 00001110       *** 
                                                ; 00011100      ***  
                                                ; 00011000      **   
                                                ; 00000000           
                                                ; 11000000   **      
                                                ; 11000000   **      

        .BYTE $CE,$CF,$EC,$CE,$C8,$CE,$EC,$40
                                                ; CHARACTER $7b
                                                ; 11001110   **  *** 
                                                ; 11001111   **  ****
                                                ; 11101100   *** **  
                                                ; 11001110   **  *** 
                                                ; 11001000   **  *   
                                                ; 11001110   **  *** 
                                                ; 11101100   *** **  
                                                ; 01000000    *      

        .BYTE $8D,$96,$9C,$CD,$8C,$8D,$EC,$58
                                                ; CHARACTER $7c
                                                ; 10001101   *   ** *
                                                ; 10010110   *  * ** 
                                                ; 10011100   *  ***  
                                                ; 11001101   **  ** *
                                                ; 10001100   *   **  
                                                ; 10001101   *   ** *
                                                ; 11101100   *** **  
                                                ; 01011000    * **   

        .BYTE $8E,$81,$E8,$D9,$DC,$D4,$CC,$46
                                                ; CHARACTER $7d
                                                ; 10001110   *   *** 
                                                ; 10000001   *      *
                                                ; 11101000   *** *   
                                                ; 11011001   ** **  *
                                                ; 11011100   ** ***  
                                                ; 11010100   ** * *  
                                                ; 11001100   **  **  
                                                ; 01000110    *   ** 

        .BYTE $31,$32,$73,$29,$05,$37,$B3,$53
                                                ; CHARACTER $7e
                                                ; 00110001     **   *
                                                ; 00110010     **  * 
                                                ; 01110011    ***  **
                                                ; 00101001     * *  *
                                                ; 00000101        * *
                                                ; 00110111     ** ***
                                                ; 10110011   * **  **
                                                ; 01010011    * *  **

        .BYTE $30,$3A,$41,$4D,$43,$36,$34,$08
                                                ; CHARACTER $7f
                                                ; 00110000     **    
                                                ; 00111010     *** * 
                                                ; 01000001    *     *
                                                ; 01001101    *  ** *
                                                ; 01000011    *    **
                                                ; 00110110     ** ** 
                                                ; 00110100     ** *  
                                                ; 00001000       *   


        .BYTE $00 ; BRK #$00
