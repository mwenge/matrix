; This is the reverse-engineered source code for the game 'Matrix' written by Jeff Minter in 1983.
;
; The code in this file was created by disassembling a binary of the game released into
; the public domain by Jeff Minter in 2019.
;
; The original code from which this source is derived is the copyright of Jeff Minter.
;
; The original home of this file is at: https://github.com/mwenge/matrix
;
; To the extent to which any copyright may apply to the act of disassembling and reconstructing
; the code from its binary, the author disclaims copyright to this source code.  In place of
; a legal notice, here is a blessing:
;
;    May you do good and not evil.
;    May you find forgiveness for yourself and forgive others.
;    May you share freely, never taking more than you give.
;
; (Note: I ripped this part from the SQLite licence! :) )

screenLineLoPtr = $00
screenLineHiPtr = $01
currentXPosition = $02
currentYPosition = $03
a04 = $04
colorForCurrentCharacter = $05
gridStartLoPtr = $06
a07 = $07
tempCounter = $08
tempCounter2 = $09
oldXPosition = $0A
oldYPosition = $0B
a0C = $0C
a0D = $0D
frameControlCounter = $0E
a10 = $10
a11 = $11
a12 = $12
bulletFrameCounter = $13
a14 = $14
a15 = $15
zapperFrameCounter = $16
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
currentLevel = $2A
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
mysteryBonusEarned = $40
bonusBits = $41
lastKeyPressed = $C5
;
; **** ZP POINTERS **** 
;
p06 = $06
;
; **** FIELDS **** 
;
screenLinesLoPtrArray = $0340
screenLinesHiPtrArray = $0360
f0FFF = $0FFF
SCREEN_RAM = $1000
COLOR_RAM = $9400
mysteryBonusPerformance = $1D00
charsetLocation = $1400
scrollingTextStorage = $1800

;
; **** ABSOLUTE ADRESSES **** 
;
;
; **** POINTERS **** 
;
p03 = $0003
p0106 = $0106
p0108 = $0108
p0109 = $0109
p0113 = $0113
p0170 = $0170
p0171 = $0171
p0200 = $0200
p0301 = $0301
p0313 = $0313
p0317 = $0317
p033C = $033C
p0405 = $0405
p0507 = $0507
p070E = $070E
p070F = $070F
p075E = $075E
p0A07 = $0A07
p0C05 = $0C05
p0F00 = $0F00
;
; **** PREDEFINED LABELS **** 
;
VICCR0 = $9000
VICCR1 = $9001
VICCR4 = $9004
VICCR5 = $9005
VICCRA = $900A
VICCRB = $900B
VICCRC = $900C
VICCRD = $900D
VICCRE = $900E
VICCRF = $900F
VIA1IER = $911E
VIA1PA2 = $911F
VIA2PB = $9120
VIA2DDRB = $9122

* = $1201
;-----------------------------------------------------------------------------------------------------
; SYS 8192 (PrepareGame)
; This launches the program from address $2000, i.e. PrepareGame.
;-----------------------------------------------------------------------------------------------------
; $9E = SYS
        .BYTE $0B,$08,$0A,$00,$9E,$38,$31,$39,$32,$00

.include "padding.asm"

;-------------------------------------------------------------------------
; PrepareGame
;-------------------------------------------------------------------------
PrepareGame
     
        JMP CopyCharsetIntoPosition

;-------------------------------------------------------------------------
; InitializeScreenLinePtrArray
;-------------------------------------------------------------------------
InitializeScreenLinePtrArray
        LDA #>SCREEN_RAM + $0000
        STA screenLineHiPtr
        LDA #<SCREEN_RAM + $0000
        STA screenLineLoPtr
p200B   LDX #$00
b200D   LDA screenLineLoPtr
        STA screenLinesLoPtrArray,X
        LDA screenLineHiPtr
        STA screenLinesHiPtrArray,X
        LDA screenLineLoPtr
        CLC 
        ADC #$16
        STA screenLineLoPtr
        LDA screenLineHiPtr
        ADC #$00
        STA screenLineHiPtr
        INX 
        CPX #$18
        BNE b200D
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
        LDA a04
        STA (screenLineLoPtr),Y
        LDA screenLineHiPtr
        CLC 
        ADC #$84
        STA screenLineHiPtr
        LDA colorForCurrentCharacter
        STA (screenLineLoPtr),Y
        RTS 

;-------------------------------------------------------------------------
; ClearScreen
;-------------------------------------------------------------------------
ClearScreen
        LDX #$00
b2054   LDA #$20
        STA SCREEN_RAM + $0000,X
        STA SCREEN_RAM + $0100,X
        LDA #$01
        STA COLOR_RAM + $0000,X
        STA COLOR_RAM + $0100,X
        DEX 
        BNE b2054
        RTS 

;---------------------------------------------------------------------------------
; InitializeGame   
;---------------------------------------------------------------------------------
InitializeGame   
        LDA #$80
        STA $0291
        LDA #$02
        STA VIA1IER  ;$911E - interrupt enable register (IER)
        LDA #$30
        LDX #$07
b2076   STA charsetLocation + $00F0,X
        DEX 
        BNE b2076
        LDA #$00
        STA VICCRE   ;$900E - sound volume
        LDA #$08
        STA VICCRF   ;$900F - screen colors: background, border & inverse
        LDA #$CD
        STA VICCR5   ;$9005 - screen map & character map address
        JSR ClearScreen
        JSR InitializeScreenLinePtrArray
        JMP SetupScreen

;-------------------------------------------------------------------------
; DrawTitleText
;-------------------------------------------------------------------------
DrawTitleText
        LDX #$28
b2096   LDA txtBanner,X
        STA SCREEN_RAM - $01,X
        LDA colorsBannerText,X
        STA COLOR_RAM - $01,X
        DEX 
        BNE b2096
        RTS 

;---------------------------------------------------------------------------------
; SetupScreen   
;---------------------------------------------------------------------------------
SetupScreen   
        JSR DrawTitleText
        JSR DrawTitleScreen
        JMP BeginGameEntrySequence

txtBanner   =*-$01
        .BYTE $23,$24,$22,$25,$26,$27,$20,$19
        .BYTE $1A,$20,$30,$30,$30,$30,$30,$30
        .BYTE $30,$20,$20,$07,$20,$35
				.BYTE $21,$21,$21,$21,$21,$21
				.BYTE $20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
colorsBannerText   .BYTE $20,$43,$43,$43,$43,$43,$43,$40
        .BYTE $44,$44,$40,$47,$47,$47,$47,$47
        .BYTE $47,$47,$40,$40,$45,$40,$43,$44
        .BYTE $44,$44,$44,$44,$44,$40,$40,$40
        .BYTE $40,$40,$40,$40,$40,$40,$40,$40
        .BYTE $40,$40,$40,$40
gridLineIntroSequenceColors   .BYTE $40
        .BYTE $06,$02,$04,$05,$03,$07,$01
;-------------------------------------------------------------------------
; PlayASoundEffect
;-------------------------------------------------------------------------
PlayASoundEffect
        LDA #$00
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        RTS 

;-------------------------------------------------------------------------
; WasteXYCycles
;-------------------------------------------------------------------------
WasteXYCycles
        LDX currentXPosition
b2124   LDY currentYPosition
b2126   DEY 
        BNE b2126
        DEX 
        BNE b2124
        RTS 

gridLineColorIndex = $06
linesToDraw = $07
;-------------------------------------------------------------------------
; DrawGridLineCascade
;-------------------------------------------------------------------------
DrawGridLineCascade
        LDA #>SCREEN_RAM + $0042
        STA screenLineHiPtr
        LDA #<SCREEN_RAM + $0042
        STA screenLineLoPtr

DrawLinesLoop
        LDA #$00
        LDY #$14

        ; Draw an empty character to the screen. The actual lines will be
        ; animated by the caller of this routine.
b2139   STA (screenLineLoPtr),Y
        DEY 
        BNE b2139

        ; Move the ptr to Color RAM
        LDA screenLineHiPtr
        PHA 
        CLC 
        ADC #$84
        STA screenLineHiPtr

        ; Paint the line with the color for this point in the
        ; sequence
        LDX gridLineColorIndex
        LDA gridLineIntroSequenceColors,X
        LDY #$14
b214D   STA (screenLineLoPtr),Y
        DEY 
        BNE b214D

        ; Move to the next line
        LDA screenLineLoPtr
        ADC #$16
        STA screenLineLoPtr
        PLA 
        ADC #$00
        STA screenLineHiPtr

        ; There are eight colors to choose from, so wrap around
        ; if we've reached the 8th color.
        INC gridLineColorIndex
        LDA gridLineColorIndex
        CMP #$08
        BNE b2169
        LDA #$01
        STA gridLineColorIndex

b2169   DEC linesToDraw
        BNE DrawLinesLoop
        RTS 

xCycles = $02
yCycles = $03
;---------------------------------------------------------------------------------
; BeginGameEntrySequence   
;---------------------------------------------------------------------------------
BeginGameEntrySequence   
        LDA #$C6
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        LDA #$8B
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)

        ; Create an 8-byte character definition that is all zeroes
        LDA #$00
        LDX #$08
b217C   STA charsetLocation - $0001,X
        DEX 
        BNE b217C

        ; Initialize our DrawGridLoop control variables
        LDA #$13
        STA tempCounter
        LDA #$01
        STA tempCounter2

        
DrawGridLoop
        LDA tempCounter2
        STA gridLineColorIndex
        LDA #$14
        SEC 
        SBC tempCounter
        STA linesToDraw
        INC VICCRE   ;$900E - sound volume
        LDA VICCRE   ;$900E - sound volume
        CMP #$10
        BNE b21A2
        DEC VICCRE   ;$900E - sound volume
b21A2   JSR DrawGridLineCascade

        ; This section animates the GRID characters we drew above. 
        ; It achieves this by populating an $FF in each of the 8 bytes
        ; of the grid character definition then reverting it to $00.
        ; The net effect is of a horizontal line moving smoothly down
        ; the screen along a single line width.
        LDX #$00
b21A7   LDA #$FF
        STA charsetLocation,X
        TXA 
        PHA 
        LDA #$80
        STA xCycles
        LDA #$10
        STA yCycles
        JSR WasteXYCycles
        PLA 
        TAX 
b21BB   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b21BB
        LDA #$00
        STA charsetLocation,X
        INX 
        CPX #$08
        BNE b21A7

        ; Update our counters and continue looping.
        DEC tempCounter2
        BNE b21D4
        LDA #$07
        STA tempCounter2
b21D4   DEC tempCounter
        BNE DrawGridLoop

        ; Fill out the grid characters to be a complete block.
        LDX #$08
b21DA   LDA #$FF
        STA charsetLocation - $0001,X
        TXA 
        PHA 
        LDA #$F0
        STA xCycles
        LDA #$10
        STA yCycles
        JSR WasteXYCycles
        PLA 
        TAX 
        DEX 
        BNE b21DA

        ; Pulse the color of the blocks.
        LDA #$02
        LDX #$00
