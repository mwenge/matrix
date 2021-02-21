;
; **** ZP ABSOLUTE ADRESSES **** 
;
currentXPosition = $02
currentYPosition = $03
currentCharacter = $04
colorForCurrentCharacter = $05
a06 = $06
a07 = $07
a08 = $08
a09 = $09
a0A = $0A
a0B = $0B
a0C = $0C
joystickInput = $0D
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
screenLineLoPtr = $48
screenLineHiPtr = $49
a50 = $50
a5A = $5A
lastKeyPressed = $C5
;
; **** ZP POINTERS **** 
;
p06 = $06
;
; **** POINTERS **** 
;
p03 = $0003
SCREEN_RAM = $0400
COLOR_RAM = $D800
screenLinesLoPtrArray = $0340
screenLinesHiPtrArray = $0360

* = $0801
;-----------------------------------------------------------------------------------------------------
; SYS 16384 ($4000)
; This launches the program from address $4000, i.e. MainControlLoop.
;-----------------------------------------------------------------------------------------------------
; $9E = SYS
; $31,$36,$33,$38,$34,$00 = 16384 ($4000 in hex)
.BYTE $0C,$08,$0A,$00,$9E,$33,$32,$37,$36,$38,$00

* = $8000
p8000
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        NOP 
        LDA #$01
        STA a13
        JMP CopyCharsetIntoPosition

;---------------------------------------------------------------------------------
; WasteAFewCycles   
;---------------------------------------------------------------------------------
WasteAFewCycles   
        LDA #$08
        STA a5A
b8017   DEY 
        BNE b8017
        DEC a5A
        BNE b8017
        RTS 

        BNE WasteAFewCycles
        RTS 

;-------------------------------------------------------------------------
; InitializeScreenLinePtrArray
;-------------------------------------------------------------------------
InitializeScreenLinePtrArray
        LDA #>SCREEN_RAM + $0000
        STA screenLineHiPtr
        LDA #<SCREEN_RAM + $0000
        STA screenLineLoPtr
        LDX #$00
b802C   LDA screenLineLoPtr
        STA screenLinesLoPtrArray,X
        LDA screenLineHiPtr
        STA screenLinesHiPtrArray,X
        LDA screenLineLoPtr
        CLC 
        ADC #$28
        STA screenLineLoPtr
        LDA screenLineHiPtr
        ADC #$00
        STA screenLineHiPtr
        INX 
        CPX #$18
        BNE b802C
        RTS 

;-------------------------------------------------------------------------
; GetLinePtrForCurrentYPosition
;-------------------------------------------------------------------------
GetLinePtrForCurrentYPosition
        LDX currentYPosition
        LDY currentXPosition
        LDA screenLinesLoPtrArray,X
        STA screenLineLoPtr
        LDA screenLinesHiPtrArray,X
        STA screenLineHiPtr
        RTS 

;-------------------------------------------------------------------------
; GetCharacterAtCurrentXYPos
;-------------------------------------------------------------------------
GetCharacterAtCurrentXYPos
        JSR GetLinePtrForCurrentYPosition
        LDA (screenLineLoPtr),Y
        RTS 

;-------------------------------------------------------------------------
; WriteCurrentCharacterToCurrentXYPos
;-------------------------------------------------------------------------
WriteCurrentCharacterToCurrentXYPos
        JSR GetLinePtrForCurrentYPosition
        LDA currentCharacter
        STA (screenLineLoPtr),Y
        LDA screenLineHiPtr

        ; Write the color value.
        CLC 
        ADC #$D4
        STA screenLineHiPtr
        LDA colorForCurrentCharacter
        STA (screenLineLoPtr),Y
        RTS 

;-------------------------------------------------------------------------
; ClearScreen
;-------------------------------------------------------------------------
ClearScreen
        LDX #$00
b8073   LDA #$20
        STA SCREEN_RAM + $0000,X
        STA SCREEN_RAM + $0100,X
        STA SCREEN_RAM + $0200,X
        STA SCREEN_RAM + $0300,X
        DEX 
        BNE b8073
        RTS 

;---------------------------------------------------------------------------------
; InitializeGame   
;---------------------------------------------------------------------------------
InitializeGame   
        LDA #$00
        LDX #$18
b8089   STA $D400,X  ;Voice 1: Frequency Control - Low-Byte
        DEX 
        BNE b8089

        LDA #$00
        STA $4000
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        STA $D413    ;Voice 3: Attack / Decay Cycle Control

        LDA #$30
        LDX #$07
b809E   STA $14F0,X
        DEX 
        BNE b809E

        LDA #$A0
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        LDA #$80
        STA $0291
        LDA #$00
        NOP 
        STA $D021    ;Background Color 0
        STA $D020    ;Border Color
        LDA #$18
        STA $D018    ;VIC Memory Control Register
        JSR ClearScreen
        JSR InitializeScreenLinePtrArray
        JMP SetupScreen

;-------------------------------------------------------------------------
; PlayNote1
;-------------------------------------------------------------------------
PlayNote1
        LDA #$11
        STA $D40B    ;Voice 2: Control Register
        RTS 

;-------------------------------------------------------------------------
; PlayNote2
;-------------------------------------------------------------------------
PlayNote2
        LDA #$21
        STA $D412    ;Voice 3: Control Register
        RTS 

;-------------------------------------------------------------------------
; PlayNote3
;-------------------------------------------------------------------------
PlayNote3
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        RTS 

;-------------------------------------------------------------------------
; PlayChord
;-------------------------------------------------------------------------
PlayChord
        LDA #$00
        STA $D412    ;Voice 3: Control Register
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        RTS 

;-------------------------------------------------------------------------
; WriteBannerText
;-------------------------------------------------------------------------
WriteBannerText
        LDX #$2E
b80EB   LDA txtBanner,X
        STA SCREEN_RAM - $0001,X
        LDA colorsBannerText,X
        STA COLOR_RAM - $0001,X
        DEX 
        BNE b80EB
        RTS 

;---------------------------------------------------------------------------------
; SetupScreen   
;---------------------------------------------------------------------------------
SetupScreen   
        JSR WriteBannerText
        JSR DrawTitleScreen
        JMP j81BC

txtBanner   =*-$01
        .BYTE $23,$24,$22,$25,$26,$27,$20,$19 ; MATRIX
        .BYTE $1A
        .TEXT " 0000000  ", $07, " 5 SHIPS REMAINING  !!!!!"
colorsBannerText   .BYTE $21,$43,$43,$43,$43,$43,$43,$40
        .BYTE $44,$44,$40,$47,$47,$47,$47,$47
        .BYTE $47,$47,$40,$40,$45,$40,$43,$40
        .BYTE $44,$44,$44,$44,$44,$43,$47,$47
        .BYTE $47,$47,$47,$47,$47,$47,$47,$47
        .BYTE $47,$44,$44,$44,$44,$44
gridLineIntroSequenceColors   .BYTE $44,$06,$02,$04,$05,$03,$07,$01
;-------------------------------------------------------------------------
; s8167
;-------------------------------------------------------------------------
s8167
        JSR PlayChord
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

;-------------------------------------------------------------------------
; WasteXYCycles
;-------------------------------------------------------------------------
WasteXYCycles
        LDX currentXPosition
b8172   LDY currentYPosition
b8174   DEY 
        BNE b8174
        DEX 
        BNE b8172
        RTS 

;-------------------------------------------------------------------------
; DrawGridLineEntrySequence
;-------------------------------------------------------------------------
DrawGridLineEntrySequence
        LDA #>SCREEN_RAM + $00A0
        STA screenLineHiPtr
        LDA #<SCREEN_RAM + $00A0
        STA screenLineLoPtr
b8183   LDA #$00
        LDY #$26
b8187   STA (screenLineLoPtr),Y
        DEY 
        BNE b8187
        LDA screenLineHiPtr
        PHA 
        ; Draw the color values
        CLC 
        ADC #$D4
        STA screenLineHiPtr
        LDX a06
        LDA gridLineIntroSequenceColors,X
        LDY #$26
b819B   STA (screenLineLoPtr),Y
        DEY 
        BNE b819B
        LDA screenLineLoPtr
        ADC #$28
        STA screenLineLoPtr
        PLA 
        ADC #$00
        STA screenLineHiPtr
        INC a06
        LDA a06
        CMP #$08
        BNE b81B7
        LDA #$01
        STA a06
b81B7   DEC a07
        BNE b8183
        RTS 

;---------------------------------------------------------------------------------
; j81BC   
;---------------------------------------------------------------------------------
j81BC   
        LDA #$02
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$03
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        JSR PlayNote1
        JSR PlayNote2
        LDA #$00
        LDX #$08
b81D0   STA $1FFF,X
        DEX 
        BNE b81D0
        LDA #<$0113
        STA a08
        LDA #>$0113
        STA a09
b81DE   LDA a09
        STA a06
        LDA #$14
        SEC 
        SBC a08
        STA a07
        LDA $4000
        STA $D418    ;Select Filter Mode and Volume
        INC $4000
        LDA $4000
        CMP #$10
        BNE b81FC
        DEC $4000
b81FC   JSR DrawGridLineEntrySequence

        LDX #$00
b8201   LDA #$FF
        STA $2000,X
        TXA 
        PHA 
        LDA #<$1080
        STA currentXPosition
        LDA #>$1080
        STA currentYPosition
        JSR WasteXYCycles
        PLA 
        TAX 
        JSR WasteAFewCycles
        LDA #$00
        STA $2000,X
        INX 
        CPX #$08
        BNE b8201

        DEC a09
        BNE b822A
        LDA #$07
        STA a09
