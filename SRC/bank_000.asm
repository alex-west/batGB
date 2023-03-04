; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $000", ROM0[$0000]
    db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

VBlankInterrupt::
    jp vBlankHandler
    db $FF, $FF, $FF, $FF, $FF

LCDCInterrupt::
    jp LCDCInterruptHandler
    db $FF, $FF, $FF, $FF, $FF

TimerOverflowInterrupt::
    call timerOverflowInterruptHandler
    reti
    db $FF, $FF, $FF, $FF

SerialTransferCompleteInterrupt::
    reti
    db $FF, $FF, $FF, $FF, $FF, $FF, $FF

JoypadTransitionInterrupt::
    reti

SECTION "ROM Bank $000 pt2", ROM0[$0100]

Boot::
    nop
    jp coldBoot

HeaderLogo:: NINTENDO_LOGO
HeaderTitle:: db "BATMAN", $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
HeaderNewLicenseeCode:: db $00, $00
HeaderSGBFlag:: db $00
HeaderCartridgeType:: db $01
HeaderROMSize:: db $02
HeaderRAMSize:: db $00
HeaderDestinationCode:: db $00
HeaderOldLicenseeCode:: db $bb
HeaderMaskROMVersion:: db $00
HeaderComplementCheck:: db $76
HeaderGlobalChecksum:: db $95, $3e

coldBoot: ; 00:0150
    di
    
    ; Clear HRAM
    ld b, $7f
    ld hl, $ff80
    xor a
    .clearHramLoop:
        ld [hl+], a
        dec b
    jr nz, .clearHramLoop

    ; Clear WRAM
    ld bc, $2000
    ld hl, $c000
    .clearWramLoop:
        xor a
        ld [hl+], a
        ; Check if BC == 0
        dec bc
        ld a, b
        or c
    jr nz, .clearWramLoop

    xor a
    ld [$c0e3], a
    ld [$c0e4], a
    ld [$c0e5], a
    ld [$c0b5], a

Jump_000_0175: ; 00:0175
    di
        call disableLCD
        xor a
        ldh [rIF], a
        ldh [rIE], a
    ei
    ld a, $0a
    ld [$c0dc], a
    ld sp, $cbff
    call load_OAMroutine

    ; Initialize loaded bank
    ld a, $01
    ldh [hCurrentBank], a
    ld [$2000], a

    call Call_000_304b

Jump_000_0194:
    xor a
    ldh [hInputRisingEdge], a
    dec a
    ldh [hInputPressed], a
    call stopSound
    ld a, $01
    call playSound
    xor a
    call draw_fillTilemap
    ld a, $02
    call loadProc_A
    call clearOAM
    xor a
    ld [$cb02], a
    ld [$cb01], a
    ld [$cb00], a
    ld a, $40
    ldh [$9a], a
    ld a, $00
    ld [$c0b6], a
    xor a
    ld [$c1a5], a
    ld a, $02
    ld [$c1a6], a
    ld a, $07
    ld [$c1a4], a
    ld a, $fe
    ld [$c1a3], a
    ; Set palettes
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ld a, $1b
    ldh [rOBP1], a
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [$bb], a
    ldh [$bc], a
    ld de, titleTilemap
    call loadStringList.call
    ld a, $88
    ldh [rWY], a
    ldh [$bd], a
    ld a, $07
    ldh [rWX], a
    ldh [$be], a
    ld a, $24
    ld [$c0bd], a
    ld a, $0f
    ld [$c0be], a
    xor a
    ldh [rIF], a
    ld a, $07
    ldh [rIE], a
    ldh [$fc], a
    ld a, $40
    ldh [rSTAT], a
    ld a, $f7
    ldh [rLCDC], a

jr_000_0214: ;{ Some loop
    ld hl, $cb00
    res 7, [hl]
    ld hl, $ffb5
    bit 3, [hl]
        jp nz, Jump_000_03bd

    ld a, [$c1a6]
    dec a
    ld [$c1a6], a
    jr nz, jr_000_025e
        ld a, $02
        ld [$c1a6], a
        ld hl, $c1a3
        ld a, [$c1a5]
        add [hl]
        ld [$c1a5], a
        inc hl
        ld a, [$c0b6]
        adc [hl]
        ld [$c0b6], a
        ld a, [hl]
        inc a
        ld b, a
        ld a, [$c1a3]
        sub b
        ld [$c1a3], a
        ld a, [$c1a4]
        sbc $00
        ld [$c1a4], a
        cp $02
        jr nc, jr_000_025e
            ld a, [$c0b6]
            cp $40
            jr z, jr_000_027e
    jr_000_025e:

    ld a, [$c0bd]
    sub $01
    ld [$c0bd], a
    ld a, [$c0be]
    sbc $00
    ld [$c0be], a
    ld hl, $cb00
    set 7, [hl]

    jr_000_0273:
        db $76 ; HALT
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0273

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0214 ;}

jr_000_027e:
    ld a, $0f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    ld a, $05
    ldh [rIE], a
    ldh [$fc], a
    xor a
    ldh [hInputRisingEdge], a
    dec a
    ldh [hInputPressed], a
    ld a, $5e
    ld [$c1a5], a
    ld a, $da
    ld [$c1a3], a
    ld a, $03
    ld [$c1a4], a
    ld hl, $03da
    ld a, [hl+]
    ld [$c1a7], a
    ld a, [hl+]
    ld [$c1a8], a
    ld a, [hl+]
    ld [$c1a6], a
    xor a
    ldh [$bb], a
    ldh [$bc], a
    ld a, $00
    ldh [$9a], a
    ld hl, $cb00
    set 7, [hl]

    jr_000_02bd:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_02bd

    xor a
    ldh [hVBlankDoneFlag], a

Jump_000_02c6:
    ld hl, $cb00
    res 7, [hl]
    ld hl, $ffb5
    bit 3, [hl]
    jp nz, Jump_000_0396

    ld a, [$c0bd]
    cp $40
    jr nz, jr_000_02e4
        ld a, [$c0be]
        cp $01
        jr nz, jr_000_02e4
            call Call_000_3089
    jr_000_02e4:

    ld a, [$c0bd]
    sub $01
    ld [$c0bd], a
    ld a, [$c0be]
    sbc $00
    ld [$c0be], a
    jr nc, jr_000_02fc

    call disableLCD
    jp Jump_000_0194


jr_000_02fc:
    ld a, [$c1a5]
    cp $ff
    jr z, jr_000_0368

    and a
    jr z, jr_000_030d

    dec a
    ld [$c1a5], a
    jp Jump_000_03ac


jr_000_030d:
    ld a, [$c1a8]
    and a
    jr z, jr_000_031e
        dec a
        ld [$c1a8], a
        xor a
        ldh [$bb], a
        ldh [$bc], a
        jr jr_000_0326
    jr_000_031e:
        ld a, $7c
        ldh [$bb], a
        ld a, $00
        ldh [$bc], a
    jr_000_0326:

    ld a, [$c1a7]
    dec a
    ld [$c1a7], a
    jp nz, Jump_000_03ac

    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ld a, [hl+]
    and a
    jr nz, jr_000_0349

    dec a
    ld [$c1a5], a
    xor a
    ld [$c1a3], a
    ld [$c1a4], a
    jr jr_000_03ac

jr_000_0349:
    ld [$c1a7], a
    ld a, [hl+]
    ld [$c1a8], a
    ld a, [$c1a6]
    dec a
    ld [$c1a6], a
    jr nz, jr_000_03ac

    ld a, [hl+]
    ld [$c1a6], a
    ld a, l
    ld [$c1a3], a
    ld a, h
    ld [$c1a4], a
    jp Jump_000_03ac


jr_000_0368:
    ldh a, [$bb]
    cp $a8
    jr z, jr_000_037c
        ld a, [$c1a4]
        add $40
        ld [$c1a4], a
        ldh a, [$bb]
        adc $00
        ldh [$bb], a
    jr_000_037c:

    cp $85
    jr c, jr_000_0394

    ldh a, [$bd]
    cp $40
    jr z, jr_000_0394

    ld a, [$c1a3]
    sub $80
    ld [$c1a3], a
    ldh a, [$bd]
    sbc $00
    ldh [$bd], a

jr_000_0394:
    jr jr_000_03ac

Jump_000_0396:
jr_000_0396:
    ldh a, [$bd]
    cp $40
    jr z, jr_000_03f3

    ld a, $ff
    ld [$c1a5], a
    xor a
    ldh [$bc], a
    ld a, $a8
    ldh [$bb], a
    ld a, $40
    ldh [$bd], a

Jump_000_03ac:
jr_000_03ac:
    ld hl, $cb00
    set 7, [hl]

    jr_000_03b1:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_03b1

    xor a
    ldh [hVBlankDoneFlag], a
    jp Jump_000_02c6


Jump_000_03bd:
    ld a, $24
    ld [$c0bd], a
    ld a, $0f
    ld [$c0be], a
    ld a, $0f
    ldh [rLYC], a
    xor a
    ldh [rIF], a
    ld a, $05
    ldh [rIE], a
    ldh [$fc], a
    ld a, $00
    ldh [$9a], a
    jr jr_000_0396

; Data?
    ld b, $05
    ld [bc], a
    dec b
    inc b
    inc bc
    inc b
    inc bc
    ld a, [bc]
    inc bc
    ld [bc], a
    ld [de], a
    ld [bc], a
    ld bc, $030f
    ld bc, $040a
    ld bc, $0202
    nop
    inc d
    nop

jr_000_03f3:
    ; Check input, jump to sound test
    ldh a, [hInputPressed]
    ld [$c0b4], a
    and $f7
    xor $50
        jp z, soundTest_proc

    ld a, $00
    ld [$c0bd], a
    ld a, $01
    ld [$c0be], a
    ld a, $2c
    call playSound
    ld hl, $cb00
    set 7, [hl]

    jr_000_0413:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0413

    xor a
    ldh [hVBlankDoneFlag], a

jr_000_041c: ;{ Some loop
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0bd]
    sub $01
    ld [$c0bd], a
    ld a, [$c0be]
    sbc $00
    ld [$c0be], a
    jr c, jr_000_0467

    ld a, [$c0bd]
    cp $a0
    jr nz, jr_000_0444
        ld a, [$c0be]
        cp $00
        jr nz, jr_000_0444
            call Call_000_3089
    jr_000_0444:

    ld a, [$c0bd]
    bit 4, a
    call nz, Call_000_2790
    ld a, [$c0bd]
    bit 4, a
    call z, Call_000_2795
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_045c:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_045c

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_041c ;}

jr_000_0467:
    ld hl, $cb00
    set 7, [hl]

    jr_000_046c:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_046c

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, $01
    ld [currentLevel], a
    call Call_000_118d
    
    ld a, [$c0b5]
    and a
        jp z, Jump_000_05a3
    ld a, [$c0b4]
    bit 2, a
        jp z, Jump_000_05a3

; Select Mode
    call disableLCD
    
    xor a
    ldh [hInputRisingEdge], a
    dec a
    ldh [hInputPressed], a
    
    call stopSound
    
    ld a, $25
    call draw_fillTilemap
    
    xor a
    call loadProc_A
    call clearOAM
    
    ; Set palettes
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ld a, $1b
    ldh [rOBP1], a
    
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [$bb], a
    ldh [$bc], a
    
    ld a, $01
    ldh [$9a], a
    ld [currentLevel], a
    
    call selectMode_prepText
    
    xor a
    ldh [rIF], a
    ld a, $05
    ldh [rIE], a
    ldh [$fc], a
    
    ld a, $00
    ldh [rSTAT], a
    ld a, $81
    ldh [rLCDC], a

jr_000_04d2: ;{
    ld hl, $cb00
    res 7, [hl]
    ld hl, hInputRisingEdge
    bit 3, [hl]
        jp nz, Jump_000_0595

    call selectMode_handleInput ;$5fed
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_04ea:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_04ea

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_04d2 ;}

; Sound test
soundTest_proc: ; 00:04F5
    call disableLCD
    
    xor a
    ldh [hInputRisingEdge], a
    dec a
    ldh [hInputPressed], a
    
    call Call_000_304b
    call stopSound
    
    ld a, $25
    call draw_fillTilemap
    
    ld a, $00
    call loadProc_A
    call clearOAM
    
    ld a, $00
    ldh [$9a], a
    
    xor a
    ld [$c1a3], a
    
    ; Set palettes
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ld a, $1b
    ldh [rOBP1], a
    
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [$bb], a
    ldh [$bc], a
    
    ld de, soundTestText
    call loadStringList.call
    
    xor a
    ld [$cb02], a
    ld [$cb01], a
    ld [$cb00], a
    
    xor a
    ldh [rIF], a
    ld a, $05
    ldh [rIE], a
    ldh [$fc], a
    
    ld a, $00
    ldh [rSTAT], a
    ld a, $81
    ldh [rLCDC], a

.loop: ;{ 00:054D - Sound test loop
    ld hl, $cb00
    res 7, [hl]
    
    ldh a, [hInputRisingEdge]
    bit PADB_SELECT, a
        jp nz, Jump_000_0175

    ; Let the player select the song (and update the number accordingly)
    call soundTest_handleInput
    
    ; Stop music
    ldh a, [hInputRisingEdge]
    bit PADB_START, a
        call nz, stopSound
    
    ; Play next song
    ldh a, [hInputRisingEdge]
    and PADF_B | PADF_A ; $03
    jr z, .endIf
        call stopSound
        ld a, [$c1a3]
        ld e, a
        ld a, $00
        ld hl, soundTest_songList
        add hl, de
        ld a, [hl]
        call playSound
    .endIf:

    ld hl, $cb00
    set 7, [hl]

    .waitLoop:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, .waitLoop

    xor a
    ldh [hVBlankDoneFlag], a
jr .loop ;}

soundTest_songList: ; 00:058A
    db $01, $09, $02, $0C, $0B, $0D, $0F, $06, $08, $05, $0E


Jump_000_0595:
    ld hl, $cb00
    set 7, [hl]

    jr_000_059a:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_059a

    xor a
    ldh [hVBlankDoneFlag], a

Jump_000_05a3:
    call disableLCD
    xor a
    ldh [hInputRisingEdge], a
    dec a
    ldh [hInputPressed], a
    ; Load cutscene ID for stage from table
    ld a, [currentLevel]
    and $0f
    ld e, a
    ld d, $00
    ld hl, stage_cutsceneList
    add hl, de
    ld a, [hl]
    cp $ff ; Skip to stage if $FF
        jp z, Jump_000_0673

    ld [$c0b1], a
    call stopSound
    ; Load cutscene music
    ld a, $09
    call playSound
    ld a, $e0
    ld [$c0bd], a
    ld a, $00
    ld [$c0be], a
    xor a
    ld [$c0b2], a
    ld [$c0b3], a
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call cutsceneLoad_farCall
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei

jr_000_05f1:
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0b2]
    and a
    jr z, jr_000_061c
        ld a, [$c0b3]
        and a
        jr nz, jr_000_060a
            call Call_000_3089
            ld a, $ff
            ld [$c0b3], a
        jr_000_060a:
        
        ld a, [$c0bd]
        sub $01
        ld [$c0bd], a
        ld a, [$c0be]
        sbc $00
        ld [$c0be], a
            jr c, jr_000_065c
    jr_000_061c:

    ldh a, [hInputRisingEdge]
    bit 3, a
        jr nz, jr_000_065c

    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call cutsceneHandle_farCall
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_0641:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0641

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_05f1

stage_cutsceneList: ; 00:064C
    db $00, $00, $ff, $ff, $ff, $01, $ff, $ff, $04, $ff, $02, $ff, $ff, $03, $ff, $ff


Jump_000_065c:
jr_000_065c:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0661:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0661

    xor a
    ldh [hVBlankDoneFlag], a
    call disableLCD
    xor a
    ldh [hInputRisingEdge], a
    dec a
    ldh [hInputPressed], a

Jump_000_0673: ; Start level
    call Call_000_10af
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [$bb], a
    ldh [$bc], a
    ld [$cb02], a
    ld [$cb01], a
    ld [$cb00], a
    ld a, $25
    call draw_fillTilemap
    ld a, [currentLevel]
    call Call_000_1405 ; Load level assets
    xor a
    ld [$c0c4], a
    ld [$c0c5], a
    ld a, [currentLevel]
    cp $08 ; Batwing 1
        jr z, jr_000_06b7
    cp $09 ; Batwing 2
        jr z, jr_000_06b7
    cp $04 ; vs Jack
        jr z, jr_000_06ad
    cp $0c ; vs Joker
        jr nz, jr_000_06c1

    jr_000_06ad: ; Boss
        ld a, $c0
        ld [$c0c5], a
        call Call_000_11ee
    jr jr_000_06c4
    
    jr_000_06b7: ; Batwing
        ld a, $ff
        ld [$c0c4], a
        call Call_000_121c
    jr jr_000_06c4
    
    jr_000_06c1: ; Standard
        call Call_000_11a8

jr_000_06c4:
    ld a, [currentLevel]
    cp $0b
    jr nz, jr_000_06d0
        ld a, $40
        ld [$c0c5], a
    jr_000_06d0:

    call loadLevel_drawHud
    call Call_000_149f ; Draw level
    call loadLevel_drawLevelName
    ld a, $40
    ldh [$9a], a
    ld a, $80
    ld [$c0b6], a
    ld a, $80
    ld [$c1a3], a
    call stopSound ; Clear music?
    call loadLevel_pickSong
    ; Set palettes
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ld a, $1b
    ldh [rOBP1], a
    xor a
    ldh [rIF], a
    ld a, $07
    ldh [rIE], a
    ldh [$fc], a
    ld a, $40
    ldh [rSTAT], a
    ld a, $87
    ldh [rLCDC], a

jr_000_0708: ;{ Some game loop
    ld hl, $cb00
    res 7, [hl]
    ldh a, [hInputRisingEdge]
    and $0b
        jp nz, Jump_000_0781

    ld hl, $c0b6
    ld a, [hl]
    inc a
    ld [hl], a
    cp $3f
        jr z, jr_000_072e

    ld hl, $cb00
    set 7, [hl]

    jr_000_0723:
        db $76 ; HALT?
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0723

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0708 ;}

jr_000_072e:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0733:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0733

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, $0f
    ldh [rLYC], a
    ld a, $80
    ldh [$9a], a
    ld a, $f0
    ld [$c1a3], a

jr_000_0749: ;{ Another game loop
    ld hl, $cb00
    res 7, [hl]
    ldh a, [hInputRisingEdge]
    and $0b
        jr nz, jr_000_0781
    ld a, [$c1a3]
    and a
        jr z, jr_000_0781

    dec a
    ld [$c1a3], a
    and $10
    push af
    call nz, Call_000_25c2
    pop af
    call z, Call_000_2595
    call Call_000_25f2
    call $4c73
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_0776:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0776

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0749 ;}

Jump_000_0781:
jr_000_0781:
    ld a, [currentLevel]
    cp $04
    jr nz, jr_000_0792
        ld a, $80
        ldh [rLYC], a
        ld a, $08
        ldh [$9a], a
        jr jr_000_079a
    jr_000_0792:
        ld a, $0f
        ldh [rLYC], a
        ld a, $80
        ldh [$9a], a
    jr_000_079a:

    call Call_000_2565
    call Call_000_25c2
    xor a
    ld [$c0be], a
    ld hl, $cb00
    set 7, [hl]

    jr_000_07a9:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_07a9

    xor a
    ldh [hVBlankDoneFlag], a

Jump_000_07b2: ;{ Main game loop ?
    ld hl, $cb00
    res 7, [hl]
    call Call_000_14eb
    ld a, [$c0be]
    and a
    jr nz, jr_000_0834
        ldh a, [hInputPressed]
        ldh [$8c], a
        ldh a, [hInputRisingEdge]
        ldh [$8d], a
        ld a, [$c0c4]
        and a
        jr nz, jr_000_07eb
            ldh a, [$91]
            cp $8c
            jr c, jr_000_07eb
                ldh a, [$98]
                cp $09
                jr nz, jr_000_07eb
                    ldh a, [$97]
                    cp $60
                    jr nz, jr_000_07eb
                        ld a, $10
                        ldh [$8c], a
                        xor a
                        ldh [$8d], a
                        ld a, $06
                        ldh [$a1], a
        jr_000_07eb:
    
        ld a, [currentLevel]
        cp $04
        jr nz, jr_000_07f8
            ld a, $80
            ldh [rLYC], a
            jr jr_000_07fc
        jr_000_07f8:
            ld a, $0f
            ldh [rLYC], a
        jr_000_07fc:
    
        ld a, [$c0c9]
        and a
            jp nz, Jump_000_08bf
    
        ld a, [$c0c4]
        and a
        jr nz, jr_000_081b
            ld a, [$c0c5]
            bit 7, a
            call z, Call_000_1277
            ld a, [$c0c5]
            bit 7, a
            call nz, Call_000_13c3
            jr jr_000_081e
        jr_000_081b:
            call Call_000_1312
        jr_000_081e:
    
        call Call_000_10af
        ldh a, [$91]
        cp $e0
            jp nc, Jump_000_08b5
        cp $a0
            jp nc, Jump_000_0845
        ld a, [$c341]
        and $02
            jr nz, jr_000_0845
    jr_000_0834:

    ld hl, $cb00
    set 7, [hl]

    jr_000_0839:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0839

    xor a
    ldh [hVBlankDoneFlag], a
jp Jump_000_07b2 ;}


Jump_000_0845:
jr_000_0845:
    ld hl, $cb00
    set 7, [hl]

    jr_000_084a:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_084a

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, $a2
    ld [$c0bd], a
    ld a, $00
    ld [$c0be], a
    call stopSound
    ; Play Stage Clear music
    ld a, $06
    call playSound

