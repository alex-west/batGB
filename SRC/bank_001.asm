; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

Call_001_4000: ;{ 01:4000
    ld b, $08
    ld de, $0010
    ld hl, $c122
    xor a
    jr_001_4009:
        ld [hl], a
        add hl, de
        dec b
    jr nz, jr_001_4009
ret ;}

Call_001_400F: ;{ 01:400F
    ld a, [$c1a2]
    and $07
    ld b, a
    ld de, $0010
    ld hl, $c122

    jr_001_401b:
        bit 7, [hl]
            jr z, jr_001_4024
        add hl, de
        dec b
    jr nz, jr_001_401b
ret

jr_001_4024:
    ld a, [$c117]
    and $07
    add a
    ld e, a
    ld a, l
    ld [$c1a3], a
    ld a, h
    ld [$c1a4], a
    ld d, $00
    ld hl, table_001_403D
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

    table_001_403D:
        dw Call_001_405C
        dw Call_001_4099
        dw Call_001_404D
        dw Call_001_411F
        dw Call_001_404D
        dw Call_001_40D6
        dw Call_001_405C
        dw Call_001_405C
;}

Call_001_404D: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ld a, $11
    call $308d
    jr jr_001_4069
    Call_001_405C:
        ld a, [$c1a3]
        ld l, a
        ld a, [$c1a4]
        ld h, a
        ld a, $12
        call $308d
    jr_001_4069:

    ld a, [$c117]
    set 7, a
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    ldh a, [$9e]
    and $40
    swap a
    ld e, a
    ldh a, [$8f]
    add e
    ld [hl+], a
    ld a, $03
    ld d, a
    ldh a, [$9e]
    bit 5, a
    jr nz, jr_001_408d
        ldh a, [$91]
        add $10
        jp Jump_001_4095
    jr_001_408d:
        ld a, d
        cpl
        inc a
        ld d, a
        ldh a, [$91]
        add $10
    Jump_001_4095:
    ld [hl+], a
    ld a, d
    ld [hl+], a
ret ;}

Call_001_4099: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ld a, $12
    call $308d
    ld a, [$c117]
    set 7, a
    ld [hl+], a
    ld a, $f2
    ld [hl+], a
    ldh a, [$9e]
    and $40
    swap a
    ld e, a
    ldh a, [$8f]
    add e
    ld [hl+], a
    ld a, $03
    ld d, a
    ldh a, [$9e]
    bit 5, a
    jr nz, jr_001_40ca
        ldh a, [$91]
        add $10
        jp Jump_001_40d2
    jr_001_40ca:
        ld a, d
        cpl
        inc a
        ld d, a
        ldh a, [$91]
        add $10
    Jump_001_40d2:

    ld [hl+], a
    ld a, d
    ld [hl+], a
ret ;}

Call_001_40D6: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ld a, $14
    call $308d
    ld a, [$c117]
    set 7, a
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    ldh a, [$9e]
    and $40
    swap a
    ld e, a
    ldh a, [$8f]
    add e
    ld [hl+], a
    ld a, $03
    ld d, a
    ld a, $f0
    ld e, a
    ldh a, [$9e]
    bit 5, a
    jr nz, jr_001_410a
        ldh a, [$91]
        add $14
        jp Jump_001_4116
    jr_001_410a:
        ld a, d
        cpl
        inc a
        ld d, a
        ld a, e
        cpl
        inc a
        ld e, a
        ldh a, [$91]
        add $0c
    Jump_001_4116:

    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, e
    ld [hl+], a
ret ;}

Call_001_411F: ;{
    ld a, [$c1a3]
    ld l, a
    cp $22
        ret nz
    ld a, [$c1a4]
    ld h, a
    ld a, $13
    call $308d
    ld a, $03
    ld d, a
    ld a, [$c117]
    set 7, a
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ldh a, [$9e]
    and $40
    swap a
    ld e, a
    ldh a, [$8f]
    add e
    ld [hl+], a
    ldh a, [$9e]
    bit 5, a
    jr nz, jr_001_419a
        ldh a, [$91]
        add $08
        ld [hl+], a
        ld a, d
        ld [hl+], a
        ld a, [$c1a3]
        ld l, a
        ld a, [$c1a4]
        ld h, a
        ld e, l
        ld d, h
        inc de
        inc de
        ld bc, $0010
        add hl, bc
        ld a, [$c117]
        set 7, a
        ld [hl+], a
        ld a, $06
        ld [hl+], a
        ld a, [de]
        ld [hl+], a
        inc de
        ld a, [de]
        sub $08
        ld [hl+], a
        inc de
        ld a, [de]
        ld [hl+], a
        ld a, [$c1a3]
        ld l, a
        ld a, [$c1a4]
        ld h, a
        ld e, l
        ld d, h
        inc de
        inc de
        ld bc, $0020
        add hl, bc
        ld a, [$c117]
        set 7, a
        ld [hl+], a
        ld a, $0a
        ld [hl+], a
        ld a, [de]
        ld [hl+], a
        inc de
        ld a, [de]
        sub $10
        ld [hl+], a
        inc de
        ld a, [de]
        ld [hl+], a
        ret
    jr_001_419a:
        ld a, d
        cpl
        inc a
        ld d, a
        ldh a, [$91]
        add $18
        ld [hl+], a
        ld a, d
        ld [hl+], a
        ld a, [$c1a3]
        ld l, a
        ld a, [$c1a4]
        ld h, a
        ld e, l
        ld d, h
        inc de
        inc de
        ld bc, $0010
        add hl, bc
        ld a, [$c117]
        set 7, a
        ld [hl+], a
        ld a, $06
        ld [hl+], a
        ld a, [de]
        ld [hl+], a
        inc de
        ld a, [de]
        add $08
        ld [hl+], a
        inc de
        ld a, [de]
        ld [hl+], a
        ld a, [$c1a3]
        ld l, a
        ld a, [$c1a4]
        ld h, a
        ld e, l
        ld d, h
        inc de
        inc de
        ld bc, $0020
        add hl, bc
        ld a, [$c117]
        set 7, a
        ld [hl+], a
        ld a, $0a
        ld [hl+], a
        ld a, [de]
        ld [hl+], a
        inc de
        ld a, [de]
        add $10
        ld [hl+], a
        inc de
        ld a, [de]
        ld [hl+], a
        ret
;}

Call_001_41EC: ;{
    ld a, $08
    ld [$c1a5], a
    ld hl, $c122

    jr_001_41f4:
        ld a, l
        ld [$c1a3], a
        ld a, h
        ld [$c1a4], a
        ld a, [hl]
        bit 7, a
        call nz, Call_001_4218
        ld a, [$c1a3]
        ld l, a
        ld a, [$c1a4]
        ld h, a
        ld de, $0010
        add hl, de
        ld a, [$c1a5]
        dec a
        ld [$c1a5], a
            ret z
    jr jr_001_41f4
;}

Call_001_4218: ;{
    cp $90
        jp z, Jump_001_45f5
    and $07
    add a
    ld e, a
    ld d, $00
    ld hl, table_001_422B
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

    table_001_422B:
        dw Call_001_423B
        dw Call_001_42D5
        dw Call_001_4362
        dw Call_001_44EB
        dw Call_001_43C2
        dw Call_001_4435
        dw Call_001_423B
        dw Call_001_423B
;}

Call_001_423B: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    inc hl
    ld a, [hl]
    bit 7, a
    jr z, jr_001_42b2

    inc hl
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl+], a
    ld c, a
    ld a, [hl-]
    ld [$c0eb], a
    ld a, c
    cp $b0
    jr nc, jr_001_42ca

    push bc
    add $f4
    ld e, a
    ld a, b
    add $04
    call $3a8d
    pop bc
    jr c, jr_001_428d

    cp $3f
    jp z, Jump_001_4559

    push bc
    ld a, [$c118]
    call $2dd4
    pop bc
    jr nc, jr_001_42ca

    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ld de, $000e
    add hl, de
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl], a
    ld e, $12
    xor a
    call $100e
    ret


jr_001_428d:
    ldh [$9b], a
    cp $51
    jr z, jr_001_42a3

    sub $5a
    cp $06
    jp c, Jump_001_4649

    ldh a, [$9b]
    and $e0
    xor $40
    jp z, Jump_001_4574

jr_001_42a3:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ldh a, [$99]
    ld d, a
    inc hl
    ld a, $20
    ld [hl], a

jr_001_42b2:
    dec a
    jr z, jr_001_42c6

    ld [hl+], a
    ldh a, [$99]
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    sub d
    ld [hl+], a
    ld c, a
    ld e, $18
    xor a
    call $100e
    ret


Jump_001_42c6:
jr_001_42c6:
    dec hl
    xor a
    ld [hl], a
    ret


jr_001_42ca:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    xor a
    ld [hl], a
    ret ;}

Call_001_42D5: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    inc hl
    ld a, [hl]
    bit 7, a
    jr z, jr_001_433f

    inc a
    jr z, jr_001_4357

    ld [hl+], a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl+], a
    ld c, a
    ld a, [hl-]
    ld [$c0eb], a
    ld a, c
    cp $b0
    jr nc, jr_001_4357

    push bc
    add $f4
    ld e, a
    ld a, b
    add $04
    call $3a8d
    pop bc
    jr c, jr_001_431a

    cp $3f
    jp z, Jump_001_4559

    push bc
    ld a, [$c118]
    call $2dd4
    pop bc
    jr nc, jr_001_4357

    ld e, $12
    xor a
    call $100e
    ret


jr_001_431a:
    ldh [$9b], a
    cp $51
    jr z, jr_001_4330

    sub $5a
    cp $06
    jp c, Jump_001_4649

    ldh a, [$9b]
    and $e0
    xor $40
    jp z, Jump_001_4574

jr_001_4330:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ldh a, [$99]
    ld d, a
    inc hl
    ld a, $20
    ld [hl], a

jr_001_433f:
    dec a
    jr z, jr_001_4353

    ld [hl+], a
    ldh a, [$99]
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl]
    sub d
    ld [hl+], a
    ld c, a
    ld e, $18
    xor a
    call $100e
    ret


jr_001_4353:
    dec hl
    xor a
    ld [hl], a
    ret


jr_001_4357:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    xor a
    ld [hl], a
    ret ;}

Call_001_4362: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl+], a
    ld c, a
    ld a, [hl-]
    ld [$c0eb], a
    ld a, c
    cp $b0
    jr nc, jr_001_43b7

    push bc
    add $f4
    ld e, a
    ld a, b
    add $04
    call $3a8d
    pop bc
    jr c, jr_001_439f

    cp $3f
    jp z, Jump_001_4559

    push bc
    ld a, [$c118]
    call $2dd4
    pop bc
    jr nc, jr_001_43b7

jr_001_4398:
    ld e, $13
    xor a
    call $100e
    ret


jr_001_439f:
    ldh [$9b], a
    cp $51
    jr z, jr_001_4398

    sub $5a
    cp $06
    jp c, Jump_001_4649

    ldh a, [$9b]
    and $e0
    xor $40
    jp z, Jump_001_4574

    jr jr_001_4398

jr_001_43b7:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    xor a
    ld [hl], a
    ret ;}

Call_001_43C2: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    inc hl
    ld a, [hl]
    add $10
    ld [hl+], a
    add $e0
    push hl
    ld b, $00
    ld c, a
    ld hl, table_001_7F00
    add hl, bc
    ld a, [hl]
    sra a
    ld b, a
    pop hl
    ld a, [hl+]
    sub b
    ld b, a
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl+], a
    ld c, a
    ld a, [hl-]
    ld [$c0eb], a
    ld a, c
    cp $b0
    jr nc, jr_001_442a

    push bc
    add $f4
    ld e, a
    ld a, b
    add $04
    call $3a8d
    pop bc
    jr c, jr_001_4412

    cp $3f
    jp z, Jump_001_4559

    push bc
    ld a, [$c118]
    call $2dd4
    pop bc
    jr nc, jr_001_442a

jr_001_440b:
    ld e, $14
    xor a
    call $100e
    ret


jr_001_4412:
    ldh [$9b], a
    cp $51
    jr z, jr_001_440b

    sub $5a
    cp $06
    jp c, Jump_001_4649

    ldh a, [$9b]
    and $e0
    xor $40
    jp z, Jump_001_4574

    jr jr_001_440b

jr_001_442a:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    xor a
    ld [hl], a
    ret ;}

Call_001_4435: ;{
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    push hl
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    add [hl]
    ld [hl+], a
    ld a, [hl]
    ld [$c0eb], a
    adc c
    ld e, l
    ld d, h
    pop hl
    ld c, a
    ld [hl+], a
    ld a, [de]
    cp $03
    jr z, jr_001_445c

    jr c, jr_001_445c

    cp $fd
    jr c, jr_001_4470

jr_001_445c:
    inc de
    ld a, [de]
    bit 7, a
    jr nz, jr_001_4469

    add [hl]
    ld [hl+], a
    inc hl
    ld a, $00
    jr jr_001_446e

jr_001_4469:
    add [hl]
    ld [hl+], a
    inc hl
    ld a, $ff

jr_001_446e:
    adc [hl]
    ld [hl], a

jr_001_4470:
    ldh a, [$9e]
    and $40
    swap a
    sub $02
    ld e, a
    ldh a, [$8f]
    add e
    cp b
    jr nc, jr_001_4493

    add $0c
    cp b
    jr c, jr_001_4493

    ldh a, [$91]
    add $0e
    cp c
    jr nc, jr_001_4493

    add $04
    cp c
    jr c, jr_001_4493

    jp Jump_001_44dd


jr_001_4493:
    ld a, c
    cp $c0
    jr c, jr_001_449c

    cp $e0
    jr c, jr_001_44dd

jr_001_449c:
    push bc
    add $f4
    ld e, a
    cp $a1
    jr nc, jr_001_44e8

    ld a, b
    add $04
    call $3a8d

jr_001_44aa:
    pop bc
    jr c, jr_001_44c5

    cp $3f
    jp z, Jump_001_4559

    push bc
    ld a, [$c118]
    call $2dd4
    pop bc

jr_001_44ba:
    ld a, [$c0f7]
    add $15
    ld e, a
    xor a
    call $100e
    ret


jr_001_44c5:
    ldh [$9b], a
    cp $51
    jr z, jr_001_44ba

    sub $5a
    cp $06
    jp c, Jump_001_4649

    ldh a, [$9b]
    and $e0
    xor $40
    jp z, Jump_001_4574

    jr jr_001_44ba

Jump_001_44dd:
jr_001_44dd:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    xor a
    ld [hl], a
    ret


jr_001_44e8:
    xor a
    jr jr_001_44aa
;}

Call_001_44EB:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    inc hl
    ld a, [hl+]
    and a
    jr z, jr_001_4502

    dec hl
    dec a
    ld [hl+], a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl], a
    ret
jr_001_4502:
    ldh a, [$99]
    ld d, a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl+], a
    ld c, a
    ld a, [hl-]
    ld [$c0eb], a
    ld a, c
    cp $b0
    jr nc, jr_001_454e

    push bc
    add $f4
    ld e, a
    ld a, b
    add $04
    call $3a8d
    pop bc
    jr c, jr_001_4536

    cp $3f
    jp z, Jump_001_4559

    push bc
    ld a, [$c118]
    call $2dd4
    pop bc

jr_001_452f:
    ld e, $17
    xor a
    call $100e
    ret


jr_001_4536:
    ldh [$9b], a
    cp $51
    jr z, jr_001_452f

    sub $5a
    cp $06
    jp c, Jump_001_4649

    ldh a, [$9b]
    and $e0
    xor $40
    jp z, Jump_001_4574

    jr jr_001_452f

jr_001_454e:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    xor a
    ld [hl], a
    ret


Jump_001_4559:
    push bc
    ldh a, [$91]
    sub c
    add $1e
    cp $1d
    jr nc, jr_001_456e

    ldh a, [$8f]
    sub b
    add $18
    cp $28
    jr nc, jr_001_456e

    pop bc
    ret


jr_001_456e:
    ld a, $51
    ldh [$9b], a
    jr jr_001_458a

Jump_001_4574:
    ld a, $26
    call $308d
    push bc
    ldh a, [$9b]
    and $f0
    cp $40
    jr nz, jr_001_4588

    ldh a, [$9b]
    sub $10
    jr jr_001_458a

jr_001_4588:
    ld a, $80

jr_001_458a:
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
    jr nc, jr_001_45ae

    set 4, a

jr_001_45ae:
    add $40
    ld e, a
    ld a, d
    adc $00
    ld [hl+], a
    ld a, e
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ldh a, [$9b]
    cp $51
    jr z, jr_001_45ce

    and $f0
    cp $40
    jr nz, jr_001_45cc

    ldh a, [$9b]
    sub $10
    jr jr_001_45ce

jr_001_45cc:
    ld a, $80

jr_001_45ce:
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $04
    ld [$cb01], a
    pop bc
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    ld a, $90
    ld [hl+], a
    ld a, $18
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld [hl+], a
    ld hl, $0001
    call $19fa
    ret


Jump_001_45f5:
    ld a, [$c1a3]
    ld l, a
    ld a, [$c1a4]
    ld h, a
    inc hl
    dec [hl]
    jp z, Jump_001_42c6

    inc hl
    inc [hl]
    ld a, [hl+]
    ldh [$84], a
    ld b, a
    dec [hl]
    ld a, [hl+]
    ldh [$85], a
    inc [hl]
    ld a, [hl+]
    ldh [$86], a
    ld c, a
    dec [hl]
    ld a, [hl]
    ldh [$87], a
    ld a, b
    sub $08
    ld b, a
    ld e, $10
    ld a, $60
    call $100e
    ldh a, [$85]
    ld b, a
    ldh a, [$86]
    ld c, a
    ld e, $10
    ld a, $20
    call $100e
    ldh a, [$84]
    sub $08
    ld b, a
    ldh a, [$87]
    ld c, a
    ld e, $10
    ld a, $40
    call $100e
    ldh a, [$85]
    ld b, a
    ldh a, [$87]
    ld c, a
    ld e, $10
    xor a
    call $100e
    ret


Jump_001_4649:
    ld a, $1c
    call $308d
    ld a, $25
    ld hl, $dfeb
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld de, $000d
    add hl, de
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    ld a, $99
    ld [hl+], a
    ld a, $be
    ld [hl+], a
    ld a, $83
    ld [hl+], a
    ld a, $25
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, $99
    ld [hl+], a
    ld a, $bf
    ld [hl+], a
    ld a, $83
    ld [hl+], a
    ld a, $25
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$cb01]
    add $0c
    ld [$cb01], a
    ret


    ld a, [$c4c7]
    and a
    jp nz, Jump_001_472b

    ldh a, [$8c]
    swap a
    and $0f
    sla a
    sla a
    ld e, a
    ld d, $00
    ld hl, table_001_47C5
    add hl, de
    ld a, [hl+]
    ldh [$92], a
    ld a, [hl+]
    ldh [$93], a
    ld a, [hl+]
    ldh [$94], a
    ld a, [hl+]
    ldh [$95], a
    ld hl, $ff92
    ldh a, [$8e]
    add [hl]
    ldh [$8e], a
    inc hl
    ldh a, [$8f]
    adc [hl]
    ldh [$8f], a
    inc hl
    ldh a, [$90]
    add [hl]
    ldh [$90], a
    inc hl
    ldh a, [$91]
    adc [hl]
    ldh [$91], a
    ldh a, [$91]
    cp $04
    jr nc, jr_001_46d9

    xor a
    ldh [$90], a
    ld a, $04
    ldh [$91], a

jr_001_46d9:
    ldh a, [$91]
    cp $80
    jr c, jr_001_46e6

    xor a
    ldh [$90], a
    ld a, $7f
    ldh [$91], a

jr_001_46e6:
    ldh a, [$8f]
    cp $80
    jr nc, jr_001_46f3

    xor a
    ldh [$8e], a
    ld a, $80
    ldh [$8f], a

jr_001_46f3:
    ldh a, [$8f]
    cp $f0
    jr c, jr_001_4700

    xor a
    ldh [$8e], a
    ld a, $ef
    ldh [$8f], a

jr_001_4700:
    ld d, $00
    ldh a, [$a1]
    and a
    jr z, jr_001_470e

    dec a
    ldh [$a1], a
    and $04
    jr z, jr_001_472a

jr_001_470e:
    ld e, $50
    ldh a, [$8c]
    bit 7, a
    jr z, jr_001_4718

    ld e, $52

jr_001_4718:
    ldh a, [$8c]
    bit 6, a
    jr z, jr_001_4720

    ld e, $51

jr_001_4720:
    ldh a, [$8f]
    ld b, a
    ldh a, [$91]
    ld c, a
    ld a, d
    call $100e

jr_001_472a:
    ret