b822A   DEC a08
        BNE b81DE
        LDX #$08
b8230   LDA #$FF
        STA $1FFF,X
        TXA 
        PHA 
        LDA #<$10F0
        STA currentXPosition
        LDA #>$10F0
        STA currentYPosition
        JSR WasteXYCycles
        PLA 
        TAX 
        DEX 
        BNE b8230
        LDA #$66
        LDX #$00
b824B   STA COLOR_RAM + $0078,X
        STA COLOR_RAM + $0100,X
        STA COLOR_RAM + $0200,X
        STA COLOR_RAM + $0300,X
        INX 
        BNE b824B
        LDA #<p03
        STA a06
        LDA #>p03
        STA a07
        JSR PlayChord
        JSR PlayNote1
b8268   LDX #$60
        LDA #$0F
        STA $4000
b826F   STX $D408    ;Voice 2: Frequency Control - High-Byte
        LDY #$00
b8274   DEY 
        BNE b8274
        DEX 
        BNE b826F
        LDY #$08
b827C   LDX a07
        LDA $22D8,X
        STA $1FFF,Y
        INC a07
        DEY 
        BNE b827C
        LDA $4000
        SBC #$04
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        DEC a06
        BNE b8268

;---------------------------------------------------------------------------------
; EnterMainGameLoop   
;---------------------------------------------------------------------------------
EnterMainGameLoop   
        JSR s9300
        JSR PlayChord
        JSR DrawEnterZoneInterstitial
        LDA #$90
        STA $4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        JSR PlayNote3
        LDA #>$1514
        STA a0B
        LDA #<$1514
        STA a0A
        LDA #$09
        STA a06
b82B8   LDA #$0F
        SEC 
        SBC a06
        STA $D418    ;Select Filter Mode and Volume
        LDA a0A
        SEC 
        SBC a06
        STA currentXPosition
        LDA a0B
        SBC a06
        SEC 
        STA currentYPosition
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a0A
        CLC 
        ADC a06
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC a06
        DEC currentXPosition
        INC currentYPosition
        LDA #<$0317
        STA currentCharacter
        LDA #>$0317
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a0A
        SEC 
        SBC a06
        STA currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a06
        CLC 
        ADC #$01
        ASL 
        ASL 
        ASL 
        STA currentXPosition
        LDA #$00
        STA currentYPosition
        JSR WasteXYCycles
        LDA a06
        CMP #$00
        BNE b82B8
        JSR PlayChord
        LDA #$0F
        STA $4000
        JSR PlayNote2
        LDA #$03
        STA a06
b8326   LDA #$65
        CLC 
        ADC a06

        LDX #$00
b832D   STA COLOR_RAM + $0078,X
        STA COLOR_RAM + $0100,X
        STA COLOR_RAM + $0200,X
        STA COLOR_RAM + $0300,X
        DEX 
        BNE b832D
        LDA a0A
        STA currentXPosition
        LDA a0B
        STA currentYPosition
        LDA #<SCREEN_RAM + $0107
        STA currentCharacter
        LDA #>SCREEN_RAM + $0107
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$C0
        STA $4004
b8354   LDY #$00
b8356   DEY 
        BNE b8356
        DEC $4004
        LDA $4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        CMP #$80
        BNE b8354
        LDA $4000
        SBC #$05
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        DEC a06
        BNE b8326
        JSR s8167

        LDA #$00
        LDX #$20
b837C   STA $1320,X
        DEX 
        BNE b837C

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
        LDA #>$0301
        STA a15
        LDA #<$0301
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
        LDA #$0F
        STA $4000
        STA $D418    ;Select Filter Mode and Volume

MainGameLoop
        JSR ProcessJoystickInput
        JSR s8530
        JSR s85C6
        JSR s8699
        JSR s893E
        JSR s90E5
        JSR s850A
        JMP MainGameLoop

;-------------------------------------------------------------------------
; GetJoystickInput
;-------------------------------------------------------------------------
GetJoystickInput
        LDA $DC01    ;CIA1: Data Port Register B
        EOR #$1F
f83E2   =*+$01
        STA joystickInput
f83E3   RTS 

f83E4   .BYTE $02,$0D,$0E,$0F,$10,$11,$12,$0A
a83EC   .BYTE $08,$03,$04,$05,$06,$0A,$13,$14
        .BYTE $15
;-------------------------------------------------------------------------
; ProcessJoystickInput
;-------------------------------------------------------------------------
ProcessJoystickInput
        DEC a0E
        DEC a0E
        BEQ b8405
        LDA a0E
        CMP #$80
        BEQ b8402
        RTS 

b8402   JMP j84EB

b8405   JSR GetJoystickInput
        JSR s94A6
        LDA a0A
        STA currentXPosition
        CMP #$03
        BEQ b8417
        CMP #$25
        BNE b841D
b8417   LDA a41
        AND #$FB
        STA a41
b841D   LDA a0B
        STA currentYPosition
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA joystickInput
        AND #$01
        BEQ b843C
        DEC currentYPosition
        LDA currentYPosition
        CMP #$06
        BNE b843C
        INC currentYPosition
b843C   LDA joystickInput
        AND #$02
        BEQ b844C
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b844C
        DEC currentYPosition
b844C   LDA #$00
        STA a0C
        LDA joystickInput
        AND #$04
        BEQ b8464
        LDA #$01
        STA a0C
        DEC currentXPosition
        BNE b8464
        INC currentXPosition
        LDA #$00
        STA a0C
b8464   LDA joystickInput
        AND #$08
        BEQ b847C
        LDA #$02
        STA a0C
        INC currentXPosition
        LDA currentXPosition
        CMP #$27
        BNE b847C
        DEC currentXPosition
        LDA #$00
        STA a0C
b847C   JSR s882E
        LDA joystickInput
        AND #$10
        BEQ b84A2
        LDA a10
        BNE b84A2
        LDA a0A
        STA a11
        LDA a0B
        STA a12
        DEC a12
        LDA #$01
        STA a10
        LDA #$70
        STA $4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        JSR PlayNote3
b84A2   LDA a0C
        BNE b84B9

;-------------------------------------------------------------------------
; s84A6
;-------------------------------------------------------------------------
s84A6
        LDA a0A
        STA currentXPosition
        LDA a0B
        STA currentYPosition
        LDA #<SCREEN_RAM + $0107
        STA currentCharacter
        LDA #>SCREEN_RAM + $0107
        STA colorForCurrentCharacter
        JMP WriteCurrentCharacterToCurrentXYPos

b84B9   LDA a0B
        STA currentYPosition
        LDA #$05
        STA colorForCurrentCharacter
        LDA a0C
        CMP #$02
        BEQ b84D9
        LDA #$0B
        STA currentCharacter
        LDA a0A
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentCharacter
        INC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos

b84D9   LDA #$0C
        STA currentCharacter
        LDA a0A
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentCharacter
        DEC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos

j84EB   LDA a0C
        BNE b84F0
        RTS 

b84F0   JSR s84A6
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        INC currentXPosition
        LDA a0C
        CMP #$02
        BNE b8507
        DEC currentXPosition
        DEC currentXPosition
b8507   JMP WriteCurrentCharacterToCurrentXYPos

;-------------------------------------------------------------------------
; s850A
;-------------------------------------------------------------------------
s850A
        LDA #$06
        LDA lastKeyPressed
        CMP #$40
        BNE b8513
b8512   RTS 

b8513   LDA $028D
        AND #$07
        CMP #$07
        BEQ b852D
        CMP #$02
        BNE b8512
b8520   LDA lastKeyPressed
        CMP #$40
        BNE b8520
b8526   LDA lastKeyPressed
        CMP #$40
        BEQ b8526
        RTS 

b852D   JMP j94B6

;-------------------------------------------------------------------------
; s8530
;-------------------------------------------------------------------------
s8530
        DEC a13
        BEQ b8535
b8534   RTS 

b8535   LDA #$20
        STA a13
        LDA $4001
        BEQ b8551
        DEC $4001
        DEC $4001
        LDA $4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        BNE b8551
        LDA #$00
        STA $D404    ;Voice 1: Control Register
b8551   LDA a10
        BEQ b8534
        AND #$F0
        BEQ b856E
        CMP #$10
        BNE b8560
        JMP j9010

b8560   CMP #$20
        BNE b8567
        JMP j90A4

b8567   CMP #$30
        BNE b856E
        JMP j905F

b856E   LDA a10
        AND #$02
        BNE b8590
        LDA #$01
        STA colorForCurrentCharacter
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        JSR s8856
        LDA #$09
        STA currentCharacter
        LDA a10
        EOR #$02
        STA a10
        JMP WriteCurrentCharacterToCurrentXYPos

b8590   LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA #<$6600
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC a12
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b85B2
        LDA #$00
        STA a10
        RTS 

b85B2   LDA #>$0108
        STA colorForCurrentCharacter
        LDA #<$0108
        STA currentCharacter
        LDA a10
        EOR #$02
        STA a10
        JSR s8856
        JMP WriteCurrentCharacterToCurrentXYPos

;-------------------------------------------------------------------------
; s85C6
;-------------------------------------------------------------------------
s85C6
        LDA a0E
        CMP #$30
        BEQ b85CD
b85CC   RTS 

