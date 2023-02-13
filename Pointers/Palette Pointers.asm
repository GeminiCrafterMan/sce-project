; ===========================================================================
; Palette pointers
; ===========================================================================

PalPointers:				; palette address, RAM address, colours

; Main
ptr_Pal_Sonic:			palp	Pal_Sonic, Normal_palette_line_1, 16		; 0 - Sonic
ptr_Pal_Knuckles:		palp	Pal_Knuckles, Normal_palette_line_1, 16		; 1 - Knuckles
ptr_Pal_Mighty:			palp	Pal_Mighty, Normal_palette_line_1, 16		; 2 - Mighty
ptr_Pal_Espio:			palp	Pal_Espio, Normal_palette_line_1, 16		; 3 - Espio

; Levels
ptr_Pal_DEZ:			palp	Pal_DEZ, Normal_palette_line_2, 48			; 4 - DEZ
ptr_Pal_GHZ:			palp	Pal_GHZ, Normal_palette_line_2, 48			; 5 - GHZ
ptr_Pal_SSLZ:			palp	Pal_SSLZ, Normal_palette_line_2, 48			; 6 - SSLZ
ptr_Pal_WZ:				palp	Pal_WZ, Normal_palette_line_2, 48			; 7 - WZ
; ---------------------------------------------------------------------------

; Main
palid_Sonic:			equ (ptr_Pal_Sonic-PalPointers)/8		; 0 - Sonic
palid_Knuckles:			equ (ptr_Pal_Knuckles-PalPointers)/8	; 1 - Knuckles
palid_Mighty:			equ (ptr_Pal_Mighty-PalPointers)/8		; 2 - Mighty
palid_Espio:			equ (ptr_Pal_Espio-PalPointers)/8		; 3 - Espio

; Levels
palid_DEZ:				equ (ptr_Pal_DEZ-PalPointers)/8			; 4 - DEZ
palid_GHZ:				equ (ptr_Pal_GHZ-PalPointers)/8			; 5 - GHZ
palid_SSLZ:				equ (ptr_Pal_SSLZ-PalPointers)/8		; 6 - SSLZ
palid_WZ:				equ (ptr_Pal_WZ-PalPointers)/8			; 7 - WZ