jr_000_0865: ;{
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0bd]
    sub $01
    ld [$c0bd], a
    ld a, [$c0be]
    sbc $00
    ld [$c0be], a
        jr c, jr_000_0896

    ld a, [$c0c4]
    and a
    call nz, $4758
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_088b:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_088b

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0865 ;}

jr_000_0896:
    ld a, [currentLevel]
    inc a
    and $0f
    ; Check level, jump to ending
    ld [currentLevel], a
    cp $0d
        jp z, Jump_000_0b3a

    xor a
    ld [$c0c6], a
    xor a
    ldh [$fa], a
    xor a
    ld [$c0a0], a
    call Call_000_10af
    jp Jump_000_0595 ; Start next level


Jump_000_08b5:
    ld a, $40
    ld [$c0c9], a
    ld a, $16
    call playSound

Jump_000_08bf:
    call Call_000_267e
    ld hl, $cb00
    set 7, [hl]

    jr_000_08c7:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_08c7

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, [$c0c4]
    and a
    jp nz, Jump_000_09c7

    call z, Call_000_3443

jr_000_08da:
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0c9]
    bit 7, a
    call nz, Call_000_3495
    ld a, [$c0c9]
    bit 6, a
    call nz, Call_000_3538
    ld a, [$c0c5]
    bit 7, a
    call z, Call_000_12fc
    ld a, [$c0c5]
    bit 7, a
    call nz, Call_000_13f8
    ld a, [currentLevel]
    cp $04
    jr nz, jr_000_0915

    ld a, [$c0ca]
    cp $ff
    jr z, jr_000_0947

    and a
    jr z, jr_000_0915

    call Call_000_240e
    jr jr_000_0934

jr_000_0915:
    ld a, [$c0c9]
    bit 7, a
    jr z, jr_000_0926

    ld a, [$c0ca]
    xor $c0
    and $c0
    jp z, Jump_000_09fc

jr_000_0926:
    ld a, [$c0c9]
    bit 6, a
    jr z, jr_000_0934

    ld a, [$c0ca]
    and a
    jp z, Jump_000_09fc

jr_000_0934:
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_093c:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_093c

    xor a
    ldh [hVBlankDoneFlag], a
    jr jr_000_08da

jr_000_0947:
    ld a, [$c0ca]
    cp $ff
    jr nz, jr_000_0934

    ldh a, [$9f]
    and a
    jp z, Jump_000_09fc

    jr jr_000_0934

Jump_000_0956:
jr_000_0956:
    call stopSound
    ld a, [playerLives]
    dec a
    ld [playerLives], a
    xor a
    ldh [$fa], a
    xor a
    ld [$c0a0], a
    call Call_000_10af
    ld a, [playerLives]
    cp $ff
        jp z, Jump_000_0a59
jp Jump_000_065c


jr_000_0975:
    ld hl, $cb00
    set 7, [hl]

    jr_000_097a:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_097a

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, $12
    ld [$c0f0], a
    ld a, $01
    ld [$c0f1], a
    call stopSound
    ; Play death music
    ld a, $08
    call playSound

jr_000_0995:
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0f0]
    sub $01
    ld [$c0f0], a
    ld b, a
    ld a, [$c0f1]
    sbc $00
    ld [$c0f1], a
    or b
    jr z, jr_000_0956

    call Call_000_1397
    call Call_000_135e
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_09bc:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_09bc

    xor a
    ldh [hVBlankDoneFlag], a
    jr jr_000_0995

Jump_000_09c7:
    ld hl, $cb00
    set 7, [hl]

    jr_000_09cc:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_09cc

    xor a
    ldh [hVBlankDoneFlag], a
    call Call_000_1391

jr_000_09d8:
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0ca]
    and a
    jr z, jr_000_0975

    call Call_000_1397
    call Call_000_135e
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_09f1:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_09f1

    xor a
    ldh [hVBlankDoneFlag], a
    jr jr_000_09d8

Jump_000_09fc:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0a01:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0a01

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, $12
    ld [$c0f0], a
    ld a, $01
    ld [$c0f1], a
    call stopSound
    ; Play death music
    ld a, $08
    call playSound

jr_000_0a1c:
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0f0]
    sub $01
    ld [$c0f0], a
    ld b, a
    ld a, [$c0f1]
    sbc $00
    ld [$c0f1], a
    or b
    jp z, Jump_000_0956

    ld a, [$c0c5]
    bit 7, a
    call z, Call_000_12fc
    ld a, [$c0c5]
    bit 7, a
    call nz, Call_000_13f8
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_0a4e:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0a4e

    xor a
    ldh [hVBlankDoneFlag], a
    jr jr_000_0a1c

Jump_000_0a59:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0a5e:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0a5e

    xor a
    ldh [hVBlankDoneFlag], a
    call disableLCD
    xor a
    ldh [hInputRisingEdge], a
    dec a
    ldh [hInputPressed], a
    call Call_000_172c
    ld a, $25
    call draw_fillTilemap
    call Call_000_162b
    xor a
    ldh [$9a], a
    ld [$c1a3], a
    ; Play Game Over music
    ld a, $05
    call playSound
    ; Set palettes
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ld a, $1b
    ldh [rOBP1], a
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [$bb], a
    ldh [$bc], a
    ldh [rIF], a
    ld a, $07
    ldh [rIE], a
    ldh [$fc], a
    ld a, $00
    ldh [rSTAT], a
    ld a, $87
    ldh [rLCDC], a

jr_000_0aa9:
    ld hl, $cb00
    res 7, [hl]
    ldh a, [hInputRisingEdge]
    bit 3, a
        jr nz, jr_000_0aca

    call Call_000_16f2
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_0abf:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0abf

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0aa9

jr_000_0aca:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0acf:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0acf

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, [$c1a3]
    and a
    jr nz, jr_000_0b14
        call stopSound
        xor a
        ldh [$fa], a
        xor a
        ld [$c0a0], a
        call Call_000_10af
        ld a, [currentLevel]
        ld e, a
        ld d, $00
        ld hl, table_000_0B1A
        add hl, de
        ld b, [hl]
        ld a, [$c1a2]
        cp b
        jr c, jr_000_0b00
            ld a, b
            ld [$c1a2], a
        jr_000_0b00:
        ld a, [currentLevel]
        ld e, a
        ld d, $00
        ld hl, table_000_0B2A ; $0b2a
        add hl, de
        ld a, [hl]
        ld [currentLevel], a
        call Call_000_1190
        jp Jump_000_065c
    jr_000_0b14:
        call disableLCD
        jp Jump_000_0194

; Continue weapon levels
table_000_0B1A: ; 00:0B1A
    db $01, $01, $01, $02, $02, $03, $03, $03, $06, $06, $05, $05, $05, $05, $05, $05
; Level to restart upon continue
table_000_0B2A: ; 00:0B2A
    db $01, $01, $01, $03, $03, $05, $05, $05, $08, $08, $0A, $0A, $0A, $0A, $0A, $0A

; Prep ending
Jump_000_0b3a:
    call Call_000_172c
    ld hl, $cb00
    set 7, [hl]

    jr_000_0b42:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0b42

    xor a
    ldh [hVBlankDoneFlag], a
    call disableLCD
    call stopSound
    ; Play ending music
    ld a, $0e
    call playSound
    ; Set ending cutscene
    ld a, $03
    ld [$c0b1], a
    xor a
    ld [$c0b2], a
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call cutsceneLoad_farCall
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei

jr_000_0b76: ;{ Ending cutscene loop
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0b2]
    and a
        jr nz, jr_000_0bab

    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call cutsceneHandle_farCall
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_0ba0:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0ba0

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0b76 ;}

jr_000_0bab:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0bb0:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0bb0

    xor a
    ldh [hVBlankDoneFlag], a
    call disableLCD
    ; Set cutscene to credits
    ld a, $05
    ld [$c0b1], a
    xor a
    ld [$c0b2], a
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call cutsceneLoad_farCall
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei

jr_000_0bdc: ;{ End credits loop
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0b2]
    and a
        jr nz, jr_000_0c11

    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call cutsceneHandle_farCall
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_0c06:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0c06

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0bdc ;}

jr_000_0c11:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0c16:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0c16

    xor a
    ldh [hVBlankDoneFlag], a
    ld a, $12
    ld [$c0f0], a
    ld a, $01
    ld [$c0f1], a
    call Call_000_30dc

jr_000_0c2c: ;{ Another ending loop?
    ld hl, $cb00
    res 7, [hl]
    ld a, [$c0f0]
    sub $01
    ld [$c0f0], a
    ld b, a
    ld a, [$c0f1]
    sbc $00
    ld [$c0f1], a
    or b
    jr z, jr_000_0c6f

    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call cutsceneHandle_farCall
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call Call_000_10af
    ld hl, $cb00
    set 7, [hl]

    jr_000_0c64:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0c64

    xor a
    ldh [hVBlankDoneFlag], a
jr jr_000_0c2c ;}

jr_000_0c6f:
    ld hl, $cb00
    set 7, [hl]

    jr_000_0c74:
        db $76
        ldh a, [hVBlankDoneFlag]
        and a
    jr z, jr_000_0c74

    xor a
    ldh [hVBlankDoneFlag], a
    call Call_000_10af
    ld a, [$c0b5]
    cp $ff
        jp z, Jump_000_0175

    ; Do something if select if held?
    ld a, $77
    ld [$c0b5], a
    ldh a, [hInputPressed]
    bit 2, a
        jp z, Jump_000_0175

    ld a, $ff
    ld [$c0b5], a
jp Jump_000_0175


vBlankHandler: ;{ 00:0C9C
    push af
    push bc
    push de
    push hl
    ld a, [$cb00]
    bit 7, a
    jp z, Jump_000_0de6

    call $fff0 ; OAM DMA routine
    ldh a, [$9a]
    bit 3, a
    jp z, Jump_000_0cb8
        ldh a, [rLCDC]
        or $02
        ldh [rLCDC], a
    Jump_000_0cb8:

    ldh a, [$9a]
    bit 6, a
        jp nz, Jump_000_0d44

    ldh a, [$9a]
    cp $03
        call z, Call_000_0f34
    ld hl, $cb00
    bit 7, [hl]
    jr z, jr_000_0cda
        ld de, $cb02
        call loadStringList.call
        xor a
        ld [$cb01], a
        ld [$cb02], a
    jr_000_0cda:

    ldh a, [$fa]
    xor $80
    ldh [$fa], a
    jr nz, jr_000_0ce5
        xor a
        jr jr_000_0ce7
    jr_000_0ce5:
        ld a, $a0
    jr_000_0ce7:

    ld [$c0a0], a
    ldh a, [$9a]
    and a
    jr z, jr_000_0cf6
        xor a
        ldh [rSCX], a
        ldh [rSCY], a
        jr jr_000_0cfc
    jr_000_0cf6:
        call Call_000_1818
        call Call_000_0f55
    jr_000_0cfc:

    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld b, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or b
    ld c, a
    ldh a, [hInputPressed]
    xor c
    and c
    ldh [hInputRisingEdge], a
    ld a, c
    ldh [hInputPressed], a
    ld a, $30
    ldh [rP1], a
    ldh a, [hInputPressed]
    and $07
    xor $07
    jr nz, jr_000_0d3b
        ldh a, [hInputRisingEdge]
        bit 3, a
        jp nz, Jump_000_0175
    jr_000_0d3b:

    ld a, $01
    ldh [hVBlankDoneFlag], a
    pop hl
    pop de
    pop bc
    pop af
reti


Jump_000_0d44:
    ld a, [$c0b6]
    and $7f
    cp $40
    jr c, jr_000_0d51
        cpl
        inc a
        add $80
    jr_000_0d51:

    ld e, a
    sla e
    add e
    ld d, $00
    ld e, a
    ld hl, $1ac3
    add hl, de
    ld a, [$c0b6]
    bit 7, a
    jr nz, jr_000_0d78
        ld a, [hl+]
        ld [$c0b8], a
        ld a, [hl+]
        ld [$c0bb], a
        ld a, [hl+]
        ld [$c0bc], a
        xor a
        ld [$c0b9], a
        ld [$c0ba], a
        jr jr_000_0d93
    jr_000_0d78:
        ld a, [hl+]
        ld [$c0b8], a
        ld a, [hl+]
        cpl
        add $01
        ld [$c0bb], a
        ld a, [hl+]
        cpl
        adc $00
        ld [$c0bc], a
        xor a
        ld [$c0b9], a
        ld a, $8f
        ld [$c0ba], a
    jr_000_0d93:

    xor a
    ldh [rLYC], a
    ei
    xor a
    ld [$cb01], a
    ld [$cb02], a
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld b, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or b
    ld c, a
    ldh a, [hInputPressed]
    xor c
    and c
    ldh [hInputRisingEdge], a
    ld a, c
    ldh [hInputPressed], a
    ld a, $30
    ldh [rP1], a
    ldh a, [hInputPressed]
    and $07
    xor $07
    jr nz, jr_000_0ddd
        ldh a, [hInputRisingEdge]
        bit 3, a
        jp nz, Jump_000_0175
    jr_000_0ddd:

    ld a, $01
    ldh [hVBlankDoneFlag], a
    pop hl
    pop de
    pop bc
    pop af
reti


Jump_000_0de6:
    ldh a, [$9a]
    and a
    jr z, jr_000_0df2
        xor a
        ldh [rSCX], a
        ldh [rSCY], a
        jr jr_000_0df9
    jr_000_0df2:
        ldh a, [$9a]
        cp $03
        call z, Call_000_0f34
    jr_000_0df9:

    ldh a, [hInputPressed]
    and $07
    xor $07
    jr nz, jr_000_0e08
        ldh a, [hInputRisingEdge]
        bit 3, a
        jp nz, Jump_000_0175
    jr_000_0e08:
    pop hl
    pop de
    pop bc
    pop af
reti ;}


LCDCInterruptHandler: ;{ 00:0E0D
    push af
    ldh a, [$9a]
    bit 3, a
        jr nz, jr_000_0e1e
    bit 7, a
        jr z, jr_000_0e26
    ldh a, [$97]
    ldh [rSCX], a
    pop af
    
    jr_000_0e1d:
reti


jr_000_0e1e:
    ldh a, [rLCDC]
    and $fd
    ldh [rLCDC], a
    pop af
reti


jr_000_0e26:
    bit 6, a
        jr z, jr_000_0e1d

    push hl
    ld a, [$c0b8]
    and a
    jr nz, jr_000_0e4f

    ld a, [$c0ba]
    cp $90
    jr nc, jr_000_0e53

    ld hl, $c0bb
    ld a, [$c0b9]
    add [hl]
    ld [$c0b9], a
    inc hl
    ld a, [$c0ba]
    adc [hl]
    ld [$c0ba], a
    ld hl, rLYC ; $FF45
    jr jr_000_0e58

jr_000_0e4f:
    dec a
    ld [$c0b8], a

jr_000_0e53:
    ld hl, rLYC ; $FF45
    ld a, $90

jr_000_0e58:
    sub [hl]
    ldh [rSCY], a
    ld hl, rLYC ; $FF45
    inc [hl]
    pop hl
    pop af
reti ;}


Call_000_0E62: ;{ 00:0E62 - Read input (unused? task done in vblank)
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    ld b, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    or b
    ld c, a
    ldh a, [hInputPressed]
    xor c
    and c
    ldh [hInputRisingEdge], a
    ld a, c
    ldh [hInputPressed], a
    ld a, $30
    ldh [rP1], a
ret ;}


load_OAMroutine: ;{ 00:0E93
    ld c, $f0
    ld b, $0a
    ld hl, OAM_DMAroutine

    .loop:
        ld a, [hl+]
        ld [c], a
        inc c
        dec b
    jr nz, .loop
ret ;}

; Copied to HRAM
OAM_DMAroutine: ;{ 00:0EA1
    ld a, $C0
    ldh [rDMA], a
    ld a, $28
    .loop:
        dec a
    jr nz, .loop
ret ;}

disableLCD: ;{ 00:0EAB
    ; Exit if LCD is already disabled
    ldh a, [rLCDC]
    bit 7, a
        ret z

    ldh a, [rIE]
    ldh [$fe], a
    and $fe
    ldh [rIE], a
    ; Wait for display to clear
    .loop:
        ldh a, [rLY]
        cp $91
    jr nz, .loop
    ; Disable LCD
    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a

    ldh a, [$fe]
    ldh [rIE], a
ret ;}

; Clear BC bytes of RAM starting at HL
Call_000_0EC9: ;{ 00:0EC9 - Unused?
    .loop:
        ld a, $00
        ld [hl+], a
        dec bc
        ld a, c
        or b
    jr nz, .loop
ret ;}

; Fills tilemap with contents of A
; Do not call during active display
draw_fillTilemap: ; 00:0ED2
    ld hl, $9fff
    ld bc, $0800
    jr_000_0ed8:
            ld [hl-], a
            dec c
        jr nz, jr_000_0ed8
        dec b
    jr nz, jr_000_0ed8
ret

; A simple memcopy
; Used only by SELECT MODE
; HL - Source
; BC - Length
; DE - Destination
draw_fixedLengthString: ; 00:0EE0
    .loop:
        ld a, [hl+]
        ld [de], a
        inc de
        dec bc
        ld a, b
        or c
    jr nz, .loop
ret

; Load string lists
;  Format:
;   - Dest Address (big endian)
;   - Length
;  Repeat until the first byte of a destination address is zero
loadStringList: ;{ Not the entry point
    .loop:
        inc de
        ld h, a
        ld a, [de]
        ld l, a
        inc de
        ld a, [de]
        inc de
        call Call_000_0ef9
      .call: ; 00:0EF3 - Entry point
        ld a, [de]
        cp $00
    jr nz, .loop
ret ;}


Call_000_0ef9: ;{ 00:0EF9
    push af
    and $3f
    ld b, a
    pop af
    rlca
    rlca
    and $03
        jr z, jr_000_0f0c
    dec a
        jr z, jr_000_0f13
    dec a
        jr z, jr_000_0f1a
    jr jr_000_0f27

    jr_000_0f0c:
        ld a, [de]
        ld [hl+], a
        inc de
        dec b
    jr nz, jr_000_0f0c
ret

jr_000_0f13:
    ld a, [de]
    inc de

    jr_000_0f15:
        ld [hl+], a
        dec b
    jr nz, jr_000_0f15
ret


    jr_000_0f1a:
        ld a, [de]
        ld [hl], a
        inc de
        ld a, b
        ld bc, $0020
        add hl, bc
        ld b, a
        dec b
    jr nz, jr_000_0f1a
ret


    jr_000_0f27:
        ld a, [de]
        ld [hl], a
        ld a, b
        ld bc, $0020
        add hl, bc
        ld b, a
        dec b
    jr nz, jr_000_0f27
    inc de
ret ;}

Call_000_0f34: ;{ 00:0F34
    ld a, [$c0c1]
    and $08
    ld b, a
    ldh a, [rLCDC]
    and $f7
    xor b
    ldh [rLCDC], a
    ld hl, $ffbb
    ldh a, [rSCY]
    cp [hl]
    jr z, jr_000_0f4c
        ld a, [hl]
        ldh [rSCY], a
    jr_000_0f4c:
    inc hl
    ldh a, [rSCX]
    cp [hl]
        ret z

    ld a, [hl]
    ldh [rSCX], a
ret ;}


Call_000_0f55: ;{ 00:0F55
    ld hl, $ffbd
    ldh a, [rWY]
    cp [hl]
    jr z, jr_000_0f60
        ld a, [hl]
        ldh [rWY], a
    jr_000_0f60:
    inc hl
    ldh a, [rWX]
    cp [hl]
        ret z
    ld a, [hl]
    ldh [rWX], a
ret ;}

clearOAM: ;{ 00:0F69
    ld b, $a0
    xor a
    ld hl, $c000

    .loop:
        ld [hl+], a
        dec b
    jr nz, .loop
ret ;}

; Load resource
; args
; - a (resource number)
loadProc_A: ;{ 00:0F74
    ld b, $03
    cp $14
    jr c, .endIf_A
        inc b
        sub $14
        cp $94
        jr c, .endIf_A
            inc b
            sub $94
    .endIf_A:
    
    ; HL = $4000 + A*4
    sla a
    sla a
    ld e, a
    ld d, $00
    ld hl, $4000
    add hl, de
    
    di
        ldh a, [hCurrentBank]
        push af
        ld a, b
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ; Load destination addr to BC
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ; Load source addr to DE
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ; HL = dest addr
    ld l, c
    ld h, b

    .loop_A:
        ; Exit if repeater byte == 0
        ld a, [de]
        and a
            jr z, .break
        ld c, a
        
        ; Loop through each bit of repeater byte
        ld b, $08    
        .loop_B:
            ; Repeat previous byte if next bit is 0
            sla c
            jr nc, .endIf_B
                inc de
            .endIf_B:
            ; Load byte, increment destination byte
            ld a, [de]
            ld [hl+], a
            dec b
        jr nz, .loop_B
        ; Increment to next repeater byte
        inc de
    jr .loop_A
    .break:

    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
ret ;}

; Load resource
; Same deal as the previous function
loadProc_B: ;{ 00:0FC1
    ld b, $05
    cp $50
    jr c, .endIf_A
        inc b
        sub $50
        cp $d0
        jr c, .endIf_A
            inc b
            sub $d0
    .endIf_A:
    
    sla a
    sla a
    ld e, a
    ld d, $00
    ld hl, $4000
    add hl, de
    di
        ldh a, [hCurrentBank]
        push af
        ld a, b
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld l, c
    ld h, b

    .loop_A:
        ld a, [de]
        and a
            jr z, .break
        ld c, a
        
        ld b, $08
        .loop_B:
            sla c
            jr nc, .endIf_B
                inc de
            .endIf_B:
            ld a, [de]
            ld [hl+], a
            dec b
        jr nz, .loop_B
    
        inc de
    jr .loop_A
    .break:
    
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
ret ;}


