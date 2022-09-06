all: out/bat.gb

packed/*.bin: ./src/gfx/*.* ./src/levels/level*.bin packed
	scripts/chr_compress.py --out ./packed/ ./src/gfx/*.*
    scripts/level_compress.py --out ./packed/ ./src/levels/level*.bin

packed:
	mkdir $@

out/game.o: SRC/game.asm SRC/bank_*.asm packed/*.bin out
	rgbasm --preserve-ld -o $@ -i SRC/ SRC/game.asm

out/bat.gb: out/game.o out
	rgblink -n out/bat.sym -m out/bat.map -o $@ -p 255 $<
	#rgbfix -v -p 255 $@ 

	md5sum $@

out:
	mkdir $@

clean:
#	rm -f game.o game.gb game.sym game.map
#	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +
