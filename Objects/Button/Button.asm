; ---------------------------------------------------------------------------
; Button (Object)
; ---------------------------------------------------------------------------

; Extra subtype bits:
; Bit 4 ($1X) - Trigger value does not get reset after stepping off. Used in Angel Island Act 2 in S3K so the water only lowers once.
; Bit 5 ($2X) - Top-solid only. Used in Flying Battery in S3K.
; Bit 6 ($4X) - Leftover from Sonic 2, unknown at the moment

; =============== S U B R O U T I N E =======================================

Obj_Button:
		move.l	#Map_Button,mappings(a0)
		move.w	#make_art_tile(ArtTile_Button,0,0),art_tile(a0)
		move.b	#4,render_flags(a0)
		move.w	#bytes_to_word(16/2,32/2),height_pixels(a0)		; set height and width
		move.w	#$200,priority(a0)
		addq.w	#4,y_pos(a0)
		btst	#5,subtype(a0)
		beq.s	loc_2C5B8
		move.l	#loc_2C62C,address(a0)
		bra.s	loc_2C62C
; ---------------------------------------------------------------------------

loc_2C5B8:
		move.l	#loc_2C5BE,address(a0)

loc_2C5BE:
		tst.b	render_flags(a0)
		bpl.s	loc_2C626
		moveq	#$1B,d1
		moveq	#4,d2
		moveq	#5,d3
		move.w	x_pos(a0),d4
		jsr	(SolidObjectFull).w
		clr.b	mapping_frame(a0)
		move.b	subtype(a0),d0
		andi.w	#$F,d0
		lea	(Level_trigger_array).w,a3
		lea	(a3,d0.w),a3
		moveq	#0,d3
		btst	#6,subtype(a0)
		beq.s	+
		moveq	#7,d3
+		move.b	status(a0),d0
		andi.b	#$18,d0
		bne.s	loc_2C612
		btst	#4,subtype(a0)
		bne.s	loc_2C626
		bclr	d3,(a3)
		bra.s	loc_2C626
; ---------------------------------------------------------------------------

loc_2C612:
		tst.b	(a3)
		bne.s	+
		sfx	sfx_Switch
+		bset	d3,(a3)
		move.b	#1,mapping_frame(a0)

loc_2C626:
		jmp	(Sprite_OnScreen_Test).w
; ---------------------------------------------------------------------------

loc_2C62C:
		tst.b	render_flags(a0)
		bpl.s	loc_2C690
		moveq	#$10,d1
		moveq	#6,d3
		move.w	x_pos(a0),d4
		jsr	(SolidObjectTop).w
		clr.b	mapping_frame(a0)
		move.b	subtype(a0),d0
		andi.w	#$F,d0
		lea	(Level_trigger_array).w,a3
		lea	(a3,d0.w),a3
		moveq	#0,d3
		btst	#6,subtype(a0)
		beq.s	+
		moveq	#7,d3
+		move.b	status(a0),d0
		andi.b	#$18,d0
		bne.s	loc_2C67C
		btst	#4,subtype(a0)
		bne.s	loc_2C690
		bclr	d3,(a3)
		bra.s	loc_2C690
; ---------------------------------------------------------------------------

loc_2C67C:
		tst.b	(a3)
		bne.s	+
		sfx	sfx_Switch
+		bset	d3,(a3)
		move.b	#1,mapping_frame(a0)

loc_2C690:
		jmp	(Sprite_OnScreen_Test).w
; ---------------------------------------------------------------------------

Map_Button:		binclude "Objects/Button/Object Data/Map - Button.bin"
