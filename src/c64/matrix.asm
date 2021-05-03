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
screenLineLoPtr                              = $48
screenLineHiPtr                              = $49
rollingGridPreviousChar                      = $50
cyclesToWaste                                = $5A
lastKeyPressed                               = $C5

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
charSetLocation                              = $2000
alphabetCharsetStorage                       = $2200
scrollingTextStorage                         = $2400

soundModeAndVol                              = $4000
voice1FreqHiVal                              = $4001
voice2FreqHiVal                              = $4002
voice2FreqHiVal2                             = $4003
voice3FreqHiVal                              = $4004
;
; **** POINTERS **** 
;
SCREEN_RAM                                   = $0400
COLOR_RAM                                    = $D800
screenLinesLoPtrArray                        = $0340
screenLinesHiPtrArray                        = $0360
OFFSET_TO_COLOR_RAM                          = $D4

BLACK                                        = $00
WHITE                                        = $01
RED                                          = $02
CYAN                                         = $03
PURPLE                                       = $04
GREEN                                        = $05
BLUE                                         = $06
YELLOW                                       = $07
GRID_BLUE                                    = $66


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
HALF_SHIP                                    = $16
HALF_SHIP2                                   = $17
MEN_LEFT                                     = $1B
MEN_RIGHT                                    = $1C
HIGH_LEFT                                    = $1D
HIGH_RIGHT                                   = $1E
RIGHT_ARROW                                  = $1F
SPACE                                        = $20
BOTTOM_ZAPPER_LEFT                           = $3A
BOTTOM_ZAPPER_RIGHT                          = $3B
LEFT_ZAPPER_TOP                              = $3C
LEFT_ZAPPER_BOTTOM                           = $3D
CROSS_HAIRS                                  = $5D
CAMELOID                                     = $5E
CAMELOID_LEFT                                = $5F
CAMELOID_RIGHT                               = $60
LEFT_CAMELOID                                = $61
LEFT_CAMELOID_RIGHT                          = $62
LEFT_CAMELOID_LEFT                           = $63
BONUS_LEFT                                   = $64
BONUS_RIGHT                                  = $65
SNITCH_RUN_RIGHT                             = $66
SNITCH_LEFT                                  = $68
SNITCH_RIGHT                                 = $69
SNITCH_RUN_LEFT                              = $6A
SNITCH_LEFT1                                 = $6C
SNITCH_RIGHT1                                = $6D
SNITCH_WAVING                                = $6E
SNITCH_WAVING1                               = $6F
BULLET_LEFT                                  = $70
BULLET_RIGHT                                 = $71
DEFLEX1                                      = $72
EXPLOSION1                                   = $73
EXPLOSION2                                   = $74
DEFLEX2                                      = $75
EXPLOSTION3                                  = $76
EXCLAMATION                                  = $7A
DOT2                                         = $77
BIG_DOT                                      = $78
COMMA                                        = $79

* = $0801
;-----------------------------------------------------------------------------------------------------
; SYS 37268 (PrepareGame)
; This launches the program from address $8000, i.e. PrepareGame.
;-----------------------------------------------------------------------------------------------------
; $9E = SYS
; $31,$36,$33,$38,$34,$00 = 37268 ($8000 in hex)
.BYTE $0C,$08,$0A,$00,$9E,$33,$32,$37,$36,$38,$00

* = $8000
;-----------------------------------------------------------------------------------------------------
; PrepareGame
;-----------------------------------------------------------------------------------------------------
PrepareGame
        ; NOPs
			  .FILL 12, $EA
        LDA #$01
        STA bulletFrameCounter
        JMP CopyCharsetIntoPosition

;---------------------------------------------------------------------------------
; WasteAFewCycles   
;---------------------------------------------------------------------------------
WasteAFewCycles   
        LDA #$08
        STA cyclesToWaste
b8017   DEY 
        BNE b8017
        DEC cyclesToWaste
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
        STA soundModeAndVol
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        STA $D413    ;Voice 3: Attack / Decay Cycle Control

        LDA #$30
        LDX #$07
b809E   STA previousHiScore,X
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
        JMP BeginGameEntrySequence

txtBanner   =*-$01
                            .BYTE $23,$24,$22,$25,$26,$27,$20,$19 ; MATRIX
                            .BYTE $1A
                            .TEXT " 0000000  ", $07, " 5 SHIPS REMAINING  !!!!!"
colorsBannerText            .BYTE $21,$43,$43,$43,$43,$43,$43,$40
                            .BYTE $44,$44,$40,$47,$47,$47,$47,$47
                            .BYTE $47,$47,$40,$40,$45,$40,$43,$40
                            .BYTE $44,$44,$44,$44,$44,$43,$47,$47
                            .BYTE $47,$47,$47,$47,$47,$47,$47,$47
                            .BYTE $47,$44,$44,$44,$44,$44
gridLineIntroSequenceColors .BYTE $44,$06,$02,$04,$05,$03,$07,$01
;-------------------------------------------------------------------------
; PlayASoundEffect
;-------------------------------------------------------------------------
PlayASoundEffect
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
        ADC #OFFSET_TO_COLOR_RAM
        STA screenLineHiPtr
        LDX gridStartLoPtr
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
        INC gridStartLoPtr
        LDA gridStartLoPtr
        CMP #$08
        BNE b81B7
        LDA #$01
        STA gridStartLoPtr
b81B7   DEC gridStartHiPtr
        BNE b8183
        RTS 

;---------------------------------------------------------------------------------
; BeginGameEntrySequence   
;---------------------------------------------------------------------------------
BeginGameEntrySequence   
        LDA #$02
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$03
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        JSR PlayNote1
        JSR PlayNote2

        LDA #$00
        LDX #$08
b81D0   STA charSetLocation - $0001,X
        DEX 
        BNE b81D0
        LDA #$13
        STA tempCounter

        ; This sequence draws the grid animation when entering a level.

        ; In this loop each iteration adds a line to the top of the screen creating
        ; the effect of pulsing colored lines coming down the screen
        LDA #$01
        STA tempCounter2
GridAnimLoop
        LDA tempCounter2
        STA gridStartLoPtr
        LDA #$14
        SEC 
        SBC tempCounter
        STA gridStartHiPtr
        LDA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        INC soundModeAndVol
        LDA soundModeAndVol
        CMP #$10
        BNE b81FC
        DEC soundModeAndVol
b81FC   JSR DrawGridLineEntrySequence
        LDX #$00
b8201   LDA #$FF
        STA charSetLocation,X
        TXA 
        PHA 
        LDA #$80
        STA currentXPosition
        LDA #$10
        STA currentYPosition
        JSR WasteXYCycles
        PLA 
        TAX 
        JSR WasteAFewCycles
        LDA #$00
        STA charSetLocation,X
        INX 
        CPX #$08
        BNE b8201

        DEC tempCounter2
        BNE b822A
        LDA #$07
        STA tempCounter2
b822A   DEC tempCounter
        BNE GridAnimLoop

        ; This loop turns the lines into whole bars. It does this
        ; by altering the value of the character used to draw the lines.
        LDX #$08
b8230   LDA #$FF
        STA charSetLocation - $0001,X
        TXA 
        PHA 
        LDA #$F0
        STA currentXPosition
        LDA #$10
        STA currentYPosition
        JSR WasteXYCycles
        PLA 
        TAX 
        DEX 
        BNE b8230

        ; This loop turns the screen blue
        LDA #GRID_BLUE
        LDX #$00
b824B   STA COLOR_RAM + $0078,X
        STA COLOR_RAM + $0100,X
        STA COLOR_RAM + $0200,X
        STA COLOR_RAM + $0300,X
        INX 
        BNE b824B

        LDA #$03
        STA gridStartLoPtr
        LDA #$00
        STA gridStartHiPtr
        JSR PlayChord
        JSR PlayNote1

        ; This loop turns the blue screen into a grid by changing the value
        ; of the character used to paint the screen.
TurnBlueScreenToGridLoop
        LDX #$60
        LDA #$0F
        STA soundModeAndVol

b826F   STX $D408    ;Voice 2: Frequency Control - High-Byte
        LDY #$00
b8274   DEY 
        BNE b8274
        DEX 
        BNE b826F

        LDY #$08
b827C   LDX gridStartHiPtr
        LDA charSetLocation + $02D8,X
        STA charSetLocation - $0001,Y
        INC gridStartHiPtr
        DEY 
        BNE b827C

        LDA soundModeAndVol
        SBC #$04
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        DEC gridStartLoPtr
        BNE TurnBlueScreenToGridLoop

;---------------------------------------------------------------------------------
; EnterMainGameLoop   
;---------------------------------------------------------------------------------
EnterMainGameLoop   
        JSR LoadSettingsForLevel
        JSR PlayChord
        JSR DrawEnterZoneInterstitial

        LDA #$90
        STA voice1FreqHiVal
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        JSR PlayNote3

        LDA #$15
        STA previousShipYPosition
        LDA #$14
        STA previousShipXPosition

        ; This is the ship materialization sequence. Two halves of the ship
        ; descend diagonally from either side and join in the bottom centre
        ; of the screen to form the ship.
        LDA #$09
        STA gridStartLoPtr
ShipMaterializationLoop
        LDA #$0F
        SEC 
        SBC gridStartLoPtr
        STA $D418    ;Select Filter Mode and Volume
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

        ; Draw the right hand of the ship arriviing in diagonally.
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

        ; Draw the left hand of the ship arriviing in diagonally.
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
        BNE ShipMaterializationLoop

        JSR PlayChord
        LDA #$0F
        STA soundModeAndVol
        JSR PlayNote2

        ; This section animates the flash effect on the color of the grid when
        ; the ship has materialized.
        LDA #$03
        STA gridStartLoPtr