Jump_001_472b:
    ldh a, [$90]
    add $c0
    ldh [$90], a
    ldh a, [$91]
    adc $00
    ldh [$91], a
    ldh a, [$8f]
    ld b, a
    ldh a, [$91]
    ld c, a
    ld a, $50
    ld e, a
    xor a
    call $100e
    ret


    xor a
    ld [$c0d9], a
    ld [$c0db], a
    ld [$c4c6], a
    ld a, $55
    ld [$c0d8], a
    ld [$c0da], a
    ret


    ldh a, [$97]
    ld [$c0ef], a
    ld a, [$c0d8]
    ld c, a
    ld a, [$c0d9]
    ld b, a
    ld a, [$c0db]
    cp b
    jr nz, jr_001_4771

    ld a, [$c0da]
    cp c
    jr z, jr_001_479d

jr_001_4771:
    jr c, jr_001_4789

    ld a, [$c0d8]
    and $fc
    add $04
    ld [$c0d8], a
    ld c, a
    ld a, [$c0d9]
    adc $00
    ld [$c0d9], a
    ld b, a
    jr jr_001_479d

jr_001_4789:
    ld a, [$c0d8]
    and $fc
    sub $04
    ld [$c0d8], a
    ld c, a
    ld a, [$c0d9]
    sbc $00
    ld [$c0d9], a
    ld b, a

jr_001_479d:
    ldh a, [$96]
    add c
    ldh [$96], a
    ldh a, [$97]
    ld [$c0ef], a
    adc b
    ldh [$97], a
    ldh a, [$98]
    adc $00
    ldh [$98], a
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
    call nz, $3a49
    ret

table_001_47C5: ;{ 01:47C5 - unknown data
    db $00, $00, $00, $00, $00, $00, $80, $01, $00, $00, $80, $fe

    nop
    nop
    nop
    nop

    db $80, $fe, $00, $00, $a4, $fe, $6a, $01, $a6, $fe, $a6, $fe

    nop
    nop
    nop
    nop

    db $80, $01, $00, $00, $6a, $01, $6a, $01, $6a, $01, $a6, $fe

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
;}

Call_001_4805: ;{
    ldh a, [$8d]
    ld [$c1a3], a
    bit 0, a
    jr nz, jr_001_482a

    ldh a, [$8c]
    bit 0, a
    jr z, jr_001_483d

    ld a, [$c0c0]
    and $f0
    ld d, a
    ld a, [$c0c0]
    and $0f
    dec a
    jr z, jr_001_482a

    and $0f
    or d
    ld [$c0c0], a
    jr jr_001_484e

jr_001_482a:
    ld c, $03
    ld b, $08
    ld de, $0010
    ld hl, $c122

jr_001_4834:
    bit 7, [hl]
    call z, Call_001_489b
    add hl, de
    dec b
    jr nz, jr_001_4834

jr_001_483d:
    ld a, [$c0c0]
    push bc
    and $f0
    ld b, a
    ld a, [$c0dc]
    and $0f
    or b
    pop bc
    ld [$c0c0], a

jr_001_484e:
    ldh a, [$8d]
    ld [$c1a3], a
    bit 1, a
    jr nz, jr_001_4874

    ldh a, [$8c]
    bit 1, a
    jr z, jr_001_4887

    ld a, [$c0c0]
    and $0f
    ld d, a
    ld a, [$c0c0]
    and $f0
    sub $10
    jr z, jr_001_4874

    and $f0
    or d
    ld [$c0c0], a
    jr jr_001_489a

jr_001_4874:
    ld c, $fd
    ld b, $08
    ld de, $0010
    ld hl, $c122

jr_001_487e:
    bit 7, [hl]
    call z, Call_001_489b
    add hl, de
    dec b
    jr nz, jr_001_487e

jr_001_4887:
    ld a, [$c0c0]
    push bc
    and $0f
    ld b, a
    ld a, [$c0dc]
    swap a
    and $f0
    or b
    pop bc
    ld [$c0c0], a

jr_001_489a:
    ret
;}

Call_001_489b: ;{
    xor a
    set 7, a
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    ldh a, [$8f]
    add $03
    ld [hl+], a
    ldh a, [$91]
    add $14
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $11
    call $308d
    ld b, $01
ret ;}

Call_001_48B6: ;{
    ld a, $08
    ld [$c1a5], a
    ld hl, $c122

    jr_001_48be:
        ld a, [hl]
        bit 7, a
            call nz, Call_001_48d2
        ld de, $0010
        add hl, de
        ld a, [$c1a5]
        dec a
        ld [$c1a5], a
            ret z
    jr jr_001_48be
;}

Call_001_48d2: ;{
    push hl
    inc hl
    inc hl
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl], a
    ld c, a
    cp $b0
    jr nc, jr_001_48ff
        push bc
        ld a, [$c4c6]
        and a
        jr nz, jr_001_48ec
            call z, Call_001_4903
            jr jr_001_48ef
        jr_001_48ec:
            call nz, Call_001_49e8
        jr_001_48ef:
    
        jr nc, jr_001_48fa
            pop bc
            ld e, $12
            xor a
            call $100e
            pop hl
            ret
        jr_001_48fa:
            pop bc
            pop hl
            xor a
            ld [hl], a
            ret
    jr_001_48ff:
        pop hl
        xor a
        ld [hl], a
        ret
;}

Call_001_4903: ;{
    ld [$c1a6], a
    ld a, $08
    ld [$c1a8], a
    ld hl, $c359

jr_001_490e:
    ld a, h
    ld [$c2ef], a
    ld a, l
    ld [$c2ee], a
    ld a, [hl+]
    bit 6, a
    jr nz, jr_001_4946

    bit 7, a
    jr z, jr_001_4946

    inc hl
    ld a, [hl+]
    push hl
    rra
    rra
    and $1c
    ld d, $00
    ld e, a
    ld hl, $49c4
    add hl, de
    pop de
    inc de
    ld a, [de]
    add [hl]
    cp b
    jr nc, jr_001_4946

    inc hl
    add [hl]
    cp b
    jr c, jr_001_4946

    inc hl
    inc de
    inc de
    ld a, [de]
    add [hl]
    cp c
    jr nc, jr_001_4946

    inc hl
    add [hl]
    cp c
    jr nc, jr_001_495e

jr_001_4946:
    ld a, [$c2ef]
    ld h, a
    ld a, [$c2ee]
    ld l, a
    ld de, $0010
    add hl, de
    ld a, [$c1a8]
    dec a
    ld [$c1a8], a
    jr nz, jr_001_490e

    xor a
    scf
    ret


jr_001_495e:
    ld a, [$c4c8]
    ld b, a
    ld b, $10
    ld a, [$c2ef]
    ld h, a
    ld a, [$c2ee]
    ld l, a
    inc hl
    ld a, [hl]
    sub b
    ld [hl+], a
    jr z, jr_001_4985

    jr c, jr_001_4985

    ld a, $21
    call $308d
    ld a, [$c2ef]
    ld h, a
    ld a, [$c2ee]
    ld l, a
    ld a, $fe
    and a
    ret


jr_001_4985:
    ld a, $1c
    call $308d
    ld a, [hl-]
    and $0f
    call $1a1b
    ld a, [$c2ef]
    ld h, a
    ld a, [$c2ee]
    ld l, a
    ld a, [hl]
    and $0f
    ld e, a
    ld d, $00
    ld hl, table_001_49B4
    add hl, de
    ld a, [hl]
    ld d, a
    ld a, [$c2ef]
    ld h, a
    ld a, [$c2ee]
    ld l, a
    ld a, d
    ld [hl+], a
    xor a
    ld [hl], a
    ld a, $fc
    and a
    ret
;}

table_001_49B4: ;{
    db $d0, $d0, $d0, $f0, $f0, $d0, $f0, $f0, $d0, $d0, $d0, $d0, $d0, $d0

    ldh a, [$d0]

    db $ee, $14, $fc, $0c, $ee, $14, $fc, $1c

    xor $14
    db $fc
    ld d, $f8
    ld c, $0b
    ld c, $f8
    ld c, $0b
    db $0e

    db $f1, $0f, $fc, $10

    pop af
    ld [de], a
    rlca
    rra
    ld hl, sp+$0e
    dec bc
    ld c, $f8
    ld c, $0b
    db $0e
;}

Call_001_49e8: ;{
    ld a, [$c4af]
    bit 7, a
    jr z, jr_001_4a13

    and $03
    add a
    add a
    ld d, $00
    ld e, a
    ld hl, table_001_4A66
    add hl, de
    ld a, [$c4b0]
    add [hl]
    cp b
    jr nc, jr_001_4a13

    inc hl
    add [hl]
    cp b
    jr c, jr_001_4a13

    inc hl
    ld a, [$c4b1]
    add [hl]
    cp c
    jr nc, jr_001_4a13

    inc hl
    add [hl]
    cp c
    jr nc, jr_001_4a16

jr_001_4a13:
    xor a
    scf
    ret


jr_001_4a16:
    ld a, [$c4c8]
    ld a, $04
    srl a
    ld b, a
    ld a, [$c4b6]
    sub b
    ld [$c4b6], a
    jr c, jr_001_4a30

    ld a, $21
    call $308d
    ld a, $fe
    and a
    ret


jr_001_4a30:
    ld a, [$c4af]
    and $03
    cp $01
    jr nz, jr_001_4a3d
        ld a, $2a
        jr jr_001_4a3f
    jr_001_4a3d:
        ld a, $25
    jr_001_4a3f:

    call $308d
    ld a, [$c4af]
    add a
    and $06
    ld e, a
    ld d, $00
    ld hl, $4a76
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call $19fa
    ld a, [$c4af]
    and $3f
    or $40
    ld [$c4af], a
    call Call_001_4af7
    ld a, $fc
    and a
    ret
;}

table_001_4A66: ;{
    db $f8, $24, $08, $14, $04, $12, $0b, $28, $fc, $26, $04, $28

    db $fc
    ld h, $0c
    db $30

    db $00, $10, $00, $20, $00, $40

    nop
    db $10
;}

Call_001_4a7e: ;{
    ldh a, [$91]
    add $fa
    sub c
    jr nc, jr_001_4a87
        cpl
        inc a
    jr_001_4a87:
    cp $14
    ret nc

    ldh a, [$8f]
    add $03
    sub b
    jr nc, jr_001_4a93
        cpl
        inc a
    jr_001_4a93:
    cp $0c
    ret nc
jr jr_001_4aca ;}

Call_001_4a98: ;{
    ldh a, [$91]
    add $14
    sub c
    jr nc, jr_001_4aa1
        cpl
        inc a
    jr_001_4aa1:
    cp $05
    ret nc

    ldh a, [$8f]
    add $03
    sub b
    jr nc, jr_001_4aad
        cpl
        inc a
    jr_001_4aad:
    cp $05
    ret nc
jr jr_001_4aca ;}

Call_001_4ab2: ;{
    ldh a, [$91]
    add $14
    sub c
    jr nc, jr_001_4abb
        cpl
        inc a
    jr_001_4abb:
    cp $08
    ret nc

    ldh a, [$8f]
    add $0a
    sub b
    jr nc, jr_001_4ac7
        cpl
        inc a
    jr_001_4ac7:
    cp $08
    ret nc
;}

jr_001_4aca: ;{ common branch to the above 3 calls
    ldh a, [$a1]
    and a
        ret nz
    ld a, $c0
    ldh [$a1], a
    ld a, [$c0c8]
    dec a
    ld [$c0c8], a
    jr nz, jr_001_4ae9
        ld a, $27
        call $308d
        ld a, $80
        ld [$c0c9], a
        call $19c1
        ret
    jr_001_4ae9:
        call $19c1
        ld a, $1d
        call $308d
        ret
;}

; 01:4AF2 - Unused?
    ld a, $1d
    call $308d

Call_001_4af7: ;{
    xor a
    ld [$c4b8], a
    ld a, $06
    ld [$c4b9], a
    ld a, $03
    ld [$c4ba], a
    ld a, $04
    ld [$c4bb], a
    ld a, $06
    ld [$c4bc], a
    ld a, $02
    ld [$c4bd], a
    ld b, $10
    ld hl, $c41b

    jr_001_4b19:
        xor a
        ld [hl], a
        ld de, $0009
        add hl, de
        dec b
    jr nz, jr_001_4b19
ret ;}


Call_001_4b23:
    ld a, [$c4b9]
    sub $01
    ld [$c4b9], a
    jr nc, jr_001_4b3b
        ld a, [$c4b8]
        inc a
        and $07
        ld [$c4b8], a
        ld a, $06
        ld [$c4b9], a
    jr_001_4b3b:
    ld a, [$c4b8]
    add a
    ld d, $00
    ld e, a
    ld hl, $4be4
    add hl, de
    ld a, [$c4b0]
    ld b, a
    ld a, [$c4b1]
    ld c, a
    ld a, [hl+]
    add b
    ld b, a
    ld a, [hl]
    add c
    ld c, a
    ld a, [$c4b9]
    ld d, $00
    ld e, a
    ld hl, $4c14
    add hl, de
    ld e, [hl]
    xor a
    call $100e
    ld a, [$c4bb]
    sub $01
    ld [$c4bb], a
    jr nc, jr_001_4b7b
        ld a, [$c4ba]
        inc a
        and $07
        ld [$c4ba], a
        ld a, $06
        ld [$c4bb], a
    jr_001_4b7b:
    ld a, [$c4ba]
    add a
    ld d, $00
    ld e, a
    ld hl, $4be4
    add hl, de
    ld a, [$c4b0]
    ld b, a
    ld a, [$c4b1]
    ld c, a
    ld a, [hl+]
    add b
    ld b, a
    ld a, [hl]
    add c
    ld c, a
    ld a, [$c4bb]
    ld d, $00
    ld e, a
    ld hl, $4c14
    add hl, de
    ld e, [hl]
    xor a
    call $100e
    ld a, [$c4bd]
    sub $01
    ld [$c4bd], a
    jr nc, jr_001_4bbb
        ld a, [$c4bc]
        inc a
        and $07
        ld [$c4bc], a
        ld a, $06
        ld [$c4bd], a
    jr_001_4bbb:
    ld a, [$c4bc]
    add a
    ld d, $00
    ld e, a
    ld hl, $4be4
    add hl, de
    ld a, [$c4b0]
    ld b, a
    ld a, [$c4b1]
    ld c, a
    ld a, [hl+]
    add b
    ld b, a
    ld a, [hl]
    add c
    ld c, a
    ld a, [$c4bd]
    ld d, $00
    ld e, a
    ld hl, $4c14
    add hl, de
    ld e, [hl]
    xor a
    call $100e
ret


    db $00, $02, $20, $1c, $02, $20, $06, $0c, $14, $14, $16, $17, $1e, $fc, $0c, $18

    rlca
    dec c
    dec d
    ld a, [de]
    dec b
    inc b
    ld c, $17
    ld [$1a09], sp
    ld c, $15
    db $10
    rra
    rra
    inc d
    inc e
    inc de
    inc de
    add hl, bc
    dec de
    inc b
    dec c
    add hl, de
    ld de, $0905
    jr nz, jr_001_4c20

    dec e
    db $18

    db $0f, $0e, $0d, $0c, $0d, $0c, $0d

    inc c
    ret


    ld a, [$c0c2]

jr_001_4c20:
    and $fe
    cp $08

jr_001_4c24:
    ret z

    ld hl, $c0f9
    xor a
    ld [hl+], a
    ld [hl], a
    ld a, $02
    ld [$c0f8], a
    ret


Call_001_4c31:
    ld a, [$c0c2]
    and $fe
    cp $08
    ret z

    ld a, [$c0f9]
    and a
    jr z, jr_001_4c57

    dec a
    ld [$c0f9], a
    ld a, [$c0f8]
    sub $02
    jr c, jr_001_4c4e

    cp $02
    jr nc, jr_001_4c50

jr_001_4c4e:
    ld a, $02

jr_001_4c50:
    and $1f
    ld [$c0f8], a
    and a
    ret


jr_001_4c57:
    xor a
    ld [$c0f9], a
    ld a, $02
    ld [$c0f8], a
    scf
    ret


    ld a, [$c0f9]
    inc a
    ld [$c0f9], a
    cp $05
    jr c, jr_001_4c72

    ld a, $04
    ld [$c0f9], a

jr_001_4c72:
    ret


    ld a, [$c0c2]
    and $fe
    cp $08
    ret z

    ld hl, $c0f9
    ld a, [hl+]
    and a
    ret z

    ld a, [$c0f8]
    add [hl]
    ld [hl+], a
    push hl
    ld hl, table_001_7F00
    ld d, $00
    ld e, a
    add hl, de
    ld b, [hl]
    ld a, l
    add $40
    ld l, a
    ld c, [hl]
    pop hl
    ldh a, [$8f]
    add $06
    add b
    ld b, a
    ld [hl+], a
    ldh a, [$91]
    add $10
    add c
    ld c, a
    ld [hl], a
    ld a, [$c0f2]
    and $03
    jr nz, jr_001_4cb4

    push bc
    call Call_001_4d9f
    ld a, $04
    call $2dd4
    pop bc

jr_001_4cb4:
    ld a, [$c0f7]
    and $01
    add $75
    ld e, a
    xor a
    call $100e
    ld hl, $c0f9
    ld a, [hl+]
    cp $02
    ret c

    ld a, [hl+]
    add $80
    inc hl
    inc hl
    push hl
    ld hl, table_001_7F00
    ld d, $00
    ld e, a
    add hl, de
    ld b, [hl]
    ld a, l
    add $40
    ld l, a
    ld c, [hl]
    pop hl
    ldh a, [$8f]
    add $06
    add b
    ld b, a
    ld [hl+], a
    ldh a, [$91]
    add $10
    add c
    ld c, a
    ld [hl], a
    ld a, [$c0f2]
    and $03
    cp $01
    jr nz, jr_001_4cfc

    push bc
    call Call_001_4d9f
    ld a, $04
    call $2dd4
    pop bc

jr_001_4cfc:
    ld a, [$c0f7]
    and $01
    add $75
    ld e, a
    xor a
    call $100e
    ld hl, $c0f9
    ld a, [hl+]
    cp $03
    ret c

    ld a, [hl+]
    add $40
    inc hl
    inc hl
    inc hl
    inc hl
    push hl
    ld hl, table_001_7F00
    ld d, $00
    ld e, a
    add hl, de
    ld b, [hl]
    ld a, l
    add $40
    ld l, a
    ld c, [hl]
    pop hl
    ldh a, [$8f]
    add $06
    add b
    ld b, a
    ld [hl+], a
    ldh a, [$91]
    add $10
    add c
    ld c, a
    ld [hl], a
    ld a, [$c0f2]
    and $03
    cp $02
    jr nz, jr_001_4d46

    push bc
    call Call_001_4d9f
    ld a, $04
    call $2dd4
    pop bc

jr_001_4d46:
    ld a, [$c0f7]
    and $01
    add $75
    ld e, a
    xor a
    call $100e
    ld hl, $c0f9
    ld a, [hl+]
    cp $04
    ret c

    ld a, [hl+]
    add $c0
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    push hl
    ld hl, table_001_7F00
    ld d, $00
    ld e, a
    add hl, de
    ld b, [hl]
    ld a, l
    add $40
    ld l, a
    ld c, [hl]
    pop hl
    ldh a, [$8f]
    add $06
    add b
    ld b, a
    ld [hl+], a
    ldh a, [$91]
    add $10
    add c
    ld c, a
    ld [hl], a
    ld a, [$c0f2]
    and $03
    cp $03
    jr nz, jr_001_4d92

    push bc
    call Call_001_4d9f
    ld a, $04
    call $2dd4
    pop bc

jr_001_4d92:
    ld a, [$c0f7]
    and $01
    add $75
    ld e, a
    xor a
    call $100e
    ret


Call_001_4d9f:
    ld a, $0a
    ldh [$82], a
    ld hl, $c1ac

jr_001_4da6:
    ld a, [hl]
    and a
    jr z, jr_001_4dc8

    push hl
    ld de, $0004
    add hl, de
    ld a, [hl]
    sub b
    jr nc, jr_001_4db5

    cpl
    inc a

jr_001_4db5:
    cp $04
    jr nc, jr_001_4dc7

    ld de, $0004
    add hl, de
    ld a, [hl]
    sub c
    jr nc, jr_001_4dc3

    cpl
    inc a

jr_001_4dc3:
    cp $04
    jr c, jr_001_4dd4

jr_001_4dc7:
    pop hl

jr_001_4dc8:
    ld de, $0010
    add hl, de
    ldh a, [$82]
    dec a
    ldh [$82], a
    jr nz, jr_001_4da6

    ret


jr_001_4dd4:
    pop hl
    xor a
    ld [hl], a
    jr jr_001_4dc8

    ld b, $0a
    ld de, $0010
    ld hl, $c1ac
    xor a

jr_001_4de2:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_4de2

    ret


    push af
    push hl
    push de
    push bc
    ld b, $0a
    ld hl, $c1ac

