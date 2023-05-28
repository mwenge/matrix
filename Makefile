.PHONY: all clean run

PRG_IMAGE = "bin/matrix.prg"
XVIC_IMAGE = "bin/matrix-vic20.prg"
X64 = x64
XVIC = xvic
X64SC = x64sc
C1541 = c1541

all: clean run
vic: clean vic runvic

matrix.prg: src/c64/matrix.asm
	64tass -Wall -Wno-implied-reg --cbm-prg -o bin/matrix.prg -L bin/list-co1.txt -l bin/labels.txt src/c64/matrix.asm
	md5sum bin/matrix.prg bin/matrix-bench.prg

matrix-vic20.prg: src/vic20/matrix.asm
	64tass -Wall -Wno-implied-reg --cbm-prg -o bin/matrix-vic20.prg -L bin/list-co1.txt -l bin/labels.txt src/vic20/matrix.asm
	md5sum bin/matrix-vic20.prg orig/matrix-vic20.prg

runvic: matrix-vic20.prg
	$(XVIC) -drive8ram2000 -memory 8k -verbose $(XVIC_IMAGE)

run: matrix.prg
	$(X64) -verbose $(PRG_IMAGE)

clean:
	-rm $(PRG_IMAGE)
	-rm $(XVIC_IMAGE)
	-rm bin/matrix.prg
	-rm bin/matrix-vic20.prg
	-rm bin/*.txt
