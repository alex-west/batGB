; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $005", ROMX[$4000], BANK[$5]

    ; Standard cutscenes
    ; 0 - Cutscene before 1-1
    dw $9820, res_map_cutsceneA
    dw $9290, res_bg_cutsceneMonitorA
    dw $8290, res_bg_cutsceneMonitorA
    dw $8800, res_bg_cutsceneMonitorB
    ; 1 - Cutscene before 2-1
    dw $9820, res_map_cutsceneB
    dw $9290, res_bg_cutsceneJokerA
    dw $8290, res_bg_cutsceneJokerA
    dw $8800, res_bg_cutsceneJokerB
    ; 2 - Cutscene before 4-1
    dw $9820, res_map_cutsceneD
    dw $9290, res_bg_cutsceneMonitorA
    dw $8290, res_bg_cutsceneMonitorA
    dw $8800, res_bg_cutsceneMonitorB
    ; 3 - Ending
    dw $9800, res_map_ending
    dw $9290, res_bg_cutsceneJokerDeadA
    dw $8290, res_bg_cutsceneJokerDeadA
    dw $8800, res_bg_cutsceneJokerDeadB
    ; 4 - Batmobile cutscene (before 3-1)
    dw $9800, res_map_cutsceneC1
    dw $9C20, res_map_cutsceneC2
    dw $9290, res_bg_cutsceneBatmobileA
    dw $8290, res_bg_cutsceneBatmobileA
    dw $8800, res_bg_cutsceneBatmobileB
    ; 5 - Credits resources
    dw $9C00, res_map_creditsBatman
    dw $8800, res_bg_creditsBatman

res_map_cutsceneA:         incbin "../packed/map_cutsceneA.bin"
res_bg_cutsceneMonitorA:   incbin "../packed/bg_cutsceneMonitorA.bin"
res_bg_cutsceneMonitorB:   incbin "../packed/bg_cutsceneMonitorB.bin"
res_map_cutsceneB:         incbin "../packed/map_cutsceneB.bin"
res_bg_cutsceneJokerA:     incbin "../packed/bg_cutsceneJokerA.bin"
res_bg_cutsceneJokerB:     incbin "../packed/bg_cutsceneJokerB.bin"
res_map_cutsceneC1:        incbin "../packed/map_cutsceneC1.bin"
res_map_cutsceneC2:        incbin "../packed/map_cutsceneC2.bin"
res_bg_cutsceneBatmobileA: incbin "../packed/bg_cutsceneBatmobileA.bin"
res_bg_cutsceneBatmobileB: incbin "../packed/bg_cutsceneBatmobileB.bin"
res_map_cutsceneD:         incbin "../packed/map_cutsceneD.bin"
res_map_ending:            incbin "../packed/map_ending.bin"
res_bg_cutsceneJokerDeadA: incbin "../packed/bg_cutsceneJokerDeadA.bin"
res_bg_cutsceneJokerDeadB: incbin "../packed/bg_cutsceneJokerDeadB.bin"
res_map_creditsBatman:     incbin "../packed/map_creditsBatman.bin"
res_bg_creditsBatman:      incbin "../packed/bg_creditsBatman.bin"

bank5_freespace:
; EoF