b21F5   STA COLOR_RAM + $0042,X
        STA COLOR_RAM + $0100,X
        INX 
        BNE b21F5

        LDA #$03
        STA gridLineColorIndex
        LDA #$00
        STA linesToDraw
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)

        ; Animate the materialization of the grid
MaterializeGrid
        LDX #$80
b220B   STX VICCRB   ;$900B - frequency of sound osc.2 (alto)
        LDY #$00
b2210   DEY 
        BNE b2210
        INX 
        BNE b220B

        LDY #$08
b2218   LDX linesToDraw
        LDA charsetLocation + $02D8,X
        STA charsetLocation - $0001,Y
        INC linesToDraw
        DEY 
        BNE b2218

        LDA VICCRE   ;$900E - sound volume
        SBC #$05
        STA VICCRE   ;$900E - sound volume
        DEC gridLineColorIndex
        BNE MaterializeGrid

;---------------------------------------------------------------------------------
; EnterMainGameLoop 
;---------------------------------------------------------------------------------
EnterMainGameLoop 
        JSR LoadSettingsForLevel
        LDA #$00
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        JSR DrawEnterZoneInterstitial
        LDA #$A0
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        LDA #>p150A
        STA oldYPosition
        LDA #<p150A
        STA oldXPosition
        LDA #$09
        STA gridStartLoPtr
b2253   LDA #$0F
        SEC 
        SBC gridStartLoPtr
        STA VICCRE   ;$900E - sound volume
        LDA oldXPosition
        SEC 
        SBC gridStartLoPtr
        STA currentXPosition
        LDA oldYPosition
        SBC gridStartLoPtr
        SEC 
        STA currentYPosition
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA oldXPosition
        CLC 
        ADC gridStartLoPtr
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC gridStartLoPtr
        DEC currentXPosition
        INC currentYPosition
        LDA #<p0317
        STA a04
        LDA #>p0317
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA oldXPosition
        SEC 
        SBC gridStartLoPtr
        STA currentXPosition
        DEC a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA gridStartLoPtr
        CLC 
        ADC #$01
        ASL 
        ASL 
        ASL 
        STA currentXPosition
        LDA #$00
        STA currentYPosition
        JSR WasteXYCycles
        LDA gridStartLoPtr
        CMP #$00
        BNE b2253
        LDA #$00
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        LDA #$03
        STA gridStartLoPtr
b22BB   LDA #$01
        CLC 
        ADC gridStartLoPtr
        LDX #$00
b22C2   STA COLOR_RAM + $0042,X
        STA COLOR_RAM + $0100,X
        DEX 
        BNE b22C2
        LDA oldXPosition
        STA currentXPosition
        LDA oldYPosition
        STA currentYPosition
        LDA #<p0507
        STA a04
        LDA #>p0507
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$FF
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
b22E3   LDY #$00
b22E5   DEY 
        BNE b22E5
        DEC VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        CMP #$7F
        BNE b22E3
        LDA VICCRE   ;$900E - sound volume
        SBC #$05
        STA VICCRE   ;$900E - sound volume
        DEC gridStartLoPtr
        BNE b22BB
        JSR PlayASoundEffect
        LDA #$00
        LDX #$20
b2305   STA SCREEN_RAM + $0320,X
        DEX 
        BNE b2305
        STA a10
        STA a17
        STA a39
        STA a1E
        STA a28
        STA a31
        STA a36
        STA a3D
        STA mysteryBonusEarned
        LDA #>p0301
        STA a15
        LDA #<p0301
        STA a14
        STA zapperFrameCounter
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
        STA bonusBits
;---------------------------------------------------------------------------------
; MainGameLoop   
;---------------------------------------------------------------------------------
MainGameLoop   
        JSR ProcessJoystickInput
        JSR AnimateCurrentBullet
        JSR AnimateZappers
        JSR AnimateCamelsAndLaserZaps
        JSR AnimateDroidSquads
        JSR DrawDeflexor
        JSR CheckForCheatKeySequence
        JMP MainGameLoop

;-------------------------------------------------------------------------
; GetJoystickInput
;-------------------------------------------------------------------------
GetJoystickInput
        SEI 
        LDX #$7F
        STX VIA2DDRB ;$9122 - data direction register for port b
b2361   LDY VIA2PB   ;$9120 - port b I/O register
        CPY VIA2PB   ;$9120 - port b I/O register
        BNE b2361
        LDX #$FF
        STX VIA2DDRB ;$9122 - data direction register for port b
        LDX #$F7
        STX VIA2PB   ;$9120 - port b I/O register
        CLI 
b2374   LDA VIA1PA2  ;$911F - mirror of VIA1PA1 (CA1 & CA2 unaffected)
        CMP VIA1PA2  ;$911F - mirror of VIA1PA1 (CA1 & CA2 unaffected)
        BNE b2374
        PHA 
        AND #$1C
        LSR 
        CPY #$80
        BCC b2386
        ORA #$10
b2386   TAY 
        PLA 
        AND #$20
        CMP #$20
        TYA 
        ROR 
        EOR #$8F
        STA a0D
        RTS 

droidDecaySequence 
        .BYTE $0C,$0D,$0E,$0F,$10,$11,$12,$0A
thingsThatKillAShip   .BYTE $08,$03,$04,$05,$06,$0A,$13,$14
        .BYTE $15
;-------------------------------------------------------------------------
; ProcessJoystickInput
;-------------------------------------------------------------------------
ProcessJoystickInput
        DEC frameControlCounter
        BEQ b23B2
        LDA frameControlCounter
        CMP #$80
        BEQ b23AF
        RTS 

b23AF   JMP DrawGridAtOldPosition

b23B2   JSR GetJoystickInput
        JSR CheckIfZoneCleared
        LDA oldXPosition
        STA currentXPosition
        CMP #$03
        BEQ b23C4
        CMP #$12
        BNE b23CA
b23C4   LDA bonusBits
        AND #$FB
        STA bonusBits
b23CA   LDA oldYPosition
        STA currentYPosition
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a0D
        AND #$01
        BEQ b23E9
        DEC currentYPosition
        LDA currentYPosition
        CMP #$06
        BNE b23E9
        INC currentYPosition
b23E9   LDA a0D
        AND #$02
        BEQ b23F9
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b23F9
        DEC currentYPosition
b23F9   LDA #$00
        STA a0C
        LDA a0D
        AND #$04
        BEQ b2411
        LDA #$01
        STA a0C
        DEC currentXPosition
        BNE b2411
        INC currentXPosition
        LDA #$00
        STA a0C
b2411   LDA a0D
        AND #$08
        BEQ b2429
        LDA #$02
        STA a0C
        INC currentXPosition
        LDA currentXPosition
        CMP #$15
        BNE b2429
        DEC currentXPosition
        LDA #$00
        STA a0C
b2429   JSR CheckForCollisionWithNewMovememnt
        LDA a0D
        AND #$80
        BEQ b2449
        LDA a10
        BNE b2449
        LDA oldXPosition
        STA a11
        LDA oldYPosition
        STA a12
        DEC a12
        LDA #$01
        STA a10
        LDA #$DE
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
b2449   LDA a0C
        BNE MoveShipLeftOrRight
;-------------------------------------------------------------------------
; DrawShipInCurrentPositiong
;-------------------------------------------------------------------------
DrawShipInCurrentPositiong
        LDA oldXPosition
        STA currentXPosition
        LDA oldYPosition
        STA currentYPosition
        LDA #<p0507
        STA a04
        LDA #>p0507
        STA colorForCurrentCharacter
        JMP WriteCurrentCharacterToCurrentXYPos

;---------------------------------------------------------------------------------
; MoveShipLeftOrRight   
;---------------------------------------------------------------------------------
MoveShipLeftOrRight   
        LDA oldYPosition
        STA currentYPosition
        LDA #$05
        STA colorForCurrentCharacter
        LDA a0C
        CMP #$02
        BEQ b2480
        LDA #$0B
        STA a04
        LDA oldXPosition
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC a04
        INC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos

b2480   LDA #$0C
        STA a04
        LDA oldXPosition
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC a04
        DEC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos

;---------------------------------------------------------------------------------
; DrawGridAtOldPosition   
;---------------------------------------------------------------------------------
DrawGridAtOldPosition   
        JSR DrawLasers
        LDA a0C
        BNE b249A
        RTS 

b249A   JSR DrawShipInCurrentPositiong
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        INC currentXPosition
        LDA a0C
        CMP #$02
        BNE b24B1
        DEC currentXPosition
        DEC currentXPosition
b24B1   JMP WriteCurrentCharacterToCurrentXYPos
        ; Returns

;-------------------------------------------------------------------------
; CheckForCheatKeySequence
; Minter writes:
; "I never did get through all 20 levels without
; resorting to cheating (the cheat mode is accessed by holding down
; Commodore, Shift, CTRL and a letter key, and is left over from when
; I was testing the levels), best I managed legitimately was to reach
; Level 17."
;-------------------------------------------------------------------------
CheckForCheatKeySequence
        LDA #$06
        STA currentXPosition
        LDA #$01
        STA currentYPosition
        LDA lastKeyPressed
        CMP #$40
        BNE b24C5
b24C2   JMP WasteXYCycles

b24C5   LDA $028D
        AND #$07
        CMP #$07
        BEQ b24E1
        CMP #$04
        BNE b24C2
b24D2   LDA lastKeyPressed
        CMP #$40
        BNE b24D2
b24D8   LDA lastKeyPressed
        CMP #$40
        BEQ b24D8
        JMP WasteXYCycles

b24E1   JMP CheatByIncrementingLifeAndSkipLevel

;-------------------------------------------------------------------------
; AnimateCurrentBullet
;-------------------------------------------------------------------------
AnimateCurrentBullet
        DEC bulletFrameCounter
        BEQ b24E9
b24E8   RTS 

b24E9   LDA #$30
        STA bulletFrameCounter

        ; Play Bullet Sound
        LDA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        AND #$80
        BEQ b24F7
        DEC VICCRD   ;$900D - frequency of sound osc.4 (noise)
b24F7   LDA a10
        BEQ b24E8
        AND #$F0
        BEQ b2514
        CMP #$10
        BNE b2506
        JMP DrawDeflectedBullet

b2506   CMP #$20
        BNE b250D
        JMP j3026

b250D   CMP #$30
        BNE b2514
        JMP j2FE1

b2514   LDA a10
        AND #$02
        BNE b2536
        LDA #$01
        STA colorForCurrentCharacter
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        JSR CheckBulletCollision
        LDA #$09
        STA a04
        LDA a10
        EOR #$02
        STA a10
        JMP WriteCurrentCharacterToCurrentXYPos

b2536   LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA #<p0200
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC a12
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b2558
        LDA #$00
        STA a10
        RTS 

