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

res_4_402C: incbin "../packed/blank.bin"
res_4_406D: incbin "../packed/spr_joker.bin"
res_4_437C: incbin "../packed/spr_batwing.bin"
res_4_4705: incbin "../packed/spr_batwingBossA.bin"
res_4_497B: incbin "../packed/spr_batwingEnemiesA.bin"
res_4_4E8B: incbin "../packed/spr_batwingBossB.bin"
res_4_5100: incbin "../packed/spr_batwingEnemiesB.bin"
res_4_5561: incbin "../packed/spr_streetsEnemies.bin"
res_4_58C4: incbin "../packed/spr_factoryEnemies.bin"
res_4_5C7B: incbin "../packed/spr_museumEnemies.bin"
res_4_6120: incbin "../packed/spr_cathedralEnemies.bin"

bank4_freespace:
; EoF