; Draw Metasprite?
;  A (saved to $83) = Attributes
;  BC = YX offset
;  E = Sprite number
drawMetasprite: ; 00:100E
    ; Save attributes to temp
    ldh [$83], a
    ; Load pointer to DE
    ld d, $00
    sla e
    rl d
    ld hl, metaspritePointerTable ; $512A
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ; Load information byte of metasprite
    ld a, [de]
    inc de
    ld h, a
    ; Save number of sprites in the metasprite
    and $0f
    ldh [$82], a
    ; Check if metasprite has an alternate flipped version
    bit 4, h
    jr z, .endIf_A
        ; Check if actor is horizontally flipped
        ldh a, [$83]
        bit OAMB_XFLIP, a
        jr z, .endIf_A
            ; Mask out X flip
            and ~OAMF_XFLIP ; %11011111
            ldh [$83], a
            ; DE += num_sprites*4
            ldh a, [$82]
            ld l, a
            sla l
            sla l
            ld a, e
            add l
            ld e, a
            ld a, d
            adc $00
            ld d, a
    .endIf_A:

    ; Flicker oscillator?
    ldh a, [$fa]
    bit 7, a
    jr nz, jr_000_1077

    ld a, [$c0a0]
    ld l, a
    ld h, $c0

    jr_000_104c:
        ld a, l
        cp $a0
            jr nc, jr_000_1071
        ; Load Y
        ld a, [de]
        inc de
        add b
        ld [hl+], a
        ; Load X
        ld a, [de]
        inc de
        add c
        ld [hl+], a
        ; Load tile index
        ld a, [de]
        inc de
        ld [hl+], a
        ; Load attributes
        push bc
            ldh a, [$83]
            ld b, a
            ld a, [de]
            inc de
            xor b
        pop bc
        ld [hl+], a
        
        ldh a, [$82]
        dec a
        ldh [$82], a
    jr nz, jr_000_104c

    ld a, l
    ld [$c0a0], a
ret

jr_000_1071:
    ld a, $a0
    ld [$c0a0], a
ret


jr_000_1077:
    ld a, [$c0a0]
    sub $04
    ld l, a
    ld h, $c0

    jr_000_107f:
        ld a, l
        cp $a0
            jr nc, jr_000_10aa
        ld a, [de]
        inc de
        add b
        ld [hl+], a
        ld a, [de]
        inc de
        add c
        ld [hl+], a
        ld a, [de]
        inc de
        ld [hl+], a
        push bc
        ldh a, [$83]
        ld b, a
        ld a, [de]
        inc de
        xor b
        pop bc
        ld [hl+], a
        ld a, l
        sub $08
        ld l, a
        ldh a, [$82]
        dec a
        ldh [$82], a
    jr nz, jr_000_107f

    ld a, l
    add $04
    ld [$c0a0], a
ret

jr_000_10aa:
    xor a
    ld [$c0a0], a
ret


Call_000_10af: ;{ 00:10AF - Clear unused OAM
    ldh a, [$fa]
    bit 7, a
    jr nz, .else
        ld h, $c0
        ld a, [$c0a0]
        ld l, a
    
        .loopA:
            ld a, l
            cp $a0
                ret nc
            xor a
            ld [hl+], a
            ld [hl+], a
            ld [hl+], a
            ld [hl+], a
        jr .loopA
    .else:
        ld a, [$c0a0]
        and a
            ret z
    
        ld b, a
        ld hl, $c000
        xor a
    
        .loopB:
            ld [hl+], a
            dec b
        jr nz, .loopB
        ret
;}


; Load level
loadLevel: ;{ 00:10D5
    add a
    add a
    ld e, a
    ld d, $00
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $07
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ld hl, $4000
    add hl, de
    ; Get pointer to metatile dictionary
    ld a, [hl+]
    ldh [$a3], a
    ld a, [hl+]
    ldh [$a4], a
    ; Get pointer to level data
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld de, $cc00
    ld b, $14

    .loop_loadScreen:
        push bc
        
        ld b, $08
        .loop_loadRow:
            push bc
            
            ld b, $08
            ; Load repeater byte
            ld a, [hl+]
            ld c, a
            .loop_loadBlock:
                ; Load metatile index
                ld a, [hl]
                ; If highest bit of repeater byte is set, increment pointer to next metatile
                rl c
                jr nc, .endIf
                    inc hl
                .endIf:
                push hl
                    push de
                        ; Get address of metatile
                        ld d, $00
                        add a
                        rl d
                        add a
                        rl d
                        ld e, a
                        ldh a, [$a3]
                        ld l, a
                        ldh a, [$a4]
                        ld h, a
                        add hl, de
                    ; Draw metatile
                    pop de
                    ; Top left
                    call Call_000_1154
                    ; Top right
                    set 4, e
                    call Call_000_1154
                    ; Bottom left
                    res 4, e
                    inc e
                    call Call_000_1154
                    ; Bottom right
                    set 4, e
                    call Call_000_1154
                    ld a, e
                    add $0f
                    ld e, a
                pop hl
                dec b
            jr nz, .loop_loadBlock
        
            ld a, $02
            add e
            ld e, a
            pop bc
            dec b
        jr nz, .loop_loadRow
    
        inc d
        ld e, $00
        pop bc
        dec b
    jr nz, .loop_loadScreen

    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ld a, [currentLevel]
    or $80
    ld [$c0c6], a
ret ;}

; Load one tile
Call_000_1154: ;{ 00:1154
    ld a, [$c0c6]
    and a
    jr nz, jr_000_115d

jr_000_115a:
    ld a, [hl+]
    ld [de], a
    ret


jr_000_115d:
    ld a, [de]
    cp $50
    jr z, jr_000_1166

    cp $80
    jr nz, jr_000_115a

jr_000_1166:
    push hl
    push de
    ld a, [hl]
    and $0f
    ld e, a
    ld d, $00
    ld hl, table_000_117D
    add hl, de
    ld a, [hl]
    and a
    pop de
    pop hl
    jr z, jr_000_115a

    ld a, $50
    ld [de], a
    inc hl
ret ;}

table_000_117D:
    db $00, $00, $00, $00
    db $00, $01, $00, $00
    db $00, $00, $01, $00
    db $01, $01, $00, $00

Call_000_118d:
    call Call_000_18b3

Call_000_1190:
    xor a
    ld [$c0c6], a
    call Call_000_1821
    call $4c1d
    ld a, $03
    ld [playerLives], a
    call $4c1d
    ld a, $04
    ld [$c0c8], a
    ret


Call_000_11a8: ; Standard level loading routine
    ld e, $00
    call Call_000_3160
    call Call_000_353d
    call Call_000_3b30
    call $4000
    call Call_000_281a
    call $4dd9
    call Call_000_18c9
    call Call_001_5B87
    ld a, $00
    ld [$c0c9], a
    ld a, [currentLevel]
    ld d, $00
    ld e, a
    dec de
    ld hl, $11e0
    add hl, de
    ld a, [hl]
    ld [$c0c3], a
    xor a
    ld [$c341], a
    ld a, $04
    ld [$c0c8], a
ret


    db $00, $80, $80

    nop

    db $00, $00, $00

    nop
    nop

    db $00, $00

    nop
    nop
    nop

; Boss stage loading routine
Call_000_11ee: ; 00:11EE
    ld e, $00
    call Call_000_3160
    call Call_000_353d
    ld a, $c0
    ldh [$8f], a
    ld a, $10
    ldh [$91], a
    call Call_000_3b30
    call $4000
    call loadBossEnemy
    call $4dd9
    call Call_000_18c9
    ld a, $00
    ld [$c0c9], a
    xor a
    ld [$c0c3], a
    ld a, $04
    ld [$c0c8], a
ret


; Batwing level loading routine
Call_000_121c: ; 00:121C
    ld e, $00
    call Call_000_3160
    call Call_000_353d
    call Call_000_3b30
    call $4000
    call $4c1d
    call Call_000_281a
    call Call_000_18c9
    call $4745
    call $6404
    call Call_001_61DF ;$61df
    call $7231
    call $78b6
    ld a, $22
    ld [$c0c0], a
jr_000_1247: ; Junk label
    ld a, $01
    ld [$c3d9], a
    xor a
    ld [$c3da], a
    ld [$c0c9], a
    ld [$c4c7], a
    xor a
    ld [$c341], a
    ld a, $04
    ld [$c0c8], a
ret

devMessage_A:; 00:1260 - Developer Message
; Shift-JIS Encoded
;  ｺﾚｶﾗﾓ SUNSOFT ｦ ﾖﾛｼｸﾈ!!  
;
; Translation per TCRF
;  Please continue to give your 
;  regards to Sunsoft!!
    db $BA, $DA, $B6, $D7, $D3, $20, $53, $55, $4E, $53, $4F, $46, $54, $20, $A6, $20
    db $D6, $DB, $BC, $B8, $C8, $21, $21


Call_000_1277:
    call Call_000_18ef
    call Call_000_3b3b
    ldh a, [$97]
    ld [$c0ef], a
    call $5b96
    ld a, [$c0c5]
    bit 6, a
    jr z, jr_000_12b8

    ldh a, [$98]
    cp $09
    jr z, jr_000_1296

    jr c, jr_000_129c

    jr jr_000_12b8

jr_000_1296:
    ldh a, [$97]
    cp $60
    jr nc, jr_000_12b8

jr_000_129c:
    ld a, [$c0c5]
    bit 7, a
    jr nz, jr_000_12b8

    ldh a, [$96]
    add $78
    ldh [$96], a
    ldh a, [$97]
    ld [$c0ef], a
    adc $00
    ldh [$97], a
    ldh a, [$98]
    adc $00
    ldh [$98], a

jr_000_12b8:
    ld a, [$c0c5]
    bit 6, a
    call z, Call_000_354d
    ld a, [$c0c5]
    bit 6, a
    call nz, Call_000_3848
    ld a, [$c0c5]
    bit 6, a
    call nz, Call_000_3750
    call Call_000_3192
    call Call_001_41EC
    call Call_000_29ce
    call $4e23
    call Call_000_2850
    ldh a, [$8d]
    bit 1, a
    call nz, Call_001_400F
    ldh a, [$8f]
    and a
    jr nz, jr_000_12f5

    ld a, $40
    ld [$c0c9], a
    ld a, $16
    call playSound

jr_000_12f5:
    call $4c73
    call Call_000_182c
    ret


Call_000_12fc:
    call Call_000_3b3b
    call $5b96
    call Call_001_41EC
    call Call_000_29ce
    call $4e23
    call Call_000_2850
    call Call_000_182c
    ret


Call_000_1312:
    call Call_000_3b3b
    ld a, [$c3d9]
    dec a
    ld [$c3d9], a
    jr nz, jr_000_132a

    ld a, $04
    ld [$c3d9], a
    ld a, [$c3da]
    cpl
    ld [$c3da], a

jr_000_132a:
    call $4758
    call $468e
    ld a, [$c4c7]
    and a
    jr nz, jr_000_135a

    call Call_001_48B6
    ld a, [$c4c6]
    and a
    call z, $642e
    call $62ea
    ld a, [$c4c6]
    and a
    call nz, $715a
    call $7900
    call Call_001_4805
    call $4c73
    ld a, [$c4c6]
    and a
    call z, $6573

jr_000_135a:
    call Call_000_182c
    ret


Call_000_135e:
    call Call_000_3b3b
    ld a, [$c3d9]
    dec a
    ld [$c3d9], a
    jr nz, jr_000_1376

    ld a, $04
    ld [$c3d9], a
    ld a, [$c3da]
    cpl
    ld [$c3da], a

jr_000_1376:
    call $4758
    ld a, [$c4c6]
    and a
    call z, $642e
    call $62ea
    ld a, [$c4c6]
    and a
    call nz, $715a
    call $7900
    call Call_000_182c
    ret


Call_000_1391:
    ld a, $7e
    ld [$c0ca], a
    ret


Call_000_1397:
    ld a, [$c0ca]
    and a
        ret z
    sub $02
    ld [$c0ca], a
    ld a, [$c0ca]
    swap a
    and $07
    ld e, a
    ld d, $00
    ld hl, $13bb
    add hl, de
    ld e, [hl]
    ldh a, [$8f]
    ld b, a
    ldh a, [$91]
    ld c, a
    xor a
    call drawMetasprite
ret


    db $55, $55, $55, $55, $57, $56, $54, $53

Call_000_13c3:
    call Call_000_18ef
    call Call_000_3b3b
    ldh a, [$97]
    ld [$c0ef], a
    call Call_000_3848
    call Call_000_3750
    call Call_000_3192
    call Call_000_1be8
    call Call_001_41EC
    call $4e23
    ldh a, [$8d]
    bit 1, a
    call nz, Call_001_400F
    ldh a, [$8f]
    and a
    jr nz, jr_000_13f1
        ld a, $40
        ld [$c0c9], a
    jr_000_13f1:
    call $4c73
    call Call_000_182c
ret


Call_000_13f8:
    call Call_000_3b3b
    call Call_000_1be8
    call $4e23
    call Call_000_182c
ret

; Load list of assets per level
Call_000_1405: ; 00:1405
    ld [$c0e9], a
    xor a
    call loadProc_A
    ld a, [$c0e9]
    sla a
    ld e, a
    ld d, $00
    ld hl, table_000_1431
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a

    .loop:
        ld a, [hl+]
        and a
            jr z, .break
        push hl
            call loadProc_A
        pop hl
    jr .loop
    .break:

    ld a, [$c0e9]
    call loadLevel ; Load level map
    xor a
    ld [$c0ea], a
ret

; Resource lists for levels
table_000_1431: ; 00:1431
    dw resList_NULL
    dw resList_gotham
    dw resList_factory
    dw resList_factory
    dw resList_vsJack
    dw resList_gotham
    dw resList_museum
    dw resList_museum
    dw resList_batwing1
    dw resList_batwing2
    dw resList_cathedral
    dw resList_cathedral
    dw resList_vsJoker
    ; Unused entries
    dw resList_gotham
    dw resList_gotham
    dw resList_gotham
    dw resList_gotham

resList_NULL: ; 00:1453
    db $00 ; Nothing
resList_gotham: ; 00:1454
    db $01, $1B, $06, $07, $12, $00 ; Gotham
resList_factory: ; 00:145A
    db $01, $1C, $04, $05, $12, $00 ; Factory
resList_vsJack: ; 00:1460
    db $01, $12, $0E, $0F, $13, $00 ; Vs Jack
resList_museum: ; 00:1466
    db $01, $1D, $08, $09, $12, $00 ; Museum
resList_batwing1: ; 00:146C
    db $0C, $0D, $12, $16, $17, $18, $00 ; Batwing 1 
resList_batwing2: ; 00:1473
    db $0C, $0D, $12, $16, $19, $1A, $00 ; Batwing 2
resList_cathedral: ; 00:147A
    db $01, $1E, $0A, $0B, $12, $00 ; Cathedral
resList_vsJoker: ; 00:1480
    db $01, $12, $10, $11, $14, $15, $00 ; Vs Joker

devMessage_B: ; 00:1487 - Developer Message
; Shift-JIS Encoded
;  ｷｮｳﾓｹﾞﾝｷﾀﾞ!! ｺﾝﾋﾞｶﾞｶｶﾙ?? 
;
; Translation per TCRF:
;  I'm feeling fine today!! 
;  Are you taking in combos??
    db $B7, $AE, $B3, $D3, $B9, $DE, $DD, $B7, $C0, $DE, $21, $21
    db $20, $BA, $DD, $CB, $DE, $B6, $DE, $B6, $B6, $D9, $3F, $3F

; Called when loading level
Call_000_149f: ;{
    ld a, [$c0ea]
    call Call_000_14c4
    ld a, [$c0ea]
    ld b, a
    ld a, $56
    ld [$c0ec], a
    ld a, $60
    ld [$c0ed], a
    sla b
    ld a, $cd
    add b
    ld [$c0ee], a
    xor a
    ldh [$97], a
    ld a, [$c0ea]
    ldh [$98], a
ret ;}

; Draw level starting at screen A
Call_000_14c4: ;{ 00:14C4
    sla a
    ld d, a
    ld e, $00
    ld hl, $cc00
    add hl, de
    ld e, l
    ld d, h
    ld hl, $9840
    ld b, $20

    jr_000_14d4:
        push bc
        push hl
        ld b, $10
    
        jr_000_14d8:
            ld a, [de]
            ld [hl], a
            inc de
            ld a, b
            ld bc, $0020
            add hl, bc
            ld b, a
            dec b
        jr nz, jr_000_14d8
    
        pop hl
        pop bc
        inc hl
        dec b
    jr nz, jr_000_14d4
ret ;}


Call_000_14eb:
    ld a, [$c0be]
    and a
    jr nz, jr_000_150d

    ldh a, [hInputRisingEdge]
    bit 3, a
    ret z

    call Call_000_153c
    xor a
    ld [$c0bf], a
    dec a
    ld [$c0be], a
    call Call_000_1595
    call Call_000_306e
    ld a, $1e
    call playSound
    ret


jr_000_150d:
    ldh a, [hInputRisingEdge]
    bit 3, a
    jr nz, jr_000_1531

    call Call_000_159a
    ld a, [$c0bf]
    inc a
    ld [$c0bf], a
    and $0f
    ret nz

    ld a, [$c0bf]
    and $10
    call z, Call_000_153c
    ld a, [$c0bf]
    and $10
    call nz, Call_000_1552
    ret


jr_000_1531:
    call Call_000_1560
    xor a
    ld [$c0be], a
    call Call_000_306e
    ret


Call_000_153c:
    call Call_000_1576
    ld a, $19
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ld a, $1e
    ld [hl+], a
    ld a, $1c
    ld [hl+], a
    ld a, $0e
    ld [hl+], a
    call Call_000_158a
    ret


Call_000_1552:
    call Call_000_1576
    ld a, $25
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    call Call_000_158a
    ret


Call_000_1560:
    call Call_000_1576
    ld a, $1c
    ld [hl+], a
    ld a, $1d
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ld a, $10
    ld [hl+], a
    ld a, $0e
    ld [hl+], a
    call Call_000_158a
    ret


Call_000_1576:
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $98
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $05
    ld [hl+], a
    ret


Call_000_158a:
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $08
    ld [$cb01], a
    ret


Call_000_1595:
    xor a
    ld [$c116], a
    ret


Call_000_159a:
    ld a, [currentLevel]
    and $fe
    cp $08
    ret nz

    ldh a, [hInputRisingEdge]
    and $f7
    ret z

    ld a, [$c116]
    cp $07
    jr z, jr_000_15c3

    ret nc

    and $0f
    ld e, a
    ld d, $00
    ld hl, $c106
    add hl, de
    ldh a, [hInputRisingEdge]
    ld [hl], a
    ld a, [$c116]
    inc a
    ld [$c116], a
    ret


jr_000_15c3:
    ld a, [$c116]
    and $0f
    ld e, a
    ld d, $00
    ld hl, $c106
    add hl, de
    ldh a, [hInputRisingEdge]
    ld [hl], a
    ld de, table_001_61DB ; $61db
    ld hl, $c106
    ld b, $04

jr_000_15da:
    ld a, [de]
    cp [hl]
    inc de
    inc hl
    jr nz, jr_000_1608

    dec b
    jr nz, jr_000_15da

    ld c, $00
    ld a, [hl+]
    rra
    rl c
    ld a, [hl+]
    rra
    rl c
    ld a, [hl+]
    rra
    rl c
    ld a, [hl+]
    rra
    rl c
    ld a, c
    and $0f
    jr nz, jr_000_15fc

    ld a, $0f

jr_000_15fc:
    ld [$c0dc], a
    cp $03
    jr nc, jr_000_1608

    ld a, $0a
    ld [$c0dc], a

jr_000_1608:
    ld a, $0f
    ld [$c116], a
    ret

devMessage_C: ; 00:160E - Developer Message
; Shift-JIS Encoded
;  ｺﾚｺﾚ!! ﾋﾄﾉPRGRAMｦﾉｿﾞｸﾃﾞﾜﾅｲ !!    
;
; Translation per TCRF
;  Come over here!! 
;  Don't peek the program!!
    db $BA, $DA, $BA, $DA, $21, $21, $20, $CB, $C4, $C9, $50, $52, $47, $52, $41, $4D
    db $A6, $C9, $BF, $DE, $B8, $C3, $DE, $DC, $C5, $B2, $20, $21, $21


Call_000_162b:
    ld de, gameOverText
    call loadStringList.call
    ld hl, $99ab
    ld a, [$c0e5]
    swap a
    and $0f
    jr nz, jr_000_166e

    ld a, $25
    ld [hl+], a
    ld a, [$c0e5]
    and $0f
    jr nz, jr_000_1674

    ld a, $25
    ld [hl+], a
    ld a, [$c0e4]
    swap a
    and $0f
    jr nz, jr_000_167c

    ld a, $25
    ld [hl+], a
    ld a, [$c0e4]
    and $0f
    jr nz, jr_000_1682

    ld a, $25
    ld [hl+], a
    ld a, [$c0e3]
    swap a
    and $0f
    jr nz, jr_000_168a

    ld a, $25
    ld [hl+], a
    jr jr_000_168b

jr_000_166e:
    ld [hl+], a
    ld a, [$c0e5]
    and $0f

jr_000_1674:
    ld [hl+], a
    ld a, [$c0e4]
    swap a
    and $0f

jr_000_167c:
    ld [hl+], a
    ld a, [$c0e4]
    and $0f

jr_000_1682:
    ld [hl+], a
    ld a, [$c0e3]
    swap a
    and $0f

jr_000_168a:
    ld [hl+], a