b2558   LDA #>p0108
        STA colorForCurrentCharacter
        LDA #<p0108
        STA a04
        LDA a10
        EOR #$02
        STA a10
        JSR CheckBulletCollision
        JMP WriteCurrentCharacterToCurrentXYPos

;-------------------------------------------------------------------------
; AnimateZappers
;-------------------------------------------------------------------------
AnimateZappers
        LDA frameControlCounter
        CMP #$30
        BEQ b2573
b2572   RTS 

b2573   DEC zapperFrameCounter
        BNE b2572
        JSR AnimateTitleText
        LDA #$02
        STA zapperFrameCounter
        JSR PerformRollingGridAnimation
        LDA a17
        BNE b25B9
        LDA #<p033C
        STA a04
        LDA #>p033C
        STA colorForCurrentCharacter
        LDA #$00
        STA currentXPosition
        LDA a15
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC a04
        INC currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #<p3A16
        STA currentYPosition
        LDA #>p3A16
        STA a04
        LDA a14
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        INC a04
        LDA #$01
        STA a17
        JMP WriteCurrentCharacterToCurrentXYPos

b25B9   LDA #$20
        STA a04
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
        CMP #$15
        BNE b25E9
        LDA #$01
        STA a14
b25E9   INC a15
        LDA a15
        CMP #$16
        BNE b25F5
        LDA #$03
        STA a15
b25F5   LDA #$00
        STA a17
        LDA #$03
        STA colorForCurrentCharacter
        LDA a14
        STA currentXPosition
        LDA #$02
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$00
        STA currentXPosition
        LDA a15
        STA currentYPosition
        LDA #$01
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a36
        AND #$80
        BEQ b2627
        LDA a14
        CMP oldXPosition
        BNE b2627
        LDA #$01
        STA a18
b2627   DEC a18
        BNE b2643
        LDA a14
        STA a1B
        LDA a15
        STA a1C
        LDA #$01
        STA a1A
        LDA #$90
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        RTS 

;-------------------------------------------------------------------------
; AnimateCamelsAndLaserZaps
;-------------------------------------------------------------------------
AnimateCamelsAndLaserZaps
        LDA bulletFrameCounter
        CMP #$02
        BEQ b2644
b2643   RTS 

b2644   JSR PlayMoreSoundEffects
        JSR AnimateCameloid
        LDA a18
        BNE b2643
        LDA a1A
        CMP a1B
        BEQ b2683
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA a1A
        STA currentXPosition
        LDA a1C
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC a1A
        INC currentXPosition
        JMP DrawLaserFromZappers

JumpToCollisionWithShip   JMP CollisionWithShip

DrawLaserFromZappers
        LDA #$01
        STA colorForCurrentCharacter
        INC a1D
        LDA a1D
        AND #$01
        CLC 
        ADC #$03
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
b2683   LDA #$15
        STA currentYPosition
        LDA a1B
        STA currentXPosition
        LDA a1D
        AND #$01
        CLC 
        ADC #$05
        STA a04
b2694   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b2694
        LDA a1B
        CMP oldXPosition
        BEQ JumpToCollisionWithShip
        LDA a1A
        CMP a1B
        BEQ b26AC
        RTS 

b26AC   LDA #$15
        STA currentYPosition
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA #<p0200
        STA a04
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        LDA a1B
        STA currentXPosition
b26BF   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b26BF
        LDA a1C
        STA currentYPosition
        LDA #>p070F
        STA colorForCurrentCharacter
        LDA #<p070F
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a19
        STA a18
        LDA #<SCREEN_RAM + $0042
        STA gridStartLoPtr
        LDA #>SCREEN_RAM + $0042
        STA a07
        LDA bonusBits
        ORA #$08
        STA bonusBits
        LDY #$00
b26ED   LDA (p06),Y
        BEQ b26F4
        JSR DrawBombLeftByLaser
b26F4   INC gridStartLoPtr
        BNE b26ED
        INC a07
        LDA a07
        CMP #$12
        BNE b26ED
        RTS 

;-------------------------------------------------------------------------
; DrawBombLeftByLaser
;-------------------------------------------------------------------------
DrawBombLeftByLaser
        CMP #$20
        BNE b2706
        RTS 

b2706   LDX #$07
b2708   CMP droidDecaySequence - $0001,X
        BEQ b2711
        DEX 
        BNE b2708
        RTS 

b2711   LDA droidDecaySequence,X
        STA (p06),Y
        LDA bonusBits
        AND #$F7
        STA bonusBits
        CPX #$07
        BEQ b2721
        RTS 

b2721   LDX #$20
b2723   LDA SCREEN_RAM + $0320,X
        BEQ b2730
        DEX 
        BNE b2723
        LDA #$0D
        STA (p06),Y
        RTS 

b2730   LDA gridStartLoPtr
        STA SCREEN_RAM + $0300,X
        LDA a07
        STA SCREEN_RAM + $0320,X
        RTS 

;-------------------------------------------------------------------------
; DrawLasers
;-------------------------------------------------------------------------
DrawLasers
        LDX #$20
b273D   LDA SCREEN_RAM + $0320,X
        BEQ b2745
        JSR DrawLaser
b2745   DEX 
        BNE b273D
        RTS 

f2748  = *-$01 
        .BYTE $07,$0B,$0C,$0C
f274C   = *-$01 
        .BYTE $20,$02,$3A,$3B
;-------------------------------------------------------------------------
; DrawLaser
;-------------------------------------------------------------------------
DrawLaser
        STX tempCounter
        LDA SCREEN_RAM + $0300,X
        STA gridStartLoPtr
        LDA SCREEN_RAM + $0320,X
        STA a07
        LDY #$00
        TYA 
        STA (p06),Y
        LDA a07
        PHA 
        CLC 
        ADC #$84
        STA a07
        LDA #$02
        STA (p06),Y
        PLA 
        STA a07
        LDA gridStartLoPtr
        CLC 
        ADC #$16
        STA gridStartLoPtr
        LDA a07
        ADC #$00
        STA a07
        LDA (p06),Y
        LDX #$04
b2782   CMP f2748,X
        BNE b278A
        JMP JumpToCollisionWithShip

b278A   CMP f274C,X
        BEQ b27AE
        DEX 
        BNE b2782
        LDA #$0A
        STA (p06),Y
        LDA a07
        PHA 
        CLC 
        ADC #$84
        STA a07
        LDA #$01
        STA (p06),Y
        LDX tempCounter
        LDA gridStartLoPtr
        STA SCREEN_RAM + $0300,X
        PLA 
        STA SCREEN_RAM + $0320,X
        RTS 

b27AE   LDX tempCounter
        LDA #$00
        STA SCREEN_RAM + $0320,X
        RTS 

;---------------------------------------------------------------------------------
; CheckForShipCollindingWithSomething   
;---------------------------------------------------------------------------------
CheckForShipCollindingWithSomething   
        JSR GetCharacterAtCurrentXYPos
        BEQ b27CC
        LDX thingsThatKillAShip
b27BE   CMP thingsThatKillAShip,X
        BEQ b27C9
        DEX 
        BNE b27BE
        STX a0C
        RTS 

b27C9   JMP JumpToCollisionWithShip

b27CC   LDA currentXPosition
        STA oldXPosition
        LDA currentYPosition
        STA oldYPosition
        RTS 

;-------------------------------------------------------------------------
; CheckForCollisionWithNewMovememnt
;-------------------------------------------------------------------------
CheckForCollisionWithNewMovememnt
        LDA currentXPosition
        CMP oldXPosition
        BEQ CheckForShipCollindingWithSomething
        LDA currentYPosition
        CMP oldYPosition
        BEQ CheckForShipCollindingWithSomething
        LDA currentXPosition
        PHA 
        LDA oldXPosition
        STA currentXPosition
        JSR GetCharacterAtCurrentXYPos
        BNE b27F3
        PLA 
        STA currentXPosition
        JMP CheckForShipCollindingWithSomething

b27F3   LDA oldYPosition
        STA currentYPosition
        PLA 
        STA currentXPosition
        JMP CheckForShipCollindingWithSomething

;-------------------------------------------------------------------------
; CheckBulletCollision
;-------------------------------------------------------------------------
CheckBulletCollision
        JSR GetCharacterAtCurrentXYPos
        CMP #$08
        BEQ b283A
        LDX #$07
b2806   CMP droidDecaySequence - $0001,X
        BEQ b2811
        DEX 
        BNE b2806
        JMP CheckBulletCollisionWithDroidSquad

b2811   LDA droidDecaySequence - $0002,X
        STA a04
        LDA #$07
        STA colorForCurrentCharacter
        CPX #$02
        BNE b2831
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        LDX #$06
        LDY #$01
        JSR IncreaseScore
        LDA #$04
        STA a1E
b2831   JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$00
        STA a10
        PLA 
        PLA 
b283A   RTS 

;-------------------------------------------------------------------------
; IncreaseScore
;-------------------------------------------------------------------------
IncreaseScore
        TXA 
        PHA 
b283D   INC SCREEN_RAM + $0009,X
        LDA SCREEN_RAM + $0009,X
        CMP #$3A
        BNE b284F
        LDA #$30
        STA SCREEN_RAM + $0009,X
        DEX 
        BNE b283D
b284F   PLA 
        TAX 
        DEY 
        BNE IncreaseScore
        RTS 

;-------------------------------------------------------------------------
; AnimateTitleText
;-------------------------------------------------------------------------
AnimateTitleText
        LDA charsetLocation + $0109
        ROL 
        ADC #$00
        STA charsetLocation + $0109
        RTS 

;-------------------------------------------------------------------------
; PlayMoreSoundEffects
;-------------------------------------------------------------------------
PlayMoreSoundEffects
        JSR UpdateSoundEffects
        LDA a1E
        BNE b2867
        RTS 

b2867   LDA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        AND #$80
        BNE b287E
        LDA a1E
        ASL 
        ASL 
        CLC 
        ADC a1E
        STA VICCRE   ;$900E - sound volume
        LDA #$F6
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        RTS 

b287E   INC VICCRB   ;$900B - frequency of sound osc.2 (alto)
        BEQ b2884
b2883   RTS 

b2884   DEC a1E
        BNE b2883
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        RTS 

;-------------------------------------------------------------------------
; UpdateSoundEffects
;-------------------------------------------------------------------------
UpdateSoundEffects
        LDA a3D
        BNE b28B2
        LDA a39
        BNE b2897
        RTS 

b2897   LDA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        CMP #$D0
        BEQ b28A2
        DEC VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        RTS 

b28A2   DEC a39
        BEQ b28AC
        LDA #$D8
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        RTS 

b28AC   LDA #$00
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
b28B1   RTS 

b28B2   DEC a3D
        LDA a3D
        STA VICCRE   ;$900E - sound volume
        BNE b28B1
        LDA #$00
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        RTS 

;-------------------------------------------------------------------------
; AnimateDroidSquads
;-------------------------------------------------------------------------
AnimateDroidSquads
        DEC a22
        LDA a22
        CMP #$01
        BEQ b28CF
b28CE   RTS 

