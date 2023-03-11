; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]

    dw $8700, res_blank
    dw $8C00, res_vsJoker_boss
    dw $8000, res_player_batwing
    dw $8500, res_batwing_boss1
    dw $8A00, res_batwing_enemies1
    dw $8500, res_batwing_boss2
    dw $8B00, res_batwing_enemies2
    dw $8C00, res_streets_enemies
    dw $8B80, res_factory_enemies
    dw $8A00, res_museum_enemies
    dw $8A00, res_cathedral_enemies

res_blank:             incbin "../packed/blank.bin"
res_vsJoker_boss:      incbin "../packed/vsJoker_boss.bin"
res_player_batwing:    incbin "../packed/player_batwing.bin"
res_batwing_boss1:     incbin "../packed/batwing_boss1.bin"
res_batwing_enemies1:  incbin "../packed/batwing_enemies1.bin"
res_batwing_boss2:     incbin "../packed/batwing_boss2.bin"
res_batwing_enemies2:  incbin "../packed/batwing_enemies2.bin"
res_streets_enemies:   incbin "../packed/streets_enemies.bin"
res_factory_enemies:   incbin "../packed/factory_enemies.bin"
res_museum_enemies:    incbin "../packed/museum_enemies.bin"
res_cathedral_enemies: incbin "../packed/cathedral_enemies.bin"

bank4_freespace:
; EoF