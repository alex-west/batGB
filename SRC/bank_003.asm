; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

    dw $9000, res_3_4050
    dw $8000, res_3_42E9
    dw $8000, res_3_469B
    dw $8C00, res_3_523B
    dw $9600, res_3_59D9
    dw $8800, res_3_5BD4
    dw $9600, res_3_5DEA
    dw $8800, res_3_5FFA
    dw $9600, res_3_6210
    dw $8800, res_3_640E
    dw $9600, res_3_65F3
    dw $8800, res_3_67EC
    dw $9600, res_3_69F1
    dw $8800, res_3_6C0A
    dw $9400, res_3_6E22
    dw $8800, res_3_71A4
    dw $9600, res_3_728C
    dw $8800, res_3_746B
    dw $9290, res_3_5679
    dw $8900, res_3_7824

res_3_4050: incbin "../packed/bg_font.bin"
res_3_42E9: incbin "../packed/spr_batman.bin"
res_3_469B: incbin "../packed/bg_title.bin"
res_3_523B: incbin "../packed/spr_unknownEnemies.bin"
res_3_5679: incbin "../packed/bg_hudCommon.bin"
res_3_59D9: incbin "../packed/bg_factoryA.bin"
res_3_5BD4: incbin "../packed/bg_factoryB.bin"
res_3_5DEA: incbin "../packed/bg_streetsA.bin"
res_3_5FFA: incbin "../packed/bg_streetsB.bin"
res_3_6210: incbin "../packed/bg_museumA.bin"
res_3_640E: incbin "../packed/bg_museumB.bin"
res_3_65F3: incbin "../packed/bg_cathedralA.bin"
res_3_67EC: incbin "../packed/bg_cathedralB.bin"
res_3_69F1: incbin "../packed/bg_batwingA.bin"
res_3_6C0A: incbin "../packed/bg_batwingB.bin"
res_3_6E22: incbin "../packed/bg_vsJackA.bin"
res_3_71A4: incbin "../packed/bg_vsJackB.bin"
res_3_728C: incbin "../packed/bg_vsJokerA.bin"
res_3_746B: incbin "../packed/bg_vsJokerB.bin"
res_3_7824: incbin "../packed/spr_jack.bin"

bank3_freespace:
; EoF