## Matrix for the VIC 20 and Commodore 64

Matrix was originally written for the Vic 20 in 1983 and later ported to the C64 in 3 days. You can
read more about each implementation in the notes for each of the ports, but here we collect some observations
on the differences between the two versions.

### A small bug in the C64 port
![zapper](https://user-images.githubusercontent.com/58846/109517849-9ac72d80-7aa1-11eb-954d-3b93cf39dd84.gif)

Minter converted the Vic 20 to C64 in a hurry and left at least one small bug behind in the process. The
original Vic 20 version animates the tail of the 'zappers' as they move across the screen. This is achieved
by a neat trick which bitshifts one of the bytes that makes up the 8-byte character set definition for the
'zapper' glyph.

```asm
;-------------------------------------------------------------------------
; AnimateZapperTail
;-------------------------------------------------------------------------
AnimateZapperTail
        LDA charsetLocation + $0109
        ROL 
        ADC #$00
        STA charsetLocation + $0109
        RTS 
```

When porting to C64 he forgot to update the 'STA' statement to refer to the new location of the character
set:

```asm
; AnimateZapperTail
;-------------------------------------------------------------------------
AnimateZapperTail
        LDA charSetLocation + $0109
        ROL 
        ADC #$00
        ;FIXME: should this be charSetLocation + $0109 like in Vic20?
        STA f1509
        RTS 
```

Instead of storing the updated, bit-shifted byte to its original location of $2109, he instead stores it
to the equivalent location of the byte in the Vic 20 version ($1509). The result is that the animation
doesn't happen. It's very hard to notice this bug in practice as the characters are much smaller on a C64
screen and the effect is too subtle in C64 to notice its absence.

