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
