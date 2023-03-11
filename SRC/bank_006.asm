; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $006", ROMX[$4000], BANK[$6]

; Enemy Data Pointers (Bank 6)
    ; Boss stages don't use these pointers
    ; And batwing stages don't seem to either
    dw enemyData_noneA      ; $00: broken Gotham City 1 [cutscene 1 graphics]
    dw enemyData_gotham1    ; $01: Gotham City (1-1) [cutscene 1]
    dw enemyData_factory1   ; $02: Chemical Factory (1-2)
    dw enemyData_factory2   ; $03: Chemical Factory (1-3)
    dw enemyData_noneA      ; $04: Batman vs Jack (1-4)
    dw enemyData_gotham2    ; $05: Gotham City (2-1) [cutscene 2]
    dw enemyData_museum1    ; $06: Flugalheim Museum (2-2)
    dw enemyData_museum2    ; $07: Flugalheim Museum (2-3)
    dw enemyData_noneA      ; $08: Batwing Stage (3-1) [cutscene 3]
    dw enemyData_noneB      ; $09: Batwing Stage (3-2)
    dw enemyData_cathedral1 ; $0A: Gotham Cathedral (4-1)
    dw enemyData_cathedral2 ; $0B: Gotham Cathedral (4-2)
    dw enemyData_noneA      ; $0C: Batman vs Joker (4-3)
    dw enemyData_noneB      ; $0D: Ending cutscene (END)
    dw enemyData_noneA

bank_06_data: ; $401E
; Enemy headers 1
    db $80, $00, $10
    db $81, $00, $10
    db $82, $00, $10
    db $84, $00, $10
    db $85, $00, $10
    db $86, $00, $10
    db $80, $00, $10
    db $86, $00, $10
    db $80, $00, $01
    db $81, $00, $01
    db $82, $00, $01
    db $84, $00, $01
    db $85, $00, $01
    db $86, $00, $01
    db $80, $00, $01
    db $86, $00, $01
    db $80, $00, $20
    db $81, $00, $20
    db $82, $00, $20
    db $84, $00, $20
    db $85, $00, $20
    db $86, $00, $20
    db $80, $00, $20
    db $86, $00, $20
; Headers part 2 - $4066
    db $00, $00, $80, $FF, $0A
    db $00, $00, $40, $FF, $08
    db $00, $00, $20, $FF, $07
    db $00, $00, $00, $FF, $06
    db $00, $00, $80, $00, $0A
    db $00, $00, $C0, $00, $08
    db $00, $00, $E0, $00, $07
    db $00, $00, $00, $01, $06
    db $00, $00, $00, $00, $7F
    db $00, $00, $00, $00, $0A
    db $80, $80, $00, $00, $7F
; Headers part 3 - $409D
    db $00, $00, $00
    db $70, $50, $13
    db $70, $50, $13
    db $70, $50, $13
    db $30, $50, $D8
    db $00, $80, $20
    db $20, $50, $10
    db $20, $50, $13
    db $30, $20, $FF
    db $30, $30, $FF
    db $30, $30, $24
    db $20, $30, $12
    db $30, $30, $12
    db $30, $30, $13
    db $30, $20, $11
    db $50, $50, $FF
    db $50, $50, $F6
    db $50, $50, $BF
    db $50, $40, $BF
; Headers part 4 - $406D
    db $14, $F8, $5F, $60, $2B
    db $14, $F8, $5D, $5E, $27
    db $14, $F8, $61, $62, $21
    db $14, $F8, $63, $64, $25
    db $14, $F8, $26, $27, $26
    db $04, $F8, $28, $29, $28
    db $14, $F8, $2A, $2B, $2A
    db $14, $F8, $2C, $2D, $2C
    db $14, $F8, $2E, $2F, $2E
    db $14, $F8, $2A, $2B, $2A
    db $14, $F8, $2C, $2D, $2D
    db $14, $F8, $2E, $2F, $2E
    db $14, $F8, $5B, $5C, $24
    db $14, $F8, $2E, $2E, $2E
    db $14, $F8, $2C, $2D, $2D
    db $14, $F8, $25, $26, $27
    db $14, $F8, $5D, $5E, $27
    db $14, $F8, $2F, $2F, $2F
    db $14, $F8, $65, $66, $6D
    db $14, $F8, $2C, $2D, $2C
    db $14, $F8, $6B, $6C, $29
    db $14, $F8, $67, $68, $21
    db $14, $F8, $69, $6A, $25
    db $14, $F8, $2A, $2B, $2A
    db $04, $F8, $2E, $2F, $2E
    db $14, $F8, $5F, $60, $60
    db $14, $F8, $6E, $6F, $6F
    db $14, $F8, $70, $71, $71
    db $14, $F8, $72, $73, $74
    db $04, $F8, $2E, $2F, $2E
    db $14, $F8, $2C, $2C, $2C
    db $14, $F8, $2D, $2D, $2D
    db $14, $F8, $26, $26, $26
    db $14, $F8, $27, $27, $27
    db $14, $F8, $2B, $2C, $2D
    db $14, $F8, $25, $26, $27

