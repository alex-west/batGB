; Disassembly of "Batman - The Video Game (World).gb"
; This file was created with:
; mgbdis v1.4 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]

; 02:4000
    xor a
    ldh [$d0], a
    ld hl, $ff07
    ld a, $00
    ld [hl-], a
    ld a, $bb
    ld [hl+], a
    ld c, $26
    xor a
    ld [c], a
    ld a, $80
    ld [c], a
    dec c
    ld hl, $ffd9
    xor a
    ld [hl-], a
    ld [c], a
    dec c
    ld a, $77
    ld [hl-], a
    ld [c], a
    ld hl, $c800
    ld bc, $0153

    jr_002_4025:
        xor a
        ld [hl+], a
        dec bc
        ld a, b
        or c
    jr nz, jr_002_4025

    ld a, $ff
    ld [$c806], a
    ld c, $07
    ld a, $04
    ld [c], a
    
; 02:4036
    xor a
    ldh [$d0], a
    push de
    push hl
    ld hl, $c833
    ld de, $0024
    ld b, $08
    xor a

    jr_002_4044:
        ld [hl], a
        add hl, de
        dec b
    jr nz, jr_002_4044

    xor a
    ld hl, $c800
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [$c80a], a
    ld hl, $c807
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld c, $d8
    ld a, $77
    ld [c], a
    ld a, $ff
    ldh [$d0], a
    pop hl
    pop de
ret

;{ 02:4066
    xor a
    ldh [$d0], a
    push hl
    push de
    push bc
    ld hl, $c805
    ld a, [hl]
    xor $ff
    ld [hl], a
    jr z, jr_002_4093

    ld b, $08
    ld hl, $c833
    ld de, $0024

    jr_002_407d:
        ld a, [hl]
        bit 7, a
        jr z, jr_002_4087
            and $7f
            or $43
            ld [hl], a
        jr_002_4087:
        add hl, de
        dec b
    jr nz, jr_002_407d

jr_002_408b:
    ld a, $ff
    ldh [$d0], a
    pop bc
    pop de
    pop hl
    ret

jr_002_4093:
    ld b, $08
    ld hl, $c833
    ld de, $0024
    jr_002_409b:
        ld a, [hl]
        bit 6, a
        jr z, jr_002_40a3
            xor $c0
            ld [hl], a
        jr_002_40a3:
        add hl, de
        dec b
    jr nz, jr_002_409b
jr jr_002_408b ;}

; Handles timer overflow interrupt
; 02:40A9
    ldh a, [$d0]
    or a
        ret z
    xor a
    ldh [$d0], a
    xor a
    ld [$c804], a
    ld de, $c833
    ldh [$d9], a

Jump_002_40b9:
    ld a, [de]
    and $80
    jp z, Jump_002_4272

    inc de
    ld a, [de]
    ldh [$d1], a
    dec de
    ld hl, $0005
    add hl, de
    dec [hl]
    jp nz, Jump_002_4158

    ld a, [de]
    bit 3, a
    jp nz, Jump_002_42d0

Jump_002_40d2:
    dec hl
    dec hl
    ld a, [hl-]
    ld l, [hl]
    ld h, a

Jump_002_40d7:
    ld a, [hl+]
    cp $c8
    jr c, jr_002_40eb

    push hl
    sub $c8
    add a
    ld c, a
    ld b, $00
    ld hl, table_002_430F
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp hl


jr_002_40eb:
    ldh [$d2], a
    ld c, l
    ld b, h
    ld hl, $0004
    add hl, de
    ld a, [hl+]
    or a
    jr nz, jr_002_40f9

    ld a, [bc]
    inc bc

jr_002_40f9:
    ld [hl+], a
    cp [hl]
    jr c, jr_002_40fe

    ld a, [hl]

jr_002_40fe:
    srl a
    dec a
    inc hl
    ld [hl+], a

Jump_002_4103:
    ld hl, $0002
    add hl, de
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ldh a, [$d2]

Jump_002_410d:
    ld hl, $0008
    add hl, de
    add [hl]
    ld c, a
    ldh a, [$d1]
    cp $03
    jr z, jr_002_412d

    ld a, c
    add a
    ld c, a
    ld b, $00
    ld hl, $462e
    add hl, bc
    ld a, [hl+]
    ld b, [hl]
    ld hl, $0009
    add hl, de
    add [hl]
    ld c, a
    ld a, $00
    adc b

jr_002_412d:
    ld hl, $000a
    add hl, de
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, [de]
    bit 5, a
    jr nz, jr_002_4153

    ld a, [hl+]
    ld [hl+], a
    ld hl, $0011
    add hl, de
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld [hl-], a
    ld a, b
    ld [hl-], a
    ld hl, $0017
    add hl, de
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld [hl-], a
    ld a, b
    ld [hl-], a
    ld a, $01
    ld [hl-], a

Jump_002_4152:
    ld a, [de]

jr_002_4153:
    or $01
    ld [de], a
    jr jr_002_4173

Jump_002_4158:
    ld a, [hl+]
    inc hl
    cp [hl]
    jr nz, jr_002_4173

    ld a, [de]
    bit 5, a
    jr nz, jr_002_4173

    ld hl, $001e
    add hl, de
    ld a, [hl-]
    ld b, a
    ld a, [hl]
    ld hl, $0015
    add hl, de
    ld [hl-], a
    ld a, b
    ld [hl-], a
    ld a, $01
    ld [hl-], a

Jump_002_4173:
jr_002_4173:
    ld hl, $000a
    add hl, de
    ld c, $d7
    ld a, [hl+]
    ld [c], a
    dec c
    ld a, [hl+]
    ld [c], a
    ld b, a
    inc hl
    dec [hl]
    jr nz, jr_002_41b0

    inc [hl]
    inc hl
    ld a, [hl+]
    or a
    jr z, jr_002_41b0

    ld l, [hl]
    ld h, a

jr_002_418b:
    ld a, [hl+]
    cp $80
    jr c, jr_002_4197

    jr nz, jr_002_419e

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jr jr_002_418b

jr_002_4197:
    add b
    jr nc, jr_002_41a6

    ld a, $ff
    jr jr_002_41a6

jr_002_419e:
    cpl
    ld b, a
    ld a, [c]
    scf
    sbc b
    jr nc, jr_002_41a6

    xor a

jr_002_41a6:
    ld [c], a
    ld b, l
    ld a, h
    ld hl, $000e
    add hl, de
    ld [hl+], a
    ld a, b
    ld [hl], a

jr_002_41b0:
    dec c
    ld hl, $0013
    add hl, de
    dec [hl]
    jr nz, jr_002_41e3

    inc hl
    ld a, [hl+]
    or a
    jr z, jr_002_41e1

    ld l, [hl]
    ld h, a

jr_002_41bf:
    ld a, [hl+]
    cp $ff
    jr nz, jr_002_41c9

    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jr jr_002_41bf

jr_002_41c9:
    ld [c], a
    ld a, [hl+]
    ldh [$d2], a
    ld a, l
    ld b, h
    ld hl, $0015
    add hl, de
    ld [hl-], a
    ld a, b
    ld [hl-], a
    ldh a, [$d2]
    ld [hl-], a
    ld a, [c]
    ld [hl], a
    ld a, [de]
    or $01
    ld [de], a
    jr jr_002_41e6

jr_002_41e1:
    dec hl
    dec hl

jr_002_41e3:
    dec hl
    ld a, [hl+]
    ld [c], a

jr_002_41e6:
    ld hl, $0018
    add hl, de
    dec c
    ld a, [hl+]
    ld [c], a
    dec c
    ld a, [hl+]
    ld [c], a
    ldh a, [$d1]
    ld l, a
    ld h, $c8
    ld a, [$c804]
    inc a
    cp [hl]
    jr z, jr_002_4203

    jr c, jr_002_4272

Call_002_41fe: ; Junk label ?
    ld [hl], a
    ld a, [de]
    or $03
    ld [de], a

jr_002_4203:
    ld a, l
    cp $02
    jr nz, jr_002_422a

    ld a, [de]
    bit 1, a
    jr z, jr_002_422a

    ld hl, $001b
    add hl, de
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    xor a
    ldh [rNR30], a
    ld b, $04
    ld c, $30

jr_002_421b:
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    dec b
    jr nz, jr_002_421b

jr_002_422a:
    ldh a, [$d1]
    ld c, a
    add a
    add a
    add c
    add $10
    ld l, a
    ld h, $ff
    ld c, $d3
    ld a, [c]
    ld [hl+], a
    inc c
    ld a, [c]
    ld [hl+], a
    inc c
    inc c
    inc hl
    ld a, [de]
    bit 0, a
    jr nz, jr_002_4248

    bit 4, a
    jr nz, jr_002_424a

jr_002_4248:
    ld a, [c]
    ld [hl], a

jr_002_424a:
    dec hl
    ld a, [de]
    bit 0, a
    jr z, jr_002_4269

    and $fc
    ld [de], a
    ldh a, [$d1]
    cp $02
    jr nz, jr_002_425f

    ldh [rNR30], a
    ld a, $80
    ldh [rNR30], a

jr_002_425f:
    dec c
    ld a, [c]
    ld [hl+], a
    inc c
    inc c
    inc hl
    ld a, [c]
    or $80
    ld [hl], a

jr_002_4269:
    ld hl, $001a
    add hl, de
    ldh a, [$d9]
    or [hl]
    ldh [$d9], a

Jump_002_4272:
jr_002_4272:
    ld hl, $0024
    add hl, de
    ld e, l
    ld d, h
    ld hl, $c804
    inc [hl]
    ld a, [hl]
    cp $08
    jp nz, Jump_002_40b9

    ld hl, $c800
    ld b, $04
    ld c, $12

jr_002_4289:
    ld a, [hl+]
    or a
    jr nz, jr_002_428e

    ld [c], a

jr_002_428e:
    ld a, $05
    add c
    ld c, a
    dec b
    jr nz, jr_002_4289

    ld hl, $ffd8
    ld c, $24
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld hl, $c806
    and [hl]
    ld [c], a
    ld hl, $c807
    ld c, $d8
    ld a, [hl+]
    or a
    jr nz, jr_002_42c9

    ld a, [hl]
    or a
    jr z, jr_002_42ba

    dec hl
    ld [hl], a
    ld a, [c]
    add $11
    jr c, jr_002_42cb

    ld [c], a
    jr jr_002_42cb

jr_002_42ba:
    inc hl
    ld a, [hl-]
    or a
    jr z, jr_002_42cb

    dec hl
    ld [hl], a
    ld a, [c]
    sub $11
    jr c, jr_002_42cb

    ld [c], a
    jr jr_002_42cb

jr_002_42c9:
    dec hl
    dec [hl]

jr_002_42cb:
    ld a, $ff
    ldh [$d0], a
    ret


Jump_002_42d0:
    and $d7
    ld [de], a
    ldh a, [$d1]
    cp $03
    jr z, jr_002_42f4

    ld a, [$c80c]
    or a
    jp z, Jump_002_40d2

    ld hl, $0005
    add hl, de
    ld [hl+], a
    cp [hl]
    jr c, jr_002_42e9

    ld a, [hl]

jr_002_42e9:
    srl a
    dec a
    inc hl
    ld [hl+], a
    ld a, [$c80b]
    jp Jump_002_410d


jr_002_42f4:
    ld a, [$c80e]
    or a
    jp z, Jump_002_40d2

    ld hl, $0005
    add hl, de
    ld [hl+], a
    cp [hl]
    jr c, jr_002_4304

    ld a, [hl]

jr_002_4304:
    srl a
    dec a
    inc hl
    ld [hl+], a
    ld a, [$c80d]
    jp Jump_002_410d

table_002_430F: ; 02:430F
    dw $437F
    dw $4386
    dw $438D
    dw $4399
    dw $439E
    dw $43A3
    dw $43A8
    dw $43D3
    dw $43D8
    dw $43DD
    dw $43E2
    dw $43F1
    dw $43F8
    dw $43FD
    dw $4402
    dw $4407
    dw $440C
    dw $4411
    dw $4471
    dw $4476
    dw $447B
    dw $4480
    dw $4485
    dw $448A
    dw $449C
    dw $44A2
    dw $44A8
    dw $44AF
    dw $44B6
    dw $44C0
    dw $44C5
    dw $44CA
    dw $44E9
    dw $4504
    dw $450C
    dw $4514
    dw $4534
    dw $453A
    dw $4551
    dw $4561
    dw $4566
    dw $4585
    dw $458C
    dw $4592
    dw $4598
    dw $459E
    dw $45A4
    dw $45D5
    dw $45DB
    dw $45E0
    dw $45ED
    dw $45F2
    dw $45FB
    dw $460A
    dw $4610
    dw $4622



    ld a, [$c80a]
    pop hl
    xor [hl]
    jr jr_002_4392

    ld a, [$c80a]
    pop hl
    or [hl]
    jr jr_002_4392

    ld a, [$c80a]
    pop hl
    and [hl]

jr_002_4392:
    ld [$c80a], a
    inc hl
    jp Jump_002_40d7


    ld bc, $c830
    jr jr_002_43ab

    ld bc, $c82d
    jr jr_002_43ab

    ld bc, $c82a
    jr jr_002_43ab

    ld bc, $c827

jr_002_43ab:
    ld a, [bc]
    ld hl, $0012
    add hl, de
    ld [hl], a
    inc bc
    ld a, [bc]
    ldh [$d2], a
    inc bc
    ld a, [bc]
    ld [$c80d], a
    ld hl, $0004
    add hl, de
    ld a, [hl+]
    ld [hl], $01
    or a
    jr nz, jr_002_43c7

    pop hl
    ld a, [hl+]
    push hl

jr_002_43c7:
    dec a
    ld [$c80e], a
    ld a, [de]
    set 3, a
    ld [de], a
    pop bc
    jp Jump_002_4103


    ld bc, $c830
    jr jr_002_43e5

    ld bc, $c82d
    jr jr_002_43e5

    ld bc, $c82a
    jr jr_002_43e5

    ld bc, $c827

jr_002_43e5:
    pop hl
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    jp Jump_002_40d7


    ld hl, $0004
    xor a
    jp Jump_002_44ba


    ld bc, $c823
    jr jr_002_4414

    ld bc, $c81f
    jr jr_002_4414

    ld bc, $c81b
    jr jr_002_4414

    ld bc, $c817
    jr jr_002_4414

    ld bc, $c813
    jr jr_002_4414

    ld bc, $c80f

jr_002_4414:
    ld hl, $0004
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_002_4426

    ld [$c80c], a
    pop hl
    ld a, [hl+]
    ld [$c80b], a
    jr jr_002_442f

jr_002_4426:
    pop hl
    ld a, [hl+]
    ld [$c80b], a
    ld a, [hl+]
    ld [$c80c], a

jr_002_442f:
    push hl
    ld a, [de]
    or $28
    ld [de], a
    ld hl, $000f
    add hl, de
    ld a, [bc]
    ld [hl-], a
    inc bc
    ld a, [bc]
    ld [hl-], a
    inc bc
    ld a, $01
    ld [hl], a
    push bc
    ld hl, $0017
    add hl, de
    ld a, [hl-]
    ld b, a
    ld a, [hl-]
    ld [hl-], a
    ld a, b
    ld [hl-], a
    ld a, $01
    ld [hl-], a
    ld hl, $0005
    add hl, de
    pop bc
    ld a, [bc]
    ldh [$d2], a
    inc bc
    ld a, [bc]
    ld [hl], a
    ld b, a
    ld a, [$c80c]
    sub b
    jr nc, jr_002_4466

    ld a, [$c80c]
    ld [hl], a
    xor a

jr_002_4466:
    ld [$c80c], a
    inc hl
    inc hl
    xor a
    ld [hl+], a
    pop bc
    jp Jump_002_4103


    ld bc, $c823
    jr jr_002_448d

    ld bc, $c81f
    jr jr_002_448d

    ld bc, $c81b
    jr jr_002_448d

    ld bc, $c817
    jr jr_002_448d

    ld bc, $c813
    jr jr_002_448d

    ld bc, $c80f

jr_002_448d:
    pop hl
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    jp Jump_002_40d7


    ld hl, $0011
    xor a
    jr jr_002_44ba

    ld hl, $000c
    xor a
    jr jr_002_44ba

    ld hl, $000c
    ld a, $01
    jr jr_002_44ba

    ld hl, $000c
    add hl, de
    ld a, $01
    ld [hl], a
    ld hl, $0006
    xor a

Jump_002_44ba:
jr_002_44ba:
    add hl, de
    ld [hl], a
    pop hl
    jp Jump_002_40d7


    ld hl, $44dd
    jr jr_002_44cd

    ld hl, $44e1
    jr jr_002_44cd

    ld hl, $44e5

jr_002_44cd:
    ldh a, [$d1]
    ld c, a
    ld b, $00
    add hl, bc
    ld a, [hl]
    ld hl, $001a
    add hl, de
    ld [hl], a
    pop hl
    jp Jump_002_40d7


    db $10

    db $20

    ld b, b

    db $80, $01, $02

    inc b

    db $08, $11, $22, $44, $88

    ld hl, $0019
    add hl, de
    ld c, l
    ld b, h
    pop hl
    ld a, [hl+]
    ld [bc], a
    and $70
    jr z, jr_002_44fd

    ld a, [de]
    set 4, a
    ld [de], a
    jp Jump_002_40d7


jr_002_44fd:
    ld a, [de]
    res 4, a
    ld [de], a
    jp Jump_002_40d7


    ld a, [de]
    res 5, a
    ld [de], a
    pop hl
    jp Jump_002_40d7


    ld a, [de]
    set 5, a
    ld [de], a
    pop hl
    jp Jump_002_40d7


    pop bc
    ld hl, $0004
    add hl, de
    ld a, [hl+]
    or a
    jr nz, jr_002_451f

    ld a, [bc]
    inc bc

jr_002_451f:
    ld [hl+], a
    cp [hl]
    jr c, jr_002_4524

    ld a, [hl]

jr_002_4524:
    srl a
    dec a
    inc hl
    ld [hl+], a
    ld hl, $0002
    add hl, de
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    jp Jump_002_4173


    ld hl, $0018
    jp Jump_002_4619


    ld hl, $0021
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_002_454d

    pop bc
    ld b, a
    xor a
    ld [hl-], a
    ld l, [hl]
    ld h, b
    inc hl
    inc hl
    jp Jump_002_40d7


jr_002_454d:
    pop hl
    jp Jump_002_40d7


    ld hl, $0020
    add hl, de
    pop bc
    ld a, c
    ld [hl+], a
    ld [hl], b
    ld l, c
    ld h, b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_002_40d7


    ld hl, $0023
    jr jr_002_4569

    ld hl, $0022