jr_000_168b:
    ld a, [$c0e3]
    and $0f
    ld [hl+], a
    ld hl, $99eb
    ld a, [$c0e0]
    swap a
    and $0f
    jr nz, jr_000_16ce

    ld a, $25
    ld [hl+], a
    ld a, [$c0e0]
    and $0f
    jr nz, jr_000_16d4

    ld a, $25
    ld [hl+], a
    ld a, [$c0df]
    swap a
    and $0f
    jr nz, jr_000_16dc

    ld a, $25
    ld [hl+], a
    ld a, [$c0df]
    and $0f
    jr nz, jr_000_16e2

    ld a, $25
    ld [hl+], a
    ld a, [$c0de]
    swap a
    and $0f
    jr nz, jr_000_16ea

    ld a, $25
    ld [hl+], a
    jr jr_000_16eb

jr_000_16ce:
    ld [hl+], a
    ld a, [$c0e0]
    and $0f

jr_000_16d4:
    ld [hl+], a
    ld a, [$c0df]
    swap a
    and $0f

jr_000_16dc:
    ld [hl+], a
    ld a, [$c0df]
    and $0f

jr_000_16e2:
    ld [hl+], a
    ld a, [$c0de]
    swap a
    and $0f

jr_000_16ea:
    ld [hl+], a

jr_000_16eb:
    ld a, [$c0de]
    and $0f
    ld [hl+], a
    ret


Call_000_16f2:
    ldh a, [hInputRisingEdge]
    bit 2, a
    jr z, jr_000_1700

    ld a, [$c1a3]
    xor $10
    ld [$c1a3], a

jr_000_1700:
    ldh a, [hInputRisingEdge]
    bit 7, a
    jr z, jr_000_170b

    ld a, $10
    ld [$c1a3], a

jr_000_170b:
    ldh a, [hInputRisingEdge]
    bit 6, a
    jr z, jr_000_1715

    xor a
    ld [$c1a3], a

jr_000_1715:
    ld e, $00
    ld a, [$c0c4]
    and a
    jr z, jr_000_171f

    ld e, $50

jr_000_171f:
    ld a, [$c1a3]
    add $a4
    ld b, a
    ld c, $20
    xor a
    call drawMetasprite
    ret


Call_000_172c:
    ld hl, $c0e5
    ld a, [$c0e0]
    cp [hl]
    ret c

    jr nz, jr_000_1745

    dec hl
    ld a, [$c0df]
    cp [hl]
    ret c

    jr nz, jr_000_1745

    dec hl
    ld a, [$c0de]
    cp [hl]
    ret c

    ret z

jr_000_1745:
    ld a, [$c0e0]
    ld [$c0e5], a
    ld a, [$c0df]
    ld [$c0e4], a
    ld a, [$c0de]
    ld [$c0e3], a
    ret


loadLevel_drawHud: ;{ 00:1758
; Load hud base tilemap
    ld de, baseHudText
    call loadStringList.call
; Load level number to VRAM
    ; Load offset to DE
    ld a, [currentLevel]
    ld b, a
    add a
    add b
    ld e, a
    ld d, $00
    ld hl, stageNumbers - 3 ; Bank 1, $6050
    add hl, de
    ld e, l
    ld d, h
    ; Copy data (3 bytes)
    ld hl, $9806
    ld b, $03
    jr_000_1772:
        ld a, [de]
        ld [hl+], a
        inc de
        dec b
    jr nz, jr_000_1772

; Draw score, from MSB to LSB
    ld hl, $9825
    ; First do a series of checks to find the first non-zero digit
    ld a, [$c0e0]
    swap a
    and $0f
    jr nz, jr_000_17b5

    ld a, $25
    ld [hl+], a
    ld a, [$c0e0]
    and $0f
    jr nz, jr_000_17bb

    ld a, $25
    ld [hl+], a
    ld a, [$c0df]
    swap a
    and $0f
    jr nz, jr_000_17c3

    ld a, $25
    ld [hl+], a
    ld a, [$c0df]
    and $0f
    jr nz, jr_000_17c9

    ld a, $25
    ld [hl+], a
    ld a, [$c0de]
    swap a
    and $0f
    jr nz, jr_000_17d1

    ld a, $25
    ld [hl+], a
    jr jr_000_17d2

; Then start drawing the numbers
jr_000_17b5:
    ld [hl+], a
    ld a, [$c0e0]
    and $0f

jr_000_17bb:
    ld [hl+], a
    ld a, [$c0df]
    swap a
    and $0f

jr_000_17c3:
    ld [hl+], a
    ld a, [$c0df]
    and $0f

jr_000_17c9:
    ld [hl+], a
    ld a, [$c0de]
    swap a
    and $0f

jr_000_17d1:
    ld [hl+], a

jr_000_17d2:
    ld a, [$c0de]
    and $0f
    ld [hl+], a

; Draw number of lives
    ld hl, $982f
    ld a, [playerLives]
    ld [hl], a
; Draw health bar
    ld a, [$c0c8]
    and $07
    ld d, $00
    add a
    add a
    ld e, a
    ld hl, healthBarTilemaps
    add hl, de
    ld de, $9830
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl]
    ld [de], a
; Draw weapon
    ld a, [$c117]
    ld e, a
    ld d, $00
    ld hl, $1979
    add hl, de
    ld b, [hl]
    ; Not sure why this is being read?
    ld hl, $c11a
    add hl, de
    ld c, [hl]
    ; Write weapon type
    ld hl, $9811
    ld a, b
    ld [hl+], a
    ; Write weapon
    ld a, $24
    ld [hl+], a
    ; Write weapon count
    ld a, [$c1a2]
    ld [hl+], a
ret ;}


Call_000_1818:
    ldh a, [$bb]
    ldh [rSCY], a
    ldh a, [$bc]
    ldh [rSCX], a
ret


Call_000_1821:
    ld hl, $c0de
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld [$c0e1], a
    ret


Call_000_182c:
    ld a, [$c0dd]
    and a
    ret z

    call Call_000_2727
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $98
    ld [hl+], a
    ld a, $25
    ld [hl+], a
    ld a, $06
    ld [hl+], a
    ld a, [$c0e0]
    swap a
    and $0f
    jr nz, jr_000_1881

    ld a, $25
    ld [hl+], a
    ld a, [$c0e0]
    and $0f
    jr nz, jr_000_1887

    ld a, $25
    ld [hl+], a
    ld a, [$c0df]
    swap a
    and $0f
    jr nz, jr_000_188f

    ld a, $25
    ld [hl+], a
    ld a, [$c0df]
    and $0f
    jr nz, jr_000_1895

    ld a, $25
    ld [hl+], a
    ld a, [$c0de]
    swap a
    and $0f
    jr nz, jr_000_189d

    ld a, $25
    ld [hl+], a
    jr jr_000_189e

jr_000_1881:
    ld [hl+], a
    ld a, [$c0e0]
    and $0f

jr_000_1887:
    ld [hl+], a
    ld a, [$c0df]
    swap a
    and $0f

jr_000_188f:
    ld [hl+], a
    ld a, [$c0df]
    and $0f

jr_000_1895:
    ld [hl+], a
    ld a, [$c0de]
    swap a
    and $0f

jr_000_189d:
    ld [hl+], a

jr_000_189e:
    ld a, [$c0de]
    and $0f
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $09
    ld [$cb01], a
    xor a
    ld [$c0dd], a
    ret


Call_000_18b3:
    ld hl, $c11a
    ld a, $01
    ld [$c1a2], a
    ld [hl+], a
    ld a, $07
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [$c117], a

Call_000_18c9:
    ld a, [$c117]
    ld d, $00
    ld e, a
    ld hl, $c11a
    add hl, de
    ld a, [hl]
    ld c, a
    ld [$c119], a
    ld d, $00
    ld a, b
    and $07
    add a
    add a
    add a
    ld e, a
    ld hl, $1981
    add hl, de
    ld a, c
    and $07
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$c118], a
    ret


Call_000_18ef:
    ld a, [$c0b5]
    bit 7, a
    ret z

    ldh a, [$8d]
    bit 2, a
    ret z

    ld a, [$c117]

jr_000_18fd:
    inc a
    and $07
    ld b, a
    jr z, jr_000_1911

    ld d, $00
    ld e, a
    ld hl, $c11a
    add hl, de
    ld a, [hl]
    and a
    jr nz, jr_000_1919

    ld a, b
    jr jr_000_18fd

jr_000_1911:
    ld d, $00
    ld e, a
    ld hl, $c11a
    add hl, de
    ld a, [hl]

Jump_000_1919:
jr_000_1919:
    ld c, a
    ld [$c119], a
    ld d, $00
    ld a, b
    and $07
    add a
    add a
    add a
    ld e, a
    ld hl, $1981
    add hl, de
    ld a, c
    and $07
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$c118], a
    ld a, b
    ld [$c117], a
    ld e, a
    ld d, $00
    ld hl, $1979
    add hl, de
    ld b, [hl]
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $98
    ld [hl+], a
    ld a, $11
    ld [hl+], a
    ld a, $03
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld a, $24
    ld [hl+], a
    ld a, [$c1a2]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $06
    ld [$cb01], a
    ret


Call_000_1966:
    ld b, a
    ld d, $00
    ld e, a
    ld hl, $c11a
    add hl, de
    ld a, [hl]
    cp $07
    jp nc, Jump_000_1919

    inc a
    ld [hl], a
    jp Jump_000_1919

; 00:1979 - Weapon type tiles
    db $30, $31, $32, $33, $34, $36


    ld bc, $1002

    db $10, $10, $10, $10, $10, $10, $10

    jr nz, jr_000_19ab

    jr nz, jr_000_19ad

    jr nz, jr_000_19af

    db $20

    db $20

    jr nz, jr_000_19b3

    jr nz, jr_000_19b5

    jr nz, jr_000_19b7

    db $20

    db $20

    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    ld b, b
    jr nc, @+$32

    jr nc, jr_000_19d5

    jr nc, @+$32

    db $30

    db $30

    jr z, @+$2a

jr_000_19ab:
    jr z, jr_000_19d5

jr_000_19ad:
    jr z, @+$2a

jr_000_19af:
    db $28

    db $28

jr_000_19b1:
    db $10
    db $10

jr_000_19b3:
    db $10
    db $10

jr_000_19b5:
    db $10
    db $10

jr_000_19b7:
    db $10
    db $10

jr_000_19b9:
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    db $10

Call_000_19c1:
    ld a, [$c0c8]
    and $07
    ld d, $00
    add a
    add a
    ld e, a
    ld hl, healthBarTilemaps
    add hl, de
    push hl
    ld d, $00
    ld a, [$cb01]

jr_000_19d5: ; Junk label
    ld e, a
    ld hl, $cb02
    add hl, de
    pop de
    ld a, $98
    ld [hl+], a
    ld a, $30
    ld [hl+], a
    ld a, $04
    ld [hl+], a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $07
    ld [$cb01], a
    ret


Call_000_19fa:
    ld a, [$c0de]
    add l
    daa
    ld [$c0de], a
    ld a, [$c0df]
    adc h
    daa
    ld [$c0df], a
    ld a, [$c0e0]
    adc $00
    daa
    ld [$c0e0], a
    ld a, $ff
    ld [$c0dd], a
    jr c, jr_000_1a45

    ret


Call_000_1a1b:
    ld d, $00
    add a
    ld e, a
    ld hl, $1a51
    add hl, de
    ld a, [$c0de]
    add [hl]
    daa
    ld [$c0de], a
    inc hl
    ld a, [$c0df]
    adc [hl]
    daa
    ld [$c0df], a
    ld a, [$c0e0]
    adc $00
    daa
    ld [$c0e0], a
    ld a, $ff
    ld [$c0dd], a
    jr c, jr_000_1a45

    ret


jr_000_1a45:
    ld a, $99
    ld [$c0e0], a
    ld [$c0df], a
    ld [$c0de], a
    ret

;{ start of some data
    db $10, $00, $20, $00, $30, $00, $50, $00, $05, $00

    ld [de], a
    nop
    jr jr_000_1a5f

jr_000_1a5f:
    dec h
    nop
    nop
    ld bc, $0200
    nop
    inc bc
    nop
    dec b
    nop
    stop
    jr nz, jr_000_1a6e

jr_000_1a6e:
    jr nc, jr_000_1a70

jr_000_1a70:
    ld d, b
;} end of data


soundTest_handleInput: ;{ 00:1A71
    ldh a, [hInputRisingEdge]
    bit 6, a
        call nz, soundTest_increment
    ldh a, [hInputRisingEdge]
    bit 7, a
        call nz, soundTest_decrement
    call soundTest_drawNumber
ret ;}

soundTest_increment: ;{ 00:1A83
    ld a, [$c1a3]
    inc a
    cp $0b
    jr c, .endIf
        ld a, $00
    .endIf:
    ld [$c1a3], a
ret ;}

soundTest_decrement: ;{ 00:1A91
    ld a, [$c1a3]
    dec a
    cp $ff
    jr nz, .endIf
        ld a, $0a
    .endIf:
    ld [$c1a3], a
ret ;}

; Preps VRAM update for soundtest
soundTest_drawNumber: ;{ 00:1A9F
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $98
    ld [hl+], a
    ld a, $cc
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$c1a3]
    ld [hl+], a
    xor a
    ld [hl], a
    ld a, [$cb01]
    add $05
    ld [$cb01], a
ret ;}

; 00:1AC3
    db $48, $00, $48, $46, $bf, $28, $44, $61, $14, $43, $98, $0d, $41, $34, $0a, $3f
    db $2b, $08, $3d, $d1, $06, $3c, $d9, $05, $3a, $20, $05, $38, $90, $04, $37, $1e
    db $04, $35, $c0, $03, $33, $72, $03, $31, $30, $03, $30, $f8, $02, $2e, $c7, $02
    db $2c, $9d, $02, $2b, $78, $02, $29, $57, $02, $28, $39, $02, $26, $1f, $02, $25
    db $07, $02, $23, $f2, $01, $21, $df, $01, $20, $cd, $01, $1f, $bd, $01, $1d, $ae
    db $01, $1c, $a0, $01, $1a, $94, $01, $19, $88, $01, $18, $7d, $01, $16, $73, $01
    db $15, $6a, $01, $14, $61, $01, $13, $5a, $01, $11, $52, $01, $10, $4b, $01, $0f
    db $45, $01, $0e, $3f, $01, $0d, $39, $01, $0c, $34, $01, $0b, $2f, $01, $0a, $2a
    db $01, $09, $26, $01, $09, $22, $01, $08, $1f, $01, $07, $1b, $01, $06, $18, $01
    db $05, $15, $01, $05, $12, $01, $04, $10, $01, $04, $0e, $01, $03, $0c, $01, $03
    db $0a, $01, $02, $08, $01, $02, $06, $01, $01, $05, $01, $01, $04, $01, $01, $03
    db $01, $01, $02, $01, $00, $01, $01, $00, $01, $01, $00, $00, $01, $00, $00, $01
    db $00, $00, $01

loadBossEnemy: ;{ 00:1B86
    xor a
    ld [$c344], a
    ld [$c346], a
    ld [$c348], a
    ld [$c34a], a
    ld [$c34b], a
    ld [$c342], a
    ld [$c34c], a
    ld [$c34d], a
    ld [$c355], a
    ld [$c356], a
    ld [$c357], a
    ld [$c358], a
    inc a
    ld [$c349], a
    ld [$c34f], a
    ld [$c350], a
    ld [$c351], a
    ld a, $b0
    ld [$c345], a
    ld a, $60
    ld [$c347], a
    xor a
    ld [$c34e], a
    ld a, $20
    ld [$c343], a
    ld a, [currentLevel]
    cp $0c
    jr z, .else
        ; Load Jack
        ld a, $80
        ld [$c341], a
        ld a, $64
        ld [$c353], a
        ret
    .else:
        ; Load Joker
        ld a, $81
        ld [$c341], a
        ld a, $ff
        ld [$c353], a
        ret
;}


Call_000_1be8:
    ld a, [$c341]
    bit 7, a
    jp z, Jump_000_22cd

    xor a
    ld [$c358], a
    ld a, [$c356]
    cp $08
    jr c, jr_000_1c03

    ld a, [$c358]
    add $40
    ld [$c358], a

jr_000_1c03:
    ld a, [$c357]
    cp $80
    jr c, jr_000_1c12
        ld a, [$c358]
        add $20
        ld [$c358], a

jr_000_1c12:
    xor a
    ld [$c352], a
    ld a, [$c34e]
    and $58
    ld [$c34e], a
    call Call_000_1e10
    ld a, [$c34c]
    ld c, a
    ld a, [$c34d]
    ld b, a
    ld a, [$c346]
    add c
    ld [$c346], a
    ld a, [$c347]
    adc b
    ld [$c347], a
    ld a, b
    or c
    jr z, jr_000_1c65

    bit 7, b
    jr nz, jr_000_1c53

    ld a, [$c34c]
    and $f8
    sub $08
    ld [$c34c], a
    ld a, [$c34d]
    sbc $00
    ld [$c34d], a
    jr jr_000_1c65

jr_000_1c53:
    ld a, [$c34c]
    and $f8
    add $08
    ld [$c34c], a
    ld a, [$c34d]
    adc $00
    ld [$c34d], a

jr_000_1c65:
    call Call_000_23cc
    ldh a, [$91]
    ld b, a
    ld a, [$c347]
    cp b
    jr nc, jr_000_1c7b

    ld a, [$c34e]
    and $5c
    ld [$c34e], a
    jr jr_000_1c85

jr_000_1c7b:
    ld a, [$c34e]
    and $5c
    or $20
    ld [$c34e], a

jr_000_1c85:
    ld a, [$c34a]
    ld b, a
    ld a, [$c34b]
    cp b
    jr z, jr_000_1c97

    ld a, [$c34e]
    or $80
    ld [$c34e], a

jr_000_1c97:
    ld a, [$c34e]
    and $80
    jr z, jr_000_1cba

    ld a, [$c351]
    dec a
    ld [$c351], a
    jr nz, jr_000_1cba

    ld a, $0c
    ld [$c351], a
    ld a, [$c350]
    dec a
    ld [$c350], a
    jr nz, jr_000_1cba

    ld a, $04
    ld [$c350], a

jr_000_1cba:
    ld a, [$c350]
    dec a
    ld d, a
    ld a, [$c34e]
    and $1c
    or d
    ld d, $00
    ld e, a
    ld hl, $1d48
    add hl, de
    ld e, [hl]
    ld a, [$c34e]
    and $80
    jr nz, jr_000_1cd6

    ld e, $30

jr_000_1cd6:
    ld a, [$c352]
    and a
    jr z, jr_000_1cdd

    ld e, a

jr_000_1cdd:
    ld a, [$c34e]
    and $bf
    ld [$c34e], a
    ld a, [$c355]
    and a
    jr nz, jr_000_1cf2

    ld a, [$c345]
    cp $b0
    jr nc, jr_000_1d03

jr_000_1cf2:
    ld a, [$c34b]
    rra
    rra
    and $20
    ld d, a
    ld a, [$c34e]
    and $df
    or d
    ld [$c34e], a

jr_000_1d03:
    ld a, [$c34c]
    ld d, a
    ld a, [$c34d]
    or d
    jr z, jr_000_1d17
        ld a, [$c343]
        add a
        add a
        add a
        add a
        and $10
        ld d, a
    jr_000_1d17:

    ld a, [$c341]
    and $01
    add a
    add a
    add a
    add e
    ld e, a
    ld a, [$c345]
    ld b, a
    ld a, [$c347]
    ld c, a
    ld a, [$c34e]
    and $20
    or d
    push de
    push bc
    call drawMetasprite
    pop bc
    call Call_000_2453
    pop de
    ld d, $00
    ld a, e
    and $07
    ld e, a
    ld hl, $1d68
    add hl, de
    ld a, [hl]
    ld [$c354], a
    ret

; 00:1D48
    db $30, $31, $30, $32, $33, $33, $33, $33, $34, $34, $34, $34, $33, $33, $33, $33
    db $34, $34, $34, $34, $33, $33, $33, $33, $34, $34, $34, $34, $33, $33, $33, $33

; 00:1D68
    db $00, $01, $01, $03, $00, $08, $00, $00, $40, $40, $80, $40, $60, $40, $30, $40
    db $40, $40, $80, $40, $60, $40, $30, $40, $40, $40, $80, $40, $60, $40, $30, $40
    db $40, $40, $80, $40, $60, $40, $30, $40, $40, $40, $40, $40, $40, $40, $40, $20
    db $40, $70, $40, $40, $50, $40, $30, $40, $30, $40, $60, $40, $70, $40, $60, $20
    db $40, $40, $50, $70, $70, $40, $40, $70, $40, $40, $40, $30, $30, $40, $20, $20
    db $40, $60, $20, $30, $40, $30, $10, $30, $50, $40, $40, $30, $50, $20, $30, $60
    db $20, $40, $10, $40, $20, $40, $20, $28, $40, $40, $50, $20, $30, $20, $60, $20
    db $30, $40, $30, $40, $30, $40, $10, $30, $30, $40, $20, $40, $60, $40, $40, $40
    db $40, $20, $30, $20, $30, $40, $20, $40, $40, $40, $40, $30, $30, $30, $40, $20
    db $20, $50, $40, $30, $30, $40, $30, $40, $30, $40, $40, $40, $30, $40, $50, $20
    db $40, $10, $40, $40, $40, $40, $40, $30

Call_000_1e10:
    ld a, [$c343]
    dec a
    ld [$c343], a
    jr nz, jr_000_1e40
        xor a
        ld [$c355], a
        ld a, [$c358]
        ld d, a
        ld a, [$c341]
        swap a
        add a
        and $20
        add d
        ld c, a
        ld d, $00
        ld a, [$c342]
        inc a
        and $1f
        ld [$c342], a
        add c
        ld e, a
        ld hl, $1d70
        add hl, de
        ld a, [hl]
        ld [$c343], a
    jr_000_1e40:

    ld a, [$c0c9]
    and a
    jr z, jr_000_1e53
        ld a, [$c343]
        and $3f
        ld [$c343], a
        ld a, $01
        ld [$c342], a
    jr_000_1e53:

    ld a, [$c358]
    ld d, a
    ld a, [$c341]
    swap a
    add a
    and $20
    add d
    ld c, a
    ld d, $00
    ld a, [$c342]
    add c
    add a
    ld e, a
    ld hl, table_000_1E71
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

