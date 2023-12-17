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

screenLineLoPtr                              = $00
screenLineHiPtr                              = $01
currentXPosition                             = $02
currentYPosition                             = $03
currentCharacter                             = $04
colorForCurrentCharacter                     = $05
gridStartLoPtr                               = $06
gridStartHiPtr                               = $07
tempCounter                                  = $08
tempCounter2                                 = $09
previousShipXPosition                        = $0A
previousShipYPosition                        = $0B
shipMovementDirection                        = $0C
joystickInput                                = $0D
frameControlCounter                          = $0E
bulletType                                   = $10
bulletXPosition                              = $11
bulletYPosition                              = $12
bulletFrameCounter                           = $13
bottomZapperXPos                             = $14
leftZapperYPos                               = $15
zapperFrameCounter                           = $16
zapperSwitch                                 = $17
currentLaserInterval                         = $18
laserIntervalForLevel                        = $19
oldLeftLazerXPos                             = $1A
oldBottomZapperXPos                          = $1B
oldLeftZapperYPos                            = $1C
laserChar                                    = $1D
podDestroyedSoundEffect                      = $1E
droidAnimationFrameRate                      = $22
originalNoOfDronesInDroidSquadInCurrentLevel = $23
currentNoOfDronesLeftInCurrentDroidSquad     = $24
noOfDroidSquadsLeftInCurrentLevel            = $25
counterBetweenDroidSquads                    = $26
initialCounterBetweenDroidSquads             = $27
currentDroidsLeft                            = $28
currentDroidChar                             = $29
currentLevel                                 = $2A
mainCounterBetweenLasers                     = $2B
initialMainCounterBetweenLasers              = $2C
currentCounterBetweenLsers                   = $2D
initialCounterBetweenLasers                  = $2E
cameloidAnimationInteveralForLevel           = $2F
currentCameloidAnimationInterval             = $30
currentCameloidsLeft                         = $31
currrentNoOfCameloidsAtOneTimeForLevel       = $32
originalNoOFCameloidsAtOneTimeForLevel       = $33
noOfCameloidsLeftInCurrentLevel              = $34
snitchCurrentXPos                            = $35
snitchStateControl                           = $36
currentSnitchAnimationInterval               = $37
snitchAnimationIntervalForLevel              = $38
explosionSoundControl                        = $39
deflexorFrameRate                            = $3A
currentDeflexorIndex                         = $3B
currentDeflexorColor                         = $3C
deflexorSoundControl                         = $3D
deflexorIndexForLevel                        = $3E
currentLevelConfiguration                    = $3F
mysteryBonusEarned                           = $40
bonusBits                                    = $41
lastKeyPressed = $C5

previousLasersLoPtrsArray                    = $1300
previousLasersHiPtrArray                     = $1320
previousHiScore                              = $14F0
wrongCharSetLocation                         = $1509
droidSquadsXPosArray                         = $1900
droidSquadsYPosArray                         = $1980

droidSquadState                              = $1A00

cameloidsCurrentXPosArray                    = $1A80
cameloidsCurrentYPosArray                    = $1B00
cameloidsColorArray                          = $1B80

currentDeflexorXPosArray                     = $1C00
currentDeflexorYPosArray                     = $1C80
mysteryBonusPerformance                      = $1D00
charsetLocation                              = $1400
alphabetCharsetStorage                       = $1600
scrollingTextStorage                         = $1800

gridLineColorIndex = $06

;
; **** POINTERS ****
;
SCREEN_RAM                                   = $1000
COLOR_RAM                                    = $9400
screenLinesLoPtrArray = $0340
screenLinesHiPtrArray = $0360
OFFSET_TO_COLOR_RAM                          = $84

BLACK                                        = $00
WHITE                                        = $01
RED                                          = $02
CYAN                                         = $03
PURPLE                                       = $04
GREEN                                        = $05
BLUE                                         = $06
YELLOW                                       = $07
GRID_BLUE                                    = $02


GRID                                         = $00
LEFT_ZAPPER                                  = $01
BOTTOM_ZAPPER                                = $02
HORIZ_LASER1                                 = $03
HORIZ_LASER2                                 = $04
VERTICAL_LASER1                              = $05
VERTICAL_LASER2                              = $06
SHIP                                         = $07
BULLET_DOWN                                  = $08
BULLET_UP                                    = $09
BOMB                                         = $0A
SHIP_LEFT                                    = $0B
SHIP_RIGHT                                   = $0C
POD1                                         = $0D
POD2                                         = $0E
POD3                                         = $0F
POD4                                         = $10
POD5                                         = $11
POD6                                         = $12
DROID1                                       = $13
DROID2                                       = $14
DROID3                                       = $15
;HALF_SHIP                                    = $16
HALF_SHIP2                                   = $17
;MEN_LEFT                                     = $1B
;MEN_RIGHT                                    = $1C
;HIGH_LEFT                                    = $1D
;HIGH_RIGHT                                   = $1E
;RIGHT_ARROW                                  = $1F
SPACE                                        = $20
BOTTOM_ZAPPER_LEFT                           = $3A
BOTTOM_ZAPPER_RIGHT                          = $3B
LEFT_ZAPPER_TOP                              = $3C
LEFT_ZAPPER_BOTTOM                           = $3D
;CROSS_HAIRS                                  = $5D
CAMELOID                                     = $5E
CAMELOID_LEFT                                = $5F
CAMELOID_RIGHT                               = $60
LEFT_CAMELOID                                = $61
LEFT_CAMELOID_RIGHT                          = $62
LEFT_CAMELOID_LEFT                           = $63
BONUS_LEFT                                   = $64
;BONUS_RIGHT                                  = $65
SNITCH_RUN_RIGHT                             = $66
SNITCH_LEFT                                  = $68
;SNITCH_RIGHT                                 = $69
;SNITCH_RUN_LEFT                              = $6A
;SNITCH_LEFT1                                 = $6C
SNITCH_RIGHT1                                = $6D
;SNITCH_WAVING                                = $6E
;SNITCH_WAVING1                               = $6F
BULLET_LEFT                                  = $70
BULLET_RIGHT                                 = $71
DEFLEX1                                      = $72
EXPLOSION1                                   = $73
EXPLOSION2                                   = $74
DEFLEX2                                      = $75
EXPLOSTION3                                  = $76
DOT2                                         = $77
BIG_DOT                                      = $78
COMMA                                        = $79
EXCLAMATION                                  = $7A

;
; **** PREDEFINED LABELS ****
;
VICCR0                                       = $9000
VICCR1                                       = $9001
VICCR4                                       = $9004
VICCR5                                       = $9005
VICCRA                                       = $900A
VICCRB                                       = $900B
VICCRC                                       = $900C
VICCRD                                       = $900D
VICCRE                                       = $900E
VICCRF                                       = $900F
VIA1IER                                      = $911E
VIA1PA2                                      = $911F
VIA2PB                                       = $9120
VIA2DDRB                                     = $9122

* = $1201
;-----------------------------------------------------------------------------------------------------
; SYS 8192 (PrepareGame)
; This launches the program from address $2000, i.e. PrepareGame.
;-----------------------------------------------------------------------------------------------------
; $9E = SYS
;                                 $38,$31,$39,$32 = 8192 ($2000 in hex)
        .BYTE $0B,$08,$0A,$00,$9E,$38,$31,$39,$32,$00,$00,$00
        .FILL $df3, $BD

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
        LDA currentCharacter
        STA (screenLineLoPtr),Y
        LDA screenLineHiPtr
        CLC
        ADC #OFFSET_TO_COLOR_RAM
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
b2076   STA previousHiScore,X
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
                            .BYTE $23,$24,$22,$25,$26,$27,$20,$19 ; MATRIX
                            .BYTE $1A
                            .TEXT " 0000000  ", $07, " 5!!!!!!               "