jr_002_4569:
    add hl, de
    ld a, [hl]
    or a
    jr z, jr_002_4579

    dec [hl]
    jr nz, jr_002_457d

    pop hl
    ld bc, $0003
    add hl, bc
    jp Jump_002_40d7


jr_002_4579:
    pop bc
    ld a, [bc]
    ld [hl], a
    push bc

jr_002_457d:
    pop hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_002_40d7


    pop hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    jp Jump_002_40d7


    ld hl, $0004
    jp Jump_002_4619


    ld hl, $0009
    jp Jump_002_4619


    ld hl, $0008
    jp Jump_002_4619


    ld hl, $001f
    jp Jump_002_4619


    pop bc
    ld hl, $0004
    add hl, de
    ld a, [hl+]
    or a
    jr nz, jr_002_45af

    ld a, [bc]
    inc bc

jr_002_45af:
    ld [hl+], a
    inc hl
    xor a
    ld [hl+], a
    ld hl, $0002
    add hl, de
    ld a, c
    ld [hl+], a
    ld a, b
    ld [hl+], a
    ld hl, $001f
    add hl, de
    ld a, [hl]
    ld hl, $0012
    add hl, de
    or a
    jr z, jr_002_45cc

    ld b, a
    ld a, [hl]
    and $f0
    or b

jr_002_45cc:
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl+], a
    jp Jump_002_4152


    ld hl, $000c
    jp Jump_002_4619


    ld hl, $0010
    jr jr_002_45fe

    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
    pop hl
    ld a, [hl+]
    add a
    ld [bc], a
    jp Jump_002_40d7


    ld hl, $001d
    jr jr_002_45fe

    ld a, [de]
    or $02
    ld [de], a
    ld hl, $001b
    jr jr_002_45fe

    ld hl, $0016

jr_002_45fe:
    add hl, de
    ld c, l
    ld b, h
    pop hl
    ld a, [hl+]
    ld [bc], a
    inc bc
    ld a, [hl+]
    ld [bc], a
    jp Jump_002_40d7


    ld hl, $001a
    jp Jump_002_4619


    ld hl, $0017
    add hl, de
    xor a
    ld [hl], a
    ld hl, $0012

Jump_002_4619:
    add hl, de
    ld c, l
    ld b, h
    pop hl
    ld a, [hl+]
    ld [bc], a
    jp Jump_002_40d7


    pop hl
    ldh a, [$d1]
    ld l, a
    ld h, $c8
    xor a
    ld [hl], a
    ld [de], a
    jp Jump_002_4272

; 02:462E
    db $ac, $ff, $1c, $00, $87, $00, $eb, $00, $49, $01, $a2, $01, $f7, $01, $47, $02
    db $91, $02, $d8, $02, $1b, $03, $5b, $03, $96, $03, $ce, $03, $03, $04, $35, $04
    db $65, $04, $91, $04, $bb, $04, $e3, $04, $09, $05, $2c, $05, $4e, $05, $6d, $05
    db $8b, $05, $a7, $05, $c2, $05, $db, $05, $f2, $05, $09, $06, $1e, $06, $32, $06
    db $44, $06, $56, $06, $67, $06, $77, $06, $85, $06, $93, $06, $a1, $06, $ad, $06
    db $b9, $06, $c4, $06, $cf, $06, $d9, $06, $e2, $06, $eb, $06, $f3, $06, $fb, $06
    db $03, $07

    ld a, [bc]
    rlca

    db $10, $07, $17, $07, $1d, $07, $22, $07

    daa
    rlca

    db $2c, $07, $31, $07, $36, $07

    ld a, [hl-]
    rlca

    db $3e, $07, $41, $07

    ld b, l
    rlca

    db $48, $07

    ld c, e
    rlca
    ld c, [hl]
    rlca
    ld d, c
    rlca
    ld d, h
    rlca

    db $56, $07

    ld e, c
    rlca
    ld e, e
    rlca
    ld e, l
    rlca

    db $5f, $07, $61, $07

    ld h, d
    rlca

    db $64, $07

    ld h, [hl]
    rlca
    ld h, a
    rlca
    ld l, c
    rlca
    ld l, d
    rlca
    ld l, e
    rlca
    ld l, h
    rlca
    ld l, l
    rlca
    ld l, [hl]
    rlca
    ld l, a
    rlca
    or c
    db $76

    db $ef, $4c, $a6, $50, $08, $5b

    and [hl]
    ld d, b

    db $3d, $5f, $86, $60

    and [hl]
    ld d, b

    db $d3, $61, $82, $62

    and [hl]
    ld d, b

    db $47, $64, $d9, $68, $b1, $76, $70, $6d, $14, $71, $30, $47, $49, $47, $6a, $47

    add a
    ld b, a

    db $c5, $47, $de, $47, $22, $48, $55, $48, $b4, $48, $d5, $48, $e4, $48, $f3, $48
    db $33, $49, $69, $49, $8c, $49

    xor e
    ld c, c
    db $c2
    ld c, c

    db $d9, $49, $f8, $49

    dec c
    ld c, d
    jr z, @+$4c

    db $40, $4a, $0f, $4b, $48, $4b, $9c, $4b, $bb, $4b, $50, $4a, $e4, $4b, $98, $4c
    db $04, $03, $41, $47, $ff

    rst $20
    db $ec
    nop
    cp $51
    add sp, $1b
    dec e
    ld [bc], a
    dec e
    db $01
    rst $38

    db $e7, $fe, $51, $45, $02, $31, $01, $ff, $04, $00, $4e, $47, $ff, $e7, $ec, $80
    db $fe, $b1, $e8, $1c, $24, $02, $30, $02, $fe, $81, $30, $01, $32, $01, $34, $01
    db $35, $01, $e8, $1e, $ec, $00, $37, $08, $ff, $04, $00, $6f, $47, $ff, $e7, $ec
    db $80, $fe, $b1, $e8, $1c, $fe, $81, $30, $01, $32, $01, $34, $01, $35, $01, $e8
    db $1e, $ec, $00, $39, $05, $ff

    inc b
    nop
    sub b
    ld b, a
    dec b
    inc bc
    xor d
    ld b, a
    rst $38
    rst $20
    db $ec
    add b
    add sp, $1c
    db $f4
    db $fd
    cp $a1
    jr nc, jr_002_479c

    ld [hl-], a

jr_002_479c:
    ld bc, $0128
    add hl, hl
    ld bc, $61fe
    add sp, $1e
    db $ec
    nop
    jr nc, jr_002_47ae

    rst $38
    rst $20
    cp $94
    ld a, [c]

jr_002_47ae:
    ld bc, $3736
    db $d3
    cp $73
    ld b, d
    ld bc, $0c40
    cp $33
    ld b, d
    ld bc, $0540
    cp $13
    ld b, d
    ld bc, $0540
    rst $38

    db $04, $03, $ca, $47, $ff, $e7, $fe, $84, $42, $01, $40, $04, $fe, $34, $42, $01
    db $40, $04, $fe, $14, $42, $01, $40, $04, $ff, $00, $00, $c5, $4c, $01, $01, $c5
    db $4c, $02, $02, $c5, $4c, $03, $03, $c5, $4c, $07, $00, $f3, $47, $ff, $e7, $ec
    db $00, $fe, $f1, $e8, $1c, $f2, $01, $2f, $30, $32, $30, $2f, $2e, $2d, $2c, $2b
    db $29, $28, $24, $23, $22, $21, $20, $1f, $1d, $1c, $1b, $18, $ed, $fe, $b1, $ee
    db $08, $48, $fe, $61, $ee, $08, $48, $fe, $21, $ee, $08, $48, $ff, $00, $00, $c5
    db $4c, $01, $01, $c5, $4c, $02, $02, $c5, $4c, $03, $03, $c5, $4c, $07, $00, $37
    db $48, $ff, $e7, $ec, $00, $fe, $f3, $e8, $1c, $f2, $01, $1f, $1d, $1f, $21, $2b
    db $29, $2b, $2d, $f2, $0a, $1d, $fe, $c3, $1d, $fe, $83, $1d, $fe, $43, $1d, $ff
    db $00, $00, $c5, $4c, $01, $01, $c5, $4c, $02, $02, $c5, $4c, $03, $03, $c5, $4c
    db $06, $00, $6e, $48, $07, $03, $9e, $48, $ff, $e7, $ec, $00, $fe, $f4, $e8, $1c
    db $2b, $05, $ec, $80, $18, $02, $fe, $f1, $e8, $15, $09, $08, $fe, $81, $e8, $1c
    db $ec, $00, $2b, $02, $ec, $80, $18, $02, $e8, $15, $09, $05, $fe, $41, $00, $0a
    db $fe, $21, $00, $0a, $fe, $11, $00, $0a, $ff, $e7, $fe, $c3, $54, $05, $25, $05
    db $fe, $52, $23, $05, $25, $05, $fe, $32, $23, $0a, $fe, $13, $25, $0a, $ff, $06
    db $00, $b9, $48, $ff, $e7, $ec, $80, $fe, $d3, $e8, $1e, $3c, $01, $3e, $01, $30
    db $01, $32, $01, $e8, $1f, $2b, $0a, $fe, $73, $2b, $0a, $fe, $43, $2b, $0a, $ff
    db $06, $00, $da, $48, $ff, $e7, $ec, $80, $fe, $f3, $f4, $0c, $f1, $c0, $48, $06
    db $00, $e9, $48, $ff, $e7, $ec, $00, $fe, $d3, $f4, $e8, $f1, $c0, $48, $05, $00
    db $fc, $48, $06, $03, $18, $49, $ff, $e7, $ec, $80, $fe, $f3, $e8, $1c, $1a, $03
    db $0e, $03, $1f, $05, $13, $05, $fe, $83, $1f, $05, $13, $05, $fe, $43, $1f, $05
    db $13, $05, $ff, $e7, $fe, $d1, $52, $02, $63, $02, $65, $02, $46, $02, $f2, $05
    db $60, $fe, $73, $46, $60, $fe, $33, $46, $60, $fe, $13, $46, $60, $ff, $05, $00
    db $3c, $49, $06, $03, $52, $49, $ff, $e7, $ec, $80, $fe, $c3, $e8, $1c, $26, $02
    db $1a, $02, $2b, $01, $1f, $04, $fe, $63, $2b, $01, $1f, $04, $ff, $e7, $fe, $91
    db $52, $02, $63, $01, $65, $01, $46, $01, $f2, $03, $60, $fe, $63, $46, $60, $fe
    db $33, $46, $60, $ff, $07, $00, $6e, $49, $ff, $e7, $ec, $80, $fe, $d3, $e8, $1c
    db $f2, $01, $f4, $f8, $2b, $29, $28, $26, $24, $23, $f2, $05, $1d, $fe, $a3, $1d
    db $fe, $53, $1d, $fe, $23, $1d, $ff, $07, $00, $91, $49, $ff, $e7, $ec, $80, $f2
    db $04, $fe, $f3, $1c, $1f, $28, $fe, $83, $1c, $1f, $28, $fe, $32, $1c, $1f, $28
    db $fe, $12, $1c, $1f, $28, $ff

    dec b
    nop
    or b
    ld c, c
    rst $38
    rst $20
    db $ec
    add b
    cp $73
    add sp, $1d
    jr jr_002_49ba

    ld a, [de]

jr_002_49ba:
    ld bc, $011c
    cp $33
    inc e
    ld [bc], a
    rst $38
    dec b
    nop
    rst $00
    ld c, c
    rst $38
    rst $20
    db $ec
    add b
    cp $73
    add sp, $1c
    jr nc, jr_002_49d1

    scf

jr_002_49d1:
    ld bc, $0330
    cp $33
    jr nc, @+$05

    rst $38

    db $05, $00, $de, $49, $ff, $e7, $ec, $80, $fe, $83, $e8, $1c, $30, $01, $24, $01
    db $37, $01, $3c, $01, $2b, $05, $fe, $53, $2b, $05, $fe, $23, $2b, $05, $ff, $05
    db $00, $fd, $49, $ff, $e7, $ec, $80, $fe, $83, $e8, $1d, $43, $01, $47, $02, $fe
    db $33, $47, $02, $ff

    inc b
    nop
    ld [de], a
    ld c, d
    rst $38
    rst $20
    db $ec
    nop
    cp $a1
    add sp, $1e
    ld a, [c]
    ld bc, $3b30
    add hl, sp
    scf
    ld a, [c]
    nop
    add hl, sp
    ld [bc], a
    cp $31
    add hl, sp
    ld [bc], a
    rst $38
    dec b
    nop
    dec l
    ld c, d
    rst $38
    rst $20
    db $ec
    nop
    cp $a1
    ld a, [c]
    ld bc, $3430
    scf
    ld a, [c]
    nop
    dec [hl]
    ld [bc], a
    cp $31
    dec [hl]
    ld [bc], a
    rst $38

    db $00, $00, $c5, $4c, $01, $01, $c5, $4c, $02, $02, $c5, $4c, $03, $03, $c5, $4c
    db $06, $00, $59, $4a, $07, $03, $ad, $4a, $ff, $e7, $ec, $80, $fe, $f3, $e8, $1c
    db $1a, $03, $0e, $03, $1f, $05, $13, $05, $fe, $83, $1f, $05, $fe, $d3, $1a, $03
    db $0e, $03, $1f, $05, $13, $05, $fe, $63, $1f, $05, $fe, $b3, $1a, $03, $0e, $03
    db $1f, $05, $13, $05, $fe, $43, $1f, $05, $fe, $83, $1a, $03, $0e, $03, $1f, $05
    db $13, $05, $fe, $43, $1f, $05, $fe, $53, $1a, $03, $0e, $03, $1f, $05, $13, $05
    db $fe, $33, $1f, $05, $13, $05, $fe, $13, $1f, $05, $13, $05, $ff, $e7, $fe, $d1
    db $52, $02, $63, $02, $65, $02, $46, $02, $f2, $07, $60, $fe, $73, $d3, $46, $06
    db $fe, $a1, $52, $02, $63, $02, $65, $02, $46, $02, $f2, $07, $60, $fe, $53, $d3
    db $46, $06, $fe, $71, $52, $02, $63, $02, $65, $02, $46, $02, $f2, $07, $60, $fe
    db $43, $d3, $46, $06, $fe, $51, $52, $02, $63, $02, $65, $02, $46, $02, $f2, $07
    db $60, $fe, $33, $d3, $46, $06, $fe, $31, $52, $02, $63, $02, $65, $02, $46, $02
    db $f2, $07, $60, $fe, $23, $46, $70, $fe, $23, $46, $72, $46, $71, $ed, $ff, $05
    db $00, $18, $4b, $06, $03, $30, $4b, $ff, $e7, $ec, $40, $fe, $a3, $e8, $1c, $1a
    db $03, $0e, $03, $ec, $00, $1f, $04, $13, $04, $fe, $43, $1f, $04, $13, $04, $ff
    db $e7, $fe, $91, $52, $02, $44, $03, $55, $03, $46, $02, $fe, $33, $55, $03, $46
    db $04, $fe, $13, $55, $03, $46, $04, $ff, $00, $00, $c5, $4c, $01, $01, $c5, $4c
    db $02, $02, $c5, $4c, $03, $03, $c5, $4c, $06, $00, $61, $4b, $07, $03, $80, $4b
    db $ff, $e7, $ec, $80, $fe, $f3, $e8, $1b, $f2, $04, $1f, $18, $1f, $18, $f2, $0a
    db $ec, $00, $29, $fe, $c3, $29, $fe, $83, $29, $fe, $43, $29, $fe, $26, $29

    rst $38

    db $e7, $fe, $f1, $32, $02, $43, $02, $65, $02, $36, $04, $60, $0a, $f2, $07, $fe
    db $73, $36, $60, $fe, $33, $36, $60, $fe, $13, $36, $60, $ff, $06, $00, $a1, $4b
    db $ff, $e7, $ec, $80, $fe, $c3, $e8, $17, $24, $01, $26, $01, $30, $01, $32, $01
    db $1f, $0a, $fe, $63, $1f, $0a, $fe, $33, $1f, $0a, $ff, $06, $00, $c0, $4b, $ff
    db $e7, $ec, $80, $fe, $f3, $f4, $f4, $43, $01, $3c, $01, $37, $01, $3c, $01, $3e
    db $01, $41, $01, $43, $01, $f4, $00, $e8, $3f, $43, $0a, $fe, $63, $43, $0a, $fe
    db $33, $43, $0a, $ff, $00, $00, $c5, $4c, $01, $01, $c5, $4c, $02, $02, $c5, $4c
    db $03, $03, $c5, $4c, $06, $03, $79, $4c, $07, $00, $fd, $4b, $ff, $e7, $fe, $f1
    db $ec, $00, $e8, $1c, $f2, $01, $2f, $30, $32, $34, $35, $34, $32, $30, $2f, $2e
    db $2d, $2c, $2b, $2a, $29, $28, $27, $26, $25, $24, $23, $22, $21, $20, $1f, $1d
    db $1c, $1b, $18, $17, $16, $15, $14, $13, $12, $11, $10, $0f, $0e, $0d, $0c, $f2
    db $02, $0b, $0a, $09, $08, $07, $06, $05, $04, $03, $02, $01, $00, $ed, $fe, $31
    db $f2, $01, $ee, $1a, $4c, $f2, $00, $00, $04, $fe, $f4, $d3, $ec, $00, $e8, $1c
    db $2b, $05, $ec, $80, $18, $02, $fe, $f1, $e8, $17, $09, $02, $fe, $81, $e8, $1c
    db $ec, $00, $2b, $02, $ec, $80, $18, $02, $e8, $15, $09, $02, $fe, $41, $0c, $0a
    db $fe, $21, $0c, $0a, $fe, $11, $0c, $0a, $ff

    rst $20
    push af
    nop
    or $69
    cp $d1
    ld d, d
    ld [bc], a
    ld h, e
    ld [bc], a
    ld h, l
    ld [bc], a
    ld b, [hl]
    ld [bc], a
    ld a, [c]
    ld [$fe60], sp
    ld [hl], e
    ld b, [hl]
    ld h, b
    cp $33
    ld b, [hl]
    ld h, b
    cp $13
    ld b, [hl]
    ld h, b
    rst $38

    db $07, $03, $9d, $4c, $ff, $e7, $e4, $fe, $0a, $40, $10, $fe, $8a, $40, $08, $f8
    db $dd, $5a, $f7, $01, $fe, $c4, $00, $10, $e5, $fe, $a2, $00, $06, $e6, $fe, $82
    db $00, $06, $e5, $fe, $32, $00, $06, $e6, $fe, $22, $00, $06, $ff, $ff

    ldh a, [rSB]
    ldh [rSB], a
    ret nc

    ld bc, $01c0
    or b
    ld bc, $01a0
    sub b
    ld bc, $0180
    ld [hl], b
    ld bc, $0160
    ld d, b
    ld bc, $0140
    jr nc, @+$03

    jr nz, @+$03

    ld de, $0000
    ld bc, $0302
    inc b
    dec b
    ld b, $07
    rst $38
    db $eb
    ld c, h

    db $00, $00, $15, $4d, $01, $01, $40, $4d, $02, $02, $f8, $4d, $03, $03, $0b, $4f
    db $ff

    di
    db $e3
    ld [$dae2], a
    jp z, $f000

    rst $18
    call $00bb
    db $ec
    rst $10
    ret nz

    xor c
    nop
    rst $20
    call z, $a5b0

    db $ee, $b8, $4f

    push af
    nop
    or $24
    db $fc
    ld c, [hl]
    ld d, b
    ld a, [$5052]
    db $f4
    add sp, -$0d
    add b
    xor $4f
    ld c, l
    xor $4f
    ld c, l
    db $fc
    ld h, d
    ld d, b
    ld a, [$5068]
    push af
    nop
    or $0c
    di
    add c
    xor $8a
    ld c, l
    db $eb
    ld d, h
    pop af
    inc e
    ld c, l

    db $ee, $e5, $4f

    push af
    nop
    or $24
    db $fc
    ld c, [hl]
    ld d, b
    ld a, [$5052]
    db $f4
    db $f4
    ld sp, hl
    inc c
    db $ec
    add b
    rra
    jr jr_002_4d78

    inc c
    rra
    inc c
    inc h
    jr jr_002_4d7e

    inc c
    rra
    jr @+$21

    inc c
    ld [hl+], a
    inc c
    rra
    inc c
    daa
    jr jr_002_4d8e

    jr @+$21

    jr jr_002_4d8e

    inc c