b85CD   DEC a16
        BNE b85CC
        JSR s88AE
        LDA #$02
        STA a16
        JSR s93F3
        JSR s8794
        LDA a17
        BNE b8616
        LDA #<$033C
        STA currentCharacter
        LDA #>$033C
        STA colorForCurrentCharacter
        LDA #$00
        STA currentXPosition
        LDA a15
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentCharacter
        INC currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #<$3A16
        STA currentYPosition
        LDA #>$3A16
        STA currentCharacter
        LDA a14
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        INC currentCharacter
        LDA #$01
        STA a17
        JMP WriteCurrentCharacterToCurrentXYPos

b8616   LDA #$20
        STA currentCharacter
        LDA #$00
        STA currentXPosition
        LDA a15
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$16
        STA currentYPosition
        LDA a14
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC a14
        LDA a14
        CMP #$27
        BNE b8646
        LDA #$01
        STA a14
b8646   INC a15
        LDA a15
        CMP #$16
        BNE b8652
        LDA #$03
        STA a15
b8652   LDA #$00
        STA a17
        LDA #$03
        STA colorForCurrentCharacter
        LDA a14
        STA currentXPosition
        LDA #$02
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$00
        STA currentXPosition
        LDA a15
        STA currentYPosition
        LDA #$01
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a36
        AND #$80
        BEQ b8684
        LDA a14
        CMP a0A
        BNE b8684
        LDA #$01
        STA a18
b8684   LDA a18
        BEQ b869F
        DEC a18
        BNE b869F
        LDA a14
        STA a1B
        LDA a15
        STA a1C
        LDA #$01
        STA a1A
        RTS 

;-------------------------------------------------------------------------
; s8699
;-------------------------------------------------------------------------
s8699
        LDA a13
        CMP #$02
        BEQ b86A0
b869F   RTS 

b86A0   JSR s88B8
        JSR s8CDB
        LDA a18
        BNE b869F
        LDA a1A
        CMP a1B
        BEQ b86DF
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA a1A
        STA currentXPosition
        LDA a1C
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC a1A
        INC currentXPosition
        JMP j86CD

b86CA   JMP j94D3

j86CD   LDA #$01
        STA colorForCurrentCharacter
        INC a1D
        LDA a1D
        AND #$01
        CLC 
        ADC #$03
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
b86DF   LDA #$15
        STA currentYPosition
        LDA a1B
        STA currentXPosition
        LDA a1D
        AND #$01
        CLC 
        ADC #$05
        STA currentCharacter
b86F0   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b86F0
        LDA a1B
        CMP a0A
        BEQ b86CA
        LDA a1A
        CMP a1B
        BEQ b8708
        RTS 

b8708   LDA #$15
        STA currentYPosition
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA #<$6600
        STA currentCharacter
        LDA a1B
        STA currentXPosition
b8718   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b8718
        LDA a1C
        STA currentYPosition
        LDA #>SCREEN_RAM + $030F
        STA colorForCurrentCharacter
        LDA #<SCREEN_RAM + $030F
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a19
        STA a18
        LDA #<SCREEN_RAM + $00A0
        STA a06
        LDA #>SCREEN_RAM + $00A0
        STA a07
        LDA a41
        ORA #$08
        STA a41
        LDY #$00
b8746   LDA (p06),Y
        BEQ b874D
        JSR s875A
b874D   INC a06
        BNE b8746
        INC a07
        LDA a07
        CMP #$08
        BNE b8746
        RTS 

;-------------------------------------------------------------------------
; s875A
;-------------------------------------------------------------------------
s875A
        CMP #$20
        BNE b875F
        RTS 

b875F   LDX #$07
b8761   CMP f83E3,X
        BEQ b876A
        DEX 
        BNE b8761
        RTS 

b876A   LDA f83E4,X
        STA (p06),Y
        LDA a41
        AND #$F7
        STA a41
        CPX #$07
        BEQ b877A
        RTS 

b877A   LDX #$20
b877C   LDA $1320,X
        BEQ b8789
        DEX 
        BNE b877C
        LDA #$0D
        STA (p06),Y
        RTS 

b8789   LDA a06
        STA $1300,X
        LDA a07
        STA $1320,X
        RTS 

;-------------------------------------------------------------------------
; s8794
;-------------------------------------------------------------------------
s8794
        LDX #$20
b8796   LDA $1320,X
        BEQ b879E
        JSR s87AA
b879E   DEX 
        BNE b8796
f87A1   RTS 

        .BYTE $07,$0B,$0C
f87A5   .BYTE $0C,$20,$02,$3A,$3B
;-------------------------------------------------------------------------
; s87AA
;-------------------------------------------------------------------------
s87AA
        STX a08
        LDA $1300,X
        STA a06
        LDA $1320,X
        STA a07
        LDY #$00
        TYA 
        STA (p06),Y
        LDA a07
        PHA 
        CLC 
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
b87DB   CMP f87A1,X
        BNE b87E3
        JMP b86CA

b87E3   CMP f87A5,X
        BEQ b8807
        DEX 
        BNE b87DB
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
        STA $1300,X
        PLA 
        STA $1320,X
        RTS 

b8807   LDX a08
        LDA #$00
        STA $1320,X
        RTS 

b880F   JSR GetCharacterAtCurrentXYPos
        BEQ b8825
        LDX a83EC
b8817   CMP a83EC,X
        BEQ b8822
        DEX 
        BNE b8817
        STX a0C
        RTS 

b8822   JMP b86CA

b8825   LDA currentXPosition
        STA a0A
        LDA currentYPosition
        STA a0B
        RTS 

;-------------------------------------------------------------------------
; s882E
;-------------------------------------------------------------------------
s882E
        LDA currentXPosition
        CMP a0A
        BEQ b880F
        LDA currentYPosition
        CMP a0B
        BEQ b880F
        LDA currentXPosition
        PHA 
        LDA a0A
        STA currentXPosition
        JSR GetCharacterAtCurrentXYPos
        BNE b884C
        PLA 
        STA currentXPosition
        JMP b880F

b884C   LDA a0B
        STA currentYPosition
        PLA 
        STA currentXPosition
        JMP b880F

;-------------------------------------------------------------------------
; s8856
;-------------------------------------------------------------------------
s8856
        JSR GetCharacterAtCurrentXYPos
        CMP #$08
        BEQ b8893
        LDX #$07
b885F   CMP f83E3,X
        BEQ b886A
        DEX 
        BNE b885F
        JMP j8B81

b886A   LDA f83E2,X
        STA currentCharacter
        LDA #$07
        STA colorForCurrentCharacter
        CPX #$02
        BNE b888A
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        LDX #$06
        LDY #$01
        JSR IncreaseScore
        LDA #$04
        STA a1E
b888A   JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$00
        STA a10
        PLA 
        PLA 
b8893   RTS 

;-------------------------------------------------------------------------
; IncreaseScore
;-------------------------------------------------------------------------
IncreaseScore
        TXA 
        PHA 
b8896   INC SCREEN_RAM + $0009,X
        LDA SCREEN_RAM + $0009,X
        CMP #$3A
        BNE b88A8
        LDA #$30
        STA SCREEN_RAM + $0009,X
        DEX 
        BNE b8896
b88A8   PLA 
        TAX 
        DEY 
        BNE IncreaseScore
        RTS 

;-------------------------------------------------------------------------
; s88AE
;-------------------------------------------------------------------------
s88AE
        LDA $2109
        ROL 
        ADC #$00
        STA $1509
        RTS 

;-------------------------------------------------------------------------
; s88B8
;-------------------------------------------------------------------------
s88B8
        JSR s88FD
        LDA a1E
        BNE b88C0
        RTS 

b88C0   LDA $4003
        CMP #$16
        BNE b88DD
        LDA a1E
        ASL 
        ASL 
        CLC 
        ADC a1E
        STA $D418    ;Select Filter Mode and Volume
        LDA #$10
        STA $4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        JSR PlayNote1
        RTS 

b88DD   INC $4003
        LDA $4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        CMP #$16
        BEQ b88EB
b88EA   RTS 

b88EB   DEC a1E
        BNE b88EA
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        STA $4003
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        RTS 

;-------------------------------------------------------------------------
; s88FD
;-------------------------------------------------------------------------
s88FD
        LDA a3D
        BNE b892A
        LDA a39
        BNE b8906
        RTS 

b8906   LDA $4004
        CMP #$30
        BEQ b8917
        DEC $4004
        LDA $4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        RTS 

b8917   DEC a39
        BEQ b8924
        LDA #$40
        STA $4004
        JSR PlayNote2
        RTS 

b8924   LDA #$00
        STA $D412    ;Voice 3: Control Register
b8929   RTS 

b892A   DEC a3D
        LDA a3D
        STA $D418    ;Select Filter Mode and Volume
        BNE b8929
        LDA #$00
        STA $D412    ;Voice 3: Control Register
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

;-------------------------------------------------------------------------
; s893E
;-------------------------------------------------------------------------
s893E
        DEC a22
        LDA a22
        CMP #$01
        BEQ b8947
b8946   RTS 

b8947   LDA #$C0
        STA a22
        JSR s8F3D
        LDA a25
        BNE b8955
        JMP j89CC

b8955   LDA a26
        BEQ b8946
        CMP #$01
        BEQ b8962
        DEC a26
        JMP j89CC

b8962   LDA a24
        CMP a23
        BNE b89A3
        INC a28
        LDX a28
        LDA #$03
        STA $1980,X
        LDA $D012    ;Raster Position
        AND #$01
        BEQ b8985
        LDA #$1A
        STA $1900,X
        LDA #$81
        STA $1A00,X
        JMP j898F

b8985   LDA #$1C
        STA $1900,X
        LDA #$80
        STA $1A00,X
