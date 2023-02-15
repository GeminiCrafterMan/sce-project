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
ptr_Pal_GHZ:			palp	Pal_GHZ, Normal_palette_line_2, 48			; 4 - GHZ
ptr_Pal_SSLZ1:			palp	Pal_SSLZ1, Normal_palette_line_2, 48		; 5 - SSLZ1
ptr_Pal_SSLZ2:			palp	Pal_SSLZ2, Normal_palette_line_2, 48		; 6 - SSLZ2
ptr_Pal_WZ:				palp	Pal_WZ, Normal_palette_line_2, 48			; 7 - WZ
ptr_Pal_DEZ:			palp	Pal_DEZ, Normal_palette_line_2, 48			; 8 - DEZ
ptr_Pal_TTZ:			palp	Pal_TTZ, Normal_palette_line_2, 48			; 9 - TTZ
; ---------------------------------------------------------------------------

; Main
palid_Sonic:			equ (ptr_Pal_Sonic-PalPointers)/8		; 0 - Sonic
palid_Knuckles:			equ (ptr_Pal_Knuckles-PalPointers)/8	; 1 - Knuckles
palid_Mighty:			equ (ptr_Pal_Mighty-PalPointers)/8		; 2 - Mighty
palid_Espio:			equ (ptr_Pal_Espio-PalPointers)/8		; 3 - Espio

; Levels
palid_GHZ:				equ (ptr_Pal_GHZ-PalPointers)/8			; 4 - GHZ
palid_SSLZ1:			equ (ptr_Pal_SSLZ1-PalPointers)/8		; 5 - SSLZ1
palid_SSLZ2:			equ (ptr_Pal_SSLZ2-PalPointers)/8		; 6 - SSLZ2
palid_WZ:				equ (ptr_Pal_WZ-PalPointers)/8			; 7 - WZ
palid_DEZ:				equ (ptr_Pal_DEZ-PalPointers)/8			; 8 - DEZ
palid_TTZ:				equ (ptr_Pal_TTZ-PalPointers)/8			; 9 - TTZ