jr_002_4d6d:
    rra
    inc c
    inc h
    jr jr_002_4d94

    inc c
    rra
    jr jr_002_4d95

    inc c
    ld [hl+], a

jr_002_4d78:
    inc c
    rra
    inc c
    dec e
    jr @+$20

jr_002_4d7e:
    jr jr_002_4d6d

    ldh a, [rSB]
    ld c, a
    ld c, l
    db $fc
    ld e, d
    ld d, b
    ld a, [$5060]
    ld hl, sp+$7b
    ld d, b
    db $f4

jr_002_4d8e:
    nop
    rst $30
    jr jr_002_4d7e

    ld b, b
    push af

jr_002_4d94:
    inc b

jr_002_4d95:
    ld sp, hl
    jr jr_002_4dc3

    ld c, b
    add hl, hl
    inc c
    ld l, $18
    dec l
    jr jr_002_4dcb

    jr jr_002_4dcb

    jr @+$2d

    ld d, h
    add hl, hl
    inc c
    ld l, $18
    dec l
    jr jr_002_4dda

    jr jr_002_4dde

    jr @+$2f

    ld d, h
    ld l, $0c
    dec l
    inc h

jr_002_4db5:
    ld l, $0c
    dec l
    jr jr_002_4de3

    jr jr_002_4db5

    nop
    dec hl
    ld l, h
    ld sp, hl
    jr @-$13

    ld c, b

jr_002_4dc3:
    ld h, $18
    dec hl
    ld c, b
    add hl, hl
    inc c
    ld l, $18

jr_002_4dcb:
    dec l
    jr @+$2d

    jr @+$2b

    jr @+$2d

    ld d, h
    add hl, hl
    inc c
    ld l, $18
    dec l
    jr jr_002_4e08

jr_002_4dda:
    jr jr_002_4e0c

    jr @+$34

jr_002_4dde:
    ld c, b

jr_002_4ddf:
    jr nc, jr_002_4ded

    ld l, $0c

jr_002_4de3:
    dec l
    inc h

jr_002_4de5:
    ld l, $0c
    dec l
    jr jr_002_4e13

    jr jr_002_4de5

    nop

jr_002_4ded:
    dec hl
    ld l, h
    ld sp, hl
    jr jr_002_4ddf

    db $eb
    ld h, b
    pop af
    ld b, a
    ld c, l
    rst $38

    db $df, $00, $00, $17, $02, $de, $02, $4d, $21, $04, $ee, $0a, $50

    db $e4
    pop hl
    rla

jr_002_4e08:
    ld [bc], a
    or $04

jr_002_4e0b:
    rla

jr_002_4e0c:
    ld [bc], a
    or $04
    ld hl, sp+$02
    ld c, l
    ld [c], a

jr_002_4e13:
    ld hl, $f604
    inc d
    ei
    add [hl]

jr_002_4e19:
    ld d, b

jr_002_4e1a:
    pop hl
    ld sp, hl
    nop
    reti


    inc de
    jr jr_002_4e1a

    dec b
    ld a, [c]
    inc c
    ret c

    inc de
    db $e4
    inc de
    reti


    ld d, $18
    ret c

    ld a, [de]
    db $d3
    reti


    inc de
    jr jr_002_4e0b

    inc de
    inc c
    ld sp, hl
    dec b
    ret c

    inc de
    inc c
    db $e4
    db $ed
    inc de
    inc c
    reti


    dec de
    jr jr_002_4e19

    ld a, [de]
    jr @-$11

    xor $17
    ld c, [hl]
    reti


    inc de
    inc c
    reti


    ld de, $d818
    ld [de], a
    inc c
    ld sp, hl
    dec b
    reti


    ld [de], a
    inc c
    db $e4
    xor $17
    ld c, [hl]
    xor $3b
    ld c, [hl]
    xor $17
    ld c, [hl]
    ld a, [c]
    inc c
    inc de
    ret c

    ld de, $11d8
    ret c

jr_002_4e67:
    ld [de], a
    ret c

    ld [de], a
    db $d3

jr_002_4e6b:
    ei
    sub [hl]
    ld d, b
    reti


    inc de
    jr jr_002_4e6b

    dec b
    ld a, [c]
    inc c
    ret c

jr_002_4e76:
    inc de
    db $e4
    inc de
    reti


    ld d, $18
    ret c

jr_002_4e7d:
    ld a, [de]
    inc de

jr_002_4e7f:
    db $d3
    reti


    inc de
    jr jr_002_4e7d

    dec b
    ret c

    inc de
    inc c

jr_002_4e88:
    db $e4
    inc de
    inc c
    reti


    dec de
    jr jr_002_4e67

    ld a, [de]
    jr jr_002_4e6b

    jr @+$1a

    ld sp, hl
    dec b
    ld a, [c]
    inc c
    ret c

    jr jr_002_4e7f

    jr jr_002_4e76

    dec de
    dec e
    ret c

    rra
    jr jr_002_4e76

    reti


    jr jr_002_4ebe

    ld sp, hl
    dec b
    ld a, [c]
    inc c
    ret c

    jr @-$1a

    jr jr_002_4e88

    ld d, $d9
    ld d, $d8
    dec d
    reti


    dec d
    db $d3
    reti


    ld de, $f918
    dec b
    ld a, [c]
    inc c

jr_002_4ebe:
    ret c

    ld de, $11e4
    reti


    dec d
    ld d, $d8
    jr @+$13

    db $d3
    reti


    ld de, $f918
    dec b
    ret c

    ld de, $e40c
    ld de, $d90c
    rrca
    jr @-$26

    ld c, $18
    reti


    inc de
    jr @-$05

    dec b
    ld a, [c]
    inc c
    ret c

    inc de
    db $e4
    inc de
    reti


    ld d, $18
    ret c

jr_002_4ee9:
    ld a, [de]
    inc de
    db $d3
    reti


    inc de
    jr jr_002_4ee9

    dec b
    ld a, [c]
    inc c
    ret c

    inc de

