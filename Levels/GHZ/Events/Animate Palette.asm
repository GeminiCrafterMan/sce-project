; ---------------------------------------------------------------------------
; GHZ palette cycling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

AnPal_GHZ:
		lea		(v_pal_dry+$50).w,a0

	.cont:
		subq.w	#1,(Palette_cycle_counters).w ; decrement timer
		bpl.s	.skip	; if time remains, branch

		move.w	#5,(Palette_cycle_counters).w ; reset timer to 5 frames
;		jsr		PalRotRight_4
	; Pal_RotRight_4:
		move.w	(a0)+,d0
		move.l	(a0)+,d1
		move.w	(a0)+,d2
		move.l	d1,-(a0)
		move.w	d0,-(a0)
		move.w	d2,-(a0)

	.skip:
		rts