; Enemy Data in Bank 6
enemyData_noneA:
enemyData_gotham1:    include "levels/enemyData_gotham1.asm" ; Gotham 1 (1-1)
enemyData_noneB:
enemyData_factory1:   include "levels/enemyData_factory1.asm"
enemyData_factory2:   include "levels/enemyData_factory2.asm"
enemyData_gotham2:    include "levels/enemyData_gotham2.asm"
enemyData_museum1:    include "levels/enemyData_museum1.asm"
enemyData_museum2:    include "levels/enemyData_museum2.asm"
enemyData_cathedral1: include "levels/enemyData_cathedral1.asm"
enemyData_cathedral2: include "levels/enemyData_cathedral2.asm"


SECTION "ROM Bank $006 pt2", ROMX[$6800], BANK[$6]

cutsceneLoad_farCall: ; 06:6800
    jp cutsceneLoad

cutsceneHandle_farCall: ; 06:6803
    jp cutsceneHandle

cutsceneLoad: ;{ 06:6806
    ld a, $25
    call $0ed2
    call cutscene_loadResources
    call $0f69
    ; Set palettes
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    xor a
    ld [$c4ca], a
    ld [$c4cb], a
    ld [$c4cc], a
    ld [$c4d2], a
    ld [$c4d9], a
    ld [$c4da], a
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ldh [$bb], a
    ldh [$bc], a
    ldh [hCamera_xPixel], a
    ld a, [$c0b1]
    cp $04
    jr nz, .endIf_A
        ld a, $50
        ldh [$bd], a
    .endIf_A:
    ld a, [$c0b1]
    cp $05
    jr nz, .endIf_B
        ld a, $a5
        ldh [$be], a
        ld a, $7b
        ldh [$bd], a
    .endIf_B:
    ld a, [$c0b1]
    cp $01
    jr nz, .else_C
        ld a, $08
        ldh [$9a], a
        ld a, $6f
        ldh [rLYC], a
        ld a, $40
        ldh [rSTAT], a
        jr .endIf_C
    .else_C:
        xor a
        ldh [$9a], a
        ldh [rSTAT], a
    .endIf_C:

    xor a
    ldh [rIF], a
    ld a, $07
    ldh [rIE], a
    ldh [$fc], a
    ; Set LCD mode depending on cutscene
    ld a, [$c0b1]
    cp $04
        jr c, .standard
    cp $06
        jr nc, .standard

    ; Cutscenes 4-5
        ld a, $e3 ; Activate window display
    jr .exit

    .standard: ; Cutscenes 0-3
        ld a, $83

.exit:
    ldh [rLCDC], a
    ei
ret ;}


cutsceneHandle: ; 06:6889
    call Call_006_6b94
    ld a, [$c0b1]
    cp $05
        jp z, Jump_006_6a7a
    cp $04
        jp z, Jump_006_6982
    cp $03
        jp z, Jump_006_6a52
    cp $02
        jp z, Jump_006_6a0d
    cp $01
        jp z, Jump_006_68d6



    ld a, [$c4d2]
    and $ff
    jr nz, jr_006_68c1
        ld a, $01
        ld [$c4d2], a
        xor a
        ld [$c4db], a
        ld [$c4dd], a
        ld [$c4de], a
        ld [$c4d3], a
    jr_006_68c1:

    ld a, [$c4d3]
    and a
    jr nz, jr_006_68cf
        ld a, $00
        call Call_006_6be8
        call Call_006_6e9a
    jr_006_68cf:
    ld bc, $00a0
    call Call_006_71e9
ret


Jump_006_68d6:
    ld a, [$c4d2]
    and $ff
    jr nz, jr_006_6902
        ld a, $01
        ld [$c4d2], a
        xor a
        ld [$c4ca], a
        ld [$c4db], a
        ld [$c4dd], a
        ld [$c4de], a
        ld [$c4d3], a
        ld [$c4e6], a
        ld a, $80
        ld [$c4e4], a
        xor a
        ld [$c4e2], a
        inc a
        ld [$c4e3], a
    jr_006_6902:

    ld a, [$c4e4]
    cp $60
    jr z, jr_006_691f

    ld a, [$c4ca]
    cp $08
    jr c, jr_006_6957

    ld a, [$c4cf]
    and a
    jr nz, jr_006_6957

    ld a, [$c4e4]
    dec a
    ld [$c4e4], a
    jr jr_006_6957

jr_006_691f:
    ld a, [$c4d0]
    and a
    jr nz, jr_006_6957

    ld a, [$c4e6]
    srl a
    jr c, jr_006_6943

    ld a, [$c4e2]
    add $02
    ld [$c4e2], a
    inc a
    ld [$c4e3], a
    cp $07
    jr nz, jr_006_6957

    ld a, $01
    ld [$c4e6], a
    jr jr_006_6957

jr_006_6943:
    ld a, [$c4e2]
    sub $02
    ld [$c4e2], a
    inc a
    ld [$c4e3], a
    cp $01
    jr nz, jr_006_6957

    xor a
    ld [$c4e6], a

jr_006_6957:
    ld a, [$c4e2]
    ld e, a
    ld a, [$c4e4]
    ld b, a
    ld c, $18
    xor a
    call Call_006_7221
    ld a, [$c4e3]
    ld e, a
    ld a, [$c4e4]
    ld b, a
    ld c, $80
    xor a
    call Call_006_7221
    ld a, $01
    call Call_006_6be8
    call Call_006_6e9a
    ld bc, $00a0
    call Call_006_71e9
    ret


