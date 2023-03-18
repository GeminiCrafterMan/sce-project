; ===========================================================================
; Palette pointers
; ===========================================================================

PalPointers:				; palette address, RAM address, colours

; Main
ptr_Pal_Sonic:			palp	Pal_Sonic, Normal_palette_line_1, 16
ptr_Pal_Knuckles:		palp	Pal_Knuckles, Normal_palette_line_1, 16
ptr_Pal_Mighty:			palp	Pal_Mighty, Normal_palette_line_1, 16
ptr_Pal_Espio:			palp	Pal_Espio, Normal_palette_line_1, 16

; Levels
ptr_Pal_GHZ1:			palp	Pal_GHZ1, Normal_palette_line_2, 48
ptr_Pal_TTZ1:			palp	Pal_TTZ1, Normal_palette_line_2, 48
ptr_Pal_GHZEX:			palp	Pal_GHZEX, Normal_palette_line_2, 48
ptr_Pal_SSLZ1:			palp	Pal_SSLZ1, Normal_palette_line_2, 48
ptr_Pal_SSLZ2:			palp	Pal_SSLZ2, Normal_palette_line_2, 48
ptr_Pal_SSLZ3:			palp	Pal_SSLZ3, Normal_palette_line_2, 48
ptr_Pal_TTPZ:			palp	Pal_TTPZ, Normal_palette_line_2, 48
ptr_Pal_CCZ:			palp	Pal_CCZ, Normal_palette_line_2, 48
ptr_Pal_MMZ:			palp	Pal_MMZ, Normal_palette_line_2, 48
ptr_Pal_DEZ:			palp	Pal_DEZ, Normal_palette_line_2, 48
ptr_Pal_TTSZ:			palp	Pal_TTSZ, Normal_palette_line_2, 48
; ---------------------------------------------------------------------------

; Main
palid_Sonic:			equ (ptr_Pal_Sonic-PalPointers)/8
palid_Knuckles:			equ (ptr_Pal_Knuckles-PalPointers)/8
palid_Mighty:			equ (ptr_Pal_Mighty-PalPointers)/8
palid_Espio:			equ (ptr_Pal_Espio-PalPointers)/8

; Levels
palid_GHZ1:				equ (ptr_Pal_GHZ1-PalPointers)/8
palid_TTZ1:				equ (ptr_Pal_TTZ1-PalPointers)/8
palid_GHZEX:			equ (ptr_Pal_GHZEX-PalPointers)/8
palid_SSLZ1:			equ (ptr_Pal_SSLZ1-PalPointers)/8
palid_SSLZ2:			equ (ptr_Pal_SSLZ2-PalPointers)/8
palid_SSLZ3:			equ (ptr_Pal_SSLZ3-PalPointers)/8
palid_TTPZ:				equ (ptr_Pal_TTPZ-PalPointers)/8
palid_CCZ:				equ (ptr_Pal_CCZ-PalPointers)/8
palid_MMZ:				equ (ptr_Pal_MMZ-PalPointers)/8
palid_DEZ:				equ (ptr_Pal_DEZ-PalPointers)/8
palid_TTSZ:				equ (ptr_Pal_TTSZ-PalPointers)/8