colorsBannerText            .BYTE $20,$43,$43,$43,$43,$43,$43,$40
                            .BYTE $44,$44,$40,$47,$47,$47,$47,$47
                            .BYTE $47,$47,$40,$40,$45,$40,$43,$44
                            .BYTE $44,$44,$44,$44,$44,$40,$40,$40
                            .BYTE $40,$40,$40,$40,$40,$40,$40,$40
                            .BYTE $40,$40,$40,$40
gridLineIntroSequenceColors .BYTE $40,$06,$02,$04,$05,$03,$07,$01
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
        ADC #OFFSET_TO_COLOR_RAM
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
        LDA #GRID_BLUE
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
        LDA #$15
        STA previousShipYPosition
        LDA #$0A
        STA previousShipXPosition
        LDA #$09
        STA gridStartLoPtr
b2253   LDA #$0F
        SEC
        SBC gridStartLoPtr
        STA VICCRE   ;$900E - sound volume
        LDA previousShipXPosition
        SEC
        SBC gridStartLoPtr
        STA currentXPosition
        LDA previousShipYPosition
        SBC gridStartLoPtr
        SEC
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA previousShipXPosition
        CLC
        ADC gridStartLoPtr
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC gridStartLoPtr
        DEC currentXPosition
        INC currentYPosition
        LDA #HALF_SHIP2
        STA currentCharacter
        LDA #CYAN
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA previousShipXPosition
        SEC
        SBC gridStartLoPtr
        STA currentXPosition
        DEC currentCharacter
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
        LDA previousShipXPosition
        STA currentXPosition
        LDA previousShipYPosition
        STA currentYPosition
        LDA #SHIP
        STA currentCharacter
        LDA #GREEN
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
b2305   STA previousLasersHiPtrArray,X
        DEX
        BNE b2305
        STA bulletType
        STA zapperSwitch
        STA explosionSoundControl
        STA podDestroyedSoundEffect
        STA currentDroidsLeft
        STA currentCameloidsLeft
        STA snitchStateControl
        STA deflexorSoundControl
        STA mysteryBonusEarned
        LDA #$03
        STA leftZapperYPos
        LDA #$01
        STA bottomZapperXPos
        STA zapperFrameCounter
        LDA #$02
        STA snitchCurrentXPos
        LDA #$20
        STA counterBetweenDroidSquads
        STA initialCounterBetweenDroidSquads
        STA currentCounterBetweenLsers
        STA initialCounterBetweenLasers
        LDA #DROID1
        STA currentDroidChar
        LDA #$40
        STA mainCounterBetweenLasers
        STA initialMainCounterBetweenLasers
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
        STA joystickInput
        RTS

droidDecaySequence
                        .BYTE $0C,POD1, POD2, POD3, POD4, POD5, POD6, BOMB

thingsThatKillAShip     .BYTE BULLET_DOWN, HORIZ_LASER1, HORIZ_LASER2
                        .BYTE VERTICAL_LASER1, VERTICAL_LASER2, BOMB
                        .BYTE DROID1, DROID2, DROID3



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
        LDA previousShipXPosition
        STA currentXPosition
        CMP #$03
        BEQ b23C4
        CMP #$12
        BNE b23CA
b23C4   LDA bonusBits
        AND #$FB
        STA bonusBits
b23CA   LDA previousShipYPosition
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA joystickInput
        AND #$01
        BEQ b23E9
        DEC currentYPosition
        LDA currentYPosition
        CMP #$06
        BNE b23E9
        INC currentYPosition
b23E9   LDA joystickInput
        AND #$02
        BEQ b23F9
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b23F9
        DEC currentYPosition
b23F9   LDA #$00
        STA shipMovementDirection
        LDA joystickInput
        AND #$04
        BEQ b2411
        LDA #$01
        STA shipMovementDirection
        DEC currentXPosition
        BNE b2411
        INC currentXPosition
        LDA #$00
        STA shipMovementDirection
b2411   LDA joystickInput
        AND #$08
        BEQ b2429
        LDA #$02
        STA shipMovementDirection
        INC currentXPosition
        LDA currentXPosition
        CMP #$15
        BNE b2429
        DEC currentXPosition
        LDA #$00
        STA shipMovementDirection
b2429   JSR CheckForCollisionWithNewMovememnt
        LDA joystickInput
        AND #$80
        BEQ b2449
        LDA bulletType
        BNE b2449
        LDA previousShipXPosition
        STA bulletXPosition
        LDA previousShipYPosition
        STA bulletYPosition
        DEC bulletYPosition
        LDA #$01
        STA bulletType
        LDA #$DE
        STA VICCRD   ;$900D - frequency of sound osc.4 (noise)
b2449   LDA shipMovementDirection
        BNE MoveShipLeftOrRight
;-------------------------------------------------------------------------
; DrawShipInCurrentPositiong
;-------------------------------------------------------------------------
DrawShipInCurrentPositiong
        LDA previousShipXPosition
        STA currentXPosition
        LDA previousShipYPosition
        STA currentYPosition
        LDA #SHIP
        STA currentCharacter
        LDA #GREEN
        STA colorForCurrentCharacter
        JMP WriteCurrentCharacterToCurrentXYPos

;---------------------------------------------------------------------------------
; MoveShipLeftOrRight
;---------------------------------------------------------------------------------
MoveShipLeftOrRight
        LDA previousShipYPosition
        STA currentYPosition
        LDA #GREEN
        STA colorForCurrentCharacter
        LDA shipMovementDirection
        CMP #$02
        BEQ b2480
        ; Move ship right.
        LDA #SHIP_LEFT
        STA currentCharacter
        LDA previousShipXPosition
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentCharacter
        INC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos

b2480   LDA #SHIP_RIGHT
        STA currentCharacter
        LDA previousShipXPosition
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentCharacter
        DEC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos

;---------------------------------------------------------------------------------
; DrawGridAtOldPosition
;---------------------------------------------------------------------------------
DrawGridAtOldPosition
        JSR DrawLasers
        LDA shipMovementDirection
        BNE b249A
        RTS

b249A   JSR DrawShipInCurrentPositiong
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        INC currentXPosition
        LDA shipMovementDirection
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
b24F7   LDA bulletType
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

b2514   LDA bulletType
        AND #$02
        BNE b2536
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
        JSR CheckBulletCollision
        LDA #BULLET_UP
        STA currentCharacter
        LDA bulletType
        EOR #$02
        STA bulletType
        JMP WriteCurrentCharacterToCurrentXYPos

b2536   LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA #GRID
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC bulletYPosition
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b2558
        LDA #$00
        STA bulletType
        RTS

b2558   LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_DOWN
        STA currentCharacter
        LDA bulletType
        EOR #$02
        STA bulletType
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
        LDA zapperSwitch
        BNE b25B9
        LDA #LEFT_ZAPPER_TOP
        STA currentCharacter
        LDA #CYAN
        STA colorForCurrentCharacter
        LDA #$00
        STA currentXPosition
        LDA leftZapperYPos
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentCharacter
        INC currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$16
        STA currentYPosition
        LDA #BOTTOM_ZAPPER_LEFT
        STA currentCharacter
        LDA bottomZapperXPos
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        INC currentCharacter
        LDA #$01
        STA zapperSwitch
        JMP WriteCurrentCharacterToCurrentXYPos

