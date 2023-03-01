section "HRAM", HRAM[$ff80]

; HRAM


; $97 - Camera pixel
; $98 - Camera screen

; $9A - LCD Interrupt Related


; $B4 - Input
; $B5 - Input (rising edge)


hVBlankDoneFlag = $FFBA ; $BA - VBlank Complete Flag

; $BB - Scroll mirrors
; $BC
; $BD - Window Y mirror
; $BE - Window X mirror

; $BF-$CF - Unused?

; $D0 - Timer interrupt related

; $F0 - OAM DMA Routine