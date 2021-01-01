# Matrix by Jeff Minter
<img src="https://user-images.githubusercontent.com/58846/102926230-8f95c700-448c-11eb-9895-d1f0827f2aff.png" height=300><img src="https://user-images.githubusercontent.com/58846/103443412-f8342f00-4c56-11eb-8658-065a48b5f8e3.gif" height=300>



This is the disassembled and [commented source code] for the 1983 Commodore 64 game Matrix by Jeff Minter. 

A version of the game you can play in your browser can be found at [https://matrix.xyz].

## Requirements

* [64tass][64tass], tested with v1.54, r1900
* [VICE][vice]

[64tass]: http://tass64.sourceforge.net/
[vice]: http://vice-emu.sourceforge.net/
[https://matrix.xyz]: https://mwenge.github.io/matrix.xyz
[commented source code]:https://github.com/mwenge/matrix/blob/master/src/matrix.asm

To compile and run it do:

```sh
$ make
```
The compiled game is written to the `bin` folder. 

To just compile the game and get a binary (`gridrunner.prg`) do:

```sh
$ make gridrunner
```

