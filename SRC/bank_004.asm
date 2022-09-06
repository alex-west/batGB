; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

    dw $8700, res_4_402C
    dw $8C00, res_4_406D
    dw $8000, res_4_437C
    dw $8500, res_4_4705
    dw $8A00, res_4_497B
    dw $8500, res_4_4E8B
    dw $8B00, res_4_5100
    dw $8C00, res_4_5561
    dw $8B80, res_4_58C4
    dw $8A00, res_4_5C7B
    dw $8A00, res_4_6120

res_4_402C: incbin "../packed/res_0x01002C.bin"
res_4_406D: incbin "../packed/res_0x01006D.bin"
res_4_437C: incbin "../packed/res_0x01037C.bin"
res_4_4705: incbin "../packed/res_0x010705.bin"
res_4_497B: incbin "../packed/res_0x01097B.bin"
res_4_4E8B: incbin "../packed/res_0x010E8B.bin"
res_4_5100: incbin "../packed/res_0x011100.bin"
res_4_5561: incbin "../packed/res_0x011561.bin"
res_4_58C4: incbin "../packed/res_0x0118C4.bin"
res_4_5C7B: incbin "../packed/res_0x011C7B.bin"
res_4_6120: incbin "../packed/res_0x012120.bin"

bank4_freespace:
; EoF