b25B9   LDA #SPACE
        STA currentCharacter
        LDA #$00
        STA currentXPosition
        LDA leftZapperYPos
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$16
        STA currentYPosition
        LDA bottomZapperXPos
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC bottomZapperXPos
        LDA bottomZapperXPos
        CMP #$15
        BNE b25E9
        LDA #$01
        STA bottomZapperXPos
b25E9   INC leftZapperYPos
        LDA leftZapperYPos
        CMP #$16
        BNE b25F5
        LDA #$03
        STA leftZapperYPos
b25F5   LDA #$00
        STA zapperSwitch
        LDA #CYAN
        STA colorForCurrentCharacter
        LDA bottomZapperXPos
        STA currentXPosition
        LDA #BOTTOM_ZAPPER
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$00
        STA currentXPosition
        LDA leftZapperYPos
        STA currentYPosition
        LDA #LEFT_ZAPPER
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA snitchStateControl
        AND #$80
        BEQ b2627
        LDA bottomZapperXPos
        CMP previousShipXPosition
        BNE b2627
        LDA #$01
        STA currentLaserInterval
b2627   DEC currentLaserInterval
        BNE b2643
        LDA bottomZapperXPos
        STA oldBottomZapperXPos
        LDA leftZapperYPos
        STA oldLeftZapperYPos
        LDA #$01
        STA oldLeftLazerXPos
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
        LDA currentLaserInterval
        BNE b2643
        LDA oldLeftLazerXPos
        CMP oldBottomZapperXPos
        BEQ b2683
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA oldLeftLazerXPos
        STA currentXPosition
        LDA oldLeftZapperYPos
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC oldLeftLazerXPos
        INC currentXPosition
        JMP DrawLaserFromZappers

JumpToCollisionWithShip
        JMP CollisionWithShip

DrawLaserFromZappers
        LDA #WHITE
        STA colorForCurrentCharacter
        INC laserChar
        LDA laserChar
        AND #$01
        CLC
        ADC #$03
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
b2683   LDA #$15
        STA currentYPosition
        LDA oldBottomZapperXPos
        STA currentXPosition
        LDA laserChar
        AND #$01
        CLC
        ADC #$05
        STA currentCharacter
b2694   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b2694
        LDA oldBottomZapperXPos
        CMP previousShipXPosition
        BEQ JumpToCollisionWithShip
        LDA oldLeftLazerXPos
        CMP oldBottomZapperXPos
        BEQ b26AC
        RTS

b26AC   LDA #$15
        STA currentYPosition
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA #GRID
        STA currentCharacter
        STA VICCRA   ;$900A - frequency of sound osc.1 (bass)
        LDA oldBottomZapperXPos
        STA currentXPosition
b26BF   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b26BF
        LDA oldLeftZapperYPos
        STA currentYPosition
        LDA #YELLOW
        STA colorForCurrentCharacter
        LDA #POD3
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA laserIntervalForLevel
        STA currentLaserInterval
        LDA #<SCREEN_RAM + $0042
        STA gridStartLoPtr
        LDA #>SCREEN_RAM + $0042
        STA gridStartHiPtr
        LDA bonusBits
        ORA #$08
        STA bonusBits
        LDY #$00
b26ED   LDA (gridStartLoPtr),Y
        BEQ b26F4
        JSR DrawBombLeftByLaser
b26F4   INC gridStartLoPtr
        BNE b26ED
        INC gridStartHiPtr
        LDA gridStartHiPtr
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
        STA (gridStartLoPtr),Y
        LDA bonusBits
        AND #$F7
        STA bonusBits
        CPX #$07
        BEQ b2721
        RTS

b2721   LDX #$20
b2723   LDA previousLasersHiPtrArray,X
        BEQ b2730
        DEX
        BNE b2723
        LDA #$0D
        STA (gridStartLoPtr),Y
        RTS

b2730   LDA gridStartLoPtr
        STA previousLasersLoPtrsArray ,X
        LDA gridStartHiPtr
        STA previousLasersHiPtrArray,X
        RTS

;-------------------------------------------------------------------------
; DrawLasers
;-------------------------------------------------------------------------
DrawLasers
        LDX #$20
b273D   LDA previousLasersHiPtrArray,X
        BEQ b2745
        JSR DrawLaser
b2745   DEX
        BNE b273D
        RTS

shipValues =*-$01
        .BYTE SHIP, SHIP_LEFT, SHIP_RIGHT, SHIP_RIGHT
bottomZapperValues =*-$01
        .BYTE SPACE, BOTTOM_ZAPPER, BOTTOM_ZAPPER_LEFT, BOTTOM_ZAPPER_RIGHT
;-------------------------------------------------------------------------
; DrawLaser
;-------------------------------------------------------------------------
DrawLaser
        STX tempCounter
        LDA previousLasersLoPtrsArray ,X
        STA gridStartLoPtr
        LDA previousLasersHiPtrArray,X
        STA gridStartHiPtr
        LDY #$00
        TYA
        STA (gridStartLoPtr),Y
        LDA gridStartHiPtr
        PHA
        CLC
        ADC #OFFSET_TO_COLOR_RAM
        STA gridStartHiPtr
        LDA #GRID_BLUE
        STA (gridStartLoPtr),Y
        PLA
        STA gridStartHiPtr
        LDA gridStartLoPtr
        CLC
        ADC #$16
        STA gridStartLoPtr
        LDA gridStartHiPtr
        ADC #$00
        STA gridStartHiPtr
        LDA (gridStartLoPtr),Y
        LDX #$04
b2782   CMP shipValues,X
        BNE b278A
        JMP JumpToCollisionWithShip

b278A   CMP bottomZapperValues,X
        BEQ b27AE
        DEX
        BNE b2782
        LDA #$0A
        STA (gridStartLoPtr),Y
        LDA gridStartHiPtr
        PHA
        CLC
        ADC #OFFSET_TO_COLOR_RAM
        STA gridStartHiPtr
        LDA #$01
        STA (gridStartLoPtr),Y
        LDX tempCounter
        LDA gridStartLoPtr
        STA previousLasersLoPtrsArray ,X
        PLA
        STA previousLasersHiPtrArray,X
        RTS

b27AE   LDX tempCounter
        LDA #$00
        STA previousLasersHiPtrArray,X
        RTS

;---------------------------------------------------------------------------------
; CheckForShipCollindingWithSomething
;---------------------------------------------------------------------------------
CheckForShipCollidingWithSomething
        JSR GetCharacterAtCurrentXYPos
        BEQ b27CC
        LDX thingsThatKillAShip
b27BE   CMP thingsThatKillAShip,X
        BEQ b27C9
        DEX
        BNE b27BE
        STX shipMovementDirection
        RTS

b27C9   JMP JumpToCollisionWithShip

b27CC   LDA currentXPosition
        STA previousShipXPosition
        LDA currentYPosition
        STA previousShipYPosition
        RTS

;-------------------------------------------------------------------------
; CheckForCollisionWithNewMovememnt
;-------------------------------------------------------------------------
CheckForCollisionWithNewMovememnt
        LDA currentXPosition
        CMP previousShipXPosition
        BEQ CheckForShipCollidingWithSomething
        LDA currentYPosition
        CMP previousShipYPosition
        BEQ CheckForShipCollidingWithSomething
        LDA currentXPosition
        PHA
        LDA previousShipXPosition
        STA currentXPosition
        JSR GetCharacterAtCurrentXYPos
        BNE b27F3
        PLA
        STA currentXPosition
        JMP CheckForShipCollidingWithSomething

b27F3   LDA previousShipYPosition
        STA currentYPosition
        PLA
        STA currentXPosition
        JMP CheckForShipCollidingWithSomething