Jump_006_6982:
    ld a, [$c4d2]
    and $ff
    jr nz, jr_006_69a2
        ld a, $01
        ld [$c4d2], a
        xor a
        ld [$c4ca], a
        ld [$c4dd], a
        ld [$c4d3], a
        ld a, $0b
        ld [$c4e2], a
        ld a, $08
        ld [$c4e5], a
    jr_006_69a2:

    ld a, [$c4d3]
    and a
    jr nz, jr_006_6a06

    ld a, [$c4e5]
    cp $08
    jr nz, jr_006_69d1

    ld a, [$c4ca]
    cp $10
    jr c, jr_006_6a0c

    cp $80
    jr nc, jr_006_69d1

    ld a, [$c4cf]
    and a
    jr nz, jr_006_69f8

    ld a, [$c4e2]
    cp $08
    jr z, jr_006_69ca

    dec a
    jr jr_006_69cc

jr_006_69ca:
    ld a, $0b

jr_006_69cc:
    ld [$c4e2], a
    jr jr_006_69f8

jr_006_69d1:
    ldh a, [rWX]
    cp $a4
    jr c, jr_006_69de

    ld a, $01
    ld [$c4dd], a
    jr jr_006_6a06

jr_006_69de:
    add $02
    ldh [rWX], a
    ldh [$be], a
    ld a, [$c4e5]
    cp $58
    jr nc, jr_006_6a06

    add $02
    ld [$c4e5], a
    ld a, [$c4cd]
    add $09
    ld [$c4e2], a

jr_006_69f8:
    ld a, [$c4e2]
    ld e, a
    ld b, $80
    ld a, [$c4e5]
    ld c, a
    xor a
    call Call_006_7221

jr_006_6a06:
    ld bc, $00a0
    call Call_006_71e9

jr_006_6a0c:
    ret


Jump_006_6a0d:
    ld a, [$c4d2]
    and $ff
    jr nz, jr_006_6a29
        ld a, $01
        ld [$c4d2], a
        xor a
        ld [$c4ca], a
        ld [$c4db], a
        ld [$c4dd], a
        ld [$c4de], a
        ld [$c4d3], a
    jr_006_6a29:

    ld a, [$c4d3]
    and a
    jr z, jr_006_6a43

    ld de, $000c
    ld bc, $5410
    xor a
    call Call_006_7221
    ld de, $000d
    ld bc, $6428
    xor a
    call Call_006_7221

jr_006_6a43:
    ld a, $02
    call Call_006_6be8
    call Call_006_6e9a
    ld bc, $00b0
    call Call_006_71e9
    ret


Jump_006_6a52:
    ld a, [$c4d2]
    and $ff
    jr nz, jr_006_6a6b
        ld a, $01
        ld [$c4d2], a
        xor a
        ld [$c4db], a
        ld [$c4dd], a
        ld [$c4de], a
        ld [$c4d3], a
    jr_006_6a6b:

    ld a, $03
    call Call_006_6be8
    call Call_006_6e9a
    ld bc, $0180
    call Call_006_71e9
    ret

; Credits handler
Jump_006_6a7a: ; 06:6A7A
    ld a, [$c4d2]
    and $ff
    jr nz, jr_006_6a9b
        ld a, $01
        ld [$c4d2], a
        xor a
        ld [$c4ca], a
        ld [$c4db], a
        ld [$c4dd], a
        ld [$c4c9], a
        ld [$c4d3], a
        ld a, $10
        ld [$c4e2], a
    jr_006_6a9b:

    ld a, [$c4dd]
    and a
    jr nz, jr_006_6ad2
        ld a, [$c4cf]
        cpl
        and $01
        jr z, jr_006_6ab2
            ld a, [$c4c9]
            inc a
            ldh [$bb], a
            ld [$c4c9], a
        jr_006_6ab2:
    
        ldh a, [$be]
        cp $68
        jr z, jr_006_6ac4
            ld a, [$c4cf]
            cpl
            and $01
            ld b, a
            ldh a, [$be]
            sub b
            ldh [$be], a
        jr_006_6ac4:
    
        ldh a, [$bd]
        and a
        jr z, jr_006_6ad2
            ld a, [$c4cc]
            ld b, a
            ldh a, [$bd]
            sub b
            ldh [$bd], a
    jr_006_6ad2:

    ldh a, [$be]
    cp $7f
    jr nc, jr_006_6b05
        add $29
        ld [$c4e5], a
        ldh a, [$bd]
        add $60
        ld [$c4e4], a
        ld a, [$c4d0]
        and a
        jr nz, jr_006_6af5
            ld a, [$c4e2]
            inc a
            and $03
            or $10
            ld [$c4e2], a
        jr_006_6af5:
        ld a, [$c4e2]
        ld e, a
        ld a, [$c4e5]
        ld c, a
        ld a, [$c4e4]
        ld b, a
        xor a
        call Call_006_7221
    jr_006_6b05:

    ld de, $000e
    ld bc, $2028
    xor a
    call Call_006_7221
    ld de, $000f
    ld bc, $2038
    xor a
    call Call_006_7221
    ld a, [$c4dd]
    and a
    jr nz, jr_006_6b31
        ld a, [$c4c9]
        and $07
        jr nz, jr_006_6b31
            ld a, [$c4cf]
            cpl
            and $01
            jr z, jr_006_6b31
                call Call_006_6ef9
    jr_006_6b31:

    ld bc, $0280
    call Call_006_71e9