j898F   LDA a3F
        AND #$80
        BEQ b89A3
        LDA a25
        AND #$01
        BEQ b89A3
        LDA $1A00,X
        ORA #$04
        STA $1A00,X
b89A3   INC a28
        LDX a28
        LDA #$1B
        STA $1900,X
        LDA #$03
        STA $1980,X
        LDA #$00
        STA $1A00,X
        DEC a24
        BEQ b89BD
        JMP j89CC

b89BD   LDA #$40
        STA $1A00,X
        LDA a27
        STA a26
        LDA a23
        STA a24
        DEC a25
j89CC   INC a29
        LDA a29
        CMP #$15
        BNE b89D8
        LDA #$13
        STA a29
b89D8   LDX a28
        LDA a28
        BNE b89DF
        RTS 

b89DF   LDA $1A00,X
        AND #$80
        BNE b89E9
        JMP j8A92

b89E9   JSR s8C73
        LDA $1A00,X
        AND #$04
        BEQ b89F6
        JMP j8AE2

b89F6   LDA $1900,X
        STA currentXPosition
        LDA $1980,X
        STA currentYPosition
        LDA $1A00,X
        AND #$40
        BEQ b8A16
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
b8A16   LDA $1A00,X
        AND #$01
        BEQ b8A21
        DEC currentXPosition
        DEC currentXPosition
b8A21   INC currentXPosition
        LDA currentXPosition
        BEQ b8A2E
        CMP #$27
        BEQ b8A2E
        JMP j8A31

b8A2E   JMP j8A6E

j8A31   STX a07
        JSR GetCharacterAtCurrentXYPos
        LDX a07
        CMP #$00
        BEQ b8A4E
        CMP #$07
        BEQ b8A4B
        CMP #$0B
        BEQ b8A4B
        CMP #$0C
        BEQ b8A4B
        JMP j8A6E

b8A4B   JMP b86CA

b8A4E   LDA currentXPosition
        STA $1900,X
        LDA currentYPosition
        STA $1980,X
        LDA #$03
        STA colorForCurrentCharacter
        LDA a29
        STA currentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
j8A67   DEX 
        BEQ b8A6D
        JMP b89DF

b8A6D   RTS 

j8A6E   INC currentYPosition
        LDA $1900,X
        STA currentXPosition
        LDA $1A00,X
        EOR #$01
        STA $1A00,X
        LDA currentYPosition
        CMP #$15
        BNE b8A4E
        DEC currentYPosition
        LDA $1A00,X
        EOR #$01
        ORA #$06
        STA $1A00,X
        JMP b8A4E

j8A92   LDA $1900,X
        STA currentXPosition
        LDA $1980,X
        STA currentYPosition
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA $1A00,X
        AND #$40
        BEQ b8AB2
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
b8AB2   LDA $18FF,X
        STA $1900,X
        STA currentXPosition
        LDA $197F,X
        STA $1980,X
        STA currentYPosition
        STX a07
        JSR GetCharacterAtCurrentXYPos
        LDX a07
        CMP #$07
        BNE b8AD0
        JMP b86CA

b8AD0   LDA #>$0313
        STA colorForCurrentCharacter
        LDA #<$0313
        STA currentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        JMP j8A67

j8AE2   LDA $1900,X
        STA currentXPosition
        LDA $1980,X
        STA currentYPosition
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA $1A00,X
        AND #$40
        BEQ b8B02
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
b8B02   LDA $1A00,X
        STA a08
        AND #$01
        BEQ b8B0F
        DEC currentXPosition
        DEC currentXPosition
b8B0F   INC currentXPosition
        LDA a08
        AND #$02
        BEQ b8B1B
        DEC currentYPosition
        DEC currentYPosition
b8B1B   INC currentYPosition
        STX a07
        JSR GetCharacterAtCurrentXYPos
        LDX a07
        CMP #$07
        BEQ b8B37
        CMP #$0B
        BEQ b8B37
        CMP #$0C
        BNE b8B3A
        CMP #$00
        BEQ b8B3A
        JMP j8B5A

b8B37   JMP b86CA

b8B3A   LDA #$00
        STA a09
        LDA currentXPosition
        BEQ j8B5A
        CMP #$27
        BEQ j8B5A
j8B46   LDA currentYPosition
        CMP #$02
        BEQ b8B6D
        CMP #$16
        BEQ b8B6D
j8B50   LDA a09
        BNE b8B57
        JMP b8A4E

b8B57   JMP b8B02

j8B5A   LDA a08
        EOR #$01
        STA $1A00,X
        LDA $1980,X
        STA currentYPosition
        LDA #$01
        STA a09
        JMP j8B46

b8B6D   LDA $1A00,X
        EOR #$02
        STA $1A00,X
        LDA $1900,X
        STA currentXPosition
        LDA #$01
        STA a09
        JMP j8B50

j8B81   CMP #$13
        BEQ b8B90
        CMP #$14
        BEQ b8B90
        CMP #$15
        BEQ b8B90
        JMP j8E68

b8B90   PHA 
        LDA currentYPosition
        CMP #$03
        BNE b8BA1
        LDA a24
        CMP a23
        BEQ b8BA1
        PLA 
        JMP j8E68

b8BA1   PLA 
        LDX a28
b8BA4   LDA $1900,X
        CMP currentXPosition
        BEQ b8BAF
b8BAB   DEX 
        BNE b8BA4
        RTS 

b8BAF   LDA $1980,X
        CMP currentYPosition
        BNE b8BAB
        LDA a10
        AND #$30
        BEQ b8BC2
        LDA a41
        ORA #$80
        STA a41
b8BC2   LDA #$00
        STA a10
        LDA #$04
        STA a39
        LDA #$36
        STA $4004
        JSR PlayNote2
        LDA $1A00,X
        AND #$C0
        CMP #$C0
        BNE b8BE2
        LDA #$04
        STA a08
        JMP j8C43

b8BE2   CMP #$40
        BNE b8BF6
        LDA $1A00,X
        ORA $19FF,X
        STA $19FF,X
        LDA #$01
        STA a08
        JMP j8C43

b8BF6   CMP #$80
        BEQ b8C2A
        STX a07
b8BFC   DEX 
        LDA $1A00,X
        AND #$80
        BEQ b8BFC
        LDA $1A00,X
        LDX a07
        ORA $1A01,X
        STA $1A01,X
        AND #$04
        BEQ b8C1B
        LDA $1A01,X
        EOR #$01
        STA $1A01,X
b8C1B   LDA #$01
        STA a08
        LDA #$40
        ORA $19FF,X
        STA $19FF,X
        JMP j8C43

b8C2A   LDA $1A00,X
        ORA $1A01,X
        STA $1A01,X
        AND #$04
        BEQ b8C3F
        LDA $1A01,X
        EOR #$01
        STA $1A01,X
b8C3F   LDA #$04
        STA a08
j8C43   LDA $1901,X
        STA $1900,X
        LDA $1981,X
        STA $1980,X
        LDA $1A01,X
        STA $1A00,X
        CPX a28
        BEQ b8C5D
        INX 
        JMP j8C43

b8C5D   DEC a28
        LDX #$05
        LDY a08
        JSR IncreaseScore
        LDA #>SCREEN_RAM + $030E
        STA colorForCurrentCharacter
        LDA #<SCREEN_RAM + $030E
        STA currentCharacter
        PLA 
        PLA 
        JMP WriteCurrentCharacterToCurrentXYPos

;-------------------------------------------------------------------------
; s8C73
;-------------------------------------------------------------------------
s8C73
        LDA a2A
        CMP #$02
        BPL b8C7A
b8C79   RTS 

b8C7A   DEC a2B
        BEQ b8C94
        LDA a2A
        CMP currentCharacter
        BMI b8C79
        LDA $1900,X
        CMP a0A
        BNE b8C79
        DEC a2D
        BEQ b8C90
b8C8F   RTS 

b8C90   LDA a2E
        STA a2D
b8C94   LDA a2C
        STA a2B
        LDA a0B
        SEC 
        SBC $1980,X
        BVS b8C8F
        CMP #$04
        BMI b8C8F
        STX a07
        LDX #$20
b8CA8   LDA $1320,X
        BEQ b8CB1
        DEX 
        BNE b8CA8
        RTS 

b8CB1   STX a08
        LDX a07
        LDA $1900,X
        STA currentXPosition
        LDA $1980,X
        STA currentYPosition
        STX a07
        JSR GetLinePtrForCurrentYPosition
        TYA 
        CLC 
        ADC screenLineLoPtr
        STA screenLineLoPtr
        LDA screenLineHiPtr
        ADC #$00
        LDX a08
        STA $1320,X
        LDA screenLineLoPtr
        STA $1300,X
        LDX a07
        RTS 

;-------------------------------------------------------------------------
; s8CDB
;-------------------------------------------------------------------------
s8CDB
        DEC a2F
        BEQ b8CE0
        RTS 

b8CE0   LDA a30
        STA a2F
        LDA a23
        BNE b8CEB
        JSR ReduceScore
b8CEB   LDA a32
        BNE b8CF0
        RTS 

b8CF0   LDA a34
        BNE b8CF7
        JMP j8D20

b8CF7   DEC a32
        BEQ b8CFE
        JMP j8D20

b8CFE   LDA a33
        STA a32
        INC a31
        LDX a31
        LDA #$03
        STA $1B00,X
        LDA $D012    ;Raster Position
        AND #$0F
        CLC 
        ADC #$04
        STA $1A80,X
        LDA $D012    ;Raster Position
        AND #$40
        STA $1B80,X
        DEC a34