table_000_1E71:
    dw $1FB1, $1FEF, $1FB1, $201B, $1FEF, $1FB1, $2061, $1FB1, $20DB, $20DB, $1FB1, $2061, $1FB1, $2091, $1FB1, $20DB
    dw $1FB1, $1FEF, $1FB1, $201B, $1FEF, $1FB1, $2061, $1FB1, $20DB, $20DB, $1FB1, $2061, $1FB1, $2091, $1FB1, $20DB
    dw $1FB1, $1FEF, $2091, $20DB, $1FB1, $2091, $20DB, $1FB1, $20DB, $215E, $20DB, $2061, $20DB, $1FEF, $1FB1, $20DB
    dw $1FB1, $1FEF, $1FB1, $201B, $215E, $1FB1, $21AA, $1FB1, $20DB, $20DB, $1FB1, $215E, $215E, $20DB, $1FB1, $21AA
    dw $1FB1, $1FEF, $2091, $20DB, $1FB1, $21EC, $20DB, $1FB1, $20DB, $215E, $20DB, $2061, $21EC, $1FEF, $1FB1, $20DB
    dw $1FB1, $2061, $21EC, $1FB1, $2091, $20DB, $21AA, $215E, $1FB1, $20DB, $1FB1, $201B, $20DB, $21EC, $20DB, $21AA
    dw $1FB1, $1FEF, $215E, $20DB, $215E, $20DB, $21AA, $20DB, $21AA, $215E, $20DB, $21AA, $20DB, $2091, $1FB1, $20DB
    dw $20DB, $2061, $1FB1, $2061, $215E, $20DB, $2091, $21AA, $215E, $20DB, $21AA, $20DB, $215E, $20DB, $20DB, $21AA
    dw $1FB1, $1FEF, $2091, $20DB, $215E, $2061, $21EC, $20DB, $2061, $215E, $20DB, $21AA, $21EC, $1FEF, $20DB, $2061
    dw $21AA, $1FEF, $21EC, $2091, $215E, $2091, $21AA, $1FB1, $20DB, $21EC, $20DB, $215E, $21AA, $20DB, $21EC, $21AA


    ld a, [$c355]
    and a
    jr nz, jr_000_1fda
        ldh a, [$91]
        ld b, a
        ld a, [$c347]
        cp b
        jr nc, jr_000_1fcb
            ld a, $80
            ld [$c34a], a
            xor a
            ld [$c34b], a
            jr jr_000_1fd5
        jr_000_1fcb:
            ld a, $80
            ld [$c34a], a
            ld a, $ff
            ld [$c34b], a
        jr_000_1fd5:
    
        ld a, $80
        ld [$c355], a
    jr_000_1fda:

    ld hl, $c34a
    ld a, [$c346]
    add [hl]
    ld [$c346], a
    inc hl
    ld a, [$c347]
    adc [hl]
    ld [$c347], a
    jp Jump_000_2236


    xor a
    ld [$c34a], a
    ld [$c34b], a
    ld a, [$c343]
    cp $20
    jp nz, Jump_000_2236

    ld a, [$c345]
    add $0c
    ld b, a
    ld a, [$c347]
    add $10
    ld c, a
    ld a, $13
    call $4ee8
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    jp Jump_000_2236


    xor a
    ld [$c34a], a
    ld [$c34b], a
    ld a, [$c343]
    cp $3c
    jr c, jr_000_2031

jr_000_2029:
    ld a, $33
    ld [$c352], a
    jp Jump_000_2236


jr_000_2031:
    ld a, $35
    ld [$c352], a
    ld a, [$c343]
    cp $20
    jr z, jr_000_2044

    cp $04
    jr c, jr_000_2029

    jp Jump_000_2236


jr_000_2044:
    ld a, [$c345]
    add $0e
    ld b, a
    ld a, [$c347]
    add $10
    ld c, a
    ld a, $fc
    call $4f7c
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    jp Jump_000_2236


    xor a
    ld [$c34a], a
    ld [$c34b], a
    ld a, [$c343]
    cp $15
    jr z, jr_000_2074

    cp $2b
    jp nz, Jump_000_2236

jr_000_2074:
    ld a, [$c345]
    add $0c
    ld b, a
    ld a, [$c347]
    add $10
    ld c, a
    ld a, $13
    call $4ee8
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    jp Jump_000_2236


    xor a
    ld [$c34a], a
    ld [$c34b], a
    ld a, [$c343]
    cp $3c
    jr c, jr_000_20a7

jr_000_209f:
    ld a, $33
    ld [$c352], a
    jp Jump_000_2236


jr_000_20a7:
    ld a, $35
    ld [$c352], a
    ld a, [$c343]
    cp $15
    jr z, jr_000_20be

    cp $2b
    jr z, jr_000_20be

    cp $04
    jr c, jr_000_209f

    jp Jump_000_2236


jr_000_20be:
    ld a, [$c345]
    add $14
    ld b, a
    ld a, [$c347]
    add $10
    ld c, a
    ld a, $f8
    call $4f7c
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    jp Jump_000_2236


    ld a, [$c343]
    cp $40
    jr nz, jr_000_210e

    ld a, [$c341]
    and $01
    jr z, jr_000_20fc

    xor a
    ld [$c348], a
    ld a, $fe
    ld [$c349], a
    ld a, [$c34e]
    or $08
    ld [$c34e], a
    jr jr_000_210e

jr_000_20fc:
    ld a, $80
    ld [$c348], a
    ld a, $fd
    ld [$c349], a
    ld a, [$c34e]
    or $08
    ld [$c34e], a

jr_000_210e:
    ld a, [$c345]
    cp $b0
    jr nc, jr_000_211e

    ld a, [$c34b]
    bit 7, a
    jr nz, jr_000_2132

    jr jr_000_2127

jr_000_211e:
    ldh a, [$91]
    ld b, a
    ld a, [$c347]
    cp b
    jr nc, jr_000_2132

jr_000_2127:
    ld a, $80
    ld [$c34a], a
    xor a
    ld [$c34b], a
    jr jr_000_213c

jr_000_2132:
    ld a, $80
    ld [$c34a], a
    ld a, $ff
    ld [$c34b], a

jr_000_213c:
    ld hl, $c34a
    ld a, [$c346]
    add [hl]
    ld [$c346], a
    inc hl
    ld a, [$c347]
    adc [hl]
    ld [$c347], a
    ld a, [$c343]
    cp $3c
    jp c, Jump_000_2236

    ld a, $33
    ld [$c352], a
    jp Jump_000_2236


    xor a
    ld [$c34a], a
    ld [$c34b], a
    ld a, [$c343]
    cp $20
    jp nz, Jump_000_2236

    ld a, [$c345]
    add $0c
    ld b, a
    ld a, [$c347]
    add $10
    ld c, a
    push bc
    ld a, $77
    call $4ee8
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    pop bc
    push bc
    ld a, $13
    call $4ee8
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    pop bc
    ld a, $73
    call $4ee8
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    jp Jump_000_2236


    xor a
    ld [$c34a], a
    ld [$c34b], a
    ld a, [$c343]
    cp $15
    jr z, jr_000_21ce

    ld a, [$c343]
    cp $20
    jr z, jr_000_21c9

    cp $2b
    jp nz, Jump_000_2236

    ld d, $73
    jp Jump_000_21d0


jr_000_21c9:
    ld d, $13
    jp Jump_000_21d0


jr_000_21ce:
    ld d, $77

Jump_000_21d0:
    ld a, [$c345]
    add $0c
    ld b, a
    ld a, [$c347]
    add $10
    ld c, a
    ld a, d
    call $4ee8
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    jp Jump_000_2236


    xor a
    ld [$c34a], a
    ld [$c34b], a
    ld a, [$c343]
    cp $3c
    jr c, jr_000_2202

jr_000_21fa:
    ld a, $33
    ld [$c352], a
    jp Jump_000_2236


jr_000_2202:
    ld a, $35
    ld [$c352], a
    ld a, [$c343]
    cp $15
    jr z, jr_000_2219

    cp $20
    jr z, jr_000_2219

    cp $04
    jr c, jr_000_21fa

    jp Jump_000_2236


jr_000_2219:
    ld a, [$c345]
    add $14
    ld b, a
    ld a, [$c347]
    add $10
    ld c, a
    ld a, $f8
    call $4f7c
    xor a
    ld [$c24d], a
    ld a, $13
    call $4de8
    jp Jump_000_2236


Jump_000_2236:
    ld a, [$c349]
    bit 7, a
    jr z, jr_000_2248

    jr jr_000_2257

    xor a
    ld [$c348], a
    ld [$c349], a
    jr jr_000_2257

jr_000_2248:
    ld a, [$c345]
    cp $b0
    jr nc, jr_000_2286

    ld a, [$c34e]
    or $10
    ld [$c34e], a

jr_000_2257:
    ld hl, $c348
    ld a, [$c344]
    add [hl]
    ld [$c344], a
    inc hl
    ld a, [$c345]
    adc [hl]
    ld [$c345], a
    ld a, [hl]
    bit 7, a
    jr nz, jr_000_2271

    cp $02
    ret nc

jr_000_2271:
    ld hl, $c34f
    dec [hl]
    ret nz

    ld a, $02
    ld [hl], a
    ld bc, $0040
    ld hl, $c348
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl], a
    ret


jr_000_2286:
    ld a, [$c349]
    bit 7, a
    jr nz, jr_000_2257

    ld a, $80
    ld [$c348], a
    xor a
    ld [$c349], a
    xor a
    ld [$c344], a
    ld a, [$c345]
    and $f8
    ld [$c345], a
    ld a, [$c34e]
    and $e0
    ld [$c34e], a
    ret


    xor a
    ld [$c348], a
    ld [$c349], a
    xor a
    ld [$c344], a
    ld a, [$c345]
    and $f8
    add $08
    ld [$c349], a
    ret


    xor a
    ld [$c348], a
    ld [$c349], a
    xor a
    ld [$c344], a
    ret


Jump_000_22cd:
    ld a, [$c342]
    and a
    jp nz, Jump_000_2354

    ld a, [$c345]
    cp $e0
    jr c, jr_000_22f3

    ld a, [$c342]
    inc a
    ld [$c342], a
    ld a, $06
    ld [$c343], a
    ld a, [currentLevel]
    cp $04
    jr nz, jr_000_22f3

    ld a, $17
    call playSound

jr_000_22f3:
    ld a, [$c34c]
    ld c, a
    ld a, [$c34d]
    ld b, a
    ld a, [$c346]
    add c
    ld [$c346], a
    ld a, [$c347]
    adc b
    ld [$c347], a
    call Call_000_23cc
    ld hl, $c348
    ld a, [$c344]
    add [hl]
    ld [$c344], a
    inc hl
    ld a, [$c345]
    adc [hl]
    ld [$c345], a
    ld bc, $0020
    ld hl, $c348
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl], a
    ld e, $00
    ld a, [$c349]
    rla
    rl e
    ld a, $37
    sub e
    ld e, a
    ld a, [$c341]
    and $01
    add a
    add a
    add a
    add e
    ld e, a
    ld a, [$c345]
    ld b, a
    ld a, [$c347]
    ld c, a
    ld d, $00
    ld a, [$c34e]
    and $20
    or d
    call drawMetasprite
    ret


Jump_000_2354:
    ld a, [currentLevel]
    cp $0c
    jr z, jr_000_23af

    ld a, [$c342]
    cp $17
    jr nc, jr_000_23a6

    ld a, [$c343]
    dec a
    ld [$c343], a
    jr nz, jr_000_2377

    ld a, [$c342]
    inc a
    ld [$c342], a
    ld a, $08
    ld [$c343], a

jr_000_2377:
    ld a, [$c342]
    dec a
    ld e, a
    ld d, $00
    ld hl, $238e
    add hl, de
    ld e, [hl]
    ld b, $d0
    ld a, [$c347]
    ld c, a
    xor a
    call drawMetasprite
    ret


    db $40, $41, $42, $43, $44, $45, $46, $41, $48, $48, $48, $48, $40, $47, $40, $48
    db $48, $48, $48, $48, $48, $48, $48

    ld c, b

jr_000_23a6:
    ld a, [$c341]
    or $02
    ld [$c341], a
    ret


jr_000_23af:
    ld a, [$c342]
    cp $17
    jr nc, jr_000_23a6

    ld a, [$c343]
    dec a
    ld [$c343], a
    jr nz, jr_000_23cb

    ld a, [$c342]
    inc a
    ld [$c342], a
    ld a, $08
    ld [$c343], a

jr_000_23cb:
    ret


Call_000_23cc:
    ld a, [$c347]
    cp $11
    jr c, jr_000_23e0

    cp $88
    ret c

    xor a
    ld [$c346], a
    ld a, $88
    ld [$c347], a
    ret


jr_000_23e0:
    xor a
    ld [$c346], a
    ld a, $11
    ld [$c347], a
    ret


Call_000_23ea:
    ld a, [currentLevel]
    cp $04
    ret nz

    ld a, [$c0cf]
    cp $11
    jr c, jr_000_2404

    cp $88
    ret c

    xor a
    ld [$c0ce], a
    ld a, $88
    ld [$c0cf], a
    ret


jr_000_2404:
    xor a
    ld [$c0ce], a
    ld a, $11
    ld [$c0cf], a
    ret


Call_000_240e:
    ld a, $ff
    ld [$c0ca], a
    ld a, $01
    ldh [$9f], a
    ld a, $08
    ldh [$a0], a
    ld a, $17
    call playSound
    ret


Jump_000_2421:
    ldh a, [$9f]
    and a
    ret z

    cp $17
    jr nc, jr_000_244f

    ldh a, [$a0]
    dec a
    ldh [$a0], a
    jr nz, jr_000_2439

    ldh a, [$9f]
    inc a
    ldh [$9f], a
    ld a, $08
    ldh [$a0], a

jr_000_2439:
    ldh a, [$9f]
    dec a
    ld e, a
    ld d, $00
    ld hl, $238e
    add hl, de
    ld e, [hl]
    ld b, $d0
    ld a, [$c0cf]
    ld c, a
    xor a
    call drawMetasprite
    ret


jr_000_244f:
    xor a
    ldh [$9f], a
    ret


Call_000_2453:
    ld a, [$c345]
    add $18
    ld d, a
    ld a, [$c347]
    add $08
    ld e, a
    ldh a, [$8f]
    add $09
    sub d
    jr nc, jr_000_2468

    cpl
    inc a

jr_000_2468:
    cp $12
    jr nc, jr_000_247c

    ldh a, [$91]
    add $08
    sub e
    jr nc, jr_000_2475

    cpl
    inc a

jr_000_2475:
    cp $04
    jr nc, jr_000_247c

    jp $4eac


jr_000_247c:
    scf
    ret


loadLevel_drawLevelName: ;{ 00:247E
    ld a, [currentLevel]
    dec a
    and $0f
    add a
    ld d, $00
    ld e, a
    ld hl, levelNamePointers
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    call loadStringList.call
ret ;}

levelNamePointers: ;{ 00:2493
    dw levelName_gotham1   ; $01: Gotham City (1-1) [cutscene 1]
    dw levelName_factory   ; $02: Chemical Factory (1-2)
    dw levelName_factory   ; $03: Chemical Factory (1-3)
    dw levelName_vsJack    ; $04: Batman vs Jack (1-4)
    dw levelName_gotham2   ; $05: Gotham City (2-1) [cutscene 2]
    dw levelName_museum    ; $06: Flugalheim Museum (2-2)
    dw levelName_museum    ; $07: Flugalheim Museum (2-3)
    dw levelName_batwing   ; $08: Batwing Stage (3-1) [cutscene 3]
    dw levelName_batwing   ; $09: Batwing Stage (3-2)
    dw levelName_cathedral ; $0A: Gotham Cathedral (4-1)
    dw levelName_cathedral ; $0B: Gotham Cathedral (4-2)
    dw levelName_vsJoker   ; $0C: Batman vs Joker (4-3)
    ; Invalid stages -- By pointing at the end of a previous string, nothing is printed
    dw levelName_factory-1
    dw levelName_factory-1
    dw levelName_factory-1
    dw levelName_factory-1
    dw levelName_factory-1

; Each is in string list format
levelName_gotham1: ; 00:24B5
    db $99, $01, $12, $25, $25, $25, $10, $18, $1D, $11, $0A, $16, $25, $0C, $12, $1D, $22, $25, $25, $25, $25, $00
levelName_factory: ; 00:24CB
    db $99, $01, $12, $25, $0C, $11, $0E, $16, $12, $0C, $0A, $15, $25, $0F, $0A, $0C, $1D, $18, $1B, $22, $25, $00
levelName_vsJack: ; 00:24E1
    db $99, $01, $12, $25, $25, $0B, $0A, $1D, $16, $0A, $17, $25, $1F, $1C, $25, $13, $0A, $0C, $14, $25, $25, $00
levelName_gotham2: ; 00:24F7
    db $99, $01, $12, $25, $25, $25, $10, $18, $1D, $11, $0A, $16, $25, $0C, $12, $1D, $22, $25, $25, $25, $25, $00
levelName_museum: ; 00:250D
    db $99, $01, $12, $25, $0F, $15, $1E, $10, $0A, $15, $11, $0E, $12, $16, $25, $16, $1E, $1C, $0E, $1E, $16, $00
levelName_batwing: ; 00:2523
    db $99, $01, $12, $25, $25, $0B, $0A, $1D, $20, $12, $17, $10, $25, $1C, $1D, $0A, $10, $0E, $25, $25, $25, $00
levelName_cathedral: ; 00:2539
    db $99, $01, $12, $25, $10, $18, $1D, $11, $0A, $16, $25, $0C, $0A, $1D, $11, $0E, $0D, $1B, $0A, $15, $25, $00
levelName_vsJoker: ; 00:254F
    db $99, $01, $12, $25, $0B, $0A, $1D, $16, $0A, $17, $25, $1F, $1C, $25, $13, $18, $14, $0E, $1B, $25, $25, $00
;}

Call_000_2565:
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $99
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, $12
    ld [hl+], a
    ld de, $cc16
    ld b, $12

jr_000_257d:
    ld a, [de]
    ld [hl+], a
    push hl
    ld hl, $0010
    add hl, de
    ld e, l
    ld d, h
    pop hl
    dec b
    jr nz, jr_000_257d

    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $15
    ld [$cb01], a
    ret


Call_000_2595:
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $99
    ld [hl+], a
    ld a, $87
    ld [hl+], a
    ld a, $05
    ld [hl+], a
    ld a, $1b
    ld [hl+], a
    ld a, $0e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ld a, $0d
    ld [hl+], a
    ld a, $22
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $08
    ld [$cb01], a
    ret


Call_000_25c2:
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $99
    ld [hl+], a
    ld a, $87
    ld [hl+], a
    ld a, $05
    ld [hl+], a
    ld de, $cc7a
    ld b, $05

jr_000_25da:
    ld a, [de]
    ld [hl+], a
    push hl
    ld hl, $0010
    add hl, de
    ld e, l
    ld d, h
    pop hl
    dec b
    jr nz, jr_000_25da

    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $08
    ld [$cb01], a
    ret


Call_000_25f2:
    xor a
    ld e, a
    ld a, [$c0c4]
    and a
    jr z, jr_000_25fc

    ld e, $50

jr_000_25fc:
    ldh a, [$8f]
    ld b, a
    ldh a, [$91]
    ld c, a
    xor a
    call drawMetasprite
    ret

gameOverText: ; 00:2607 - String list format
    db $98, $65, $0A, $10, $0A, $16, $0E, $25, $25, $18, $1F, $0E, $1B, $98, $E7, $08
    db $0C, $18, $17, $1D, $12, $17, $1E, $0E, $99, $27, $07, $0E, $25, $25, $17, $25
    db $25, $0D, $99, $A2, $09, $1D, $18, $19, $25, $1C, $0C, $18, $1B, $0E, $99, $B1
    db $01, $00, $99, $E6, $05, $1C, $0C, $18, $1B, $0E, $99, $F1, $01, $00, $00

baseHudText: ; 00:2646 - HUD base tilemap (string list format)
    db $98, $00, $05, $1C, $1D, $0A, $10, $0E, $98, $0A, $06, $20, $0E, $0A, $19, $18
    db $17, $98, $20, $05, $1C, $0C, $18, $1B, $0E, $98, $2B, $07, $00, $25, $3C, $21
    db $25, $25, $3C, $00
    
healthBarTilemaps: ; 00:266A
    db $2e, $2f, $2f, $3e ; 0
    db $2e, $2f, $2f, $2d ; 1
    db $2e, $2f, $2b, $2c ; 2
    db $2e, $2b, $2a, $2c ; 3
    db $29, $2a, $2a, $2c ; 4 (full)

Call_000_267e:
    call Call_000_172c
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $98
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $14
    ld [hl+], a
    ld a, $25
    ld [hl+], a
    ld a, $1d
    ld [hl+], a
    ld a, $18
    ld [hl+], a
    ld a, $19
    ld [hl+], a
    ld a, $25
    ld [hl+], a
    ld a, $1c
    ld [hl+], a
    ld a, $0c
    ld [hl+], a
    ld a, $18
    ld [hl+], a
    ld a, $1b
    ld [hl+], a
    ld a, $0e
    ld [hl+], a
    ld a, $25
    ld [hl+], a
    ld a, [$c0e5]
    swap a
    and $0f
    jr nz, jr_000_26ee

    ld a, $25
    ld [hl+], a
    ld a, [$c0e5]
    and $0f
    jr nz, jr_000_26f4

    ld a, $25
    ld [hl+], a
    ld a, [$c0e4]
    swap a
    and $0f
    jr nz, jr_000_26fc

    ld a, $25
    ld [hl+], a
    ld a, [$c0e4]
    and $0f
    jr nz, jr_000_2702

    ld a, $25
    ld [hl+], a
    ld a, [$c0e3]
    swap a
    and $0f
    jr nz, jr_000_270a

    ld a, $25
    ld [hl+], a
    jr jr_000_270b