FlashEffectLoop
        LDA #$65
        CLC 
        ADC gridStartLoPtr
        LDX #$00
b832D   STA COLOR_RAM + $0078,X
        STA COLOR_RAM + $0100,X
        STA COLOR_RAM + $0200,X
        STA COLOR_RAM + $0300,X
        DEX 
        BNE b832D

        ; Draw the ship
        LDA previousShipXPosition
        STA currentXPosition
        LDA previousShipYPosition
        STA currentYPosition
        LDA #SHIP
        STA currentCharacter
        LDA #GREEN
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos

        ; Play some sounds
        LDA #$C0
        STA voice3FreqHiVal
b8354   LDY #$00
b8356   DEY 
        BNE b8356
        DEC voice3FreqHiVal
        LDA voice3FreqHiVal
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        CMP #$80
        BNE b8354
        LDA soundModeAndVol
        SBC #$05
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        DEC gridStartLoPtr
        BNE FlashEffectLoop

        JSR PlayASoundEffect

        LDA #$00
        LDX #$20
b837C   STA previousLasersHiPtrArray,X
        DEX 
        BNE b837C

        ; Initialize some variables
        STA bulletType
        STA zapperSwitch
        STA explosionSoundControl
        STA podDestroyedSoundEffect
        STA currentDroidsLeft
        STA currentCameloidsLeft
        STA snitchStateControl
        STA deflexorSoundControl
        STA mysteryBonusEarned
        STA frameControlCounter
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

        LDA #$0F
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume

        ; This is the main game loop. This will keep looping until
        ; the game is over..
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
        LDA $DC01    ;CIA1: Data Port Register B
        EOR #$1F
        STA joystickInput
        RTS 

droidDecaySequence   =*-$01
                        .BYTE BOTTOM_ZAPPER, POD1, POD2, POD3, POD4, POD5, POD6, BOMB

thingsThatKillAShip     .BYTE BULLET_DOWN, HORIZ_LASER1, HORIZ_LASER2
                        .BYTE VERTICAL_LASER1, VERTICAL_LASER2, BOMB
                        .BYTE DROID1, DROID2, DROID3

                        
                        
;-------------------------------------------------------------------------
; ProcessJoystickInput
;-------------------------------------------------------------------------
ProcessJoystickInput
        DEC frameControlCounter
        DEC frameControlCounter
        BEQ b8405
        LDA frameControlCounter
        CMP #$80
        BEQ b8402
        RTS 

b8402   JMP DrawGridAtOldPosition

b8405   JSR GetJoystickInput
        JSR CheckIfZoneCleared

        LDA previousShipXPosition
        STA currentXPosition
        CMP #$03
        BEQ b8417
        CMP #$25
        BNE b841D

        ; Clear most of the bonus bits, as punishment for moving to the
        ; extreme left of the grid.
b8417   LDA bonusBits
        AND #$FB
        STA bonusBits

        ; Overwrite the ship's current position with a grid character.
b841D   LDA previousShipYPosition
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos

        LDA joystickInput
        AND #$01
        BEQ b843C

        ; Joystick pushed up.
        DEC currentYPosition
        LDA currentYPosition
        CMP #$06
        BNE b843C
        INC currentYPosition

b843C   LDA joystickInput
        AND #$02
        BEQ b844C

        ;Joystick pushed down.
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b844C
        DEC currentYPosition

b844C   LDA #$00
        STA shipMovementDirection
        LDA joystickInput
        AND #$04
        BEQ b8464

        ; Joystick pushed left.
        LDA #$01
        STA shipMovementDirection
        DEC currentXPosition
        BNE b8464
        INC currentXPosition

        LDA #$00
        STA shipMovementDirection
b8464   LDA joystickInput
        AND #$08
        BEQ b847C

        ; Joystick pushed right.
        LDA #$02
        STA shipMovementDirection
        INC currentXPosition
        LDA currentXPosition
        CMP #$27
        BNE b847C
        DEC currentXPosition
        LDA #$00
        STA shipMovementDirection

b847C   JSR CheckForCollisionWithNewMovememnt
        LDA joystickInput
        AND #$10
        BEQ b84A2

        ; Fire pressed.
        LDA bulletType
        BNE b84A2
        LDA previousShipXPosition
        STA bulletXPosition
        LDA previousShipYPosition
        STA bulletYPosition
        DEC bulletYPosition
        LDA #$01
        STA bulletType
        LDA #$70
        STA voice1FreqHiVal
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        JSR PlayNote3

b84A2   LDA shipMovementDirection
        BNE MoveShipLeftOrRight

;-------------------------------------------------------------------------
; DrawShipInCurrentPosition
;-------------------------------------------------------------------------
DrawShipInCurrentPosition
        LDA previousShipXPosition
        STA currentXPosition
        LDA previousShipYPosition
        STA currentYPosition
        LDA #SHIP
        STA currentCharacter
        LDA #GREEN
        STA colorForCurrentCharacter
        JMP WriteCurrentCharacterToCurrentXYPos
        ; Returns

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
        BEQ b84D9

        ; Move ship right.
        LDA #SHIP_LEFT
        STA currentCharacter
        LDA previousShipXPosition
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentCharacter
        INC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos
        ; Returns

        ; Move ship left.
b84D9   LDA #SHIP_RIGHT
        STA currentCharacter
        LDA previousShipXPosition
        STA currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentCharacter
        DEC currentXPosition
        JMP WriteCurrentCharacterToCurrentXYPos
        ; Returns

;---------------------------------------------------------------------------------
; DrawGridAtOldPosition   
;---------------------------------------------------------------------------------
DrawGridAtOldPosition   
        LDA shipMovementDirection
        BNE b84F0
        RTS 

b84F0   JSR DrawShipInCurrentPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        INC currentXPosition
        LDA shipMovementDirection
        CMP #$02
        BNE b8507
        DEC currentXPosition
        DEC currentXPosition
b8507   JMP WriteCurrentCharacterToCurrentXYPos
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
        LDA lastKeyPressed
        CMP #$40
        BNE b8513
b8512   RTS 

b8513   LDA $028D ; Ctrl/Shift/Commodore key pressed?
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

        ; Ctrl/Shift/Commodore Key (i.e. ctrl, tab, and shift) held down
        ; together along with another key will skip to next level, add a new
        ; life, and award a mystery bonus.
b852D   JMP CheatByIncrementingLifeAndSkipLevel
        ; Returns

;-------------------------------------------------------------------------
; AnimateCurrentBullet
;-------------------------------------------------------------------------
AnimateCurrentBullet
        DEC bulletFrameCounter
        BEQ b8535
b8534   RTS 

b8535   LDA #$20
        STA bulletFrameCounter

        ; Play Bullet Sound
        LDA voice1FreqHiVal
        BEQ b8551
        DEC voice1FreqHiVal
        DEC voice1FreqHiVal
        LDA voice1FreqHiVal
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        BNE b8551
        LDA #$00
        STA $D404    ;Voice 1: Control Register

b8551   LDA bulletType
        BEQ b8534
        AND #$F0
        BEQ b856E
        CMP #$10
        BNE b8560
        JMP DrawDeflectedBullet

b8560   CMP #$20
        BNE b8567
        JMP j90A4

b8567   CMP #$30
        BNE b856E
        JMP j905F

b856E   LDA bulletType
        AND #$02
        BNE b8590
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
        ; Returns

b8590   LDA bulletXPosition
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
        BNE b85B2
        LDA #$00
        STA bulletType
        RTS 

b85B2   LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_DOWN
        STA currentCharacter
        LDA bulletType
        EOR #$02
        STA bulletType
        JSR CheckBulletCollision
        JMP WriteCurrentCharacterToCurrentXYPos
        ;Returns

;-------------------------------------------------------------------------
; AnimateZappers
;-------------------------------------------------------------------------
AnimateZappers
        LDA frameControlCounter
        CMP #$30
        BEQ b85CD
b85CC   RTS 

b85CD   DEC zapperFrameCounter
        BNE b85CC
        JSR AnimateMatrixTitle
        LDA #$02
        STA zapperFrameCounter
        JSR PerformRollingGridAnimation
        JSR DrawLasers
        LDA zapperSwitch
        BNE b8616

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

b8616   LDA #SPACE
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
        CMP #$27
        BNE b8646
        LDA #$01
        STA bottomZapperXPos
b8646   INC leftZapperYPos
        LDA leftZapperYPos
        CMP #$16
        BNE b8652
        LDA #$03
        STA leftZapperYPos
b8652   LDA #$00
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
        BEQ b8684
        LDA bottomZapperXPos
        CMP previousShipXPosition
        BNE b8684
        LDA #$01
        STA currentLaserInterval
b8684   LDA currentLaserInterval
        BEQ b869F
        DEC currentLaserInterval
        BNE b869F

        LDA bottomZapperXPos
        STA oldBottomZapperXPos
        LDA leftZapperYPos
        STA oldLeftZapperYPos
        LDA #$01
        STA oldLeftLazerXPos
        RTS 

;-------------------------------------------------------------------------
; AnimateCamelsAndLaserZaps
;-------------------------------------------------------------------------
AnimateCamelsAndLaserZaps
        LDA bulletFrameCounter
        CMP #$02
        BEQ b86A0
