
section "WRAM Bank 0", wram0[$C000]

oamBuffer: ds $A0 ; $C000-C09F
; $C0A0 - oamBufferIndex

; $C0B1 ; Current Cutscene

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

; $C0C7 ; Lives

; $C0DE ; Score (ones, tens)
; $C0DF ; Score (hundreds, thousands)
; $C0E0 ; Score (ten housands)



;$C24E: enemy ram (5 slots 0x20 bytes each)

;$C2F3/F4: Pointer to enemy data

; $C4D9/$C4DA - Text Offset (cutscenes, credits)

; $CB00 - VBlank Flag
; $CB01 - VBlank update index
; $CB02 - VBlank VRAM updates ($HI, $LO, $NUM, bytes...)
