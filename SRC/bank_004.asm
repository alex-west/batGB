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
res_4_406D: incbin "../packed/vsJoker_boss.bin"
res_4_437C: incbin "../packed/player_batwing.bin"
res_4_4705: incbin "../packed/batwing_boss1.bin"
res_4_497B: incbin "../packed/batwing_enemies1.bin"
res_4_4E8B: incbin "../packed/batwing_boss2.bin"
res_4_5100: incbin "../packed/batwing_enemies2.bin"
res_4_5561: incbin "../packed/streets_enemies.bin"
res_4_58C4: incbin "../packed/factory_enemies.bin"
res_4_5C7B: incbin "../packed/museum_enemies.bin"
res_4_6120: incbin "../packed/cathedral_enemies.bin"

bank4_freespace:
; EoF