b869F   RTS 

b86A0   JSR PlayMoreSoundEffects
        JSR AnimateCameloid
        LDA currentLaserInterval
        BNE b869F
        LDA oldLeftLazerXPos
        CMP oldBottomZapperXPos
        BEQ b86DF
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

b86DF   LDA #$15
        STA currentYPosition
        LDA oldBottomZapperXPos
        STA currentXPosition

        LDA laserChar
        AND #$01
        CLC 
        ADC #$05
        STA currentCharacter
b86F0   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b86F0

        LDA oldBottomZapperXPos
        CMP previousShipXPosition
        BEQ JumpToCollisionWithShip
        LDA oldLeftLazerXPos
        CMP oldBottomZapperXPos
        BEQ b8708
        RTS 

        ; Draw the laser line across the grid.
b8708   LDA #$15
        STA currentYPosition
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA #GRID
        STA currentCharacter
        LDA oldBottomZapperXPos
        STA currentXPosition
b8718   JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentYPosition
        LDA currentYPosition
        CMP #$02
        BNE b8718

        LDA oldLeftZapperYPos
        STA currentYPosition
        LDA #YELLOW
        STA colorForCurrentCharacter
        LDA #POD3
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos

        LDA laserIntervalForLevel
        STA currentLaserInterval
        LDA #<SCREEN_RAM + $00A0
        STA gridStartLoPtr
        LDA #>SCREEN_RAM + $00A0
        STA gridStartHiPtr

        ; Award a bonus bit for surviving a laser.
        LDA bonusBits
        ORA #$08
        STA bonusBits

        LDY #$00
b8746   LDA (gridStartLoPtr),Y
        BEQ b874D
        JSR DrawBombLeftByLaser
b874D   INC gridStartLoPtr
        BNE b8746
        INC gridStartHiPtr
        LDA gridStartHiPtr
        CMP #$08
        BNE b8746
        RTS 

;-------------------------------------------------------------------------
; DrawBombLeftByLaser
;-------------------------------------------------------------------------
DrawBombLeftByLaser
        CMP #$20
        BNE b875F
        RTS 

b875F   LDX #$07
b8761   CMP droidDecaySequence,X
        BEQ b876A
        DEX 
        BNE b8761
        RTS 

b876A   LDA droidDecaySequence + $01,X
        STA (gridStartLoPtr),Y

        ; Clear bonus bits for missing the opportunity to destroy the pod
        ; left by a lazer.
        LDA bonusBits
        AND #$F7
        STA bonusBits

        CPX #$07
        BEQ b877A
        RTS 

b877A   LDX #$20
b877C   LDA previousLasersHiPtrArray,X
        BEQ b8789
        DEX 
        BNE b877C

        LDA #$0D
        STA (gridStartLoPtr),Y
        RTS 

b8789   LDA gridStartLoPtr
        STA previousLasersLoPtrsArray,X
        LDA gridStartHiPtr
        STA previousLasersHiPtrArray,X
        RTS 

;-------------------------------------------------------------------------
; DrawLasers
;-------------------------------------------------------------------------
DrawLasers
        LDX #$20
b8796   LDA previousLasersHiPtrArray,X
        BEQ b879E
        JSR DrawLaser
b879E   DEX 
        BNE b8796
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
        LDA previousLasersLoPtrsArray,X
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
        ADC #$28
        STA gridStartLoPtr
        LDA gridStartHiPtr
        ADC #$00
        STA gridStartHiPtr
        LDA (gridStartLoPtr),Y
        LDX #$04
b87DB   CMP shipValues,X
        BNE b87E3
        JMP JumpToCollisionWithShip

b87E3   CMP bottomZapperValues,X
        BEQ b8807
        DEX 
        BNE b87DB
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
        STA previousLasersLoPtrsArray,X
        PLA 
        STA previousLasersHiPtrArray,X
        RTS 

b8807   LDX tempCounter
        LDA #$00
        STA previousLasersHiPtrArray,X
        RTS 

;---------------------------------------------------------------------------------
; CheckForShipCollidingWithSomething   
;---------------------------------------------------------------------------------
CheckForShipCollidingWithSomething   
        JSR GetCharacterAtCurrentXYPos
        BEQ b8825

        ; There's something at the new position. Check if it's something that
        ; kills the ship.
        LDX thingsThatKillAShip
b8817   CMP thingsThatKillAShip,X
        BEQ b8822
        DEX 
        BNE b8817

        STX shipMovementDirection
        RTS 

        ; It's a thing that kills a ship!
b8822   JMP JumpToCollisionWithShip

b8825   LDA currentXPosition
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
        BNE b884C
        PLA 
        STA currentXPosition
        JMP CheckForShipCollidingWithSomething

b884C   LDA previousShipYPosition
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
        BEQ b8893

        ; Droid is no longer a bomb so if we have a collision with a 
        ; decaying droid advance it's decay state. 
        LDX #$07
b885F   CMP droidDecaySequence,X
        BEQ b886A
        DEX 
        BNE b885F
        JMP CheckBulletCollisionWithDroidSquad

        ; Update the droid with the next state in its decay
b886A   LDA droidDecaySequence - $01,X
        STA currentCharacter
        LDA #YELLOW
        STA colorForCurrentCharacter
        CPX #$02
        BNE b888A

        ; The pod has been destroyed.
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDX #$06
        LDY #$01
        JSR IncreaseScore
        LDA #$04
        STA podDestroyedSoundEffect
b888A   JSR WriteCurrentCharacterToCurrentXYPos
        LDA #$00
        STA bulletType
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
; AnimateMatrixTitle
;-------------------------------------------------------------------------
AnimateMatrixTitle
        LDA charSetLocation + $0109
        ROL 
        ADC #$00
        ;FIXME: should this be charSetLocation + $0109 like in Vic20?
        STA wrongCharSetLocation
        RTS 

;-------------------------------------------------------------------------
; PlayMoreSoundEffects
;-------------------------------------------------------------------------
PlayMoreSoundEffects
        JSR UpdateSoundEffects
        LDA podDestroyedSoundEffect
        BNE b88C0
        RTS 

b88C0   LDA voice2FreqHiVal2
        CMP #$16
        BNE b88DD
        LDA podDestroyedSoundEffect
        ASL 
        ASL 
        CLC 
        ADC podDestroyedSoundEffect
        STA $D418    ;Select Filter Mode and Volume
        LDA #$10
        STA voice2FreqHiVal2
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        JSR PlayNote1
        RTS 

b88DD   INC voice2FreqHiVal2
        LDA voice2FreqHiVal2
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        CMP #$16
        BEQ b88EB
b88EA   RTS 

b88EB   DEC podDestroyedSoundEffect
        BNE b88EA
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        STA voice2FreqHiVal2
        LDA #$00
        STA $D40B    ;Voice 2: Control Register
        RTS 

;-------------------------------------------------------------------------
; UpdateSoundEffects
;-------------------------------------------------------------------------
UpdateSoundEffects
        LDA deflexorSoundControl
        BNE b892A
        LDA explosionSoundControl
        BNE b8906
        RTS 

b8906   LDA voice3FreqHiVal
        CMP #$30
        BEQ b8917
        DEC voice3FreqHiVal
        LDA voice3FreqHiVal
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        RTS 

b8917   DEC explosionSoundControl
        BEQ b8924
        LDA #$40
        STA voice3FreqHiVal
        JSR PlayNote2
        RTS 

b8924   LDA #$00
        STA $D412    ;Voice 3: Control Register
b8929   RTS 

b892A   DEC deflexorSoundControl
        LDA deflexorSoundControl
        STA $D418    ;Select Filter Mode and Volume
        BNE b8929
        LDA #$00
        STA $D412    ;Voice 3: Control Register
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

;-------------------------------------------------------------------------
; AnimateDroidSquads
;-------------------------------------------------------------------------
AnimateDroidSquads
        DEC droidAnimationFrameRate
        LDA droidAnimationFrameRate
        CMP #$01
        BEQ b8947
b8946   RTS 

b8947   LDA #$C0
        STA droidAnimationFrameRate
        JSR AnimateSnitch
        LDA noOfDroidSquadsLeftInCurrentLevel
        BNE b8955
        JMP j89CC

b8955   LDA counterBetweenDroidSquads
        BEQ b8946
        CMP #$01
        BEQ b8962
        DEC counterBetweenDroidSquads
        JMP j89CC

b8962   LDA currentNoOfDronesLeftInCurrentDroidSquad
        CMP originalNoOfDronesInDroidSquadInCurrentLevel
        BNE b89A3
        INC currentDroidsLeft
        LDX currentDroidsLeft
        LDA #$03
        STA droidSquadsYPosArray,X
        LDA $D012    ;Raster Position
        AND #$01
        BEQ b8985
        LDA #$1A
        STA droidSquadsXPosArray,X
        LDA #$81
        STA droidSquadState,X
        JMP j898F

b8985   LDA #$1C
        STA droidSquadsXPosArray,X
        LDA #$80
        STA droidSquadState,X
j898F   LDA currentLevelConfiguration
        AND #$80
        BEQ b89A3
        LDA noOfDroidSquadsLeftInCurrentLevel
        AND #$01
        BEQ b89A3
        LDA droidSquadState,X
        ORA #$04
        STA droidSquadState,X
