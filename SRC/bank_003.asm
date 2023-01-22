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

res_3_4050: incbin "../packed/font.bin"
res_3_42E9: incbin "../packed/player_batman.bin"
res_3_469B: incbin "../packed/title.bin"
res_3_523B: incbin "../packed/zzz_unknownEnemies.bin"
res_3_5679: incbin "../packed/hudCommon.bin"
res_3_59D9: incbin "../packed/factory_bg1.bin"
res_3_5BD4: incbin "../packed/factory_bg2.bin"
res_3_5DEA: incbin "../packed/streets_bg1.bin"
res_3_5FFA: incbin "../packed/streets_bg2.bin"
res_3_6210: incbin "../packed/museum_bg1.bin"
res_3_640E: incbin "../packed/museum_bg2.bin"
res_3_65F3: incbin "../packed/cathedral_bg1.bin"
res_3_67EC: incbin "../packed/cathedral_bg2.bin"
res_3_69F1: incbin "../packed/batwing_bg1.bin"
res_3_6C0A: incbin "../packed/batwing_bg2.bin"
res_3_6E22: incbin "../packed/vsJack_bg1.bin"
res_3_71A4: incbin "../packed/vsJack_bg2.bin"
res_3_728C: incbin "../packed/vsJoker_bg1.bin"
res_3_746B: incbin "../packed/vsJoker_bg2.bin"
res_3_7824: incbin "../packed/vsJack_boss.bin"

bank3_freespace:
; EoF