section "HRAM", HRAM[$ff80]

; HRAM


hCamera_xPixel  = $FF97 ; $97 - Camera pixel
hCamera_xScreen = $FF98 ; $98 - Camera screen

hLCDInterruptMode = $FF9A ; - LCD Interrupt Related
; $00 - ??
; $03 - ??
; $04 - Disable sprites
; $40 - Spin effect
; $80 - Status bar

; $A3 - Temp pointer (several other uses?)
; $A4

; $A3-$B3 - Enemy working copy

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