j8D20   LDX a31
        CPX #$00
        BNE b8D27
        RTS 

b8D27   LDA $1B80,X
        AND #$20
        BEQ b8D31
        JMP j8EF0

b8D31   LDA $1B80,X
        AND #$01
        BEQ b8D3B
        JMP j8DF4

b8D3B   LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA $1A80,X
        STA currentXPosition
        LDA $1B00,X
        STA currentYPosition
        LDA $1B80,X
        AND #$40
        BEQ b8D58
        INC currentXPosition
        INC currentXPosition
b8D58   DEC currentXPosition
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
j8D61   LDA $1A80,X
        STA currentXPosition
        LDA #>SCREEN_RAM + $035E
        STA colorForCurrentCharacter
        LDA #<SCREEN_RAM + $035E
        STA currentCharacter
        LDA $1B80,X
        AND #$40
        BEQ b8D79
        LDA #$61
        STA currentCharacter
b8D79   STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        LDA $1B80,X
        AND #$40
        BEQ b8D8B
        DEC currentXPosition
        DEC currentXPosition
b8D8B   INC currentXPosition
        JSR GetCharacterAtCurrentXYPos
        BEQ b8DD9
        LDX a07
        LDA $1A80,X
        STA currentXPosition
        INC currentYPosition
        LDA $1B80,X
        EOR #$40
        STA $1B80,X
        LDA $1A80,X
        STA currentXPosition
        DEC currentYPosition
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        INC $1B00,X
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b8DD6
        LDA a28
        BNE b8DD0
        LDA a25
        BNE b8DD0
        LDA a41
        ORA #$02
        STA a41
b8DD0   JSR s8E33
        JMP j8DE5

b8DD6   JMP j8D61

b8DD9   LDA currentXPosition
        LDX a07
        STA $1A80,X
        LDA currentYPosition
        STA $1B00,X
j8DE5   LDA $1B80,X
        EOR #$01
        STA $1B80,X
        DEX 
        BEQ b8DF3
        JMP b8D27

b8DF3   RTS 

j8DF4   LDA #$07
        STA colorForCurrentCharacter
        LDA $1A80,X
        STA currentXPosition
        LDA $1B00,X
        STA currentYPosition
        LDA $1B80,X
        AND #$40
        BNE b8E1E
        LDA #$60
        STA currentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        JMP j8DE5

b8E1E   LDA #$63
        STA currentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        JMP j8DE5

;-------------------------------------------------------------------------
; s8E33
;-------------------------------------------------------------------------
s8E33
        STX a07
j8E35   LDA $1A81,X
        STA $1A80,X
        LDA $1B01,X
        STA $1B00,X
        LDA $1B81,X
        STA $1B80,X
        CPX a31
        BEQ b8E4F
        INX 
        JMP j8E35

b8E4F   LDX a07
        DEC a31
        LDA a23
        BEQ b8E61
        LDA a34
        BNE b8E61
        LDA a41
        ORA #$40
        STA a41
b8E61   RTS 

        .TEXT "^_`ab"
        .BYTE $63
j8E68   LDX #$06
b8E6A   CMP b8E61,X
        BEQ b8E75
        DEX 
        BNE b8E6A
        JMP j913B

b8E75   CMP #$62
        BNE b8E7B
        DEC currentXPosition
b8E7B   CMP #$5F
        BNE b8E81
        INC currentXPosition
b8E81   CMP #$5E
        BNE b8E87
        INC currentXPosition
b8E87   CMP #$61
        BNE b8E8D
        DEC currentXPosition
b8E8D   LDX a31
        LDA currentXPosition
b8E91   CMP $1A80,X
        BEQ b8E9A
b8E96   DEX 
        BNE b8E91
        RTS 

b8E9A   LDA currentYPosition
        CMP $1B00,X
        BNE b8E96
        LDA #$00
        STA a10
        STX a07
        LDX #$05
        LDY #$01
        JSR IncreaseScore
        LDX #$07
        LDY #$06
        JSR IncreaseScore
        LDX a07
        LDA #$04
        STA a39
        LDA #$36
        STA $4004
        JSR PlayNote2
        LDA $1B80,X
        AND #$40
        BNE b8ED7
        LDA $1A80,X
        CMP #$01
        BEQ b8EE8
        DEC $1A80,X
        JMP b8EE8

b8ED7   LDA currentXPosition
        STA $1A80,X
        JMP b8EE8

        .BYTE $80,$1B
        AND #$01
        BEQ b8EE8
        INC $1A80,X
b8EE8   LDA #$2F
        STA $1B80,X
        PLA 
        PLA 
        RTS 

j8EF0   LDA $1A80,X
        STA currentXPosition
        LDA $1B00,X
        STA currentYPosition
        LDA $1B80,X
        AND #$0F
        BEQ b8F27
        AND #$07
        STA colorForCurrentCharacter
        LDA $1B80,X
        SEC 
        SBC #$01
        STA $1B80,X
        LDA #$64
        STA currentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentCharacter
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
j8F1E   LDX a07
        DEX 
        BEQ b8F26
        JMP b8D27

b8F26   RTS 

b8F27   JSR s8E33
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA #<$6600
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j8F1E

;-------------------------------------------------------------------------
; s8F3D
;-------------------------------------------------------------------------
s8F3D
        LDA a37
        BEQ b8F45
        DEC a37
        BEQ b8F46
b8F45   RTS 

b8F46   LDA a38
        STA a37
        LDA a36
        EOR #$01
        STA a36
        AND #$80
        BEQ b8F57
        JMP j8FEA

b8F57   LDA #$02
        STA currentYPosition
        LDA #$01
        STA colorForCurrentCharacter
        LDA a35
        STA currentXPosition
        LDA a36
        AND #$40
        BNE b8F8F
        LDA #$20
        STA currentCharacter
        DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA #$66
        STA currentCharacter
        LDA a36
        AND #$01
        BEQ b8F82
        LDA #$68
        STA currentCharacter
b8F82   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        INC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j8FB4

b8F8F   LDA #$20
        STA currentCharacter
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        LDA #$6B
        STA currentCharacter
        LDA a36
        AND #$01
        BEQ b8FA8
        LDA #$6D
        STA currentCharacter
b8FA8   DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
j8FB4   LDA a36
        AND #$01
        BEQ b8FC7
        LDA a36
        AND #$40
        BNE b8FC4
        INC a35
        INC a35
b8FC4   DEC a35
        RTS 

b8FC7   LDA a35
        CMP a0A
        BNE b8FD2
        LDA #$80
        STA a36
b8FD1   RTS 

b8FD2   BMI b8FDF
        LDA a36
        AND #$40
        BNE b8FD1
        LDA #$41
        STA a36
b8FDE   RTS 

b8FDF   LDA a36
        AND #$40
        BEQ b8FDE
        LDA #$01
        STA a36
        RTS 

j8FEA   LDA a36
        AND #$01
        CLC 
        ADC #$6E
        STA currentCharacter
        LDA #$01
        STA colorForCurrentCharacter
        LDA #$02
        STA currentYPosition
        LDA a35
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a35
        CMP a0A
        BNE b9009
        RTS 

b9009   LDA #$00
        STA a36
        JMP b8FC7

j9010   LDA a10
        AND #$02
        BNE b902F
        LDA #>$0171
        STA colorForCurrentCharacter
        LDA #<$0171
        STA currentCharacter
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
j9026   LDA a10
        EOR #$02
        STA a10
        JMP WriteCurrentCharacterToCurrentXYPos

b902F   LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$27
        BNE b904F
        LDA #$00
        STA a10
        RTS 

b904F   INC a11
        LDA #>$0170
        STA colorForCurrentCharacter
        LDA #<$0170
        STA currentCharacter
        JSR s8856
        JMP j9026

j905F   LDA a10
        AND #$02
        BNE b9078
        LDA #>$0170
        STA colorForCurrentCharacter
        LDA #<$0170
        STA currentCharacter
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        JMP j9026

b9078   LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        DEC a11
        BNE b9096
        LDA #$00
        STA a10
        RTS 

b9096   LDA #>$0171
        STA colorForCurrentCharacter
        LDA #<$0171
        STA currentCharacter
        JSR s8856
        JMP j9026

j90A4   LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        LDA a10
        AND #$02
        BNE b90BD
        LDA #>$0108
        STA colorForCurrentCharacter
        LDA #<$0108
        STA currentCharacter
        JMP j9026

b90BD   LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b90D5
        LDA #$00
        STA a10
        RTS 

b90D5   INC a12
        LDA #>$0109
        STA colorForCurrentCharacter
        LDA #<$0109
        STA currentCharacter
        JSR s8856
        JMP j9026

;-------------------------------------------------------------------------
; s90E5
;-------------------------------------------------------------------------
s90E5
        DEC a3A
        BEQ b90EA
        RTS 

b90EA   LDA #$80
        STA a3A
        INC a3C
        LDX a3B
        CPX #$00
        BNE b90F7
        RTS 

b90F7   LDA #$00
        STA a07
        LDA $1D00,X
        AND #$30
        TAY 
        LDA #$72
        CPY #$10
        BNE b9109
        LDA #$75
b9109   CPY #$20
        BNE b910F
        LDA #$78
b910F   CLC 
        ADC a07
        STA currentCharacter
        LDA a3C
        AND #$07
        STA colorForCurrentCharacter
        LDA $1C00,X
        STA currentXPosition
        LDA $1C80,X
        STA currentYPosition
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        DEX 
        BNE b90F7
