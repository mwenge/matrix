# Matrix: Gridrunner 2 (1983) by Jeff Minter
<img src="https://user-images.githubusercontent.com/58846/102926230-8f95c700-448c-11eb-9895-d1f0827f2aff.png" height=300><img src="https://user-images.githubusercontent.com/58846/103443412-f8342f00-4c56-11eb-8658-065a48b5f8e3.gif" height=300>

[<img src="https://img.shields.io/badge/Download%20Matrix%202x%20Speed-Windows-blue.svg">](https://github.com/mwenge/matrix/releases/download/matrix-2x/matrix-2x.exe)
[<img src="https://img.shields.io/badge/Download%20Matrix%202x%20Speed-C64-green.svg">](https://github.com/mwenge/matrix/releases/download/matrix-2x/matrix-2x.prg)
[<img src="https://img.shields.io/badge/Play%Matrix-Online-purple.svg">](https://mwenge.github.io/matrix/)


This is the disassembled and [commented source code] for the 1983 Commodore 64 game Matrix by Jeff Minter. It is part of the [llamasource project](https://mwenge.github.io/llamaSource/).

A version of the game you can play in your browser can be found at [https://matrix.xyz].

Minter wrote in his design notes for the game:
```
Matrix: The last of the Grid games, transferred over to the '64 in
an intense 3-day hack session just before my holiday in Portugal.
The graphics look a bit thin and weedy if you've been used to the
nice fat Vic display, but the action is very fast. Despite its
Centipede roots, I still look on the Grid series as quite a nice
bit of blasting. The XY cannon makes them just sufficiently different
to be a decent blast. I never did get through all 20 levels without
resorting to cheating (the cheat mode is accessed by holding down
Commodore, Shift, CTRL and a letter key, and is left over from when
I was testing the levels), best I managed legitimately was to reach
Level 17.
```

## Cheats

The game contains a cheatcode for skipping levels. It's slightly complicated
and was added by Minter himself to assist testing. If you hold down `Ctrl`,
`Shift`, and `Tab` and press any other key the game will clear the level, give
you a bonus and an extra life. You can use this sequence to skip ahead as many
levels as you like!

## Requirements

* [64tass][64tass], tested with v1.54, r1900
* [VICE][vice]

[64tass]: http://tass64.sourceforge.net/
[vice]: http://vice-emu.sourceforge.net/
[https://matrix.xyz]: https://mwenge.github.io/matrix.xyz
[commented source code]:https://github.com/mwenge/matrix/blob/master/src/

To compile and run it do:

```sh
$ make
```
The compiled game is written to the `bin` folder. 

To just compile the game and get a binary (`matrix.prg`) do:

```sh
$ make matrix
```