jr_002_4ef5:
    db $e4
    inc de
    ret c

    ld de, $11d8
    ret c

    ld [de], a
    db $d3
    ret c

    ld [de], a
    ld b, $d8
    ld [de], a
    ld b, $ef
    ld bc, $4e6b
    pop af
    rla
    ld c, [hl]

    db $d2, $41, $42, $02, $d1, $b1, $02, $01, $ee, $3f, $50

    rst $20
    ld sp, hl
    nop
    adc $06
    adc $06
    cp $a2
    inc h
    jr jr_002_4ef5

    cp $b1
    ld [bc], a
    ld [bc], a
    cp $a3
    ld [bc], a
    ld d, $f2
    inc c
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    db $ed
    ldh a, [rSB]
    ld [hl], $4f
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call $fed3
    or c
    ld [bc], a
    ld [bc], a
    cp $a2
    ld [bc], a
    ld a, [bc]
    xor $21
    ld c, a
    xor $36
    ld c, a
    ld [bc], a
    ld [bc], a
    db $d3
    call $cd18
    inc c
    ldh a, [$03]
    ld h, h
    ld c, a
    cp $b1
    ld [bc], a
    ld [bc], a
    cp $a3
    ld [bc], a
    ld d, $f2
    inc c
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    ldh a, [rSB]
    ld a, [hl]
    ld c, a
    db $ed
    ld [bc], a
    ld [bc], a
    call Call_002_41fe
    ld [bc], a
    ld [bc], a
    ld [bc], a
    call $02d3
    ld [bc], a
    cp $a2
    ld [bc], a
    ld a, [bc]
    xor $6a
    ld c, a
    ld [bc], a
    ld [bc], a
    db $d3
    call $cd18
    inc c
    ldh a, [rSC]
    and a
    ld c, a
    call $cd06
    ld b, $ef
    ld bc, $4f6a
    pop af
    db $21
    ld c, a

    db $f5, $04, $e7, $f9, $13, $f7, $26, $ec, $80, $fc, $48, $50, $fa, $4c, $50, $f8
    db $6e, $50, $f4, $0c, $13, $4c, $16, $4c, $14, $98, $13, $4c, $16, $4c, $18, $98

    inc de
    ld c, h
    ld d, $4c
    inc d
    sbc b
    inc de
    ld c, h
    ld d, $4c
    rla
    sbc b
    db $ed

    db $f5, $04, $e7, $f9, $13, $f7, $24, $ec, $80, $fc, $48, $50, $fa, $4c, $50, $f8
    db $6e, $50, $f4, $0c, $0e, $4c, $0e, $4c, $0f, $98, $0e, $4c, $0e, $4c, $12, $98

    ldh a, [rSB]
    ld sp, hl
    ld c, a
    db $ed

    db $e7, $f5, $00, $f9, $03, $fc, $6a, $50, $fa, $6c, $50, $fb, $e8, $5a, $f8, $6e
    db $50, $f7, $26, $f2, $26, $13, $13, $13, $13, $0c, $0c, $0c, $0c, $13, $13, $13
    db $13, $0f, $0f, $0f

    rrca
    inc de
    inc de
    inc de
    inc de
    inc c
    inc c
    inc c
    inc c
    inc de
    inc de
    inc de
    inc de
    db $d3
    rrca
    sbc b
    db $ed

    db $f5, $00, $f6, $98, $f0, $07, $41, $50

    db $ed

    db $2b, $12, $70, $00, $66, $00, $83, $09, $50, $00, $20, $00

    ld b, e
    ld b, $20
    nop
    stop
    add c
    ld [bc], a
    and e
    ld b, $80
    nop
    ld b, b
    nop
    ld b, d
    ld [bc], a
    ld d, h
    inc b
    ld h, b
    nop
    jr nc, @+$02

    db $20, $00, $40, $00, $03, $06, $04, $02, $00, $fd, $fa, $fc, $fe, $00, $80, $6e
    db $50, $01, $03, $01, $00, $ff, $fd, $ff, $00, $80, $7b, $50

    nop
    ld de, $4612
    sbc e
    sbc $ee
    rst $38
    rst $38
    xor $ed
    cp c
    ld h, h
    ld hl, $0011
    nop
    ld de, $4612
    sbc e
    sbc [hl]
    xor $ff
    rst $38
    xor $ed
    cp c
    ld h, h
    ld hl, $0011

    db $00, $00, $d1, $50, $01, $01, $5f, $52, $02, $02, $c7, $54, $03, $03, $71, $58
    db $ff

    di
    db $e3

    db $fa, $dc, $c8, $b3, $00, $f0, $df, $cd, $bb, $00, $ec, $d7, $c0, $a9, $00, $e7
    db $cc, $b0, $a5, $00, $e1, $bf, $9c, $76, $f5, $04, $e7, $f7, $48, $ec, $00, $fc
    db $4d, $5a, $fa, $5f, $5a, $f8, $c5, $5a, $f9, $00, $26, $02, $28, $5e, $eb, $24
    db $ea, $f2, $03, $27, $26, $25, $23, $22, $21, $20, $1f, $1e, $1d, $f9, $18, $27
    db $26, $25, $23, $22, $21, $20, $1f, $1e, $1d, $d3, $e9, $f5, $06, $f6, $60, $f5
    db $00, $f6, $60, $f6, $60, $f6, $30, $fc, $6f, $5a, $fa, $73, $5a, $f9, $0c, $ec
    db $80, $09, $06, $09, $06, $09, $06, $09, $06, $09, $0c, $09, $0c, $fc, $75, $5a
    db $fa, $79, $5a, $f9, $03, $f5, $07, $ec, $40, $f7, $18, $f3, $81, $1c, $06, $1f
    db $06, $21, $06, $f6, $06, $fc, $7b, $5a, $fa, $7f, $5a, $1c, $06, $1f, $06, $21
    db $06, $f6, $06, $f9, $00, $fe, $27, $1c, $06, $1f, $06, $21, $24, $fc, $81, $5a
    db $fa, $87, $5a, $f8, $d0, $5a, $f9, $0c, $ec, $80, $e7, $f7, $01, $15, $60, $f0
    db $01, $26, $51, $ed, $f5, $00, $f6, $0a, $fc, $a9, $5a, $fa, $af, $5a, $ee, $07
    db $53, $34, $02, $fc, $8b, $5a, $fa, $91, $5a, $f2, $0c, $14, $1a, $1f, $1d, $1c
    db $d3, $1a, $06, $1b, $12, $ee, $26, $51, $f5, $00, $f6, $0a, $fc, $a9, $5a, $fa
    db $af, $5a, $ee, $88, $53, $f5, $00, $f6, $02, $fc, $8b, $5a, $fa, $91, $5a, $ec
    db $40, $f2, $0c, $15, $17, $10, $0e, $0c, $0b, $04, $d3, $fc, $b1, $5a, $fa, $b5
    db $5a, $f9, $0c, $f5, $07, $f6, $18, $ec, $80, $24, $0c, $f6, $18, $28, $24, $f6
    db $18, $26, $0c, $f6, $18, $2a, $24, $f6, $18, $24, $0c, $f6, $18, $28, $24, $ed
    db $fc, $9f, $5a, $fa, $a5, $5a, $f2, $0c, $f6, $1e, $1f, $21, $1f, $1e, $d3, $1a
    db $06, $09, $12, $ee, $b4, $51, $fc, $8b, $5a, $fa, $91, $5a, $f6, $0c, $1e, $0c
    db $f6, $0c, $1a, $3c, $f5, $00, $f6, $0a, $fc, $a9, $5a, $fa, $af, $5a, $ee, $4b
    db $54, $f6, $02, $fc, $8b, $5a, $fa, $91, $5a, $1a, $0c, $1f, $0c, $23, $0c, $23
    db $06, $24, $06, $21, $54, $f2, $0c, $f6, $13, $11, $10, $0e, $0c, $0b, $07, $d3
    db $f9, $00, $21, $48, $f8, $00, $00, $fe, $84, $e8, $2f, $21, $18, $fe, $64, $21
    db $18, $fe, $44, $21, $18, $f5, $00, $f6, $3f, $e8, $08, $e7, $fc, $a9, $5a, $fa
    db $af, $5a, $f9, $06, $f5, $04, $f7, $18, $ec, $80, $f4, $f4, $ee, $a1, $54, $eb
    db $51, $f4, $00, $f1, $26, $51, $f5, $04, $e7, $f7, $48, $ec, $00, $fc, $4d, $5a
    db $fa, $5f, $5a, $f8, $c5, $5a, $f9, $00, $2b, $02, $2d, $5e, $eb, $24, $ea, $f2
    db $03, $2c, $2b, $2a, $29, $28, $27, $26, $25, $24, $23, $f9, $18, $2c, $2b, $2a
    db $29, $28, $27, $26, $25, $24, $23, $d3, $e9, $f4, $00, $f5, $06, $f6, $60, $f5
    db $00, $f6, $60, $f6, $60, $f6, $30, $fc, $6f, $5a, $fa, $73, $5a, $f9, $0c, $ec
    db $80, $15, $06, $15, $06, $15, $06, $15, $06, $15, $0c, $15, $0c, $fc, $75, $5a
    db $fa, $79, $5a, $f9, $03, $f5, $07, $ec, $40, $f7, $18, $28, $06, $2b, $06, $2d
    db $06, $f6, $06, $fc, $7b, $5a, $fa, $7f, $5a, $e6, $28, $06, $2b, $06, $2d, $06
    db $f6, $06, $f9, $00, $fe, $27, $e5, $28, $06, $2b, $06, $2d, $24, $fc, $81, $5a
    db $fa, $87, $5a, $f8, $d0, $5a, $e7, $ec, $80, $f7, $01, $f9, $0e, $1b, $24, $f9
    db $0c, $1a, $3c, $f0, $01, $b6, $52, $ed, $fc, $8b, $5a, $fa, $91, $5a, $ec, $40
    db $f9, $06, $f7, $0c, $f5, $04, $24, $12, $23, $12, $24, $0c, $f6, $0c, $f2, $06
    db $26, $2b, $26, $24, $23, $24, $d3, $23, $12, $21, $12, $1c, $24, $f6, $06, $1c
    db $06, $1f, $06, $1c, $06, $1d, $12, $1c, $12, $1d, $18, $f2, $06, $1a, $1c, $1d
    db $1a, $1c, $1d, $d3, $1f, $12, $1d, $12, $1f, $18, $1c, $0c, $1d, $0c, $1f, $0c
    db $21, $12, $1f, $12, $21, $0c, $23, $12, $21, $12, $23, $0c, $24, $12, $23, $12
    db $24, $0c, $26, $12, $24, $12, $26, $0c, $f9, $0c, $28, $36, $ec, $00, $f2, $06
    db $1c, $21, $23, $28, $2d, $2f, $32, $d3, $ed, $f2, $0c, $34, $2c, $32, $37, $35
    db $34, $d3, $32, $06, $33, $12, $ee, $b6, $52, $fc, $8b, $5a, $fa, $91, $5a, $ec
    db $40, $f9, $06, $f7, $0c, $f5, $04, $24, $06, $23, $06, $24, $06, $26, $0c, $2b
    db $0c, $26, $12, $24, $0c, $23, $0c, $24, $0c, $23, $0c, $24, $06, $21, $0c, $1c
    db $0c, $1c, $0c, $f6, $06, $1c, $0c, $1f, $0c, $1c, $0c, $1d, $0c, $1c, $06, $1d
    db $06, $1f, $0c, $1d, $06, $1f, $06, $21, $0c, $1f, $06, $21, $06, $23, $0c, $21
    db $06, $23, $06, $24, $06, $23, $06, $24, $06, $26, $0c, $24, $06, $26, $06, $27
    db $0c, $1e, $06, $21, $06, $2a, $06, $2d, $06, $33, $06, $3b, $06, $39, $06, $f9
    db $0c, $38, $60, $ed, $ec, $00, $f2, $0c, $f5, $00, $f6, $2d, $2f, $28, $26, $24
    db $23, $1c, $d3, $fc, $b1, $5a, $fa, $b5, $5a, $f9, $0c, $f5, $07, $f6, $18, $ec
    db $80, $28, $0c, $f6, $18, $2b, $24, $f6, $18, $2a, $0c, $f6, $18, $2d, $24, $f6
    db $18, $28, $0c, $f6, $18, $2b, $24, $ed, $fc, $9f, $5a, $fa, $a5, $5a, $f2, $0c
    db $f6, $2a, $2b, $2d, $2b, $2a, $d3, $26, $06, $15, $12, $ee, $fc, $53, $fc, $8b
    db $5a, $fa, $91, $5a, $f6, $0c, $2a, $0c, $f6, $0c, $26, $3c, $fc, $8b, $5a, $fa
    db $91, $5a, $f9, $0c, $f5, $04, $ec, $40, $24, $06, $23, $06, $24, $06, $21, $1e
    db $f6, $0c, $21, $0c, $28, $0c, $24, $0c, $26, $06, $24, $06, $26, $06, $23, $1e
    db $ed, $f6, $0c, $fc, $8b, $5a, $fa, $91, $5a, $26, $0c, $2b, $0c, $2f, $0c, $2f
    db $06, $30, $06, $2d, $54, $ec, $00, $f2, $0c, $f6, $2b, $29, $28, $26, $24, $23
    db $1f, $d3, $fc, $9f, $5a, $fa, $a5, $5a, $f9, $06, $f5, $04, $f7, $18, $ec, $80
    db $f4, $f4, $34, $3c, $37, $18, $36, $6c, $34, $30, $2d, $12, $30, $12, $34, $0c
    db $37, $12, $3b, $12, $36, $3c, $34, $3c, $37, $18, $36, $4e, $37, $12, $39, $0c
    db $f9, $00, $3b, $60, $f9, $18, $ed, $eb, $60, $f4, $00, $f1, $b6, $52, $df, $00
    db $00, $17, $02, $de, $b9, $50, $21, $04, $dd, $bd, $50, $23, $05, $dc, $c2, $50
    db $1f, $05, $db, $c7, $50, $1b, $05, $da, $cc, $50, $17, $05, $e7, $f5, $00, $fc
    db $b9, $5a, $fa, $be, $5a, $fb, $e8, $5a, $f9, $0c, $d8, $15, $18, $d9, $15, $18
    db $f0, $06, $f6, $54, $f9, $08, $d9, $15, $18, $d8, $15, $18, $e4, $d9, $15, $0c
    db $d9, $15, $0c, $f9, $0c, $d8, $15, $18, $ed, $d9, $15, $18, $d8, $15, $18, $e4
    db $17, $01, $15, $05, $f0, $03, $19, $55, $f9, $0c, $d8, $15, $18, $ed, $ee, $fd
    db $54, $d9, $15, $18, $e4, $d8, $15, $0c, $fc, $b9, $5a, $d9, $15, $0c, $fb, $f8
    db $5a, $f2, $06, $d7, $15, $d7, $15, $d6, $15, $d6, $15, $d5, $15, $d5, $15, $d4
    db $15, $d4, $15, $d3, $fb, $e8, $5a, $e4, $f2, $06, $d9, $15, $21, $15, $21, $d8
    db $15, $d9, $15, $d9, $15, $15, $f9, $03, $d9, $15, $e4, $15, $f9, $03, $d9, $15
    db $15, $e4, $d8, $18, $f9, $03, $d8, $1a, $e4, $d3, $15, $0c, $f2, $06, $d9, $11
    db $1d, $f9, $03, $d3, $11, $0c, $e4, $d8, $11, $06, $d9, $11, $06, $f9, $03, $11
    db $0c, $d9, $11, $0c, $f2, $06, $e4, $d9, $1d, $11, $d8, $11, $d8, $11, $ed, $13
    db $14, $d3, $ee, $4d, $55, $d3, $11, $0c, $d9, $13, $06, $1f, $06, $13, $0c, $d8
    db $13, $06, $d9, $13, $06, $d9, $13, $0c, $d9, $13, $0c, $f9, $03, $f2, $06, $d9
    db $13, $e4, $13, $f9, $03, $d8, $13, $13, $d3, $e4, $13, $0c, $d9, $15, $06, $21
    db $06, $15, $0c, $d8, $15, $06, $d9, $15, $06, $d9, $15, $0c, $d9, $15, $0c, $f2
    db $06, $d9, $15, $15, $f9, $03, $d8, $15, $e4, $15, $d9, $15, $d9, $15, $d3, $d9
    db $0e, $06, $1a, $06, $0e, $0c, $d8, $0e, $06, $d9, $0e, $06, $d9, $0e, $0c, $d9
    db $0e, $0c, $f2, $06, $d9, $0e, $0e, $f9, $03, $d8, $0e, $e4, $0e, $d9, $0e, $d9
    db $0e, $d3, $ed, $d9, $10, $06, $1c, $06, $10, $0c, $d8, $10, $06, $d9, $10, $06
    db $d9, $10, $0c, $d9, $10, $0c, $f2, $06, $d9, $10, $10, $f9, $03, $d8, $10, $e4
    db $10, $d9, $10, $d9, $10, $d3, $f9, $03, $d9, $11, $06, $1d, $06, $e4, $11, $0c
    db $d8, $11, $0c, $d9, $11, $0c, $d9, $11, $06, $1d, $06, $11, $0c, $f9, $03, $d8
    db $11, $0c, $e4, $11, $0c, $d9, $0e, $06, $1a, $06, $0e, $0c, $d8, $0e, $0c, $d9
    db $0e, $0c, $d9, $17, $06, $23, $06, $17, $0c, $f9, $03, $d8, $17, $0c, $e4, $17
    db $0c, $17, $01, $10, $05, $f9, $03, $17, $01, $10, $05, $10, $0c, $f0, $06, $74
    db $56, $e4, $d9, $10, $0c, $fb, $f8, $5a, $f2, $06, $d7, $14, $d7, $14, $d6, $1a
    db $d6, $1a, $d5, $1f, $d5, $1f, $d6, $1d, $d6, $1d, $d5, $1c, $d5, $1c, $d5, $1a
    db $d5, $1a, $d4, $1a, $d4, $1b, $d3, $ee, $4d, $55, $13, $14, $d3, $ee, $4d, $55
    db $d3, $11, $0c, $ee, $a1, $55, $d9, $17, $06, $23, $06, $17, $0c, $d8, $17, $06
    db $d9, $17, $06, $d9, $17, $0c, $d9, $17, $0c, $f9, $03, $f2, $06, $d9, $17, $e4
    db $17, $f9, $03, $d8, $17, $e4, $17, $d9, $17, $d9, $17, $d3, $d9, $10, $06, $d9
    db $1c, $06, $f9, $03, $f2, $0c, $10, $10, $10, $10, $d3, $10, $06, $f0, $05, $e4
    db $56, $e4, $d9, $10, $0c, $fb, $f8, $5a, $f2, $06, $d7, $15, $d7, $21, $d6, $23
    db $d6, $23, $d5, $1c, $d5, $1c, $f8, $b9, $50, $f2, $04, $e2, $21, $21, $21, $f8
    db $c7, $50, $1b, $f0, $05, $0b, $57, $f8, $cc, $50, $17, $17, $17, $d3, $e1, $fb
    db $e8, $5a, $f9, $03, $d9, $15, $0c, $f2, $06, $15, $15, $e4, $d8, $15, $d9, $15
    db $f9, $03, $d9, $15, $15, $d3, $d9, $15, $0c, $f2, $06, $d9, $21, $e4, $15, $d8
    db $15, $f9, $03, $d8, $15, $d3, $15, $0c, $ed, $d9, $15, $0c, $f2, $06, $15, $15
    db $e4, $d8, $15, $d9, $15, $f9, $03, $d9, $15, $15, $d9, $15, $21, $d9, $15, $21
    db $e4, $d8, $12, $d8, $12, $13, $14, $d3, $ed, $ee, $18, $57, $f2, $0c, $d9, $15
    db $1e, $d8, $1f, $d9, $21, $d9, $1f, $d9, $1e, $d3, $e4, $d8, $1a, $06, $d8, $15
    db $12, $ee, $18, $57, $ee, $42, $57, $ee, $18, $57, $f8, $b9, $50, $d9, $0e, $0c
    db $f2, $06, $0e, $0e, $e4, $d8, $0e, $d9, $0e, $f9, $03, $d9, $0e, $0e, $d9, $0e
    db $1a, $d8, $0e, $d8, $1a, $d8, $0e, $d8, $0e, $f9, $03, $d9, $0e, $0e, $d3, $e4
    db $d9, $11, $0c, $1d, $06, $11, $06, $d8, $11, $06, $d9, $11, $06, $d9, $11, $0c
    db $f9, $03, $d9, $11, $0c, $f2, $06, $11, $11, $e4, $d8, $11, $d8, $11, $f9, $03
    db $d9, $11, $11, $e4, $d3, $d9, $13, $0c, $1f, $06, $13, $06, $d8, $13, $06, $d9
    db $13, $06, $d9, $13, $0c, $f9, $03, $d9, $13, $0c, $13, $06, $13, $06, $e4, $d8
    db $13, $06, $f9, $03, $d8, $13, $06, $d9, $13, $06, $13, $06, $d9, $15, $0c, $f2
    db $06, $15, $e4, $15, $d8, $15, $d9, $15, $f9, $03, $d9, $15, $15, $d9, $15, $21
    db $15, $21, $e4, $d8, $15, $f9, $03, $d8, $15, $d3, $d9, $15, $0c, $e4, $d8, $10
    db $0c, $d9, $1f, $0c, $d8, $1d, $06, $d8, $1d, $06, $d9, $1c, $0c, $fb, $f8, $5a
    db $f8, $bd, $50, $e2, $23, $04, $f0, $02, $2d, $58, $e1, $f2, $06, $d6, $18, $d6
    db $18, $d6, $17, $d6, $17, $d8, $13, $d8, $13, $d3, $fb, $e8, $5a, $ee, $fd, $54
    db $ee, $12, $55, $ef, $02, $43, $58, $e4, $d9, $15, $06, $f0, $03, $50, $58, $f9
    db $0c, $d8, $15, $18, $f9, $03, $d9, $15, $0c, $d9, $15, $0c, $f9, $0c, $d8, $15
    db $18, $ef, $01, $50, $58, $f1, $4d, $55, $d2, $41, $42, $01, $d1, $b1, $02, $01
    db $d0, $81, $03, $00, $cf, $41, $42, $02, $e7, $e4, $fe, $d1, $02, $02, $fe, $a4
    db $02, $2e, $fe, $41, $26, $01, $01, $17, $f0, $05, $8d, $58, $fe, $41, $26, $01
    db $01, $17, $fe, $b1, $02, $01, $01, $17, $fe, $41, $26, $01, $01, $0b, $26, $01
    db $01, $0b, $fe, $b1, $02, $01, $01, $17, $ed, $fe, $41, $26, $01, $01, $17, $cd
    db $18, $fe, $41, $26, $01, $01, $05, $f0, $03, $bc, $58, $cd, $18, $ee, $95, $58
    db $fe, $41, $26, $01, $01, $17, $cd, $0c, $fe, $41, $26, $01, $01, $07, $fe, $61
    db $03, $01, $00, $01, $03, $01, $00, $01, $cc, $06, $f0, $07, $e1, $58, $f2, $06
    db $cb, $01, $01, $01, $cd, $ce, $ce, $01, $cb, $01, $ce, $01, $cd, $cd, $fe, $41
    db $01, $01, $ed, $f0, $03, $e7, $58, $cb, $01, $01, $01, $cd, $ce, $ce, $01, $cb
    db $01, $ce, $01, $cd, $fe, $41, $01, $01, $01, $cb, $01, $01, $01, $cd, $ce, $ce
    db $01, $cb, $01, $ce, $01, $cd, $fe, $41, $01, $ce, $ce, $ed, $f0, $01, $00, $59
    db $d3, $ce, $06, $01, $06, $fe, $44, $02, $0c, $cd, $06, $fe, $41, $01, $06, $fe
    db $44, $42, $01, $01, $0b, $ce, $06, $01, $06, $fe, $44, $02, $0c, $cd, $06, $fe
    db $41, $01, $06, $fe, $44, $01, $0c, $f0, $01, $29, $59, $cb, $06, $cb, $12, $fe
    db $0e, $40, $30, $fe, $8a, $40, $08, $f8, $dd, $5a, $f7, $01, $fe, $c4, $00, $10
    db $e5, $fe, $a2, $00, $06, $e6, $fe, $82, $00, $06, $e7, $f8, $00, $00, $ed, $cc
    db $06, $f0, $0d, $78, $59, $ee, $e7, $58, $f0, $03, $7e, $59, $ee, $00, $59, $d3
    db $ce, $06, $01, $06, $fe, $44, $02, $0c, $cd, $06, $ce, $06, $fe, $44, $42, $01
    db $02, $0b, $ce, $06, $01, $06, $fe, $44, $42, $01, $02, $0b, $cd, $06, $fe, $41
    db $01, $06, $fe, $44, $42, $01, $02, $0b, $f0, $01, $88, $59, $ee, $54, $59, $cc
    db $06, $f0, $05, $b8, $59, $cc, $04, $f0, $0b, $be, $59, $ee, $e7, $58, $f0, $06
    db $c4, $59, $cb, $01, $01, $01, $cd, $ce, $ce, $01, $cb, $01, $cd, $cd, $cd, $cd
    db $ce, $01, $cb, $01, $01, $01, $cd, $ce, $ce, $01, $cb, $01, $01, $01, $cd, $cd
    db $ce, $01, $f0, $02, $db, $59, $f2, $00, $fe, $d1, $02, $02, $fe, $a2, $02, $16
    db $cd, $06, $cd, $06, $ce, $0c, $cc, $04, $cc, $04, $cc, $04, $f2, $06, $cc, $cc
    db $cc, $cc, $cd, $cd, $d3, $fe, $41, $42, $01, $02, $17, $cd, $18, $fe, $41, $42
    db $01, $02, $0b, $42, $01, $02, $0b, $cd, $18, $fe, $41, $42, $01, $02, $17, $cd
    db $18, $f2, $06, $ce, $ce, $ce, $ce, $d3, $cd, $18, $f0, $02, $0e, $5a, $f2, $06
    db $ce, $ce, $ce, $ce, $d3, $cd, $18, $ce, $0c, $ce, $0c, $cd, $18, $f0, $01, $37
    db $5a, $f1, $e7, $58, $29, $07, $80, $90, $70, $02, $60, $02, $50, $02, $40, $02
    db $30, $02, $20, $02, $10, $00

    add b
    ld [bc], a
    ld [hl], b
    ld [bc], a
    ld h, b
    ld [bc], a
    ld d, b
    ld [bc], a
    ld b, b
    ld [bc], a
    jr nc, jr_002_5a6d

    jr nz, @+$04

