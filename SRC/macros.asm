; macros.asm

MACRO pushBank
    di
        ldh a, [hCurrentBank]
        push af
        ld a, \1
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
ENDM

MACRO popBank
    di
        pop af
        ld [$2000], a
        ldh [hCurrentBank], a
    ei
ENDM

; EoF