b89A3   INC currentDroidsLeft
        LDX currentDroidsLeft
        LDA #$1B
        STA droidSquadsXPosArray,X
        LDA #$03
        STA droidSquadsYPosArray,X
        LDA #$00
        STA droidSquadState,X
        DEC currentNoOfDronesLeftInCurrentDroidSquad
        BEQ b89BD
        JMP j89CC

b89BD   LDA #$40
        STA droidSquadState,X
        LDA initialCounterBetweenDroidSquads
        STA counterBetweenDroidSquads
        LDA originalNoOfDronesInDroidSquadInCurrentLevel
        STA currentNoOfDronesLeftInCurrentDroidSquad
        DEC noOfDroidSquadsLeftInCurrentLevel

j89CC   INC currentDroidChar
        LDA currentDroidChar
        CMP #DROID3
        BNE b89D8
        LDA #DROID1
        STA currentDroidChar
b89D8   LDX currentDroidsLeft
        LDA currentDroidsLeft
        BNE b89DF
        RTS 

b89DF   LDA droidSquadState,X
        AND #$80
        BNE b89E9
        JMP j8A92

b89E9   JSR GenerateLaserDependingOnShipAndDroidPosition
        LDA droidSquadState,X
        AND #$04
        BEQ b89F6
        JMP j8AE2

b89F6   LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA droidSquadState,X
        AND #$40
        BEQ b8A16
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
b8A16   LDA droidSquadState,X
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

j8A31   STX gridStartHiPtr
        JSR GetCharacterAtCurrentXYPos
        LDX gridStartHiPtr
        CMP #$00
        BEQ b8A4E
        CMP #$07
        BEQ JumpToJumpCollisionWithShip
        CMP #$0B
        BEQ JumpToJumpCollisionWithShip
        CMP #$0C
        BEQ JumpToJumpCollisionWithShip
        JMP j8A6E

JumpToJumpCollisionWithShip
        JMP JumpToCollisionWithShip

b8A4E   LDA currentXPosition
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
j8A67   DEX 
        BEQ b8A6D
        JMP b89DF

b8A6D   RTS 

j8A6E   INC currentYPosition
        LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadState,X
        EOR #$01
        STA droidSquadState,X
        LDA currentYPosition
        CMP #$15
        BNE b8A4E
        DEC currentYPosition
        LDA droidSquadState,X
        EOR #$01
        ORA #$06
        STA droidSquadState,X
        JMP b8A4E

j8A92   LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA droidSquadState,X
        AND #$40
        BEQ b8AB2
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
b8AB2   LDA droidSquadsXPosArray - $01,X
        STA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray - $01,X
        STA droidSquadsYPosArray,X
        STA currentYPosition
        STX gridStartHiPtr
        JSR GetCharacterAtCurrentXYPos
        LDX gridStartHiPtr
        CMP #$07
        BNE b8AD0
        JMP JumpToCollisionWithShip

b8AD0   LDA #CYAN
        STA colorForCurrentCharacter
        LDA #DROID1
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        JMP j8A67

j8AE2   LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA droidSquadState,X
        AND #$40
        BEQ b8B02
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
b8B02   LDA droidSquadState,X
        STA tempCounter
        AND #$01
        BEQ b8B0F
        DEC currentXPosition
        DEC currentXPosition
b8B0F   INC currentXPosition
        LDA tempCounter
        AND #$02
        BEQ b8B1B
        DEC currentYPosition
        DEC currentYPosition
b8B1B   INC currentYPosition
        STX gridStartHiPtr
        JSR GetCharacterAtCurrentXYPos
        LDX gridStartHiPtr
        CMP #$07
        BEQ b8B37
        CMP #$0B
        BEQ b8B37
        CMP #$0C
        BNE b8B3A
        CMP #$00
        BEQ b8B3A
        JMP j8B5A

b8B37   JMP JumpToCollisionWithShip

b8B3A   LDA #$00
        STA tempCounter2
        LDA currentXPosition
        BEQ j8B5A
        CMP #$27
        BEQ j8B5A
j8B46   LDA currentYPosition
        CMP #$02
        BEQ b8B6D
        CMP #$16
        BEQ b8B6D
j8B50   LDA tempCounter2
        BNE b8B57
        JMP b8A4E

b8B57   JMP b8B02

j8B5A   LDA tempCounter
        EOR #$01
        STA droidSquadState,X
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        LDA #$01
        STA tempCounter2
        JMP j8B46

b8B6D   LDA droidSquadState,X
        EOR #$02
        STA droidSquadState,X
        LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA #$01
        STA tempCounter2
        JMP j8B50

;---------------------------------------------------------------------------------
; CheckBulletCollisionWithDroidSquad   
;---------------------------------------------------------------------------------
CheckBulletCollisionWithDroidSquad   
        CMP #$13
        BEQ b8B90
        CMP #$14
        BEQ b8B90
        CMP #$15
        BEQ b8B90
        JMP CheckBulletCollisionWithCamelDroids

        ; Current character is a droid
b8B90   PHA 
        LDA currentYPosition
        CMP #$03
        BNE b8BA1
        LDA currentNoOfDronesLeftInCurrentDroidSquad
        CMP originalNoOfDronesInDroidSquadInCurrentLevel
        BEQ b8BA1
        PLA 
        JMP CheckBulletCollisionWithCamelDroids

b8BA1   PLA 
        LDX currentDroidsLeft
b8BA4   LDA droidSquadsXPosArray,X
        CMP currentXPosition
        BEQ b8BAF
b8BAB   DEX 
        BNE b8BA4
        RTS 

b8BAF   LDA droidSquadsYPosArray,X
        CMP currentYPosition
        BNE b8BAB
        LDA bulletType
        AND #$30
        BEQ b8BC2

        ; Get a bonus bit for hitting something with a deflected
        ; bullet.
        LDA bonusBits
        ORA #$80
        STA bonusBits

b8BC2   LDA #$00
        STA bulletType
        LDA #$04
        STA explosionSoundControl
        LDA #$36
        STA voice3FreqHiVal
        JSR PlayNote2
        LDA droidSquadState,X
        AND #$C0
        CMP #$C0
        BNE b8BE2
        LDA #$04
        STA tempCounter
        JMP j8C43

b8BE2   CMP #$40
        BNE b8BF6
        LDA droidSquadState,X
        ORA droidSquadState - $01,X
        STA droidSquadState - $01,X
        LDA #$01
        STA tempCounter
        JMP j8C43

b8BF6   CMP #$80
        BEQ b8C2A
        STX gridStartHiPtr
b8BFC   DEX 
        LDA droidSquadState,X
        AND #$80
        BEQ b8BFC
        LDA droidSquadState,X
        LDX gridStartHiPtr
        ORA droidSquadState + $01,X
        STA droidSquadState + $01,X
        AND #$04
        BEQ b8C1B
        LDA droidSquadState + $01,X
        EOR #$01
        STA droidSquadState + $01,X
b8C1B   LDA #$01
        STA tempCounter
        LDA #$40
        ORA droidSquadState - $01,X
        STA droidSquadState - $01,X
        JMP j8C43

b8C2A   LDA droidSquadState,X
        ORA droidSquadState + $01,X
        STA droidSquadState + $01,X
        AND #$04
        BEQ b8C3F
        LDA droidSquadState + $01,X
        EOR #$01
        STA droidSquadState + $01,X
b8C3F   LDA #$04
        STA tempCounter

j8C43   LDA droidSquadsXPosArray + $01,X
        STA droidSquadsXPosArray,X
        LDA droidSquadsYPosArray + $01,X
        STA droidSquadsYPosArray,X
        LDA droidSquadState + $01,X
        STA droidSquadState,X
        CPX currentDroidsLeft
        BEQ b8C5D
        INX 
        JMP j8C43

        ; Hit a droid at current position, increase the score and leave an egg.
b8C5D   DEC currentDroidsLeft
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

tempXStorage = gridStartHiPtr
;-------------------------------------------------------------------------
; GenerateLaserDependingOnShipAndDroidPosition
;-------------------------------------------------------------------------
GenerateLaserDependingOnShipAndDroidPosition
        LDA currentLevel
        CMP #$02
        BPL b8C7A
b8C79   RTS 

b8C7A   DEC mainCounterBetweenLasers
        BEQ b8C94
        LDA currentLevel
        CMP $04 ; FIXME: Is this a bug? Should it be #$04 so that it's looking at which level we're at??
        BMI b8C79
        LDA droidSquadsXPosArray,X
        CMP previousShipXPosition
        BNE b8C79
        DEC currentCounterBetweenLsers
        BEQ b8C90
b8C8F   RTS 

b8C90   LDA initialCounterBetweenLasers
        STA currentCounterBetweenLsers
b8C94   LDA initialMainCounterBetweenLasers
        STA mainCounterBetweenLasers
        LDA previousShipYPosition
        SEC 
        SBC droidSquadsYPosArray,X
        BVS b8C8F
        CMP #$04
        BMI b8C8F
        STX tempXStorage
        LDX #$20
b8CA8   LDA previousLasersHiPtrArray,X
        BEQ b8CB1
        DEX 
        BNE b8CA8
        RTS 

b8CB1   STX tempCounter
        LDX tempXStorage
        LDA droidSquadsXPosArray,X
        STA currentXPosition
        LDA droidSquadsYPosArray,X
        STA currentYPosition
        STX tempXStorage
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
        STA previousLasersLoPtrsArray,X
        LDX tempXStorage
        RTS 

;-------------------------------------------------------------------------
; AnimateCameloid
;-------------------------------------------------------------------------
AnimateCameloid
        DEC cameloidAnimationInteveralForLevel
        BEQ b8CE0
        RTS 