f912E   RTS 

        .BYTE $72,$73
f9131   .BYTE $74,$75,$76
f9134   .BYTE $77,$78,$79
f9137   .BYTE $7A,$07,$0B,$0C
;---------------------------------------------------------------------------------
; j913B   
;---------------------------------------------------------------------------------
j913B   
        LDX #$03
b913D   CMP f912E,X
        BEQ b916B
        CMP f9131,X
        BEQ b9187
        CMP f9134,X
        BEQ b9158
        CMP f9137,X
        BNE b9154
        JMP b86CA

b9154   DEX 
        BNE b913D
b9157   RTS 

b9158   LDA a10
        AND #$10
        BNE b9157
        LDA a10
        EOR #$20
        STA a10
        CPX #$01
        BNE b9157
        JMP j9197

b916B   LDA a10
        AND #$30
        STA a07
        LDA #$50
        SEC 
        SBC a07
        AND #$30
        STA a07
j917A   LDA a10
        AND #$8F
        ORA a07
        STA a10
        CPX #$01
        BEQ j9197
        RTS 

b9187   LDA a10
        AND #$30
        STA a07
        LDA #$30
        SEC 
        SBC a07
        STA a07
        JMP j917A

j9197   LDX a3B
b9199   LDA currentXPosition
        CMP $1C00,X
        BEQ b91A4
b91A0   DEX 
        BNE b9199
        RTS 

b91A4   LDA currentYPosition
        CMP $1C80,X
        BNE b91A0
        LDA $1D00,X
        JSR s91C5
        STA $1D00,X
        LDA #$0F
        STA a3D
        LDA #$90
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JSR PlayNote2
        LDA #$00
        STA a39
        RTS 

;-------------------------------------------------------------------------
; s91C5
;-------------------------------------------------------------------------
s91C5
        AND #$30
        CMP #$20
        BEQ b91DA
        CMP #$10
        BEQ b91D5
        LDA #$1F
        STA $1D00,X
        RTS 

b91D5   LDA #$0F
        STA $1D00,X
b91DA   LDA $1D00,X
        RTS 

;---------------------------------------------------------------------------------
; j91DE   
;---------------------------------------------------------------------------------
j91DE   
        LDX a3E
        STX a3B
b91E2   LDA f91F7,X
        STA $1C00,X
        LDA f9213,X
        STA $1C80,X
        LDA f922F,X
        STA $1D00,X
        DEX 
        BNE b91E2
        RTS 

f91F7 = *-$01
        .BYTE $13,$14,$13,$14,$01,$04,$07,$0A
        .BYTE $26,$23,$20,$1D,$13,$14,$07,$20
        .BYTE $05,$05,$22,$22,$02,$04,$06,$08
        .BYTE $26,$24,$22
f9213   .BYTE $20,$0D,$0D,$0E,$0E,$0A,$0A,$0A
        .BYTE $0A,$0A,$0A,$0A,$0A,$06,$06,$06
        .BYTE $06,$0E,$15,$0E,$15,$08,$08,$08
        .BYTE $08,$08,$08,$08
f922F   .BYTE $08,$1F,$0F,$0F,$1F,$1F,$0F,$1F
        .BYTE $0F,$0F,$1F,$0F,$1F,$2F,$2F,$2F
        .BYTE $2F,$0F,$1F,$1F,$0F,$2F,$2F,$2F
        .BYTE $2F,$2F,$2F,$2F
f924B   .BYTE $2F,$01,$02,$03,$00,$02,$02,$02
        .BYTE $02,$00,$03,$03,$03,$02,$03,$03
        .BYTE $00,$03,$03,$03
f925F   .BYTE $03,$06,$06,$06,$00,$07,$07,$07
        .BYTE $07,$00,$08,$08,$08,$09,$0A,$0B
        .BYTE $00,$0B,$0B,$0C
f9273   .BYTE $0D,$00,$00,$00,$14,$00,$08,$09
        .BYTE $00,$19,$0A,$00,$0B,$0C,$00,$0F
        .BYTE $1E,$00,$14,$14
f9287   .BYTE $14,$00,$00,$00,$06,$00,$06,$06
        .BYTE $00,$04,$06,$00,$04,$04,$00,$04
        .BYTE $03,$00,$04,$03
f929B   .BYTE $03,$00,$00,$00,$04,$00,$07,$07
        .BYTE $00,$03,$06,$00,$05,$05,$00,$04
        .BYTE $03,$00,$03,$03
f92AF   .BYTE $03,$10,$0F,$0E,$0D,$0D,$0D,$0C
        .BYTE $0C,$0B,$0B,$0A,$09,$09,$08,$09
        .BYTE $08,$07,$07,$06
f92C3   .BYTE $06,$00,$00,$04,$04,$03,$03,$03
        .BYTE $03,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02
f92D7   .BYTE $02,$00,$00,$00,$00,$04,$00,$00
        .BYTE $0C,$00,$00,$10,$00,$00,$14,$00
        .BYTE $00,$00,$1C,$00
f92EB   .BYTE $1C,$00,$00,$00,$01,$01,$00,$82
        .BYTE $01,$01,$00,$01,$82,$00,$01,$82
        .BYTE $82,$00,$01,$82,$82
;-------------------------------------------------------------------------
; s9300
;-------------------------------------------------------------------------
s9300
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
        LDA f92D7,X
        STA a3E
        LDA f92EB,X
        STA a3F
        JMP j91DE

;-------------------------------------------------------------------------
; s933C
;-------------------------------------------------------------------------
s933C
        LDA #$02
        STA currentYPosition
        JSR s9469
        LDA #$20
        STA currentCharacter
b9347   LDA #$00
        STA currentXPosition
b934B   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$28
        BNE b934B
        INC currentYPosition
        LDA currentYPosition
        CMP #$17
        BNE b9347
        LDA #>p03
        STA currentCharacter
        LDA #<p03
        STA currentYPosition
        LDA #$66
        STA colorForCurrentCharacter
b936A   LDA #$01
        STA currentXPosition
b936E   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$27
        BNE b936E
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b936A
        RTS 

;-------------------------------------------------------------------------
; DrawEnterZoneInterstitial
;-------------------------------------------------------------------------
DrawEnterZoneInterstitial
        JSR s933C
        LDA #<$200B
        STA currentYPosition
        LDA #>$200B
        STA currentCharacter
b938D   LDA #$0D
        STA currentXPosition
b9391   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$1C
        BNE b9391
        INC currentYPosition
        LDA currentYPosition
        CMP #$0E
        BNE b938D
        LDA #<$0C0E
        STA currentXPosition
        LDA #>$0C0E
        STA currentYPosition
        JSR GetLinePtrForCurrentYPosition

        LDX #$00
        LDA #$01
        STA colorForCurrentCharacter
b93B5   LDA txtEnterZoneXX,X
        STA currentCharacter
        STX a0A
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a0A
        INC currentXPosition
        INX 
        CPX #$0D
        BNE b93B5

        DEC currentXPosition
        DEC currentXPosition
        JSR GetLinePtrForCurrentYPosition
        INY 

        LDX a2A
b93D2   LDA (screenLineLoPtr),Y
        CLC 
        ADC #$01
        STA (screenLineLoPtr),Y
        CMP #$3A
        BNE b93EA
        LDA #$30
        STA (screenLineLoPtr),Y
        DEY 
        LDA (screenLineLoPtr),Y
        CLC 
        ADC #$01
        STA (screenLineLoPtr),Y
        INY 
b93EA   DEX 
        BNE b93D2
        JMP j941F

;-------------------------------------------------------------------------
; s93F0
;-------------------------------------------------------------------------
s93F0
        JSR WasteAFewCycles
;-------------------------------------------------------------------------
; s93F3
;-------------------------------------------------------------------------
s93F3
        LDA $2007
        STA a50
        LDX #$07
b93FA   LDA $1FFF,X
        STA $2000,X
        DEX 
        BNE b93FA
        LDA a50
        STA $2000
        LDA a3F
        AND #$80
        BEQ b9411
        JMP j9496

b9411   RTS 

txtEnterZoneXX   .TEXT "ENTER ZONE 00"
;---------------------------------------------------------------------------------
; j941F   
;---------------------------------------------------------------------------------
j941F   
        LDA #$0F
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayChord
        LDA #$E8
        STA $4001
        JSR PlayNote1
b9432   LDA $4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        STA $4002
b943B   JSR s93F0
        INC $4002
        LDA $4002
        SBC #$E0
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA $4002
        BNE b943B
        INC $4001
        BNE b9432
        JSR PlayChord
        JMP s933C

f9458   =*-$01
        .TEXT "0000", $FF, "00"
f9460   .BYTE $30,$00,$00,$3C,$3C,$3C,$3C,$00
        .BYTE $00
;-------------------------------------------------------------------------
; s9469
;-------------------------------------------------------------------------
s9469
        LDA a3F
        BNE b9479
        LDX #$08
b946F   LDA f9458,X
        STA $1FFF,X
        DEX 
        BNE b946F
        RTS 

b9479   LDA a3F
        CMP #$01
        BNE b948A
        LDX #$08
        LDA #$00
b9483   STA $1FFF,X
        DEX 
        BNE b9483
        RTS 

b948A   LDX #$08
b948C   LDA f9460,X
        STA $1FFF,X
        DEX 
        BNE b948C
        RTS 

j9496   LDX #$08
b9498   CLC 
        LDA $1FFF,X
        ROL 
        ADC #$00
        STA $1FFF,X
        DEX 
        BNE b9498