jr_000_26ee:
    ld [hl+], a
    ld a, [$c0e5]
    and $0f

jr_000_26f4:
    ld [hl+], a
    ld a, [$c0e4]
    swap a
    and $0f

jr_000_26fc:
    ld [hl+], a
    ld a, [$c0e4]
    and $0f

jr_000_2702:
    ld [hl+], a
    ld a, [$c0e3]
    swap a
    and $0f

jr_000_270a:
    ld [hl+], a

jr_000_270b:
    ld a, [$c0e3]
    and $0f
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $25
    ld [hl+], a
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $17
    ld [$cb01], a
    xor a
    ld [$c0dd], a
    ret


Call_000_2727:
    xor a
    ld [$c0e2], a

jr_000_272b:
    ld a, [$c0e1]
    cp $10
    jr nc, jr_000_2754

    ld e, a
    ld d, $00
    ld hl, $2780
    add hl, de
    ld a, [$c0e0]
    cp [hl]
    jr c, jr_000_2754

    ld a, [$c0e1]
    inc a
    ld [$c0e1], a
    ld a, [playerLives]
    inc a
    ld [playerLives], a
    ld a, $ff
    ld [$c0e2], a
    jr jr_000_272b

jr_000_2754:
    ld a, [$c0e2]
    and a
    ret z

    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $98
    ld [hl+], a
    ld a, $2f
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, [playerLives]
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $04
    ld [$cb01], a
    ld a, $29
    call playSound
    ret


    db $01, $02, $03, $04

    dec b
    rlca
    db $10
    jr nz, @+$32

    ld b, b
    ld d, b
    ld h, b
    ld [hl], b
    add b
    sub b
    sub l


Call_000_2790: ;{ Function with two entry points
    ld bc, pushStartText
    jr jr_000_2798

Call_000_2795:
    ld bc, pushStartBlank

jr_000_2798:
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld e, c
    ld d, b
    ld b, $0d

    jr_000_27a6:
        ld a, [de]
        ld [hl+], a
        inc de
        dec b
    jr nz, jr_000_27a6
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $0d
    ld [$cb01], a
ret ;}

pushStartText: ; 00:27B7
    db $9C, $25, $0A, $7F, $9E, $BE, $8F, $00, $BE, $34, $4F, $6F, $34
pushStartBlank: ; 00:27C4
    db $9C, $25, $0A, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

soundTestText: ; 00:27D1 - String list format
    db $98, $64, $0B, $1C, $18, $1E, $17, $0D, $25, $25, $1D, $0E, $1C, $1D, $98, $C4
    db $0A, $1C, $18, $1E, $17, $0D, $25, $25, $25, $00, $00, $99, $24, $0C, $1C, $1D
    db $0A, $1B, $1D, $25, $0A, $25, $18, $1B, $25, $0B, $99, $64, $0C, $0E, $21, $12
    db $1D, $25, $25, $1C, $0E, $15, $0E, $0C, $1D, $99, $C6, $0C, $1C, $1E, $17, $1C
    db $18, $0F, $1D, $25, $01, $09, $09, $00, $00

; Get enemy data pointer for stage
;  (sometime after the tile data has been loaded to WRAM)
Call_000_281a: ;{ 00:281A
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ; Clear some stuff
    ld b, $05
    ld de, $0020
    ld hl, $c24e
    xor a
    .loop:
        ld [hl], a
        add hl, de
        dec b
    jr nz, .loop
    ; Get enemy data pointer from bank 6
    ld a, [currentLevel]
    add a
    ld e, a
    ld d, $00
    ld hl, $4000
    add hl, de
    ld a, [hl+]
    ld [$c2f3], a
    ld a, [hl]
    ld [$c2f4], a
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
ret ;}


Call_000_2850:
jr_000_2850:
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $06
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call Call_000_2868
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
ret


Call_000_2868: ; Try loading enemy
    ; Load pointer into enemy data
    ld a, [$c2f3]
    ld l, a
    ld a, [$c2f4]
    ld h, a
    ; If byte is zero, compare camera value
    ; Else try loading the enemy
    ld a, [hl+]
    and a
        jp nz, Jump_000_2893
; Read enemy scroll data {
    ; Compare screen in data to current screen
    ldh a, [$98]
    cp [hl]
        jr z, jr_000_2887
    ret c ; Exit if we're too early

    inc hl

jr_000_287c:
    inc hl

Jump_000_287d:
jr_000_287d:
    ; Save value and call this function again
    ld a, l
    ld [$c2f3], a
    ld a, h
    ld [$c2f4], a
    jr jr_000_2850

jr_000_2887:
    ; Compare pixel in data to current pixel
    inc hl
    ldh a, [$97]
    cp [hl]
    ret c
jr jr_000_287c ;}

jr_000_288e:
    ; If byte is 2, use this other branch to load an enemy
    dec a
        ret nz
jp Jump_000_2945

; Try loading enemy
Jump_000_2893: ;{
    ; If byte is 1, use this routine to load an enemy
    dec a
    jr nz, jr_000_288e
    ; Find first empty enemy slot
    push hl
    ld b, $05
    ld hl, $c24e
    ld de, $0020
    .findLoop:
        bit 7, [hl]
            jr z, .break
        add hl, de
        dec b
    jr nz, .findLoop
    ; unable to find enemy slot
    pop hl
    ld de, $0006
    add hl, de
    jr jr_000_287d
    
    .break:

    ld e, l
    ld d, h
    pop hl
        ld a, [hl+] ; Load enemy type
    push hl
    ; Load header 1 (3 bytes)
    ; Enemy type*3
    ld b, a
    add a
    add b
    ld c, a
    ld b, $00
    ld hl, $401e
    add hl, bc
    ld a, l
    ld l, e
    ld e, a
    ld a, h
    ld h, d
    ld d, a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    xor a
    ld [hl+], a
    
    pop de
        ; Load 3 bytes from enemy data chunk (x,y?)
        ld a, [de]
        ld [hl+], a
        inc de
        
        xor a
        ld [hl+], a
        
        ld a, [de]
        ld [hl+], a
        inc de
        
        ld a, [de]
        inc de
    push de
    push hl
    ; Load header 2
    ; A*5?
    ld b, a
    add a
    add a
    add b
    ld e, a
    ld d, $00
    ld hl, $4066
    add hl, de
    ld e, l
    ld d, h
    pop hl
    
    ld a, [de]
    ld [hl+], a
    
    inc de
    ld a, [de]
    ld [hl+], a
    
    inc de
    ld a, [de]
    ld [hl+], a
    
    inc de
    ld a, [de]
    ld [hl+], a
    
    inc de
    push hl
        ld bc, $000a
        add hl, bc
        ld a, [de]
        ld [hl], a
    pop hl
    ; Clear variables
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld e, l
    ld d, h
    
    pop hl
        ; Load another byte of enemy data
        ld a, [hl+]
    push hl

    ; A*3?
    ld b, a
    add a
    add b
    ld c, a
    ld b, $00
    ld hl, $409d
    add hl, bc
    ld a, [hl+]
    add a
    ld [de], a
    inc de
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    inc de
    ld a, [hl]
    ld [de], a
    dec de
    dec de
    dec de
    pop hl
        ; Load another byte of enemy data
        ld a, [hl+]
    push hl

    ; A*5
    ld b, a
    add a
    add a
    add b
    ld c, a
    ld b, $00
    ld hl, $40d6
    add hl, bc
    ld a, [hl+]
    ld [de], a
    inc de
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    inc de
    ld a, $01
    ld [de], a
    inc de
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl+]
    ld [de], a
    pop hl
jp Jump_000_287d ;} Save pointer to enemy data, and iterate over the next thing

; Try loading enemy (of some other variety?)
Jump_000_2945: ;{
    push hl
    ; Attempt to find empty slot for ???
    ld b, $05
    ld hl, $c2f6
    ld de, $000f
    .findLoop:
        bit 7, [hl]
            jp z, .break
        add hl, de
        dec b
    jr nz, .findLoop
    ; Unable to find enemy
    pop hl
    ld de, $000a ; Skip enemy and next bit of scroll data??
    add hl, de
    jp Jump_000_287d

    .break:
    pop de
    ; Load byte of enemy data
    ld a, [de]
    ld [hl+], a
    inc de
    
    xor a
    ld [hl+], a
    ; Load byte of enemy data
    ld a, [de]
    ld [hl+], a
    inc de
    
    xor a
    ld [hl+], a
    ; Load byte of enemy data
    ld a, [de]
    ld [hl+], a
    inc de
    ; Clear variables
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $81
    ld [hl+], a
    ; Load byte of enemy data
    ld a, [de]
    ld [hl+], a
    inc de
    ; Load byte of enemy data
    ld a, [de]
    ld [hl+], a
    inc de
    
    xor a
    ld [hl+], a
    ; Load byte of enemy data
    ld a, [de]
    ld [hl+], a
    inc de
    
    ld l, e
    ld h, d
jp Jump_000_287d ;} Save pointer to enemy data, and iterate over the next thing

devMessage_D: ; 00:2987 - Developer Message
; Shift-JIS Encoded
;  ｹﾞｰﾑﾎﾞｰｲ ﾉ ﾃﾄﾘｽ ﾊ ﾔｯﾊﾟﾘ ｵﾓｼﾛｲ!! 
;  ﾂｲ ｺﾅｲﾀﾞﾓ､ﾃﾂﾔﾃﾞ ﾀｲｾﾝﾃﾄﾘｽ ｦ ﾔｯﾃｼﾏｯﾀ････｡
; Translation per TCRF
;  Tetris on the Game Boy is still interesting!! 
;  Also, the other day, I ended up playing Tetris 
;  through the night...
    db $B9, $DE, $B0, $D1, $CE, $DE, $B0, $B2, $20, $C9, $20, $C3, $C4, $D8, $BD, $20
    db $CA, $20, $D4, $AF, $CA, $DF, $D8, $20, $B5, $D3, $BC, $DB, $B2, $21, $21, $20
    db $C2, $B2, $20, $BA, $C5, $B2, $C0, $DE, $D3, $A4, $C3, $C2, $D4, $C3, $DE, $20
    db $C0, $B2, $BE, $DD, $C3, $C4, $D8, $BD, $20, $A6, $20, $D4, $AF, $C3, $BC, $CF
    db $AF, $C0, $A5, $A5, $A5, $A5, $A1

; Iterate over enemies to do something
Call_000_29ce: ;{ 00:29CE
    ld a, $05
    ld [$c1a5], a
    ld hl, $c24e

    .loop:
        push hl
        ld a, h
        ld [$c2ef], a
        ld a, l
        ld [$c2ee], a
        ld a, [hl]
        bit 7, a
            jr z, .skipEnemy
        ; Copy enemy data to HRAM
        ld bc, $10a3
        .copyLoop_A:
            ld a, [hl+]
            ld [c], a
            inc c
            dec b
        jr nz, .copyLoop_A
    
        call Call_000_2a0f
        ; Copy enemy data back to WRAM
        pop hl
        ld bc, $10a3
        .copyLoop_B:
            ld a, [c]
            ld [hl+], a
            inc c
            dec b
        jr nz, .copyLoop_B
    
        ld de, $0010
        add hl, de
      .nextEnemy:
        ld a, [$c1a5]
        dec a
        ld [$c1a5], a
    jr nz, .loop
ret

.skipEnemy:
    pop hl
    ld de, $0020
    add hl, de
jr .nextEnemy ;}


Call_000_2a0f:
    ldh a, [$a3]
    bit 6, a
    jp nz, Jump_000_2da1

    ldh a, [$a4]
    and $7f
    jp nz, Jump_000_2d09

    ldh a, [$a9]
    add $04
    and $f8
    ld [$c2f5], a
    xor a
    ld [$c2f2], a
    ld hl, $ffac
    ld c, $a8
    ldh a, [$99]
    ld d, a
    ld a, [c]
    ld [$c2f0], a
    add [hl]
    ld [c], a
    inc hl
    inc c
    ld a, [c]
    ld [$c2f1], a
    adc [hl]
    sub d
    ld [c], a
    ldh a, [$ad]
    bit 7, a
    jr nz, jr_000_2a6e

    ldh a, [$a9]
    add $07
    ld e, a
    ldh a, [$a7]
    call Call_000_3a8d
    jr c, jr_000_2a66

    ldh a, [$a9]
    add $07
    ld e, a
    ldh a, [$a7]
    add $06
    call Call_000_3a8d
    jr nc, jr_000_2a6b

    ld hl, $c2f2
    set 5, [hl]

jr_000_2a66:
    ld hl, $c2f2
    set 4, [hl]

jr_000_2a6b:
    jp Jump_000_2a92


jr_000_2a6e:
    ldh a, [$a9]
    add $00
    ld e, a
    ldh a, [$a7]
    call Call_000_3a8d
    jr c, jr_000_2a8d

    ldh a, [$a9]
    add $03
    ld e, a
    ldh a, [$a7]
    add $06
    call Call_000_3a8d
    jr nc, jr_000_2a92

    ld hl, $c2f2
    set 5, [hl]

jr_000_2a8d:
    ld hl, $c2f2
    set 3, [hl]

Jump_000_2a92:
jr_000_2a92:
    ldh a, [$ab]
    bit 7, a
    jr nz, jr_000_2ac3

    ldh a, [$a9]
    add $01
    ld e, a
    ldh a, [$a7]
    add $08
    call Call_000_3a8d
    jr nc, jr_000_2aab

    ld hl, $c2f2
    set 0, [hl]

jr_000_2aab:
    ldh a, [$a9]
    add $06
    ld e, a
    ldh a, [$a7]
    add $08
    call Call_000_3a8d
    jr nc, jr_000_2abe

    ld hl, $c2f2
    set 1, [hl]

jr_000_2abe:
    ldh a, [$ab]
    and a
    jr nz, jr_000_2ae4

jr_000_2ac3:
    ldh a, [$a9]
    add $01
    ld e, a
    ldh a, [$a7]
    add $ff
    call Call_000_3a8d
    jr c, jr_000_2adf

    ldh a, [$a9]
    add $06
    ld e, a
    ldh a, [$a7]
    add $ff
    call Call_000_3a8d
    jr nc, jr_000_2ae4

jr_000_2adf:
    ld hl, $c2f2
    set 2, [hl]

jr_000_2ae4:
    ldh a, [$a3]
    bit 2, a
    jr nz, jr_000_2b02

    ld a, [$c2f2]
    and $24
    jr nz, jr_000_2b60

    ld a, [$c2f2]
    and $18
    jr z, jr_000_2b02

    ld hl, $ffac
    xor a
    sub [hl]
    ld [hl+], a
    ld a, $00
    sbc [hl]
    ld [hl], a

jr_000_2b02:
    ldh a, [$a3]
    bit 0, a
    jr z, jr_000_2b2b

    ld a, [$c2f2]
    and $03
    jr z, jr_000_2b2b

    xor $03
    jr z, jr_000_2b2b

    ldh a, [$b1]
    bit 0, a
    jr nz, jr_000_2b31

    ld hl, $ffac
    xor a
    sub [hl]
    ld [hl+], a
    ld a, $00
    sbc [hl]
    ld [hl], a
    ldh a, [$b1]
    set 0, a
    ldh [$b1], a
    jr jr_000_2b31

jr_000_2b2b:
    ldh a, [$b1]
    res 0, a
    ldh [$b1], a

jr_000_2b31:
    ld a, [$c2f2]
    bit 2, a
    jr z, jr_000_2b3e

    ldh a, [$ab]
    bit 7, a
    jr nz, jr_000_2b4b

jr_000_2b3e:
    ld hl, $ffaa
    ld c, $a6
    ld a, [c]
    add [hl]
    ld [c], a
    inc hl
    inc c
    ld a, [c]
    adc [hl]
    ld [c], a

jr_000_2b4b:
    ld a, [$c2f2]
    and $1c
    jr z, jr_000_2b60

    ld a, [$c2f0]
    ldh [$a8], a
    ldh a, [$99]
    ld d, a
    ld a, [$c2f1]
    sub d
    ldh [$a9], a

jr_000_2b60:
    ld a, [$c2f2]
    bit 2, a
    jr z, jr_000_2b74

    ldh a, [$ab]
    bit 7, a
    jr z, jr_000_2b74

    ld a, $80
    ldh [$aa], a
    xor a
    ldh [$ab], a

jr_000_2b74:
    ld a, [$c2f2]
    and $03
    jr z, jr_000_2b8d

    xor a
    ldh [$a6], a
    ldh [$aa], a
    ld a, $01
    ldh [$ab], a
    ldh a, [$a7]
    and $f8
    ldh [$a7], a
    jp Jump_000_2ba6


jr_000_2b8d:
    ldh a, [$aa]
    add $10
    ldh [$aa], a
    ldh a, [$ab]
    adc $00
    bit 7, a
    jr nz, jr_000_2ba4

    cp $07
    jr c, jr_000_2ba4

    xor a
    ldh [$aa], a
    ld a, $02

jr_000_2ba4:
    ldh [$ab], a

Jump_000_2ba6:
    ldh a, [$a3]
    bit 1, a
    jr z, jr_000_2bde

    ld hl, $ffad
    ld a, [hl-]
    bit 7, a
    jr nz, jr_000_2bcb

    ld a, [$c2f2]
    and $03
    xor $01
    jr nz, jr_000_2bde

    xor a
    sub [hl]
    ldh [$aa], a
    inc hl
    ld a, $00
    sbc [hl]
    add $ff
    ldh [$ab], a
    jr jr_000_2c14

jr_000_2bcb:
    ld a, [$c2f2]
    and $03
    xor $02
    jr nz, jr_000_2bde

    ld a, [hl+]
    ldh [$aa], a
    ld a, [hl]
    add $ff
    ldh [$ab], a
    jr jr_000_2c14

jr_000_2bde:
    ldh a, [$a3]
    bit 2, a
    jr z, jr_000_2c14

    ld hl, $ffad
    ld a, [hl-]
    bit 7, a
    jr nz, jr_000_2c03

    ld a, [$c2f2]
    and $1b
    xor $13
    jr nz, jr_000_2c14

    xor a
    sub [hl]
    ldh [$aa], a
    inc hl
    ld a, $00
    sbc [hl]
    add $ff
    ldh [$ab], a
    jr jr_000_2c14

jr_000_2c03:
    ld a, [$c2f2]
    and $1b
    xor $0b
    jr nz, jr_000_2c14

    ld a, [hl+]
    ldh [$aa], a
    ld a, [hl]
    add $ff
    ldh [$ab], a

jr_000_2c14:
    ldh a, [$a3]
    bit 2, a
    jr z, jr_000_2c3c

    ld a, [$c2f5]
    ld c, a
    ldh a, [$a9]
    add $04
    and $f8
    cp c
    jr nz, jr_000_2c3c

    ldh a, [$b0]
    dec a
    ldh [$b0], a
    jr nz, jr_000_2c40

    ldh a, [$ac]
    cpl
    add $01
    ldh [$ac], a
    ldh a, [$ad]
    cpl
    adc $00
    ldh [$ad], a

jr_000_2c3c:
    ld a, $40
    ldh [$b0], a

jr_000_2c40:
    ldh a, [$a7]
    cp $10
    jr nc, jr_000_2c49

    xor a
    ldh [$a3], a

Jump_000_2c49:
jr_000_2c49:
    ldh a, [$a9]
    add $28
    cp $08
    jr nc, jr_000_2c54

    xor a
    ldh [$a3], a

jr_000_2c54:
    ldh a, [$a7]
    ld b, a
    ldh a, [$a9]
    add $10
    ld c, a
    push bc
    call $4e7f
    pop bc
    ldh a, [$b2]
    and a
    jr z, jr_000_2c8f

    dec a
    ldh [$b2], a
    jr nz, jr_000_2c8f

    ld a, [$c2ee]
    ld l, a
    ld a, [$c2ef]
    ld h, a
    ld de, $0011
    add hl, de
    ld a, [hl+]
    add a
    ldh [$b2], a
    ld a, $00
    rla
    ld [$c24d], a
    push bc
    ld a, [hl+]
    add b
    ld b, a
    ld a, [hl]
    call Call_000_2cfd
    ld a, $13
    call $4de8
    pop bc

jr_000_2c8f:
    ld a, [$c2ee]
    ld l, a
    ld a, [$c2ef]
    ld h, a
    ld de, $0014
    add hl, de
    ld a, [hl]
    and $7f
    jr z, jr_000_2cdf

    cp $7f
    jr z, jr_000_2ce7

    ld a, [hl]
    dec a
    ld [hl+], a
    jr nz, jr_000_2cb0

    ld a, [hl]
    xor $80
    ld [hl-], a
    and $7f
    ld [hl+], a

jr_000_2cb0:
    ld de, $0000
    ld a, [hl+]
    add a
    rl e
    ld a, [$c2f2]
    and $03
    jr nz, jr_000_2cc0

    ld e, $02

jr_000_2cc0:
    add hl, de
    ld e, [hl]
    push de
    push bc
    ld a, $f8
    add b
    ld b, a
    ld a, $f0
    add c
    ld c, a
    call Call_000_3af3
    pop bc
    pop de
    ld d, a
    ldh a, [$ad]
    and $80
    srl a
    srl a
    or d
    call drawMetasprite
    ret


jr_000_2cdf:
    inc hl
    inc hl
    ld e, [hl]
    xor a
    call drawMetasprite
    ret


jr_000_2ce7:
    inc hl
    inc hl
    ld e, [hl]
    ldh a, [$a9]
    add $18
    ld l, a
    ldh a, [$91]
    add $18
    sub l
    rra
    rra
    rra
    and $20
    call drawMetasprite
    ret