b8CE0   LDA currentCameloidAnimationInterval
        STA cameloidAnimationInteveralForLevel
        LDA originalNoOfDronesInDroidSquadInCurrentLevel
        BNE b8CEB
        JSR ReduceScore

b8CEB   LDA currrentNoOfCameloidsAtOneTimeForLevel
        BNE b8CF0
        RTS 

b8CF0   LDA noOfCameloidsLeftInCurrentLevel
        BNE b8CF7
        JMP j8D20

b8CF7   DEC currrentNoOfCameloidsAtOneTimeForLevel
        BEQ b8CFE
        JMP j8D20

b8CFE   LDA originalNoOFCameloidsAtOneTimeForLevel
        STA currrentNoOfCameloidsAtOneTimeForLevel
        INC currentCameloidsLeft
        LDX currentCameloidsLeft
        LDA #$03
        STA cameloidsCurrentYPosArray,X
        LDA $D012    ;Raster Position
        AND #$0F
        CLC 
        ADC #$04
        STA cameloidsCurrentXPosArray,X
        LDA $D012    ;Raster Position
        AND #$40
        STA cameloidsColorArray,X
        DEC noOfCameloidsLeftInCurrentLevel
j8D20   LDX currentCameloidsLeft
        CPX #$00
        BNE b8D27
        RTS 

b8D27   LDA cameloidsColorArray,X
        AND #$20
        BEQ b8D31
        JMP j8EF0

b8D31   LDA cameloidsColorArray,X
        AND #$01
        BEQ b8D3B
        JMP j8DF4

b8D3B   LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA cameloidsCurrentYPosArray,X
        STA currentYPosition
        LDA cameloidsColorArray,X
        AND #$40
        BEQ b8D58
        INC currentXPosition
        INC currentXPosition
b8D58   DEC currentXPosition
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
j8D61   LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA #YELLOW
        STA colorForCurrentCharacter
        LDA #CAMELOID
        STA currentCharacter
        LDA cameloidsColorArray,X
        AND #$40
        BEQ b8D79
        LDA #LEFT_CAMELOID
        STA currentCharacter
b8D79   STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        LDA cameloidsColorArray,X
        AND #$40
        BEQ b8D8B
        DEC currentXPosition
        DEC currentXPosition
b8D8B   INC currentXPosition
        JSR GetCharacterAtCurrentXYPos
        BEQ b8DD9
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
        BNE b8DD6
        LDA currentDroidsLeft
        BNE b8DD0
        LDA noOfDroidSquadsLeftInCurrentLevel
        BNE b8DD0

        ; Get a low bonus bit for killing an entire drone squad.
        LDA bonusBits
        ORA #$02
        STA bonusBits

b8DD0   JSR CheckIfCameloidsCleared
        JMP j8DE5

b8DD6   JMP j8D61

b8DD9   LDA currentXPosition
        LDX gridStartHiPtr
        STA cameloidsCurrentXPosArray,X
        LDA currentYPosition
        STA cameloidsCurrentYPosArray,X
j8DE5   LDA cameloidsColorArray,X
        EOR #$01
        STA cameloidsColorArray,X
        DEX 
        BEQ b8DF3
        JMP b8D27

b8DF3   RTS 

j8DF4   LDA #YELLOW
        STA colorForCurrentCharacter
        LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA cameloidsCurrentYPosArray,X
        STA currentYPosition
        LDA cameloidsColorArray,X
        AND #$40
        BNE b8E1E
        LDA #CAMELOID_RIGHT
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        JMP j8DE5

b8E1E   LDA #LEFT_CAMELOID_LEFT
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        JMP j8DE5

;-------------------------------------------------------------------------
; CheckIfCameloidsCleared
;-------------------------------------------------------------------------
CheckIfCameloidsCleared
        STX gridStartHiPtr
j8E35   LDA cameloidsCurrentXPosArray + $0001,X
        STA cameloidsCurrentXPosArray,X
        LDA cameloidsCurrentYPosArray + $0001,X
        STA cameloidsCurrentYPosArray,X
        LDA cameloidsColorArray + $0001,X
        STA cameloidsColorArray,X
        CPX currentCameloidsLeft
        BEQ b8E4F
        INX 
        JMP j8E35

b8E4F   LDX gridStartHiPtr
        DEC currentCameloidsLeft
        LDA originalNoOfDronesInDroidSquadInCurrentLevel
        BEQ b8E61
        LDA noOfCameloidsLeftInCurrentLevel
        BNE b8E61

        ; Get a high bonus bit for clearing cameloids.
        LDA bonusBits
        ORA #$40
        STA bonusBits

b8E61   RTS 

camelCharacters =*-$01
        .BYTE CAMELOID,CAMELOID_LEFT,CAMELOID_RIGHT,LEFT_CAMELOID
        .BYTE LEFT_CAMELOID_RIGHT,LEFT_CAMELOID_LEFT 
;---------------------------------------------------------------------------------
; CheckBulletCollisionWithCamelDroids   
;---------------------------------------------------------------------------------
CheckBulletCollisionWithCamelDroids   
        LDX #$06
b8E6A   CMP camelCharacters,X
        BEQ b8E75
        DEX 
        BNE b8E6A
        JMP CheckBulletCollisionWithOtherElements

        ; Current character is a camel droid.
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
b8E8D   LDX currentCameloidsLeft
        LDA currentXPosition

        ; Check for collision with one of the camels.
        ; First check if the X position of the bullet matches one of the camels.
b8E91   CMP cameloidsCurrentXPosArray,X
        BEQ b8E9A
b8E96   DEX 
        BNE b8E91
        RTS 

        ; Check if the Y position of the bullet matches. If so, we have a collision.
b8E9A   LDA currentYPosition
        CMP cameloidsCurrentYPosArray,X
        BNE b8E96

        ; We have a collision.
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
        LDA #$36
        STA voice3FreqHiVal
        JSR PlayNote2
        LDA cameloidsColorArray,X
        AND #$40
        BNE b8ED7
        LDA cameloidsCurrentXPosArray,X
        CMP #$01
        BEQ b8EE8
        DEC cameloidsCurrentXPosArray,X
        JMP b8EE8

b8ED7   LDA currentXPosition
        STA cameloidsCurrentXPosArray,X
        JMP b8EE8

        .BYTE $80,$1B
        AND #$01
        BEQ b8EE8
        INC cameloidsCurrentXPosArray,X
b8EE8   LDA #$2F
        STA cameloidsColorArray,X
        PLA 
        PLA 
        RTS 

j8EF0   LDA cameloidsCurrentXPosArray,X
        STA currentXPosition
        LDA cameloidsCurrentYPosArray,X
        STA currentYPosition
        LDA cameloidsColorArray,X
        AND #$0F
        BEQ b8F27
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
j8F1E   LDX gridStartHiPtr
        DEX 
        BEQ b8F26
        JMP b8D27

b8F26   RTS 

b8F27   JSR CheckIfCameloidsCleared
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        LDA #GRID
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j8F1E

;-------------------------------------------------------------------------
; AnimateSnitch
;-------------------------------------------------------------------------
AnimateSnitch
        LDA currentSnitchAnimationInterval
        BEQ b8F45
        DEC currentSnitchAnimationInterval
        BEQ b8F46
b8F45   RTS 

b8F46   LDA snitchAnimationIntervalForLevel
        STA currentSnitchAnimationInterval
        LDA snitchStateControl
        EOR #$01
        STA snitchStateControl
        AND #$80
        BEQ b8F57
        JMP DrawTheSnitch

b8F57   LDA #$02
        STA currentYPosition
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA snitchCurrentXPos
        STA currentXPosition
        LDA snitchStateControl
        AND #$40
        BNE b8F8F
        LDA #SPACE
        STA currentCharacter
        DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA #SNITCH_RUN_RIGHT
        STA currentCharacter
        LDA snitchStateControl
        AND #$01
        BEQ b8F82
        LDA #SNITCH_LEFT
        STA currentCharacter
b8F82   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        INC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        JMP j8FB4

b8F8F   LDA #SPACE
        STA currentCharacter
        INC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        DEC currentXPosition
        LDA #$6B
        STA currentCharacter
        LDA snitchStateControl
        AND #$01
        BEQ b8FA8
        LDA #SNITCH_RIGHT1
        STA currentCharacter
b8FA8   DEC currentXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        DEC currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
j8FB4   LDA snitchStateControl
        AND #$01
        BEQ b8FC7
        LDA snitchStateControl
        AND #$40
        BNE b8FC4
        INC snitchCurrentXPos
        INC snitchCurrentXPos
b8FC4   DEC snitchCurrentXPos
        RTS 

b8FC7   LDA snitchCurrentXPos
        CMP previousShipXPosition
        BNE b8FD2
        LDA #$80
        STA snitchStateControl
b8FD1   RTS 

b8FD2   BMI b8FDF
        LDA snitchStateControl
        AND #$40
        BNE b8FD1
        LDA #$41
        STA snitchStateControl
b8FDE   RTS 

b8FDF   LDA snitchStateControl
        AND #$40
        BEQ b8FDE
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
        BNE b9009
        RTS 

b9009   LDA #$00
        STA snitchStateControl
        JMP b8FC7

;---------------------------------------------------------------------------------
; DrawDeflectedBullet   
;---------------------------------------------------------------------------------
DrawDeflectedBullet   
        LDA bulletType
        AND #$02
        BNE b902F
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
        ;Returns