jr_001_4df1:
    ld a, [hl]
    and a
    jr z, jr_001_4e01

    ld de, $0010
    add hl, de
    dec b
    jr nz, jr_001_4df1

    add sp, $08
    ld a, $ff
    ret


jr_001_4e01:
    pop bc
    pop de
    ld a, [$c24d]
    add $80
    ld [hl+], a
    ld a, e
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, b
    ld [hl+], a
    pop de
    ld a, e
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, d
    ld [hl+], a
    ld a, c
    ld [hl+], a
    pop af
    ld [hl], a
    xor a
    ld a, $22
    call $308d
    ret


    ld b, $0a
    ld hl, $c1ac

jr_001_4e28:
    push bc
    ld a, [hl]
    bit 7, a
    call nz, Call_001_4e38
    ld de, $0010
    add hl, de
    pop bc
    dec b
    jr nz, jr_001_4e28

    ret


Call_001_4e38:
    push hl
    inc hl
    ldh a, [$99]
    ld d, a
    ld a, [hl+]
    add [hl]
    ld [hl+], a
    ld a, [hl+]
    adc [hl]
    ld [hl+], a
    ld b, a
    sub $68
    cp $a8
    jr nc, jr_001_4e7b

    ld a, [hl+]
    add [hl]
    ld [hl+], a
    ld a, [hl+]
    adc [hl]
    sub d
    ld [hl+], a
    ld c, a
    add $10
    cp $c0
    jr nc, jr_001_4e7b

    push hl
    ld de, $fff7
    add hl, de
    bit 0, [hl]
    jr nz, jr_001_4e6f

    push bc
    ld a, c
    sub $0c
    ld e, a
    ld a, b
    sub $fc
    call $3a8d
    pop bc
    jr c, jr_001_4e7a

jr_001_4e6f:
    pop hl
    call Call_001_4e7f
    ld e, [hl]
    xor a
    call $100e
    pop hl
    ret


jr_001_4e7a:
    pop hl

jr_001_4e7b:
    pop hl
    xor a
    ld [hl], a
    ret


Call_001_4e7f:
    ldh a, [$91]
    add $10
    sub c
    jr nc, jr_001_4e88

    cpl
    inc a

jr_001_4e88:
    cp $06
    ret nc

    ldh a, [$9e]
    bit 6, a
    jr nz, jr_001_4ea0

    ldh a, [$8f]
    add $04
    sub b
    jr nc, jr_001_4e9a

    cpl
    inc a

jr_001_4e9a:
    cp $06
    ret nc

    jp Jump_001_4eac


jr_001_4ea0:
    ldh a, [$8f]
    add $08
    sub b
    jr nc, jr_001_4ea9

    cpl
    inc a

jr_001_4ea9:
    cp $05
    ret nc

Jump_001_4eac:
    push bc
    push de
    push hl
    ldh a, [$a1]
    and a
    jr nz, jr_001_4ee4

    ld a, $c0
    ldh [$a1], a
    call Call_001_4c31
    jr nc, jr_001_4edf

    ld a, [$c0c8]
    dec a
    ld [$c0c8], a
    jr nz, jr_001_4ed5

    ld a, $15
    call $308d
    ld a, $80
    ld [$c0c9], a
    call $19c1
    jr jr_001_4ee4

jr_001_4ed5:
    call $19c1
    ld a, $1d
    call $308d
    jr jr_001_4ee4

jr_001_4edf:
    ld a, $1d
    call $308d

jr_001_4ee4:
    pop hl
    pop de
    pop bc
    ret


    ld l, a
    ld h, $00
    push bc
    bit 5, l
    jr z, jr_001_4f02

    bit 3, l
    jr z, jr_001_4efb

    ldh a, [$8f]
    sub b
    rl h
    jr jr_001_4f05

jr_001_4efb:
    rra
    rra
    rra
    rl h
    jr jr_001_4f05

jr_001_4f02:
    ccf
    rl h

jr_001_4f05:
    bit 4, l
    jr z, jr_001_4f27

    bit 1, l
    jr z, jr_001_4f21

    bit 0, l
    jr z, jr_001_4f1a

    ldh a, [$91]
    add $10
    sub c
    rl h
    jr jr_001_4f2a

jr_001_4f1a:
    ldh a, [$ad]
    add a
    rl h
    jr jr_001_4f2a

jr_001_4f21:
    ld a, l
    rra
    rl h
    jr jr_001_4f2a

jr_001_4f27:
    ccf
    rl h

jr_001_4f2a:
    ld c, h
    ld a, l
    rra
    rra
    and $1c
    ld e, a
    ld d, $00
    ld hl, $4f5c
    add hl, de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    srl c
    jr nc, jr_001_4f4c

    ld a, l
    cpl
    add $01
    ld l, a
    ld a, h
    cpl
    adc $00
    ld h, a

jr_001_4f4c:
    srl c
    jr nc, jr_001_4f5a

    ld a, e
    cpl
    add $01
    ld e, a
    ld a, d
    cpl
    adc $00
    ld d, a

jr_001_4f5a:
    pop bc
    ret


    nop
    nop
    add b
    db $01

    db $00, $00, $80, $01, $80, $01, $00, $00

    rrca
    ld bc, $010f
    nop
    nop
    add b
    ld bc, $0000
    add b
    ld bc, $0180
    nop
    nop

    db $3f, $00, $72, $01

    and $3f
    ld [$c24c], a
    push bc
    ld h, $00
    ldh a, [$8f]
    add $04
    sub b
    jr nc, jr_001_4f8e

    cpl
    inc a
    scf

jr_001_4f8e:
    ld d, a
    rl h
    ldh a, [$91]
    add $0c
    sub c
    jr nc, jr_001_4f9b

    cpl
    inc a
    scf

jr_001_4f9b:
    ld e, a
    rl h
    ld a, d
    cp e
    jr z, jr_001_4fe0

    jr nc, jr_001_4fc0

    ld c, e
    ld a, d
    call Call_001_5009
    ld c, h
    ld e, l
    xor a
    sla e
    rla
    sla e
    rla
    ld d, a
    ld hl, $5026
    add hl, de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jr jr_001_4feb

jr_001_4fc0:
    ld c, d
    ld a, e
    call Call_001_5009
    ld c, h
    ld e, l
    xor a
    sla e
    rla
    sla e
    rla
    ld d, a
    ld hl, $5026
    add hl, de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    push de
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    pop hl
    jp Jump_001_4feb


jr_001_4fe0:
    ld c, h
    ld hl, $5126
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld h, [hl]
    ld l, a

Jump_001_4feb:
jr_001_4feb:
    srl c
    jr nc, jr_001_4ff9

    ld a, l
    cpl
    add $01
    ld l, a
    ld a, h
    cpl
    adc $00
    ld h, a

jr_001_4ff9:
    srl c
    jr nc, jr_001_5007

    ld a, e
    cpl
    add $01
    ld e, a
    ld a, d
    cpl
    adc $00
    ld d, a

jr_001_5007:
    pop bc
    ret


Call_001_5009:
    ld b, $07
    ld l, $00
    and a

jr_001_500e:
    jr c, jr_001_5013

    cp c
    jr c, jr_001_5017

jr_001_5013:
    sub c
    scf
    jr jr_001_5018

jr_001_5017:
    and a

jr_001_5018:
    rl l
    dec b
    jr z, jr_001_5020

    add a
    jr jr_001_500e

jr_001_5020:
    ld a, [$c24c]
    and l
    ld l, a
    ret

; 01:5026
    db $00, $00, $80, $01, $05, $00, $7f, $01, $0b, $00, $7f, $01, $11, $00, $7f, $01
    db $17, $00, $7f, $01, $1d, $00, $7e, $01, $23, $00, $7e, $01, $29, $00, $7d, $01
    db $2f, $00, $7d, $01, $35, $00, $7c, $01, $3b, $00, $7b, $01, $41, $00, $7a, $01
    db $46, $00, $79, $01, $4c, $00, $78, $01, $52, $00, $77, $01, $57, $00, $75, $01
    db $5d, $00, $74, $01

    ld h, d
    nop
    ld [hl], e
    db $01

    db $67, $00, $71, $01, $6d, $00, $70, $01, $72, $00, $6e, $01, $77, $00, $6c, $01
    db $7c, $00, $6b, $01

    add c
    nop
    ld l, c
    db $01

    db $86, $00, $67, $01, $8b, $00, $65, $01, $90, $00, $63, $01, $95, $00, $61, $01
    db $99, $00, $5f, $01, $9e, $00, $5d, $01, $a2, $00, $5b, $01, $a7, $00, $59, $01
    db $ab, $00, $57, $01

    xor a
    nop
    ld d, l
    db $01

    db $b4, $00, $53, $01, $b8, $00, $50, $01, $bc, $00, $4e, $01

    ret nz

    nop
    ld c, h
    db $01

    db $c4, $00, $4a, $01, $c7, $00, $47, $01, $cb, $00, $45, $01, $cf, $00, $43, $01

    jp nc, $4100

    db $01

    db $d6, $00, $3e, $01, $d9, $00, $3c, $01

    call c, $3a00
    db $01

    db $e0, $00, $37, $01, $e3, $00, $35, $01, $e6, $00, $33, $01, $e9, $00, $30, $01
    db $ec, $00, $2e, $01

    rst $28
    nop
    inc l
    db $01

    db $f2, $00, $2a, $01, $f4, $00, $27, $01

    rst $30
    nop
    dec h
    db $01

    db $fa, $00, $23, $01, $fc, $00, $20, $01

    rst $38
    nop
    ld e, $01

    db $01, $01, $1c, $01, $04, $01, $1a, $01

    ld b, $01
    jr @+$03

    db $08, $01, $15, $01, $0b, $01, $13, $01

    dec c
    ld bc, $0111

    db $0f, $01, $0f, $01, $18, $52, $31, $52, $4a, $52, $63, $52, $7c, $52

    sub l
    ld d, d

    db $9a, $52, $ab, $52, $bc, $52, $cd, $52, $de, $52

    rst $28
    ld d, d

    db $f8, $52, $fd, $52, $02, $53, $0b, $53, $14, $53, $19, $53, $1e, $53, $23, $53
    db $28, $53, $2d, $53, $32, $53

    scf
    ld d, e

    db $3c, $53, $41, $53, $4e, $53, $67, $53, $80, $53, $a9, $53, $d2, $53, $fb, $53
    db $24, $54, $35, $54, $46, $54

    ld d, a
    ld d, h

    db $68, $54, $79, $54, $8a, $54, $9b, $54, $ac, $54, $bd, $54, $ce, $54, $df, $54
    db $f0, $54, $01, $55, $12, $55, $23, $55, $34, $55, $55, $55, $76, $55, $97, $55
    db $b8, $55, $d9, $55, $fa, $55, $1b, $56, $3c, $56, $65, $56, $8e, $56, $b7, $56
    db $e0, $56, $09, $57

    ld [hl-], a
    ld d, a
    ld d, e
    ld d, a

    db $74, $57, $7d, $57, $86, $57, $97, $57, $a8, $57, $b9, $57, $c2, $57, $cb, $57
    db $d4, $57, $d9, $57, $ea, $57, $fb, $57, $0c, $58, $1d, $58, $2e, $58, $3f, $58
    db $4c, $58, $5d, $58, $6e, $58, $7f, $58, $90, $58, $a1, $58, $a6, $58, $b7, $58

    ret z

    ld e, b
    reti


    ld e, b
    db $ea
    ld e, b

    db $fb, $58, $14, $59, $2d, $59, $46, $59, $5f, $59, $78, $59, $91, $59, $aa, $59
    db $c3, $59, $dc, $59, $f5, $59, $0e, $5a, $27, $5a, $40, $5a, $59, $5a, $72, $5a
    db $8b, $5a, $a4, $5a, $bd, $5a, $ce, $5a, $e7, $5a

    nop
    ld e, e
    add hl, de
    ld e, e

    db $32, $5b, $4b, $5b, $64, $5b, $7d, $5b, $82, $5b, $13, $90, $0a, $50, $00, $a0
    db $04, $00, $00, $a0, $0c, $10, $00, $90, $06, $50, $20, $a0, $04, $10, $20, $a0
    db $0c, $00, $20, $13, $90, $0a, $50, $00, $a0, $04, $02, $00, $a0, $0c, $12, $00
    db $90, $06, $50, $20, $a0, $04, $12, $20, $a0, $0c, $02, $20, $13, $90, $0a, $50
    db $00, $a0, $04, $04, $00, $a0, $0c, $14, $00, $90, $06, $50, $20, $a0, $04, $14
    db $20, $a0, $0c, $04, $20, $13, $90, $0a, $50, $00, $a0, $04, $06, $00, $a0, $0c
    db $16, $00, $90, $06, $50, $20, $a0, $04, $16, $20, $a0, $0c, $06, $20, $13, $90
    db $0b, $50, $00, $a0, $04, $08, $00, $a0, $0c, $18, $00, $90, $05, $50, $20, $a0
    db $04, $18, $20, $a0, $0c, $08, $20

    ld bc, $04a0
    ld e, $00

    db $12, $a0, $04, $0c, $00, $a0, $0c, $1c, $00, $a0, $04, $1c, $20, $a0, $0c, $0c
    db $20, $12, $a0, $04, $0e, $00, $a0, $0c, $1e, $00, $a0, $04, $1e, $20, $a0, $0c
    db $0e, $20, $12, $a0, $04, $30, $20, $a0, $0c, $20, $20, $a0, $04, $20, $00, $a0
    db $0c, $30, $00, $12, $a0, $04, $32, $20, $a0, $0c, $22, $20, $a0, $04, $22, $00
    db $a0, $0c, $32, $00, $12, $a0, $04, $34, $20, $a0, $0c, $24, $20, $a0, $04, $24
    db $00, $a0, $0c, $34, $00

    ld [bc], a
    sbc h
    db $fc
    call z, $9c00
    inc b
    db $dc
    nop

    db $01, $9c, $f8, $2a, $00, $01, $9c, $f8, $3a, $00, $02, $98, $f4, $28, $00, $98
    db $fc, $38, $00, $02, $98, $f4, $26, $00, $98, $fc, $36, $00, $01, $a0, $f8, $46
    db $00, $01, $a0, $f8, $3e, $00, $01, $a0, $f8, $40, $20, $01, $a0, $f8, $42, $00
    db $01, $a0, $f8, $44, $00, $01, $a0, $f8, $2c, $00, $01, $a0, $f8, $2e, $00

    ld bc, $f8a0
    inc a
    nop

    db $01, $a0, $f8, $2a, $00, $03, $9e, $04, $4a, $00, $9e, $0c, $4c, $00, $9e, $14
    db $4e, $00, $06, $a0, $00, $74, $20, $a0, $08, $64, $20, $a0, $10, $54, $20, $b0
    db $00, $76, $20, $b0, $08, $66, $20, $b0, $10, $56, $20, $06, $a0, $00, $50, $00
    db $a0, $08, $60, $00, $a0, $10, $70, $00, $b0, $00, $52, $00, $b0, $08, $62, $00
    db $b0, $10, $72, $00, $0a, $a0, $00, $50, $00, $a0, $08, $60, $00, $a0, $10, $70
    db $00, $a0, $18, $56, $00, $a0, $20, $66, $00, $b0, $00, $52, $00, $b0, $08, $62
    db $00, $b0, $10, $72, $00, $b0, $18, $58, $00, $b0, $20, $68, $00, $0a, $a0, $00
    db $54, $00, $a0, $08, $64, $00, $a0, $10, $74, $00, $a0, $18, $76, $00, $a0, $20
    db $5a, $00, $b0, $00, $52, $00, $b0, $08, $62, $00, $b0, $10, $72, $00, $b0, $18
    db $78, $00, $b0, $20, $6a, $00, $0a, $a0, $00, $5c, $00, $a0, $08, $6c, $00, $a0
    db $10, $7c, $00, $a0, $18, $b4, $00, $a0, $20, $bc, $00, $b0, $00, $5e, $00, $b0
    db $08, $6e, $00, $b0, $10, $7e, $00, $b0, $18, $b6, $00, $b0, $20, $be, $00, $0a
    db $a0, $00, $5c, $00, $a0, $08, $6c, $00, $a0, $10, $7c, $00, $a0, $18, $b4, $00
    db $a0, $20, $bc, $00, $b0, $00, $5e, $00, $b0, $08, $7a, $00, $b0, $10, $7e, $00
    db $b0, $18, $b6, $00, $b0, $20, $be, $00, $12, $98, $f4, $c0, $00, $98, $fc, $d0
    db $00

    sbc b
    db $fc
    ret nz

    jr nz, @-$66

    db $f4
    ret nc

    db $20

    db $12, $98, $f4, $c2, $00, $98, $fc, $d2, $00, $98, $fc, $c2, $20, $98, $f4, $d2
    db $20, $12, $98, $f4, $c4, $00, $98, $fc, $d4, $00

    sbc b
    db $fc
    call nz, $9820
    db $f4
    call nc, $1220
    sbc b
    db $f4
    add $00
    sbc b
    db $fc
    sub $00
    sbc b
    db $fc
    add $20
    sbc b
    db $f4
    sub $20

    db $12, $98, $f4, $c8, $00, $98, $fc, $d8, $00, $98, $fc, $c8, $20, $98, $f4, $d8
    db $20, $12, $98, $f4, $ca, $00, $98, $fc, $da, $00, $98, $fc, $ca, $20, $98, $f4
    db $da, $20, $12, $98, $f4, $cc, $00, $98, $fc, $dc, $00, $98, $fc, $cc, $20, $98
    db $f4, $dc, $20, $12, $98, $f4, $ce, $00, $98, $fc, $de, $00, $98, $fc, $ce, $20
    db $98, $f4, $de, $20, $12, $98, $f4, $e0, $00, $98, $fc, $f0, $00, $98, $fc, $e0
    db $20, $98, $f4, $f0, $20, $12, $98, $f4, $e2, $00, $98, $fc, $f2, $00, $98, $fc
    db $e2, $20, $98, $f4, $f2, $20, $12, $98, $f4, $e4, $00, $98, $fc, $f4, $00, $98
    db $fc, $e4, $20, $98, $f4, $f4, $20, $12, $98, $f4, $e6, $00, $98, $fc, $f6, $00
    db $98, $fc, $e6, $20, $98, $f4, $f6, $20, $12, $98, $f4, $e8, $00, $98, $fc, $f8
    db $00, $98, $fc, $e8, $20, $98, $f4, $f8, $20, $12, $98, $f4, $ea, $00, $98, $fc
    db $fa, $00, $98, $fc, $ea, $20, $98, $f4, $fa, $20, $12, $98, $f4, $ec, $00, $98
    db $fc, $fc, $00, $98, $fc, $ec, $20, $98, $f4, $fc, $20, $12, $98, $f4, $ee, $00
    db $98, $fc, $fe, $00, $98, $fc, $ee, $20, $98, $f4, $fe, $20, $14, $a0, $04, $c0
    db $00, $a0, $0c, $d0, $00, $b0, $04, $c2, $00, $b0, $0c, $d2, $00, $a0, $0c, $c0
    db $20, $a0, $04, $d0, $20, $b0, $0c, $c2, $20, $b0, $04, $d2, $20, $14, $a0, $04
    db $c4, $00, $a0, $0c, $d4, $00, $b0, $04, $c6, $00, $b0, $0c, $d6, $00, $a0, $0c
    db $c4, $20, $a0, $04, $d4, $20, $b0, $0c, $c6, $20, $b0, $04, $d6, $20, $14, $a0
    db $04, $c8, $00, $a0, $0c, $d8, $00, $b0, $04, $ca, $00, $b0, $0c, $da, $00, $a0
    db $0c, $c8, $20, $a0, $04, $d8, $20, $b0, $0c, $ca, $20, $b0, $04, $da, $20, $14
    db $a0, $04, $cc, $00, $a0, $0c, $dc, $00, $b0, $04, $ce, $00, $b0, $0c, $de, $00
    db $a0, $0c, $cc, $20, $a0, $04, $dc, $20, $b0, $0c, $ce, $20, $b0, $04, $de, $20
    db $14, $a0, $04, $e0, $00, $a0, $0c, $f0, $00, $b0, $04, $e2, $00, $b0, $0c, $f2
    db $00, $a0, $0c, $e0, $20, $a0, $04, $f0, $20, $b0, $0c, $e2, $20, $b0, $04, $f2
    db $20, $14, $a0, $04, $e4, $00, $a0, $0c, $f4, $00, $b0, $04, $e6, $00, $b0, $0c
    db $f6, $00

    and b
    inc c
    db $e4
    jr nz, @-$5e

    inc b
    db $f4
    jr nz, @-$4e

    inc c
    and $20
    or b
    inc b
    or $20

    db $14, $a0, $04, $e8, $00, $a0, $0c, $f8, $00, $b0, $04, $ea, $00, $b0, $0c, $fa
    db $00

    and b
    inc c
    add sp, $20
    and b
    inc b
    ld hl, sp+$20
    or b
    inc c
    ld [$b020], a
    inc b
    db $fa
    db $20

    db $14, $a0, $04, $ec, $00, $a0, $0c, $fc, $00, $b0, $04, $ee, $00, $b0, $0c, $fe
    db $00

    and b
    inc c
    db $ec
    jr nz, @-$5e

    inc b
    db $fc
    jr nz, @-$4e

    inc c
    xor $20
    or b
    inc b
    cp $20

    db $15, $a0, $04, $c0, $00, $a0, $0c, $d0, $00, $b0, $04, $c2, $00, $b0, $0c, $d2
    db $00, $a0, $14, $70, $00, $a0, $0c, $c0, $20, $a0, $04, $d0, $20, $b0, $0c, $c2
    db $20, $b0, $04, $d2, $20, $a0, $fc, $70, $00, $15, $a0, $04, $c4, $00, $a0, $0c
    db $d4, $00, $b0, $04, $c6, $00, $b0, $0c, $d6, $00, $a0, $14, $72, $00, $a0, $0c
    db $c4, $20, $a0, $04, $d4, $20, $b0, $0c, $c6, $20, $b0, $04, $d6, $20, $a0, $fc
    db $72, $00, $15, $a0, $04, $c8, $00, $a0, $0c, $d8, $00, $b0, $04, $ca, $00, $b0
    db $0c, $da, $00, $a0, $14, $72, $00, $a0, $0c, $c8, $20, $a0, $04, $d8, $20, $b0
    db $0c, $ca, $20, $b0, $04, $da, $20, $a0, $fc, $72, $00, $15, $a0, $04, $cc, $00
    db $a0, $0c, $dc, $00, $b0, $04, $ce, $00, $b0, $0c, $de, $00, $a0, $13, $74, $00
    db $a0, $0c, $cc, $20, $a0, $04, $dc, $20, $b0, $0c, $ce, $20, $b0, $04, $de, $20
    db $a0, $fd, $74, $00, $15, $a0, $04, $e0, $00, $a0, $0c, $f0, $00, $b0, $04, $e2
    db $00, $b0, $0c, $f2, $00, $a0, $14, $70, $00, $a0, $0c, $e0, $20, $a0, $04, $f0
    db $20, $b0, $0c, $e2, $20, $b0, $04, $f2, $20, $a0, $fc, $70, $00, $15, $a0, $04
    db $e4, $00, $a0, $0c, $f4, $00, $b0, $04, $e6, $00, $b0, $0c, $f6, $00, $b0, $14
    db $76, $00, $a0, $0c, $e4, $20, $a0, $04, $f4, $20, $b0, $0c, $e6, $20, $b0, $04
    db $f6, $20, $b0, $fc, $76, $00

    inc d
    and b
    inc b
    add sp, $00
    and b
    inc c
    ld hl, sp+$00
    or b
    inc b
    ld [$b000], a
    inc c
    ld a, [$a000]
    inc c
    add sp, $20
    and b
    inc b
    ld hl, sp+$20
    or b
    inc c
    ld [$b020], a
    inc b
    ld a, [$1420]
    and b
    inc b
    db $ec
    nop
    and b
    inc c
    db $fc
    nop
    or b
    inc b
    xor $00
    or b
    inc c
    cp $00
    and b
    inc c
    db $ec
    jr nz, @-$5e

    inc b
    db $fc
    jr nz, @-$4e

    inc c
    xor $20
    or b
    inc b
    cp $20

    db $02, $b0, $04, $90, $00, $b0, $0c, $a0, $00, $02, $b0, $04, $92, $00, $b0, $0c
    db $a2, $00, $04, $a0, $04, $94, $00, $a0, $0c, $a4, $00, $b0, $04, $96, $00, $b0
    db $0c, $a6, $00, $04, $a0, $04, $98, $00, $a0, $0c, $a8, $00, $b0, $04, $9a, $00
    db $b0, $0c, $aa, $00, $04, $a0, $04, $9c, $00, $a0, $0c, $ac, $00, $b0, $04, $9e
    db $00, $b0, $0c, $ae, $00, $02, $b0, $04, $b0, $00, $b0, $0c, $b2, $00, $02, $b0
    db $04, $b4, $00, $b0, $0c, $b6, $00, $02, $b0, $04, $b8, $00, $b0, $0c, $ba, $00
    db $01, $b0, $04, $bc, $00, $04, $98, $ec, $a4, $00, $98, $f4, $b4, $00, $98, $fc
    db $58, $00, $98, $04, $68, $00, $04, $98, $ec, $a6, $00, $98, $f4, $b6, $00, $98
    db $fc, $5a, $00, $98, $04, $6a, $00, $04, $98, $ec, $a8, $00, $98, $f4, $b8, $00
    db $98, $fc, $5c, $00, $98, $04, $6c, $00, $04, $98, $ec, $aa, $00, $98, $f4, $ba
    db $00, $98, $fc, $5e, $00, $98, $04, $6e, $00, $04, $98, $ec, $ac, $00, $98, $f4
    db $bc, $00, $98, $fc, $a0, $00, $98, $04, $b0, $00, $04, $98, $ec, $ae, $00, $98
    db $f4, $be, $00, $98, $fc, $a2, $00, $98, $04, $b2, $00, $03, $98, $f0, $b8, $00
    db $98, $f8, $b2, $00, $98, $00, $ba, $00, $12, $a0, $04, $00, $00, $a0, $0c, $10
    db $00

    and b
    inc b
    db $10
    jr nz, @-$5e

    inc c
    nop
    db $20

    db $12, $a0, $04, $02, $00, $a0, $0c, $12, $00

    and b
    inc b
    ld [de], a
    jr nz, @-$5e

    inc c
    ld [bc], a
    db $20

    db $12, $a0, $04, $04, $00, $a0, $0c, $14, $00

    and b
    inc b
    inc d
    jr nz, @-$5e

    inc c
    inc b
    db $20

    db $12, $a0, $04, $06, $00, $a0, $0c, $16, $00

    and b
    inc b
    ld d, $20
    and b
    inc c
    ld b, $20

    db $12, $a0, $04, $08, $00, $a0, $0c, $18, $00

    and b
    inc b
    jr @+$22

    and b
    inc c
    db $08
    db $20

    db $01, $a0, $04, $1e, $00, $12, $a0, $04, $0c, $00, $a0, $0c, $1c, $00

    and b
    inc b
    inc e
    jr nz, @-$5e

    inc c
    inc c
    db $20

    db $12, $a0, $04, $0e, $00, $a0, $0c, $1e, $00

    and b
    inc b
    ld e, $20
    and b
    inc c
    ld c, $20
    ld [de], a
    and b

