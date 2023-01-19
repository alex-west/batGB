; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    ; Standard cutscenes
    ; 0 - Cutscene before 1-1
    dw $9820, res_5_405C
    dw $9290, res_5_41A7
    dw $8290, res_5_41A7
    dw $8800, res_5_46CD
    ; 1 - Cutscene before 2-1
    dw $9820, res_5_4BD3
    dw $9290, res_5_4CA7
    dw $8290, res_5_4CA7
    dw $8800, res_5_51D1
    ; 2 - Cutscene before 4-1
    dw $9820, res_5_6241
    dw $9290, res_5_41A7
    dw $8290, res_5_41A7
    dw $8800, res_5_46CD
    ; 3 - Ending
    dw $9800, res_5_638B
    dw $9290, res_5_64C3
    dw $8290, res_5_64C3
    dw $8800, res_5_6A37
    ; 4 - Batmobile cutscene (before 3-1)
    dw $9800, res_5_53FF
    dw $9C20, res_5_5519
    dw $9290, res_5_55FF
    dw $8290, res_5_55FF
    dw $8800, res_5_5B8E
    ; 5 - Credits resources
    dw $9C00, res_5_6E03
    dw $8800, res_5_6ED2

res_5_405C: incbin "../packed/map_cutsceneA.bin"
res_5_41A7: incbin "../packed/bg_cutsceneMonitorA.bin"
res_5_46CD: incbin "../packed/bg_cutsceneMonitorB.bin"
res_5_4BD3: incbin "../packed/map_cutsceneB.bin"
res_5_4CA7: incbin "../packed/bg_cutsceneJokerA.bin"
res_5_51D1: incbin "../packed/bg_cutsceneJokerB.bin"
res_5_53FF: incbin "../packed/map_cutsceneC1.bin"
res_5_5519: incbin "../packed/map_cutsceneC2.bin"
res_5_55FF: incbin "../packed/bg_cutsceneBatmobileA.bin"
res_5_5B8E: incbin "../packed/bg_cutsceneBatmobileB.bin"
res_5_6241: incbin "../packed/map_cutsceneD.bin"
res_5_638B: incbin "../packed/map_ending.bin"
res_5_64C3: incbin "../packed/bg_cutsceneJokerDeadA.bin"
res_5_6A37: incbin "../packed/bg_cutsceneJokerDeadB.bin"
res_5_6E03: incbin "../packed/map_creditsBatman.bin"
res_5_6ED2: incbin "../packed/bg_creditsBatman.bin"

bank5_freespace:
; EoF