;-------------------------------------------------------------------------
; CheckBulletCollision
;-------------------------------------------------------------------------
CheckBulletCollision
        JSR GetCharacterAtCurrentXYPos
        CMP #BULLET_DOWN
        BEQ b283A
        LDX #$07
b2806   CMP droidDecaySequence - $0001,X
        BEQ b2811
        DEX
        BNE b2806
        JMP CheckBulletCollisionWithDroidSquad

b2811   LDA droidDecaySequence - $0002,X
        STA currentCharacter
        LDA #YELLOW
        STA colorForCurrentCharacter
        CPX #$02
        BNE b2831
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDX #$06
        LDY #$01
        JSR IncreaseScore
        LDA #$04
        STA podDestroyedSoundEffect
b2831   JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$00
        STA bulletType
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
        STA wrongCharSetLocation
        RTS

;-------------------------------------------------------------------------
; PlayMoreSoundEffects
;-------------------------------------------------------------------------
PlayMoreSoundEffects
        JSR UpdateSoundEffects
        LDA podDestroyedSoundEffect
        BNE b2867
        RTS

b2867   LDA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        AND #$80
        BNE b287E
        LDA podDestroyedSoundEffect
        ASL
        ASL
        CLC
        ADC podDestroyedSoundEffect
        STA VICCRE   ;$900E - sound volume
        LDA #$F6
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
        RTS

b287E   INC VICCRB   ;$900B - frequency of sound osc.2 (alto)
        BEQ b2884
b2883   RTS

b2884   DEC podDestroyedSoundEffect
        BNE b2883
        LDA #$0F
        STA VICCRE   ;$900E - sound volume
        RTS

;-------------------------------------------------------------------------
; UpdateSoundEffects
;-------------------------------------------------------------------------
UpdateSoundEffects
        LDA deflexorSoundControl
        BNE b28B2
        LDA explosionSoundControl
        BNE b2897
        RTS

b2897   LDA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        CMP #$D0
        BEQ b28A2
        DEC VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        RTS

b28A2   DEC explosionSoundControl
        BEQ b28AC
        LDA #$D8
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        RTS

b28AC   LDA #$00
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
b28B1   RTS

b28B2   DEC deflexorSoundControl
        LDA deflexorSoundControl
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
        DEC droidAnimationFrameRate
        LDA droidAnimationFrameRate
        CMP #$01
        BEQ b28CF
b28CE   RTS

b28CF   LDA #$00
        STA droidAnimationFrameRate
        JSR AnimateSnitch
        LDA noOfDroidSquadsLeftInCurrentLevel
        BNE b28DD
        JMP j2954

b28DD   LDA counterBetweenDroidSquads
        BEQ b28CE
        CMP #$01
        BEQ b28EA
        DEC counterBetweenDroidSquads
        JMP j2954

b28EA   LDA currentNoOfDronesLeftInCurrentDroidSquad
        CMP originalNoOfDronesInDroidSquadInCurrentLevel
        BNE b292B
        INC currentDroidsLeft
        LDX currentDroidsLeft
        LDA #$03
        STA droidSquadsYPosArray,X
        LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        AND #$01
        BEQ b290D
        LDA #$0A
        STA droidSquadsXPosArray,X
        LDA #$81
        STA droidSquadState,X
        JMP j2917

b290D   LDA #$0C
        STA droidSquadsXPosArray,X
        LDA #$80
        STA droidSquadState,X
j2917   LDA currentLevelConfiguration
        AND #$80
        BEQ b292B
        LDA noOfDroidSquadsLeftInCurrentLevel
        AND #$01
        BEQ b292B
        LDA droidSquadState,X
        ORA #$04
        STA droidSquadState,X
b292B   INC currentDroidsLeft
        LDX currentDroidsLeft
        LDA #$0B
        STA droidSquadsXPosArray,X
        LDA #$03
        STA droidSquadsYPosArray,X
        LDA #$00
        STA droidSquadState,X
        DEC currentNoOfDronesLeftInCurrentDroidSquad
        BEQ b2945
        JMP j2954

b2945   LDA #$40
        STA droidSquadState,X
        LDA initialCounterBetweenDroidSquads
        STA counterBetweenDroidSquads
        LDA originalNoOfDronesInDroidSquadInCurrentLevel
        STA currentNoOfDronesLeftInCurrentDroidSquad
        DEC noOfDroidSquadsLeftInCurrentLevel
j2954   INC currentDroidChar
        LDA currentDroidChar
        CMP #DROID3
        BNE b2960
        LDA #DROID1
        STA currentDroidChar
b2960   LDX currentDroidsLeft
        LDA currentDroidsLeft
        BNE b2967
        RTS

b2967   LDA droidSquadState,X
        AND #$80
        BNE b2971
        JMP j2A1A

b2971   JSR s2BF8
        LDA droidSquadState,X
        AND #$04
        BEQ b297E
        JMP j2A6A

b297E   LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA droidSquadState,X
        AND #$40
        BEQ b299E
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
b299E   LDA droidSquadState,X
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

j29B9   STX gridStartHiPtr
        JSR GetCharacterAtCurrentXYPos
        LDX gridStartHiPtr
        CMP #$00
        BEQ b29D6
        CMP #$07
        BEQ JumpToJumpCollisionWithShip
        CMP #$0B
        BEQ JumpToJumpCollisionWithShip
        CMP #$0C
        BEQ JumpToJumpCollisionWithShip
        JMP j29F6

JumpToJumpCollisionWithShip
        JMP JumpToCollisionWithShip

b29D6   LDA currentXPosition
        STA droidSquadsXPosArray,X
        LDA currentYPosition
        STA droidSquadsYPosArray,X
        LDA #CYAN
        STA colorForCurrentCharacter
        LDA currentDroidChar
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
j29EF   DEX
        BEQ b29F5
        JMP b2967

b29F5   RTS

j29F6   INC currentYPosition
        LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadState,X
        EOR #$01
        STA droidSquadState,X
        LDA currentYPosition
        CMP #$15
        BNE b29D6
        DEC currentYPosition
        LDA droidSquadState,X
        EOR #$01
        ORA #$06
        STA droidSquadState,X
        JMP b29D6

j2A1A   LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA droidSquadState,X
        AND #$40
        BEQ b2A3A
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
b2A3A   LDA droidSquadsXPosArray - $01,X
        STA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray - $01,X
        STA droidSquadsYPosArray,X
        STA currentYPosition
        STX gridStartHiPtr
        JSR GetCharacterAtCurrentXYPos
        LDX gridStartHiPtr
        CMP #$07
        BNE b2A58
        JMP JumpToCollisionWithShip

b2A58   LDA #CYAN
        STA colorForCurrentCharacter
        LDA #DROID1
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        JMP j29EF

j2A6A   LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA droidSquadState,X
        AND #$40
        BEQ b2A8A
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
b2A8A   LDA droidSquadState,X
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
        STX gridStartHiPtr
        JSR GetCharacterAtCurrentXYPos
        LDX gridStartHiPtr
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
        STA droidSquadState,X
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA #$01
        STA tempCounter2
        JMP j2ACE

b2AF5   LDA droidSquadState,X
        EOR #$02
        STA droidSquadState,X
        LDA droidSquadsXPosArray,X
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
        LDA currentNoOfDronesLeftInCurrentDroidSquad
        CMP originalNoOfDronesInDroidSquadInCurrentLevel
        BEQ b2B29
        PLA
        JMP CheckBulletCollisionWithCamelDroids

b2B29   PLA
        LDX currentDroidsLeft
b2B2C   LDA droidSquadsXPosArray,X
        CMP currentXPosition
        BEQ b2B37
b2B33   DEX
        BNE b2B2C
        RTS

