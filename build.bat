@echo off
if not exist out mkdir out

echo. Compressing assets
if not exist packed mkdir packed
::del .\packed\*.*
.\scripts\chr_compress.py --out .\packed\ .\src\gfx\*.*
if errorlevel 1 goto errorPACK
echo.  Success
echo.

echo. Compressing levels
if not exist packed mkdir packed
::del .\packed\*.*
.\scripts\level_compress.py --out .\packed\ .\src\levels\level*.bin
if errorlevel 1 goto errorPACK
echo.  Success
echo.

echo. Assembling .asm files
rgbasm --preserve-ld -o out/game.o -i SRC/ SRC/game.asm
if errorlevel 1 goto errorASM
echo.  Success
echo.

echo. Linking .o files
rgblink -n out/bat.sym -m out/bat.map -o out/bat.gb -p 255 out/game.o
if errorlevel 1 goto errorLINK
echo.  Success
echo. 

certutil -hashfile out/bat.gb MD5
echo.
fc /b bat.gb out\bat.gb
goto done

:errorPACK
echo.
echo. Compressor Error.
echo.
goto done
:errorASM
echo.
echo. Assembler Error.
echo.
goto done
:errorLINK
echo.
echo. Linker Error.
echo.

:done