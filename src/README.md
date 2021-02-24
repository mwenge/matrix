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
