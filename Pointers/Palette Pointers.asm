; ===========================================================================
; Palette pointers
; ===========================================================================

PalPointers:				; palette address, RAM address, colours

; Main
ptr_Pal_Sonic:			palp	Pal_Sonic, Normal_palette_line_1, 16
ptr_Pal_Knuckles:		palp	Pal_Knuckles, Normal_palette_line_1, 16
ptr_Pal_Mighty:			palp	Pal_Mighty, Normal_palette_line_1, 16

; Levels
ptr_Pal_GHZ1:			palp	Pal_GHZ1, Normal_palette_line_2, 48
ptr_Pal_TTZ1:			palp	Pal_TTZ1, Normal_palette_line_2, 48
ptr_Pal_GHZEX:			palp	Pal_GHZEX, Normal_palette_line_2, 48
ptr_Pal_TTZEX:			palp	Pal_TTZEX, Normal_palette_line_2, 48
ptr_Pal_SSLZ1:			palp	Pal_SSLZ1, Normal_palette_line_2, 48
ptr_Pal_SSLZ2:			palp	Pal_SSLZ2, Normal_palette_line_2, 48
ptr_Pal_SSLZ3:			palp	Pal_SSLZ3, Normal_palette_line_2, 48
ptr_Pal_TTPZ1:			palp	Pal_TTPZ1, Normal_palette_line_2, 48
ptr_Pal_TTPZ2:			palp	Pal_TTPZ2, Normal_palette_line_2, 48
ptr_Pal_CCZ:			palp	Pal_CCZ, Normal_palette_line_2, 48
ptr_Pal_MMZ:			palp	Pal_MMZ, Normal_palette_line_2, 48
ptr_Pal_SS12:			palp	Pal_SS12, Normal_palette_line_2, 48
ptr_Pal_SS34:			palp	Pal_SS34, Normal_palette_line_2, 48
ptr_Pal_SS56:			palp	Pal_SS56, Normal_palette_line_2, 48
ptr_Pal_TTSZ:			palp	Pal_TTSZ, Normal_palette_line_2, 48
; ---------------------------------------------------------------------------

; Main
palid_Sonic:			equ (ptr_Pal_Sonic-PalPointers)/8
palid_Knuckles:			equ (ptr_Pal_Knuckles-PalPointers)/8
palid_Mighty:			equ (ptr_Pal_Mighty-PalPointers)/8

; Levels
palid_GHZ1:				equ (ptr_Pal_GHZ1-PalPointers)/8
palid_TTZ1:				equ (ptr_Pal_TTZ1-PalPointers)/8
palid_GHZEX:			equ (ptr_Pal_GHZEX-PalPointers)/8
palid_TTZEX:			equ (ptr_Pal_TTZEX-PalPointers)/8
palid_SSLZ1:			equ (ptr_Pal_SSLZ1-PalPointers)/8
palid_SSLZ2:			equ (ptr_Pal_SSLZ2-PalPointers)/8
palid_SSLZ3:			equ (ptr_Pal_SSLZ3-PalPointers)/8
palid_TTPZ1:			equ (ptr_Pal_TTPZ1-PalPointers)/8
palid_TTPZ2:			equ (ptr_Pal_TTPZ2-PalPointers)/8
palid_CCZ:				equ (ptr_Pal_CCZ-PalPointers)/8
palid_MMZ:				equ (ptr_Pal_MMZ-PalPointers)/8
palid_SS12:				equ (ptr_Pal_SS12-PalPointers)/8
palid_SS34:				equ (ptr_Pal_SS34-PalPointers)/8
palid_SS56:				equ (ptr_Pal_SS56-PalPointers)/8
palid_TTSZ:				equ (ptr_Pal_TTSZ-PalPointers)/8