jr_001_58ca:
    inc b
    jr nc, jr_001_58ed

    and b
    inc c
    jr nz, jr_001_58f1

    and b
    inc b
    jr nz, jr_001_58d5

jr_001_58d5:
    and b
    inc c
    jr nc, jr_001_58d9

jr_001_58d9:
    ld [de], a
    and b
    inc b
    ld [hl-], a
    jr nz, @-$5e

    inc c
    ld [hl+], a
    jr nz, @-$5e

    inc b
    ld [hl+], a
    nop
    and b
    inc c
    ld [hl-], a
    nop
    ld [de], a
    and b
    inc b

jr_001_58ed:
    inc [hl]
    jr nz, @-$5e

    inc c

jr_001_58f1:
    inc h
    jr nz, @-$5e

    inc b
    inc h
    nop
    and b
    inc c
    inc [hl]
    nop

    db $13

    adc b
    db $fc
    jp nc, $9800

    db $f4
    call nz, $9800
    db $fc
    db $d4
    nop

    db $88, $f4, $d2, $20, $98, $fc, $c4, $20, $98, $f4, $d4, $20, $13

    adc b
    db $fc
    jp nz, $9800

    db $f4
    add $00
    sbc b
    db $fc
    sub $00

    db $88, $f4, $c2, $20, $98, $fc, $c6, $20, $98, $f4, $d6, $20, $13, $88, $f7, $e0
    db $00, $98, $f4, $ca, $00, $98, $fc, $da, $00, $88, $f9, $e0, $20, $98, $fc, $ca
    db $20, $98, $f4, $da, $20, $13, $88, $f7, $f0, $00, $98, $f4, $cc, $00, $98, $fc
    db $dc, $00, $88, $f9, $f0, $20, $98, $fc, $cc, $20, $98, $f4, $dc, $20, $13, $88
    db $f8, $e0, $00, $98, $f4, $e2, $00, $98, $fc, $f2, $00, $88, $f8, $e0, $20, $98
    db $fc, $e2, $20, $98, $f4, $f2, $20, $13, $88, $f8, $f0, $00, $98, $f4, $e4, $00
    db $98, $fc, $f4, $00, $88, $f8, $f0, $20, $98, $fc, $e4, $20, $98, $f4, $f4, $20
    db $13, $88, $f8, $bc, $00, $98, $f4, $ba, $00, $98, $fc, $be, $00, $88, $f8, $bc
    db $20, $98, $fc, $ba, $20, $98, $f4, $be, $20, $13, $88, $f8, $b8, $00, $98, $f4
    db $c0, $00, $98, $fc, $d0, $00, $88, $f8, $b8, $20, $98, $fc, $c0, $20, $98, $f4
    db $d0, $20, $13, $88, $f8, $d4, $00, $98, $f4, $c6, $00, $98, $fc, $d6, $00, $88
    db $f8, $d4, $20, $98, $fc, $c6, $20, $98, $f4, $d6, $20, $13, $88, $f8, $c4, $00
    db $98, $f4, $c8, $00, $98, $fc, $d8, $00, $88, $f8, $c4, $20, $98, $fc, $c8, $20
    db $98, $f4, $d8, $20, $13, $88, $f8, $b4, $00, $98, $f4, $a6, $00, $98, $fc, $b6
    db $00, $88, $f8, $b4, $20, $98, $fc, $a6, $20, $98, $f4, $b6, $20, $13, $88, $f8
    db $a4, $00, $98, $f4, $a8, $00, $98, $fc, $b8, $00, $88, $f8, $a4, $20, $98, $fc
    db $a8, $20, $98, $f4, $b8, $20, $13, $88, $f7, $bc, $00, $98, $f4, $ae, $00, $98
    db $fc, $be, $00, $88, $f9, $bc, $20, $98, $fc, $ae, $20, $98, $f4, $be, $20, $13
    db $88, $f7, $ac, $00, $98, $f4, $c0, $00, $98, $fc, $d0, $00, $88, $f9, $ac, $20
    db $98, $fc, $c0, $20, $98, $f4, $d0, $20, $13, $88, $f8, $c4, $00, $98, $f4, $c6
    db $00, $98, $fc, $d6, $00, $88, $f8, $c4, $20, $98, $fc, $c6, $20, $98, $f4, $d6
    db $20, $13, $88, $f8, $d4, $00, $98, $f4, $c8, $00, $98, $fc, $d8, $00, $88, $f8
    db $d4, $20, $98, $fc, $c8, $20, $98, $f4, $d8, $20, $13, $88, $f7, $dc, $00, $98
    db $f4, $ce, $00, $98, $fc, $de, $00, $88, $f9, $dc, $20, $98, $fc, $ce, $20, $98
    db $f4, $de, $20, $13, $88, $f7, $cc, $00, $98, $f4, $e0, $00, $98, $fc, $f0, $00
    db $88, $f9, $cc, $20, $98, $fc, $e0, $20, $98, $f4, $f0, $20, $12, $98, $f4, $aa
    db $00, $98, $fc, $ba, $00, $98, $fc, $aa, $20, $98, $f4, $ba, $20, $13, $88, $f8
    db $d4, $00, $98, $f4, $c8, $00, $98, $fc, $d8, $00, $88, $f8, $d4, $20, $98, $fc
    db $c8, $20, $98, $f4, $d8, $20, $13, $88, $f8, $c4, $00, $98, $f4, $c6, $00, $98
    db $fc, $d6, $00, $88, $f8, $c4, $20, $98, $fc, $c6, $20, $98, $f4, $d6, $20

    inc de
    adc b
    or $ac
    nop
    sbc b
    db $f4
    xor [hl]
    nop
    sbc b
    db $fc
    cp [hl]
    nop
    adc b
    ld a, [$20ac]
    sbc b
    db $fc
    xor [hl]
    jr nz, @-$66

    db $f4
    cp [hl]
    jr nz, jr_001_5b2d

    adc b
    or $bc
    nop
    sbc b
    db $f4
    ret nz

    nop
    sbc b
    db $fc
    ret nc

    nop
    adc b
    ld a, [$20bc]
    sbc b
    db $fc
    ret nz

jr_001_5b2d:
    jr nz, @-$66

    db $f4
    ret nc

    db $20

    db $13

    adc b
    ld a, [$00b4]
    sbc b
    db $f4
    and [hl]
    nop
    sbc b
    db $fc
    or [hl]
    nop

    db $88, $f6, $b4, $20, $98, $fc, $a6, $20, $98, $f4, $b6, $20, $13

    adc b
    ld a, [$00a4]
    sbc b
    db $f4
    xor b
    nop
    sbc b
    db $fc
    cp b
    nop

    db $88, $f6, $a4, $20, $98, $fc, $a8, $20, $98, $f4, $b8, $20, $13

    adc b
    ld a, [$00a2]
    sbc b
    db $f4
    xor d
    nop
    sbc b
    db $fc
    cp d
    nop

    db $88, $f6, $a2, $20, $98, $fc, $aa, $20, $98, $f4, $ba, $20, $01, $a0, $f8, $3e
    db $00, $01, $a0, $f8, $48, $00

    ld b, $05
    ld de, $000f
    ld hl, $c2f6
    xor a

jr_001_5b90:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_5b90

    ret


    ld a, $ff
    ld [$c104], a
    ld a, $05
    ld [$c1a5], a
    ld hl, $c2f6

jr_001_5ba3:
    push hl
    ld bc, $0fa3

jr_001_5ba7:
    ld a, [hl+]
    ld [c], a
    inc c
    dec b
    jr nz, jr_001_5ba7

    ldh a, [$a3]
    bit 7, a
    jr z, jr_001_5bcc

    call Call_001_5be0
    call Call_001_5f75
    call Call_001_5bf6
    call Call_001_5f67
    ld e, $19
    ldh a, [$a7]
    ld c, a
    ldh a, [$a5]
    ld b, a
    ld a, $00
    call $100e

jr_001_5bcc:
    pop hl
    ld bc, $0fa3

jr_001_5bd0:
    ld a, [c]
    ld [hl+], a
    inc c
    dec b
    jr nz, jr_001_5bd0

    ld a, [$c1a5]
    dec a
    ld [$c1a5], a
    jr nz, jr_001_5ba3

    ret


Call_001_5be0:
    and $03
    add a
    ld e, a
    ld d, $00
    ld hl, table_001_5BEE
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

table_001_5BEE:
    dw $5C8F
    dw $5D6E
    dw $5E4D
    dw $5C8F


Call_001_5bf6:
    ldh a, [$99]
    ld d, a
    ldh a, [$ae]
    and a
    jr nz, jr_001_5c26

    ldh a, [$aa]
    ld b, a
    ldh a, [$a6]
    add b
    ldh [$a6], a
    ldh a, [$ab]
    jr nc, jr_001_5c0b

    inc a

jr_001_5c0b:
    xor $ff
    inc a
    ld b, a
    ldh a, [$a7]
    add b
    sub d
    ldh [$a7], a
    ldh a, [$b0]
    and a
    jr z, jr_001_5c24

    ldh a, [$91]
    add b
    cp $fc
    jr c, jr_001_5c22

    xor a

jr_001_5c22:
    ldh [$91], a

jr_001_5c24:
    jr jr_001_5c4a

jr_001_5c26:
    ldh a, [$aa]
    ld b, a
    ldh a, [$a6]
    add b
    ldh [$a6], a
    ldh a, [$ab]
    jr nc, jr_001_5c33

    inc a

jr_001_5c33:
    ld b, a
    ldh a, [$a7]
    add b
    sub d
    ldh [$a7], a
    ldh a, [$b0]
    and a
    jr z, jr_001_5c4a

    ldh a, [$91]
    add b
    cp $93
    jr c, jr_001_5c48

    ld a, $90

jr_001_5c48:
    ldh [$91], a

jr_001_5c4a:
    ldh a, [$af]
    and a
    jr nz, jr_001_5c71

    ldh a, [$a8]
    ld b, a
    ldh a, [$a4]
    add b
    ldh [$a4], a
    ldh a, [$a9]
    jr nc, jr_001_5c5c

    inc a

jr_001_5c5c:
    xor $ff
    inc a
    ld b, a
    ldh a, [$a5]
    add b
    ldh [$a5], a
    ldh a, [$b0]
    and a
    jr z, jr_001_5c6f

    ldh a, [$8f]
    add b
    ldh [$8f], a

jr_001_5c6f:
    jr jr_001_5c8e

jr_001_5c71:
    ldh a, [$a8]
    ld b, a
    ldh a, [$a4]
    add b
    ldh [$a4], a
    ldh a, [$a9]
    jr nc, jr_001_5c7e

    inc a

jr_001_5c7e:
    ld b, a
    ldh a, [$a5]
    add b
    ldh [$a5], a
    ldh a, [$b0]
    and a
    jr z, jr_001_5c8e

    ldh a, [$8f]
    add b
    ldh [$8f], a

jr_001_5c8e:
    ret


    ldh a, [$ad]
    ld b, a
    bit 0, b
    jr z, jr_001_5cb3

    bit 7, b
    jr z, jr_001_5ca0

    ld a, $04
    ldh [$ac], a
    res 7, b

jr_001_5ca0:
    ldh a, [$ac]
    ld c, a
    xor a
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5d67

    ld c, $08
    ldh [$ac], a
    ld b, $02
    jp Jump_001_5d67


jr_001_5cb3:
    bit 1, b
    jr z, jr_001_5ccc

    ldh a, [$ac]
    ld c, a
    ld d, $0a
    ldh a, [$a8]
    add d
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5d67

    ld c, $10
    ld b, $04
    jp Jump_001_5d67


jr_001_5ccc:
    bit 2, b
    jr z, jr_001_5ce5

    ldh a, [$ac]
    ld c, a
    ld d, $05
    ldh a, [$a8]
    add d
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5d67

    ld c, $17
    ld b, $08
    jp Jump_001_5d67


jr_001_5ce5:
    bit 3, b
    jr z, jr_001_5cfd

    ldh a, [$ac]
    ld c, a
    ld d, $02
    ldh a, [$a8]
    add d
    ldh [$a8], a
    dec c
    jr nz, jr_001_5d67

    ldh a, [$b1]
    ld c, a
    ld b, $80
    jr jr_001_5d67

jr_001_5cfd:
    bit 7, b
    jr z, jr_001_5d0d

    ldh a, [$ac]
    ld c, a
    dec c
    jr nz, jr_001_5d67

    ld c, $17
    ld b, $10
    jr jr_001_5d67

jr_001_5d0d:
    bit 4, b
    jr z, jr_001_5d24

    ldh a, [$ac]
    ld c, a
    ld d, $02
    ldh a, [$a8]
    sub d
    ldh [$a8], a
    dec c
    jr nz, jr_001_5d67

    ld c, $10
    ld b, $20
    jr jr_001_5d67

jr_001_5d24:
    bit 5, b
    jr z, jr_001_5d3b

    ldh a, [$ac]
    ld c, a
    ld d, $05
    ldh a, [$a8]
    sub d
    ldh [$a8], a
    dec c
    jr nz, jr_001_5d67

    ld c, $08
    ld b, $40
    jr jr_001_5d67

jr_001_5d3b:
    bit 6, b
    jr z, jr_001_5d52

    ldh a, [$ac]
    ld c, a
    ld d, $0a
    ldh a, [$a8]
    sub d
    ldh [$a8], a
    dec c
    jr nz, jr_001_5d67

    ld c, $04
    ld b, $00
    jr jr_001_5d67

jr_001_5d52:
    ldh a, [$ac]
    ld c, a
    xor a
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5d67

    ld b, $81
    ldh a, [$af]
    xor $ff
    ldh [$af], a
    xor a
    ldh [$a4], a

Jump_001_5d67:
jr_001_5d67:
    ld a, b
    ldh [$ad], a
    ld a, c
    ldh [$ac], a
    ret


    ldh a, [$ad]
    ld b, a
    bit 0, b
    jr z, jr_001_5d92

    bit 7, b
    jr z, jr_001_5d7f

    ld a, $04
    ldh [$ac], a
    res 7, b

jr_001_5d7f:
    ldh a, [$ac]
    ld c, a
    xor a
    ldh [$aa], a
    dec c
    jp nz, Jump_001_5e46

    ld c, $08
    ldh [$ac], a
    ld b, $02
    jp Jump_001_5e46