b28CF   LDA #$00
        STA a22
        JSR AnimateSnitch
        LDA a25
        BNE b28DD
        JMP j2954

b28DD   LDA a26
        BEQ b28CE
        CMP #$01
        BEQ b28EA
        DEC a26
        JMP j2954

b28EA   LDA a24
        CMP a23
        BNE b292B
        INC a28
        LDX a28
        LDA #$03
        STA f1980,X
        LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        AND #$01
        BEQ b290D
        LDA #$0A
        STA f1900,X
        LDA #$81
        STA f1A00,X
        JMP j2917

b290D   LDA #$0C
        STA f1900,X
        LDA #$80
        STA f1A00,X
j2917   LDA a3F
        AND #$80
        BEQ b292B
        LDA a25
        AND #$01
        BEQ b292B
        LDA f1A00,X
        ORA #$04
        STA f1A00,X
b292B   INC a28
        LDX a28
        LDA #$0B
        STA f1900,X
        LDA #$03
        STA f1980,X
        LDA #$00
        STA f1A00,X
        DEC a24
        BEQ b2945
        JMP j2954

b2945   LDA #$40
        STA f1A00,X
        LDA a27
        STA a26
        LDA a23
        STA a24
        DEC a25
j2954   INC a29
        LDA a29
        CMP #$15
        BNE b2960
        LDA #$13
        STA a29
b2960   LDX a28
        LDA a28
        BNE b2967
        RTS 

b2967   LDA f1A00,X
        AND #$80
        BNE b2971
        JMP j2A1A

b2971   JSR s2BF8
        LDA f1A00,X
        AND #$04
        BEQ b297E
        JMP j2A6A

b297E   LDA f1900,X
        STA currentXPosition
        LDA f1980,X
        STA currentYPosition
        LDA f1A00,X
        AND #$40
        BEQ b299E
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
b299E   LDA f1A00,X
        AND #$01
        BEQ b29A9
        DEC currentXPosition
        DEC currentXPosition
b29A9   INC currentXPosition
        LDA currentXPosition
        BEQ b29B6
        CMP #$15
        BEQ b29B6
        JMP j29B9

b29B6   JMP j29F6

j29B9   STX a07
        JSR GetCharacterAtCurrentXYPos
        LDX a07
        CMP #$00
        BEQ b29D6
        CMP #$07
        BEQ b29D3
        CMP #$0B
        BEQ b29D3
        CMP #$0C
        BEQ b29D3
        JMP j29F6

b29D3   JMP JumpToCollisionWithShip

b29D6   LDA currentXPosition
        STA f1900,X
        LDA currentYPosition
        STA f1980,X
        LDA #$03
        STA colorForCurrentCharacter
        LDA a29
        STA a04
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
j29EF   DEX 
        BEQ b29F5
        JMP b2967

b29F5   RTS 

j29F6   INC currentYPosition
        LDA f1900,X
        STA currentXPosition
        LDA f1A00,X
        EOR #$01
        STA f1A00,X
        LDA currentYPosition
        CMP #$15
        BNE b29D6
        DEC currentYPosition
        LDA f1A00,X
        EOR #$01
        ORA #$06
        STA f1A00,X
        JMP b29D6

j2A1A   LDA f1900,X
        STA currentXPosition
        LDA f1980,X
        STA currentYPosition
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA f1A00,X
        AND #$40
        BEQ b2A3A
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
b2A3A   LDA f18FF,X
        STA f1900,X
        STA currentXPosition
        LDA f197F,X
        STA f1980,X
        STA currentYPosition
        STX a07
        JSR GetCharacterAtCurrentXYPos
        LDX a07
        CMP #$07
        BNE b2A58
        JMP JumpToCollisionWithShip

b2A58   LDA #>p0313
        STA colorForCurrentCharacter
        LDA #<p0313
        STA a04
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        JMP j29EF

j2A6A   LDA f1900,X
        STA currentXPosition
        LDA f1980,X
        STA currentYPosition
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA f1A00,X
        AND #$40
        BEQ b2A8A
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
b2A8A   LDA f1A00,X
        STA tempCounter
        AND #$01
        BEQ b2A97
        DEC currentXPosition
        DEC currentXPosition
b2A97   INC currentXPosition
        LDA tempCounter
        AND #$02
        BEQ b2AA3
        DEC currentYPosition
        DEC currentYPosition
b2AA3   INC currentYPosition
        STX a07
        JSR GetCharacterAtCurrentXYPos
        LDX a07
        CMP #$07
        BEQ b2ABF
        CMP #$0B
        BEQ b2ABF
        CMP #$0C
        BNE b2AC2
        CMP #$00
        BEQ b2AC2
        JMP j2AE2

b2ABF   JMP JumpToCollisionWithShip

b2AC2   LDA #$00
        STA tempCounter2
        LDA currentXPosition
        BEQ j2AE2
        CMP #$15
        BEQ j2AE2
j2ACE   LDA currentYPosition
        CMP #$02
        BEQ b2AF5
        CMP #$16
        BEQ b2AF5
j2AD8   LDA tempCounter2
        BNE b2ADF
        JMP b29D6

b2ADF   JMP b2A8A

j2AE2   LDA tempCounter
        EOR #$01
        STA f1A00,X
        LDA f1980,X
        STA currentYPosition
        LDA #$01
        STA tempCounter2
        JMP j2ACE

b2AF5   LDA f1A00,X
        EOR #$02
        STA f1A00,X
        LDA f1900,X
        STA currentXPosition
        LDA #$01
        STA tempCounter2
        JMP j2AD8

;---------------------------------------------------------------------------------
; CheckBulletCollisionWithDroidSquad   
;---------------------------------------------------------------------------------
CheckBulletCollisionWithDroidSquad   
        CMP #$13
        BEQ b2B18
        CMP #$14
        BEQ b2B18
        CMP #$15
        BEQ b2B18
        JMP CheckBulletCollisionWithCamelDroids

b2B18   PHA 
        LDA currentYPosition
        CMP #$03
        BNE b2B29
        LDA a24
        CMP a23
        BEQ b2B29
        PLA 
        JMP CheckBulletCollisionWithCamelDroids

b2B29   PLA 
        LDX a28
b2B2C   LDA f1900,X
        CMP currentXPosition
        BEQ b2B37
b2B33   DEX 
        BNE b2B2C
        RTS 

b2B37   LDA f1980,X
        CMP currentYPosition
        BNE b2B33
        LDA a10
        AND #$30
        BEQ b2B4A
        LDA bonusBits
        ORA #$80
        STA bonusBits
b2B4A   LDA #$00
        STA a10
        LDA #$04
        STA a39
        LDA #$D0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA f1A00,X
        AND #$C0
        CMP #$C0
        BNE b2B67
        LDA #$04
        STA tempCounter
        JMP j2BC8

b2B67   CMP #$40
        BNE b2B7B
        LDA f1A00,X
        ORA f19FF,X
        STA f19FF,X
        LDA #$01
        STA tempCounter
        JMP j2BC8

b2B7B   CMP #$80
        BEQ b2BAF
        STX a07
b2B81   DEX 
        LDA f1A00,X
        AND #$80
        BEQ b2B81
        LDA f1A00,X
        LDX a07
        ORA f1A01,X
        STA f1A01,X
        AND #$04
        BEQ b2BA0
        LDA f1A01,X
        EOR #$01
        STA f1A01,X
b2BA0   LDA #$01
        STA tempCounter
        LDA #$40
        ORA f19FF,X
        STA f19FF,X
        JMP j2BC8

b2BAF   LDA f1A00,X
        ORA f1A01,X
        STA f1A01,X
        AND #$04
        BEQ b2BC4
        LDA f1A01,X
        EOR #$01
        STA f1A01,X
b2BC4   LDA #$04
        STA tempCounter
j2BC8   LDA f1901,X
        STA f1900,X
        LDA f1981,X
        STA f1980,X
        LDA f1A01,X
        STA f1A00,X
        CPX a28
        BEQ b2BE2
        INX 
        JMP j2BC8

b2BE2   DEC a28
        LDX #$05
        LDY tempCounter
        JSR IncreaseScore
        LDA #>p070E
        STA colorForCurrentCharacter
        LDA #<p070E
        STA a04
        PLA 
        PLA 
        JMP WriteCurrentCharacterToCurrentXYPos

;-------------------------------------------------------------------------
; s2BF8
;-------------------------------------------------------------------------
s2BF8
        LDA currentLevel
        CMP #$02
        BPL b2BFF
b2BFE   RTS 

b2BFF   DEC a2B
        BEQ b2C19
        LDA currentLevel
        CMP a04
        BMI b2BFE
        LDA f1900,X
        CMP oldXPosition
        BNE b2BFE
        DEC a2D
        BEQ b2C15
b2C14   RTS 

b2C15   LDA a2E
        STA a2D
b2C19   LDA a2C
        STA a2B
        LDA oldYPosition
        SEC 
        SBC f1980,X
        BVS b2C14
        CMP #$04
        BMI b2C14
        STX a07
        LDX #$20
b2C2D   LDA SCREEN_RAM + $0320,X
        BEQ b2C36
        DEX 
        BNE b2C2D
        RTS 

b2C36   STX tempCounter
        LDX a07
        LDA f1900,X
        STA currentXPosition
        LDA f1980,X
        STA currentYPosition
        STX a07
        JSR GetLinePtrForCurrentYPosition
        TYA 
        CLC 
        ADC screenLineLoPtr
        STA screenLineLoPtr
        LDA screenLineHiPtr
        ADC #$00
        LDX tempCounter
        STA SCREEN_RAM + $0320,X
        LDA screenLineLoPtr
        STA SCREEN_RAM + $0300,X
        LDX a07
        RTS 

;-------------------------------------------------------------------------
; AnimateCameloid
;-------------------------------------------------------------------------
AnimateCameloid
        DEC a2F
        BEQ b2C65
        RTS 

b2C65   LDA a30
        STA a2F
        LDA a23
        BNE b2C70
        JSR ReduceScore
b2C70   LDA a32
        BNE b2C75
        RTS 

b2C75   LDA a34
        BNE b2C7C
        JMP j2CA5

b2C7C   DEC a32
        BEQ b2C83
        JMP j2CA5

b2C83   LDA a33
        STA a32
        INC a31
        LDX a31
        LDA #$03
        STA f1B00,X
        LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        AND #$0F
        CLC 
        ADC #$04
        STA f1A80,X
        LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        AND #$40
        STA f1B80,X
        DEC a34
j2CA5   LDX a31
        CPX #$00
        BNE b2CAC
        RTS 

b2CAC   LDA f1B80,X
        AND #$20
        BEQ b2CB6
        JMP j2E72

b2CB6   LDA f1B80,X
        AND #$01
        BEQ b2CC0
        JMP j2D79

b2CC0   LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA f1A80,X
        STA currentXPosition
        LDA f1B00,X
        STA currentYPosition
        LDA f1B80,X
        AND #$40
        BEQ b2CDD
        INC currentXPosition
        INC currentXPosition