ret


cutscene_loadResources: ;{ 06:6B38
    xor a
    call loadProc_A
    ld a, [$c0b1]
    cp $04
        jr z, .case_batmobile
    cp $05
        jr z, .case_credits

; Default case
    ; Load four resources starting at (Cutscene Number * 4)
    sla a
    sla a
    ld [$c0e9], a
    call loadProc_B
    ld a, [$c0e9]
    inc a
    ld [$c0e9], a
    call loadProc_B
    ld a, [$c0e9]
    inc a
    ld [$c0e9], a
    call loadProc_B
    ld a, [$c0e9]
    inc a
    call loadProc_B
    jr .exit

.case_batmobile: ; Batmobile Cutscene
    ld a, $10
    call loadProc_B
    ld a, $11
    call loadProc_B
    ld a, $12
    call loadProc_B
    ld a, $13
    call loadProc_B
    ld a, $14
    call loadProc_B
    jr .exit

.case_credits: ; Credits
    ld a, $15
    call loadProc_B
    ld a, $16
    call loadProc_B

    .exit:
ret ;}


Call_006_6b94:
    ld a, [$c4ca]
    inc a
    ld [$c4ca], a
    ld a, [$c4cb]
    inc a
    ld [$c4cb], a
    ld a, [$c4cc]
    cpl
    and $01
    ld [$c4cc], a
    ld a, [$c4cb]
    and $03
    jr z, jr_006_6bb4

    ld a, $01

jr_006_6bb4:
    ld [$c4cf], a
    ld a, [$c4cb]
    and $07
    jr z, jr_006_6bc0

    ld a, $01

jr_006_6bc0:
    ld [$c4d0], a
    ld a, [$c4cb]
    and $0f
    jr z, jr_006_6bcc

    ld a, $01

jr_006_6bcc:
    ld [$c4d1], a
    ld a, [$c4cb]
    and $04
    jr z, jr_006_6bd8

    ld a, $01

jr_006_6bd8:
    ld [$c4cd], a
    ld a, [$c4cb]
    and $08
    jr z, jr_006_6be4

    ld a, $01

jr_006_6be4:
    ld [$c4ce], a
    ret

; Handle cutscene text
Call_006_6be8: ; 06:6BE8
    ld [$c4dc], a
    ld a, [$c4de]
    and a
    jp nz, Jump_006_6ca5

    ld a, [$c4ca]
    and $03
    jp nz, Jump_006_6ca5

    ld a, [$c4db]
    and $ff
    jr nz, jr_006_6c16

    or $01
    ld [$c4db], a
    ld a, $99
    ld [$c4d6], a
    ld [$c4df], a
    ld a, $e0
    ld [$c4d7], a
    ld [$c4e0], a

jr_006_6c16:
    ld a, [$c4dc]
    add a
    ld e, a
    ld d, $00
    ld hl, table_006_6CA6
    add hl, de
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld a, [$c4d9]
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    ld a, [de]
    ld [$c4d8], a
    ; Check for control codes
    cp $80 ; Newline?
        jr z, jr_006_6c40
    cp $c0 ; New textbox?
        jr z, jr_006_6c52
    cp $ff ; End cutscene
        jr z, jr_006_6ca0

    jr jr_006_6c5c

jr_006_6c40:
    ld a, [$c4d7]
    add $0c
    ld [$c4d7], a
    ld a, [$c4d6]
    adc $00
    ld [$c4d6], a
    jr jr_006_6c97

jr_006_6c52:
    ld a, $01
    ld [$c4de], a
    ld [$c4ca], a
    jr jr_006_6c97

jr_006_6c5c:
    ld a, [$c4d6]
    ld h, a
    ld a, [$c4d7]
    ld l, a
    ld a, [$c4d8]
    push af
    push hl
    ld d, $00
    ld a, [vBlank_updateBufferIndex]
    ld e, a
    ld hl, vBlank_updateBuffer
    add hl, de
    pop de
    ld a, d
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    pop af
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [vBlank_updateBufferIndex]
    add $04
    ld [vBlank_updateBufferIndex], a
    ld a, [$c4d7]
    add $01
    ld [$c4d7], a
    ld a, [$c4d6]
    adc $00
    ld [$c4d6], a

jr_006_6c97:
    ld a, [$c4d9]
    inc a
    ld [$c4d9], a
    jr jr_006_6ca5

jr_006_6ca0:
    ld a, $01
    ld [$c4dd], a

Jump_006_6ca5:
jr_006_6ca5:
    ret