jr_001_5d92:
    bit 1, b
    jr z, jr_001_5dab

    ldh a, [$ac]
    ld c, a
    ld d, $0a
    ldh a, [$aa]
    add d
    ldh [$aa], a
    dec c
    jp nz, Jump_001_5e46

    ld c, $10
    ld b, $04
    jp Jump_001_5e46


jr_001_5dab:
    bit 2, b
    jr z, jr_001_5dc4

    ldh a, [$ac]
    ld c, a
    ld d, $05
    ldh a, [$aa]
    add d
    ldh [$aa], a
    dec c
    jp nz, Jump_001_5e46

    ld c, $17
    ld b, $08
    jp Jump_001_5e46


jr_001_5dc4:
    bit 3, b
    jr z, jr_001_5ddc

    ldh a, [$ac]
    ld c, a
    ld d, $02
    ldh a, [$aa]
    add d
    ldh [$aa], a
    dec c
    jr nz, jr_001_5e46

    ldh a, [$b1]
    ld c, a
    ld b, $80
    jr jr_001_5e46

jr_001_5ddc:
    bit 7, b
    jr z, jr_001_5dec

    ldh a, [$ac]
    ld c, a
    dec c
    jr nz, jr_001_5e46

    ld c, $17
    ld b, $10
    jr jr_001_5e46

jr_001_5dec:
    bit 4, b
    jr z, jr_001_5e03

    ldh a, [$ac]
    ld c, a
    ld d, $02
    ldh a, [$aa]
    sub d
    ldh [$aa], a
    dec c
    jr nz, jr_001_5e46

    ld c, $10
    ld b, $20
    jr jr_001_5e46

jr_001_5e03:
    bit 5, b
    jr z, jr_001_5e1a

    ldh a, [$ac]
    ld c, a
    ld d, $05
    ldh a, [$aa]
    sub d
    ldh [$aa], a
    dec c
    jr nz, jr_001_5e46

    ld c, $08
    ld b, $40
    jr jr_001_5e46

jr_001_5e1a:
    bit 6, b
    jr z, jr_001_5e31

    ldh a, [$ac]
    ld c, a
    ld d, $0a
    ldh a, [$aa]
    sub d
    ldh [$aa], a
    dec c
    jr nz, jr_001_5e46

    ld c, $04
    ld b, $00
    jr jr_001_5e46

jr_001_5e31:
    ldh a, [$ac]
    ld c, a
    xor a
    ldh [$aa], a
    dec c
    jp nz, Jump_001_5e46

    ld b, $81
    ldh a, [$ae]
    xor $ff
    ldh [$ae], a
    xor a
    ldh [$a6], a

Jump_001_5e46:
jr_001_5e46:
    ld a, b
    ldh [$ad], a
    ld a, c
    ldh [$ac], a
    ret


    ldh a, [$ad]
    ld b, a
    bit 0, b
    jr z, jr_001_5e73

    bit 7, b
    jr z, jr_001_5e5e

    ld a, $04
    ldh [$ac], a
    res 7, b

jr_001_5e5e:
    ldh a, [$ac]
    ld c, a
    xor a
    ldh [$aa], a
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5f60

    ld c, $08
    ldh [$ac], a
    ld b, $02
    jp Jump_001_5f60


jr_001_5e73:
    bit 1, b
    jr z, jr_001_5e93

    ldh a, [$ac]
    ld c, a
    ld d, $0a
    ldh a, [$aa]
    add d
    ldh [$aa], a
    ld d, $0a
    ldh a, [$a8]
    add d
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5f60

    ld c, $10
    ld b, $04
    jp Jump_001_5f60


jr_001_5e93:
    bit 2, b
    jr z, jr_001_5eb3

    ldh a, [$ac]
    ld c, a
    ld d, $05
    ldh a, [$aa]
    add d
    ldh [$aa], a
    ld d, $05
    ldh a, [$a8]
    add d
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5f60

    ld c, $17
    ld b, $08
    jp Jump_001_5f60


jr_001_5eb3:
    bit 3, b
    jp z, Jump_001_5ed5

    ldh a, [$ac]
    ld c, a
    ld d, $02
    ldh a, [$aa]
    add d
    ldh [$aa], a
    ld d, $02
    ldh a, [$a8]
    add d
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5f60

    ldh a, [$b1]
    ld c, a
    ld b, $80
    jp Jump_001_5f60


Jump_001_5ed5:
    bit 7, b
    jr z, jr_001_5ee7

    ldh a, [$ac]
    ld c, a
    dec c
    jp nz, Jump_001_5f60

    ld c, $17
    ld b, $10
    jp Jump_001_5f60


jr_001_5ee7:
    bit 4, b
    jr z, jr_001_5f05

    ldh a, [$ac]
    ld c, a
    ld d, $02
    ldh a, [$aa]
    sub d
    ldh [$aa], a
    ld d, $02
    ldh a, [$a8]
    sub d
    ldh [$a8], a
    dec c
    jr nz, jr_001_5f60

    ld c, $10
    ld b, $20
    jr jr_001_5f60

jr_001_5f05:
    bit 5, b
    jr z, jr_001_5f23

    ldh a, [$ac]
    ld c, a
    ld d, $05
    ldh a, [$aa]
    sub d
    ldh [$aa], a
    ld d, $05
    ldh a, [$a8]
    sub d
    ldh [$a8], a
    dec c
    jr nz, jr_001_5f60

    ld c, $08
    ld b, $40
    jr jr_001_5f60

jr_001_5f23:
    bit 6, b
    jr z, jr_001_5f41

    ldh a, [$ac]
    ld c, a
    ld d, $0a
    ldh a, [$aa]
    sub d
    ldh [$aa], a
    ld d, $0a
    ldh a, [$a8]
    sub d
    ldh [$a8], a
    dec c
    jr nz, jr_001_5f60

    ld c, $04
    ld b, $00
    jr jr_001_5f60

jr_001_5f41:
    ldh a, [$ac]
    ld c, a
    xor a
    ldh [$aa], a
    ldh [$a8], a
    dec c
    jp nz, Jump_001_5f60

    ld b, $81
    ldh a, [$ae]
    xor $ff
    ldh [$ae], a
    ldh a, [$af]
    xor $ff
    ldh [$af], a
    xor a
    ldh [$a4], a
    ldh [$a6], a

Jump_001_5f60:
jr_001_5f60:
    ld a, b
    ldh [$ad], a
    ld a, c
    ldh [$ac], a
    ret


Call_001_5f67:
    ldh a, [$a7]
    add $30
    cp $fe
    jr c, jr_001_5f74

    xor a
    ldh [$a3], a
    jr jr_001_5f74

jr_001_5f74:
    ret


Call_001_5f75:
    ldh a, [$a7]
    add $24
    ld b, a
    ldh a, [$91]
    add $30
    ld c, a
    cp b
    jr c, jr_001_5fc4

    ld a, b
    add $1f
    cp c
    jr c, jr_001_5fc4

    ldh a, [$93]
    bit 7, a
    jr nz, jr_001_5fc4

    and a
    jr nz, jr_001_5fa3

    ldh a, [$92]
    cp $80
    jr nz, jr_001_5fa3

    ldh a, [$a5]
    sub $10
    ld b, a
    ldh a, [$8f]
    cp b
    jr nz, jr_001_5fc4

    jr jr_001_5fb4

jr_001_5fa3:
    ldh a, [$a5]
    sub $10
    ld b, a
    ldh a, [$8f]
    cp b
    jr c, jr_001_5fc4

    ld c, a
    ld a, b
    add $04
    cp c
    jr c, jr_001_5fc4

jr_001_5fb4:
    ld a, $ff
    ldh [$b0], a
    ldh a, [$a5]
    sub $10
    ldh [$8f], a
    ld a, $e4
    ld [$c104], a
    ret


jr_001_5fc4:
    ld a, $00
    ldh [$b0], a
    ret


    ld hl, table_001_5FE2
    ld bc, $000b
    ld de, $9904
    call $0ee0
    ld hl, $6053
    ld bc, $0003
    ld de, $9948
    call $0ee0
    ret

table_001_5FE2: ; "SELECT MODE" text
    inc e
    ld c, $15
    ld c, $0c
    dec e
    dec h
    ld d, $18
    dec c
    ld c, $f0
    or l
    bit 6, a
    
    call nz, Call_001_5ffc
    ldh a, [$b5]
    bit 7, a
    call nz, Call_001_600d
    ret


Call_001_5ffc:
    ld a, [$c0c2]
    inc a
    cp $0d
    jr c, jr_001_6006

    ld a, $01

jr_001_6006:
    ld [$c0c2], a
    call Call_001_601c
    ret


Call_001_600d:
    ld a, [$c0c2]
    dec a
    jr nz, jr_001_6015

    ld a, $0c

jr_001_6015:
    ld [$c0c2], a
    call Call_001_601c
    ret


Call_001_601c:
    ld d, $00
    ld a, [$cb01]
    ld e, a
    ld hl, $cb02
    add hl, de
    push hl
    ld a, [$c0c2]
    ld b, a
    add a
    add b
    ld e, a
    ld d, $00
    ld hl, $6050
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld a, $99
    ld [hl+], a
    ld a, $48
    ld [hl+], a
    ld a, $03
    ld [hl+], a
    ld b, $03

jr_001_6042:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_001_6042

    xor a
    ld [hl], a
    ld a, [$cb01]
    add $06
    ld [$cb01], a
    ret

stageNumbers: ; 01:6053 - Stage numbers (e.g. 1-1, 1-2, etc.)
    db $01, $24, $01, $01, $24, $02, $01, $24, $03, $01, $24, $0b, $02, $24, $01, $02
    db $24, $02, $02, $24, $03, $03, $24, $01, $03, $24, $02, $04, $24, $01, $04, $24
    db $02, $04, $24, $0b
; END, END, END, END
    ld c, $17
    dec c
    ld c, $17
    dec c
    ld c, $17
    dec c
    ld c, $17
    dec c

; Title tilemap in string list format
titleTilemap: ; 01:6083
    ; Bat Symbol
    db $98, $88, $07,                     $40, $50, $50, $70, $80, $00, $a0 
    db $98, $a5, $0b,      $11, $21, $31, $41, $51, $61, $71, $81, $91, $a1, $c7
    db $98, $c4, $0c, $02, $12, $22, $32, $42, $52, $62, $47, $82, $92, $a2, $b2
    db $98, $e4, $0d, $03, $13, $23, $33, $43, $53, $24, $73, $83, $24, $a3, $b3, $c3
    db $99, $04, $0d, $04, $14, $24, $24, $44, $24, $24, $74, $84, $24, $24, $b4, $c4
    db $99, $24, $0d, $05, $15, $24, $35, $24, $24, $24, $24, $85, $95, $24, $b5, $c5
    db $99, $44, $0d, $06, $16, $26, $36, $46, $56, $66, $76, $86, $96, $a6, $b6, $c6
    db $99, $64, $0c, $07, $17, $27, $37, $47, $57, $67, $47, $47, $97, $a7, $b7
    db $99, $85, $0a,      $18, $28, $38, $48, $58, $68, $78, $88, $98, $a8
    db $99, $a8, $05,                     $45, $55, $55, $65, $75
    ; BATMAN Logo
    db $9a, $c3, $10, $09, $19, $29, $39, $49, $59, $69, $79, $89, $99, $a9, $b9, $c9, $d0, $ce, $c7
    db $9a, $e3, $0f, $0a, $1a, $2a, $3a, $4a, $5a, $6a, $7a, $8a, $9a, $aa, $ba, $ca, $d1, $cf
    db $9b, $03, $0f, $0b, $1b, $2b, $3b, $4b, $5b, $6b, $7b, $8b, $9b, $ab, $bb, $cb, $d2, $54
    db $9b, $23, $0f, $0c, $1c, $2c, $3c, $4c, $5c, $6a, $7c, $8c, $9c, $ac, $bc, $cc, $d3, $cf
    db $9b, $43, $0f, $0d, $1d, $2d, $3d, $4d, $5d, $6d, $7d, $8d, $9d, $ad, $bd, $cd, $d4, $63
    ; PUSH START
    db $9c, $25, $0a, $7f, $9e, $be, $8f, $00, $be, $34, $4f, $6f, $34
    ; TM&(C) 1989 DC COMICS INC.
    db $9c, $80, $14, $34, $30, $60, $c0, $b8, $25, $77, $c1, $c2, $00, $c2, $9f, $30, $0f, $c2, $be, $00, $0f, $2f, $5e
    ; ALL RIGHTS
    db $9c, $a7, $0a, $4f, $6e, $6e, $00, $6f, $0f, $8e, $8f, $34, $be
    ; RESERVED
    db $9c, $c7, $08, $6f, $ae, $be, $ae, $6f, $1f, $ae, $c1
    ; (c) 1990 SUNSOFT (top half)
    db $9c, $e3, $0e, $c0, $b8, $08, $01, $94, $a4, $10, $20, $af, $64, $90, $1e, $2e, $3e
    ; SUNSOFT (lower half)
    db $9d, $07, $0a, $87, $a5, $93, $6c, $c8, $72, $0e, $4e, $bf, $3f
    ; LICENSED BY NINTENDO
    db $9d, $20, $14, $6e, $0f, $c2, $ae, $2f, $be, $ae, $c1, $00, $5f, $7e, $00, $2f, $0f, $2f, $34, $ae, $2f, $c1, $9f
    ; [end]
    db $00

    ld [bc], a
    ld b, b
    inc b
    db $01

    ld b, $08
    ld de, $0008
    ld hl, $c3db
    xor a

jr_001_61e8:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_61e8

    ret


Call_001_61ee:
    ld a, $08
    ld bc, $0008
    ld hl, $c3db

jr_001_61f6:
    bit 7, [hl]
    jr z, jr_001_61ff

    add hl, bc
    dec a
    jr nz, jr_001_61f6

    ret


jr_001_61ff:
    push hl
    ld a, $80
    ld [$c4c3], a
    ld a, [$c4c0]
    sub d
    jr nc, jr_001_6216

    cpl
    inc a
    ld c, a
    ld a, [$c4c5]
    ld [$c4c2], a
    jr jr_001_621f

jr_001_6216:
    ld c, a
    ld a, [$c4c5]
    cpl
    inc a
    ld [$c4c2], a

jr_001_621f:
    ld a, [$c4bf]
    sub e
    jr nc, jr_001_6230

    cpl
    inc a
    ld h, a
    ld a, [$c4c5]
    ld [$c4c1], a
    jr jr_001_6239

jr_001_6230:
    ld h, a
    ld a, [$c4c5]
    cpl
    inc a
    ld [$c4c1], a

jr_001_6239:
    ld l, $00
    ld a, h
    cp c
    jr z, jr_001_6252

    jr c, jr_001_6263

    ld a, [$c4be]
    or $c0
    ld [$c4be], a
    call Call_001_627f
    ld a, l
    ld [$c4c4], a
    jr jr_001_6272

jr_001_6252:
    ld a, [$c4be]
    or $80
    ld [$c4be], a
    xor a
    ld [$c4c4], a
    ld [$c4c3], a
    jr jr_001_6272

jr_001_6263:
    ld a, [$c4be]
    or $80
    ld [$c4be], a
    call Call_001_627f
    ld a, l
    ld [$c4c4], a

jr_001_6272:
    pop hl
    ld de, $c4be
    ld b, $08

jr_001_6278:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_001_6278

    ret


Call_001_627f:
    xor a
    ld b, $10

jr_001_6282:
    add hl, hl
    rla
    inc l
    sub c
    jr nc, jr_001_628a

    dec l
    add c

jr_001_628a:
    dec b
    jr nz, jr_001_6282

    ret


Call_001_628e:
    ld a, [$c4be]
    bit 6, a
    jr z, jr_001_62ba

    ld a, [$c4c1]
    ld d, a
    ld a, [$c4bf]
    add d
    ld [$c4bf], a
    ld a, [$c4c4]
    ld d, a
    ld a, [$c4c3]
    add d
    ld [$c4c3], a
    jr nc, jr_001_62dd

    ld a, [$c4c2]
    ld d, a
    ld a, [$c4c0]
    add d
    ld [$c4c0], a
    jr jr_001_62dd

jr_001_62ba:
    ld a, [$c4c2]
    ld d, a
    ld a, [$c4c0]
    add d
    ld [$c4c0], a
    ld a, [$c4c4]
    ld d, a
    ld a, [$c4c3]
    add d
    ld [$c4c3], a
    jr nc, jr_001_62dd

    ld a, [$c4c1]
    ld d, a
    ld a, [$c4bf]
    add d
    ld [$c4bf], a

jr_001_62dd:
    ld e, $13
    ld a, [$c4c0]
    ld c, a
    ld a, [$c4bf]
    ld b, a
    ld a, $00
    ret


    ld a, $08
    ld [$c1a5], a
    ld hl, $c3db

jr_001_62f2:
    push hl
    ld b, $08
    ld de, $c4be

jr_001_62f8:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_001_62f8

    ld a, [$c4be]
    bit 7, a
    jr z, jr_001_6317

    call Call_001_628e
    push af
    push de
    push hl
    call Call_001_4a98
    pop hl
    pop de
    pop af
    call $100e
    call Call_001_632d

jr_001_6317:
    pop hl
    ld b, $08
    ld de, $c4be

jr_001_631d:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_001_631d

    ld a, [$c1a5]
    dec a
    ld [$c1a5], a
    jr nz, jr_001_62f2

    ret


Call_001_632d:
    ld a, [$c4c0]
    add $10
    cp $c0
    jr c, jr_001_633c

    xor a
    ld [$c4be], a
    jr jr_001_634b

jr_001_633c:
    ld a, [$c4bf]
    sub $80
    add $10
    cp $a0
    jr c, jr_001_634b

    xor a
    ld [$c4be], a

jr_001_634b:
    ret


Call_001_634c:
    ldh a, [$b0]
    and a
    jr nz, jr_001_6369

    ldh a, [$ac]
    ld b, a
    ldh a, [$a8]
    add b
    ldh [$a8], a
    ldh a, [$ad]
    jr nc, jr_001_635e

    inc a

jr_001_635e:
    xor $ff
    inc a
    ld b, a
    ldh a, [$a9]
    add b
    ldh [$a9], a
    jr jr_001_637c

jr_001_6369:
    ldh a, [$ac]
    ld b, a
    ldh a, [$a8]
    add b
    ldh [$a8], a
    ldh a, [$ad]
    jr nc, jr_001_6376

    inc a

jr_001_6376:
    ld b, a
    ldh a, [$a9]
    add b
    ldh [$a9], a

jr_001_637c:
    ldh a, [$b1]
    and a
    jr nz, jr_001_6399

    ldh a, [$aa]
    ld b, a
    ldh a, [$a6]
    add b
    ldh [$a6], a
    ldh a, [$ab]
    jr nc, jr_001_638e

    inc a

jr_001_638e:
    xor $ff
    inc a
    ld b, a
    ldh a, [$a7]
    add b
    ldh [$a7], a
    jr jr_001_63ac

jr_001_6399:
    ldh a, [$aa]
    ld b, a
    ldh a, [$a6]
    add b
    ldh [$a6], a
    ldh a, [$ab]
    jr nc, jr_001_63a6

    inc a

jr_001_63a6:
    ld b, a
    ldh a, [$a7]
    add b
    ldh [$a7], a

jr_001_63ac:
    ld a, [$c3da]
    and $01
    ld b, a
    ldh a, [$b2]
    and $0f
    add a
    add b
    ld e, a
    ld d, $00
    ld hl, $63c9
    add hl, de
    ld e, [hl]
    ldh a, [$a9]
    ld c, a
    ldh a, [$a7]
    ld b, a
    ld a, $00
    ret


    db $20, $21, $24, $25, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $26, $26, $27, $27
    db $4f, $4f, $49, $4a, $4b, $4c, $4d, $4d, $4e, $4e

    ld [hl+], a
    ld [hl+], a
    dec d
    ld d, $15
    db $16

Call_001_63e9:
    ldh a, [$a9]
    add $10
    cp $c0
    jr c, jr_001_63f6

    xor a
    ldh [$a3], a
    jr jr_001_6403

jr_001_63f6:
    ldh a, [$a7]
    sub $80
    add $10
    cp $a0
    jr c, jr_001_6403

    xor a
    ldh [$a3], a

jr_001_6403:
    ret


    ld b, $08
    ld de, $0010
    ld hl, $c359
    xor a

jr_001_640d:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_640d

    xor a
    ld [$c4ab], a
    ld a, [$c0c2]
    and $01
    jr nz, jr_001_6422

    ld de, $6613
    jr jr_001_6425

jr_001_6422:
    ld de, $6904

jr_001_6425:
    ld a, e
    ld [$c4ac], a
    ld a, d
    ld [$c4ad], a
    ret


    ld a, $08
    ld [$c1a5], a
    ld hl, $c359