b902F   LDA #GRID
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
        CMP #$27
        BNE b904F
        LDA #$00
        STA bulletType
        RTS 

b904F   INC bulletXPosition
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_LEFT
        STA currentCharacter
        JSR CheckBulletCollision
        JMP WriteCharacterAndReturn

j905F   LDA bulletType
        AND #$02                              
        BNE b9078                             
        LDA #$01                              
        STA colorForCurrentCharacter          
        LDA #BULLET_LEFT
        STA currentCharacter                  
        LDA bulletXPosition                   
        STA currentXPosition                  
        LDA bulletYPosition                   
        STA currentYPosition
        JMP WriteCharacterAndReturn

b9078   LDA bulletXPosition
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
        BNE b9096
        LDA #$00
        STA bulletType
        RTS 

b9096   LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_RIGHT
        STA currentCharacter
        JSR CheckBulletCollision
        JMP WriteCharacterAndReturn

j90A4   LDA bulletXPosition
        STA currentXPosition
        LDA bulletYPosition
        STA currentYPosition
        LDA bulletType
        AND #$02
        BNE b90BD
        LDA #WHITE
        STA colorForCurrentCharacter
        LDA #BULLET_DOWN
        STA currentCharacter
        JMP WriteCharacterAndReturn

b90BD   LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentYPosition
        LDA currentYPosition
        CMP #$16
        BNE b90D5
        LDA #$00
        STA bulletType
        RTS 

b90D5   INC bulletYPosition
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
        BEQ b90EA
        RTS 

b90EA   LDA #$80
        STA deflexorFrameRate
        INC currentDeflexorColor
        LDX currentDeflexorIndex
        CPX #$00
        BNE b90F7
        RTS 

b90F7   LDA #$00
        STA gridStartHiPtr
        LDA mysteryBonusPerformance,X
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
        BNE b90F7
        RTS 

rightDeflexorValues   =*-$01
				.BYTE DEFLEX1,EXPLOSION1,EXPLOSION2
leftDeflexorValues  =*-$01
				.BYTE DEFLEX2,EXPLOSTION3,DOT2
dotAndComma  =*-$01
				.BYTE BIG_DOT,COMMA,EXCLAMATION
shipCharacters =*-$01  
        .BYTE SHIP,SHIP_LEFT,SHIP_RIGHT
;---------------------------------------------------------------------------------
; CheckBulletCollisionWithOtherElements   
;---------------------------------------------------------------------------------
CheckBulletCollisionWithOtherElements   
        LDX #$03
b913D   CMP rightDeflexorValues,X
        BEQ CheckCollisionWithDeflexors
        CMP leftDeflexorValues,X
        BEQ b9187
        CMP dotAndComma,X
        BEQ b9158
        CMP shipCharacters,X
        BNE b9154
        JMP JumpToCollisionWithShip

b9154   DEX 
        BNE b913D
b9157   RTS 

b9158   LDA bulletType
        AND #$10
        BNE b9157
        LDA bulletType
        EOR #$20
        STA bulletType
        CPX #$01
        BNE b9157
        JMP j9197

CheckCollisionWithDeflexors   
        LDA bulletType
        AND #$30
        STA gridStartHiPtr
        LDA #$50
        SEC 
        SBC gridStartHiPtr
        AND #$30
        STA gridStartHiPtr
j917A   LDA bulletType
        AND #$8F
        ORA gridStartHiPtr
        STA bulletType
        CPX #$01
        BEQ j9197
        RTS 

b9187   LDA bulletType
        AND #$30
        STA gridStartHiPtr
        LDA #$30
        SEC 
        SBC gridStartHiPtr
        STA gridStartHiPtr
        JMP j917A

        ; Detect collision with deflexor
j9197   LDX currentDeflexorIndex
b9199   LDA currentXPosition
        CMP currentDeflexorXPosArray,X
        BEQ b91A4
b91A0   DEX 
        BNE b9199
        RTS 

b91A4   LDA currentYPosition
        CMP currentDeflexorYPosArray,X
        BNE b91A0

        ; A bullet has hit the deflexor.
        LDA mysteryBonusPerformance,X
        JSR UpdateMysteryBonusPerformance
        STA mysteryBonusPerformance,X
        LDA #$0F
        STA deflexorSoundControl
        LDA #$90
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JSR PlayNote2
        LDA #$00
        STA explosionSoundControl
        RTS 

;-------------------------------------------------------------------------
; UpdateMysteryBonusPerformance
;-------------------------------------------------------------------------
UpdateMysteryBonusPerformance
        AND #$30
        CMP #$20
        BEQ b91DA
        CMP #$10
        BEQ b91D5
        LDA #$1F
        STA mysteryBonusPerformance,X
        RTS 

b91D5   LDA #$0F
        STA mysteryBonusPerformance,X
b91DA   LDA mysteryBonusPerformance,X
        RTS 

;---------------------------------------------------------------------------------
; LoadDeflexorsForLevel   
;---------------------------------------------------------------------------------
LoadDeflexorsForLevel   
        LDX deflexorIndexForLevel
        STX currentDeflexorIndex
b91E2   LDA deflexorXPosArrays,X
        STA currentDeflexorXPosArray,X
        LDA deflexorYPosArray,X
        STA currentDeflexorYPosArray,X
        LDA mysteryBonusPerformanceArrayForLevel,X
        STA mysteryBonusPerformance,X
        DEX 
        BNE b91E2
        RTS 

deflexorXPosArrays = *-$01
        .BYTE $13,$14,$13,$14,$01,$04,$07,$0A
        .BYTE $26,$23,$20,$1D,$13,$14,$07,$20
        .BYTE $05,$05,$22,$22,$02,$04,$06,$08
        .BYTE $26,$24,$22,$20
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
noOfDroidSquadsForLevel = *-$01
        .BYTE $01,$02,$03,$00,$02,$02,$02
        .BYTE $02,$00,$03,$03,$03,$02,$03,$03
        .BYTE $00,$03,$03,$03,$03
noOfDronesInLevelDroidSquads = *-$01
        .BYTE $06,$06,$06,$00,$07,$07,$07
        .BYTE $07,$00,$08,$08,$08,$09,$0A,$0B
        .BYTE $00,$0B,$0B,$0C,$0D
noOfCameloidsForLevel = *-$01
        .BYTE $00,$00,$00,$14,$00,$08,$09
        .BYTE $00,$19,$0A,$00,$0B,$0C,$00,$0F
        .BYTE $1E,$00,$14,$14,$14
noOfCameloidsAtAnyOneTimeForlevel = *-$01
        .BYTE $00,$00,$00,$06,$00,$06,$06
        .BYTE $00,$04,$06,$00,$04,$04,$00,$04
        .BYTE $03,$00,$04,$03,$03
cameloidSpeedForLevel = *-$01
        .BYTE $00,$00,$00,$04,$00,$07,$07
        .BYTE $00,$03,$06,$00,$05,$05,$00,$04
        .BYTE $03,$00,$03,$03,$03
laserIntervalsForLevels = *-$01
        .BYTE $10,$0F,$0E,$0D,$0D,$0D,$0C
        .BYTE $0C,$0B,$0B,$0A,$09,$09,$08,$09
        .BYTE $08,$07,$07,$06,$06
snitchSpeedForLevel = *-$01
        .BYTE $00,$00,$04,$04,$03,$03,$03
        .BYTE $03,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02
deflexorIndexArrayForLevel = *-$01
        .BYTE $00,$00,$00,$00,$04,$00,$00
        .BYTE $0C,$00,$00,$10,$00,$00,$14,$00
        .BYTE $00,$00,$1C,$00,$1C
; 01 - Don't draw a grid
; 82 - Blocky diagonally scrolling grid type
configurationForLevel = *-$01
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

        LDA noOfCameloidsAtAnyOneTimeForlevel,X
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

        ; Clear grid
        LDA #SPACE
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

        ; Draw grid
        LDA #GRID
        STA currentCharacter
        LDA #$03
        STA currentYPosition
        LDA #GRID_BLUE
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
        JSR DrawEmptyGrid
        LDA #$0B
        STA currentYPosition
        LDA #SPACE
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
        LDA #WHITE
        STA colorForCurrentCharacter
b93B5   LDA txtEnterZoneXX,X
        STA currentCharacter
        STX previousShipXPosition
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX previousShipXPosition
        INC currentXPosition
        INX 
        CPX #$0D
        BNE b93B5

        DEC currentXPosition
        DEC currentXPosition
        JSR GetLinePtrForCurrentYPosition
        INY 

        LDX currentLevel
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
        JMP PlayInterstitialSoundAndClearGrid

;-------------------------------------------------------------------------
; DelayThenAdvanceRollingGridAnimation
;-------------------------------------------------------------------------
DelayThenAdvanceRollingGridAnimation
        JSR WasteAFewCycles
        ; Fall through

;-------------------------------------------------------------------------
; PerformRollingGridAnimation
;-------------------------------------------------------------------------
PerformRollingGridAnimation
        LDA charSetLocation + $0007
        STA rollingGridPreviousChar
        LDX #$07
b93FA   LDA charSetLocation - $0001,X
        STA charSetLocation,X
        DEX 
        BNE b93FA

        LDA rollingGridPreviousChar
        STA charSetLocation
        LDA currentLevelConfiguration
        AND #$80
        BEQ b9411
        JMP ScrollGrid

b9411   RTS 