b2B37   LDA droidSquadsYPosArray,X
        CMP currentYPosition
        BNE b2B33
        LDA bulletType
        AND #$30
        BEQ b2B4A
        LDA bonusBits
        ORA #$80
        STA bonusBits
b2B4A   LDA #$00
        STA bulletType
        LDA #$04
        STA explosionSoundControl
        LDA #$D0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA droidSquadState,X
        AND #$C0
        CMP #$C0
        BNE b2B67
        LDA #$04
        STA tempCounter
        JMP j2BC8

b2B67   CMP #$40
        BNE b2B7B
        LDA droidSquadState,X
        ORA droidSquadState - $01,X
        STA droidSquadState - $01,X
        LDA #$01
        STA tempCounter
        JMP j2BC8

b2B7B   CMP #$80
        BEQ b2BAF
        STX gridStartHiPtr
b2B81   DEX
        LDA droidSquadState,X
        AND #$80
        BEQ b2B81
        LDA droidSquadState,X
        LDX gridStartHiPtr
        ORA droidSquadState + $01,X
        STA droidSquadState + $01,X
        AND #$04
        BEQ b2BA0
        LDA droidSquadState + $01,X
        EOR #$01
        STA droidSquadState + $01,X
b2BA0   LDA #$01
        STA tempCounter
        LDA #$40
        ORA droidSquadState - $01,X
        STA droidSquadState - $01,X
        JMP j2BC8

b2BAF   LDA droidSquadState,X
        ORA droidSquadState + $01,X
        STA droidSquadState + $01,X
        AND #$04
        BEQ b2BC4
        LDA droidSquadState + $01,X
        EOR #$01
        STA droidSquadState + $01,X
b2BC4   LDA #$04
        STA tempCounter
j2BC8   LDA droidSquadsXPosArray + $01,X
        STA droidSquadsXPosArray,X
        LDA droidSquadsYPosArray + $01,X
        STA droidSquadsYPosArray,X
        LDA droidSquadState + $01,X
        STA droidSquadState,X
        CPX currentDroidsLeft
        BEQ b2BE2
        INX
        JMP j2BC8

b2BE2   DEC currentDroidsLeft
        LDX #$05
        LDY tempCounter
        JSR IncreaseScore
        LDA #YELLOW
        STA colorForCurrentCharacter
        LDA #POD2
        STA currentCharacter
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

b2BFF   DEC mainCounterBetweenLasers
        BEQ b2C19
        LDA currentLevel
        CMP currentCharacter
        BMI b2BFE
        LDA droidSquadsXPosArray,X
        CMP previousShipXPosition
        BNE b2BFE
        DEC currentCounterBetweenLsers
        BEQ b2C15
b2C14   RTS

b2C15   LDA initialCounterBetweenLasers
        STA currentCounterBetweenLsers
b2C19   LDA initialMainCounterBetweenLasers
        STA mainCounterBetweenLasers
        LDA previousShipYPosition
        SEC
        SBC droidSquadsYPosArray,X
        BVS b2C14
        CMP #$04
        BMI b2C14
        STX gridStartHiPtr
        LDX #$20
b2C2D   LDA previousLasersHiPtrArray,X
        BEQ b2C36
        DEX
        BNE b2C2D
        RTS

b2C36   STX tempCounter
        LDX gridStartHiPtr
        LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        STX gridStartHiPtr
        JSR GetLinePtrForCurrentYPosition
        TYA
        CLC
        ADC screenLineLoPtr
        STA screenLineLoPtr
        LDA screenLineHiPtr
        ADC #$00
        LDX tempCounter
        STA previousLasersHiPtrArray,X
        LDA screenLineLoPtr
        STA previousLasersLoPtrsArray ,X
        LDX gridStartHiPtr
        RTS

;-------------------------------------------------------------------------
; AnimateCameloid
;-------------------------------------------------------------------------
AnimateCameloid
        DEC cameloidAnimationInteveralForLevel
        BEQ b2C65
        RTS

b2C65   LDA currentCameloidAnimationInterval
        STA cameloidAnimationInteveralForLevel
        LDA originalNoOfDronesInDroidSquadInCurrentLevel
        BNE b2C70
        JSR ReduceScore

b2C70   LDA currrentNoOfCameloidsAtOneTimeForLevel
        BNE b2C75
        RTS

b2C75   LDA noOfCameloidsLeftInCurrentLevel
        BNE b2C7C
        JMP j2CA5

b2C7C   DEC currrentNoOfCameloidsAtOneTimeForLevel
        BEQ b2C83
        JMP j2CA5

b2C83   LDA originalNoOFCameloidsAtOneTimeForLevel
        STA currrentNoOfCameloidsAtOneTimeForLevel
        INC currentCameloidsLeft
        LDX currentCameloidsLeft
        LDA #$03
        STA cameloidsCurrentYPosArray,X
        LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        AND #$0F
        CLC
        ADC #$04
        STA cameloidsCurrentXPosArray,X
        LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        AND #$40
        STA cameloidsColorArray,X
        DEC noOfCameloidsLeftInCurrentLevel
j2CA5   LDX currentCameloidsLeft
        CPX #$00
        BNE b2CAC
        RTS

b2CAC   LDA cameloidsColorArray,X
        AND #$20
        BEQ b2CB6
        JMP j2E72

b2CB6   LDA cameloidsColorArray,X
        AND #$01
        BEQ b2CC0
        JMP j2D79

b2CC0   LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA cameloidsCurrentYPosArray,X
        STA currentYPosition
        LDA cameloidsColorArray,X
        AND #$40
        BEQ b2CDD
        INC currentXPosition
        INC currentXPosition
b2CDD   DEC currentXPosition
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
j2CE6   LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA #YELLOW
        STA colorForCurrentCharacter
        LDA #CAMELOID
        STA currentCharacter
        LDA cameloidsColorArray,X
        AND #$40
        BEQ b2CFE
        LDA #LEFT_CAMELOID
        STA currentCharacter
b2CFE   STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        LDA cameloidsColorArray,X
        AND #$40
        BEQ b2D10
        DEC currentXPosition
        DEC currentXPosition
b2D10   INC currentXPosition
        JSR GetCharacterAtCurrentXYPos
        BEQ b2D5E
        LDX gridStartHiPtr
        LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        INC currentYPosition
        LDA cameloidsColorArray,X
        EOR #$40
        STA cameloidsColorArray,X
        LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        DEC currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        INC cameloidsCurrentYPosArray,X
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b2D5B
        LDA currentDroidsLeft
        BNE b2D55
        LDA noOfDroidSquadsLeftInCurrentLevel
        BNE b2D55

        ; Get a low bonus bit for killing an entire drone squad.
        LDA bonusBits
        ORA #$02
        STA bonusBits
b2D55   JSR s2DB8
        JMP j2D6A

b2D5B   JMP j2CE6

b2D5E   LDA currentXPosition
        LDX gridStartHiPtr
        STA cameloidsCurrentXPosArray,X
        LDA currentYPosition
        STA cameloidsCurrentYPosArray,X
j2D6A   LDA cameloidsColorArray,X
        EOR #$01
        STA cameloidsColorArray,X
        DEX
        BEQ b2D78
        JMP b2CAC

b2D78   RTS

j2D79   LDA #YELLOW
        STA colorForCurrentCharacter
        LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA cameloidsCurrentYPosArray,X
        STA currentYPosition
        LDA cameloidsColorArray,X
        AND #$40
        BNE b2DA3
        LDA #CAMELOID_RIGHT
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        JMP j2D6A

b2DA3   LDA #LEFT_CAMELOID_LEFT
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        JMP j2D6A

;-------------------------------------------------------------------------
; s2DB8
;-------------------------------------------------------------------------
s2DB8
        STX gridStartHiPtr
