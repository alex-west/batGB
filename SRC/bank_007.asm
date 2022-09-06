; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $007", ROMX[$4000], BANK[$7]

; Metatile definitions, compressed (?) level data
    dw metatiles_gotham,    level_gotham1    ; $00: (duplicate (not sure whether 0 or 1 is canonical))
    dw metatiles_gotham,    level_gotham1    ; $01: (1-1)
    dw metatiles_factory,   level_factory1   ; $02: (1-2)
    dw metatiles_factory,   level_factory2   ; $03: (1-3)
    dw metatiles_vs_jack,   level_vs_jack    ; $04: (1-4)
    dw metatiles_gotham,    level_gotham2    ; $05: (2-1)
    dw metatiles_museum,    level_museum1    ; $06: (2-2)
    dw metatiles_museum,    level_museum2    ; $07: (2-3)
    dw metatiles_batwing,   level_batwing    ; $08: (3-1)
    dw metatiles_batwing,   level_batwing    ; $09: (3-2)
    dw metatiles_cathedral, level_cathedral1 ; $0A: (4-1)
    dw metatiles_cathedral, level_cathedral2 ; $0B: (4-2)
    dw metatiles_vs_joker,  level_vs_joker   ; $0C: (4-3)
                                             ; $0D: (END)

metatiles_gotham: incbin "src/levels/metatiles_gotham_city.bin"
level_gotham1: incbin "packed/level_01_0x01C334.bin"
level_gotham2: incbin "packed/level_05_0x01C6B5.bin"

metatiles_factory: incbin "src/levels/metatiles_factory.bin"
level_factory1: incbin "packed/level_02_0x01CE30.bin"
level_factory2: incbin "packed/level_03_0x01D27E.bin"

metatiles_museum: incbin "src/levels/metatiles_museum.bin"
level_museum1: incbin "packed/level_06_0x01D9DC.bin"
level_museum2: incbin "packed/level_07_0x01DE3E.bin"

metatiles_batwing: incbin "src/levels/metatiles_batwing.bin"
level_batwing: incbin "packed/level_08_0x01E266.bin"

metatiles_cathedral: incbin "src/levels/metatiles_cathedral.bin"
level_cathedral1: incbin "packed/level_0A_0x01E87B.bin"
level_cathedral2: incbin "packed/level_0B_0x01ED3B.bin"

metatiles_vs_jack: incbin "src/levels/metatiles_vs_jack.bin"
level_vs_jack: incbin "packed/level_04_0x01F2F8.bin"

metatiles_vs_joker: incbin "src/levels/metatiles_vs_joker.bin"
level_vs_joker: incbin "packed/level_0C_0x01F4F8.bin"

bank7_freespace:

