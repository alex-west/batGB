
section "WRAM Bank 0", wram0[$C000]

oamBuffer: ds $A0 ; $C000-C09F
; $C0A0 - oamBufferIndex

; $C0B1 ; Current Cutscene

; $C0B6, $C0B8, $C0B9 - LCD Interrupt Related


; $C0BD - Decrementing Timer (hi)
; $C0BE - (lo)
pauseFlag = $C0BE ; Pause Flag

currentLevel = $C0C2 ; Level Number
; $00: broken Gotham City 1 [cutscene 1 graphics]
; $01: Gotham City (1-1) [cutscene 1]
; $02: Chemical Factory (1-2)
; $03: Chemical Factory (1-3)
; $04: Batman vs Jack (1-4)
; $05: Gotham City (2-1) [cutscene 2]
; $06: Flugalheim Museum (2-2)
; $07: Flugalheim Museum (2-3)
; $08: Batwing Stage (3-1) [cutscene 3]
; $09: Batwing Stage (3-2)
; $0A: Gotham Cathedral (4-1)
; $0B: Gotham Cathedral (4-2)
; $0C: Batman vs Joker (4-3)
; $0D: Ending cutscene (END)
; $0E: invalid

playerLives = $C0C7 ; Lives

; $C0DE ; Score (ones, tens)
; $C0DF ; Score (hundreds, thousands)
; $C0E0 ; Score (ten housands)

; $C117 - Batman weapon type

; $C122 - Batman projectile slots (8 slots, $10 bytes each)

weaponLevel = $C1A2 ; Batman's onscreen projectile limit

;$C24E: enemy ram (5 slots 0x20 bytes each)

;$C2F3/F4: Pointer to enemy data

; $C4D9/$C4DA - Text Offset (cutscenes, credits)


; $C800 - $153 bytes - Audio RAM??

; $CB00 - VBlank Flag
vBlank_updateBufferIndex = $CB01 ; VBlank update index
vBlank_updateBuffer = $CB02 ; VBlank VRAM updates ($HI, $LO, $LEN, bytes...)

; $CBFF - Top of stack

; $CC00-$DFFF - Decompressed Level Data