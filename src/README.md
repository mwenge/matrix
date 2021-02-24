# Notes on the Code for Matrix

## A Cheat Key Sequence for Skipping Levels

The main game loop checks for keyboard input for the sole purpose of detecting
if the player has pressed a key and held down `Ctrl`, `Shift`, and `Tab` together. If they
have, it will immediately skip to the next level, award a 'mystery bonus' and add
an extra life.

Presumably this cheat was used to test new levels and left in as an Easter Egg. There's a 
smaller chance this was introduced by someone who cracked the game: the code is written
in Minter's [style for keyboard-checking routines](https://github.com/mwenge/iridisalpha/blob/master/src/PATTERNS.md#handling-keyboard-input).

```asm
;-------------------------------------------------------------------------
; CheckForCheatKeySequence
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

        ; A hidden cheat!
        ; Ctrl/Shift/Commodore Key (i.e. ctrl, tab, and shift) held down
        ; together along with another key will skip to next level, add a new
        ; life, and award a mystery bonus.
b852D   JMP CheatByIncrementingLifeAndSkipLevel
        ; Returns

```
## Configuring Levels

There are 20 levels and the behaviour of each is configured by a set of arrays. These
control:
- The number of droid squads in each level.
- The number of drones in each squad.
- The number of cameloids in each level.
- The number of cameloids on the screen at any one time.
- The speed of the cameloids.
- The interval between lasers.
- The speed of the snitch character.
- Whether the level has an index.

```asm
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
        STA a23
        STA a24

        LDA noOfCameloidsForLevel,X
        STA noOfCameloidsLeftInCurrentLevel

        LDA noOfCameloidsAtAnyOneTimeForlevel,X
        STA a33
        STA a32

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
```
## Using Line Pointers to Specify X and Y Positions on the Screen

This is a technique Minter uses a lot, and it's both simple and effective.
The idea is to define an array with each member pointing to the first column
of each line on the screen. The first member of the array points to the start
of the first line, the second to the start of the second line, and so on. Now,
equipped with an X and Y position on the screen that you want to write a 
character to, you pick the Yth member of the array, and write to the Xth 
position after the area in memory that the member refers to.

Below is an example from [`madeinfrance.asm`] that shows how the array is
initialized. As you may quickly observe the 'array' is in fact two arrays. This
is because our array is a list of pointers to positions in memory, and all
such pointers are two bytes long, e.g. `$0400`, $510 etc. So in order to store
a list of memory pointers we in fact create two equally sized arrays and store
the 'low byte' of the pointer in the first one and the 'high byte' in the
second one. In the case of address `$0400` this means storing '$00' in the
first slot of the 'low byte' array and '$40' in the first slot of the 'high
byte' array. This is what the routine below does. It uses the memory beginning
at `$0340` for storing the low bytes, and the memory beginning at `$0360` for
storing the high bytes. It increments each iteration in the loop by $28, which
is the 40-byte length of each line. It exits the loop once it has copied $1A
(i.e. 25) lines.


```asm
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

```

When the loop is done, `screenLinePtrLo` and `screenLinePtrHi` look something like this:

```asm
screenLinePtrLo: $00,$28,$80,...
screenLinePtrHi: $40,$40,$40,...
``` 

So armed with this pair of arrays, if I want to write to the 5th position on
the 2nd line I take the second entry in each of the screenLinePtrLo/Hi arrays.
These are `$28` and `$40`, which combine to give `$4028`. I now write to the 5th
position after `$4028`, which is `$402C`.

The mechanics of how this is done in practice requires
us to introduce another concept in the C64 and that is the way these two-byte
pointers are actually used. When you look at the code below you'll notice that we
retrieve the value for the line we're interested in from each array and store the 
low byte in a variable pointerLo and the high byte in pointerHi. But when we go to
actually 'perform the write' we only reference the pointerLo variable. 


```asm
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
```

The reason we do this is because of two things:
  * `pointerLo` and `pointerHi` are in adjacent positions in memory. This is
    important as will become clear. `pointerLo` is at position `$0003` and
    `pointerHi` is as position `$0004`.
  * The C64 is little endian. This means that when it looks at a position in
    memory, retrieves two bytes from that position (for example $00 at position
    `$0003` and $04 at position `$0004`), and is asked to treat that two bytes as
    an address it reads the result as `$0400`, instead of `$0004`. In other words
    it switches the bytes around from the order that they appear in: treating
    the first byte as the 'low byte' in the address, and the second byte as the
    'high byte'.
    