b2CDD   DEC currentXPosition
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
j2CE6   LDA f1A80,X
        STA currentXPosition
        LDA #>p075E
        STA colorForCurrentCharacter
        LDA #<p075E
        STA a04
        LDA f1B80,X
        AND #$40
        BEQ b2CFE
        LDA #$61
        STA a04
b2CFE   STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        LDA f1B80,X
        AND #$40
        BEQ b2D10
        DEC currentXPosition
        DEC currentXPosition
b2D10   INC currentXPosition
        JSR GetCharacterAtCurrentXYPos
        BEQ b2D5E
        LDX a07
        LDA f1A80,X
        STA currentXPosition
        INC currentYPosition
        LDA f1B80,X
        EOR #$40
        STA f1B80,X
        LDA f1A80,X
        STA currentXPosition
        DEC currentYPosition
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        INC f1B00,X
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b2D5B
        LDA a28
        BNE b2D55
        LDA a25
        BNE b2D55
        LDA bonusBits
        ORA #$02
        STA bonusBits
b2D55   JSR s2DB8
        JMP j2D6A

b2D5B   JMP j2CE6

b2D5E   LDA currentXPosition
        LDX a07
        STA f1A80,X
        LDA currentYPosition
        STA f1B00,X
j2D6A   LDA f1B80,X
        EOR #$01
        STA f1B80,X
        DEX 
        BEQ b2D78
        JMP b2CAC

b2D78   RTS 

j2D79   LDA #$07
        STA colorForCurrentCharacter
        LDA f1A80,X
        STA currentXPosition
        LDA f1B00,X
        STA currentYPosition
        LDA f1B80,X
        AND #$40
        BNE b2DA3
        LDA #$60
        STA a04
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        DEC a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        JMP j2D6A

b2DA3   LDA #$63
        STA a04
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        JMP j2D6A

;-------------------------------------------------------------------------
; s2DB8
;-------------------------------------------------------------------------
s2DB8
        STX a07
j2DBA   LDA f1A81,X
        STA f1A80,X
        LDA f1B01,X
        STA f1B00,X
        LDA f1B81,X
        STA f1B80,X
        CPX a31
        BEQ b2DD4
        INX 
        JMP j2DBA

b2DD4   LDX a07
        DEC a31
        LDA a23
        BEQ b2DE6
        LDA a34
        BNE b2DE6
        LDA bonusBits
        ORA #$40
        STA bonusBits
b2DE6   RTS 

camelCharacters =*-$01
        .BYTE $5E,$5F,$60,$61,$62,$63
;---------------------------------------------------------------------------------
; CheckBulletCollisionWithCamelDroids   
;---------------------------------------------------------------------------------
CheckBulletCollisionWithCamelDroids   
        LDX #$06
b2DEF   CMP camelCharacters,X
        BEQ b2DFA
        DEX 
        BNE b2DEF
        JMP CheckBulletCollisionWithOtherElements

b2DFA   CMP #$62
        BNE b2E00
        DEC currentXPosition
b2E00   CMP #$5F
        BNE b2E06
        INC currentXPosition
b2E06   CMP #$5E
        BNE b2E0C
        INC currentXPosition
b2E0C   CMP #$61
        BNE b2E12
        DEC currentXPosition
b2E12   LDX a31
        LDA currentXPosition
b2E16   CMP f1A80,X
        BEQ b2E1F
b2E1B   DEX 
        BNE b2E16
        RTS 

b2E1F   LDA currentYPosition
        CMP f1B00,X
        BNE b2E1B
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
        LDA #$D0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA f1B80,X
        AND #$40
        BNE b2E59
        LDA f1A80,X
        CMP #$01
        BEQ b2E6A
        DEC f1A80,X
        JMP b2E6A

b2E59   LDA f1A80,X
        CMP #$13
        BEQ b2E6A
        LDA f1B80,X
        AND #$01
        BEQ b2E6A
        INC f1A80,X
b2E6A   LDA #$2F
        STA f1B80,X
        PLA 
        PLA 
        RTS 

j2E72   LDA f1A80,X
        STA currentXPosition
        LDA f1B00,X
        STA currentYPosition
        LDA f1B80,X
        AND #$0F
        BEQ b2EA9
        AND #$07
        STA colorForCurrentCharacter
        LDA f1B80,X
        SEC 
        SBC #$01
        STA f1B80,X
        LDA #$64
        STA a04
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        INC a04
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
j2EA0   LDX a07
        DEX 
        BEQ b2EA8
        JMP b2CAC

b2EA8   RTS 

b2EA9   JSR s2DB8
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA #<p0200
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j2EA0

;-------------------------------------------------------------------------
; AnimateSnitch
;-------------------------------------------------------------------------
AnimateSnitch
        LDA a37
        BEQ b2EC7
        DEC a37
        BEQ b2EC8
b2EC7   RTS 

b2EC8   LDA a38
        STA a37
        LDA a36
        EOR #$01
        STA a36
        AND #$80
        BEQ b2ED9
        JMP DrawTheSnitch

b2ED9   LDA #$02
        STA currentYPosition
        LDA #$01
        STA colorForCurrentCharacter
        LDA a35
        STA currentXPosition
        LDA a36
        AND #$40
        BNE b2F11
        LDA #$20
        STA a04
        DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA #$66
        STA a04
        LDA a36
        AND #$01
        BEQ b2F04
        LDA #$68
        STA a04
b2F04   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        INC a04
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j2F36

b2F11   LDA #$20
        STA a04
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        LDA #$6B
        STA a04
        LDA a36
        AND #$01
        BEQ b2F2A
        LDA #$6D
        STA a04
b2F2A   DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC a04
        JSR WriteCurrentCharacterToCurrentXYPos
j2F36   LDA a36
        AND #$01
        BEQ b2F49
        LDA a36
        AND #$40
        BNE b2F46
        INC a35
        INC a35
b2F46   DEC a35
        RTS 

b2F49   LDA a35
        CMP oldXPosition
        BNE b2F54
        LDA #$80
        STA a36
b2F53   RTS 

b2F54   BMI b2F61
        LDA a36
        AND #$40
        BNE b2F53
        LDA #$41
        STA a36
b2F60   RTS 

b2F61   LDA a36
        AND #$40
        BEQ b2F60
        LDA #$01
        STA a36
        RTS 

;---------------------------------------------------------------------------------
; DrawTheSnitch   
;---------------------------------------------------------------------------------
DrawTheSnitch   
        LDA a36
        AND #$01
        CLC 
        ADC #$6E
        STA a04
        LDA #$01
        STA colorForCurrentCharacter
        LDA #$02
        STA currentYPosition
        LDA a35
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA a35
        CMP oldXPosition
        BNE b2F8B
        RTS 

b2F8B   LDA #$00
        STA a36
        JMP b2F49

;---------------------------------------------------------------------------------
; DrawDeflectedBullet   
;---------------------------------------------------------------------------------
DrawDeflectedBullet   
        LDA a10
        AND #$02
        BNE b2FB1
        LDA #>p0171
        STA colorForCurrentCharacter
        LDA #<p0171
        STA a04
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
j2FA8   LDA a10
        EOR #$02
        STA a10
        JMP WriteCurrentCharacterToCurrentXYPos

b2FB1   LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$15
        BNE b2FD1
        LDA #$00
        STA a10
        RTS 

b2FD1   INC a11
        LDA #>p0170
        STA colorForCurrentCharacter
        LDA #<p0170
        STA a04
        JSR CheckBulletCollision
        JMP j2FA8

j2FE1   LDA a10
        AND #$02
        BNE b2FFA
        LDA #>p0170
        STA colorForCurrentCharacter
        LDA #<p0170
        STA a04
        LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        JMP j2FA8

b2FFA   LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        DEC a11
        BNE b3018
        LDA #$00
        STA a10
        RTS 

b3018   LDA #>p0171
        STA colorForCurrentCharacter
        LDA #<p0171
        STA a04
        JSR CheckBulletCollision
        JMP j2FA8

j3026   LDA a11
        STA currentXPosition
        LDA a12
        STA currentYPosition
        LDA a10
        AND #$02
        BNE b303F
        LDA #>p0108
        STA colorForCurrentCharacter
        LDA #<p0108
        STA a04
        JMP j2FA8

b303F   LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b3057
        LDA #$00
        STA a10
        RTS 

b3057   INC a12
        LDA #>p0109
        STA colorForCurrentCharacter
        LDA #<p0109
        STA a04
        JSR CheckBulletCollision
        JMP j2FA8

;-------------------------------------------------------------------------
; DrawDeflexor
;-------------------------------------------------------------------------
DrawDeflexor
        DEC a3A
        BEQ b306C
        RTS 

b306C   LDA #$80
        STA a3A
        INC a3C
        LDX a3B
        CPX #$00
        BNE b3079
        RTS 

b3079   LDA #$00
        STA a07
        LDA mysteryBonusPerformance,X
        AND #$30
        TAY 
        LDA #$72
        CPY #$10
        BNE b308B
        LDA #$75
b308B   CPY #$20
        BNE b3091
        LDA #$78
b3091   CLC 
        ADC a07
        STA a04
        LDA a3C
        AND #$07
        STA colorForCurrentCharacter
        LDA f1C00,X
        STA currentXPosition
        LDA f1C80,X
        STA currentYPosition
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        DEX 
        BNE b3079
        RTS 

f30B0 = *-$01
        .BYTE $72,$73,$74
f30B3  = *-$01  
        .BYTE $75,$76,$77
f30B6   = *-$01
        .BYTE $78,$79,$7A
shipCharacters  = *-$01
        .BYTE $07,$0B,$0C
;---------------------------------------------------------------------------------
; CheckBulletCollisionWithOtherElements   
;---------------------------------------------------------------------------------
CheckBulletCollisionWithOtherElements   
        LDX #$03
b30BF   CMP f30B0,X
        BEQ b30ED
        CMP f30B3,X
        BEQ b3109
        CMP f30B6,X
        BEQ b30DA
        CMP shipCharacters,X
        BNE b30D6
        JMP JumpToCollisionWithShip

b30D6   DEX 
        BNE b30BF
b30D9   RTS 

b30DA   LDA a10
        AND #$10
        BNE b30D9
        LDA a10
        EOR #$20
        STA a10
        CPX #$01
        BNE b30D9
        JMP j3119

b30ED   LDA a10
        AND #$30
        STA a07
        LDA #$50
        SEC 
        SBC a07
        AND #$30
        STA a07
j30FC   LDA a10
        AND #$8F
        ORA a07
        STA a10
        CPX #$01
        BEQ j3119
        RTS 

b3109   LDA a10
        AND #$30
        STA a07
        LDA #$30
        SEC 
        SBC a07
        STA a07
        JMP j30FC

j3119   LDX a3B
b311B   LDA currentXPosition
        CMP f1C00,X
        BEQ b3126
b3122   DEX 
        BNE b311B
        RTS 

