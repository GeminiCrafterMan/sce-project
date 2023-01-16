; ---------------------------------------------------------------------------
; Target palette loading subroutine
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

PalLoad1:
LoadPalette:
		lea	(PalPointers).l,a1
		lsl.w	#3,d0
		adda.w	d0,a1
		movea.l	(a1)+,a2		; get palette data address
		movea.w	(a1)+,a3		; get target RAM address
		lea	Target_palette-Normal_palette(a3),a3	; skip to "Normal_palette" RAM address
		move.w	(a1)+,d0		; get length of palette data

.copy
		move.l	(a2)+,(a3)+	; move data to RAM
		dbf	d0,.copy
		rts

; ---------------------------------------------------------------------------
; Normal palette loading subroutine
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

PalLoad2:
LoadPalette_Immediate:
		lea	(PalPointers).l,a1
		lsl.w	#3,d0
		adda.w	d0,a1
		movea.l	(a1)+,a2		; get palette data address
		movea.w	(a1)+,a3		; get target RAM address
		move.w	(a1)+,d0		; get length of palette

.copy
		move.l	(a2)+,(a3)+	; move data to RAM
		dbf	d0,.copy
		rts

; ---------------------------------------------------------------------------
; Underwater normal palette loading subroutine
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LoadPalette2:
PalLoad3_Water:
		lea	(PalPointers).l,a1
		lsl.w	#3,d0
		adda.w	d0,a1
		movea.l	(a1)+,a2		; get palette data address
		movea.w	(a1)+,a3		; get target RAM address
		move.w	(a1)+,d0		; get length of palette data

.copy
		move.l	(a2)+,(a3)+	; move data to RAM
		dbf	d0,.copy
		rts

; ---------------------------------------------------------------------------
; Underwater target palette loading subroutine
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

PalLoad4_Water:
LoadPalette2_Immediate:
		lea	(PalPointers).l,a1
		lsl.w	#3,d0
		adda.w	d0,a1
		movea.l	(a1)+,a2		; get palette data address
		movea.w	(a1)+,a3		; get target RAM address
		lea	-(Water_palette-Target_water_palette)(a3),a3	; skip to "Water_palette" RAM address
		move.w	(a1)+,d0		; get length of palette data

.copy
		move.l	(a2)+,(a3)+	; move data to RAM
		dbf	d0,.copy
		rts

; ---------------------------------------------------------------------------
; Load palette
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

PalLoad_Line64:

	rept 16/2
		move.l	(a1)+,(a2)+
	endr

PalLoad_Line48:

	rept 16/2
		move.l	(a1)+,(a2)+
	endr

PalLoad_Line32:

	rept 16/2
		move.l	(a1)+,(a2)+
	endr

PalLoad_Line16:

	rept 16/2
		move.l	(a1)+,(a2)+
	endr

		rts

; ---------------------------------------------------------------------------
; Add and subtract shades from the palette
; and cap each parameter to prevent overflow
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

ShiftPaletteUp:
	.loop:

	.redblack:
		move.w	(a1),d4
		andi.w	#$E,d4
		add.b	d0,d4
		cmpi.b	#$E,d4
		bls.s	.greenblack
		moveq	#$E,d4

	.greenblack:
		move.w	(a1),d5
		andi.w	#$E0,d5
		add.w	d1,d5
		cmpi.w	#$E0,d5
		bls.s	.blueblack
		move.w	#$E0,d5

	.blueblack:
		add.b	d5,d4
		move.w	(a1),d5
		andi.w	#$E00,d5
		add.w	d2,d5
		cmpi.w	#$E00,d5
		bls.s	.gtfo
		move.w	#$E00,d5

	.gtfo:
		add.w	d5,d4
		move.w	d4,(a1)
		adda.w	#2,a1   ; Advance in the address
		dbf		d3,.loop ; Loop
		rts

ShiftPaletteDown:
	.loop:

	.redblack:
		move.w	(a1),d4
		andi.w	#$E,d4
		sub.b	d0,d4 ; Add the desired color shift to the palette
		bcc.s	.greenblack
		moveq	#0,d4

	.greenblack:
		move.w	(a1),d5
		andi.w	#$E0,d5
		sub.w	d1,d5 ; Add the desired color shift to the palette
		bcc.s	.blueblack
		moveq	#0,d5

	.blueblack:
		add.b	d5,d4
		move.w	(a1),d5
		andi.w	#$E00,d5
		sub.w	d2,d5 ; Add the desired color shift to the palette
		bcc.s	.gtfo
		moveq	#0,d5

	.gtfo:
		add.w	d5,d4
		move.w	d4,(a1)
		adda.w	#2,a1   ; Advance in the address
		dbf		d3,.loop ; Loop
		rts

; ---------------------------------------------------------------------------
; Clear palette
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Clear_Palette:
		moveq	#cBlack,d0

Clear_Palette2:
		moveq	#64/2-1,d1

Clear_Palette3:
		lea	(Target_palette).w,a1
		lea	(Normal_palette).w,a2

-		move.l	d0,(a1)+
		move.l	d0,(a2)+
		dbf	d1,-
		rts
