section "HRAM", HRAM[$ff80]

; HRAM


; $97 - Camera pixel
; $98 - Camera screen

; $9A - LCD Interrupt Related

; $A3 - Temp pointer (several other uses?)
; $A4

hInputPressed = $FFB4 ; Input
hInputRisingEdge = $FFB5 ; Input (rising edge)


hVBlankDoneFlag = $FFBA ; $BA - VBlank Complete Flag

; $BB - Scroll mirrors
; $BC
; $BD - Window Y mirror
; $BE - Window X mirror

; $BF-$CF - Unused?

; $D0 - Timer interrupt related

; $F0 - OAM DMA Routine

; $FA - Flag that determines if sprites are being drawn from the top or bottom of the OAM

hCurrentBank = $FFFD ; $FD - Current Bank