jr_002_5a6d:
    stop

    db $61, $03, $30, $00, $10, $00, $79, $03, $a0, $00, $40, $00, $29, $01, $30, $00
    db $10, $00, $69, $02, $81, $03, $50, $00, $10, $01, $20, $00, $79, $03, $b2, $06
    db $80, $00, $10, $01, $30, $00

    adc c
    inc bc
    jp nz, $9006

    nop
    db $10
    ld bc, $0040

    db $59, $03, $92, $06, $60, $00, $10, $01, $30, $00, $39, $03, $52, $06, $30, $00
    db $10, $00, $a2, $0c, $40, $00, $09, $03, $20, $00, $20, $00, $ff, $6a, $50, $40
    db $04, $60, $00

    rst $38
    ld l, [hl]
    ld d, b

    db $01, $01, $00, $00, $ff, $ff, $00, $00, $80, $c5, $5a, $01, $02, $03, $02, $00
    db $ff, $fe, $fd, $fe, $00, $80, $d0, $5a, $40, $41, $42, $43, $44, $45, $46, $47
    db $80, $e4, $5a, $02, $46, $89, $ab, $cd, $ef, $ed, $cb, $a9, $87, $65, $45, $65
    db $43, $21, $00, $00, $11, $12, $46, $9b, $de, $ee, $ff, $ff, $ee, $ed, $b9, $64
    db $21, $11, $00, $00, $00, $19, $5b, $01, $01, $dc, $5b, $02, $02, $8a, $5c, $03
    db $03, $f8, $5d, $ff, $f5, $04, $e7, $f7, $0e, $ec, $00, $fc, $1e, $5f, $fa, $22
    db $5f, $f8, $d0, $5a, $f9, $07, $1d, $0e, $f0, $05, $2b, $5b, $1c, $3f, $1c, $07
    db $1d, $07, $1e, $07, $f9, $00, $1f, $54, $f9, $0e, $eb, $56, $fc, $75, $5a, $fa
    db $79, $5a, $f9, $0e, $fc, $75, $5a, $fa, $79, $5a, $ec, $80, $f3, $81, $e6, $ee
    db $0d, $5c, $07, $05, $fc, $75, $5a, $fa, $79, $5a, $f3, $80, $e7, $ee, $0d, $5c
    db $07, $07, $f0, $03, $62, $5b, $f2, $07, $0a, $0d, $11, $0f, $0c, $08, $0a, $16
    db $0a, $14, $ed, $0a, $15, $ee, $6d, $5b, $16, $09, $f0, $03, $6d, $5b, $d3, $f6
    db $02, $f3, $81, $e6, $f2, $07, $02, $07, $05, $0c, $09, $0e, $02, $0e, $02, $0c
    db $07, $09, $02, $07, $05, $0c, $09, $0e, $02, $0e, $02, $0c, $0e, $02, $02, $06
    db $0c, $11, $09, $0c, $0e, $12, $18, $1d, $15, $18, $0e, $12, $18, $1d, $15, $18
    db $1a, $1e, $24, $29, $21, $24, $2d, $2a, $24, $21, $1e, $18, $21, $1e, $18, $15
    db $12, $0c, $09, $09, $09, $f2, $0e, $09, $f2, $07, $09, $09, $09, $09, $d3, $09
    db $0e, $09, $07, $ed, $f1, $47, $5b, $f5, $04, $e7, $f7, $0e, $ec, $00, $fc, $1e
    db $5f, $fa, $22, $5f, $f8, $d0, $5a, $f9, $07, $20, $0e, $f0, $05, $ee, $5b, $1f
    db $3f, $1f, $07, $20, $07, $21, $07, $f9, $00, $22, $54, $f9, $0e, $eb, $54, $fc
    db $75, $5a, $fa, $79, $5a, $ec, $80, $e5, $f7, $0e, $f2, $07, $07, $0a, $0e, $0c
    db $09, $05, $07, $13, $07, $11, $07, $13, $07, $0a, $0e, $0c, $09, $05, $07, $13
    db $07, $11, $13, $d3, $ed, $07, $07, $fc, $26, $5f, $fa, $2a, $5f, $f8, $30, $5f
    db $ec, $40, $e7, $f9, $07, $29, $3f, $29, $07, $26, $07, $29, $07, $28, $3f, $28
    db $07, $24, $07, $28, $07, $f9, $00, $26, $54, $f9, $0e, $eb, $3f, $f6, $15, $f0
    db $01, $38, $5c, $f9, $07, $2c, $3f, $2c, $07, $29, $07, $2c, $07, $2b, $3f, $2b
    db $07, $27, $07, $2b, $07, $f9, $00, $29, $54, $f9, $0e, $eb, $3f, $f6, $15, $f0
    db $01, $58, $5c, $ec, $80, $e5, $fc, $75, $5a, $fa, $79, $5a, $f8, $d0, $5a, $ee
    db $89, $5b, $f1, $0c, $5c, $df, $00, $00, $17, $02, $de, $b9, $50, $21, $04, $dd
    db $bd, $50, $23, $05, $dc, $c2, $50, $1f, $05, $db, $c7, $50, $1b, $05, $da, $cc
    db $50, $17, $05, $e7, $f5, $00, $fc, $b9, $5a, $fa, $be, $5a, $fb, $e8, $5a, $f9
    db $03, $d9, $0c, $0e, $f0, $05, $b6, $5c, $d8, $0c, $0e, $f0, $05, $bd, $5c, $f2
    db $07, $d9, $0c, $d8, $18, $f0, $02, $c6, $5c, $d8, $0c, $d8, $18, $d9, $0c, $d8
    db $18, $d8, $0c, $d9, $18, $d8, $0c, $d4, $18, $d9, $0c, $d8, $18, $d4, $0c, $d9
    db $18, $d7, $0c, $d6, $18, $d5, $0c, $d6, $18, $d5, $0c, $d4, $18, $d3, $d9, $13
    db $0e, $d9, $13, $07, $d8, $13, $0e, $ed, $d9, $13, $07, $f0, $03, $fd, $5c, $d8
    db $13, $0e, $d9, $13, $07, $ed, $ee, $f3, $5c, $f2, $07, $d9, $13, $d9, $13, $d8
    db $13, $d9, $13, $d8, $13, $d8, $13, $d9, $13, $d3, $ef, $03, $f3, $5c, $d9, $13
    db $07, $13, $07, $d9, $13, $07, $ed, $d8, $13, $0e, $d9, $13, $07, $ed, $d9, $13
    db $0e, $d9, $13, $07, $ee, $2c, $5d, $ee, $23, $5d, $f2, $07, $d8, $13, $13, $d9
    db $13, $d8, $13, $d8, $13, $d9, $13, $d8, $13, $d8, $13, $d8, $13, $d3, $d9, $16
    db $0e, $d9, $16, $07, $d8, $16, $0e, $ed, $d9, $16, $07, $f0, $03, $5d, $5d, $d8
    db $16, $0e, $d9, $16, $07, $ed, $ee, $53, $5d, $f2, $07, $d9, $16, $d9, $16, $d8
    db $16, $d9, $16, $d8, $16, $d8, $16, $d9, $16, $d3, $ef, $02, $53, $5d, $ee, $53
    db $5d, $ee, $5d, $5d, $ee, $53, $5d, $f2, $07, $d9, $16, $d8, $16, $d8, $16, $d9
    db $16, $d8, $16, $d8, $16, $d8, $16, $d3, $d9, $0e, $0e, $d9, $0e, $07, $d8, $0e
    db $0e, $d9, $0e, $07, $d9, $0e, $07, $d8, $0e, $07, $d9, $0e, $07, $ed, $d8, $0e
    db $0e, $d8, $0e, $07, $ee, $9d, $5d, $f2, $07, $d8, $0e, $d8, $0e, $d9, $0e, $ed
    db $d9, $0e, $0e, $d9, $0e, $ee, $be, $5d, $f0, $03, $c5, $5d, $d9, $0e, $d8, $0e
    db $d9, $0e, $ee, $be, $5d, $f0, $01, $d1, $5d, $d8, $0e, $d6, $0e, $d4, $0e, $e4
    db $d8, $0e, $f9, $03, $d6, $0e, $d4, $0e, $f8, $b9, $50, $f0, $01, $de, $5d, $d3
    db $f1, $f3, $5c, $e7, $e4, $fe, $41, $02, $0e, $f0, $05, $fc, $5d, $fe, $b1, $02
    db $01, $01, $0d, $f0, $05, $04, $5e, $fe, $41, $26, $01, $01, $06, $fe, $b1, $02
    db $01, $01, $06, $f0, $02, $0c, $5e, $fe, $b1, $02, $01, $01, $06, $02, $01, $01
    db $06, $fe, $41, $26, $01, $01, $06, $f0, $01, $1c, $5e, $fe, $b1, $02, $01, $01
    db $06, $fe, $81, $03, $01, $00, $06, $fe, $41, $26, $01, $ed, $01, $06, $ee, $30
    db $5e, $01, $02, $fe, $81, $03, $01, $00, $01, $03, $01, $00, $01, $03, $01, $00
    db $06, $f0, $05, $52, $5e, $fe, $41, $02, $07, $02, $07, $02, $07, $fe, $b1, $02
    db $01, $01, $06, $fe, $41, $02, $07, $02, $07, $f0, $02, $5a, $5e, $ed, $02, $07
    db $fe, $b1, $02, $01, $01, $06, $fe, $41, $02, $07, $fe, $b1, $02, $01, $01, $06
    db $02, $01, $01, $06, $fe, $41, $02, $07, $ed, $ee, $5a, $5e, $ee, $73, $5e, $ef
    db $02, $8e, $5e, $ee, $5a, $5e, $fe, $b1, $02, $01, $01, $06, $02, $01, $01, $06
    db $fe, $41, $02, $07, $fe, $b1, $02, $01, $01, $06, $02, $01, $01, $06, $02, $01
    db $01, $06, $ed, $ee, $5a, $5e, $ee, $73, $5e, $ef, $02, $b8, $5e, $ee, $5a, $5e
    db $ee, $9b, $5e, $fe, $41, $02, $07, $02, $07, $02, $07, $fe, $b1, $02, $01, $01
    db $06, $fe, $41, $02, $07, $02, $07, $ed, $fe, $41, $02, $07, $fe, $b1, $02, $01
    db $01, $06, $f0, $02, $dd, $5e, $ee, $c8, $5e, $ee, $73, $5e, $fe, $41, $02, $07
    db $02, $07, $02, $07, $ee, $7f, $5e, $f0, $03, $f1, $5e, $ee, $73, $5e, $f0, $01
    db $00, $5f, $fe, $b1, $02, $01, $01, $06, $fe, $81, $03, $01, $00, $06, $03, $01
    db $00, $06, $f0, $03, $07, $5f, $f1, $5a, $5e, $79, $04, $b0, $00, $20, $01, $50
    db $00, $69, $06, $b0, $00, $19, $01, $40, $00

    or b
    nop

    db $02, $04, $06, $03, $00, $fe, $fc, $fa, $fd, $00, $80, $30, $5f, $00, $00, $4e
    db $5f, $01, $01, $80, $5f, $02, $02, $c0, $5f, $03, $03, $25, $60, $ff, $f5, $00
    db $f6, $0a, $e7, $f3, $83, $fc, $80, $60, $fa, $84, $60, $f8, $d0, $5a, $f7, $20
    db $ec, $80, $f9, $08, $f4, $f4, $ee, $92, $5f

    ld [hl+], a
    ld b, [hl]
    db $fc
    or c
    ld e, d
    ld a, [$5ab5]
    db $ec
    ld b, b
    db $f4
    nop
    dec c
    db $10
    inc c
    db $10
    ld a, [bc]
    db $10
    ld [$f110], sp
    ld c, [hl]
    ld e, a

    db $e7, $fc, $78, $60, $fa, $7c, $60, $f8, $d0, $5a, $f7, $20, $ec, $80, $f9, $08
    db $f4, $f4, $22, $30, $22, $10, $22, $18, $24, $18, $25, $90

    inc h
    jr nc, @+$26

    db $10
    inc h
    jr @+$27

    jr @+$29

    ld d, b
    dec h
    jr nz, @+$26

    jr nz, @+$24

    jr nc, @+$24

    db $10
    ld [hl+], a
    jr @+$26

    jr @+$27

    sub b
    inc h
    ld b, b
    ld [hl+], a
    jr @+$22

    jr @-$11

    ld [hl+], a
    sub b
    pop af
    add b
    ld e, a

    db $df, $00, $00, $17, $02, $de, $b9, $50, $21, $04, $e7, $f5, $00, $f9, $05, $fc
    db $b9, $5a, $fa, $be, $5a, $fb, $e8, $5a, $f2, $10, $d9, $16, $16, $d8, $16, $d9
    db $16, $d9, $16, $16, $d8, $16, $16

    reti


    ld [de], a
    ld [de], a
    ret c

    ld [de], a
    reti


    ld [de], a
    ld [de], a
    reti


    ld [de], a
    ret c

    ld [de], a
    reti


    ld [de], a
    reti


    inc d