So when we pull out two entries from our `screenLinePtrLo` and
`screenLinePtrHi` arrays and store them in `pointerLo` and `pointerHi`
respectively, we are actually setting up the two bytes stored beginning at
`pointerLo` as the address in screen ram that we want to write to (e.g. `$0400`).
This is because we have stored $00 in `pointerLo` (which is at address `$0003`)
and $04 in `pointerHi` (which is at address `$0004`).

When we load a value to the Accumulator (A) (e.g. $20) and want to store it at
position `$0400`, this is what we would do:

```asm
        LDA screenLinePtrLo
        STA pointerLo
        LDA screenLinePtrHi
        STA pointerHi
        LDA $20
        STA (pointerLo)
```
In the `STA (pointerLo)` instruction the C64 resolves the address to store at by looking
at the content of `pointerLo` (`$0003`) which is $00, and then the content from the byte after 
it (`pointerHi` (`$0004`)) which is `$04`, combining them in a little-endian mode to `$0400` and 
then writing the value of A (`$20`) to address `$0400`, i.e. the first column of the first line
on the screen.

## Mystery Bonuses
Bonuses are calculated based on achieving a number of different objectives in each level. Some
actions will earn a bonus, others will lose any bonus accumulated. The player's success
in this regard is tracked by a bitfield in `bonusBits`. The further to the left in this field
that you have a bit set the closer your bonus will be to the maximum of 8.


When the level is cleared `CalculateMysteryBonusAndClearZone` figures out the bonus to add. It
iterates through the `bonusBits` field and keeps decrementing the `mysteryBonusEarned' until it
hits a bit that is set. So if you have the leftmost bit set on `bonusBits` you will earn the full
bonus value.

Actions that will earn a bonus in the `bonusBits` during play are:
 - Surviving a laser.
 - Hitting something with a deflected bullet (earns 8)
 - Destroying a droid squad (bonus of 2)
 - Clearing Cameloids after the droid squads (bonus of 7)

Actions that will lose bonuses during play are:
 - Moving to the extreme left of the grid.
 - Missing the opportunity to destroy the pod left by a laser.

The other mechanism that tracks the award of bonuses is the `mysteryBonusPerformance` array.
This is updated during play and if its final state matches a 'bonus earning' state as defined
by `mysteryBonusBenchmarks` then a full bonus of 8 is award (this awards any losses from the `bonusBits`.

```asm
;---------------------------------------------------------------------------------
; CalculateMysteryBonusAndClearZone   
;---------------------------------------------------------------------------------
CalculateMysteryBonusAndClearZone   
        ; Check the performance against benchmarks. If we hit the benchmark it
        ; allows us to start from a maximum bonus of 8.
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
```
## The 'Zone Cleared' Effect
<img src="https://user-images.githubusercontent.com/58846/109058031-6850b580-76da-11eb-9968-76b22234b2b9.gif" width=500>

This effect is implemented in the routine below. It runs a loop that draws the text, increments the y posiiton and picks
the color from an array on each iteration. It achieve the pulsing effect by nesting this within another loop.

```asm
colorsForEffects       .BYTE BLACK,BLUE,RED,PURPLE,GREEN,CYAN,YELLOW,WHITE
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
```

## The Scrolling Text in the Title Screen
<img src="(https://user-images.githubusercontent.com/58846/109058789-53c0ed00-76db-11eb-8331-93c6dfdbff46.gif" width=400>

This effect is achieved by bit-shifting the characters in a temporary storage
area: effectively mutating the value of each character in the character set to
be a mixture of itself and the ones adjacent. It does this by copying the
normal alphabetic character set to higher area in the RAM dedicated to the
chracter set and drawing the text using that as the dedicated area for the
scrolling text character set. This means the program can mutate these
characters without affecting any of the other characters displayed on the
screen.

This is why the text for the scrolling text message isn't defined using 'normal
PETSCII characters but references locations later on in the character set RAM:
```asm
txtInitialScrollingText .BYTE $96,$95,$94,$93,$92,$91,$90,$8F
                        .BYTE $8E,$8D,$8C,$8B,$8A,$89,$88,$87
                        .BYTE $86,$85,$84,$83,$82,$81
```

The routine below implements the scrolling text effect:

```asm
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
b99FD   STA charsetLocation + $03FF,X
        DEX 
        BNE b99FD
        JMP ScrollTextLoop

HandleEllipsisInScrollingText   STX tempCounter2
        LDX #$08
b9A0A   LDA charsetLocation + $03B7,X
        STA charsetLocation + $03FF,X
        DEX 
        BNE b9A0A
        JMP ScrollTextLoop

        STX tempCounter2
        LDX #$08
b9A1A   LDA charsetLocation + $03C7,X
        STA charsetLocation + $03FF,X
        DEX 
        BNE b9A1A
        JMP ScrollTextLoop
```