j2DBA   LDA cameloidsCurrentXPosArray + $0001,X
        STA cameloidsCurrentXPosArray,X
        LDA cameloidsCurrentYPosArray + $0001,X
        STA cameloidsCurrentYPosArray,X
        LDA cameloidsColorArray + $0001,X
        STA cameloidsColorArray,X
        CPX currentCameloidsLeft
        BEQ b2DD4
        INX
        JMP j2DBA

b2DD4   LDX gridStartHiPtr
        DEC currentCameloidsLeft
        LDA originalNoOfDronesInDroidSquadInCurrentLevel
        BEQ b2DE6
        LDA noOfCameloidsLeftInCurrentLevel
        BNE b2DE6
        LDA bonusBits
        ORA #$40
        STA bonusBits
b2DE6   RTS

camelCharacters =*-$01
        .BYTE CAMELOID,CAMELOID_LEFT,CAMELOID_RIGHT,LEFT_CAMELOID
        .BYTE LEFT_CAMELOID_RIGHT,LEFT_CAMELOID_LEFT
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
b2E12   LDX currentCameloidsLeft
        LDA currentXPosition
b2E16   CMP cameloidsCurrentXPosArray,X
        BEQ b2E1F
b2E1B   DEX
        BNE b2E16
        RTS

b2E1F   LDA currentYPosition
        CMP cameloidsCurrentYPosArray,X
        BNE b2E1B
        LDA #$00
        STA bulletType
        STX gridStartHiPtr
        LDX #$05
        LDY #$01
        JSR IncreaseScore
        LDX #$07
        LDY #$06
        JSR IncreaseScore
        LDX gridStartHiPtr
        LDA #$04
        STA explosionSoundControl
        LDA #$D0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA cameloidsColorArray,X
        AND #$40
        BNE b2E59
        LDA cameloidsCurrentXPosArray,X
        CMP #$01
        BEQ b2E6A
        DEC cameloidsCurrentXPosArray,X
        JMP b2E6A

b2E59   LDA cameloidsCurrentXPosArray,X
        CMP #$13
        BEQ b2E6A
        LDA cameloidsColorArray,X
        AND #$01
        BEQ b2E6A
        INC cameloidsCurrentXPosArray,X
b2E6A   LDA #$2F
        STA cameloidsColorArray,X
        PLA
        PLA
        RTS

j2E72   LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA cameloidsCurrentYPosArray,X
        STA currentYPosition
        LDA cameloidsColorArray,X
        AND #$0F
        BEQ b2EA9
        AND #$07
        STA colorForCurrentCharacter
        LDA cameloidsColorArray,X
        SEC
        SBC #$01
        STA cameloidsColorArray,X
        ; Draw the cameloid bonus.
        LDA #BONUS_LEFT
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentCharacter
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
j2EA0   LDX gridStartHiPtr
        DEX
        BEQ b2EA8
        JMP b2CAC

b2EA8   RTS

b2EA9   JSR s2DB8
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA #GRID
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j2EA0

;-------------------------------------------------------------------------
; AnimateSnitch
;-------------------------------------------------------------------------
AnimateSnitch
        LDA currentSnitchAnimationInterval
        BEQ b2EC7
        DEC currentSnitchAnimationInterval
        BEQ b2EC8
b2EC7   RTS

b2EC8   LDA snitchAnimationIntervalForLevel
        STA currentSnitchAnimationInterval
        LDA snitchStateControl
        EOR #$01
        STA snitchStateControl
        AND #$80
        BEQ b2ED9
        JMP DrawTheSnitch

b2ED9   LDA #$02
        STA currentYPosition
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA snitchCurrentXPos
        STA currentXPosition
        LDA snitchStateControl
        AND #$40
        BNE b2F11
        LDA #SPACE
        STA currentCharacter
        DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA #SNITCH_RUN_RIGHT
        STA currentCharacter
        LDA snitchStateControl
        AND #$01
        BEQ b2F04
        LDA #SNITCH_LEFT
        STA currentCharacter
b2F04   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        INC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j2F36

b2F11   LDA #SPACE
        STA currentCharacter
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        LDA #$6B
        STA currentCharacter
        LDA snitchStateControl
        AND #$01
        BEQ b2F2A
        LDA #SNITCH_RIGHT1
        STA currentCharacter
b2F2A   DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
j2F36   LDA snitchStateControl
        AND #$01
        BEQ b2F49
        LDA snitchStateControl
        AND #$40
        BNE b2F46
        INC snitchCurrentXPos
        INC snitchCurrentXPos
b2F46   DEC snitchCurrentXPos
        RTS

b2F49   LDA snitchCurrentXPos
        CMP previousShipXPosition
        BNE b2F54
        LDA #$80
        STA snitchStateControl
b2F53   RTS

b2F54   BMI b2F61
        LDA snitchStateControl
        AND #$40
        BNE b2F53
        LDA #$41
        STA snitchStateControl
b2F60   RTS

b2F61   LDA snitchStateControl
        AND #$40
        BEQ b2F60
        LDA #$01
        STA snitchStateControl
        RTS

;---------------------------------------------------------------------------------
; DrawTheSnitch
;---------------------------------------------------------------------------------
DrawTheSnitch
        LDA snitchStateControl
        AND #$01
        CLC
        ADC #$6E
        STA currentCharacter
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA #$02
        STA currentYPosition
        LDA snitchCurrentXPos
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA snitchCurrentXPos
        CMP previousShipXPosition
        BNE b2F8B
        RTS

b2F8B   LDA #$00
        STA snitchStateControl
        JMP b2F49

;---------------------------------------------------------------------------------
; DrawDeflectedBullet
;---------------------------------------------------------------------------------
DrawDeflectedBullet
        LDA bulletType
        AND #$02
        BNE b2FB1
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_RIGHT
        STA currentCharacter
        LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
WriteCharacterAndReturn
        LDA bulletType
        EOR #$02
        STA bulletType
        JMP WriteCurrentCharacterToCurrentXYPos

b2FB1   LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$15
        BNE b2FD1
        LDA #$00
        STA bulletType
        RTS

b2FD1   INC bulletXPosition
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_LEFT
        STA currentCharacter
        JSR CheckBulletCollision
        JMP WriteCharacterAndReturn

j2FE1   LDA bulletType
        AND #$02
        BNE b2FFA
        LDA #$01
        STA colorForCurrentCharacter
        LDA #BULLET_LEFT
        STA currentCharacter
        LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
        JMP WriteCharacterAndReturn

b2FFA   LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        DEC bulletXPosition
        BNE b3018
        LDA #$00
        STA bulletType
        RTS

b3018   LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_RIGHT
        STA currentCharacter
        JSR CheckBulletCollision
        JMP WriteCharacterAndReturn

j3026   LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
        LDA bulletType
        AND #$02
        BNE b303F
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_DOWN
        STA currentCharacter
        JMP WriteCharacterAndReturn

b303F   LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b3057
        LDA #$00
        STA bulletType
        RTS

b3057   INC bulletYPosition
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_UP
        STA currentCharacter
        JSR CheckBulletCollision
        JMP WriteCharacterAndReturn

;-------------------------------------------------------------------------
; DrawDeflexor
;-------------------------------------------------------------------------
DrawDeflexor
        DEC deflexorFrameRate
        BEQ b306C
        RTS

b306C   LDA #$80
        STA deflexorFrameRate
        INC currentDeflexorColor
        LDX currentDeflexorIndex
        CPX #$00
        BNE b3079
        RTS