table_006_6CA6: ; Cutscene text
    db $ae, $6c, $37, $6d, $6d, $6d, $f4, $6d,
    db $19, $18, $15, $12, $0c, $0e, $25, $18
    db $0f, $0f, $12, $0c, $0e, $1b, $cb, $d0, $12, $cf, $1f, $0e, $80, $13, $1e, $1c
    db $1d, $25, $11, $0e, $0a, $1b, $0d, $25, $1d, $11, $0a, $1d, $c0, $13, $0a, $0c
    db $14, $25, $11, $0a, $1c, $25, $1c, $17, $0e, $0a, $14, $0e, $0d, $25, $25, $25
    db $25, $80, $12, $17, $1d, $18, $25, $1d, $11, $0e, $25, $0a, $21, $12, $1c, $c0
    db $0c, $11, $0e, $16, $12, $0c, $0a, $15, $25, $0f, $0a, $0c, $1d, $18, $1b, $22
    db $cc, $d0, $25, $25, $80, $25, $c0, $19, $18, $15, $12, $0c, $0e, $25, $0c, $18
    db $16, $16, $12, $1c, $1c, $12, $18, $17, $0e, $1b, $25, $80, $10, $18, $1b, $0d
    db $18, $17, $cb, $d0, $18, $14, $cc, $25, $10, $18, $1d, $25, $12, $1d, $cc, $d0
    db $ff
    
    db $a5, $11, $0e, $22, $25, $0b, $0a, $1d, $16, $0a, $17, $a2, $25, $25, $25
    db $25, $25, $25, $25, $25, $80, $22, $18, $1e, $25, $14, $17, $18, $20, $25, $17
    db $18, $0b, $18, $0d, $22, $25, $0c, $0a, $17, $c0, $0d, $0e, $1c, $1d, $1b, $18
    db $22, $25, $16, $0e, $a1, $a5, $ff
    
    db $d0, $12, $cf, $1f, $0e, $25, $19, $1b, $0e
    db $19, $0a, $1b, $0e, $0d, $25, $0a, $25, $25, $25, $25, $80, $1c, $19, $0e, $0c
    db $12, $0a, $15, $25, $1c, $1e, $1b, $19, $1b, $12, $1c, $0e, $25, $0f, $18, $1b
    db $c0, $1d, $11, $0e, $25, $02, $00, $00, $1d, $11, $25, $25, $25, $25, $25, $25
    db $25, $25, $25, $25, $25, $80, $0a, $17, $17, $12, $1f, $0e, $1b, $1c, $0a, $1b
    db $22, $25, $18, $0f, $c0, $10, $18, $1d, $11, $0a, $16, $25, $0c, $12, $1d, $22
    db $cc, $25, $20, $11, $22, $25, $25, $25, $25, $80, $0d, $18, $17, $cf, $1d, $25
    db $22, $18, $1e, $25, $13, $18, $12, $17, $25, $16, $0e, $ce, $c0, $11, $0a, $cd
    db $25, $11, $0a, $cd, $25, $11, $0a, $cd, $25, $11, $0a, $ce, $d0, $ff
    
    db $b8, $13
    db $18, $14, $0e, $1b, $b5, $25, $1d, $11, $0e, $25, $0e, $1f, $12, $15, $25, $25
    db $25, $25, $80, $15, $0e, $0a, $0d, $0e, $1b, $b5, $25, $12, $1c, $25, $0d, $0e
    db $0f, $0e, $0a, $1d, $0e, $0d, $c0, $0a, $0f, $1d, $0e, $1b, $25, $1d, $11, $0e
    db $25, $0f, $12, $17, $0a, $15, $25, $25, $25, $25, $25, $80, $0b, $0a, $1d, $1d
    db $15, $0e, $25, $20, $12, $1d, $11, $25, $0b, $0a, $1d, $16, $0a, $17, $b4, $c0
    db $11, $0e, $25, $15, $0e, $0a, $1f, $0e, $1c, $25, $0b, $0e, $11, $12, $17, $0d
    db $25, $11, $12, $16, $80, $0a, $25, $20, $0e, $12, $1b, $0d, $25, $15, $0a, $1e
    db $10, $11, $1d, $0e, $1b, $c0, $1d, $11, $0a, $1d, $25, $0e, $0c, $11, $18, $b7
    db $1c, $25, $25, $25, $25, $25, $25, $25, $25, $25, $80, $1d, $11, $1b, $18, $1e
    db $10, $11, $18, $1e, $1d, $c0, $10, $18, $1d, $11, $0a, $16, $25, $0c, $12, $1d
    db $22, $b4, $b8, $ff

Call_006_6e9a:
    ld a, [$c4de]
    and a
    jr z, jr_006_6ef8

    ld a, [$c4e0]
    and a
    jr z, jr_006_6ead

    ld a, [$c4ca]
    and $7f
    jr nz, jr_006_6ef8

jr_006_6ead:
    ld d, $00
    ld a, [vBlank_updateBufferIndex]
    ld e, a
    ld hl, vBlank_updateBuffer
    add hl, de
    ld a, [$c4df]
    ld [hl+], a
    ld a, [$c4e0]
    ld [hl+], a
    ld a, $14
    ld [hl+], a
    ld b, a
    ld a, $25

jr_006_6ec5:
    ld [hl+], a
    dec b
    jr nz, jr_006_6ec5

    xor a
    ld [hl+], a
    ld a, [vBlank_updateBufferIndex]
    add $17
    ld [vBlank_updateBufferIndex], a
    ld a, [$c4e0]
    and a
    jr z, jr_006_6ee4

    ld a, $9a
    ld [$c4df], a
    xor a
    ld [$c4e0], a
    jr jr_006_6ef8

jr_006_6ee4:
    xor a
    ld [$c4de], a
    ld a, $99
    ld [$c4d6], a
    ld [$c4df], a
    ld a, $e0
    ld [$c4d7], a
    ld [$c4e0], a

jr_006_6ef8:
    ret


