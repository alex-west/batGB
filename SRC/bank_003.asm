; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

    dw $9000, res_font
    dw $8000, res_batman
    dw $8000, res_title
    dw $8C00, res_UNUSED
    dw $9600, res_factory_bg1
    dw $8800, res_factory_bg2
    dw $9600, res_streets_bg1
    dw $8800, res_streets_bg2
    dw $9600, res_museum_bg1
    dw $8800, res_museum_bg2
    dw $9600, res_cathedral_bg1
    dw $8800, res_cathedral_bg2
    dw $9600, res_batwing_bg1
    dw $8800, res_batwing_bg2
    dw $9400, res_vsJack_bg1
    dw $8800, res_vsJack_bg2
    dw $9600, res_vsJoker_bg1
    dw $8800, res_vsJoker_bg2
    dw $9290, res_hudCommon
    dw $8900, res_vsJack_boss

res_font:          incbin "../packed/font.bin"
res_batman:        incbin "../packed/player_batman.bin"
res_title:         incbin "../packed/title.bin"
res_UNUSED:        incbin "../packed/zzz_unknownEnemies.bin"
res_hudCommon:     incbin "../packed/hudCommon.bin"
res_factory_bg1:   incbin "../packed/factory_bg1.bin"
res_factory_bg2:   incbin "../packed/factory_bg2.bin"
res_streets_bg1:   incbin "../packed/streets_bg1.bin"
res_streets_bg2:   incbin "../packed/streets_bg2.bin"
res_museum_bg1:    incbin "../packed/museum_bg1.bin"
res_museum_bg2:    incbin "../packed/museum_bg2.bin"
res_cathedral_bg1: incbin "../packed/cathedral_bg1.bin"
res_cathedral_bg2: incbin "../packed/cathedral_bg2.bin"
res_batwing_bg1:   incbin "../packed/batwing_bg1.bin"
res_batwing_bg2:   incbin "../packed/batwing_bg2.bin"
res_vsJack_bg1:    incbin "../packed/vsJack_bg1.bin"
res_vsJack_bg2:    incbin "../packed/vsJack_bg2.bin"
res_vsJoker_bg1:   incbin "../packed/vsJoker_bg1.bin"
res_vsJoker_bg2:   incbin "../packed/vsJoker_bg2.bin"
res_vsJack_boss:   incbin "../packed/vsJack_boss.bin"

bank3_freespace:
; EoF