b3126   LDA currentYPosition
        CMP f1C80,X
        BNE b3122
        LDA mysteryBonusPerformance,X
        JSR UpdateMysteryBonusPerformance
        STA mysteryBonusPerformance,X
        LDA #$0F
        STA a3D
        LDA #$F0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA #$00
        STA a39
        RTS 

;-------------------------------------------------------------------------
; UpdateMysteryBonusPerformance
;-------------------------------------------------------------------------
UpdateMysteryBonusPerformance
        AND #$30
        CMP #$20
        BEQ b3159
        CMP #$10
        BEQ b3154
        LDA #$1F
        STA mysteryBonusPerformance,X
        RTS 

b3154   LDA #$0F
        STA mysteryBonusPerformance,X
b3159   LDA mysteryBonusPerformance,X
        RTS 

;---------------------------------------------------------------------------------
; LoadDeflexorsForLevel   
;---------------------------------------------------------------------------------
LoadDeflexorsForLevel   
        LDX a3E
        STX a3B
b3161   LDA f3176,X
        STA f1C00,X
        LDA f3192,X
        STA f1C80,X
        LDA f31AE,X
        STA mysteryBonusPerformance,X
        DEX 
        BNE b3161
        RTS 

f3176  = *-$01
        .BYTE $0A,$0B,$0A,$0B,$01,$03,$05,$07
        .BYTE $14,$12,$10,$0E,$0A,$0B,$07,$0E
        .BYTE $05,$05,$10,$10,$02,$04,$06,$08
        .BYTE $13,$11,$0F,$0D
f3192  = *-$01 
        .BYTE $0D,$0D,$0E,$0E,$0A,$0A,$0A
        .BYTE $0A,$0A,$0A,$0A,$0A,$06,$06,$06
        .BYTE $06,$0E,$15,$0E,$15,$08,$08,$08
        .BYTE $08,$08,$08,$08,$08
f31AE    = *-$01
        .BYTE $1F,$0F,$0F,$1F,$1F,$0F,$1F
        .BYTE $0F,$0F,$1F,$0F,$1F,$2F,$2F,$2F
        .BYTE $2F,$0F,$1F,$1F,$0F,$2F,$2F,$2F
        .BYTE $2F,$2F,$2F,$2F,$2F

; This is level data. Each array controls some property
; for each of the 20 levels.
noOfDroidSquadsForLevel    = *-$01
        .BYTE $01,$02,$03,$00,$02,$02,$02
        .BYTE $02,$00,$03,$03,$03,$02,$03,$03
        .BYTE $00,$03,$03,$03,$03
noOfDronesInLevelDroidSquads    = *-$01
        .BYTE $06,$06,$04,$00,$07,$08,$08
        .BYTE $06,$00,$07,$08,$08,$08,$08,$06
        .BYTE $00,$0A,$09,$08,$07
noOfCameloidsForLevel    = *-$01
        .BYTE $00,$00,$00,$14,$00,$08,$09
        .BYTE $00,$19,$0A,$00,$0B,$0C,$00,$0F
        .BYTE $1E,$00,$14,$14,$14
noOfCameloidsAtAnyOneTimeForLevel    = *-$01
        .BYTE $00,$00,$00,$06,$00,$06,$06
        .BYTE $00,$04,$06,$00,$04,$04,$00,$04
        .BYTE $03,$00,$04,$03,$03
cameloidSpeedForLevel   = *-$01
        .BYTE $00,$00,$00,$04,$00,$07,$07
        .BYTE $00,$03,$06,$00,$05,$05,$00,$04
        .BYTE $03,$00,$03,$03,$03
laserIntervalsForLevels    = *-$01
        .BYTE $10,$0F,$0E,$0D,$0D,$0D,$0C
        .BYTE $0C,$0B,$0B,$0A,$09,$09,$08,$09
        .BYTE $08,$07,$07,$06,$06
snitchSpeedForLevel    = *-$01
        .BYTE $00,$00,$04,$04,$03,$03,$03
        .BYTE $03,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02
deflexorIndexArrayForLevel   = *-$01
        .BYTE $00,$00,$00,$00,$04,$00,$00
        .BYTE $0C,$00,$00,$10,$00,$00,$14,$00
        .BYTE $00,$00,$1C,$00,$1C
configurationForLevel  = *-$01
        .BYTE $00,$00,$00,$01,$01,$00,$82
        .BYTE $01,$01,$00,$01,$82,$00,$01,$82
        .BYTE $82,$00,$01,$82,$82
;-------------------------------------------------------------------------
; LoadSettingsForLevel
;-------------------------------------------------------------------------
LoadSettingsForLevel
        LDX currentLevel
        LDA noOfDroidSquadsForLevel,X
        STA a25
        LDA noOfDronesInLevelDroidSquads,X
        STA a23
        STA a24
        LDA noOfCameloidsForLevel,X
        STA a34
        LDA noOfCameloidsAtAnyOneTimeForLevel,X
        STA a33
        STA a32
        LDA cameloidSpeedForLevel,X
        STA a30
        STA a2F
        LDA laserIntervalsForLevels,X
        STA a18
        STA a19
        LDA snitchSpeedForLevel,X
        STA a37
        STA a38
        LDA deflexorIndexArrayForLevel,X
        STA a3E
        LDA configurationForLevel,X
        STA a3F
        JMP LoadDeflexorsForLevel

;-------------------------------------------------------------------------
; DrawEmptyGrid
;-------------------------------------------------------------------------
DrawEmptyGrid
        LDA #$02
        STA currentYPosition
        JSR SetGridPattern
        LDA #$20
        STA a04
b32C6   LDA #$00
        STA currentXPosition
b32CA   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$16
        BNE b32CA
        INC currentYPosition
        LDA currentYPosition
        CMP #$17
        BNE b32C6
        LDA #>p03
        STA a04
        LDA #<p03
        STA currentYPosition
        LDA #$02
        STA colorForCurrentCharacter
b32E9   LDA #$01
        STA currentXPosition
b32ED   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$15
        BNE b32ED
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b32E9
        RTS 

;-------------------------------------------------------------------------
; DrawEnterZoneInterstitial
;-------------------------------------------------------------------------
DrawEnterZoneInterstitial
        JSR DrawEmptyGrid
        LDA #<p200B
        STA currentYPosition
        LDA #>p200B
        STA a04
b330C   LDA #$04
        STA currentXPosition
b3310   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$13
        BNE b3310
        INC currentYPosition
        LDA currentYPosition
        CMP #$0E
        BNE b330C
        LDA #<p0C05
        STA currentXPosition
        LDA #>p0C05
        STA currentYPosition
        JSR GetLinePtrForCurrentYPosition
        LDX #$00
        LDA #$01
        STA colorForCurrentCharacter
b3334   LDA f3395,X
        STA a04
        STX oldXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX oldXPosition
        INC currentXPosition
        INX 
        CPX #$0D
        BNE b3334
        DEC currentXPosition
        DEC currentXPosition
        JSR GetLinePtrForCurrentYPosition
        INY 
        LDX currentLevel
b3351   LDA (screenLineLoPtr),Y
        CLC 
        ADC #$01
        STA (screenLineLoPtr),Y
        CMP #$3A
        BNE b3369
        LDA #$30
        STA (screenLineLoPtr),Y
        DEY 
        LDA (screenLineLoPtr),Y
        CLC 
        ADC #$01
        STA (screenLineLoPtr),Y
        INY 
b3369   DEX 
        BNE b3351
        JMP PlayInterstitialSoundAndClearGrid

b336F   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b336F
;-------------------------------------------------------------------------
; PerformRollingGridAnimation
;-------------------------------------------------------------------------
PerformRollingGridAnimation
        LDA charsetLocation + $0007
        STA screenLineLoPtr
        LDX #$07
b337D   LDA charsetLocation - $0001,X
        STA charsetLocation,X
        DEX 
        BNE b337D

        LDA screenLineLoPtr
        STA charsetLocation
        LDA a3F
        AND #$80
        BEQ b3394
        JMP ScrollGrid

b3394   RTS 

f3395   .TEXT "ENTER ZONE 00"
;---------------------------------------------------------------------------------
; PlayInterstitialSoundAndClearGrid   
;---------------------------------------------------------------------------------
PlayInterstitialSoundAndClearGrid   
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        LDA #$F0
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
b33AF   LDA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
b33B5   JSR b336F
        INC VICCRA   ;$900A - frequency of sound osc.1 (bass)
        BNE b33B5
        INC VICCRD   ;$900D - frequency of sound osc.4 (noise)
        BNE b33AF
        LDA #$00
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        JMP DrawEmptyGrid

regularGridPattern   =*-$01
        .BYTE $18,$18,$18,$E7,$E7,$18,$18,$18
blockyGridPattern    =*-$01 
        .BYTE $80,$40,$20,$10,$FF,$04,$02,$01
;-------------------------------------------------------------------------
; SetGridPattern
;-------------------------------------------------------------------------
SetGridPattern
        LDA a3F
        BNE b33ED
        LDX #$08
b33E3   LDA regularGridPattern,X
        STA charsetLocation - $0001,X
        DEX 
        BNE b33E3
        RTS 

b33ED   LDA a3F
        CMP #$01
        BNE b33FE
        LDX #$08
        LDA #$00
b33F7   STA charsetLocation - $0001,X
        DEX 
        BNE b33F7
        RTS 

b33FE   LDX #$08
b3400   LDA blockyGridPattern,X
        STA charsetLocation - $0001,X
        DEX 
        BNE b3400
        RTS 

;---------------------------------------------------------------------------------
; ScrollGrid   
;---------------------------------------------------------------------------------
ScrollGrid   
        LDX #$08
b340C   CLC 
        LDA charsetLocation - $0001,X
        ROL 
        ADC #$00
        STA charsetLocation - $0001,X
        DEX 
        BNE b340C
b3419   RTS 

;-------------------------------------------------------------------------
; CheckIfZoneCleared
;-------------------------------------------------------------------------
CheckIfZoneCleared
        LDA a25
        BNE b3419
        LDA a28
        BNE b3419
        LDA a34
        BNE b3419
        LDA a31
        BNE b3419
;---------------------------------------------------------------------------------
; CheatByIncrementingLifeAndSkipLevel   
;---------------------------------------------------------------------------------
CheatByIncrementingLifeAndSkipLevel   
        INC currentLevel
        LDA currentLevel
        CMP #$15
        BNE b3434
        DEC currentLevel
b3434   LDX #$F8
        TXS 
        INC SCREEN_RAM + $0015
        LDA SCREEN_RAM + $0015
        CMP #$3A
        BNE b3444
        DEC SCREEN_RAM + $0015
b3444   JMP CalculateMysteryBonusAndClearZone

;---------------------------------------------------------------------------------
; CollisionWithShip   
;---------------------------------------------------------------------------------
CollisionWithShip   
        LDA oldYPosition
        STA currentYPosition
        LDA #$01
        STA currentXPosition
        LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