b3079   LDA #$00
        STA gridStartHiPtr
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
        ADC gridStartHiPtr
        STA currentCharacter
        LDA currentDeflexorColor
        AND #$07
        STA colorForCurrentCharacter
        LDA currentDeflexorXPosArray,X
        STA currentXPosition
        LDA currentDeflexorYPosArray,X
        STA currentYPosition
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        DEX
        BNE b3079
        RTS

rightDeflexorValues   =*-$01
				.BYTE DEFLEX1,EXPLOSION1,EXPLOSION2
leftDeflexorValues  =*-$01
				.BYTE DEFLEX2,EXPLOSTION3,DOT2
dotAndComma  =*-$01
				.BYTE BIG_DOT,COMMA,EXCLAMATION
shipCharacters  = *-$01
        .BYTE SHIP,SHIP_LEFT,SHIP_RIGHT
;---------------------------------------------------------------------------------
; CheckBulletCollisionWithOtherElements
;---------------------------------------------------------------------------------
CheckBulletCollisionWithOtherElements
        LDX #$03
b30BF   CMP rightDeflexorValues,X
        BEQ CheckCollisionWithDeflexors
        CMP leftDeflexorValues,X
        BEQ b3109
        CMP dotAndComma,X
        BEQ b30DA
        CMP shipCharacters,X
        BNE b30D6
        JMP JumpToCollisionWithShip

b30D6   DEX
        BNE b30BF
b30D9   RTS

b30DA   LDA bulletType
        AND #$10
        BNE b30D9
        LDA bulletType
        EOR #$20
        STA bulletType
        CPX #$01
        BNE b30D9
        JMP j3119

CheckCollisionWithDeflexors
        LDA bulletType
        AND #$30
        STA gridStartHiPtr
        LDA #$50
        SEC
        SBC gridStartHiPtr
        AND #$30
        STA gridStartHiPtr
j30FC   LDA bulletType
        AND #$8F
        ORA gridStartHiPtr
        STA bulletType
        CPX #$01
        BEQ j3119
        RTS

b3109   LDA bulletType
        AND #$30
        STA gridStartHiPtr
        LDA #$30
        SEC
        SBC gridStartHiPtr
        STA gridStartHiPtr
        JMP j30FC

j3119   LDX currentDeflexorIndex
b311B   LDA currentXPosition
        CMP currentDeflexorXPosArray,X
        BEQ b3126
b3122   DEX
        BNE b311B
        RTS

b3126   LDA currentYPosition
        CMP currentDeflexorYPosArray,X
        BNE b3122
        LDA mysteryBonusPerformance,X
        JSR UpdateMysteryBonusPerformance
        STA mysteryBonusPerformance,X
        LDA #$0F
        STA deflexorSoundControl
        LDA #$F0
        STA VICCRC   ;$900C - frequency of sound osc.3 (soprano)
        LDA #$00
        STA explosionSoundControl
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
        LDX deflexorIndexForLevel
        STX currentDeflexorIndex
b3161   LDA deflexorXPosArrays,X
        STA currentDeflexorXPosArray,X
        LDA deflexorYPosArray,X
        STA currentDeflexorYPosArray,X
        LDA mysteryBonusPerformanceArrayForLevel,X
        STA mysteryBonusPerformance,X
        DEX
        BNE b3161
        RTS

deflexorXPosArrays = *-$01
        .BYTE $0A,$0B,$0A,$0B,$01,$03,$05,$07
        .BYTE $14,$12,$10,$0E,$0A,$0B,$07,$0E
        .BYTE $05,$05,$10,$10,$02,$04,$06,$08
        .BYTE $13,$11,$0F,$0D
deflexorYPosArray = *-$01
        .BYTE $0D,$0D,$0E,$0E,$0A,$0A,$0A
        .BYTE $0A,$0A,$0A,$0A,$0A,$06,$06,$06
        .BYTE $06,$0E,$15,$0E,$15,$08,$08,$08
        .BYTE $08,$08,$08,$08,$08
mysteryBonusPerformanceArrayForLevel = *-$01
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
        STA noOfDroidSquadsLeftInCurrentLevel
        LDA noOfDronesInLevelDroidSquads,X
        STA originalNoOfDronesInDroidSquadInCurrentLevel
        STA currentNoOfDronesLeftInCurrentDroidSquad
        LDA noOfCameloidsForLevel,X
        STA noOfCameloidsLeftInCurrentLevel
        LDA noOfCameloidsAtAnyOneTimeForLevel,X
        STA originalNoOFCameloidsAtOneTimeForLevel
        STA currrentNoOfCameloidsAtOneTimeForLevel
        LDA cameloidSpeedForLevel,X
        STA currentCameloidAnimationInterval
        STA cameloidAnimationInteveralForLevel
        LDA laserIntervalsForLevels,X
        STA currentLaserInterval
        STA laserIntervalForLevel
        LDA snitchSpeedForLevel,X
        STA currentSnitchAnimationInterval
        STA snitchAnimationIntervalForLevel
        LDA deflexorIndexArrayForLevel,X
        STA deflexorIndexForLevel
        LDA configurationForLevel,X
        STA currentLevelConfiguration
        JMP LoadDeflexorsForLevel

;-------------------------------------------------------------------------
; DrawEmptyGrid
;-------------------------------------------------------------------------
DrawEmptyGrid
        LDA #$02
        STA currentYPosition
        JSR SetGridPattern
        LDA #SPACE
        STA currentCharacter
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
        ; Draw grid
        LDA #GRID
        STA currentCharacter
        LDA #$03
        STA currentYPosition
        LDA #GRID_BLUE
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
        LDA #$0B
        STA currentYPosition
        LDA #SPACE
        STA currentCharacter
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
        LDA #$05
        STA currentXPosition
        LDA #$0C
        STA currentYPosition
        JSR GetLinePtrForCurrentYPosition
        LDX #$00
        LDA #WHITE
        STA colorForCurrentCharacter
b3334   LDA f3395,X
        STA currentCharacter
        STX previousShipXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX previousShipXPosition
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
        LDA currentLevelConfiguration
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
        LDA currentLevelConfiguration
        BNE b33ED

        ; Normal Grid Pattern
        LDX #$08
b33E3   LDA regularGridPattern,X
        STA charsetLocation - $0001,X
        DEX
        BNE b33E3
        RTS

b33ED   LDA currentLevelConfiguration
        CMP #$01
        BNE b33FE

        ; Empty Grid pattern
        LDX #$08
        LDA #$00
b33F7   STA charsetLocation - $0001,X
        DEX
        BNE b33F7
        RTS

        ; Blocky grid pattern
b33FE   LDX #$08
b3400   LDA blockyGridPattern,X
        STA charsetLocation - $0001,X
        DEX
        BNE b3400
        RTS

;---------------------------------------------------------------------------------
; ScrollGrid
; Bit-shift each character to achieve a scrolling effect.
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
        LDA noOfDroidSquadsLeftInCurrentLevel
        BNE b3419
        LDA currentDroidsLeft
        BNE b3419
        LDA noOfCameloidsLeftInCurrentLevel
        BNE b3419
        LDA currentCameloidsLeft
        BNE b3419
        ; Falls through
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
        LDA previousShipYPosition
        STA currentYPosition
        LDA #$01
        STA currentXPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
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
        STA gridStartHiPtr
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
        LDA previousShipXPosition
        STA currentXPosition
        LDA previousShipYPosition
        STA currentYPosition
        LDA gridStartHiPtr
        AND #$03
        TAX
        LDA shipExplosionAnimation,X
        STA currentCharacter
        LDA gridStartHiPtr
        AND #$07
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC gridStartHiPtr
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
b34F3   LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
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
        STA currentCharacter