jr_002_5ff7:
    inc d
    ret c

    inc d
    reti


    inc d
    reti


    inc d
    inc d
    ret c

    inc d
    inc d
    db $ed
    reti


    ld de, $d811
    ld de, $11d9
    ld de, $11d8
    ret c

    ld de, $11d8
    xor $da
    ld e, a
    reti


    ld d, $16
    ret c

    ld d, $d9
    ld d, $19
    ret c

    jr jr_002_5ff7

    ld d, $d8
    inc d
    pop af
    db $da
    ld e, a

    db $e7, $e4, $fe, $41, $34, $01, $01, $0f, $01, $10, $fe, $b1, $02, $01, $01, $0f
    db $fe, $41, $34, $01, $01, $0f, $ed, $34, $01, $01, $0f, $01, $10, $fe, $b1, $02
    db $01, $01, $0f, $fe, $41, $01, $10

    db $ed
    xor $27
    ld h, b
    ld bc, $3410
    ld bc, $0f01
    cp $b1
    ld [bc], a
    ld bc, $0f01
    cp $41
    ld bc, $ee10
    daa
    ld h, b
    xor $3c
    ld h, b
    xor $27
    ld h, b
    ld bc, $fe10
    or c
    ld [bc], a
    ld bc, $0f01
    ldh a, [rSC]
    ld l, l
    ld h, b
    pop af
    daa
    ld h, b

    db $49, $06, $90, $00, $19, $01, $40, $00, $29, $04, $50, $00, $20, $00, $00, $00
    db $97, $60, $01, $01, $d3, $60, $02, $02, $14, $61, $03, $03, $7c, $61, $ff, $e7
    db $fc, $d0, $7b, $fa, $d4, $7b, $f8, $6e, $50, $f9, $0c, $f5, $04, $f7, $0c, $ec
    db $c0, $19, $06, $19, $06, $f6, $30, $ec, $80, $fc, $d8, $7b, $fa, $da, $7b, $f4
    db $0c, $ee, $f3, $60, $fc, $d0, $7b, $fa, $d4, $7b, $f9, $05, $ec, $c0, $f4, $00
    db $1c, $18, $1a, $12, $19, $06, $f6, $18, $fd, $00, $ff, $e7, $fc, $d0, $7b, $fa
    db $d4, $7b, $f8, $6e, $50, $f9, $0c, $f5, $04, $f7, $0c, $ec, $c0, $21, $06, $21
    db $06, $f6, $30, $ec, $80, $fc, $d8, $7b, $fa, $da, $7b, $f9, $03, $f2, $06, $11
    db $13, $0e, $10, $13, $15, $d3, $ed, $fc, $d0, $7b, $fa, $d4, $7b, $f9, $05, $ec
    db $c0, $24, $18, $23, $12, $21, $06, $f6, $18, $fd, $00, $ff, $df, $00, $00, $17
    db $02, $de, $b9, $50, $21, $04, $dd, $bd, $50, $23, $05, $dc, $c2, $50, $1f, $05
    db $db, $c7, $50, $1b, $05, $da, $cc, $50, $17, $05, $e7, $f5, $00, $e1, $e4, $fc
    db $b9, $5a, $fa, $be, $5a, $fb, $f8, $5a, $f8, $b9, $50, $d8, $12, $06, $d8, $12
    db $06, $f6, $06, $17, $02, $f6, $04, $17, $02, $f6, $04, $e3, $21, $04, $e1, $f6
    db $02, $17, $02, $f6, $0a, $17, $02, $f6, $0a, $f2, $06, $d7, $1f, $d7, $21, $d6
    db $1a, $d6, $1c, $d5, $13, $d5, $15, $d3, $d9, $11, $18, $d8, $13, $12, $f9, $06
    db $d8, $15, $0c, $ff, $d2, $41, $34, $01, $d1, $b1, $02, $01, $d0, $81, $03, $00
    db $e7, $e4, $cd, $06, $cd, $0c, $ce, $06, $ce, $06, $cd, $06, $ce, $0c, $ce, $0c
    db $cc, $06, $f0, $05, $98, $61, $fe, $b1, $02, $01, $fe, $63, $02, $16, $fe, $b1
    db $02, $01, $fe, $63, $02, $10, $fe, $b1, $02, $01, $fe, $63, $02, $1e, $fd, $00
    db $ff

    sub e
    ld bc, $0080
    ld b, b
    nop
    jp nz, $600c

    nop
    ld b, b
    nop
    ld e, c
    ld b, $a2
    ld b, $80
    nop
    rst $38
    ret


    ld h, c
    ld b, b
    nop
    rst $38
    adc $61

    db $00, $00, $e4, $61, $01, $01, $0f, $62, $02, $02, $38, $62, $03, $03, $5f, $62
    db $ff, $c9, $80, $e7, $fc, $72, $62, $fa, $76, $62, $f8, $6e, $50, $f7, $14, $ec
    db $c0, $f9, $14, $f5, $04, $1f, $50, $1d, $64, $f6, $14, $fc, $7c, $62, $fa, $80
    db $62, $f9, $04, $04, $07, $f0, $05, $06, $62, $f6, $1c, $ff, $e7, $fc, $72, $62
    db $fa, $76, $62, $f8, $6e, $50, $f7, $14, $ec, $c0, $f9, $14, $f5, $04, $23, $50
    db $22, $64, $f6, $14, $fc, $7c, $62, $fa, $80, $62, $f9, $04, $10, $07, $f0, $05
    db $2f, $62, $f6, $1c, $ff, $e7, $f5, $00, $e1, $fc, $b9, $5a, $fa, $be, $5a, $fb
    db $e8, $5a, $f8, $b9, $50, $f9, $0a, $10, $50, $f9, $14, $16, $78, $f9, $03, $e3
    db $21, $04, $e1, $10, $03, $f0, $05, $52, $62, $f6, $1c, $ff, $e7, $e4, $f5, $00
    db $f6, $c8, $fe, $b1, $02, $01, $01, $06, $f0, $05, $67, $62, $f6, $28

    rst $38

    db $2b, $12, $80, $00, $66, $06, $56, $06, $46, $00, $a2, $0c

    ld b, b
    nop

    db $20, $00, $00, $00, $93, $62, $01, $01, $e7, $62, $02, $02, $3b, $63, $03, $03
    db $b1, $63, $ff, $e7, $fc, $9f, $5a, $fa, $a5, $5a, $f8, $6e, $50, $f7, $0e, $ec
    db $40, $f5, $04, $f9, $0e, $1d, $2a, $1d, $0e, $1d, $15, $1d, $15, $f9, $1c, $1e
    db $7e, $f9, $0e, $1d, $2a, $1d, $0e, $1d, $15, $1d, $15, $f9, $1c, $23, $7e, $f0
    db $01, $a3, $62, $ec, $80, $f9, $05, $fc, $32, $64, $fa, $38, $64, $18, $0e, $f6
    db $0e, $f0, $03, $cd, $62, $fc, $28, $64, $fa, $2c, $64, $f8, $3a, $64, $f7, $2a
    db $f9, $1c, $18, $70, $f1, $93, $62, $e7, $fc, $9f, $5a, $fa, $a5, $5a, $f8, $6e
    db $50, $f7, $0e, $ec, $40, $f5, $04, $f9, $0e, $22, $2a, $22, $0e, $22, $15, $22
    db $15, $f9, $1c, $25, $7e, $f9, $0e, $22, $2a, $22, $0e, $22, $15, $22, $15, $f9
    db $1c, $28, $7e, $f0, $01, $f7, $62, $ec, $80, $f9, $05, $fc, $32, $64, $fa, $38
    db $64, $1d, $0e, $f6, $0e, $f0, $03, $21, $63, $fc, $28, $64, $fa, $2c, $64, $f8
    db $3a, $64, $f7, $2a, $f9, $1c, $1d, $70, $f1, $e7, $62, $df, $00, $00, $17, $02
    db $de, $b9, $50, $21, $04, $e7, $f5, $00, $fc, $b9, $5a, $fa, $be, $5a, $fb, $e8
    db $5a, $f9, $05, $f2, $0e, $d9, $16, $d9, $16, $d8, $19, $16, $d9, $16, $16, $d8
    db $19, $ed, $f2, $1c, $d9, $12, $f2, $0e, $d9, $12, $d8, $19, $d9, $12, $12, $d9
    db $12, $d8, $12, $12, $ed, $ee, $51, $63, $f2, $1c, $d9, $10, $f2, $0e, $d9, $10
    db $d8, $16, $d9, $10, $10, $d9, $10, $d8, $10, $10, $f0, $01, $51, $63, $f9, $0e
    db $d3, $d9, $11, $1c, $f0, $03, $91, $63, $f9, $05, $d9, $11, $0e, $d8, $11, $0e
    db $f0, $02, $9d, $63, $ed, $d8, $11, $07, $d8, $11, $07, $ee, $9d, $63, $f1, $51
    db $63, $e7, $e4, $fe, $43, $34, $01, $02, $0d, $fe, $41, $34, $01, $01, $0d, $fe
    db $b1, $02, $01, $01, $1b, $fe, $43, $34, $01, $02, $1b, $fe, $b1, $02, $01, $01
    db $0d, $fe, $41, $34, $01, $01, $0d, $fe, $43, $02, $0e, $fe, $41, $34, $01, $01
    db $0d, $fe, $b1, $02, $01, $01, $0d, $fe, $41, $34, $01, $01, $0d, $fe, $43, $02
    db $0e, $fe, $41, $34, $01, $01, $0d, $fe, $b1, $02, $01, $01, $1b, $f0, $03, $b3
    db $63, $fe, $41, $26, $01, $01, $1b, $f0, $03, $01, $64, $26, $01, $01, $0d, $fe
    db $b1, $02, $01, $01, $0d, $f0, $02, $11, $64, $ed, $02, $01, $01, $06, $02, $01
    db $01, $06, $ee, $11, $64, $f1, $b3, $63, $2b, $15, $90, $00, $66, $06, $56, $06
    db $46, $00, $70, $01, $81, $04, $40, $00, $30, $00, $04, $08, $06, $03, $00, $fc
    db $f8, $fa, $fd, $00, $80, $3a, $64, $00, $00, $58, $64, $01, $01, $ca, $64, $02
    db $02, $e3, $65, $03, $03, $c3, $67, $ff, $f5, $00, $f6, $0f, $f3, $81, $e7, $fc
    db $b7, $68, $fa, $b9, $68, $ee, $d1, $64, $15, $61, $fc, $af, $68, $fa, $b3, $68
    db $f3, $80, $f7, $10, $0e, $10, $17, $80, $f6, $08, $f7, $10, $10, $10, $e4, $19
    db $08, $f9, $03, $eb, $b4, $f6, $38, $f3, $81, $fc, $b7, $68, $fa, $b9, $68, $ee
    db $08, $65, $f3, $82, $fc, $c5, $68, $fa, $c7, $68, $ee, $37, $65, $ee, $53, $65
    db $ee, $64, $65, $ee, $37, $65, $ee, $53, $65, $ee, $7d, $65, $ee, $95, $65, $ee
    db $ba, $65, $ee, $37, $65, $ee, $53, $65, $ee, $37, $65, $ee, $ce, $65, $ee, $37
    db $65, $ee, $53, $65, $ee, $64, $65, $f1, $87, $64, $e7, $fc, $af, $68, $fa, $b3
    db $68, $f8, $6e, $50, $f5, $04, $ec, $80, $e4, $f2, $08, $21, $22, $1f, $21, $1d
    db $1f, $1c, $1d, $1a, $1c, $19, $1a, $d3, $e4, $f7, $1a, $ed, $15, $68, $f6, $10
    db $f7, $10, $11, $88, $f6, $10, $e4, $15, $10, $f9, $03, $eb, $b4, $f6, $24, $f8
    db $7b, $50, $fc, $4e, $50, $fa, $52, $50, $f9, $07, $ec, $80, $0e, $07, $15, $07
    db $f2, $0e, $1a, $18, $13, $16, $14, $d3, $0f, $07, $0c, $15, $0e, $07, $15, $07
    db $1a, $0e, $18, $0e, $13, $0e, $16, $07, $18, $0e, $15, $23, $f0, $01, $08, $65
    db $ed, $fc, $bb, $68, $fa, $c1, $68, $f8, $7b, $50, $ec, $40, $f7, $1c, $f9, $07
    db $1a, $0e, $1a, $07, $1a, $0e, $1a, $07, $21, $0e, $20, $15, $1c, $0e, $1c, $07
    db $1d, $0e, $ed, $1f, $15, $1d, $0e, $1d, $07, $1c, $0e, $1a, $0e, $19, $0e, $1a
    db $07, $1c, $15, $ed, $1a, $0e, $1a, $07, $1a, $0e, $1a, $07, $21, $0e, $24, $15
    db $23, $15, $1f, $0e, $21, $70, $ed, $ee, $37, $65, $ee, $53, $65, $1a, $0e, $1a
    db $07, $1a, $0e, $1a, $07, $21, $0e, $24, $0e, $23, $0e, $24, $07, $26, $0e, $21
    db $77, $ed, $fc, $bd, $68, $ec, $80, $22, $15, $1f, $15, $1b, $2a, $f2, $07, $f6
    db $1b, $1f, $22, $d3, $21, $15, $1d, $15, $1a, $46, $1f, $15, $1c, $15, $18, $0e
    db $f0, $01, $aa, $65, $19, $2a, $ed, $fc, $bb, $68, $f2, $01, $19, $1a, $1c, $1d
    db $1f, $d3, $21, $41, $ed, $ee, $31, $65, $ee, $53, $65, $ee, $31, $65, $1f, $15
    db $1d, $0e, $1d, $07, $1c, $46, $ed, $ee, $31, $65, $ee, $53, $65, $ee, $64, $65
    db $f1, $ff, $64, $df, $00, $00, $1a, $02, $de, $b9, $50, $21, $04, $dd, $bd, $50
    db $23, $05, $dc, $c2, $50, $1f, $05, $db, $c7, $50, $1b, $05, $da, $cc, $50, $17
    db $05, $e7, $f5, $00, $fc, $b9, $5a, $fa, $be, $5a, $fb, $f8, $5a, $f8, $00, $00
    db $e4, $f2, $08, $21, $22, $1f, $21, $1d, $1f, $1c, $1d, $1a, $1c, $19, $1a, $d3
    db $f9, $0d, $f3, $81, $15, $68, $14, $98, $e4, $13, $20, $f9, $24, $eb, $d8, $e4
    db $0e, $07, $15, $07, $f9, $05, $f2, $0e, $1a, $d9, $18, $13, $ed, $16, $14, $d3
    db $d9, $0f, $07, $0c, $15, $ed, $ee, $2f, $66, $d3, $16, $07, $18, $0e, $e4, $15
    db $07, $f9, $05, $d5, $15, $1c, $ee, $2f, $66, $ee, $3d, $66, $fb, $f8, $5a, $f8
    db $bd, $50, $e2, $23, $03, $23, $03, $23, $04, $e1, $d7, $1a, $0b, $e4, $f2, $07
    db $d6, $1a, $18, $d5, $18, $d5, $13, $d5, $13, $d9, $16, $d6, $18, $d4, $18, $15
    db $d8, $15, $d8, $15, $d8, $15, $d8, $15, $d3, $e4, $f2, $07, $d9, $0e, $15, $18
    db $1a, $d8, $1a, $15, $d9, $18, $d9, $1a, $d9, $10, $17, $1c, $17, $d8, $17, $16
    db $d3, $d9, $15, $0e, $ed, $f2, $07, $d9, $19, $1c, $21, $1c, $d8, $1c, $16, $d9
    db $15, $d9, $10, $d9, $0e, $d8, $0e, $d3, $d9, $13, $0e, $d8, $11, $07, $d8, $10
    db $07, $d9, $10, $0e, $ed, $f2, $07, $d9, $0e, $15, $18, $1a, $d8, $1a, $15, $d9
    db $18, $d9, $1a, $d9, $13, $1a, $1f, $1a, $d8, $1a, $17, $d3, $d9, $13, $0e, $f2
    db $07, $d9, $15, $1c, $1f, $21, $d8, $21, $1c, $d9, $1f, $d9, $20, $d9, $21, $d8
    db $21, $d8, $1c, $d9, $1c, $d8, $19, $d8, $15, $d8, $15, $d8, $15, $d3, $ed, $ef
    db $01, $89, $66, $f9, $03, $d9, $0f, $0e, $0f, $07, $e4, $d9, $0f, $07, $d8, $0f
    db $0e, $d9, $0f, $07, $d9, $0f, $07, $d9, $0f, $0e, $f2, $07, $16, $d9, $0f, $d8
    db $0f, $d8, $1b, $d9, $1b, $0f, $d3, $f9, $03, $d9, $0e, $0e, $0e, $07, $e4, $d9
    db $0e, $07, $d8, $0e, $0e, $d9, $0e, $07, $d9, $0e, $07, $d9, $0e, $0e, $f2, $07
    db $15, $d9, $0e, $d8, $0e, $d8, $1a, $d9, $1a, $15, $d3, $f9, $03, $d9, $18, $0e
    db $f2, $07, $18, $d9, $18, $d8, $18, $e4, $18, $d9, $13, $d9, $13, $f9, $03, $f2
    db $0e, $d9, $18, $f2, $07, $e4, $18, $d9, $18, $d8, $18, $d8, $18, $d3, $d9, $13
    db $0e, $d9, $15, $0e, $f2, $07, $1c, $d9, $1c, $d8, $15, $d8, $1c, $d9, $1c, $d9
    db $15, $d7, $21, $d7, $21, $d6, $1f, $d6, $1f, $d8, $1d, $d8, $1c, $d3, $d5, $1c
    db $0e, $ee, $89, $66, $ee, $a5, $66, $ee, $89, $66, $f2, $07, $d9, $19, $1c, $21
    db $1c, $d8, $1c, $19, $d9, $17, $d9, $16, $d9, $15, $d8, $15, $d9, $1c, $15, $d8
    db $1f, $d8, $21, $d3, $d9, $15, $0e, $ee, $89, $66, $ee, $a5, $66, $ee, $c5, $66
    db $f1, $2f, $66, $d2, $51, $42, $01, $d1, $b1, $02, $01, $d0, $81, $03, $00, $cf
    db $51, $42, $11, $e7, $e4, $f5, $00, $f6, $60, $f6, $68, $f6, $98, $f6, $20, $f6
    db $68, $fe, $51, $f2, $1c, $01, $01, $01, $01, $d3, $fe, $51, $01, $1c, $ce, $1c
    db $f0, $02, $ea, $67, $01, $1c, $cc, $07, $ce, $15, $f2, $1c, $01, $ce, $01, $ce
    db $d3, $cc, $03, $cc, $03, $cc, $04, $cc, $0b, $cc, $0e, $f2, $07, $cc, $cc, $cc
    db $ce, $cc, $f2, $0e, $cc, $f2, $07, $cd, $cd, $cd, $cd, $d3, $cb, $0e, $01, $07
    db $01, $07, $cd, $0e, $ce, $07, $ce, $07, $cb, $0e, $f2, $07, $01, $01, $cd, $fe
    db $51, $01, $ce, $01, $d3, $ed, $cb, $0e, $f2, $07, $01, $01, $cd, $fe, $51, $01
    db $ce, $ce, $ed, $cb, $cd, $ce, $01, $cd, $cd, $d3, $ce, $0e, $ed, $ee, $1b, $68
    db $ee, $36, $68, $ce, $cd, $cd, $ce, $cd, $cd, $cd, $cd, $d3, $ed, $ef, $01, $1b
    db $68, $cb, $0e, $01, $07, $ce, $07, $cd, $0e, $f2, $07, $ce, $ce, $ce, $01, $01
    db $ce, $cd, $cd, $ce, $01, $d3, $f0, $02, $61, $68, $ce, $0e, $f2, $07, $01, $ce
    db $cd, $cd, $ce, $ce, $cc, $cc, $cc, $cc, $cd, $cd, $d3, $cc, $0e, $ee, $1b, $68
    db $ee, $36, $68, $ee, $43, $68, $ef, $01, $8d, $68, $ee, $1b, $68, $ee, $36, $68
    db $ee, $43, $68, $ee, $1b, $68, $ee, $36, $68, $ee, $53, $68, $f1, $ea, $67, $60
    db $02, $70, $00, $10, $01, $30, $00, $20, $00, $10, $00, $69, $05, $b2, $06, $80
    db $00, $62, $04, $40, $00, $40, $00, $20, $00

    nop
    ld [de], a
    ld e, d
    sbc $ff
    rst $38
    rst $38
    rst $38
    rst $38
    db $ed
    and l
    ld hl, $0000
    nop
    nop

    db $00, $00, $ea, $68, $01, $01, $b6, $69, $02, $02, $9e, $6a, $03, $03, $85, $6c
    db $ff, $f5, $04, $e7, $f7, $0c, $ec, $80, $f3, $80, $fc, $33, $6d, $fa, $37, $6d
    db $f8, $c5, $5a, $f9, $03, $ee, $ca, $6a, $ee, $db, $6a, $f0, $01, $fe, $68, $f6
    db $0c, $f3, $82, $ec, $40, $f4, $f4, $fc, $43, $6d, $fa, $47, $6d, $f8, $c5, $5a
    db $f9, $03, $ee, $de, $69, $24, $06, $fc, $49, $6d, $fa, $4d, $6d, $f4, $00, $f9
    db $04, $ec, $80, $12, $06, $11, $06, $0f, $06, $0c, $0c, $0a, $0c, $f6, $0c, $fc
    db $43, $6d, $fa, $47, $6d, $f9, $06, $ec, $40, $ed, $f4, $f4, $ee, $02, $6a, $fc
    db $49, $6d, $fa, $4d, $6d, $f4, $00, $f9, $04, $ec, $80, $07, $0c, $0a, $0c, $0c
    db $0c, $0f, $06, $0e, $06, $0a, $0c, $0c, $0c, $07, $0c, $ed, $f6, $0c, $f3, $81
    db $ec, $40, $f4, $00, $fc, $43, $6d, $fa, $47, $6d, $ee, $de, $69, $ee, $1e, $69
    db $ee, $02, $6a, $ee, $48, $69, $f3, $80, $ee, $3c, $6a, $f4, $00, $ec, $80, $1d
    db $0c, $f6, $0c, $f0, $02, $88, $69, $1d, $0c, $1d, $18, $1d, $0c, $f0, $06, $94
    db $69, $fc, $51, $6d, $fa, $61, $6d, $f7, $60, $e4, $1f, $60, $f9, $0c, $eb, $60
    db $f5, $07, $f6, $60, $f5, $00, $f6, $60, $f5, $04, $f1, $08, $69, $f5, $04, $e7
    db $f7, $0c, $ec, $40, $fc, $33, $6d, $fa, $37, $6d, $f8, $d0, $5a, $f9, $03, $f4
    db $0c, $ee, $ca, $6a, $ee, $db, $6a, $f0, $01, $ca, $69, $f4, $f4, $ec, $40, $fc
    db $3b, $6d, $fa, $3f, $6d, $f9, $06, $f7, $0c, $f8, $d0, $5a, $24, $30, $1f, $12
    db $24, $12, $2b, $0c, $2a, $24, $26, $3c, $29, $12, $25, $12, $20, $18, $20, $0c
    db $25, $0c, $29, $0c, $28, $24, $ed, $24, $3c, $24, $30, $1f, $12, $24, $12, $2b
    db $0c, $2a, $24, $2d, $3c, $2c, $12, $2b, $12, $29, $0c, $29, $12, $27, $12, $25
    db $0c, $ed, $24, $48, $f2, $02, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d
    db $2e, $2f, $d3, $f4, $00, $ee, $de, $69, $24, $3c, $ee, $02, $6a, $24, $60, $f4
    db $0c, $ec, $40, $f9, $05, $f7, $0c, $fc, $33, $6d, $fa, $37, $6d, $f8, $65, $6d
    db $f2, $0c, $0c, $12, $11, $0f, $f2, $06, $11, $0f, $f2, $0c, $0c, $0a, $0b, $0c
    db $12, $11, $0f, $d3, $11, $06, $12, $06, $f9, $06, $f7, $06, $13, $24, $f0, $01
    db $3c, $6a, $ed, $f4, $00, $ec, $80, $22, $0c, $f6, $0c, $f0, $02, $70, $6a, $22
    db $0c, $22, $18, $22, $0c, $f0, $06, $7c, $6a, $fc, $51, $6d, $fa, $61, $6d, $f7
    db $60, $e4, $24, $60, $f9, $0c, $eb, $60, $f5, $07, $f6, $60, $f5, $00, $f6, $60
    db $f5, $04, $f1, $d4, $69, $df, $00, $00, $1a, $02, $de, $b9, $50, $21, $04, $dd
    db $bd, $50, $23, $05, $dc, $c2, $50, $1f, $05, $db, $c7, $50, $1b, $05, $da, $cc
    db $50, $17, $05, $e7, $f5, $00, $fc, $b9, $5a, $fa, $be, $5a, $fb, $f8, $5a, $f9
    db $03, $0c, $0c, $f2, $06, $0c, $0c, $07, $07, $d3, $0d, $18, $f2, $0c, $14, $11
    db $0d, $ed, $0c, $f2, $06, $0c, $0c, $07, $07, $d3, $0a, $18, $05, $0c, $08, $0c
    db $07, $0c, $ed, $ee, $ca, $6a, $e4, $d3, $d7, $0c, $04, $f0, $02, $f1, $6a, $f2
    db $06, $d7, $0c, $d7, $0c, $d6, $07, $d6, $07, $d6, $0d, $d6, $0d, $d7, $0d, $d7
    db $0d, $d6, $14, $d6, $14, $d6, $11, $d6, $11, $d5, $0d, $d5, $0d, $d3, $e4, $d9
    db $0c, $06, $13, $06, $f9, $06, $0c, $0c, $f2, $06, $e4, $d8, $13, $f9, $06, $d8
    db $13, $e4, $d9, $0c, $13, $d9, $13, $0c, $d3, $f9, $06, $13, $0c, $f9, $03, $d8
    db $0c, $06, $0c, $06, $f9, $06, $d9, $13, $0c, $e4, $d9, $0c, $06, $15, $06, $f9
    db $06, $0c, $0c, $f2, $06, $e4, $d8, $15, $f9, $06, $d8, $15, $e4, $d9, $0c, $15
    db $d9, $15, $0c, $d3, $f9, $06, $15, $0c, $f9, $03, $d8, $0c, $06, $0c, $06, $f9
    db $06, $d9, $15, $0c, $e4, $d9, $0c, $06, $14, $06, $f9, $06, $0c, $0c, $f2, $06
    db $e4, $d8, $14, $f9, $06, $d8, $14, $e4, $d9, $0c, $14, $d9, $14, $0c, $d3, $f9
    db $06, $14, $0c, $f9, $03, $d8, $0c, $06, $0c, $06, $f9, $06, $d9, $14, $0c, $ed
    db $e4, $d9, $0c, $06, $13, $06, $f9, $06, $0c, $0c, $f2, $06, $e4, $d8, $13, $f9
    db $06, $d8, $13, $e4, $d9, $0c, $13, $f2, $04, $d7, $13, $d7, $13, $d7, $12, $f2
    db $06, $d6, $11, $d6, $0f, $d6, $0c, $d6, $0c, $d4, $0a, $d4, $0a, $d3, $ed, $ee
    db $17, $6b, $f9, $05, $d9, $0c, $0c, $e4, $d9, $07, $0c, $d8, $0a, $06, $d8, $0a
    db $06, $d9, $0c, $0c, $f2, $04, $d7, $0f, $d7, $0f, $d7, $0e, $f2, $06, $d6, $0a
    db $d6, $0a, $d6, $0c, $d6, $0c, $d4, $07, $d4, $07, $d3, $ed, $ee, $17, $6b, $ee
    db $99, $6b, $ee, $17, $6b, $ee, $99, $6b, $f2, $0c, $d8, $0c, $d9, $12, $d8, $11
    db $d9, $10, $f2, $06, $d8, $11, $d8, $10, $f2, $0c, $d9, $0c, $d8, $0a, $d9, $0b
    db $d8, $0c, $d9, $12, $d8, $11, $d9, $10, $f2, $00, $d8, $11, $06, $d8, $12, $06
    db $d9, $13, $0c, $ed, $d8, $13, $0c, $d9, $13, $0c, $ee, $01, $6c, $d8, $13, $06
    db $f0, $03, $36, $6c, $f9, $0c, $d8, $07, $18, $f0, $02, $3f, $6c, $d8, $07, $0c
    db $f9, $03, $d8, $07, $18, $d8, $07, $0c, $f0, $06, $4e, $6c, $d9, $0c, $0c, $f2
    db $06, $0c, $0c, $d8, $07, $d9, $07, $d3, $ed, $d9, $0d, $18, $d9, $14, $0c, $d8
    db $11, $0c, $0d, $0c, $ed, $ee, $55, $6c, $d9, $0a, $18, $d9, $05, $0c, $d8, $08
    db $0c, $07, $0c, $ee, $55, $6c, $ee, $62, $6c, $f1, $ef, $6a, $d2, $41, $42, $00
    db $d1, $b1, $02, $01, $d0, $81, $03, $00, $cf, $43, $42, $02, $e7, $e4, $fe, $43
    db $02, $18, $f0, $0b, $99, $6c, $cc, $04, $cc, $04, $cc, $04, $cc, $06, $f0, $0d
    db $a5, $6c, $cb, $18, $cd, $06, $cd, $06, $ce, $0c, $cb, $18, $cd, $0c, $ce, $0c
    db $f0, $02, $ab, $6c, $cb, $0c, $ce, $0c, $cd, $06, $cd, $06, $ce, $0c, $cc, $04
    db $cc, $04, $cc, $04, $cc, $06, $f0, $05, $cd, $6c, $ef, $01, $ab, $6c, $ed, $ee
    db $ab, $6c, $f2, $0c, $cd, $ce, $cd, $ce, $f2, $06, $cd, $cd, $f2, $0c, $ce, $cd
    db $ce, $f0, $02, $db, $6c, $cd, $ce, $cd, $ce, $d3, $cd, $06, $cd, $06, $ce, $0c
    db $f2, $06, $cd, $cd, $cd, $cd, $d3, $cd, $18, $cd, $18, $cd, $18, $cd, $0c, $cd
    db $18, $cd, $0c, $f0, $06, $0a, $6d, $fe, $b1, $02, $02, $fe, $a3, $02, $16, $cd
    db $06, $ce, $06, $ce, $0c, $fe, $43, $02, $0c, $ce, $0c, $cd, $18, $ed, $cb, $18
    db $ee, $18, $6d, $f0, $01, $27, $6d, $f1, $9f, $6c, $59, $02, $70, $00, $10, $01
    db $30, $00, $c2, $06, $90, $00, $10, $01, $40, $00, $62, $04, $40, $00, $20, $00
    db $e2, $08, $a0, $00, $10, $01, $50, $00, $59, $02, $70, $2e, $76, $1c, $30, $1c
    db $3c, $20, $a0, $00

    and b
    nop
    and b
    nop

    db $0a, $04, $20, $00, $06, $0c, $06, $00, $fa, $f4, $fa, $00, $80, $65, $6d, $00
    db $00, $81, $6d, $01, $01, $74, $6e, $02, $02, $35, $6f, $03, $03, $74, $70, $ff
    db $f8, $00, $00, $f9, $00, $f3, $81, $f5, $00, $f6, $14, $fe, $20, $ee, $7f, $6e
    db $1e, $08, $fc, $f2, $70, $fa, $f6, $70, $f8, $6e, $50, $f9, $1c, $f3, $80, $ec
    db $80, $19, $54, $12, $1c, $13, $1c, $15, $1c, $17, $e0, $15, $38, $1c, $38, $1a
    db $1c, $f9, $1a, $19, $54, $fc, $48, $50, $fa, $4c, $50, $f9, $38, $17, $e0, $19
    db $e0, $1a, $e0, $fc, $f8, $70, $fa, $f6, $70, $2f, $e0, $f5, $00, $ee, $bc, $6e
    db $fc, $fc, $70, $fa, $00, $71, $f8, $7b, $50, $f5, $04, $f9, $07, $1e, $15, $1e
    db $07, $f6, $0e, $1e, $07, $f6, $07, $21, $15, $21, $15, $ed, $f9, $1c, $1e, $70
    db $f6, $0e, $f9, $07, $1f, $15, $1f, $07, $f6, $0e, $1f, $07, $f6, $07, $1f, $15
    db $1f, $15, $f9, $1c, $1f, $70, $f6, $0e, $f0, $01, $f3, $6d, $ee, $dc, $6d, $1e
    db $1c, $f6, $0f, $fc, $0e, $71, $fa, $12, $71, $f9, $05, $f3, $82, $ee, $fc, $6e
    db $f6, $05, $ee, $0e, $6f, $ee, $19, $6f, $25, $08, $fc, $fc, $70, $fa, $00, $71
    db $f9, $07, $19, $0e, $1e, $0e, $1c, $0e, $1a, $07, $19, $07, $15, $0e, $17, $0e
    db $12, $0e, $f6, $14, $fc, $0e, $71, $fa, $12, $71, $f9, $05, $ee, $0e, $6f, $ee
    db $27, $6f, $2d, $08, $fc, $fc, $70, $fa, $00, $71, $f9, $07, $f3, $80, $21, $0e
    db $1f, $0e, $1e, $0e, $1c, $07, $1a, $07, $19, $0e, $15, $0e, $12, $0e, $f5, $07
    db $f1, $ce, $6d, $fc, $ea, $70, $fa, $f0, $70, $f8, $6e, $50, $f9, $1c, $f5, $04
    db $e7, $f7, $38, $ec, $80, $f4, $f4, $23, $70, $26, $70, $25, $1c, $ed, $1e, $fc
    db $f9, $0d, $23, $38, $2a, $38, $28, $1c, $26, $1c, $25, $1c, $f9, $1c, $21, $e0
    db $f9, $38, $1e, $1c, $1f, $1c, $26, $a8, $20, $1c, $21, $1c, $28, $a8, $21, $1c
    db $23, $1c, $e4, $2a, $8c, $f9, $38, $eb, $e0, $f5, $00, $fe, $26, $e4, $ec, $00
    db $17, $0e, $17, $07, $17, $07, $f0, $07, $c1, $6e, $ec, $80, $ed, $fc, $fc, $70
    db $fa, $00, $71, $f8, $7b, $50, $f5, $04, $f9, $07, $23, $15, $23, $07, $f6, $0e
    db $23, $07, $f6, $07, $26, $15, $26, $15, $ed, $f9, $1c, $23, $7e, $f0, $02, $d9
    db $6e, $ee, $d9, $6e, $f9, $07, $23, $1c, $fc, $04, $71, $1e, $0e, $21, $0e, $23
    db $0e, $26, $07, $25, $07, $21, $0e, $23, $1c, $ed, $fc, $08, $71, $2a, $2a, $2a
    db $0e, $23, $15, $2a, $15, $26, $7e, $ed, $28, $2a, $28, $0e, $26, $15, $28, $15
    db $ed, $25, $7e, $ee, $0e, $6f, $28, $2a, $28, $0e, $2a, $15, $2b, $15, $ed, $2d
    db $7e, $f1, $bc, $6e, $df, $00, $00, $17, $02, $de, $b9, $50, $21, $04, $e7, $f5
    db $00, $fc, $b9, $5a, $fa, $be, $5a, $fb, $e8, $5a, $f8, $6e, $50, $f7, $38, $f6
    db $e0, $f6, $38, $15, $a8, $f2, $e0, $13, $15, $1c, $1e, $1f, $f9, $38, $eb, $d3
    db $f9, $03, $d9, $17, $0e, $17, $07, $17, $07, $d8, $17, $0e, $17, $07, $17, $07
    db $ed, $f0, $02, $61, $6f, $e4, $d9, $17, $07, $d9, $17, $07, $f9, $03, $d9, $17
    db $07, $17, $07, $d8, $17, $0e, $17, $07, $17, $07, $ed, $ef, $01, $61, $6f, $f9
    db $03, $d9, $13, $0e, $13, $07, $13, $07, $d8, $13, $0e, $13, $07, $13, $07, $ed
    db $f0, $02, $90, $6f, $e4, $d9, $13, $07, $d9, $13, $07, $f9, $03, $d9, $13, $07
    db $13, $07, $d8, $13, $0e, $13, $07, $13, $07, $ed, $f9, $03, $d9, $15, $0e, $15
    db $07, $15, $07, $d8, $15, $0e, $15, $07, $15, $07, $ed, $f0, $02, $bb, $6f, $e4
    db $d9, $15, $07, $d9, $15, $07, $f9, $03, $d9, $15, $07, $15, $07, $d8, $15, $0e
    db $15, $07, $15, $07, $ed, $ee, $61, $6f, $f0, $01, $e6, $6f, $e4, $d9, $17, $0e
    db $d9, $12, $0e, $d8, $15, $07, $d8, $15, $07, $d9, $17, $0e, $d8, $1a, $07, $d8
    db $19, $07, $d9, $15, $07, $d9, $15, $07, $d8, $13, $0e, $d8, $13, $0e, $ee, $61
    db $6f, $ee, $76, $6f, $ee, $90, $6f, $ee, $a5, $6f, $ee, $bb, $6f, $ee, $d0, $6f
    db $e4, $d9, $12, $0e, $d9, $19, $0e, $d8, $1e, $0e, $d9, $1c, $07, $d9, $1c, $07
    db $d8, $1a, $07, $d8, $19, $07, $d9, $15, $0e, $d8, $17, $0e, $d8, $12, $0e, $ee
    db $61, $6f, $ee, $76, $6f, $ee, $90, $6f, $ee, $a5, $6f, $ee, $bb, $6f, $ee, $d0
    db $6f, $e4, $d9, $12, $0e, $d9, $21, $0e, $d8, $1f, $0e, $d9, $1e, $07, $d9, $1e
    db $07, $d8, $1c, $07, $d8, $1a, $07, $d9, $19, $0e, $d8, $15, $0e, $d8, $12, $0e
    db $f1, $61, $6f, $d2, $41, $42, $01, $d1, $b1, $02, $01, $cf, $43, $42, $02, $e7
    db $e4, $f5, $00, $f6, $e0, $f0, $07, $84, $70, $f2, $1c, $cb, $cd, $cb, $cd, $cb
    db $cd, $d3, $cb, $07, $ce, $07, $ce, $0e, $cd, $1c, $ed, $f0, $03, $8a, $70, $f2
    db $1c, $cb, $cd, $cb, $cd, $d3, $cb, $0e, $ce, $0e, $cd, $07, $cd, $07, $ce, $0e
    db $cd, $07, $cd, $07, $ce, $07, $ce, $07, $cd, $0e, $cd, $0e, $f2, $1c, $ee, $90
    db $70, $f0, $02, $bd, $70, $cb, $0e, $ce, $0e, $cd, $0e, $ce, $07, $ce, $07, $cd
    db $07, $cd, $07, $ce, $0e, $cd, $0e, $cd, $0e, $ed, $f2, $1c, $ee, $90, $70, $f0
    db $02, $db, $70, $ee, $c6, $70, $f1, $8a, $70, $4b, $12, $90, $00, $90, $00, $86
    db $00, $2b, $0f, $60, $00, $56, $00, $1c, $18, $60, $00, $92, $08, $50, $00, $10
    db $01, $30, $00, $b2, $08, $70, $00, $f1, $08, $7a, $02, $50, $00, $62, $04, $40
    db $00, $10, $00, $00, $00, $25, $71, $01, $01, $f3, $71, $02, $02, $61, $73, $03
    db $03, $8c, $75, $ff, $f5, $06, $e7, $f7, $18, $ec, $80, $fc, $af, $68, $fa, $b3
    db $68, $f8, $6e, $50, $f9, $04, $22, $30, $22, $78, $f6, $18, $22, $30, $20, $78
    db $f6, $18, $22, $30, $22, $90, $fc, $9f, $76, $26, $78, $fc, $a3, $76, $26, $90
    db $f6, $30, $f5, $00, $f6, $14, $f3, $82, $fe, $30, $ee, $27, $72, $ee, $3f, $72
    db $ee, $34, $72, $ee, $4d, $72, $ef, $01, $5b, $71, $f6, $80, $f5, $00, $f6, $80
    db $f5, $01, $fe, $40, $e4, $ee, $90, $72, $22, $44, $fc, $ad, $76, $ec, $80, $f9
    db $04, $18, $10, $16, $08, $15, $18, $f6, $14, $fe, $40, $e4, $ed, $ee, $90, $72
    db $22, $58, $fe, $30, $ee, $b2, $72, $ee, $c8, $72, $ee, $bd, $72, $ee, $d6, $72
    db $ee, $bd, $72, $ee, $c8, $72, $ee, $bd, $72, $ee, $e8, $72, $fe, $40, $ee, $fb
    db $72, $2d, $44, $ee, $7b, $71, $ee, $0e, $73, $2b, $3c, $fc, $ad, $76, $ec, $80
    db $f9, $04, $f2, $08, $1a, $1d, $1f, $22, $21, $1f, $1d, $d3, $f6, $14, $fe, $30
    db $e4, $f3, $81, $ee, $26, $73, $eb, $14, $fc, $ad, $76, $f4, $f4, $ec, $80, $f9
    db $04, $f2, $08, $1a, $18, $1a, $16, $18, $15, $16, $d3, $f6, $14, $f5, $00, $f1
    db $6b, $71, $f5, $06, $e7, $f7, $18, $ec, $80, $fc, $af, $68, $fa, $b3, $68, $f8
    db $6e, $50, $f9, $04, $26, $30, $27, $78, $f6, $18, $26, $30, $25, $78, $f6, $18
    db $26, $30, $27, $90, $fc, $9f, $76, $29, $78, $fc, $a3, $76, $2a, $90, $f6, $30
    db $fc, $bd, $68, $fa, $c1, $68, $f5, $04, $f7, $20, $ec, $80, $f9, $07, $f4, $f4
    db $f8, $7b, $50, $13, $10, $1a, $08, $1f, $10, $1a, $08, $13, $10, $ed, $1d, $10
    db $1c, $10, $18, $08, $1a, $10, $13, $08, $ed, $ee, $34, $72, $f2, $08, $18, $13
    db $1a, $13, $16, $d3, $18, $18, $ed, $ee, $34, $72, $ee, $3f, $72, $ee, $34, $72
    db $ee, $4d, $72, $f9, $05, $ec, $40, $fc, $a7, $76, $fa, $ab, $76, $13, $10, $16
    db $10, $13, $08, $18, $10, $13, $08, $16, $10, $13, $08, $18, $10, $13, $08, $16
    db $10, $f0, $01, $64, $72, $fc, $bb, $68, $fa, $c1, $68, $f5, $04, $f9, $08, $ec
    db $40, $26, $60, $1f, $08, $26, $10, $25, $88, $24, $60, $21, $08, $24, $10, $ed
    db $22, $88, $ee, $90, $72, $22, $48, $f6, $10, $fc, $bd, $68, $fa, $c1, $68, $f9
    db $08, $ec, $80, $f2, $08, $1a, $1d, $1f, $22, $24, $26, $d3, $1f, $10, $22, $10
    db $1f, $08, $24, $10, $1f, $08, $ed, $22, $10, $1f, $08, $24, $10, $1f, $08, $22
    db $10, $ed, $ee, $bd, $72, $25, $10, $24, $10, $22, $08, $24, $18, $ed, $ee, $bd
    db $72, $ee, $c8, $72, $ee, $bd, $72, $1d, $10, $1a, $10, $1d, $08, $1e, $18, $ed
    db $fc, $bb, $68, $fa, $c1, $68, $f5, $04, $f9, $08, $ec, $40, $32, $60, $2b, $08
    db $32, $10, $31, $88, $30, $60, $2e, $08, $30, $10, $ed, $2d, $88, $32, $60, $2b
    db $08, $32, $10, $31, $88, $30, $60, $2e, $08, $2d, $10, $ed, $2b, $88, $fc, $af
    db $68, $fa, $b3, $68, $e4, $f2, $08, $2b, $32, $2d, $32, $2e, $32, $30, $32, $2e
    db $32, $2d, $32, $2b, $32, $29, $32, $f0, $02, $26, $73, $d3, $f4, $e8, $37, $20
    db $ed, $eb, $20, $fe, $50, $f2, $03, $37, $36, $35, $34, $33, $32, $31, $30, $2f
    db $2e, $f2, $02, $2d, $ed, $fe, $20, $ee, $46, $73, $d3, $f4, $f4, $f1, $64, $72
    db $df, $00, $00, $17, $02, $de, $b9, $50, $21, $04, $dd, $bd, $50, $23, $05, $dc
    db $c2, $50, $1f, $05, $db, $c7, $50, $1b, $05, $da, $cc, $50, $17, $05, $e7, $f5
    db $00, $fc, $b9, $5a, $fa, $be, $5a, $fb, $f8, $5a, $f9, $0c, $1f, $30, $f9, $18
    db $1b, $90, $f9, $0c, $1f, $30, $f9, $18, $19, $90, $f9, $0c, $1f, $30, $1b, $90
    db $16, $78, $0e, $c0, $e4, $d9, $13, $80, $d9, $0f, $80, $d9, $11, $80, $d9, $13
    db $40, $f2, $08, $d8, $13, $d8, $13, $d9, $13, $d8, $13, $f0, $04, $ba, $73, $d3
    db $d9, $13, $10, $d8, $16, $10, $f2, $08, $d9, $13, $d9, $18, $d8, $18, $13, $d9
    db $16, $d9, $16, $d8, $13, $d3, $d9, $18, $10, $d9, $13, $08, $d8, $16, $10, $ed
    db $d9, $13, $10, $d8, $16, $10, $f2, $08, $d9, $13, $d9, $18, $d8, $18, $d9, $13
    db $d8, $16, $d9, $16, $d9, $13, $d8, $18, $d9, $18, $d9, $13, $d3, $d8, $16, $10
    db $ee, $c0, $73, $d9, $0f, $10, $d8, $16, $10, $f2, $08, $d9, $0f, $d9, $13, $d8
    db $16, $0f, $d9, $16, $d9, $16, $d8, $0f, $d3, $d9, $13, $10, $d9, $0f, $08, $d8
    db $13, $10, $ed, $d9, $0e, $10, $d8, $15, $10, $f2, $08, $d9, $0e, $d9, $12, $d8
    db $12, $0e, $d9, $15, $d9, $15, $d8, $0e, $d3, $d9, $12, $10, $d9, $0e, $08, $d8
    db $15, $10, $ed, $d9, $13, $10, $d8, $16, $10, $f2, $08, $d9, $13, $d9, $18, $d8
    db $18, $d9, $13, $d8, $13, $d8, $13, $d9, $18, $d8, $18, $d9, $16, $d9, $15, $d3
    db $d8, $15, $10, $ee, $c0, $73, $ee, $04, $74, $ee, $24, $74, $df, $00, $00, $1a
    db $02, $d9, $13, $10, $d8, $16, $10, $f2, $08, $d9, $13, $d9, $18, $d8, $18, $d9
    db $13, $d7, $16, $d9, $16, $d9, $0e, $d6, $11, $d9, $13, $d9, $16, $d5, $18, $d9
    db $1a, $d3, $d9, $13, $10, $16, $10, $13, $08, $18, $10, $13, $08, $ed, $d9, $16
    db $10, $13, $08, $18, $10, $13, $08, $16, $10, $ed, $ee, $93, $74, $d9, $19, $10
    db $18, $10, $16, $08, $18, $18, $ee, $93, $74, $ee, $9f, $74, $f2, $08, $d7, $13
    db $d9, $13, $d9, $16, $d6, $16, $d9, $13, $d9, $18, $d5, $18, $d9, $13, $d9, $11
    db $d8, $11, $d8, $0e, $d9, $0e, $d8, $11, $d8, $12, $d8, $12, $d8, $12, $d3, $df
    db $00, $00, $17, $02, $ee, $c0, $73, $ee, $04, $74, $d9, $11, $10, $d8, $18, $10
    db $f2, $08, $d9, $11, $d9, $15, $d8, $15, $11, $d9, $18, $d9, $18, $d8, $11, $d3
    db $d9, $15, $10, $d9, $11, $08, $d8, $18, $10, $ed, $d9, $0e, $10, $d8, $15, $10
    db $f2, $08, $d9, $0e, $d9, $12, $d8, $12, $d9, $0e, $d8, $0e, $d8, $0e, $d9, $18
    db $d8, $18, $d9, $16, $d9, $15, $d3, $d8, $15, $10, $ee, $c0, $73, $ee, $04, $74
    db $ee, $24, $74, $d9, $13, $10, $d8, $16, $10, $f2, $08, $d9, $13, $d9, $18, $d8
    db $18, $d9, $13, $df, $00, $00, $1a, $02, $d7, $13, $d9, $0e, $d9, $11, $d6, $13
    db $d9, $16, $d9, $15, $d5, $13, $d9, $11, $d3, $d9, $13, $60, $f2, $08, $d8, $13
    db $d8, $13, $d5, $13, $d4, $13, $d3, $d9, $0f, $80, $d9, $11, $80, $d9, $13, $40
    db $f2, $08, $d8, $13, $d8, $1a, $d9, $18, $d8, $1a, $d8, $16, $d8, $18, $d8, $15
    db $d8, $16, $d3, $df, $00, $00, $17, $02, $f1, $c0, $73, $d2, $41, $42, $01, $d1
    db $b1, $02, $01, $d0, $81, $03, $00, $cf, $41, $42, $03, $e7, $e4, $f5, $00, $f6
    db $c0, $f0, $03, $9e, $75, $f6, $78, $f2, $08, $cb, $01, $01, $01, $03, $01, $01
    db $01, $f0, $02, $ae, $75, $ef, $02, $aa, $75, $cb, $01, $01, $01, $03, $01, $01
    db $01, $cd, $cd, $ce, $cd, $cd, $cd, $cd, $cd, $cb, $01, $cd, $fe, $41, $01, $cb
    db $ce, $cd, $fe, $41, $01, $cb, $ce, $cd, $ce, $03, $ce, $cd, $fe, $41, $01, $ed
    db $cb, $01, $cd, $fe, $41, $01, $cb, $ce, $cd, $ce, $cd, $ce, $ce, $cd, $cb, $ce
    db $cd, $fe, $41, $01, $ee, $ca, $75, $f0, $02, $f5, $75, $cb, $01, $cd, $fe, $41
    db $01, $cb, $ce, $cd, $ce, $cd, $cd, $ce, $cd, $ce, $cd, $d3, $ce, $10, $f2, $08
    db $ed, $ee, $ca, $75, $f0, $02, $12, $76, $cb, $01, $cd, $fe, $41, $01, $cb, $ce
    db $cd, $ce, $cc, $ce, $ce, $cc, $cb, $ce, $cc, $ce, $ed, $cf, $61, $42, $03, $cb
    db $01, $01, $01, $01, $01, $01, $01, $f0, $05, $30, $76, $cf, $41, $42, $03, $cc
    db $ce, $ce, $cc, $cb, $ce, $cc, $ce, $cb, $cd, $cd, $ce, $cd, $cd, $cd, $cd, $ee
    db $ca, $75, $f0, $02, $50, $76, $ee, $fc, $75, $ee, $ca, $75, $f0, $02, $5a, $76
    db $ee, $19, $76, $d2, $61, $42, $01, $ce, $01, $03, $01, $01, $01, $03, $01, $01
    db $01, $03, $01, $cd, $cd, $cc, $cc, $ce, $01, $03, $01, $01, $01, $03, $01, $f0
    db $02, $7c, $76, $ef, $01, $78, $76, $ce, $01, $03, $01, $01, $01, $03, $01, $cd
    db $cd, $ce, $cd, $cd, $cd, $cd, $cd, $d2, $41, $42, $01, $f1, $ca, $75, $2e, $12
    db $50, $00, $3e, $1e, $90, $00, $60, $01, $50, $00, $30, $00, $91, $02, $70, $00
    db $00, $00, $c2, $76, $01, $01, $63, $77, $02, $02, $34, $78, $03, $03, $b6, $7a
    db $ff, $f5, $00, $f6, $0a, $fe, $50, $f3, $81, $ee, $65, $77, $2b, $03, $fe, $60
    db $2b, $8d, $ea, $fe, $67, $2b, $26, $e9, $fc, $d0, $7b, $fa, $d4, $7b, $f8, $6e
    db $50, $f9, $0c, $ec, $40, $22, $54, $22, $06, $24, $06, $26, $60, $24, $42, $1f
    db $12, $1c, $0c, $22, $60, $22, $54, $22, $06, $24, $06, $26, $42, $28, $12, $29
    db $0c, $28, $c0, $1a, $60, $18, $42, $1a, $12, $1c, $0c, $16, $c0, $f0, $01, $04
    db $77, $1f, $60, $1d, $42, $18, $12, $16, $a2, $f6, $04, $fe, $64, $e4, $ee, $ce
    db $77, $fc, $d0, $7b, $f9, $0c, $d3, $1f, $54, $1d, $4e, $18, $12, $16, $48, $f9
    db $03, $16, $06, $f0, $05, $32, $77, $f5, $07, $f6, $0c, $ec, $80, $fc, $d8, $7b
    db $fa, $da, $7b, $f4, $0c, $ee, $06, $78, $f4, $00, $fc, $d0, $7b, $fa, $d4, $7b
    db $f9, $0c, $ec, $00, $f2, $60, $13, $16, $15, $18, $16, $1a, $d3, $18, $c0, $f1
    db $d9, $76, $fe, $a0, $f9, $00, $f5, $04, $e7, $f7, $18, $ec, $40, $f8, $6e, $50
    db $f2, $02, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $d3, $ed
    db $2b, $03, $fe, $b0, $2b, $8d, $ea, $fe, $b7, $2b, $30, $e9, $fc, $d0, $7b, $fa
    db $d4, $7b, $f8, $6e, $50, $f9, $0c, $ec, $40, $26, $54, $26, $06, $28, $06, $29
    db $60, $28, $42, $24, $12, $1f, $0c, $27, $60, $26, $54, $26, $06, $28, $06, $29
    db $42, $2b, $12, $2d, $0c, $2b, $c0, $1d, $60, $1c, $42, $1d, $12, $1f, $0c, $1a
    db $c0, $f0, $01, $b8, $77, $22, $60, $21, $42, $1d, $12, $1f, $a2, $f9, $00, $13
    db $06, $15, $06, $16, $06, $f2, $04, $18, $1a, $1c, $1d, $1f, $ed, $21, $d3, $f9
    db $0c, $22, $3c, $f9, $06, $24, $0c, $22, $0c, $f9, $0c, $21, $4e, $1d, $12, $1f
    db $48, $f9, $03, $1f, $06, $f0, $05, $f4, $77, $f5, $07, $f6, $0c, $ec, $80, $fc
    db $d8, $7b, $fa, $da, $7b, $f9, $03, $f5, $07, $f2, $06, $11, $13, $f6, $0c, $0e
    db $f6, $0a, $0c, $f6, $05, $07, $f6, $00, $02, $d3, $ed, $fc, $d0, $7b, $fa, $d4
    db $7b, $f9, $0c, $ec, $00, $f2, $60, $1a, $1d, $1c, $1f, $1d, $21, $d3, $1f, $c0
    db $f1, $8d, $77, $df, $00, $00, $17, $02, $de, $b9, $50, $21, $04, $dd, $bd, $50
    db $23, $05, $dc, $c2, $50, $1f, $05, $db, $c7, $50, $1b, $05, $da, $cc, $50, $17
    db $05, $e7, $f5, $00, $fc, $b9, $5a, $fa, $be, $5a, $fb, $f8, $5a, $f9, $0c, $f6
    db $78, $f6, $30, $f8, $b9, $50, $e2, $21, $04, $e1, $f6, $02, $f0, $07, $67, $78
    db $f9, $0c, $d9, $13, $18, $e3, $21, $04, $e1, $f6, $02, $d9, $13, $06, $d9, $11
    db $0c, $ed, $f9, $0c, $d9, $13, $18, $e3, $21, $04, $e1, $f6, $08, $17, $02, $f6
    db $0a, $ed, $ee, $71, $78, $d9, $13, $12, $1f, $06, $e3, $21, $04, $e1, $f6, $02
    db $13, $06, $d9, $13, $0c, $ed, $ee, $71, $78, $ee, $83, $78, $ee, $71, $78, $f2
    db $06, $d7, $13, $d7, $1f, $d6, $13, $d6, $1f, $d5, $13, $d5, $13, $d4, $16, $d4
    db $18, $d3, $ee, $71, $78, $ee, $83, $78, $ee, $71, $78, $ee, $96, $78, $ee, $71
    db $78, $ee, $83, $78, $d7, $13, $06, $d7, $13, $06, $f8, $c2, $50, $e3, $1f, $05
    db $f6, $01, $f0, $02, $df, $78, $f2, $06, $d6, $13, $d5, $11, $d5, $11, $d6, $13
    db $d6, $13, $d5, $24, $d5, $26, $d5, $22, $d5, $24, $d4, $1f, $d4, $1f, $d3, $e1
    db $f8, $b9, $50, $e4, $d9, $13, $06, $d9, $13, $06, $f6, $0c, $e2, $21, $04, $e1
    db $f6, $08, $d9, $13, $06, $d9, $13, $06, $ed, $17, $02, $f6, $04, $d8, $1f, $06
    db $d9, $13, $0c, $e2, $21, $04, $e1, $f6, $08, $d9, $13, $0c, $ed, $e4, $d9, $13
    db $06, $d9, $13, $06, $f6, $0c, $e2, $21, $04, $e1, $f6, $02, $13, $06, $d9, $11
    db $06, $d9, $11, $06, $d9, $13, $06, $d8, $1f, $06, $d9, $13, $06, $1f, $06, $d8
    db $13, $0c, $d9, $13, $0c, $ee, $04, $79, $ee, $1a, $79, $f2, $06, $d7, $13, $d7
    db $13, $f6, $d3, $f8, $c2, $50, $e2, $1f, $05, $f6, $07, $f2, $06, $e1, $d5, $13
    db $d9, $11, $d7, $11, $d7, $13, $d7, $1f, $d6, $13, $d6, $1f, $d5, $13, $d5, $13
    db $d4, $13, $d4, $13, $d3, $f8, $b9, $50, $ef, $01, $04, $79, $d9, $0f, $0c, $1b
    db $06, $0f, $06, $e2, $21, $04, $f6, $02, $e1, $d9, $0f, $06, $d9, $0f, $0c, $17
    db $02, $f6, $0a, $0f, $0c, $d8, $13, $0c, $d9, $16, $0c, $ed, $d9, $11, $0c, $1d
    db $06, $11, $06, $e2, $21, $04, $f6, $02, $e1, $d9, $11, $06, $d9, $11, $0c, $17
    db $02, $f6, $0a, $11, $0c, $d8, $15, $0c, $d9, $11, $0c, $ed, $ee, $71, $78, $f2
    db $06, $d9, $13, $1f, $13, $1f, $d3, $d8, $13, $0c, $d9, $0e, $06, $11, $06, $ee
    db $71, $78, $d9, $13, $0c, $f2, $06, $d6, $24, $d6, $26, $d5, $22, $d5, $1f, $d4
    db $1a, $d4, $1f, $d3, $ee, $8d, $79, $ee, $ad, $79, $ee, $71, $78, $f2, $06, $d9
    db $13, $1f, $13, $1f, $d3, $e2, $21, $04, $e1, $f6, $08, $d9, $13, $06, $d9, $13
    db $06, $d7, $00, $04, $d7, $00, $04, $d7, $00, $04, $f2, $06, $d7, $00, $d7, $00
    db $d6, $00, $d6, $00, $d5, $00, $d5, $00, $d9, $00, $d9, $00, $d8, $00, $d9, $00
    db $d8, $00, $d8, $00, $d8, $00, $d8, $00, $d3, $f9, $03, $d9, $13, $12, $e4, $d9
    db $13, $06, $e2, $21, $04, $e1, $f6, $08, $d9, $1d, $06, $1f, $06, $ed, $f9, $03
    db $d9, $13, $06, $e4, $d9, $13, $06, $f6, $0c, $e2, $21, $04, $e1, $f6, $08, $d9
    db $13, $0c, $ed, $f0, $02, $3a, $7a, $f9, $03, $13, $12, $e4, $13, $06, $f6, $0c
    db $1d, $06, $1f, $06, $d8, $13, $06, $d8, $13, $06, $17, $02, $f6, $04, $e2, $21
    db $04, $e1, $f6, $02, $f0, $01, $7b, $7a, $d9, $13, $06, $d9, $13, $06, $ed, $ee
    db $3a, $7a, $ee, $4f, $7a, $f0, $02, $90, $7a, $ee, $3a, $7a, $d8, $13, $06, $d8
    db $13, $06, $e2, $21, $04, $f6, $02, $f0, $03, $a3, $7a, $e1, $d9, $13, $06, $d9
    db $13, $06, $f1, $71, $78, $d2, $41, $42, $02, $d1, $b1, $02, $01, $d0, $81, $03
    db $00, $cf, $41, $42, $03, $e7, $e4, $f5, $00, $f6, $18, $fe, $41, $03, $06, $f0
    db $17, $ce, $7a, $cd, $06, $f0, $07, $d4, $7a, $fe, $b1, $02, $02, $fe, $a3, $02
    db $16, $f2, $06, $cd, $ce, $ce, $02, $ce, $02, $02, $02, $cd, $fe, $41, $02, $ce
    db $02, $ed, $ce, $02, $02, $02, $cd, $ce, $ce, $02, $ce, $02, $02, $02, $cd, $fe
    db $41, $02, $ce, $02, $ed, $f0, $01, $f3, $7a, $ce, $02, $02, $02, $cd, $ce, $ce
    db $02, $cc, $f0, $07, $12, $7b, $d3, $ee, $da, $7a, $ee, $f3, $7a, $ee, $f3, $7a
    db $cc, $f0, $0f, $21, $7b, $cb, $02, $02, $02, $cd, $fe, $41, $02, $ce, $ce, $ce
    db $cd, $ce, $02, $cd, $fe, $41, $02, $ce, $02, $f0, $02, $26, $7b, $cc, $cc, $fe
    db $41, $02, $cc, $fe, $41, $02, $cc, $f0, $0a, $47, $7b, $ef, $01, $26, $7b, $cb
    db $02, $02, $02, $cd, $ce, $ce, $02, $cb, $02, $02, $02, $cd, $fe, $41, $02, $ce
    db $02, $f0, $02, $50, $7b, $ed, $cb, $02, $02, $02, $cd, $ce, $ce, $02, $cb, $02
    db $cc, $f0, $05, $71, $7b, $ee, $50, $7b, $f2, $04, $cc, $cc, $cc, $f2, $06, $cc
    db $f0, $05, $80, $7b, $ce, $ce, $cd, $ce, $cd, $cd, $cd, $cd, $cb, $02, $02, $ce
    db $cd, $fe, $41, $02, $ce, $02, $cb, $ce, $02, $02, $cd, $fe, $41, $02, $ce, $02
    db $ed, $f0, $02, $8d, $7b, $03, $02, $02, $02, $03, $02, $02, $02, $cd, $cd, $ce
    db $cd, $cb, $cd, $ce, $ce, $ee, $8d, $7b, $f0, $02, $b6, $7b, $cb, $02, $02, $ce
    db $cd, $fe, $41, $02, $ce, $02, $cd, $f0, $07, $c7, $7b, $d3, $f1, $da, $7a, $59
    db $03, $80, $00, $10, $01, $40, $00, $91, $00, $30, $00