; Credits text handler
Call_006_6ef9: ; 06:6EF9
    ld a, [$c4db]
    and $ff
    jr nz, jr_006_6f0f
        or $01
        ld [$c4db], a
        ld a, $9a
        ld [$c4d6], a
        ld a, $61
        ld [$c4d7], a
    jr_006_6f0f:

    ld a, [$c4d6]
    ld h, a
    ld a, [$c4d7]
    ld l, a
    push hl
    ld d, $00
    ld a, [vBlank_updateBufferIndex]
    ld e, a
    ld hl, vBlank_updateBuffer
    add hl, de
    pop de
    ld a, d
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ld [$c4e1], a

jr_006_6f2d:
    ld de, credits_text
    ld a, [$c4d9]
    add e
    ld e, a
    ld a, d
    adc $00
    ld d, a
    ld a, [$c4da]
    add d
    ld d, a
    ld a, [de]
    ld [$c4d8], a
    cp $81
        jr z, jr_006_6fa0
    cp $80
        jr nz, jr_006_6f67
    ld b, $0a

    jr_006_6f4c:
        ld a, $25
        ld [$c4d8], a
        ld [hl+], a
        dec b
    jr nz, jr_006_6f4c

    ld a, [$c4d9]
    add $01
    ld [$c4d9], a
    ld a, [$c4da]
    adc $00
    ld [$c4da], a
    jr jr_006_6f82

jr_006_6f67:
    ld [hl+], a
    ld a, [$c4d9]
    add $01
    ld [$c4d9], a
    ld a, [$c4da]
    adc $00
    ld [$c4da], a
    ld a, [$c4e1]
    dec a
    ld [$c4e1], a
    and a
    jr nz, jr_006_6f2d

jr_006_6f82:
    xor a
    ld [hl+], a
    ld a, [vBlank_updateBufferIndex]
    add $0d
    ld [vBlank_updateBufferIndex], a
    ld a, [$c4d7]
    add $20
    ld [$c4d7], a
    ld a, [$c4d6]
    adc $00
    and $9b
    ld [$c4d6], a
    jr jr_006_6fa5

jr_006_6fa0:
    ld a, $01
    ld [$c4dd], a

jr_006_6fa5:
    ret

credits_text: ;00:6FA6
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $25, $25, $1c, $1d, $0a, $0f, $0f, $25, $25, $25, $80, $80, $80, $24, $24, $24
    db $24, $24, $24, $24, $24, $24, $24, $16, $0a, $12, $17, $25, $25, $25, $25, $25
    db $25, $19, $1b, $18, $10, $1b, $0a, $16, $16, $0e, $1b, $24, $24, $24, $24, $24
    db $24, $24, $24, $24, $24, $80, $15, $1e, $0c, $14, $22, $25, $25, $25, $25, $25
    db $25, $25, $25, $25, $25, $0a, $1c, $0a, $0d, $0a, $80, $24, $24, $24, $24, $24
    db $24, $24, $24, $24, $24, $19, $1b, $18, $10, $1b, $0a, $16, $16, $0e, $1b, $24
    db $24, $24, $24, $24, $24, $24, $24, $24, $24, $80, $15, $1e, $0c, $14, $22, $25
    db $25, $25, $25, $25, $25, $25, $25, $25, $25, $0a, $1c, $0a, $0d, $0a, $0a, $14
    db $0a, $25, $25, $25, $25, $25, $25, $25, $23, $0a, $19, $90, $22, $1e, $12, $0c
    db $11, $12, $80, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $0d, $0e, $1c
    db $12, $10, $17, $0e, $1b, $25, $25, $24, $24, $24, $24, $24, $24, $24, $24, $24
    db $24, $80, $14, $0a, $23, $25, $25, $25, $25, $25, $25, $25, $1b, $12, $0e, $25
    db $25, $25, $25, $25, $25, $25, $1d, $0a, $0d, $0a, $1c, $11, $12, $25, $25, $25
    db $0a, $14, $12, $25, $25, $25, $25, $25, $25, $25, $16, $90, $0f, $25, $25, $25
    db $25, $25, $25, $25, $0a, $0b, $0e, $25, $14, $1e, $17, $25, $25, $25, $80, $24
    db $24, $24, $24, $24, $24, $24, $24, $24, $24, $1c, $18, $1e, $17, $0d, $25, $25
    db $25, $25, $25, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $80, $17, $18
    db $0b, $1e, $22, $1e, $14, $12, $90, $11, $0a, $0b, $18, $1e, $1d, $90, $1c, $1c
    db $25, $25, $14, $18, $0d, $0a, $14, $0a, $25, $1c, $0a, $17, $80, $80, $24, $24
    db $24, $24, $24, $24, $24, $24, $24, $24, $19, $1b, $18, $10, $1b, $0a, $16, $25
    db $25, $25, $0d, $12, $1b, $0e, $0c, $1d, $18, $1b, $25, $25, $24, $24, $24, $24
    db $24, $24, $24, $24, $24, $24, $80, $11, $12, $1b, $18, $24, $14, $1e, $17, $25
    db $25, $80, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $0d, $12, $1b, $0e
    db $0c, $1d, $18, $1b, $25, $25, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    db $80, $0c, $11, $18, $25, $16, $1e, $1c, $18, $1e, $25, $80, $24, $24, $24, $24
    db $24, $24, $24, $24, $24, $24, $1c, $19, $0e, $0c, $12, $0a, $15, $25, $25, $25
    db $1d, $11, $0a, $17, $14, $1c, $25, $25, $25, $25, $24, $24, $24, $24, $24, $24
    db $24, $24, $24, $24, $80, $16, $0a, $0c, $25, $25, $25, $25, $25, $25, $25, $11
    db $0a, $0c, $90, $0f, $25, $25, $25, $25, $25, $1c, $1e, $19, $0e, $1b, $25, $25
    db $25, $25, $25, $25, $25, $25, $25, $25, $0c, $18, $17, $0b, $12, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80
    db $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $25, $1d, $11, $0e, $25
    db $0e, $17, $0d, $25, $25, $80, $80, $80, $19, $1b, $0e, $1c, $0e, $17, $1d, $0e
    db $0d, $25, $25, $25, $25, $25, $0b, $22, $25, $25, $25, $25, $80, $ec, $ee, $f0
    db $f2, $f4, $f6, $f8, $fa, $fc, $fe, $ed, $ef, $f1, $f3, $f5, $f7, $f9, $fb, $fd
    db $ff, $80, $81