txtEnterZoneXX   .TEXT "ENTER ZONE 00"
;---------------------------------------------------------------------------------
; PlayInterstitialSoundAndClearGrid   
;---------------------------------------------------------------------------------
PlayInterstitialSoundAndClearGrid   
        LDA #$0F
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayChord
        LDA #$E8
        STA voice1FreqHiVal
        JSR PlayNote1
b9432   LDA voice1FreqHiVal
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        STA voice2FreqHiVal
b943B   JSR DelayThenAdvanceRollingGridAnimation
        INC voice2FreqHiVal
        LDA voice2FreqHiVal
        SBC #$E0
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA voice2FreqHiVal
        BNE b943B
        INC voice1FreqHiVal
        BNE b9432
        JSR PlayChord
        JMP DrawEmptyGrid
        ; Returns

;---------------------------------------------------------------------------------
; Patterns used for SetGridPattern
;---------------------------------------------------------------------------------
regularGridPattern=*-$01
        .BYTE $30,$30,$30,$30,$FF,$30,$30,$30   ;.BYTE $30,$30,$30,$30,$FF,$30,$30,$30
                                                ; CHARACTER $00
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 11111111   ********
                                                ; 00110000     **    
                                                ; 00110000     **    
                                                ; 00110000     **    
blockyGridPattern=*-$01
        .BYTE $00,$00,$3C,$3C,$3C,$3C,$00,$00   ;.BYTE $00,$00,$3C,$3C,$3C,$3C,$00,$00
                                                ; CHARACTER $01
                                                ; 00000000           
                                                ; 00000000           
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00111100     ****  
                                                ; 00000000           
                                                ; 00000000           

;-------------------------------------------------------------------------
; SetGridPattern
;-------------------------------------------------------------------------
SetGridPattern
        LDA currentLevelConfiguration
        BNE b9479

        ; Normal Grid Pattern
        LDX #$08
b946F   LDA regularGridPattern,X
        STA charSetLocation - $0001,X
        DEX 
        BNE b946F
        RTS 

b9479   LDA currentLevelConfiguration
        CMP #$01
        BNE b948A

        ; Empty Grid pattern
        LDX #$08
        LDA #$00
b9483   STA charSetLocation - $0001,X
        DEX 
        BNE b9483
        RTS 

        ; Blocky grid pattern
b948A   LDX #$08
b948C   LDA blockyGridPattern,X
        STA charSetLocation - $0001,X
        DEX 
        BNE b948C
        RTS 

;---------------------------------------------------------------------------------
; ScrollGrid   
; Bit-shift each character to achieve a scrolling effect.
;---------------------------------------------------------------------------------
ScrollGrid   
        LDX #$08
b9498   CLC 
        LDA charSetLocation - $0001,X
        ROL 
        ADC #$00
        STA charSetLocation - $0001,X
        DEX 
        BNE b9498
b94A5   RTS 

;-------------------------------------------------------------------------
; CheckIfZoneCleared
;-------------------------------------------------------------------------
CheckIfZoneCleared
        LDA noOfDroidSquadsLeftInCurrentLevel
        BNE b94A5
        LDA currentDroidsLeft
        BNE b94A5
        LDA noOfCameloidsLeftInCurrentLevel
        BNE b94A5
        LDA currentCameloidsLeft
        BNE b94A5
        ; Falls through
;---------------------------------------------------------------------------------
; CheatByIncrementingLifeAndSkipLevel   
;---------------------------------------------------------------------------------
CheatByIncrementingLifeAndSkipLevel   
        INC currentLevel
        LDA currentLevel
        CMP #$15
        BNE b94C0
        DEC currentLevel
b94C0   LDX #$F8
        TXS 
        INC SCREEN_RAM + $0015
        LDA SCREEN_RAM + $0015
        CMP #$3A
        BNE b94D0
        DEC SCREEN_RAM + $0015
b94D0   JMP CalculateMysteryBonusAndClearZone

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

b94E3   JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDA currentXPosition
        CMP #$27
        BNE b94E3

        JSR PlayChord
        LDA #$08
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayNote2

        ; Draw the ship character explosion. THe screen flashes.
        ; The ship character animates an explosion.
        LDA #$10
        STA gridStartHiPtr
b9500   LDA #$60
        JSR PlayASoundEffect2
b9505   LDY #$E0
b9507   DEY 
        BNE b9507
        LDA voice3FreqHiVal
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC voice3FreqHiVal
        LDA voice3FreqHiVal
        CMP #$80
        BNE b9505
        JSR WasteAFewCycles
        LDA #$00
        LDX $D021    ;Background Color 0
        CPX #$F0
        BNE b9528
        LDA #$06
b9528   STA $D021    ;Background Color 0
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
        BNE b9500

        LDA #$0F
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayChord
        LDA #$04
        STA voice1FreqHiVal
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX #$08
        JSR PlayNote3

        ; Reset the wave data.
        LDA #$00
b9564   STA charSetLocation - $0001,X
        DEX 
        BNE b9564

        ; Draw the ship explosion trail sequence. Multicolored trails shoot out from
        ; the exploding ship.
b956A   LDA #$0F
        SEC 
        SBC soundModeAndVol
        STA tempCounter
        LDA #$07
        STA tempCounter2
        LDX tempCounter
        INX 
b9579   JSR WasteAFewCycles
        DEX 
        BNE b9579

b957F   JSR DrawCharacterInShipExplosion
        LDA tempCounter
        BEQ b959F
        DEC tempCounter
        BEQ b958E
        LDA tempCounter2
        BNE b957F

b958E   LDA #GRID
        STA currentCharacter
        LDA #GRID_BLUE
        STA colorForCurrentCharacter
        JSR DrawGridOverDissolvedExplosion
        LDA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
b959F   DEC soundModeAndVol
        BNE b956A

        JSR PlayChord
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
        ; Falls through
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

shipExplosionAnimation .BYTE EXPLOSION1,EXPLOSION2,EXPLOSTION3,$40
colorsForEffects       .BYTE BLACK,BLUE,RED,PURPLE,GREEN,CYAN,YELLOW,WHITE
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
b9656   STA scrollingTextStorage,X
        DEX 
        BNE b9656

        STA voice2FreqHiVal
        STA voice2FreqHiVal2
        STA voice3FreqHiVal
        STA voice1FreqHiVal
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
        LDA #CYAN
        STA colorForCurrentCharacter
        LDX #$00
b967D   LDA txtGotYou,X
        STX gridStartHiPtr
        STA currentCharacter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        INC currentXPosition
        INX 
        CPX #$08
        BNE b967D
        JSR PlayChord
        LDA #$0F
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayNote2
        LDX #$0A
b96A0   LDA #$20
        STA voice3FreqHiVal
b96A5   LDY #$00
b96A7   DEY 
        BNE b96A7
        LDA voice3FreqHiVal
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC voice3FreqHiVal
        LDA voice3FreqHiVal
        CMP #$40
        BNE b96A5
        DEX 
        BNE b96A0
        LDX #$07
b96BF   LDA #$80
        STA voice3FreqHiVal
b96C4   LDY #$00
b96C6   DEY 
        BNE b96C6
        LDA voice3FreqHiVal
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JSR PlayNote2
        DEC voice3FreqHiVal
        BNE b96C4
        LDA soundModeAndVol
        SEC 
        SBC #$02
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b96BF
        JMP EnterMainGameLoop

txtGotYou   .TEXT "GOT YOUz"
;---------------------------------------------------------------------------------
; DrawZoneClearedInterstitial   
;---------------------------------------------------------------------------------
linesToDrawCounter = $07

DrawZoneClearedInterstitial   
        JSR ClearGameScreen

        LDA #$0F
        STA soundModeAndVol

        JSR PlayChord
        LDA #$00
        STA linesToDrawCounter

ZoneClearedEffectLoop
        LDA #>SCREEN_RAM + $000E
        STA currentYPosition

        ; Choose a new color and prepare to paint another round of 
        ; text at a new Y position.
b9704   LDA #<SCREEN_RAM + $000E
        STA currentXPosition
        LDA linesToDrawCounter
        AND #$07
        TAX 
        LDA colorsForEffects,X
        STA colorForCurrentCharacter

        ; Paint the text to the new Y position on screen.
        LDX #$00
b9714   LDA txtZoneCleared,X
        STA currentCharacter
        STX tempCounter
        JSR WriteCurrentCharacterToCurrentXYPos
        INC currentXPosition
        LDX tempCounter
        INX 
        CPX #$0C
        BNE b9714

        ; Shift the text down a line and paint in a different color.
        INC linesToDrawCounter
        INC currentYPosition
        LDA currentYPosition
        CMP #$0B
        BNE b9704

        ; Play the sound effects
        LDA #$08
        STA voice2FreqHiVal2
        JSR PlayNote1
b9739   DEY 
        BNE b9739
        LDA voice2FreqHiVal2
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        INC voice2FreqHiVal2
        LDA voice2FreqHiVal2
        CMP #$48
        BNE b9739

        LDA linesToDrawCounter
        AND #$C0
        CMP #$C0

        ; Start the from the beginning to create the rolling effect.
        BNE ZoneClearedEffectLoop

        LDX #$07
b9756   LDA #$60
        STA voice2FreqHiVal2
b975B   DEY 
        BNE b975B
        LDA voice2FreqHiVal2
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        DEC voice2FreqHiVal2
        LDA voice2FreqHiVal2
        CMP #$30
        BNE b975B
        LDA soundModeAndVol
        SEC 
        SBC #$02
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b9756
        LDA mysteryBonusEarned
        BNE MysteryBonusSequence
        JMP EnterMainGameLoop