b3457   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$15
        BNE b3457
        LDA #$00
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        LDA #$08
        STA VICCRE   ;$900E - sound volume
        LDA #$00
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        LDA #$10
        STA a07
b3478   LDA #$E0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
b347D   LDY #$E0
b347F   DEY 
        BNE b347F
        INC VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        BNE b347D
b3487   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b3487
        LDA #$08
        LDX VICCRF   ;$900F - screen colors: background, border & inverse
        CPX #$08
        BNE b3499
        LDA #$6E
b3499   STA VICCRF   ;$900F - screen colors: background, border & inverse
        LDA oldXPosition
        STA currentXPosition
        LDA oldYPosition
        STA currentYPosition
        LDA a07
        AND #$03
        TAX 
        LDA shipExplosionAnimation,X
        STA a04
        LDA a07
        AND #$07
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC a07
        BNE b3478
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA #$80
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
b34C8   LDA #$0F
        SEC 
        SBC VICCRE   ;$900E - sound volume
        STA tempCounter
        LDA #$07
        STA tempCounter2
        LDX tempCounter
        INX 
        TXA 
        ASL 
        TAX 
b34DA   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b34DA
        DEX 
        BNE b34DA
b34E4   JSR DrawCharacterInShipExplosion
        LDA tempCounter
        BEQ b34FE
        DEC tempCounter
        BEQ b34F3
        LDA tempCounter2
        BNE b34E4
b34F3   LDA #<p0200
        STA a04
        LDA #>p0200
        STA colorForCurrentCharacter
        JSR DrawGridOverDissolvedExplosion
b34FE   DEC VICCRE   ;$900E - sound volume
        BNE b34C8
        JMP DecrementLives

;-------------------------------------------------------------------------
; DrawCharacterInShipExplosion
;-------------------------------------------------------------------------
DrawCharacterInShipExplosion
        LDX tempCounter2
        DEC tempCounter2
        LDA colorsForEffects,X
        STA colorForCurrentCharacter
        LDA #$40
        STA a04
;-------------------------------------------------------------------------
; DrawGridOverDissolvedExplosion
;-------------------------------------------------------------------------
DrawGridOverDissolvedExplosion
        LDA oldXPosition
        SEC 
        SBC tempCounter
        STA currentXPosition
        LDA oldYPosition
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA currentYPosition
        CLC 
        ADC tempCounter
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA oldYPosition
        SEC 
        SBC tempCounter
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA oldXPosition
        STA currentXPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA currentXPosition
        CLC 
        ADC tempCounter
        STA currentXPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA oldYPosition
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA currentYPosition
        CLC 
        ADC tempCounter
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA oldXPosition
        STA currentXPosition
;-------------------------------------------------------------------------
; DrawExplosionCharacterIfFitsOnGrid
;-------------------------------------------------------------------------
DrawExplosionCharacterIfFitsOnGrid
        LDA currentXPosition
        AND #$80
        BEQ b3562
b3561   RTS 

b3562   LDA currentXPosition
        BEQ b3561
        CMP #$15
        BPL b3561
        LDA currentYPosition
        AND #$80
        BNE b3561
        LDA currentYPosition
        CMP #$16
        BPL b3561
        LDA currentYPosition
        AND #$FC
        BEQ b3561
        JMP WriteCurrentCharacterToCurrentXYPos

shipExplosionAnimation   .BYTE $73,$74,$76,$40
colorsForEffects   .BYTE $00,$06,$02,$04,$05,$03,$07,$01
;---------------------------------------------------------------------------------
; DecrementLives   
;---------------------------------------------------------------------------------
DecrementLives   
        DEC SCREEN_RAM + $0015
        LDA SCREEN_RAM + $0015
        CMP #$30
        BEQ b3598
        JMP RestartLevel

b3598   JMP DisplayGameOver

;-------------------------------------------------------------------------
; ClearGameScreen
;-------------------------------------------------------------------------
ClearGameScreen
        LDA #$20
        LDX #$00
b359F   STA SCREEN_RAM + $002C,X
        STA SCREEN_RAM + $0100,X
        DEX 
        BNE b359F
        LDA #$00
        LDX #$00
b35AC   STA scrollingTextStorage,X
        DEX 
        BNE b35AC
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        RTS 

;---------------------------------------------------------------------------------
; RestartLevel   
;---------------------------------------------------------------------------------
RestartLevel   
        JSR ClearGameScreen
        LDA #>p0A07
        STA currentYPosition
        LDA #<p0A07
        STA currentXPosition
        LDA #$03
        STA colorForCurrentCharacter
        LDX #$00
b35D0   LDA f362C,X
        STX a07
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        INC currentXPosition
        INX 
        CPX #$08
        BNE b35D0
        LDA #$00
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        LDX #$0A
b35F5   LDA #$B0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
b35FA   LDY #$00
b35FC   DEY 
        BNE b35FC
        INC VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        BNE b35FA
        DEX 
        BNE b35F5
        LDX #$07
b3609   LDA #$FF
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
b360E   LDY #$00
b3610   DEY 
        BNE b3610
        DEC VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        AND #$80
        BNE b360E
        LDA VICCRE   ;$900E - sound volume
        SEC 
        SBC #$02
        STA VICCRE   ;$900E - sound volume
        DEX 
        BNE b3609
        JMP EnterMainGameLoop

f362C   .TEXT "GOT YOUz"
;---------------------------------------------------------------------------------
; DrawZoneClearedInterstitial   
;---------------------------------------------------------------------------------
DrawZoneClearedInterstitial   
        JSR ClearGameScreen
        LDA #$0F
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        STA VICCRE   ;$900E - sound volume
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
        LDA #$00
        STA a07
b3649   LDA #>p0405
        STA currentYPosition
b364D   LDA #<p0405
        STA currentXPosition
        LDA a07
        AND #$07
        TAX 
        LDA colorsForEffects,X
        STA colorForCurrentCharacter
        LDX #$00
b365D   LDA f36B6,X
        STA a04
        STX tempCounter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDX tempCounter
        INX 
        CPX #$0C
        BNE b365D
        INC a07
        INC currentYPosition
        LDA currentYPosition
        CMP #$0B
        BNE b364D
        LDA #$80
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
b367F   DEY 
        BNE b367F
        INC VICCRB   ;$900B - frequency of sound osc.2 (alto)
        LDA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        CMP #$C0
        BNE b367F
        LDA a07
        AND #$C0
        CMP #$C0
        BNE b3649
        LDX #$07
b3696   LDA #$80
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
b369B   DEY 
        BNE b369B
        INC VICCRB   ;$900B - frequency of sound osc.2 (alto)
        BNE b369B
        LDA VICCRE   ;$900E - sound volume
        SEC 
        SBC #$02
        STA VICCRE   ;$900E - sound volume
        DEX 
        BNE b3696
        LDA mysteryBonusEarned
        BNE MysteryBonusSequence
        JMP EnterMainGameLoop

f36B6   .TEXT "ZONE CLEARED"
;---------------------------------------------------------------------------------
; MysteryBonusSequence   
;---------------------------------------------------------------------------------
MysteryBonusSequence   
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)

        LDX #$08
        LDA #$FF
b36CE   STA charsetLocation - $0001,X
        DEX 
        BNE b36CE

        LDA #$04
        STA colorForCurrentCharacter
        LDA #>p0F00
        STA currentYPosition
b36DC   LDA #<p0F00
        STA currentXPosition
        STA a04
b36E2   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$16
        BNE b36E2
        INC currentYPosition
        LDA currentYPosition
        CMP #$12
        BNE b36DC
        LDA #>SCREEN_RAM + $0002
        STA currentYPosition
        LDA #<SCREEN_RAM + $0002
        STA currentXPosition
        LDX #$00
        LDA #$07
        STA colorForCurrentCharacter
b3703   LDA txtMysteryBonus,X
        STA a04
        STX tempCounter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX tempCounter
        INC currentXPosition
        INX 
        CPX #$12
        BNE b3703
        DEC currentXPosition
        DEC currentXPosition
        DEC currentXPosition
        LDA #$30
        CLC 
        ADC mysteryBonusEarned
        STA a04
        LDA #$03
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX #$04
        LDY mysteryBonusEarned
        JSR IncreaseScore
        LDA #$D0
        STA a07
b3735   LDA a07
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
b373A   DEY 
        BNE b373A
        INC VICCRB   ;$900B - frequency of sound osc.2 (alto)
        BNE b373A
b3742   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b3742
        LDA a07
        AND #$07
        TAX 
        LDA #$FF
        STA charsetLocation,X
        INC a07
        LDA a07
        AND #$07
        TAX 
        LDA #$00
        STA charsetLocation,X
        LDA a07
        BNE b3735
        JMP EnterMainGameLoop

txtMysteryBonus   .TEXT " MYSTERY BONUS    "
;---------------------------------------------------------------------------------
; CalculateMysteryBonusAndClearZone   
;---------------------------------------------------------------------------------
CalculateMysteryBonusAndClearZone   
        LDX #$04
b377A   LDA mysteryBonusPerformance,X
        CMP mysteryBonusBenchmarks,X
        BNE b378F
        DEX 
        BNE b377A

        LDA a3B
        BEQ b378F

        LDA bonusBits
        ORA #$20
        STA bonusBits

b378F   LDA #$08
        STA mysteryBonusEarned

b3793   LDA bonusBits
        CLC 
        ROL 
        STA bonusBits
        BCS b379F
        DEC mysteryBonusEarned
        BNE b3793
b379F   JMP DrawZoneClearedInterstitial

mysteryBonusBenchmarks   =*-$01
        .BYTE $0F,$1F,$1F,$0F
;-------------------------------------------------------------------------
; DrawTitleScreen
;-------------------------------------------------------------------------
DrawTitleScreen
        JSR ClearGameScreen
        LDA #$03
        STA colorForCurrentCharacter
        LDA #$00
        STA currentXPosition
        LDX #$00
b37B3   LDA #$05
        STA currentYPosition
        LDA txtTitleScreenLine29,X
        STA a04
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        INC currentYPosition
        LDA #$07
        STA colorForCurrentCharacter
        LDX a07
        LDA txtTitleScreenLine3F,X
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$01
        STA colorForCurrentCharacter
        INC currentYPosition
        INC currentYPosition
        LDX a07
        LDA txtTitleScreenLine55,X
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        INC colorForCurrentCharacter
        LDX a07
        INC currentYPosition
        INC currentYPosition
        INC colorForCurrentCharacter
        LDA txtTitleScreenLine6B,X
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        INC colorForCurrentCharacter
        LDX a07
        INC currentYPosition
        INC currentYPosition
        LDA txtTitleScreenLine81,X
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        LDA #$01
        STA colorForCurrentCharacter
        INC currentYPosition
        INC currentYPosition
        LDA txtInitialScrollingText,X
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        LDA #$03
        STA colorForCurrentCharacter
        INC currentXPosition
        INX 
        CPX #$16
        BNE b37B3
        JMP DrawHiScore