Call_006_71e9:
    ld a, [$c4dd]
    and a
    jr z, jr_006_7220

    ld a, [$c4d3]
    and a
    jr nz, jr_006_7202

    ld a, b
    ld [$c4d4], a
    ld a, c
    ld [$c4d5], a
    ld a, $01
    ld [$c4d3], a

jr_006_7202:
    ld a, [$c4d5]
    sub $01
    ld [$c4d5], a
    ld a, [$c4d4]
    sbc $00
    ld [$c4d4], a
    and a
    jr nz, jr_006_7220

    ld a, [$c4d5]
    and a
    jr nz, jr_006_7220

    ld a, $01
    ld [$c0b2], a

jr_006_7220:
    ret


Call_006_7221:
    ldh [$83], a
    ld d, $00
    sla e
    rl d
    ld hl, table_006_72c2
    add hl, de
    ld a, [hl+]
    ld e, a
    ld d, [hl]
    ld a, [de]
    inc de
    ld h, a
    and $0f
    ldh [$82], a
    bit 4, h
    jr z, jr_006_7253

    ldh a, [$83]
    bit 5, a
    jr z, jr_006_7253

    and $df
    ldh [$83], a
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

jr_006_7253:
    ldh a, [$fa]
    bit 7, a
    jr nz, jr_006_728a

    ld a, [$c0a0]
    ld l, a
    ld h, $c0

jr_006_725f:
    ld a, l
    cp $a0
    jr nc, jr_006_7284

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
    ldh a, [$82]
    dec a
    ldh [$82], a
    jr nz, jr_006_725f

    ld a, l
    ld [$c0a0], a
    ret


jr_006_7284:
    ld a, $a0
    ld [$c0a0], a
    ret


jr_006_728a:
    ld a, [$c0a0]
    sub $04
    ld l, a
    ld h, $c0

jr_006_7292:
    ld a, l
    cp $a0
    jr nc, jr_006_72bd

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
    jr nz, jr_006_7292

    ld a, l
    add $04
    ld [$c0a0], a
    ret


jr_006_72bd:
    xor a
    ld [$c0a0], a
    ret