;-------------------------------------------------------------------------
; DrawGridOverDissolvedExplosion
;-------------------------------------------------------------------------
DrawGridOverDissolvedExplosion
        LDA previousShipXPosition
        SEC
        SBC tempCounter
        STA currentXPosition
        LDA previousShipYPosition
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA currentYPosition
        CLC
        ADC tempCounter
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA previousShipYPosition
        SEC
        SBC tempCounter
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA previousShipXPosition
        STA currentXPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA currentXPosition
        CLC
        ADC tempCounter
        STA currentXPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA previousShipYPosition
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA currentYPosition
        CLC
        ADC tempCounter
        STA currentYPosition
        JSR DrawExplosionCharacterIfFitsOnGrid
        LDA previousShipXPosition
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

shipExplosionAnimation .BYTE EXPLOSION1,EXPLOSION2,EXPLOSTION3,$40
colorsForEffects       .BYTE BLACK,BLUE,RED,PURPLE,GREEN,CYAN,YELLOW,WHITE
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
        LDA #$0A
        STA currentYPosition
        LDA #$07
        STA currentXPosition
        LDA #CYAN
        STA colorForCurrentCharacter
        LDX #$00
b35D0   LDA txtGotYou,X
        STX gridStartHiPtr
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
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

txtGotYou   .TEXT "GOT YOUz"
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
        STA gridStartHiPtr
b3649   LDA #$04
        STA currentYPosition
b364D   LDA #$05
        STA currentXPosition
        LDA gridStartHiPtr
        AND #$07
        TAX
        LDA colorsForEffects,X
        STA colorForCurrentCharacter
        LDX #$00
b365D   LDA f36B6,X
        STA currentCharacter
        STX tempCounter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDX tempCounter
        INX
        CPX #$0C
        BNE b365D
        INC gridStartHiPtr
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
        LDA gridStartHiPtr
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

        LDA #PURPLE
        STA colorForCurrentCharacter
        LDA #$0F
        STA currentYPosition
b36DC   LDA #$00
        STA currentXPosition
        STA currentCharacter
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
        LDA #YELLOW
        STA colorForCurrentCharacter
b3703   LDA txtMysteryBonus,X
        STA currentCharacter
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
        STA currentCharacter
        LDA #CYAN
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX #$04
        LDY mysteryBonusEarned
        JSR IncreaseScore
        LDA #$D0
        STA gridStartHiPtr
b3735   LDA gridStartHiPtr
        STA VICCRB   ;$900B - frequency of sound osc.2 (alto)
b373A   DEY
        BNE b373A
        INC VICCRB   ;$900B - frequency of sound osc.2 (alto)
        BNE b373A
b3742   LDA VICCR4   ;$9004 - raster beam location (bits 7-0)
        CMP #$7F
        BNE b3742
        LDA gridStartHiPtr
        AND #$07
        TAX
        LDA #$FF
        STA charsetLocation,X
        INC gridStartHiPtr
        LDA gridStartHiPtr
        AND #$07
        TAX
        LDA #$00
        STA charsetLocation,X
        LDA gridStartHiPtr
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

        LDA currentDeflexorIndex
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
        LDA #CYAN
        STA colorForCurrentCharacter
        LDA #$00
        STA currentXPosition
        LDX #$00
b37B3   LDA #$05
        STA currentYPosition
        LDA txtTitleScreenLine1,X
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        INC currentYPosition
        LDA #YELLOW
        STA colorForCurrentCharacter
        LDX gridStartHiPtr
        LDA txtTitleScreenLine2,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDA #WHITE
        STA colorForCurrentCharacter
        INC currentYPosition
        INC currentYPosition
        LDX gridStartHiPtr
        LDA txtTitleScreenLine3,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC colorForCurrentCharacter
        LDX gridStartHiPtr
        INC currentYPosition
        INC currentYPosition
        INC colorForCurrentCharacter
        LDA txtTitleScreenLine4,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC colorForCurrentCharacter
        LDX gridStartHiPtr
        INC currentYPosition
        INC currentYPosition
        LDA txtTitleScreenLine5,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        LDA #WHITE
        STA colorForCurrentCharacter
        INC currentYPosition
        INC currentYPosition
        LDA txtInitialScrollingText,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        LDA #CYAN
        STA colorForCurrentCharacter
        INC currentXPosition
        INX
        CPX #$16
        BNE b37B3
        JMP DrawHiScore

txtTitleScreenLine1     .TEXT "DESIGN AND PROGRAMMING"
txtTitleScreenLine2     .TEXT "   BY  JEFF  MINTER   "
txtTitleScreenLine3     .TEXT " ?  1983 BY LLAMASOFT "
txtTitleScreenLine4     .TEXT " PRESS FIRE FOR START "
txtTitleScreenLine5     .TEXT "SELECT START LEVEL   1"
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
        STA gridStartHiPtr
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
        JMP HandleEllipsisInScrollingText

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
b38E3   LDA alphabetCharsetStorage,Y
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
        STA gridStartHiPtr
        TYA
        TAX
        CLC
j38FE   ROL scrollingTextStorage,X
        PHP
        TXA
        CLC
        ADC #$08
        TAX
        DEC gridStartHiPtr
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
HandleEllipsisInScrollingText
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
        LDA joystickInput
        AND #$02
        BEQ b3974
        INC VICCR1   ;$9001 - vertical picture origin
        LDA VICCR1   ;$9001 - vertical picture origin
        AND #$3F
        STA VICCR1   ;$9001 - vertical picture origin
b3974   LDA joystickInput
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
b399A   LDA joystickInput
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
        LDA #YELLOW
        STA colorForCurrentCharacter
        LDX #$00
        LDA #>$0A10
        STA currentYPosition
        LDA #$07
        STA currentXPosition
b39C1   LDA txtGameOver,X
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
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
b3currentCharacter   LDA SCREEN_RAM + $0009,X
        CMP previousHiScore,X
        BEQ b3A10
        BMI b3A15
        BPL b3A21
b3A10   INX
        CPX #$08
        BNE b3currentCharacter
p3A16   =*+$01
b3A15   JSR DrawTitleScreen
        JSR DrawTitleText
        LDX #$F8
        TXS
        JMP BeginGameEntrySequence

b3A21   LDX #$07
b3A23   LDA SCREEN_RAM + $0009,X
        STA previousHiScore,X
        DEX
        BNE b3A23
        JMP b3A15

txtGameOver   .TEXT "GAME OVER"
;---------------------------------------------------------------------------------
; DrawHiScore
;---------------------------------------------------------------------------------
DrawHiScore
        LDA #$14
        STA currentYPosition
        LDX #$00
b3A3E   LDA txtHiScore,X
        STA currentCharacter
        LDA #PURPLE
        STA colorForCurrentCharacter
        TXA
        CLC
        ADC #$03
        STA currentXPosition
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        LDA currentXPosition
        CLC
        ADC #$09
        STA currentXPosition
        LDA #CYAN
        STA colorForCurrentCharacter
        LDA previousHiScore + $01,X
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        INX
        CPX #$07
        BNE b3A3E
        JMP TitleScreenLoop

;-------------------------------------------------------------------------
; ReduceScore
;-------------------------------------------------------------------------
ReduceScore
        LDA #$01
        STA explosionSoundControl
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
        STA alphabetCharsetStorage,X
        LDA f3F00,X
        STA charsetLocation + $0300,X
        INX
        BNE b3BA2
        JMP InitializeGame

        .TEXT "8SNITCH.", $BF, "SNITN1/ISNITN2/TSNITND/6SNITP ", $00
        .TEXT "6SNITX ", $00, "5SNLOP 4", $7D, "SNLOP14"
.include "charset.asm"