b94A5   RTS 

;-------------------------------------------------------------------------
; s94A6
;-------------------------------------------------------------------------
s94A6
        LDA a25
        BNE b94A5
        LDA a28
        BNE b94A5
        LDA a34
        BNE b94A5
        LDA a31
        BNE b94A5
j94B6   INC a2A
        LDA a2A
        CMP #$15
        BNE b94C0
        DEC a2A
b94C0   LDX #$F8
        TXS 
        INC SCREEN_RAM + $0015
        LDA SCREEN_RAM + $0015
        CMP #$3A
        BNE b94D0
        DEC SCREEN_RAM + $0015
b94D0   JMP j9852

j94D3   LDA a0B
        STA currentYPosition
        LDA #$01
        STA currentXPosition
        LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
b94E3   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$27
        BNE b94E3
        JSR PlayChord
        LDA #$08
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayNote2
        LDA #$10
        STA a07
b9500   LDA #$60
        JSR s9BAA
b9505   LDY #$E0
b9507   DEY 
        BNE b9507
        LDA $4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC $4004
        LDA $4004
        CMP #$80
        BNE b9505
        JSR WasteAFewCycles
        LDA #$00
        LDX $D021    ;Background Color 0
        CPX #$F0
        BNE b9528
        LDA #$06
b9528   STA $D021    ;Background Color 0
        LDA a0A
        STA currentXPosition
        LDA a0B
        STA currentYPosition
        LDA a07
        AND #$03
        TAX 
        LDA f9623,X
        STA currentCharacter
        LDA a07
        AND #$07
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC a07
        BNE b9500
        LDA #$0F
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayChord
        LDA #$04
        STA $4001
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX #$08
        JSR PlayNote3
        LDA #$00
b9564   STA $1FFF,X
        DEX 
        BNE b9564
b956A   LDA #$0F
        SEC 
        SBC $4000
        STA a08
        LDA #$07
        STA a09
        LDX a08
        INX 
b9579   JSR WasteAFewCycles
        DEX 
        BNE b9579
b957F   JSR s95AA
        LDA a08
        BEQ b959F
        DEC a08
        BEQ b958E
        LDA a09
        BNE b957F
b958E   LDA #<$6600
        STA currentCharacter
        LDA #>$6600
        STA colorForCurrentCharacter
        JSR s95B7
        LDA $4000
        STA $D418    ;Select Filter Mode and Volume
b959F   DEC $4000
        BNE b956A
        JSR PlayChord
        JMP DecrementLives

;-------------------------------------------------------------------------
; s95AA
;-------------------------------------------------------------------------
s95AA
        LDX a09
        DEC a09
        LDA f9627,X
        STA colorForCurrentCharacter
        LDA #$40
        STA currentCharacter
;-------------------------------------------------------------------------
; s95B7
;-------------------------------------------------------------------------
s95B7
        LDA a0A
        SEC 
        SBC a08
        STA currentXPosition
        LDA a0B
        STA currentYPosition
        JSR s95FF
        LDA currentYPosition
        CLC 
        ADC a08
        STA currentYPosition
        JSR s95FF
        LDA a0B
        SEC 
        SBC a08
        STA currentYPosition
        JSR s95FF
        LDA a0A
        STA currentXPosition
        JSR s95FF
        LDA currentXPosition
        CLC 
        ADC a08
        STA currentXPosition
        JSR s95FF
        LDA a0B
        STA currentYPosition
        JSR s95FF
        LDA currentYPosition
        CLC 
        ADC a08
        STA currentYPosition
        JSR s95FF
        LDA a0A
        STA currentXPosition
;-------------------------------------------------------------------------
; s95FF
;-------------------------------------------------------------------------
s95FF
        LDA currentXPosition
        AND #$80
        BEQ b9606
b9605   RTS 

b9606   LDA currentXPosition
        BEQ b9605
        CMP #$27
        BPL b9605
        LDA currentYPosition
        AND #$80
        BNE b9605
        LDA currentYPosition
        CMP #$16
        BPL b9605
        LDA currentYPosition
        AND #$FC
        BEQ b9605
        JMP WriteCurrentCharacterToCurrentXYPos

f9623   .BYTE $73,$74,$76,$40
f9627   .BYTE $00,$06,$02,$04,$05,$03,$07,$01
;---------------------------------------------------------------------------------
; DecrementLives   
;---------------------------------------------------------------------------------
DecrementLives   
        DEC SCREEN_RAM + $0015
        LDA SCREEN_RAM + $0015
        CMP #$30
        BEQ b963C
        JMP RestartLevel

b963C   JMP DisplayGameOver

;-------------------------------------------------------------------------
; ClearGameScreen
;-------------------------------------------------------------------------
ClearGameScreen
        LDA #$20
        LDX #$00
b9643   STA SCREEN_RAM + $0078,X
        STA SCREEN_RAM + $0100,X
        STA SCREEN_RAM + $0200,X
        STA SCREEN_RAM + $0300,X
        DEX 
        BNE b9643

        LDA #$00
        LDX #$00
b9656   STA $2400,X
        DEX 
        BNE b9656

        STA $4002
        STA $4003
        STA $4004
        STA $4001
        JSR PlayChord
        RTS 

;---------------------------------------------------------------------------------
; RestartLevel   
;---------------------------------------------------------------------------------
RestartLevel   
        JSR ClearGameScreen
        LDA #>$0A10
        STA currentYPosition
        LDA #<$0A10
        STA currentXPosition
        LDA #$03
        STA colorForCurrentCharacter
        LDX #$00
b967D   LDA txtGotYou,X
        STX a07
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        INC currentXPosition
        INX 
        CPX #$08
        BNE b967D
        JSR PlayChord
        LDA #$0F
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayNote2
        LDX #$0A
b96A0   LDA #$20
        STA $4004
b96A5   LDY #$00
b96A7   DEY 
        BNE b96A7
        LDA $4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC $4004
        LDA $4004
        CMP #$40
        BNE b96A5
        DEX 
        BNE b96A0
        LDX #$07
b96BF   LDA #$80
        STA $4004
b96C4   LDY #$00
b96C6   DEY 
        BNE b96C6
        LDA $4004
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JSR PlayNote2
        DEC $4004
        BNE b96C4
        LDA $4000
        SEC 
        SBC #$02
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b96BF
        JMP EnterMainGameLoop

txtGotYou   .TEXT "GOT YOUz"
;---------------------------------------------------------------------------------
; DrawZoneClearedInterstitial   
;---------------------------------------------------------------------------------
DrawZoneClearedInterstitial   
        JSR ClearGameScreen
        LDA #$0F
        STA $4000
        JSR PlayChord
        LDA #$00
        STA a07
b9700   LDA #>SCREEN_RAM + $000E
        STA currentYPosition
b9704   LDA #<SCREEN_RAM + $000E
        STA currentXPosition
        LDA a07
        AND #$07
        TAX 
        LDA f9627,X
        STA colorForCurrentCharacter
        LDX #$00
b9714   LDA txtZoneCleared,X
        STA currentCharacter
        STX a08
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDX a08
        INX 
        CPX #$0C
        BNE b9714
        INC a07
        INC currentYPosition
        LDA currentYPosition
        CMP #$0B
        BNE b9704
        LDA #$08
        STA $4003
        JSR PlayNote1
b9739   DEY 
        BNE b9739
        LDA $4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        INC $4003
        LDA $4003
        CMP #$48
        BNE b9739
        LDA a07
        AND #$C0
        CMP #$C0
        BNE b9700
        LDX #$07
b9756   LDA #$60
        STA $4003
b975B   DEY 
        BNE b975B
        LDA $4003
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        DEC $4003
        LDA $4003
        CMP #$30
        BNE b975B
        LDA $4000
        SEC 
        SBC #$02
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b9756
        LDA a40
        BNE MysterBonusSequence
        JMP EnterMainGameLoop

txtZoneCleared   .TEXT "ZONE CLEARED"

;---------------------------------------------------------------------------------
; MysterBonusSequence   
;---------------------------------------------------------------------------------
MysterBonusSequence   
        LDA #$0F
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayChord
        LDX #$08
        LDA #$FF
b979F   STA $1FFF,X
        DEX 
        BNE b979F
        LDA #$04
        STA colorForCurrentCharacter
        LDA #>$0F09
        STA currentYPosition
b97AD   LDA #<$0F09
        STA currentXPosition
        LDA #$00
        STA currentCharacter
b97B5   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$1F
        BNE b97B5
        INC currentYPosition
        LDA currentYPosition
        CMP #$12
        BNE b97AD
        LDA #>$100B
        STA currentYPosition
        LDA #<$100B
        STA currentXPosition
        LDX #$00
        LDA #$07
        STA colorForCurrentCharacter
b97D6   LDA txtMysteryBonus,X
        STA currentCharacter
        STX a08
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a08
        INC currentXPosition
        INX 
        CPX #$12
        BNE b97D6
        DEC currentXPosition
        DEC currentXPosition
        DEC currentXPosition
        LDA #$30
        CLC 
        ADC a40
        STA currentCharacter
        LDA #$03
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX #$04
        LDY a40
        JSR IncreaseScore
        LDA #$D0
        STA a07
        JSR PlayNote1
b980B   LDA a07
        STA $4003
b9810   DEY 
        BNE b9810
        LDA $4003
        SBC #$80
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        INC $4003
        BNE b9810
        JSR WasteAFewCycles
        LDA a07
        AND #$07
        TAX 
        LDA #$FF
        STA $2000,X
        INC a07
        LDA a07
        AND #$07
        TAX 
        LDA #$00
        STA $2000,X
        LDA a07
        BNE b980B
        JMP EnterMainGameLoop