txtTitleScreenLine29    .TEXT "DESIGN AND PROGRAMMING"
txtTitleScreenLine3F    .TEXT "   BY  JEFF  MINTER   "
txtTitleScreenLine55    .TEXT " ?  1983 BY LLAMASOFT "
txtTitleScreenLine6B    .TEXT " PRESS FIRE FOR START "
txtTitleScreenLine81    .TEXT "SELECT START LEVEL   1"
txtInitialScrollingText .BYTE $96,$95,$94,$93,$92,$91,$90,$8F
                        .BYTE $8E,$8D,$8C,$8B,$8A,$89,$88,$87
                        .BYTE $86,$85,$84,$83,$82,$81
;---------------------------------------------------------------------------------
; TitleScreenLoop   
;---------------------------------------------------------------------------------
TitleScreenLoop   
        LDX #$00
        LDA #>charsetLocation
        STA tempCounter
        LDA #<charsetLocation
        STA a07
b38B7   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b38B7

        LDA txtScrollingAllMatrixPilots,X
        BEQ TitleScreenLoop
        AND #$3F
        CMP #$20
        BNE b38CC
        JMP HandleSpaceInScrollingText

b38CC   CMP #$2E
        BNE b38D3
        JMP HandleElllipsisInScrollingText

b38D3   CMP #$2C
        BNE b38DA
        JMP j394E

b38DA   CLC 
        ASL 
        ASL 
        ASL 
        TAY 
        STX tempCounter2
        LDX #$00
b38E3   LDA charsetLocation + $0200,Y
        STA scrollingTextStorage,X
        INY 
        INX 
        CPX #$08
        BNE b38E3
        ; Fall through

;---------------------------------------------------------------------------------
; ScrollTextLoop   
;---------------------------------------------------------------------------------
ScrollTextLoop   
        LDX tempCounter2
        LDA #$08
        STA tempCounter
b38F5   LDY #$00
b38F7   LDA #$18
        STA a07
        TYA 
        TAX 
        CLC 
j38FE   ROL scrollingTextStorage,X
        PHP 
        TXA 
        CLC 
        ADC #$08
        TAX 
        DEC a07
        BEQ b390F
        PLP 
        JMP j38FE

b390F   PLP 
        INY 
        CPY #$08
        BNE b38F7
        LDX #$0A
b3917   DEY 
        BNE b3917
        DEX 
        BNE b3917
b391D   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b391D
        DEC tempCounter
        BNE b38F5
        LDX tempCounter2
        INX 
        JMP TitleScreenCheckJoystickKeyboardInput

        .BYTE $00
;---------------------------------------------------------------------------------
; HandleSpaceInScrollingText   
;---------------------------------------------------------------------------------
HandleSpaceInScrollingText   
        STX tempCounter2
        LDA #$00
        LDX #$08
b3935   STA charsetLocation + $03FF,X
        DEX 
        BNE b3935
        JMP ScrollTextLoop

;---------------------------------------------------------------------------------
; HandleElllipsisInScrollingText   
;---------------------------------------------------------------------------------
HandleElllipsisInScrollingText   
        STX tempCounter2
        LDX #$08
b3942   LDA charsetLocation + $03B7,X
        STA charsetLocation + $03FF,X
        DEX 
        BNE b3942
        JMP ScrollTextLoop

j394E   STX tempCounter2
        LDX #$08
b3952   LDA charsetLocation + $03C7,X
        STA charsetLocation + $03FF,X
        DEX 
        BNE b3952
        JMP ScrollTextLoop

;---------------------------------------------------------------------------------
; TitleScreenCheckJoystickKeyboardInput   
;---------------------------------------------------------------------------------
TitleScreenCheckJoystickKeyboardInput   
        STX tempCounter2
        JSR GetJoystickInput
        LDA a0D
        AND #$02
        BEQ b3974
        INC VICCR1   ;$9001 - vertical picture origin
        LDA VICCR1   ;$9001 - vertical picture origin
        AND #$3F
        STA VICCR1   ;$9001 - vertical picture origin
b3974   LDA a0D
        AND #$08
        BEQ b3985
        INC VICCR0   ;$9000 - left edge of picture & interlace switch
        LDA VICCR0   ;$9000 - left edge of picture & interlace switch
        AND #$1F
        STA VICCR0   ;$9000 - left edge of picture & interlace switch
b3985   LDA lastKeyPressed
        CMP #$40
        BEQ b399A
        INC SCREEN_RAM + $0133
        LDA SCREEN_RAM + $0133
        CMP #$37
        BNE b399A
        LDA #$31
        STA SCREEN_RAM + $0133
b399A   LDA a0D
        AND #$80
        BNE b39A5
        LDX tempCounter2
        JMP b38B7

b39A5   LDA SCREEN_RAM + $0133
        SEC 
        SBC #$30
        STA currentLevel
        JMP ClearGameScreen

;---------------------------------------------------------------------------------
; DisplayGameOver   
;---------------------------------------------------------------------------------
DisplayGameOver   
        JSR ClearGameScreen
        LDA #$07
        STA colorForCurrentCharacter
        LDX #$00
        LDA #>p0A07
        STA currentYPosition
        LDA #<p0A07
        STA currentXPosition
b39C1   LDA f3A2F,X
        STA a04
        STX a07
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        INC currentXPosition
        INX 
        CPX #$09
        BNE b39C1
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        LDX #$0F
b39DB   LDA #$80
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
b39E6   LDY #$00
b39E8   DEY 
        BNE b39E8
        INC VICCRA   ;$900A - frequency of sound osc.1 (bass)
        INC VICCRB   ;$900B - frequency of sound osc.2 (alto)
        INC VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        BNE b39E6
        LDA VICCRE   ;$900E - sound volume
        SEC 
        SBC #$01
        STA VICCRE   ;$900E - sound volume
        DEX 
        BNE b39DB
        LDX #$01
b3A04   LDA SCREEN_RAM + $0009,X
        CMP charsetLocation + $00F0,X
        BEQ b3A10
        BMI b3A15
        BPL b3A21
b3A10   INX 
        CPX #$08
        BNE b3A04
p3A16   =*+$01
b3A15   JSR DrawTitleScreen
        JSR DrawTitleText
        LDX #$F8
        TXS 
        JMP BeginGameEntrySequence

b3A21   LDX #$07
b3A23   LDA SCREEN_RAM + $0009,X
        STA charsetLocation + $00F0,X
        DEX 
        BNE b3A23
        JMP b3A15

f3A2F   .TEXT "GAME OVER"
;---------------------------------------------------------------------------------
; DrawHiScore   
;---------------------------------------------------------------------------------
DrawHiScore   
        LDA #$14
        STA currentYPosition
        LDX #$00
b3A3E   LDA txtHiScore,X
        STA a04
        LDA #$04
        STA colorForCurrentCharacter
        TXA 
        CLC 
        ADC #$03
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
        LDA charsetLocation + $00F1,X
        STA a04
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX a07
        INX 
        CPX #$07
        BNE b3A3E
        JMP TitleScreenLoop

;-------------------------------------------------------------------------
; ReduceScore
;-------------------------------------------------------------------------
ReduceScore
        LDA #$01
        STA a39
        LDX #$06
b3A77   DEC SCREEN_RAM + $0009,X
        LDA SCREEN_RAM + $0009,X
        CMP #$2F
        BNE b3A93
        LDA #$39
        STA SCREEN_RAM + $0009,X
        DEX 
        BNE b3A77
        LDX #$07
        LDA #$30
b3A8D   STA SCREEN_RAM + $0009,X
        DEX 
        BNE b3A8D
b3A93   RTS 

txtHiScore   .TEXT "HISCORE"
txtScrollingAllMatrixPilots   .BYTE $09,$0E,$20,$14,$08,$05,$20,$14
        .BYTE $05,$0E,$20,$19,$05,$01,$12,$13
        .BYTE $20,$01,$06,$14,$05,$12,$20,$14
        .BYTE $08,$05,$20,$07,$12,$09,$04,$20
        .BYTE $17,$01,$12,$13,$2C,$20,$09,$0E
        .BYTE $14,$05,$12,$07,$01,$0C,$01,$03
        .BYTE $14,$09,$03,$20,$14,$05,$0E,$13
        .BYTE $09,$0F,$0E,$20,$09,$0E,$03,$12
        .BYTE $05,$01,$13,$05,$04,$20,$15,$0E
        .BYTE $14,$09,$0C,$20,$14,$08,$05,$20
        .BYTE $06,$05,$01,$12,$13,$20,$0F,$06
        .BYTE $20,$0D,$01,$0E,$0B,$09,$0E,$04
        .BYTE $20,$17,$05,$12,$05,$20,$12,$05
        .BYTE $01,$0C,$09,$13,$05,$04,$20,$01
        .BYTE $0E,$04,$20,$14,$08,$05,$20,$04
        .BYTE $12,$0F,$09,$04,$13,$20,$12,$05
        .BYTE $14,$15,$12,$0E,$05,$04,$20,$17
        .BYTE $09,$14,$08,$20,$13,$15,$10,$05
        .BYTE $12,$09,$0F,$12,$20,$17,$05,$01
        .BYTE $10,$0F,$0E,$12,$19,$20,$14,$0F
        .BYTE $20,$01,$14,$14,$01,$03,$0B,$20
        .BYTE $14,$08,$05,$20,$07,$12,$09,$04
        .BYTE $2E,$2E,$2E,$2E,$20,$03,$01,$0E
        .BYTE $20,$19,$0F,$15,$20,$06,$12,$05
        .BYTE $05,$20,$01,$0C,$0C,$20,$14,$17
        .BYTE $05,$0E,$14,$19,$20,$07,$12,$09
        .BYTE $04,$20,$13,$05,$03,$14,$0F,$12
        .BYTE $13,$20,$0F,$12,$20,$02,$05,$20
        .BYTE $02,$0C,$01,$13,$14,$05,$04,$20
        .BYTE $14,$0F,$20,$01,$0C,$09,$05,$0E
        .BYTE $20,$08,$05,$0C,$0C,$2E,$2E,$2E
        .BYTE $2E,$2E,$2E,$20,$20,$20,$20,$20
        .BYTE $01,$4B,$20,$20,$38
;---------------------------------------------------------------------------------
; CopyCharsetIntoPosition   
;---------------------------------------------------------------------------------
CopyCharsetIntoPosition   
        LDX #$00
b3BA2   LDA f3C00,X
        STA charsetLocation,X
        LDA f3D00,X
        STA charsetLocation + $0100,X
        LDA f3E00,X
        STA charsetLocation + $0200,X
        LDA f3F00,X
        STA charsetLocation + $0300,X
        INX 
        BNE b3BA2
        JMP InitializeGame

        .TEXT "8SNITCH.", $BF, "SNITN1/ISNITN2/TSNITND/6SNITP ", $00
        .TEXT "6SNITX ", $00, "5SNLOP 4", $7D, "SNLOP14"
.include "charset.asm"