jr_001_6436:
    push hl
    ld bc, $10a3

jr_001_643a:
    ld a, [hl+]
    ld [c], a
    inc c
    dec b
    jr nz, jr_001_643a

    ldh a, [$a3]
    bit 6, a
    jr nz, jr_001_6473

    bit 7, a
    jr z, jr_001_645f

    call Call_001_6545
    call Call_001_634c
    push af
    push de
    push hl
    call Call_001_4ab2
    pop hl
    pop de
    pop af
    call $100e
    call Call_001_63e9

Jump_001_645f:
jr_001_645f:
    pop hl
    ld bc, $10a3

jr_001_6463:
    ld a, [c]
    ld [hl+], a
    inc c
    dec b
    jr nz, jr_001_6463

    ld a, [$c1a5]
    dec a
    ld [$c1a5], a
    jr nz, jr_001_6436

    ret


jr_001_6473:
    ld b, a
    bit 4, a
    jr z, jr_001_648d

    res 4, a
    ldh [$a3], a
    ld a, $04
    ldh [$a5], a
    ldh a, [$a7]
    ldh [$a6], a
    ldh a, [$a9]
    ldh [$a8], a
    xor a
    ldh [$a4], a
    ldh [$aa], a

jr_001_648d:
    bit 5, b
    jp nz, Jump_001_64d6

    jp Jump_001_6495


Jump_001_6495:
    ldh a, [$a4]
    and $0f
    ld e, a
    ld d, $00
    ld hl, $64c6
    add hl, de
    ld a, [hl]
    ld e, a
    ldh a, [$a7]
    ld b, a
    ldh a, [$a9]
    ld c, a
    xor a
    call $100e
    ldh a, [$a5]
    dec a
    jr nz, jr_001_64c1

    ldh a, [$a4]
    inc a
    ldh [$a4], a
    and $0f
    cp $06
    jr c, jr_001_64bf

    xor a
    ldh [$a3], a

jr_001_64bf:
    ld a, $04

jr_001_64c1:
    ldh [$a5], a
    jp Jump_001_645f


    db $0c, $0d, $0c, $0d, $0e, $0f

    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c

Jump_001_64d6:
    ldh a, [$a4]
    and $0f
    ld e, a
    ld d, $00
    ld hl, $652d
    add hl, de
    ld a, [hl]
    ld e, a
    ldh a, [$a6]
    ld b, a
    ldh a, [$a8]
    ld c, a
    xor a
    call $100e
    ldh a, [$a5]
    dec a
    jr nz, jr_001_650e

    ldh a, [$a4]
    inc a
    ldh [$a4], a
    and $0f
    cp $04
    jr c, jr_001_650c

    xor a
    ldh [$a4], a
    ldh a, [$aa]
    inc a
    ldh [$aa], a
    cp $04
    jr c, jr_001_6513

    xor a
    ldh [$a3], a

jr_001_650c:
    ld a, $04

jr_001_650e:
    ldh [$a5], a
    jp Jump_001_645f


jr_001_6513:
    and $03
    add a
    ld e, a
    ld d, $00
    ld hl, $653d
    add hl, de
    ld a, [hl+]
    ld d, a
    ldh a, [$a7]
    add d
    ldh [$a6], a
    ld a, [hl]
    ld d, a
    ldh a, [$a9]
    add d
    ldh [$a8], a
    jr jr_001_650c

    db $0c, $0d, $0e, $0f

    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    inc c
    nop
    nop

    db $00, $1c, $00, $0c, $00, $14

Call_001_6545:
    and $0f
    add a
    ld e, a
    ld d, $00
    ld hl, table_001_6553
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

table_001_6553:
    dw $6B1D
    dw $6BA6
    dw $6D94
    dw $6E17
    dw $6E58
    dw $6C30
    dw $6CA6
    dw $6D1D
    dw $6F02
    dw $6F4E
    dw $6FE2
    dw $704C
    dw $70AD
    dw $70F0
    dw $7133
    dw $6B1D

    ld a, [$c4ac]
    ld e, a
    ld a, [$c4ad]
    ld d, a
    ld a, [de]
    and a
    jp z, Jump_001_65da

    ld b, a
    ld a, [$c4ab]
    inc a
    cp b
    ld [$c4ab], a
    jr nz, jr_001_65ad

    xor a
    ld [$c4ab], a
    inc de
    ld a, [de]
    bit 7, a
    jr nz, jr_001_659d

    and a
    jp z, Jump_001_65e1

    dec a
    jp z, Jump_001_65f6

jr_001_659d:
    ld a, $08
    ld bc, $0010
    ld hl, $c359

jr_001_65a5:
    bit 7, [hl]
    jr z, jr_001_65ae

    add hl, bc
    dec a
    jr nz, jr_001_65a5

jr_001_65ad:
    ret


jr_001_65ae:
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
    ld a, [de]
    ld [hl+], a
    inc de
    xor a
    ld [hl+], a
    ld a, [de]
    ld [hl+], a
    inc de
    xor a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, $81
    ld [hl+], a
    xor a
    ld [hl+], a
    ld [hl+], a
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, e
    ld [$c4ac], a
    ld a, d
    ld [$c4ad], a
    jr jr_001_65ad

Jump_001_65da:
    ld a, $ff
    ld [$c4c7], a
    jr jr_001_65ad

Jump_001_65e1:
    inc de
    ld a, [de]
    ld [$c0da], a
    inc de
    ld a, [de]
    ld [$c0db], a
    inc de
    ld a, e
    ld [$c4ac], a
    ld a, d
    ld [$c4ad], a
    jr jr_001_65ad

Jump_001_65f6:
    inc de
    ld a, [de]
    ld [$c4af], a
    inc de
    ld a, [de]
    ld [$c4b6], a
    inc de
    xor a
    ld [$c4b3], a
    dec a
    ld [$c4c6], a
    ld a, e
    ld [$c4ac], a
    ld a, d
    ld [$c4ad], a
    jr jr_001_65ad

    db $10, $80, $10, $00, $98, $af, $02, $20, $80, $10, $00, $b0, $af, $02, $60, $80
    db $10, $00, $98, $af, $02, $20, $80, $10, $00, $b0, $af, $02, $60, $80, $10, $00
    db $ec, $af, $02, $20, $80, $10, $00, $d4, $af, $02, $60, $80, $10, $00, $ec, $af
    db $02, $20, $80, $10, $00, $d4, $af, $02, $01, $00, $00, $01, $80, $81, $10, $00
    db $d8, $af, $05, $40, $81, $10, $00, $a8, $af, $05, $60, $81, $10, $00, $8c, $af
    db $05, $01, $81, $10, $00, $ac, $af, $05, $01, $81, $10, $00, $cc, $af, $05, $01
    db $81, $10, $00, $ec, $af, $05, $60, $81, $10, $00, $8c, $af, $05, $01, $81, $10
    db $00, $ac, $af, $05, $01, $81, $10, $00, $cc, $af, $05, $01, $81, $10, $00, $ec
    db $af, $05, $80, $84, $40, $13, $71, $70, $0a, $60, $81, $10, $00, $98, $af, $05
    db $20, $81, $10, $00, $e0, $af, $05, $20, $81, $10, $00, $98, $af, $05, $20, $81
    db $10, $00, $e0, $af, $05, $20, $81, $10, $00, $98, $af, $05, $20, $81, $10, $00
    db $e0, $af, $05, $20, $81, $10, $00, $98, $af, $05, $20, $81, $10, $00, $e0, $af
    db $05, $20, $81, $10, $00, $98, $af, $05, $20, $81, $10, $00, $e0, $af, $05, $20
    db $81, $10, $00, $98, $af, $05, $c0, $86, $20, $12, $90, $f1, $0b, $c0, $86, $20
    db $12, $90, $f1, $0b, $c0, $87, $20, $12, $ec, $f1, $0b, $c0, $87, $20, $12, $ec
    db $f1, $0b, $c0, $86, $20, $12, $90, $f1, $0b, $01, $87, $20, $12, $ec, $f1, $0b
    db $c0, $86, $20, $12, $90, $f1, $0b, $01, $87, $20, $12, $ec, $f1, $0b, $c0, $86
    db $20, $12, $a0, $f1, $0b, $30, $86, $20, $12, $a0, $f1, $0b, $c0, $87, $20, $12
    db $dc, $f1, $0b, $01, $00, $00, $01, $30, $87, $20, $12, $dc, $f1, $0b, $c0, $83
    db $30, $13, $90, $f1, $09, $60, $83, $30, $13, $98, $f1, $09, $60, $83, $30, $13
    db $90, $f1, $09, $30, $89, $10, $01, $f0, $af, $01, $30, $83, $30, $13, $98, $f1
    db $09, $30, $89, $10, $01, $f0, $af, $01, $30, $83, $60, $13, $90, $f1, $09, $30
    db $89, $10, $01, $f0, $af, $01, $30, $83, $30, $13, $98, $f1, $09, $80, $82, $10
    db $00, $a0, $af, $00, $20, $82, $10, $00, $e0, $af, $00, $20, $82, $10, $00, $a0
    db $af, $00, $20, $82, $10, $00, $e0, $af, $00, $20, $82, $10, $00, $a0, $af, $00
    db $01, $00, $40, $01, $20, $82, $10, $00, $e0, $af, $00, $10, $8c, $10, $50, $ff
    db $20, $06, $10, $82, $10, $00, $a0, $af, $00, $10, $8c, $10, $50, $ff, $30, $06
    db $10, $82, $10, $00, $e0, $af, $00, $20, $8c, $10, $50, $ff, $40, $06, $20, $8c
    db $10, $50, $ff, $50, $06, $20, $8c, $10, $50, $ff, $60, $06, $20, $8c, $10, $50
    db $ff, $70, $06, $20, $8c, $10, $50, $ff, $80, $06, $40, $8c, $10, $50, $ff, $8c
    db $06, $20, $8c, $10, $50, $ff, $7c, $06, $20, $8c, $10, $50, $ff, $6c, $06, $20
    db $8c, $10, $50, $ff, $5c, $06, $20, $8c, $10, $50, $ff, $4c, $06, $20, $8c, $10
    db $50, $ff, $3c, $06, $20, $8c, $10, $50, $ff, $2c, $06, $20, $8c, $10, $50, $ff
    db $1c, $06, $40, $85, $10, $01, $a8, $f1, $03, $20, $85, $10, $01, $c0, $f1, $03
    db $20, $85, $10, $01, $d8, $f1, $03, $20, $85, $10, $01, $90, $f1, $03, $20, $85
    db $10, $01, $a8, $f1, $03, $20, $85, $10, $01, $e0, $f1, $03, $20, $85, $10, $01
    db $c8, $f1, $03, $20, $85, $10, $01, $e8, $f1, $03, $20, $85, $10, $01, $b0, $f1
    db $03, $20, $8c, $10, $50, $ff, $3c, $06, $20, $85, $10, $01, $e0, $f1, $03, $20
    db $85, $10, $01, $a8, $f1, $03, $20, $8c, $10, $50, $ff, $7c, $06, $20, $85, $10
    db $01, $c8, $f1, $03, $20, $85, $10, $01, $88, $f1, $03, $20, $8c, $10, $50, $ff
    db $4c, $06, $20, $85, $10, $01, $d0, $f1, $03, $20, $85, $10, $01, $b0, $f1, $03
    db $20, $8c, $10, $50, $ff, $1c, $06, $40, $8d, $10, $00, $b0, $af, $07, $20, $8d
    db $10, $00, $d0, $af, $07, $20, $8d, $10, $00, $a0, $af, $07, $20, $8d, $10, $00
    db $e8, $af, $07, $20, $8d, $10, $00, $c8, $af, $07, $20, $8d, $10, $00, $90, $af
    db $07, $20, $8d, $10, $00, $a8, $af, $07, $20, $8d, $10, $00, $d8, $af, $07, $40
    db $8d, $10, $00, $90, $af, $07, $40, $8d, $10, $00, $d0, $af, $07, $40, $8d, $10
    db $00, $b8, $af, $07, $01, $00, $00, $01, $c0, $01, $80, $c0, $04, $00, $00, $01
    db $00, $10, $81, $10, $00, $98, $af, $05, $30, $81, $10, $00, $a8, $af, $05, $30
    db $81, $10, $00, $98, $af, $05, $30, $81, $10, $00, $a8, $af, $05, $30, $81, $10
    db $00, $e0, $af, $05, $30, $81, $10, $00, $d0, $af, $05, $30, $81, $10, $00, $e0
    db $af, $05, $01, $00, $c0, $00, $30, $81, $10, $00, $d0, $af, $05, $40, $8a, $10
    db $00, $b0, $af, $04, $60, $8a, $10, $00, $d0, $af, $04, $60, $8e, $50, $00, $b0
    db $af, $08, $30, $8e, $50, $00, $a0, $af, $08, $30, $8b, $20, $01, $ff, $40, $01
    db $30, $8e, $50, $00, $c8, $af, $08, $30, $8b, $20, $01, $ff, $60, $01, $30, $8e
    db $50, $00, $e0, $af, $08, $30, $8b, $20, $01, $ff, $80, $01, $30, $8e, $50, $00
    db $d0, $af, $08, $01, $00, $40, $01, $30, $85, $10, $01, $a0, $f1, $03, $30, $85
    db $10, $01, $d0, $f1, $03, $30, $85, $10, $01, $c0, $f1, $03, $20, $81, $10, $00
    db $d8, $af, $05, $20, $85, $10, $01, $a0, $f1, $03, $20, $81, $10, $00, $c8, $af
    db $05, $20, $85, $10, $01, $e0, $f1, $03, $20, $81, $10, $00, $98, $af, $05, $20
    db $85, $10, $01, $b0, $f1, $03, $20, $8c, $10, $50, $ff, $7c, $06, $20, $85, $10
    db $01, $c0, $f1, $03, $20, $8c, $10, $50, $ff, $3c, $06, $20, $81, $10, $00, $98
    db $af, $05, $20, $8c, $10, $50, $ff, $5c, $06, $20, $85, $10, $01, $a0, $f1, $03
    db $20, $8c, $10, $50, $ff, $1c, $06, $20, $8c, $10, $50, $ff, $3c, $06, $20, $8c
    db $10, $50, $ff, $5c, $06, $20, $8c, $10, $50, $ff, $7c, $06, $20, $8c, $10, $50
    db $ff, $4c, $06, $20, $8c, $10, $50, $ff, $60, $06, $20, $8c, $10, $50, $ff, $28
    db $06, $20, $82, $10, $00, $a0, $af, $00, $20, $8c, $10, $50, $ff, $68, $06, $20
    db $82, $10, $00, $e0, $af, $00, $20, $8c, $10, $50, $ff, $1c, $06, $20, $82, $10
    db $00, $a0, $af, $00, $20, $8c, $10, $50, $ff, $38, $06, $20, $8d, $10, $00, $b0
    db $af, $07, $20, $8c, $10, $50, $ff, $68, $06, $20, $8d, $10, $00, $d0, $af, $07
    db $20, $8c, $10, $50, $ff, $2c, $06, $20, $8d, $10, $00, $c0, $af, $07, $20, $8c
    db $10, $50, $ff, $78, $06, $20, $8d, $10, $00, $a8, $af, $07, $20, $8c, $10, $50
    db $ff, $40, $06, $20, $8d, $10, $00, $e0, $af, $07, $01, $00, $00, $01, $20, $8c
    db $10, $50, $ff, $3c, $06, $20, $8d, $10, $00, $b8, $af, $07, $20, $8c, $10, $50
    db $ff, $18, $06, $01, $00, $80, $00, $08, $88, $20, $01, $c0, $af, $00, $30, $88
    db $20, $01, $e0, $af, $00, $30, $88, $20, $01, $c0, $af, $00, $30, $88, $20, $01
    db $e0, $af, $00, $30, $88, $20, $01, $c0, $af, $00, $30, $88, $20, $01, $e0, $af
    db $00, $30, $88, $20, $01, $c0, $af, $00, $30, $88, $20, $01, $e0, $af, $00, $30
    db $88, $20, $01, $c0, $af, $00, $30, $88, $20, $01, $e0, $af, $00, $30, $88, $20
    db $01, $c0, $af, $00, $30, $88, $20, $01, $e0, $af, $00, $80, $8a, $10, $00, $b8
    db $af, $04, $80, $8a, $10, $00, $d8, $af, $04, $01, $00, $40, $01, $c0, $01, $81
    db $64, $c0, $01, $82, $ff, $04, $00, $40, $01, $00

    ldh a, [$af]
    ld b, a
    bit 0, b
    jr z, jr_001_6b4a

    bit 7, b
    jr z, jr_001_6b2e

    ld a, $4f
    ldh [$ae], a
    res 7, b

jr_001_6b2e:
    ldh a, [$ae]
    ld c, a
    ld a, $df
    ldh [$ac], a
    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, b
    dec c
    jr nz, jr_001_6ba0

    ld c, $05
    ld a, $02
    jr jr_001_6ba0

jr_001_6b4a:
    ldh a, [$ae]
    ld c, a
    bit 1, b
    jr z, jr_001_6b82

    xor a
    ldh [$ac], a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, b
    dec c
    jr nz, jr_001_6ba0

    ldh a, [$a7]
    ld [$c4bf], a
    ldh a, [$a9]
    ld [$c4c0], a
    ldh a, [$8f]
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, $01
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc
    ld c, $ff
    ld a, $04
    jr jr_001_6ba0

jr_001_6b82:
    ldh a, [$ae]
    ld c, a
    ld a, $ff
    ldh [$ac], a
    ld a, $01
    ldh [$ad], a
    xor a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    inc a
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6ba0

    xor a
    ldh [$a3], a
    ld a, $81

jr_001_6ba0:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 0, b
    jr z, jr_001_6bd3

    bit 7, b
    jr z, jr_001_6bb7

    ld a, $3f
    ldh [$ae], a
    res 7, b

jr_001_6bb7:
    ldh a, [$ae]
    ld c, a
    ld a, $df
    ldh [$ac], a
    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, b
    dec c
    jr nz, jr_001_6c2a

    ld c, $05
    ld a, $02
    jr jr_001_6c2a

jr_001_6bd3:
    ldh a, [$ae]
    ld c, a
    bit 1, b
    jr z, jr_001_6c0d

    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, $40
    ldh [$ac], a
    ld a, b
    dec c
    jr nz, jr_001_6c2a

    ldh a, [$a7]
    ld [$c4bf], a
    ldh a, [$a9]
    ld [$c4c0], a
    ldh a, [$8f]
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, $01
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc
    ld c, $ff
    ld a, $04
    jr jr_001_6c2a

jr_001_6c0d:
    ldh a, [$ae]
    ld c, a
    ld a, $ff
    ldh [$ac], a
    ld a, $01
    ldh [$ad], a
    xor a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6c2a

    xor a
    ldh [$a3], a
    ld a, $81

jr_001_6c2a:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 0, b
    jr z, jr_001_6c5f

    bit 7, b
    jr z, jr_001_6c41

    ld a, $3f
    ldh [$ae], a
    res 7, b

jr_001_6c41:
    ldh a, [$ae]
    ld c, a
    ld a, $ff
    ldh [$ac], a
    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    ld a, $01
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6ca0

    ld c, $05
    ld a, $02
    jr jr_001_6ca0

jr_001_6c5f:
    ldh a, [$ae]
    ld c, a
    bit 1, b
    jr z, jr_001_6c81

    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    ld a, $01
    ldh [$b0], a
    ld a, $40
    ldh [$ac], a
    ld a, b
    dec c
    jr nz, jr_001_6ca0

    ld c, $ff
    ld a, $04
    jr jr_001_6ca0

jr_001_6c81:
    ldh a, [$ae]
    ld c, a
    ld a, $01
    ldh [$ad], a
    ld a, $80
    ldh [$ac], a
    xor a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    ld a, $01
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6ca0

    xor a
    ldh [$a3], a
    ld a, $81

jr_001_6ca0:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 0, b
    jr z, jr_001_6cd9

    bit 7, b
    jr z, jr_001_6cb7

    ld a, $4f
    ldh [$ae], a
    res 7, b

jr_001_6cb7:
    ldh a, [$ae]
    ld c, a
    ld a, $ff
    ldh [$ac], a
    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    ld a, $01
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6d17

    ld c, $ff
    ld a, $02
    ld hl, $ffb2
    inc [hl]
    jr jr_001_6d17

jr_001_6cd9:
    ldh a, [$ae]
    ld c, a
    xor a
    ldh [$ab], a
    ld a, $30
    ldh [$ac], a
    ld a, $75
    ldh [$aa], a
    ld a, $01
    ldh [$b1], a
    ldh [$b0], a
    ldh [$ad], a
    ld a, c
    and $0f
    jr nz, jr_001_6d0e

    ldh a, [$a7]
    ld [$c4bf], a
    ldh a, [$a9]
    ld [$c4c0], a
    ldh a, [$8f]
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, $01
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc

jr_001_6d0e:
    ld a, b
    dec c
    jr nz, jr_001_6d17

    xor a
    ldh [$a3], a
    ld a, $81

jr_001_6d17:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 0, b
    jr z, jr_001_6d50

    bit 7, b
    jr z, jr_001_6d2e

    ld a, $4f
    ldh [$ae], a
    res 7, b

jr_001_6d2e:
    ldh a, [$ae]
    ld c, a
    ld a, $ff
    ldh [$ac], a
    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    ld a, $01
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6d8e

    ld c, $ff
    ld a, $02
    ld hl, $ffb2
    inc [hl]
    jr jr_001_6d8e

jr_001_6d50:
    ldh a, [$ae]
    ld c, a
    xor a
    ldh [$ab], a
    ldh [$b1], a
    ld a, $30
    ldh [$ac], a
    ld a, $75
    ldh [$aa], a
    ld a, $01
    ldh [$ad], a
    ldh [$b0], a
    ld a, c
    and $0f
    jr nz, jr_001_6d85

    ldh a, [$a7]
    ld [$c4bf], a
    ldh a, [$a9]
    ld [$c4c0], a
    ldh a, [$8f]
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, $01
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc

jr_001_6d85:
    ld a, b
    dec c
    jr nz, jr_001_6d8e

    xor a
    ldh [$a3], a
    ld a, $81

jr_001_6d8e:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, b
    jr z, jr_001_6dfc

    ld a, $ff
    ldh [$ae], a
    res 7, b
    ldh a, [$a7]
    ld d, a
    ldh a, [$8f]
    cp d
    jr c, jr_001_6dca

    jr z, jr_001_6de8

    ld a, $01
    ldh [$b1], a
    ldh a, [$91]
    xor $ff
    inc a
    ld d, a
    ldh a, [$a9]
    add d
    add $5f
    ldh [$ac], a
    ldh a, [$a7]
    xor a
    inc a
    ld d, a
    ldh a, [$8f]
    add d
    add $7f
    ldh [$aa], a
    jr jr_001_6dfc

jr_001_6dca:
    xor a
    ldh [$b1], a
    ldh a, [$91]
    xor $ff
    inc a
    ld d, a
    ldh a, [$a9]
    add d
    add $5f
    ldh [$ac], a
    ldh a, [$8f]
    xor a
    inc a
    ld d, a
    ldh a, [$a7]
    add d
    add $7f
    ldh [$aa], a
    jr jr_001_6dfc

jr_001_6de8:
    xor a
    ldh [$b1], a
    ldh a, [$91]
    xor $ff
    inc a
    ld d, a
    ldh a, [$a9]
    add d
    add $5f
    ldh [$ac], a
    ld a, $00
    ldh [$aa], a

jr_001_6dfc:
    ldh a, [$ae]
    ld c, a
    ld a, $01
    ldh [$ad], a
    xor a
    ldh [$ab], a
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6e11

    xor a
    ldh [$a3], a
    ld a, $81

jr_001_6e11:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, b
    jr z, jr_001_6e24

    ld a, $30
    ldh [$ae], a
    res 7, b

jr_001_6e24:
    ldh a, [$ae]
    ld c, a
    ld a, $af
    ldh [$ac], a
    xor a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    inc a
    ldh [$b0], a
    ld a, b
    dec c
    jp nz, Jump_001_6e52

    ldh a, [$a9]
    add $08
    ld d, a
    ldh a, [$a7]
    add $08
    ld e, a
    ld a, $11
    ld l, a
    ld a, $19
    call Call_001_78c5
    ld c, $20
    ld a, $01

Jump_001_6e52:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 0, b
    jr z, jr_001_6e89

    bit 7, b
    jr z, jr_001_6e69

    ld a, $5c
    ldh [$ae], a
    res 7, b

jr_001_6e69:
    ldh a, [$ae]
    ld c, a
    ld a, $df
    ldh [$aa], a
    xor a
    ldh [$ab], a
    ldh [$ac], a
    ldh [$ad], a
    ldh [$b0], a
    ld a, $01
    ldh [$b1], a
    ld a, b
    dec c
    jp nz, Jump_001_6efc

    ld c, $20
    ld a, $02
    jp Jump_001_6efc


jr_001_6e89:
    ldh a, [$ae]
    ld c, a
    bit 1, b
    jr z, jr_001_6ede

    xor a
    ldh [$ac], a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, b
    dec c
    jr nz, jr_001_6efc

    ldh a, [$a9]
    ld d, a
    ldh a, [$a7]
    sub $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $00
    call Call_001_78c5
    ldh a, [$a9]
    ld d, a
    ldh a, [$a7]
    ld e, a
    ld a, $11
    ld l, a
    ld a, $01
    call Call_001_78c5
    ldh a, [$a9]
    ld d, a
    ldh a, [$a7]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $02
    call Call_001_78c5
    ld c, $80
    ld a, $10
    add b
    bit 6, a
    jr z, jr_001_6efc

    ld c, $ff
    ld a, $04
    jr jr_001_6efc

jr_001_6ede:
    ldh a, [$ae]
    ld c, a
    ld a, $ff
    ldh [$ac], a
    ld a, $01
    ldh [$ad], a
    xor a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b1], a
    inc a
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_6efc

    xor a
    ldh [$a3], a
    ld a, $81

Jump_001_6efc:
jr_001_6efc:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, b
    jr z, jr_001_6f0f

    ld a, $2f
    ldh [$ae], a
    res 7, b

jr_001_6f0f:
    ldh a, [$ae]
    ld c, a
    ldh a, [$99]
    ldh [$ad], a
    xor a
    ldh [$ac], a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, b
    dec c
    jr nz, jr_001_6f48

    ldh a, [$a7]
    ld [$c4bf], a
    ldh a, [$a9]
    ld [$c4c0], a
    ldh a, [$91]
    sub $20
    jr nc, jr_001_6f37

    ld a, $08

jr_001_6f37:
    ld d, a
    ldh a, [$8f]
    ld e, a
    ld a, $01
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc
    ld c, $2f
    ld a, b

jr_001_6f48:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 0, b
    jr z, jr_001_6f83

    bit 7, b
    jr z, jr_001_6f5f

    ld a, $ff
    ldh [$ae], a
    res 7, b

jr_001_6f5f:
    ldh a, [$ae]
    ld c, a
    ldh a, [$99]
    ldh [$ad], a
    xor a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$ac], a
    ldh [$b0], a
    ldh [$b1], a
    ldh a, [$91]
    ld d, a
    ldh a, [$a9]
    sub $30
    cp d
    ld a, b
    jr nc, jr_001_6fdc

    ld c, $30
    ld a, $02
    jp Jump_001_6fdc


jr_001_6f83:
    ldh a, [$ae]
    ld c, a
    bit 1, b
    jr z, jr_001_6fa3

    ld a, $01
    ldh [$ab], a
    xor a
    ldh [$aa], a
    ldh [$ac], a
    ldh [$ad], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, b
    dec c
    jr nz, jr_001_6fdc

    ld c, $ff
    ld a, $04
    jr jr_001_6fdc

jr_001_6fa3:
    ldh a, [$ae]
    ld c, a
    ld a, $01
    ldh [$ad], a
    ld a, $80
    ldh [$ac], a
    xor a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$b0], a
    ldh [$b1], a
    ld a, c
    and $0f
    jr nz, jr_001_6fd6

    ldh a, [$a7]
    ld [$c4bf], a
    ldh a, [$a9]
    ld [$c4c0], a
    ldh a, [$8f]
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, $01
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc

jr_001_6fd6:
    ld a, b
    dec c
    jr nz, jr_001_6fdc

    ld c, $ff

Jump_001_6fdc:
jr_001_6fdc:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, b
    jr z, jr_001_6fef

    ld a, $08
    ldh [$ae], a
    res 7, b

jr_001_6fef:
    dec a
    jr nz, jr_001_702a

    ldh a, [$ae]
    ld c, a
    ld a, $01
    ldh [$ad], a
    ld a, $80
    ldh [$aa], a
    xor a
    ldh [$ab], a
    ldh [$ac], a
    ldh [$b0], a
    ldh [$b1], a
    dec c
    ld a, b
    jr nz, jr_001_7045

    ld c, $10
    inc b
    ldh a, [$a7]
    ld [$c4bf], a
    ldh a, [$a9]
    ld [$c4c0], a
    ldh a, [$8f]
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, $01
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc
    jp Jump_001_7045


jr_001_702a:
    ldh a, [$ae]
    ld c, a
    ld a, $01
    ldh [$ad], a
    ldh [$b1], a
    ld a, $80
    ldh [$aa], a
    xor a
    ldh [$ab], a
    ldh [$ac], a
    ldh [$b0], a
    ld a, b
    dec c
    jr nz, jr_001_7045

    ld c, $10
    dec b

Jump_001_7045:
jr_001_7045:
    ld a, b
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, b
    jr z, jr_001_705e

    ld a, $20
    ldh [$ae], a
    xor a
    ldh [$b0], a
    ldh [$b1], a
    res 7, b

jr_001_705e:
    bit 4, b
    jr nz, jr_001_709b

    ldh a, [$ae]
    ld c, a
    ld a, $c0
    ldh [$aa], a
    ldh [$ac], a
    xor a
    ldh [$ab], a
    ldh [$ad], a
    dec c
    ld a, b
    jr nz, jr_001_70a6

    ldh a, [$91]
    ld d, a
    ldh a, [$a9]
    cp d
    jr nc, jr_001_7082

    ld a, $01
    ldh [$b0], a
    jr jr_001_7085

jr_001_7082:
    xor a
    ldh [$b0], a

jr_001_7085:
    ldh a, [$8f]
    ld d, a
    ldh a, [$a7]
    cp d
    jr nc, jr_001_7093

    ld a, $01
    ldh [$b1], a
    jr jr_001_7096

jr_001_7093:
    xor a
    ldh [$b1], a

jr_001_7096:
    ld c, $20
    inc b
    jr jr_001_70a6

jr_001_709b:
    ld a, $c0
    ldh [$ac], a
    ldh [$aa], a
    xor a
    ldh [$ab], a
    ldh [$ad], a

jr_001_70a6:
    ld a, b
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, b
    jr z, jr_001_70bf

    ld a, $20
    ldh [$ae], a
    xor a
    ldh [$b0], a
    ldh [$b1], a
    res 7, b

jr_001_70bf:
    bit 0, b
    jr z, jr_001_70d9

    ldh a, [$ae]
    ld c, a
    ld a, $c0
    ldh [$aa], a
    xor a
    ldh [$ab], a
    ldh [$ad], a
    ldh [$ac], a
    dec c
    ld a, b
    jr nz, jr_001_70ea

    ld c, $ff
    ld a, $02

jr_001_70d9:
    ldh a, [$ae]
    ld c, a
    ld a, $80
    ldh [$aa], a
    ld a, $01
    ldh [$ab], a
    xor a
    ldh [$ad], a
    ldh [$ac], a
    ld a, b

jr_001_70ea:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, b
    jr z, jr_001_7102

    ld a, $20
    ldh [$ae], a
    xor a
    ldh [$b0], a
    ldh [$b1], a
    res 7, b

jr_001_7102:
    bit 0, b
    jr z, jr_001_711c

    ldh a, [$ae]
    ld c, a
    ld a, $c0
    ldh [$ac], a
    xor a
    ldh [$ab], a
    ldh [$ad], a
    ldh [$aa], a
    dec c
    ld a, b
    jr nz, jr_001_712d

    ld c, $ff
    ld a, $02

jr_001_711c:
    ldh a, [$ae]
    ld c, a
    ld a, $80
    ldh [$ac], a
    ld a, $01
    ldh [$ad], a
    xor a
    ldh [$ab], a
    ldh [$aa], a
    ld a, b

jr_001_712d:
    ldh [$af], a
    ld a, c
    ldh [$ae], a
    ret


    ldh a, [$af]
    ld b, a
    bit 7, a
    jr z, jr_001_713e

    ld c, $ff
    ld b, $01

jr_001_713e:
    ldh a, [$99]
    ld d, a
    ldh a, [$a9]
    sub d
    ldh [$a9], a
    xor a
    ldh [$ac], a
    ldh [$ad], a
    ldh [$aa], a
    ldh [$ab], a
    ld a, $f0
    ldh [$a4], a
    ld a, c
    ldh [$ae], a
    ld a, b
    ldh [$af], a
    ret


    ld a, [$c4af]
    bit 7, a
    jr z, jr_001_7186

    call Call_001_721b
    call Call_001_71b1
    ld a, [$c4b1]
    ld c, a
    ld a, [$c4b0]
    ld b, a
    ld a, $00
    push bc
    call $100e
    pop bc
    ld a, b
    add $10
    ld b, a
    call Call_001_4a7e
    ret


    ld hl, sp+$08
    ld [$f802], sp
    inc c
    pop af
    ld c, b

jr_001_7186:
    call Call_001_4b23
    ld a, [$c4b9]
    and $02
    jr nz, jr_001_71b0

    call Call_001_71b1
    ld a, [$c4b0]
    ld b, a
    ld a, [$c4b1]
    ld c, a
    xor a
    call $100e
    ld a, [$c4b0]
    inc a
    ld [$c4b0], a
    sub $20
    cp $40
    jr nc, jr_001_71b0

    xor a
    ld [$c4c6], a

jr_001_71b0:
    ret


Call_001_71b1:
    ld b, $00
    ld a, [$c4af]
    and $03
    add a
    ld e, a
    ld d, $00
    ld hl, table_001_71DE
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_001_71e6
    ld a, [$c4af]
    and $03
    add a
    add b
    ld e, a
    ld d, $00
    ld hl, table_001_71D6
    add hl, de
    ld e, [hl]
ret

table_001_71D6:
    db $1a, $1b, $1e, $1f, $1c, $1d

    ld a, [de]
    dec de

table_001_71DE:
    dw $71E7
    dw $71F7
    dw $7208
    dw $71E7

Call_001_71e6:
    jp hl


    ld a, [$c4b7]
    and a
    jr z, jr_001_71f4

    dec a
    ld [$c4b7], a
    ld b, $01
    ret


jr_001_71f4:
    ld b, $00
    ret


    ld a, [$c4b7]
    inc a
    and $01
    ld [$c4b7], a
    jr z, jr_001_7205

    ld b, $01
    ret


jr_001_7205:
    ld b, $00
    ret


    ld a, [$c4b7]
    inc a
    ld [$c4b7], a
    and $02
    srl a
    jr z, jr_001_7205

    ld b, $01
    ret


    ld b, $00
    ret


Call_001_721b:
    and $03
    add a
    ld e, a
    ld d, $00
    ld hl, table_001_7229
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

table_001_7229:
    dw $723B
    dw $7511
    dw $76FB
    dw $723B
    

    ld a, $82
    ld [$c4af], a
    xor a
    ld [$c4b3], a
    ret


    ld a, [$c4b3]
    ld b, a
    and a
    jr nz, jr_001_725a

    xor a
    ld [$c4b4], a
    ld [$c4b5], a
    ld a, $ff
    ld [$c4b0], a
    ld a, $40
    ld [$c4b1], a
    ld a, $4c
    ld [$c4b2], a
    inc b
    ld a, b

jr_001_725a:
    dec a
    jr nz, jr_001_7272

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    dec a
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_73d8

    ld c, $90
    inc b
    jp Jump_001_73d8


jr_001_7272:
    dec a
    jr nz, jr_001_728a

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    inc a
    ld [$c4b1], a
    dec c
    jp nz, Jump_001_73d8

    ld c, $28
    inc b
    jp Jump_001_73d8


jr_001_728a:
    dec a
    jp nz, Jump_001_72a4

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    sub $02
    ld [$c4b1], a
    dec c
    jp nz, Jump_001_73d8

    ld c, $14
    inc b
    jp Jump_001_73d8


Jump_001_72a4:
    dec a
    jp nz, Jump_001_72be

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    sub $02
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_73d8

    ld c, $38
    inc b
    jp Jump_001_73d8


Jump_001_72be:
    dec a
    jp nz, Jump_001_72d8

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    sub $02
    ld [$c4b1], a
    dec c
    jp nz, Jump_001_73d8

    ld c, $28
    inc b
    jp Jump_001_73d8


Jump_001_72d8:
    dec a
    jp nz, Jump_001_72f2

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    add $02
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_73d8

    ld c, $34
    inc b
    jp Jump_001_73d8


Jump_001_72f2:
    dec a
    jp nz, Jump_001_730c

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    add $02
    ld [$c4b1], a
    dec c
    jp nz, Jump_001_73d8

    ld c, $14
    inc b
    jp Jump_001_73d8


Jump_001_730c:
    dec a
    jp nz, Jump_001_7326

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    sub $02
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_73d8

    inc b
    ld c, $20
    jp Jump_001_73d8


Jump_001_7326:
    dec a
    jr nz, jr_001_7356

    ld a, [$c4b2]
    ld c, a
    dec c
    jp nz, Jump_001_73d8

    ldh a, [$8f]
    ld d, a
    ld a, [$c4b0]
    cp d
    jp nc, Jump_001_7348

    add $10
    cp d
    jp nc, Jump_001_734f

    ld b, $0c
    ld c, $09
    jp Jump_001_73d8


Jump_001_7348:
    ld b, $0a
    ld c, $09
    jp Jump_001_73d8


Jump_001_734f:
    ld b, $0b
    ld c, $10
    jp Jump_001_73d8


jr_001_7356:
    dec a
    jr nz, jr_001_736e

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    sub $03
    ld [$c4b0], a
    dec c
    jr nz, jr_001_73d8

    ld b, $0d
    ld c, $28
    jr jr_001_73d8

jr_001_736e:
    dec a
    jr nz, jr_001_738a

    ld a, [$c4b2]
    cp $10
    jr nc, jr_001_737d

    ld a, $03
    ld [$c4b7], a

jr_001_737d:
    ld a, [$c4b2]
    ld c, a
    dec c
    jr nz, jr_001_73d8

    ld b, $0d
    ld c, $28
    jr jr_001_73d8

jr_001_738a:
    dec a
    jr nz, jr_001_73a2

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    add $03
    ld [$c4b0], a
    dec c
    jr nz, jr_001_73d8

    ld b, $0d
    ld c, $28
    jr jr_001_73d8

jr_001_73a2:
    dec a
    jr nz, jr_001_73c1

    ld a, [$c4b2]
    cp $10
    jr nc, jr_001_73b1

    ld a, $03
    ld [$c4b7], a

jr_001_73b1:
    ld a, [$c4b2]
    ld c, a
    dec c
    jr nz, jr_001_73d8

    call Call_001_7474
    ld b, $0e
    ld c, $01
    jr jr_001_73d8

jr_001_73c1:
    dec a
    jr nz, jr_001_73e1

    ld a, [$c4b4]
    add $7f
    ld [$c4b4], a
    jr nc, jr_001_73d4

    ld b, $0f
    ld c, $20
    jr jr_001_73d8

jr_001_73d4:
    ld b, $09
    ld c, $30

Jump_001_73d8:
jr_001_73d8:
    ld a, b
    ld [$c4b3], a
    ld a, c
    ld [$c4b2], a
    ret


jr_001_73e1:
    dec a
    jr nz, jr_001_73f0

    ld a, [$c4b2]
    ld c, a
    dec c
    jr nz, jr_001_73d8

    inc b
    ld c, $20
    jr jr_001_73d8

jr_001_73f0:
    dec a
    jr nz, jr_001_740e

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    sub $03
    ld [$c4b1], a
    dec c
    jr nz, jr_001_73d8

    inc b
    ld c, $08
    xor a
    ld [$c4b4], a
    ld [$c4b5], a
    jr jr_001_73d8

jr_001_740e:
    dec a
    jr nz, jr_001_745d

    ld a, [$c4b2]
    ld c, a
    dec c
    jr nz, jr_001_73d8

    ld a, [$c4b5]
    ld d, a
    add $5f
    ld [$c4b5], a
    ldh a, [$8f]
    add d
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, [$c4b0]
    add $08
    ld [$c4bf], a
    ld a, [$c4b1]
    add $10
    ld [$c4c0], a
    ld a, $02
    ld [$c4c5], a
    push bc
    call Call_001_61ee
    pop bc
    ld a, [$c4b4]
    add $10
    ld [$c4b4], a
    jr nc, jr_001_7458

    inc b
    ld c, $20
    xor a
    ld [$c4b4], a
    ld [$c4b5], a
    jr jr_001_73d8

jr_001_7458:
    ld c, $04
    jp Jump_001_73d8


jr_001_745d:
    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    add $03
    ld [$c4b1], a
    dec c
    jp nz, Jump_001_73d8

    ld b, $09
    ld c, $30
    jp Jump_001_73d8