txtZoneCleared   .TEXT "ZONE CLEARED"

;---------------------------------------------------------------------------------
; MysteryBonusSequence   
;---------------------------------------------------------------------------------
MysteryBonusSequence   
        LDA #$0F
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        JSR PlayChord

        LDX #$08
        LDA #$FF
b979F   STA charSetLocation - $0001,X
        DEX 
        BNE b979F

        ; Draw the mystery bonus box and text
        LDA #PURPLE
        STA colorForCurrentCharacter
        LDA #$0F
        STA currentYPosition
b97AD   LDA #$09
        STA currentXPosition
        LDA #GRID
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
        LDA #$10
        STA currentYPosition
        LDA #$0B
        STA currentXPosition

        ; Draw the Mystery Bonus text
        LDX #$00
        LDA #YELLOW
        STA colorForCurrentCharacter
b97D6   LDA txtMysteryBonus,X
        STA currentCharacter
        STX tempCounter
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX tempCounter
        INC currentXPosition
        INX 
        CPX #$12
        BNE b97D6

        ; Draw the Mystery Bonus value
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
        JSR PlayNote1
b980B   LDA gridStartHiPtr
        STA voice2FreqHiVal2
b9810   DEY 
        BNE b9810
        LDA voice2FreqHiVal2
        SBC #$80
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        INC voice2FreqHiVal2
        BNE b9810
        JSR WasteAFewCycles
        LDA gridStartHiPtr
        AND #$07
        TAX 
        LDA #$FF
        STA charSetLocation,X
        INC gridStartHiPtr
        LDA gridStartHiPtr
        AND #$07
        TAX 
        LDA #$00
        STA charSetLocation,X
        LDA gridStartHiPtr
        BNE b980B

        JMP EnterMainGameLoop

txtMysteryBonus   .TEXT " MYSTERY BONUS    "
;---------------------------------------------------------------------------------
; CalculateMysteryBonusAndClearZone   
;---------------------------------------------------------------------------------
CalculateMysteryBonusAndClearZone   
        ; Check the performance against benchmarks. If we hit the benchmark it
        ; allows us to start from a maximum bonus of 8. (Setting the top bits
        ; bonusBits below effectively overrides any bonuses earned or lost
        ; in the bonusBits field.)
        LDX #$04
b9854   LDA mysteryBonusPerformance,X
        CMP mysteryBonusBenchmarks,X
        BNE b9869
        DEX 
        BNE b9854

        ; This will only be zero if we're on the first level.
        LDA currentDeflexorIndex
        BEQ b9869

        ; Setting the top bits on the bonusBits. This has the effect
        ; of awarding the maximum possible bonus.
        LDA bonusBits
        ORA #$20
        STA bonusBits

b9869   LDA #$08
        STA mysteryBonusEarned

        ; Keep decrementing the maximum bonus of 8 until
        ; the carry bit is not set. This means that the more unset
        ; buts there are on the left of the byte the more the bonus
        ; gets decreased.
b986D   LDA bonusBits
        CLC  ; Clear carry
        ROL  ; Shift Left
        STA bonusBits
        BCS b9879
        DEC mysteryBonusEarned
        BNE b986D

b9879   JMP DrawZoneClearedInterstitial

mysteryBonusBenchmarks   =*-$01
        .BYTE $0F,$1F,$1F,$0F
;-------------------------------------------------------------------------
; DrawTitleScreen
;-------------------------------------------------------------------------
DrawTitleScreen
        JSR ClearGameScreen
        LDA #CYAN
        STA colorForCurrentCharacter
        LDA #$09
        STA currentXPosition
        LDX #$00
b988D   LDA #$05
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
        BNE b988D

        JMP DrawHiScore
        ;Falls through to TitleScreenLoop


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
ReenterTitleScrenLoop
        JSR WasteAFewCycles
        LDA txtScrollingAllMatrixPilots,X
        AND #$3F
        CMP #$20
        BNE b9998

        ;Handle space in scrolling text
        JMP HandleSpaceInScrollingText
        ;Returns

b9998   CMP #$2E
        BNE b999F
        ; Handle ellipsis in scrolling text
        JMP HandleEllipsisInScrollingText
        ;Returns

b999F   CMP #$00
        BNE b99A6
        ; Restart the scrolling text animation
        JMP TitleScreenLoop
        ;Returns

        ; Animate the scroll
b99A6   CLC 
        ASL 
        ASL 
        ASL 
        TAY 
        STX tempCounter2

        ; Copy the alphabet charset to a location where
        ; we can manipulate it for scrolling.
        LDX #$00
b99AF   LDA alphabetCharsetStorage,Y
        STA scrollingTextStorage,X
        INY 
        INX 
        CPX #$08
        BNE b99AF
        ; Fall through

;---------------------------------------------------------------------------------
; ScrollTextLoop   
;---------------------------------------------------------------------------------
ScrollTextLoop   
        LDX tempCounter2
        LDA #$08
        STA tempCounter

b99C1   LDY #$00
b99C3   LDA #$18
        STA gridStartHiPtr
        TYA 
        TAX 
        CLC 

        ; Scroll the text
j99CA   ROL scrollingTextStorage,X
        PHP 
        TXA 
        CLC 
        ADC #$08
        TAX 
        DEC gridStartHiPtr
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
        DEC tempCounter
        BNE b99C1
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
b99FD   STA charSetLocation + $03FF,X
        DEX 
        BNE b99FD
        JMP ScrollTextLoop

HandleEllipsisInScrollingText
        STX tempCounter2
        LDX #$08
b9A0A   LDA charSetLocation + $03B7,X
        STA charSetLocation + $03FF,X
        DEX 
        BNE b9A0A
        JMP ScrollTextLoop

        STX tempCounter2
        LDX #$08
b9A1A   LDA charSetLocation + $03C7,X
        STA charSetLocation + $03FF,X
        DEX 
        BNE b9A1A
        JMP ScrollTextLoop

;---------------------------------------------------------------------------------
; TitleScreenCheckJoystickKeyboardInput   
;---------------------------------------------------------------------------------
TitleScreenCheckJoystickKeyboardInput   
        STX tempCounter2
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
        LDX tempCounter2
        JMP ReenterTitleScrenLoop

b9A4B   LDA SCREEN_RAM + $0226
        SEC 
        SBC #$30
        STA currentLevel
        JMP ClearGameScreen
        ;Returns

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
        LDA #<$0A10
        STA currentXPosition
b9A67   LDA txtGameOver,X
        STA currentCharacter
        STX gridStartHiPtr
        JSR WriteCurrentCharacterToCurrentXYPos
        LDX gridStartHiPtr
        inC currentXPosition
        INX 
        CPX #$09
        BNE b9A67
        LDA #$0F
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume

        LDX #$0F
b9A84   LDA #$80
        STA voice2FreqHiVal
        STA voice2FreqHiVal2
        STA voice3FreqHiVal
        JSR PlayNote1
        JSR PlayNote2
b9A95   LDY #$00
b9A97   DEY 
        BNE b9A97
        LDA voice2FreqHiVal2
        SBC #$70
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        ADC #$80
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC voice2FreqHiVal
        INC voice2FreqHiVal2
        INC voice3FreqHiVal
        BNE b9A95
        LDA soundModeAndVol
        SEC 
        SBC #$01
        STA soundModeAndVol
        STA $D418    ;Select Filter Mode and Volume
        DEX 
        BNE b9A84

        LDX #$01
b9AC3   LDA SCREEN_RAM + $0009,X
        CMP previousHiScore,X
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
        JMP BeginGameEntrySequence

StoreHiScore 
        LDX #$07
b9AE2   LDA SCREEN_RAM + $0009,X
        STA previousHiScore,X
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
b9AFD   LDA txtHiScore,X
        STA currentCharacter
        LDA #PURPLE
        STA colorForCurrentCharacter
        TXA 
        CLC 
        ADC #$0C
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
        BNE b9AFD
        JMP TitleScreenLoop

;-------------------------------------------------------------------------
; ReduceScore
;-------------------------------------------------------------------------
ReduceScore
        LDA #$04
        STA explosionSoundControl
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

txtHiScore                  .TEXT "HISCORE"


; This is a list of offsets into alphabetCharsetStorage. When scrolling
; the text on the title screen the letters in alphabetCharsetStorage this
; txtScrollingAllMatrixPilots references are copied into scrollingTextStorage
; and shifted to achieve the scrolling effect. This is done in TitleScreenLoop
; and ScrollTextLoop.

; The offsets into alphabetCharsetStorage here create the following text:
; "All Matrix Pilots... Report to Joystick Port One
; For Combat Duty....."
txtScrollingAllMatrixPilots .BYTE $01,$0C,$0C,$20,$0D,$01,$14,$12
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
; PlayASoundEffect2
;-------------------------------------------------------------------------
PlayASoundEffect2
        STA voice3FreqHiVal
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

;---------------------------------------------------------------------------------
; CopyCharsetIntoPosition   
;---------------------------------------------------------------------------------
CopyCharsetIntoPosition   
        LDX #$00
b9BB5   LDA f9C00,X
        STA charSetLocation,X
        LDA f9D00,X
        STA charSetLocation + $0100,X
        LDA f9E00,X
        STA alphabetCharsetStorage,X
        LDA f9F00,X
        STA charSetLocation + $0300,X
        INX 
        BNE b9BB5
        JMP InitializeGame

				.FILL 45, $EA

.include "charset.asm"
