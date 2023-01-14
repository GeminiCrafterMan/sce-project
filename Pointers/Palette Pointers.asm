; ===========================================================================
; Palette pointers
; ===========================================================================

PalPointers:				; palette address, RAM address, colours

; Main
ptr_Pal_Sonic:			palp	Pal_Sonic, Normal_palette_line_1, 16		; 0 - Sonic
ptr_Pal_CabaretSonic:	palp	Pal_Sonic, Normal_palette_line_3, 16		; 1 - Sonic

; Levels
ptr_Pal_DEZ:			palp	Pal_DEZ, Normal_palette_line_2, 48			; 2 - DEZ1
ptr_Pal_GHZ:			palp	Pal_GHZ, Normal_palette_line_2, 48			; 3 - GHZ
; ---------------------------------------------------------------------------

; Main
palid_Sonic:			equ (ptr_Pal_Sonic-PalPointers)/8				; 0 - Sonic
palid_CabaretSonic:		equ	(ptr_Pal_CabaretSonic-PalPointers)/8		; 1 - Cabaret Sonic

; Levels
palid_DEZ:				equ (ptr_Pal_DEZ-PalPointers)/8				; 2 - DEZ1
palid_GHZ:				equ (ptr_Pal_GHZ-PalPointers)/8				; 3 - GHZ