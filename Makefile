.PHONY: all clean run

D64_IMAGE = "bin/matrix.d64"
XVIC_IMAGE = "bin/matrix-vic20.prg"
X64 = x64
XVIC = xvic
X64SC = x64sc
C1541 = c1541

all: clean d64 run
vic: clean vic runvic

matrix.prg: src/c64/matrix.asm
	64tass -Wall -Wno-implied-reg --cbm-prg -o bin/matrix.prg -L bin/list-co1.txt -l bin/labels.txt src/c64/matrix.asm
	md5sum bin/matrix.prg bin/matrix-bench.prg

matrix-vic20.prg: src/vic20/matrix.asm
	64tass -Wall -Wno-implied-reg --cbm-prg -o bin/matrix-vic20.prg -L bin/list-co1.txt -l bin/labels.txt src/vic20/matrix.asm
	md5sum bin/matrix-vic20.prg orig/matrix-vic20.prg

d64: matrix.prg
	$(C1541) -format "matrix,rq" d64 $(D64_IMAGE)
	$(C1541) $(D64_IMAGE) -write bin/matrix.prg "matrix"
	$(C1541) $(D64_IMAGE) -list

runvic: matrix-vic20.prg
	$(XVIC) -verbose $(XVIC_IMAGE)

run: d64
	$(X64) -verbose $(D64_IMAGE)

clean:
	-rm $(D64_IMAGE)
	-rm $(XVIC_IMAGE)
	-rm bin/matrix.prg
	-rm bin/matrix-vic20.prg
	-rm bin/*.txt