Call_001_7474:
    ld a, [$c4b1]
    add $04
    ld d, a
    ld a, [$c4b0]
    sub $02
    ld e, a
    ld a, $11
    ld l, a
    ld a, $00
    call Call_001_78c5
    ld a, [$c4b1]
    ld d, a
    ld a, [$c4b0]
    add $08
    ld e, a
    ld a, $11
    ld l, a
    ld a, $01
    call Call_001_78c5
    ld a, [$c4b1]
    ld d, a
    ld a, [$c4b0]
    add $12
    ld e, a
    ld a, $11
    ld l, a
    ld a, $01
    call Call_001_78c5
    ld a, [$c4b1]
    add $04
    ld d, a
    ld a, [$c4b0]
    add $1a
    ld e, a
    ld a, $11
    ld l, a
    ld a, $02
    call Call_001_78c5
    ld a, [$c4b1]
    add $18
    ld d, a
    ld a, [$c4b0]
    sub $04
    ld e, a
    ld a, $11
    ld l, a
    ld a, $08
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    sub $04
    ld e, a
    ld a, $11
    ld l, a
    ld a, $06
    call Call_001_78c5
    ld a, [$c4b1]
    add $18
    ld d, a
    ld a, [$c4b0]
    add $1c
    ld e, a
    ld a, $11
    ld l, a
    ld a, $05
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $1c
    ld e, a
    ld a, $11
    ld l, a
    ld a, $07
    call Call_001_78c5
    ret


    ld a, [$c4b3]
    ld b, a
    and a
    jr nz, jr_001_7532

    xor a
    ld [$c4b4], a
    ld a, $18
    ld [$c4b5], a
    ld a, $b0
    ld [$c4b0], a
    ld a, $c0
    ld [$c4b1], a
    ld a, $ff
    ld [$c4b2], a
    inc b
    ld a, b

jr_001_7532:
    dec a
    jr nz, jr_001_7552

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    inc a
    ld [$c4b1], a
    add $40
    cp $f0
    jp c, Jump_001_767a

    ld a, $b8
    ld [$c4b1], a
    ld c, $44
    inc b
    jp Jump_001_767a


jr_001_7552:
    dec a
    jr nz, jr_001_756a

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    dec a
    ld [$c4b1], a
    dec c
    jp nz, Jump_001_767a

    ld c, $ff
    inc b
    jp Jump_001_767a


jr_001_756a:
    dec a
    jr nz, jr_001_759b

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b5]
    dec a
    ld [$c4b5], a
    jr nz, jr_001_7584

    push bc
    call Call_001_7683
    pop bc
    ld a, $18
    ld [$c4b5], a

jr_001_7584:
    ld a, [$c4b0]
    dec a
    cp $80
    ld [$c4b0], a
    jp nc, Jump_001_767a

    ld a, $80
    ld [$c4b0], a
    ld c, $ff
    inc b
    jp Jump_001_767a


jr_001_759b:
    dec a
    jp nz, Jump_001_75e5

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b5]
    dec a
    ld [$c4b5], a
    jr nz, jr_001_75b6

    push bc
    call Call_001_7683
    pop bc
    ld a, $18
    ld [$c4b5], a

jr_001_75b6:
    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    inc a
    ld [$c4b0], a
    cp $df
    jp c, Jump_001_767a

    ld a, [$c4b4]
    add $60
    ld [$c4b4], a
    jr c, jr_001_75db

    ld a, $df
    ld [$c4b0], a
    ld c, $ff
    dec b
    jp Jump_001_767a


jr_001_75db:
    xor a
    ld [$c4b4], a
    ld c, $40
    inc b
    jp Jump_001_767a


Jump_001_75e5:
    dec a
    jr nz, jr_001_7602

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    inc a
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_767a

    ldh a, [$91]
    ld [$c4b1], a
    ld c, $ff
    inc b
    jp Jump_001_767a


jr_001_7602:
    dec a
    jr nz, jr_001_7621

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    sub $03
    ld [$c4b0], a
    sub $80
    cp $31
    jr nc, jr_001_767a

    ld a, $b0
    ld [$c4b0], a
    ld c, $ff
    inc b
    jr jr_001_767a

jr_001_7621:
    dec a
    jr nz, jr_001_7640

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    sub $02
    ld [$c4b1], a
    add $40
    cp $e0
    jr c, jr_001_767a

    ld a, $bf
    ld [$c4b1], a
    ld c, $ff
    inc b
    jr jr_001_767a

jr_001_7640:
    dec a
    jr nz, jr_001_765e

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    add $02
    ld [$c4b1], a
    cp $e0
    jp c, Jump_001_767a

    push bc
    call Call_001_76aa
    pop bc
    ld c, $ff
    inc b
    jr jr_001_767a

jr_001_765e:
    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    add $02
    ld [$c4b1], a
    add $40
    cp $f0
    jp c, Jump_001_767a

    ld a, $b8
    ld [$c4b1], a
    ld c, $44
    ld b, $02

Jump_001_767a:
jr_001_767a:
    ld a, c
    ld [$c4b2], a
    ld a, b
    ld [$c4b3], a
    ret


Call_001_7683:
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $18
    ld e, a
    ld a, $11
    ld l, a
    ld a, $05
    call Call_001_78c5
    ld a, [$c4b1]
    add $28
    ld d, a
    ld a, [$c4b0]
    ld e, a
    ld a, $11
    ld l, a
    ld a, $08
    call Call_001_78c5
    ret


Call_001_76aa:
    ld a, [$c4b1]
    add $30
    ld d, a
    ld a, [$c4b0]
    sub $08
    ld e, a
    ld a, $11
    ld l, a
    ld a, $03
    call Call_001_78c5
    ld a, [$c4b1]
    add $30
    ld d, a
    ld a, [$c4b0]
    add $08
    ld e, a
    ld a, $11
    ld l, a
    ld a, $03
    call Call_001_78c5
    ld a, [$c4b1]
    add $30
    ld d, a
    ld a, [$c4b0]
    add $14
    ld e, a
    ld a, $11
    ld l, a
    ld a, $04
    call Call_001_78c5
    ld a, [$c4b1]
    add $30
    ld d, a
    ld a, [$c4b0]
    add $24
    ld e, a
    ld a, $11
    ld l, a
    ld a, $04
    call Call_001_78c5
    ret


    ld a, [$c4b3]
    ld b, a
    and a
    jr nz, jr_001_771e

    ld a, $01
    ld [$c4b4], a
    ld a, $03
    ld [$c4b5], a
    xor a
    ld a, $b0
    ld [$c4b0], a
    ld a, $c0
    ld [$c4b1], a
    ld a, $af
    ld [$c4b2], a
    inc b
    ld a, b

jr_001_771e:
    dec a
    jr nz, jr_001_7736

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    inc a
    ld [$c4b1], a
    dec c
    jp nz, Jump_001_77f6

    ld c, $14
    inc b
    jp Jump_001_77f6


jr_001_7736:
    dec a
    jr nz, jr_001_774e

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    dec a
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_77f6

    ld c, $14
    inc b
    jp Jump_001_77f6


jr_001_774e:
    dec a
    jr nz, jr_001_7788

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    inc a
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_77f6

    ld a, [$c4b4]
    dec a
    ld [$c4b4], a
    jr nz, jr_001_7782

    ld a, $03
    ld [$c4b4], a
    push bc
    call Call_001_77ff
    pop bc
    ld a, [$c4b5]
    dec a
    ld [$c4b5], a
    jr nz, jr_001_7782

    ld b, $06
    ld c, $80
    jr jr_001_77f6

jr_001_7782:
    ld c, $14
    inc b
    jp Jump_001_77f6


jr_001_7788:
    dec a
    jr nz, jr_001_77a0

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    inc a
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_77f6

    ld c, $14
    inc b
    jp Jump_001_77f6


jr_001_77a0:
    dec a
    jr nz, jr_001_77b9

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b0]
    dec a
    ld [$c4b0], a
    dec c
    jp nz, Jump_001_77f6

    ld c, $14
    ld b, $02
    jp Jump_001_77f6


jr_001_77b9:
    dec a
    jr nz, jr_001_77cd

    ld a, [$c4b2]
    ld c, a
    dec c
    jr nz, jr_001_77f6

    push bc
    call Call_001_788c
    pop bc
    ld c, $20
    inc b
    jr jr_001_77f6

jr_001_77cd:
    dec a
    jr nz, jr_001_77e3

    ld a, [$c4b2]
    ld c, a
    ld a, [$c4b1]
    inc a
    ld [$c4b1], a
    dec c
    jr nz, jr_001_77f6

    ld c, $80
    inc b
    jr jr_001_77f6

jr_001_77e3:
    dec a
    jr nz, jr_001_77f6

    ld a, [$c4b2]
    ld c, a
    dec c
    jr nz, jr_001_77f6

    push bc
    call Call_001_78a1
    pop bc
    ld c, $80
    jr jr_001_77f6

Jump_001_77f6:
jr_001_77f6:
    ld a, b
    ld [$c4b3], a
    ld a, c
    ld [$c4b2], a
    ret


Call_001_77ff:
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $09
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $0a
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $0b
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $0c
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $0d
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $0e
    call Call_001_78c5
    ld a, [$c4b1]
    add $20
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $11
    ld l, a
    ld a, $0f
    call Call_001_78c5
    ret


Call_001_788c:
    ld a, [$c4b1]
    add $30
    ld d, a
    ld a, [$c4b0]
    add $10
    ld e, a
    ld a, $22
    ld l, a
    ld a, $1b
    call Call_001_78c5
    ret


Call_001_78a1:
    ld a, [$c4b1]
    add $10
    ld d, a
    ld a, [$c4b0]
    add $08
    ld e, a
    ld a, $11
    ld l, a
    ld a, $14
    call Call_001_78c5
    ret


    ld b, $10
    ld de, $0009
    ld hl, $c41b
    xor a

jr_001_78bf:
    ld [hl], a
    add hl, de
    dec b
    jr nz, jr_001_78bf

    ret


Call_001_78c5:
    push bc
    push af
    push hl
    push de
    ld b, $10
    ld hl, $c41b

jr_001_78ce:
    ld a, [hl]
    and a
    jr z, jr_001_78de

    ld de, $0009
    add hl, de
    dec b
    jr nz, jr_001_78ce

    add sp, $08
    ld a, $ff
    ret


jr_001_78de:
    pop bc
    ld e, l
    ld d, h
    ld a, $80
    ld [hl+], a
    ld a, c
    ld [hl+], a
    inc hl
    ld a, b
    ld [hl+], a
    inc hl
    pop bc
    ld a, c
    ld [hl+], a
    pop af
    and $1f
    add a
    ld b, $00
    ld c, a
    ld hl, table_001_7A1E
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_001_7958
    pop bc
    ret


    ld b, $10
    ld hl, $c41b

jr_001_7905:
    push bc
    ld a, [hl]
    bit 7, a
    call nz, Call_001_7915
    ld de, $0009
    add hl, de
    pop bc
    dec b
    jr nz, jr_001_7905

    ret


Call_001_7915:
    push hl
    inc hl
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl+], a
    ld b, a
    add $90
    cp $a0
    jr nc, jr_001_7947

    inc hl
    ld a, [hl+]
    add [hl]
    dec hl
    ld [hl+], a
    ld c, a
    add $10
    cp $c0
    jr nc, jr_001_7947

    inc hl
    ld a, [hl+]
    ld e, a
    push hl
    push bc
    xor a
    call $100e
    pop bc
    call Call_001_4a98
    pop hl
    ld a, [hl]
    cp $ff
    jr z, jr_001_794b

    dec a
    jr z, jr_001_794d

    ld [hl], a
    pop hl
    ret


jr_001_7947:
    pop hl
    xor a
    ld [hl], a
    ret


jr_001_794b:
    pop hl
    ret


jr_001_794d:
    pop de
    push de
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call Call_001_7958
    pop hl
    ret


Call_001_7958: ;{ 01:7958 - Has jump table
Jump_001_7958:
    ld a, [hl+]
    push hl
    and $07
    add a
    ld b, $00
    ld c, a
    ld hl, table_01_7968
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl

    table_01_7968:
        dw Call_001_7982
        dw Call_001_7988
        dw Call_001_79D2
        dw Call_001_79F3
        dw Call_001_7A17
        dw Call_001_7A0B
        dw Call_001_7978
        dw Call_001_7978
;}

Call_001_7978: ;{
    pop bc
    ld hl, $0007
    add hl, de
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl], a
ret ;}

Call_001_7982: ;{
    pop hl
    xor a
    ld [de], a
jp Jump_001_7958 ;}

Call_001_7988: ;{
    pop hl
    push de
    ld a, [hl+]
    push hl
    ld hl, $0006
    add hl, de
    ld [hl-], a
    dec hl
    dec hl
    dec hl
    ld e, l
    ld d, h
    pop hl
    ld a, [hl+]
    push hl
    push af
    swap a
    and $07
    ld c, a
    ld b, $00
    ld hl, table_001_79CA
    add hl, bc
    ld b, [hl]
    pop af
    and $0f
    ld c, a
    sla b
    jr c, jr_001_79af
        xor a
    jr_001_79af:
    sla b
    jr nc, jr_001_79b5
        cpl
        inc a
    jr_001_79b5:
    ld [de], a
    inc de
    inc de
    ld a, c
    sla b
    jr c, jr_001_79be
        xor a
    jr_001_79be:
    sla b
    jr nc, jr_001_79c4
        cpl
        inc a
    jr_001_79c4:
    ld [de], a
    pop hl
    pop de
    jp Jump_001_7958

table_001_79CA: ; 01:79CA
    db $c0, $f0, $30, $b0, $80, $a0, $20, $e0
;}

Call_001_79D2: ;{
    pop hl
    push hl
    push de
    inc de
    ld a, [de]
    ld [$c4bf], a
    inc de
    inc de
    ld a, [de]
    ld [$c4c0], a
    ldh a, [$8f]
    ld e, a
    ldh a, [$91]
    ld d, a
    ld a, $01
    ld [$c4c5], a
    call Call_001_61ee
    pop de
    pop hl
jp Jump_001_7958 ;}

Call_001_79F3: ;{
    pop hl
    push de
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    push hl
    ld l, e
    ld h, d
    inc hl
    ld a, [hl+]
    ld e, a
    inc hl
    ld d, [hl]
    ld l, c
    ld a, b
    call Call_001_78c5
    pop hl
    pop de
jp Jump_001_7958 ;}

Call_001_7A0B: ;{
    pop hl
    push de
    ld a, [hl+]
    push hl
    call $308d
    pop hl
    pop de
jp Jump_001_7958 ;}

Call_001_7A17: ;{
    pop hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
jp Jump_001_7958 ;}

table_001_7A1E: ;{
    dw $7A64
    dw $7A6C
    dw $7A74
    dw $7A7C
    dw $7A88
    dw $7A94
    dw $7A9C
    dw $7AA4
    dw $7AAC
    dw $7AB4
    dw $7AC5
    dw $7AD6
    dw $7AE7
    dw $7AF4
    dw $7B05
    dw $7B16
    dw $7B27
    dw $7B44
    dw $7B5D
    dw $7B72
    dw $7B83
    dw $7B9D
    dw $7BA1
    dw $7BA5
    dw $7BA9
    dw $7BAD
    dw $7BB1
    dw $7BB5
    dw $7BE1
    dw $7BEE
    dw $7BF2
    dw $7BF6
    dw $7BFA
    dw $7A64
    dw $7A64

; 01:7A64
    db $01, $04, $11, $FF, $01, $FF, $22, $FF, $01, $02, $21, $FF, $01, $FF, $22, $FF
    db $01, $04, $31, $FF, $01, $FF, $22, $FF, $01, $10, $72, $FF, $01, $68, $61, $FF
    db $01, $FF, $22, $FF, $01, $10, $52, $FF, $01, $68, $61, $FF, $01, $FF, $22, $FF
    db $01, $08, $41, $FF, $01, $FF, $22, $FF, $01, $10, $71, $FF, $01, $FF, $22, $FF
    db $01, $10, $51, $FF, $01, $FF, $22, $FF, $01, $08, $01, $FF, $01, $FF, $22, $FF
    db $01, $30, $21, $FF, $01, $18, $02, $FF, $01, $10, $00, $FF, $00, $02, $05, $22
    db $FF, $01, $30, $21, $FF, $01, $10, $02, $FF, $01, $30, $00, $FF, $00, $02, $05
    db $22, $FF, $01, $30, $21, $FF, $01, $08, $02, $FF, $01, $50, $00, $FF, $00, $02
    db $05, $22, $FF, $01, $30, $21, $FF, $01, $70, $00, $FF, $00, $02, $05, $22, $FF
    db $01, $30, $21, $FF, $01, $08, $42, $FF, $01, $90, $00, $FF, $00, $02, $05, $22
    db $FF, $01, $30, $21, $FF, $01, $10, $42, $FF, $01, $B0, $00, $FF, $00, $02, $05
    db $22, $FF, $01, $30, $21, $FF, $01, $18, $42, $FF, $01, $D0, $00, $FF, $00, $02
    db $05, $22, $FF, $01, $18, $42, $FF, $01, $43, $22, $FF, $01, $34, $02, $FF, $01
    db $43, $62, $FF, $01, $80, $00, $02, $05, $22, $01, $80, $00, $FF, $04, $3A, $7B
    db $01, $18, $42, $FF, $01, $43, $22, $FF, $01, $34, $02, $FF, $01, $80, $00, $02
    db $05, $22, $01, $80, $00, $FF, $04, $53, $7B, $01, $18, $42, $FF, $01, $43, $22
    db $FF, $01, $80, $00, $02, $05, $22, $01, $80, $00, $FF, $04, $68, $7B, $01, $18
    db $42, $FF, $01, $80, $00, $02, $05, $22, $01, $80, $00, $FF, $04, $79, $7B, $01
    db $40, $21, $FF, $00, $03, $15, $13, $03, $16, $13, $03, $17, $13, $03, $18, $13
    db $03, $19, $13, $03, $1A, $13, $05, $1B, $FF, $01, $FF, $71, $FF, $01, $FF, $01
    db $FF, $01, $FF, $11, $FF, $01, $FF, $31, $FF, $01, $FF, $41, $FF, $01, $FF, $51
    db $FF, $01, $18, $42, $FF, $01, $43, $22, $03, $1C, $22, $05, $22, $FF, $01, $34
    db $02, $03, $1C, $22, $05, $22, $FF, $01, $43, $62, $03, $1C, $22, $05, $22, $FF
    db $01, $80, $00, $02, $05, $22, $01, $80, $00, $FF, $04, $D7, $7B, $01, $80, $00
    db $02, $05, $22, $01, $80, $00, $FF, $04, $E4, $7B, $01, $FF, $11, $FF, $01, $FF
    db $31, $FF, $01, $FF, $51, $FF, $01, $FF, $71
;}

freespace_bank_001:

SECTION "ROM Bank $001 pt 2", ROMX[$7F00], BANK[$1]

table_001_7F00: ;{
    db $00, $00, $00, $01, $01, $01, $02, $02, $03, $03, $03, $04, $04, $05, $05, $05
    db $06, $06, $06, $07, $07, $07, $08, $08, $08, $09, $09, $09, $0A, $0A, $0A, $0B
    db $0B, $0B, $0B, $0C, $0C, $0C, $0C, $0D, $0D, $0D, $0D, $0D, $0E, $0E, $0E, $0E
    db $0E, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
    db $10, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0E
    db $0E, $0E, $0E, $0E, $0E, $0D, $0D, $0D, $0D, $0D, $0C, $0C, $0C, $0C, $0B, $0B
    db $0B, $0B, $0A, $0A, $0A, $09, $09, $09, $08, $08, $08, $07, $07, $07, $06, $06
    db $06, $05, $05, $05, $04, $04, $03, $03, $03, $02, $02, $01, $01, $01, $00, $00
    db $00, $FF, $FF, $FE, $FE, $FE, $FD, $FD, $FC, $FC, $FC, $FB, $FB, $FA, $FA, $FA
    db $F9, $F9, $F9, $F8, $F8, $F8, $F7, $F7, $F7, $F6, $F6, $F6, $F5, $F5, $F5, $F4
    db $F4, $F4, $F4, $F3, $F3, $F3, $F3, $F2, $F2, $F2, $F2, $F2, $F1, $F1, $F1, $F1
    db $F1, $F1, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0
    db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F1
    db $F1, $F1, $F1, $F1, $F1, $F2, $F2, $F2, $F2, $F2, $F3, $F3, $F3, $F3, $F4, $F4
    db $F4, $F4, $F5, $F5, $F5, $F6, $F6, $F6, $F7, $F7, $F7, $F8, $F8, $F8, $F9, $F9
    db $F9, $FA, $FA, $FA, $FB, $FB, $FC, $FC, $FC, $FD, $FD, $FE, $FE, $FE, $FF, $FF
;}

; EoF