table_006_72c2: ; Sprite data?
    dw $72EA
    dw $731B
    dw $734C
    dw $737D
    dw $73AE
    dw $73DF
    dw $7410
    dw $7441
    dw $7472
    dw $7493
    dw $74B4
    dw $74D5
    dw $74F6
    dw $7517
    dw $7538
    dw $7559
    dw $757A
    dw $75A3
    dw $75D4
    dw $7605

    
    db $0c, $00, $00, $60, $00, $00, $08, $70
    db $00, $00, $10, $80, $00, $08, $00, $61, $00, $08, $08, $71, $00, $08, $10, $81
    db $00, $10, $00, $62, $00, $10, $08, $72, $00, $10, $10, $82, $00, $18, $00, $63
    db $00, $18, $08, $73, $00, $18, $10, $83, $00, $0c, $00, $00, $2a, $00, $00, $08
    db $7c, $00, $00, $10, $8c, $00, $08, $00, $6d, $00, $08, $08, $7d, $00, $08, $10
    db $8d, $00, $10, $00, $6e, $00, $10, $08, $7e, $00, $10, $10, $8e, $00, $18, $00
    db $6f, $00, $18, $08, $7f, $00, $18, $10, $8f, $00, $0c, $00, $00, $64, $00, $00
    db $08, $74, $00, $00, $10, $84, $00, $08, $00, $65, $00, $08, $08, $75, $00, $08
    db $10, $85, $00, $10, $00, $62, $00, $10, $08, $72, $00, $10, $10, $82, $00, $18
    db $00, $63, $00, $18, $08, $73, $00, $18, $10, $83, $00, $0c, $00, $00, $2a, $00
    db $00, $08, $5f, $00, $00, $10, $2a, $00, $08, $00, $5e, $00, $08, $08, $9e, $00
    db $08, $10, $9f, $00, $10, $00, $6e, $00, $10, $08, $7e, $00, $10, $10, $8e, $00
    db $18, $00, $6f, $00, $18, $08, $7f, $00, $18, $10, $8f, $00, $0c, $00, $00, $2a
    db $00, $00, $08, $2a, $00, $00, $10, $2a, $00, $08, $00, $66, $00, $08, $08, $76
    db $00, $08, $10, $86, $00, $10, $00, $67, $00, $10, $08, $77, $00, $10, $10, $87
    db $00, $18, $00, $68, $00, $18, $08, $78, $00, $18, $10, $88, $00, $0c, $00, $00
    db $2a, $00, $00, $08, $2a, $00, $00, $10, $2a, $00, $08, $00, $90, $00, $08, $08
    db $93, $00, $08, $10, $96, $00, $10, $00, $91, $00, $10, $08, $94, $00, $10, $10
    db $97, $00, $18, $00, $92, $00, $18, $08, $95, $00, $18, $10, $98, $00, $0c, $00
    db $00, $2a, $00, $00, $08, $2a, $00, $00, $10, $2a, $00, $08, $00, $69, $00, $08
    db $08, $79, $00, $08, $10, $89, $00, $10, $00, $6a, $00, $10, $08, $7a, $00, $10
    db $10, $8a, $00, $18, $00, $6b, $00, $18, $08, $7b, $00, $18, $10, $49, $00, $0c
    db $00, $00, $2a, $00, $00, $08, $2a, $00, $00, $10, $2a, $00, $08, $00, $2a, $00
    db $08, $08, $9b, $00, $08, $10, $89, $00, $10, $00, $99, $00, $10, $08, $9c, $00
    db $10, $10, $8b, $00, $18, $00, $9a, $00, $18, $08, $9d, $00, $18, $10, $6c, $00
    db $08, $00, $00, $e3, $00, $00, $08, $e5, $00, $00, $10, $e7, $00, $08, $00, $e4
    db $00, $08, $08, $e6, $00, $08, $10, $e8, $00, $08, $18, $e9, $00, $08, $20, $ea
    db $00, $08, $00, $00, $f5, $00, $00, $08, $f5, $00, $00, $10, $f5, $00, $08, $00
    db $eb, $00, $08, $08, $ec, $00, $08, $10, $ed, $00, $08, $18, $ee, $00, $08, $20
    db $f5, $00, $08, $00, $00, $f5, $00, $00, $08, $f5, $00, $00, $10, $f5, $00, $08
    db $00, $ef, $00, $08, $08, $f0, $00, $08, $10, $f1, $00, $08, $18, $f2, $00, $08
    db $20, $f5, $00, $08, $00, $00, $f5, $00, $00, $08, $f5, $00, $00, $10, $f5, $00
    db $08, $00, $f5, $00, $08, $08, $f3, $00, $08, $10, $f4, $00, $08, $18, $f5, $00
    db $08, $20, $f5, $00, $08, $00, $00, $c2, $00, $00, $08, $c4, $00, $08, $00, $c3
    db $00, $08, $08, $c5, $00, $08, $10, $c4, $00, $10, $08, $c3, $00, $10, $10, $c5
    db $00, $18, $10, $c3, $00, $08, $00, $00, $c4, $00, $00, $08, $c2, $00, $00, $10
    db $c4, $00, $00, $18, $c7, $00, $08, $00, $c6, $00, $08, $08, $c3, $00, $08, $10
    db $c6, $00, $08, $18, $c8, $00, $08, $00, $00, $db, $80, $00, $08, $df, $80, $08
    db $00, $dc, $80, $08, $08, $e0, $80, $10, $00, $dd, $80, $10, $08, $e1, $80, $18
    db $00, $de, $80, $18, $08, $e2, $80, $08, $00, $00, $e3, $80, $00, $08, $e7, $80
    db $08, $00, $e4, $80, $08, $08, $e8, $80, $10, $00, $e5, $80, $10, $08, $e9, $80
    db $18, $00, $e6, $80, $18, $08, $ea, $80, $0a, $00, $00, $b0, $00, $08, $00, $b1
    db $00, $10, $00, $b2, $00, $10, $08, $c2, $00, $18, $00, $b3, $00, $18, $08, $c3
    db $00, $20, $00, $b4, $00, $20, $08, $c4, $00, $28, $00, $b5, $00, $28, $08, $c5
    db $00, $0c, $00, $00, $b6, $00, $08, $00, $b7, $00, $10, $00, $b8, $00, $10, $08
    db $c8, $00, $18, $00, $b9, $00, $18, $08, $c9, $00, $20, $00, $ba, $00, $20, $08
    db $ca, $00, $20, $10, $ae, $00, $28, $00, $bb, $00, $28, $08, $cb, $00, $28, $10
    db $af, $00, $0c, $00, $00, $c6, $00, $08, $00, $c7, $00, $10, $00, $bc, $00, $10
    db $08, $cc, $00, $18, $00, $bd, $00, $18, $08, $cd, $00, $20, $00, $be, $00, $20
    db $08, $ce, $00, $20, $10, $c0, $00, $28, $00, $bf, $00, $28, $08, $cf, $00, $28
    db $10, $c1, $00, $0c, $00, $00, $d0, $00, $08, $00, $d1, $00, $10, $00, $d2, $00
    db $10, $08, $d6, $00, $18, $00, $d3, $00, $18, $08, $d7, $00, $20, $00, $d4, $00
    db $20, $08, $d8, $00, $20, $10, $c0, $00, $28, $00, $d5, $00, $28, $08, $d9, $00
    db $28, $10, $da, $00