txtMysteryBonus   .TEXT " MYSTERY BONUS    "
;---------------------------------------------------------------------------------
; j9852   
;---------------------------------------------------------------------------------
j9852   
        LDX #$04
b9854   LDA $1D00,X
        CMP f987B,X
        BNE b9869
        DEX 
        BNE b9854
        LDA a3B
        BEQ b9869
        LDA a41
        ORA #$20
        STA a41
b9869   LDA #$08
        STA a40
b986D   LDA a41
        CLC 
        ROL 
        STA a41
        BCS b9879
        DEC a40
        BNE b986D
b9879   JMP DrawZoneClearedInterstitial

f987B   =*-$01
        .BYTE $0F,$1F,$1F,$0F
;-------------------------------------------------------------------------
; DrawTitleScreen
;-------------------------------------------------------------------------
DrawTitleScreen
        JSR ClearGameScreen
        LDA #$03
        STA colorForCurrentCharacter
        LDA #$09
        STA currentXPosition
        LDX #$00
b988D   LDA #$05
        STA currentYPosition
        LDA f9903,X
        STA currentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        INC currentYPosition
        LDA #$07
        STA colorForCurrentCharacter
        LDX a07
        LDA f9919,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$01
        STA colorForCurrentCharacter
        INC currentYPosition
        INC currentYPosition
        LDX a07
        LDA f992F,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC colorForCurrentCharacter
        LDX a07
        INC currentYPosition
        INC currentYPosition
        INC colorForCurrentCharacter
        LDA f9945,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC colorForCurrentCharacter
        LDX a07
        INC currentYPosition
        INC currentYPosition
        LDA f995B,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        LDA #$01
        STA colorForCurrentCharacter
        INC currentYPosition
        INC currentYPosition
        LDA f9971,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        LDA #$03
        STA colorForCurrentCharacter
        INC currentXPosition
        INX 
        CPX #$16
        BNE b988D
        JMP DrawHiScore

f9903   .TEXT "DESIGN AND PROGRAMMING"
f9919   .TEXT "   BY  JEFF  MINTER   "
f992F   .TEXT " ?  1983 BY LLAMASOFT "
f9945   .TEXT " PRESS FIRE FOR START "
f995B   .TEXT "SELECT START LEVEL   1"
f9971   .BYTE $96,$95,$94,$93,$92,$91,$90,$8F
        .BYTE $8E,$8D,$8C,$8B,$8A,$89,$88,$87
        .BYTE $86,$85,$84,$83,$82,$81
;---------------------------------------------------------------------------------
; j9987   
;---------------------------------------------------------------------------------
j9987   
        LDX #$00
j9989   JSR WasteAFewCycles
        LDA f9B5A,X
        AND #$3F
        CMP #$20
        BNE b9998
        JMP j99F7

b9998   CMP #$2E
        BNE b999F
        JMP j9A06

b999F   CMP #$00
        BNE b99A6
        JMP j9987

b99A6   CLC 
        ASL 
        ASL 
        ASL 
        TAY 
        STX a09
        LDX #$00
b99AF   LDA $2200,Y
        STA $2400,X
        INY 
        INX 
        CPX #$08
        BNE b99AF
j99BB   LDX a09
        LDA #$08
        STA a08
b99C1   LDY #$00
b99C3   LDA #$18
        STA a07
        TYA 
        TAX 
        CLC 
j99CA   ROL $2400,X
        PHP 
        TXA 
        CLC 
        ADC #$08
        TAX 
        DEC a07
        BEQ b99DB
        PLP 
        JMP j99CA

b99DB   PLP 
        INY 
        CPY #$08
        BNE b99C3
        LDX #$0A
b99E3   DEY 
        BNE b99E3
        DEX 
        BNE b99E3
        JSR WasteAFewCycles
        DEC a08
        BNE b99C1
        LDX a09
        INX 
        JMP j9A26

        .BYTE $00
;---------------------------------------------------------------------------------
; j99F7   
;---------------------------------------------------------------------------------
j99F7   
        STX a09
        LDA #$00
        LDX #$08
b99FD   STA $23FF,X
        DEX 
        BNE b99FD
        JMP j99BB

j9A06   STX a09
        LDX #$08
b9A0A   LDA $23B7,X
        STA $23FF,X
        DEX 
        BNE b9A0A
        JMP j99BB

        STX a09
        LDX #$08
b9A1A   LDA $23C7,X
        STA $23FF,X
        DEX 
        BNE b9A1A
        JMP j99BB

;---------------------------------------------------------------------------------
; j9A26   
;---------------------------------------------------------------------------------
j9A26   
        STX a09
        JSR GetJoystickInput
        LDA lastKeyPressed

        CMP #$04
        BNE b9A40
        INC SCREEN_RAM + $0226
        LDA SCREEN_RAM + $0226

        CMP #$37
        BNE b9A40

        LDA #$31
        STA SCREEN_RAM + $0226

b9A40   LDA joystickInput
        AND #$10
        BNE b9A4B
        LDX a09
        JMP j9989

b9A4B   LDA SCREEN_RAM + $0226
        SEC 
        SBC #$30
        STA a2A
        JMP ClearGameScreen

;---------------------------------------------------------------------------------
; DisplayGameOver   
;---------------------------------------------------------------------------------
DisplayGameOver   
        JSR ClearGameScreen
        LDA #$07
        STA colorForCurrentCharacter
        LDX #$00
        LDA #>$0A10
        STA currentYPosition
        LDA #<$0A10
        STA currentXPosition
b9A67   LDA txtGameOver,X
        STA currentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        inC currentXPosition
        INX 
        CPX #$09
        BNE b9A67
        LDA #$0F
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        LDX #$0F
b9A84   LDA #$80
        STA $4002
        STA $4003
        STA $4004
        JSR PlayNote1
        JSR PlayNote2
b9A95   LDY #$00
b9A97   DEY 
        BNE b9A97
        LDA $4003
        SBC #$70
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        ADC #$80
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC $4002
        INC $4003
        INC $4004
        BNE b9A95
        LDA $4000
        SEC 
        SBC #$01
        STA $4000
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b9A84
        LDX #$01
b9AC3   LDA SCREEN_RAM + $0009,X
        CMP $14F0,X
        BEQ b9ACF
        BMI b9AD4
        BPL StoreHiScore
b9ACF   INX 
        CPX #$08
        BNE b9AC3
b9AD4   JSR DrawTitleScreen
        JSR WriteBannerText
        LDX #$F8
        TXS 
        JMP j81BC

StoreHiScore 
        LDX #$07
b9AE2   LDA SCREEN_RAM + $0009,X
        STA $14F0,X
        DEX 
        BNE b9AE2
        JMP b9AD4

txtGameOver   .TEXT "GAME OVER"
;---------------------------------------------------------------------------------
; DrawHiScore   
;---------------------------------------------------------------------------------
DrawHiScore   
        LDA #$14
        STA currentYPosition
        LDX #$00
b9AFD   LDA f9B53,X
        STA currentCharacter
        LDA #$04
        STA colorForCurrentCharacter
        TXA 
        CLC 
        ADC #$0C
        STA currentXPosition
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        LDA currentXPosition
        CLC 
        ADC #$09
        STA currentXPosition
        LDA #$03
        STA colorForCurrentCharacter
        LDA $14F1,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        INX 
        CPX #$07
        BNE b9AFD
        JMP j9987

;-------------------------------------------------------------------------
; ReduceScore
;-------------------------------------------------------------------------
ReduceScore
        LDA #$04
        STA a39
        LDX #$06
b9B36   DEC SCREEN_RAM + $0009,X
        LDA SCREEN_RAM + $0009,X
        CMP #$2F
        BNE b9B52
        LDA #$39
        STA SCREEN_RAM + $0009,X
        DEX 
        BNE b9B36

        LDX #$07
        LDA #$30
b9B4C   STA SCREEN_RAM + $0009,X
        DEX 
        BNE b9B4C

b9B52   RTS 

f9B53   .TEXT "HISCORE"
f9B5A   .BYTE $01,$0C,$0C,$20,$0D,$01,$14,$12
        .BYTE $09,$18,$20,$10,$09,$0C,$0F,$14
        .BYTE $13,$2E,$2E,$2E,$20,$12,$05,$10
        .BYTE $0F,$12,$14,$20,$14,$0F,$20,$0A
        .BYTE $0F,$19,$13,$14,$09,$03,$0B,$20
        .BYTE $10,$0F,$12,$14,$20,$0F,$0E,$05
        .BYTE $20,$06,$0F,$12,$20,$03,$0F,$0D
        .BYTE $02,$01,$14,$20,$04,$15,$14,$19
        .BYTE $2E,$2E,$2E,$2E,$2E,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$00
;-------------------------------------------------------------------------
; s9BAA
;-------------------------------------------------------------------------
s9BAA
        STA $4004
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

;---------------------------------------------------------------------------------
; CopyCharsetIntoPosition   
;---------------------------------------------------------------------------------
CopyCharsetIntoPosition   
        LDX #$00
b9BB5   LDA f9C00,X
        STA $2000,X
        LDA f9D00,X
        STA $2100,X
        LDA f9E00,X
        STA $2200,X
        LDA f9F00,X
        STA $2300,X
        INX 
        BNE b9BB5
        JMP InitializeGame

        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .BYTE $EA,$EA,$EA,$EA,$EA

.include "charset.asm"