Call_000_2cfd:
    bit 7, a
    jr nz, jr_000_2d05

    call $4ee8
    ret


jr_000_2d05:
    call $4f7c
    ret


Jump_000_2d09:
    ldh a, [$a4]
    and $7f
    cp $01
    jr nz, jr_000_2d54

    ld a, $03
    ld [$c2f2], a
    ldh a, [$a7]
    sub $10
    cp $0f
    jr nc, jr_000_2d2f

    xor a
    ldh [$a6], a
    ldh a, [$a7]
    and $f8
    ldh [$a7], a
    ldh a, [$ac]
    ldh [$aa], a
    ldh a, [$ad]
    ldh [$ab], a

jr_000_2d2f:
    ld hl, $ffaa
    ldh a, [$a6]
    add [hl]
    ldh [$a6], a
    inc hl
    ldh a, [$a7]
    adc [hl]
    ldh [$a7], a
    ldh a, [$99]
    ld d, a
    ldh a, [$a9]
    sub d
    ldh [$a9], a
    ldh a, [$aa]
    add $10
    ldh [$aa], a
    ldh a, [$ab]
    adc $00
    ldh [$ab], a
    jp Jump_000_2c49


jr_000_2d54:
    ldh a, [$a4]
    and $7e
    cp $02
    jr nz, jr_000_2d9e

    ldh a, [$a4]
    and $01
    jr nz, jr_000_2d75

    ld a, $03
    ld [$c2f2], a
    ldh a, [$a6]
    ldh [$aa], a
    ldh a, [$a7]
    ldh [$ab], a
    ldh a, [$a4]
    inc a
    ldh [$a4], a
    ret


jr_000_2d75:
    ldh a, [$99]
    ld d, a
    ld hl, $ffac
    ldh a, [$a8]
    add [hl]
    ldh [$a8], a
    inc hl
    ldh a, [$a9]
    adc [hl]
    sub d
    ldh [$a9], a
    ldh a, [$ae]
    add $03
    ldh [$ae], a
    ld d, $00
    ld e, a
    ld hl, table_001_7F00
    add hl, de
    ld a, [hl]
    ld b, a
    ldh a, [$ab]
    sub b
    ldh [$a7], a
    jp Jump_000_2c49


jr_000_2d9e:
    jp Jump_000_2c49


Jump_000_2da1:
    ldh a, [$99]
    ld d, a
    ldh a, [$a7]
    ld b, a
    ldh a, [$a9]
    sub d
    ldh [$a9], a
    add $10
    ld c, a
    ldh a, [$a5]
    and a
    jr z, jr_000_2dd0

    dec a
    ldh [$a5], a
    srl a
    srl a
    ld e, a
    ld d, $00
    ld hl, $2dc8
    add hl, de
    ld e, [hl]
    xor a
    call drawMetasprite
    ret


    db $0f, $0e, $0d, $0c

    dec c
    inc c
    dec c
    inc c

jr_000_2dd0:
    xor a
    ldh [$a3], a
    ret


    ld [$c1a6], a
    ld a, [$c0c5]
    bit 7, a
    jp nz, Jump_000_2ec4

    ld a, $05
    ld [$c1a8], a
    ld hl, $c24e

jr_000_2de7:
    ld a, h
    ld [$c2ef], a
    ld a, l
    ld [$c2ee], a
    ld a, [hl+]
    push hl
    bit 6, a
    jr nz, jr_000_2e2a

    bit 7, a
    jr z, jr_000_2e2a

    ld de, $000f
    add hl, de
    ld a, [hl]
    rra
    rra
    and $1c
    ld d, $00
    ld e, a
    ld hl, $2ea4
    add hl, de
    pop de
    push de
    push hl
    ld hl, $0003
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld a, [de]
    add [hl]
    cp b
    jr nc, jr_000_2e2a

    inc hl
    add [hl]
    cp b
    jr c, jr_000_2e2a

    inc hl
    inc de
    inc de
    ld a, [de]
    add [hl]
    cp c
    jr nc, jr_000_2e2a

    inc hl
    add [hl]
    cp c
    jr nc, jr_000_2e3b

jr_000_2e2a:
    pop hl
    ld de, $001f
    add hl, de
    ld a, [$c1a8]
    dec a
    ld [$c1a8], a
    jr nz, jr_000_2de7

    xor a
    scf
    ret


jr_000_2e3b:
    pop hl
    inc hl
    ld a, [$c1a6]
    ld e, a
    ld a, [hl]
    sub e
    ld [hl-], a
    dec hl
    jr c, jr_000_2e87

    push hl
    ld de, $0013
    add hl, de
    bit 6, [hl]
    jr z, jr_000_2e7e

    pop hl
    ld de, $0004
    add hl, de
    ld a, [hl+]
    ld b, a
    inc hl
    ld a, [hl]
    add $10
    ld c, a
    ld de, $000b
    add hl, de
    push bc
    ld a, [hl+]
    add a
    ld a, $00
    rla
    ld [$c24d], a
    ld a, [hl+]
    add b
    ld b, a
    ld a, [hl]
    call Call_000_2cfd
    ld a, $13
    call $4de8
    pop bc
    ld a, $21
    call playSound
    ld a, $fd
    ret


jr_000_2e7e:
    ld a, $21
    call playSound
    pop hl
    ld a, $fe
    ret


jr_000_2e87:
    set 6, [hl]
    inc hl
    inc hl
    ld a, $10
    ld [hl-], a
    dec hl
    ld de, $0010
    add hl, de
    ld a, [hl]
    and $0f
    call Call_000_1a1b
    ld a, $1c
    call playSound
    ld a, $ff
    ret


    ld a, $fc
    ret


    db $f8, $09, $0c, $0e, $f0, $12, $0b, $10

    ld hl, sp+$0e
    inc c
    ld c, $f8
    ld c, $0c
    ld c, $f8
    ld c, $0c
    ld c, $f8
    ld c, $0c
    ld c, $f8
    ld c, $0c
    ld c, $f8
    ld c, $0c
    db $0e

Jump_000_2ec4:
    ld a, [$c1a6]
    cp $08
    jr c, jr_000_2ef0

    ld a, [$c341]
    bit 7, a
    jr z, jr_000_2ef0

    ld hl, $c354
    ld a, [$c345]
    add [hl]
    add $04
    cp b
    jr nc, jr_000_2ef0

    add $10
    cp b
    jr c, jr_000_2ef0

    ld a, [$c347]
    add $0c
    cp c
    jr nc, jr_000_2ef0

    add $05
    cp c
    jr nc, jr_000_2ef3

jr_000_2ef0:
    xor a
    scf
    ret


jr_000_2ef3:
    ld hl, $c354
    ld a, [$c345]
    add [hl]
    add $09
    cp b
    jr c, jr_000_2f25

    ld hl, $c34c
    ld a, [hl+]
    or [hl]
    jr z, jr_000_2f08

    xor a
    ret


jr_000_2f08:
    ld a, [$c353]
    sub $0c
    ld [$c353], a
    jr c, jr_000_2f42

    call Call_000_2f81
    ld a, $1b
    call playSound
    ld a, [$c356]
    inc a
    ld [$c356], a
    xor a
    ld a, $60
    ret


jr_000_2f25:
    ld a, [$c353]
    sub $01
    ld [$c353], a
    jr c, jr_000_2f42

    call Call_000_2f9e
    ld a, $21
    call playSound
    ld a, [$c357]
    inc a
    ld [$c357], a
    xor a
    ld a, $20
    ret


jr_000_2f42:
    ld a, [currentLevel]
    cp $0c
    jr z, jr_000_2f50

    ld a, $15
    call playSound
    jr jr_000_2f57

jr_000_2f50:
    ld a, $2b
    call playSound
    jr jr_000_2f57

jr_000_2f57:
    ld a, $40
    ld [$c341], a
    xor a
    ld [$c342], a
    ld [$c348], a
    ld a, $fd
    ld [$c349], a
    call Call_000_2f9e
    ld hl, $3000
    call Call_000_19fa
    ld a, [currentLevel]
    cp $0c
    jr nz, jr_000_2f7e

    ld hl, $5000
    call Call_000_19fa

jr_000_2f7e:
    ld a, $f0
    ret


Call_000_2f81:
    ld a, [$c0eb]
    bit 7, a
    jr z, jr_000_2f93

    ld a, $01
    ld [$c34c], a
    ld a, $ff
    ld [$c34d], a
    ret


jr_000_2f93:
    ld a, $ff
    ld [$c34c], a
    ld a, $00
    ld [$c34d], a
    ret


Call_000_2f9e:
    ld a, [$c0eb]
    bit 7, a
    jr z, jr_000_2fbd

    ld a, [$c34d]
    cp $ff
    jr nz, jr_000_2fb2

    ld a, [$c34c]
    cp $c0
    ret c

jr_000_2fb2:
    ld a, $c0
    ld [$c34c], a
    ld a, $ff
    ld [$c34d], a
    ret


jr_000_2fbd:
    ld a, [$c34d]
    and a
    jr nz, jr_000_2fc9

    ld a, [$c34c]
    cp $40
    ret nc

jr_000_2fc9:
    ld a, $40
    ld [$c34c], a
    ld a, $00
    ld [$c34d], a
    ret


Call_000_2fd4:
    ld a, $05
    ld [$c1a5], a
    ld hl, $c24e

jr_000_2fdc:
    ld a, [hl]
    bit 7, a
    jr z, jr_000_2fea

    push hl
    set 6, [hl]
    inc hl
    inc hl
    ld a, $10
    ld [hl-], a
    pop hl

jr_000_2fea:
    ld de, $0020
    add hl, de
    ld a, [$c1a5]
    dec a
    ld [$c1a5], a
    jr nz, jr_000_2fdc

    ret


timerOverflowInterruptHandler: ;{ 00:2FF8
    ei
    push af
    ldh a, [$a2]
    and a
        jr nz, .exit

    dec a
    ldh [$a2], a
    push bc
    push de
    push hl
    di
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $02
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ei
    call $40a9
    di
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ei
    xor a
    ldh [$a2], a
    pop hl
    pop de
    pop bc

.exit:
    pop af
ret ;}


stopSound: ; 00:3028 - Clear music
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $02
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call $4036
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ld a, $ff
    ldh [rNR50], a
    ldh [rNR51], a
    ldh [rNR52], a
    xor a
    ldh [$a2], a
ret


Call_000_304b: ; 00:304B - Init Sound?
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $02
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    call $4000
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ld a, $ff
    ldh [rNR50], a
    ldh [rNR51], a
    ldh [rNR52], a
    xor a
    ldh [$a2], a
ret


Call_000_306e:
    di
    ldh a, [hCurrentBank]
    push af
    ld a, $02
    ld [$2000], a
    ldh [hCurrentBank], a
    ei
    call $4066
    di
    pop af
    ld [$2000], a
    ldh [hCurrentBank], a
    ei
    xor a
    ldh [$a2], a
    ret


Call_000_3089:
    call Call_000_30dc
    ret


playSound: ; 00:308D - Load song [A]
    push bc
    ld b, a
    di
        ldh a, [hCurrentBank]
        push af
        ld a, $02
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    ld a, b
    call Call_000_30ea
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
    pop bc
ret


loadLevel_pickSong: ; 00:30A9
    call stopSound
    ld a, [currentLevel]
    ld d, $00
    ld e, a
    ld hl, stage_songList
    add hl, de
    ld a, [hl]
    call playSound
ret

stage_songList: ; 00:30BB
    db $01, $02, $0c, $0c, $03, $02, $0b, $0b, $0d, $0d, $0f, $0f, $03
    db $01, $01, $01, $01, $01, $01
    

    push hl
    push af
    ld hl, $c807
    ld a, $0a
    ld [hl+], a
    ld [hl+], a
    xor a
    ld [hl+], a
    pop af
    pop hl
ret


Call_000_30dc:
    push hl
    push af
    ld hl, $c807
    xor a
    ld [hl+], a
    ld [hl+], a
    ld a, $14
    ld [hl+], a
    pop af
    pop hl
    ret


Call_000_30ea:
    push bc
    push de
    push hl
    add a
    ld e, a
    ld d, $00
    ld hl, $46d6
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld a, [$c80a]
    and $80
    jr nz, jr_000_310d

    xor a
    ldh [$d0], a

jr_000_3102:
    ld a, [hl+]
    ldh [$d2], a
    cp $ff
    jr nz, jr_000_3111

    ld a, $ff
    ldh [$d0], a

jr_000_310d:
    pop hl
    pop de
    pop bc
    ret


jr_000_3111:
    push hl
    add a
    add a
    ld c, a
    ld b, $00
    add a
    add a
    add a
    ld l, a
    ld h, $00
    add hl, bc
    ld bc, $c833
    add hl, bc
    ld a, [hl]
    and $80
    jr z, jr_000_312e

    inc hl
    ld b, $c8
    ld c, [hl]
    xor a
    ld [bc], a
    dec hl

jr_000_312e:
    ld a, $80
    ld [hl+], a
    pop de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    xor a
    ld [hl+], a
    inc a
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, $80
    ld [hl], a
    ld bc, $0008
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl], a
    ld bc, $0007
    add hl, bc
    ld a, $88
    ld [hl], a
    ld bc, $0008
    add hl, bc
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld h, d
    ld l, e
    jr jr_000_3102

Call_000_3160:
    ld a, $01
    ldh [$9e], a
    ld a, $01
    ldh [$9f], a
    ldh [$a0], a
    ld a, $80
    ldh [$92], a
    xor a
    ldh [$93], a
    ld a, $e0
    ldh [$8f], a
    ld a, $0c
    ldh [$91], a
    xor a
    ldh [$a1], a
    ld [$c0d2], a
    ld [$c0d3], a
    ld [$c105], a
    ld [$c0d4], a
    dec a
    ld [$c0d0], a
    ld a, $10
    ld [$c0d1], a
    ret


Call_000_3192:
    ld a, [$c104]
    ld b, a
    ldh a, [$9e]
    and b
    ldh [$9e], a
    and $78
    ld hl, $c105
    or [hl]
    ldh [$9e], a
    ldh a, [$8c]
    bit 4, a
    jr z, jr_000_31b1

    ldh a, [$9e]
    and $5c
    or $80
    ldh [$9e], a

jr_000_31b1:
    ldh a, [$8c]
    bit 5, a
    jr z, jr_000_31bf

    ldh a, [$9e]
    and $5c
    or $a0
    ldh [$9e], a

jr_000_31bf:
    ldh a, [$9e]
    bit 6, a
    jr z, jr_000_31e7

    ldh a, [$91]
    ld e, a
    add $ff
    ldh a, [$8f]
    add $07
    call Call_000_3a8d
    jr c, jr_000_31ed

    ldh a, [$91]
    add $06
    ld e, a
    ldh a, [$8f]
    add $07
    call Call_000_3a8d
    jr c, jr_000_31ed

    ldh a, [$9e]
    and $bc
    ldh [$9e], a

jr_000_31e7:
    ldh a, [$8c]
    bit 7, a
    jr z, jr_000_31f5

jr_000_31ed:
    ldh a, [$9e]
    and $bc
    or $40
    ldh [$9e], a

jr_000_31f5:
    ldh a, [$9e]
    and $80
    jr z, jr_000_3213

    ldh a, [$a0]
    dec a
    ldh [$a0], a
    jr nz, jr_000_3213

    ld a, $08
    ldh [$a0], a
    ldh a, [$9f]
    dec a
    ldh [$9f], a
    jr nz, jr_000_3213

    ld a, $04
    ldh [$9f], a
    jr jr_000_3213

jr_000_3213:
    ldh a, [$9f]
    dec a
    ld d, a
    ldh a, [$9e]
    and $1c
    or d
    ld d, $00
    ld e, a
    ld hl, $32a6
    add hl, de
    ld e, [hl]
    ldh a, [$9e]
    and $9c
    jr nz, jr_000_322c

    ld e, $00

jr_000_322c:
    ldh a, [$9e]
    bit 6, a
    jr z, jr_000_323e

    ld d, $00
    ldh a, [$9f]
    dec a
    ld e, a
    ld hl, $32c6
    add hl, de
    ld a, [hl]
    ld e, a

jr_000_323e:
    ldh a, [$a1]
    and a
    jr z, jr_000_324a

    dec a
    ldh [$a1], a
    and $04
    jr z, jr_000_3272

jr_000_324a:
    ldh a, [$9e]
    bit 6, a
    jr z, jr_000_3257

    and $18
    jr z, jr_000_3257

    ld a, $07
    ld e, a

jr_000_3257:
    ldh a, [$8f]
    ld b, a
    ldh a, [$91]
    ld c, a
    push de
    ld a, [$c0c3]
    and $80
    push bc
    call Call_000_3af3
    pop bc
    pop de
    ld d, a
    ldh a, [$9e]
    and $20
    or d
    call drawMetasprite

jr_000_3272:
    ldh a, [$91]
    add $04
    ld e, a
    ldh a, [$8f]
    add $0a
    call Call_000_3a8d
    ldh [$9b], a
    cp $3f
    ret z

    and $f0
    cp $30
    jr z, jr_000_32ca

    ldh a, [$9e]
    bit 6, a
    ret nz

    ldh a, [$91]
    add $04
    ld e, a
    ldh a, [$8f]
    add $03
    call Call_000_3a8d
    ldh [$9b], a
    cp $3f
    ret z

    and $f0
    cp $30
    jr z, jr_000_32ca

    ret


    db $01, $02, $03, $02

    dec b
    dec b
    dec b
    dec b

    db $04, $04, $04, $04

    dec b
    dec b
    dec b
    dec b

    db $04, $04, $04, $04

    dec b
    dec b
    dec b
    dec b

    db $04, $04, $04, $04

    dec b
    dec b
    dec b
    dec b

    db $06, $07, $06, $07

jr_000_32ca:
    ld a, $80
    ld [hl], a
    ld c, l
    ld b, h
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld d, $4c
    swap c
    ld e, c
    sla e
    rl d
    ld a, e
    and $e0
    ld e, a
    ld a, c
    and $0f
    or e
    srl b
    jr nc, jr_000_32f0
        set 4, a
    jr_000_32f0:
    add $40
    ld e, a
    ld a, d
    adc $00
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, $80
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $04
    ld [$cb01], a
    ldh a, [$9b]
    and $0f
    add a
    ld e, a
    ld d, $00
    ld hl, table_000_3319
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

table_000_3319:
    dw $3339
    dw $3349
    dw $335A
    dw $336B
    dw $337C
    dw $338D
    dw $3399
    dw $33AA
    dw $33BD
    dw $33CC
    dw $33DB
    dw $33F1
    dw $3403
    dw $342E
    dw $3442
    dw $3442


    xor a
    call Call_000_1966
    ld hl, $0100
    call Call_000_19fa
    ld a, $18
    call playSound
    ret


    ld a, $01
    call Call_000_1966
    ld hl, $0100
    call Call_000_19fa
    ld a, $18
    call playSound
    ret


    ld a, $02
    call Call_000_1966
    ld hl, $0100
    call Call_000_19fa
    ld a, $18
    call playSound
    ret


    ld a, $03
    call Call_000_1966
    ld hl, $0100
    call Call_000_19fa
    ld a, $18
    call playSound
    ret


    ld a, $04
    call Call_000_1966
    ld hl, $0100
    call Call_000_19fa
    ld a, $18
    call playSound
    ret


    ld hl, $0500
    call Call_000_19fa
    ld a, $19
    call playSound
    ret


    ld a, $05
    call Call_000_1966
    ld hl, $0100
    call Call_000_19fa
    ld a, $19
    call playSound
    ret


    ld a, $28
    call playSound
    ld a, [$c0c8]
    cp $04
    ret z

    inc a
    ld [$c0c8], a
    call Call_000_19c1
    ret


    ld hl, $0010
    call Call_000_19fa
    call $4c62
    ld a, $19
    call playSound
    ret


    ld hl, $0050
    call Call_000_19fa
    call Call_000_2fd4
    ld a, $1b
    call playSound
    ret


    ld a, $19
    call playSound
    ld a, [$c1a2]
    inc a
    cp $08
    ret nc

    ld [$c1a2], a
    ld a, [$c117]
    call Call_000_1966
    ret


    ld a, [$c0f8]
    add $02
    cp $12
    jr nc, jr_000_33fd

    ld [$c0f8], a

jr_000_33fd:
    ld a, $19
    call playSound
    ret


    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $98
    ld [hl+], a
    ld a, $2f
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, [playerLives]
    inc a
    ld [playerLives], a
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $04
    ld [$cb01], a
    ld a, $29
    call playSound
    ret


    ld a, $1a
    call playSound
    ld a, [$c1a2]
    dec a
    ret z

    ld [$c1a2], a
    ld a, [$c117]
    call Call_000_1966
    ret


    ret


Call_000_3443:
    ld a, $06
    ldh [$a0], a
    xor a
    ldh [$9f], a
    ld bc, $0080
    ldh a, [$9e]
    bit 5, a
    jr nz, jr_000_3456

    ld bc, $ff80

jr_000_3456:
    ld a, c
    ldh [$94], a
    ld a, b
    ldh [$95], a
    xor a
    ld [$c0ca], a
    ldh [$99], a
    ldh [$92], a
    ld a, $fd
    ldh [$93], a
    ld a, [$c0c9]
    cp $40
    jr nz, jr_000_3478

    ld a, $01
    ldh [$93], a
    ld a, $80
    ld [$c0ca], a

jr_000_3478:
    ld a, $40
    ld [$c0cb], a
    ldh a, [$90]
    ld [$c0ce], a
    ldh a, [$91]
    ld [$c0cf], a
    ldh a, [$8e]
    ld [$c0cc], a
    ldh a, [$8f]
    ld [$c0cd], a
    call $4c1d
    ret


Call_000_3495:
    ld a, [$c0ca]
    and $fe
    cp $fe
    jp z, Jump_000_2421

    ld a, [$c0ca]
    bit 7, a
    jp nz, Jump_000_3525

    ldh a, [$a0]
    dec a
    ldh [$a0], a
    jr nz, jr_000_34be

    ld a, $05
    ldh [$a0], a
    ldh a, [$9f]
    inc a
    ldh [$9f], a
    cp $03
    jr c, jr_000_34be

    dec a
    ldh [$9f], a

jr_000_34be:
    ldh a, [$94]
    ld e, a
    ldh a, [$95]
    ld d, a
    ld a, [$c0ce]
    ld l, a
    ld a, [$c0cf]
    ld h, a
    add hl, de
    ld a, l
    ld [$c0ce], a
    ld a, h
    ld [$c0cf], a
    call Call_000_23ea
    ldh a, [$92]
    ld e, a
    ldh a, [$93]
    ld d, a
    ld a, [$c0cc]
    ld l, a
    ld a, [$c0cd]
    ld h, a
    add hl, de
    ld a, l
    ld [$c0cc], a
    ld a, h
    ld [$c0cd], a
    ld bc, $0020
    ld hl, $ff92
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl+], a
    ld d, $00
    ldh a, [$9f]
    ld e, a
    ld hl, $3533
    add hl, de
    ld a, [hl]
    ld e, a
    ld a, [$c0cd]
    ld b, a
    ld a, [$c0cf]
    ld c, a
    ldh a, [$9e]
    xor $20
    and $20
    call drawMetasprite
    ld a, [$c0cd]
    add $08
    cp $20
    ret nc

    ld a, $80
    ld [$c0ca], a
    ret


Jump_000_3525:
    ld a, [$c0cb]
    dec a
    ld [$c0cb], a
    ret nz

    ld a, $c0
    ld [$c0ca], a
    ret


    db $08, $09, $0a

    dec bc
    dec bc

Call_000_3538:
    ld hl, $c0ca
    dec [hl]
    ret


Call_000_353d:
    ld a, $10
    ldh [$92], a
    xor a
    ldh [$93], a
    inc a
    ldh [$9c], a
    ldh a, [$98]
    ld [$c0ef], a
    ret


Call_000_354d:
    ldh a, [$8c]
    and $30
    ld b, a
    jr z, jr_000_355a

    ld a, [$c0d0]
    cp b
    jr z, jr_000_3569

jr_000_355a:
    ld a, b
    ld [$c0d0], a
    ld a, $0c
    ld [$c0d1], a

jr_000_3563:
    xor a
    ld [$c0d2], a
    jr jr_000_35ac

jr_000_3569:
    ld a, [$c0d1]
    and a
    jr z, jr_000_3575

    dec a
    ld [$c0d1], a
    jr jr_000_3563

jr_000_3575:
    ldh a, [$92]
    ld b, a
    ldh a, [$92]
    ld c, a
    ld a, [$c0d5]
    cp c
    jr nz, jr_000_35ac

    cp b
    jr nz, jr_000_35ac

    cp $80
    jr nz, jr_000_35ac

    ldh a, [$93]
    ld b, a
    ld a, [$c0d4]
    cp b
    jr nz, jr_000_35ac

    cp $00
    jr nz, jr_000_35ac

    ldh a, [$90]
    ld b, a
    ld a, [$c0d6]
    cp b
    jr nz, jr_000_35a7

    ldh a, [$91]
    ld b, a
    ld a, [$c0d7]
    cp b
    jr z, jr_000_35ac

jr_000_35a7:
    ld a, $01
    ld [$c0d2], a

jr_000_35ac:
    ld a, [$c0d3]
    ld [$c0d5], a
    ldh a, [$92]
    ld [$c0d3], a
    ldh a, [$93]
    ld [$c0d4], a
    ldh a, [$90]
    ld [$c0d6], a
    ldh a, [$91]
    ld [$c0d7], a
    ldh a, [$9e]
    bit 3, a
    jr nz, jr_000_35fd

    xor a
    ldh [$94], a
    ldh [$95], a
    ld hl, $ff91
    ldh a, [$8c]
    bit 4, a
    jr z, jr_000_35e0

    xor a
    ldh [$94], a
    inc a
    ldh [$95], a

jr_000_35e0:
    ldh a, [$8c]
    bit 5, a
    jr z, jr_000_35ec

    xor a
    ldh [$94], a
    dec a
    ldh [$95], a

jr_000_35ec:
    ldh a, [$9e]
    bit 6, a
    jr z, jr_000_35fa

    ld hl, $ff95
    sra [hl]
    dec hl
    rr [hl]

jr_000_35fa:
    jp Jump_000_3665


jr_000_35fd:
    ldh a, [$94]
    and a
    jr nz, jr_000_3607

    ldh a, [$95]
    and a
    jr z, jr_000_3627

jr_000_3607:
    ldh a, [$95]
    bit 7, a
    jr z, jr_000_361b

    ldh a, [$94]
    add $03
    ldh [$94], a
    ldh a, [$95]
    adc $00
    ldh [$95], a
    jr jr_000_3627

jr_000_361b:
    ldh a, [$94]
    sub $03
    ldh [$94], a
    ldh a, [$95]
    sbc $00
    ldh [$95], a

jr_000_3627:
    ldh a, [$8c]
    bit 4, a
    jr z, jr_000_3646

    ldh a, [$94]
    add $10
    ldh [$94], a
    ldh a, [$95]
    adc $00
    ldh [$95], a
    and a
    jr z, jr_000_3646

    cp $ff
    jr z, jr_000_3646

    xor a
    ldh [$94], a
    inc a
    ldh [$95], a

jr_000_3646:
    ldh a, [$8c]
    bit 5, a
    jr z, jr_000_3665

    ldh a, [$94]
    sub $10
    ldh [$94], a
    ldh a, [$95]
    sbc $00
    ldh [$95], a
    and a
    jr z, jr_000_3665

    cp $ff
    jr z, jr_000_3665

    xor a
    ldh [$94], a
    dec a
    ldh [$95], a

Jump_000_3665:
jr_000_3665:
    ldh a, [$94]
    ld e, a
    ldh a, [$95]
    ld d, a
    ldh a, [$90]
    ld l, a
    ldh a, [$91]
    ld h, a
    add hl, de
    ld a, h
    cp $f0
    jr c, jr_000_367d

    ld hl, $0000
    jp Jump_000_372f


jr_000_367d:
    ldh a, [$95]
    bit 7, a
    jr nz, jr_000_36ca

    ld a, [$c0d2]
    ld b, a
    ldh a, [$9e]
    bit 6, a
    jr nz, jr_000_36a1

    push hl
    push de
    ldh a, [$91]
    add b
    add $07
    ld e, a
    ldh a, [$8f]
    add $03
    call Call_000_3a8d
    pop de
    pop hl
    jp c, Jump_000_3737

jr_000_36a1:
    push hl
    push de
    ldh a, [$91]
    add b
    add $07
    ld e, a
    ldh a, [$8f]
    add $08
    call Call_000_3a8d
    pop de
    pop hl
    jp c, Jump_000_3737

    push hl
    push de
    ldh a, [$91]
    add b
    add $07
    ld e, a
    ldh a, [$8f]
    add $0f
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3737

    jr jr_000_3706

jr_000_36ca:
    ldh a, [$9e]
    bit 6, a
    jr nz, jr_000_36e2

    push hl
    push de
    ldh a, [$91]
    add $ff
    ld e, a
    ldh a, [$8f]
    add $03
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3737

jr_000_36e2:
    push hl
    push de
    ldh a, [$91]
    add $ff
    ld e, a
    ldh a, [$8f]
    add $08
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3737

    push hl
    push de
    ldh a, [$91]
    add $ff
    ld e, a
    ldh a, [$8f]
    add $0f
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3737

jr_000_3706:
    ld a, h
    cp $50
    jr c, jr_000_372f

    ldh a, [$98]
    cp $09
    jr z, jr_000_3715

    jr nc, jr_000_372f

    jr jr_000_371b

jr_000_3715:
    ldh a, [$97]
    cp $60
    jr nc, jr_000_372f

jr_000_371b:
    ld a, h
    sub $50
    ld d, a
    ld h, $50
    ldh a, [$97]
    add d
    ldh [$97], a
    ldh a, [$98]
    adc $00
    ldh [$98], a
    ld [$c0ea], a

Jump_000_372f:
jr_000_372f:
    ld a, l
    ldh [$90], a
    ld a, h
    ldh [$91], a
    jr jr_000_373c

Jump_000_3737:
jr_000_3737:
    xor a
    ldh [$94], a
    ldh [$95], a

jr_000_373c:
    ld a, [$c0ef]
    ld e, a
    and $f8
    ld c, a
    ldh a, [$97]
    ld d, a
    sub e
    ldh [$99], a
    ld a, d
    and $f8
    cp c
    call nz, Call_000_3a49

Call_000_3750:
    ldh a, [$8d]
    bit 0, a
    jr z, jr_000_3784

    ld a, [$c104]
    bit 4, a
    jr z, jr_000_3763

    ldh a, [$9e]
    and $58
    jr nz, jr_000_3784

jr_000_3763:
    xor a
    ldh [$92], a
    ld a, $fe
    ldh [$93], a
    ld a, $ff
    ld [$c104], a
    ldh a, [$9e]
    or $08
    ldh [$9e], a
    ld a, [$c0c5]
    bit 7, a
    jr z, jr_000_3784

    ld a, $c0
    ldh [$92], a
    ld a, $fd
    ldh [$93], a

jr_000_3784:
    ldh a, [$91]
    ld e, a
    ldh a, [$8f]
    add $10
    call Call_000_3a8d
    jr c, jr_000_3800

    ld a, [$c0d2]
    ld b, a
    ldh a, [$91]
    add b
    add $06
    ld e, a
    ldh a, [$8f]
    add $10
    call Call_000_3a8d
    jr c, jr_000_3800

    ldh a, [$9e]
    or $10
    ldh [$9e], a

jr_000_37a9:
    ldh a, [$91]
    ld e, a
    ldh a, [$8f]
    add $02
    call Call_000_3a8d
    jp c, Jump_000_382e

    ldh a, [$91]
    add $06
    ld e, a
    ldh a, [$8f]
    add $02
    call Call_000_3a8d
    jr c, jr_000_382e

    ld a, [$c104]
    bit 4, a
    jp z, Jump_000_383f

    ld hl, $ff92
    ldh a, [$8e]
    add [hl]
    ldh [$8e], a
    inc hl
    ldh a, [$8f]
    adc [hl]
    ldh [$8f], a
    ld a, [hl]
    bit 7, a
    jr nz, jr_000_37e2

    cp $02
    ret nc

jr_000_37e2:
    ld hl, $ff9c
    dec [hl]
    ret nz

    ld a, $02
    ld [hl], a
    ld bc, $0050
    ldh a, [$8c]
    bit 0, a
    jr z, jr_000_37f6

    ld bc, $0020

jr_000_37f6:
    ld hl, $ff92
    ld a, [hl]
    add c
    ld [hl+], a
    ld a, [hl]
    adc b
    ld [hl], a
    ret


jr_000_3800:
    ldh a, [$93]
    bit 7, a
    jr nz, jr_000_37a9

    ld a, $80
    ldh [$92], a
    xor a
    ldh [$93], a
    xor a
    ldh [$8e], a
    ldh a, [$8f]
    and $f8
    ldh [$8f], a
    ldh a, [$9e]
    and $18
    jr z, jr_000_3827

    ldh a, [$8f]
    cp $15
    jr c, jr_000_3827

    ld a, $10
    call playSound

jr_000_3827:
    ldh a, [$9e]
    and $e0
    ldh [$9e], a
    ret


Jump_000_382e:
jr_000_382e:
    xor a
    ldh [$92], a
    ldh [$93], a
    xor a
    ldh [$8e], a
    ldh a, [$8f]
    and $f8
    add $06
    ldh [$8f], a
    ret


Jump_000_383f:
    xor a
    ldh [$92], a
    ldh [$93], a
    xor a
    ldh [$8e], a
    ret


Call_000_3848:
    xor a
    ld [$c105], a
    ld a, [$c0ef]
    ld e, a
    and $f8
    ld c, a
    ldh a, [$97]
    ld d, a
    sub e
    ldh [$99], a
    ld a, d
    and $f8
    cp c
    call nz, Call_000_3a49
    ldh a, [$99]
    ld d, a
    ldh a, [$91]
    sub d
    ldh [$91], a
    ldh a, [$8c]
    and $30
    ld b, a
    jr z, jr_000_3875

    ld a, [$c0d0]
    cp b
    jr z, jr_000_3884

jr_000_3875:
    ld a, b
    ld [$c0d0], a
    ld a, $0c
    ld [$c0d1], a

jr_000_387e:
    xor a
    ld [$c0d2], a
    jr jr_000_38c7

jr_000_3884:
    ld a, [$c0d1]
    and a
    jr z, jr_000_3890

    dec a
    ld [$c0d1], a
    jr jr_000_387e

jr_000_3890:
    ldh a, [$92]
    ld b, a
    ldh a, [$92]
    ld c, a
    ld a, [$c0d5]
    cp c
    jr nz, jr_000_38c7

    cp b
    jr nz, jr_000_38c7

    cp $80
    jr nz, jr_000_38c7

    ldh a, [$93]
    ld b, a
    ld a, [$c0d4]
    cp b
    jr nz, jr_000_38c7

    cp $00
    jr nz, jr_000_38c7

    ldh a, [$90]
    ld b, a
    ld a, [$c0d6]
    cp b
    jr nz, jr_000_38c2

    ldh a, [$91]
    ld b, a
    ld a, [$c0d7]
    cp b
    jr z, jr_000_38c7

jr_000_38c2:
    ld a, $01
    ld [$c0d2], a

jr_000_38c7:
    ld a, [$c0d3]
    ld [$c0d5], a
    ldh a, [$92]
    ld [$c0d3], a
    ldh a, [$93]
    ld [$c0d4], a
    ldh a, [$90]
    ld [$c0d6], a
    ldh a, [$91]
    ld [$c0d7], a
    ldh a, [$9e]
    bit 3, a
    jr nz, jr_000_3918

    xor a
    ldh [$94], a
    ldh [$95], a
    ld hl, $ff91
    ldh a, [$8c]
    bit 4, a
    jr z, jr_000_38fb

    xor a
    ldh [$94], a
    inc a
    ldh [$95], a

jr_000_38fb:
    ldh a, [$8c]
    bit 5, a
    jr z, jr_000_3907

    xor a
    ldh [$94], a
    dec a
    ldh [$95], a

jr_000_3907:
    ldh a, [$9e]
    bit 6, a
    jr z, jr_000_3915

    ld hl, $ff95
    sra [hl]
    dec hl
    rr [hl]

jr_000_3915:
    jp Jump_000_3980


jr_000_3918:
    ldh a, [$94]
    and a
    jr nz, jr_000_3922

    ldh a, [$95]
    and a
    jr z, jr_000_3942

jr_000_3922:
    ldh a, [$95]
    bit 7, a
    jr z, jr_000_3936

    ldh a, [$94]
    add $02
    ldh [$94], a
    ldh a, [$95]
    adc $00
    ldh [$95], a
    jr jr_000_3942

jr_000_3936:
    ldh a, [$94]
    sub $02
    ldh [$94], a
    ldh a, [$95]
    sbc $00
    ldh [$95], a

jr_000_3942:
    ldh a, [$8c]
    bit 4, a
    jr z, jr_000_3961

    ldh a, [$94]
    add $0c
    ldh [$94], a
    ldh a, [$95]
    adc $00
    ldh [$95], a
    and a
    jr z, jr_000_3961

    cp $ff
    jr z, jr_000_3961

    xor a
    ldh [$94], a
    inc a
    ldh [$95], a

jr_000_3961:
    ldh a, [$8c]
    bit 5, a
    jr z, jr_000_3980

    ldh a, [$94]
    sub $0c
    ldh [$94], a
    ldh a, [$95]
    sbc $00
    ldh [$95], a
    and a
    jr z, jr_000_3980

    cp $ff
    jr z, jr_000_3980

    xor a
    ldh [$94], a
    dec a
    ldh [$95], a

Jump_000_3980:
jr_000_3980:
    ldh a, [$94]
    ld e, a
    ldh a, [$95]
    ld d, a
    ldh a, [$90]
    ld l, a
    ldh a, [$91]
    ld h, a
    add hl, de
    ld a, h
    and a
    jr z, jr_000_3995

    cp $f0
    jr c, jr_000_39a2

jr_000_3995:
    ld hl, $0100
    xor a
    ldh a, [$94]
    ldh a, [$95]
    ld a, $80
    ld [$c105], a

jr_000_39a2:
    ldh a, [$95]
    bit 7, a
    jr nz, jr_000_39ef

    ld a, [$c0d2]
    ld b, a
    ldh a, [$9e]
    bit 6, a
    jr nz, jr_000_39c6

    push hl
    push de
    ldh a, [$91]
    add b
    add $07
    ld e, a
    ldh a, [$8f]
    add $03
    call Call_000_3a8d
    pop de
    pop hl
    jp c, Jump_000_3a43

jr_000_39c6:
    push hl
    push de
    ldh a, [$91]
    add b
    add $07
    ld e, a
    ldh a, [$8f]
    add $08
    call Call_000_3a8d
    pop de
    pop hl
    jp c, Jump_000_3a43

    push hl
    push de
    ldh a, [$91]
    add b
    add $07
    ld e, a
    ldh a, [$8f]
    add $0f
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3a43

    jr jr_000_3a2b

jr_000_39ef:
    ldh a, [$9e]
    bit 6, a
    jr nz, jr_000_3a07

    push hl
    push de
    ldh a, [$91]
    add $ff
    ld e, a
    ldh a, [$8f]
    add $03
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3a43

jr_000_3a07:
    push hl
    push de
    ldh a, [$91]
    add $ff
    ld e, a
    ldh a, [$8f]
    add $08
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3a43

    push hl
    push de
    ldh a, [$91]
    add $ff
    ld e, a
    ldh a, [$8f]
    add $0f
    call Call_000_3a8d
    pop de
    pop hl
    jr c, jr_000_3a43

jr_000_3a2b:
    ldh a, [$98]
    cp $09
    jr nz, jr_000_3a38

    ldh a, [$97]
    cp $60
    jr z, jr_000_3a3c

    ret nc

jr_000_3a38:
    ld a, $98
    cp h
    ret c

jr_000_3a3c:
    ld a, l
    ldh [$90], a
    ld a, h
    ldh [$91], a
    ret


Jump_000_3a43:
jr_000_3a43:
    xor a
    ldh [$94], a
    ldh [$95], a
    ret


Call_000_3a49:
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, [$c0ed]
    ld e, a
    ld a, [$c0ee]
    ld d, a
    cp $e0
    ret nc

    ld a, $98
    ld [hl+], a
    ld a, [$c0ec]
    ld [hl+], a
    ld a, $90
    ld [hl+], a
    ld b, $10

jr_000_3a6a:
    ld a, [de]
    inc de
    ld [hl+], a
    dec b
    jr nz, jr_000_3a6a

    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $13
    ld [$cb01], a
    ld a, e
    ld [$c0ed], a
    ld a, d
    ld [$c0ee], a
    ld a, [$c0ec]
    add $01
    and $5f
    ld [$c0ec], a
    ret


Call_000_3a8d:
    bit 7, a
    jr z, jr_000_3ad9

    rra
    rra
    rra
    and $0f
    ld c, a
    ld a, e
    add $08
    and $f0
    cp $e0
    jr z, jr_000_3af0

    ld a, e
    push de
    ld d, $00
    ld hl, $ff97
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    sla l
    rl h
    ld a, l
    and $f0
    or c
    ld l, a
    ld de, $cc00
    add hl, de
    pop de
    ld a, e
    cp $e0
    jr c, jr_000_3ac2

    ld de, $fe00
    add hl, de

jr_000_3ac2:
    ld a, h
    cp $e0
    jr nc, jr_000_3aec

    cp $cc
    jr c, jr_000_3af0

    ld a, [hl]
    cp $51
    jr z, jr_000_3aee

    ld c, a
    and $c0
    xor $40
    cp $01
    ld a, c
    ret


jr_000_3ad9:
    and $f0
    cp $00
    jr z, jr_000_3aec

    cp $10
    jr z, jr_000_3af0

    ld a, e
    add $10
    and $e0
    cp $a0
    jr z, jr_000_3aee

jr_000_3aec:
    xor a
    ret


jr_000_3aee:
    scf
    ret


jr_000_3af0:
    xor a
    scf
    ret


Call_000_3af3:
    ld a, [$c0c3]
    and a
    ret z

    ld e, c
    ld a, b
    add $07
    push bc
    call Call_000_3a8d
    pop bc
    sub $98
    cp $08
    jr c, jr_000_3b2d

    ld de, $0010
    add hl, de
    ld a, [hl+]
    sub $98
    cp $08
    jr c, jr_000_3b2d

    ld e, c
    ld a, b
    add $0f
    call Call_000_3a8d
    ld a, [hl]
    sub $98
    cp $08
    jr c, jr_000_3b2d

    ld de, $0010
    add hl, de
    ld a, [hl+]
    sub $98
    cp $08
    jr c, jr_000_3b2d

    xor a
    ret


jr_000_3b2d:
    ld a, $80
    ret


Call_000_3b30:
    ld hl, $c0f3
    ld a, $0b
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
ret


Call_000_3b3b:
    ld hl, $c0f2
    inc [hl]
    ld hl, $c0f3
    ld a, [hl]
    dec a
    ld [hl], a
    ret nz

    ld a, $0b
    ld [hl+], a
    inc [hl]
    ld a, [hl+]
    and $07
    ld [hl+], a
    and $03
    ld [hl+], a
    and $01
    ld [hl], a
    ret


