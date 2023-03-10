; ---------------------------------------------------------------------------
; GHZ palette cycling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

AnPal_GHZ:
		lea		(Normal_palette_line_3+$10).w,a0

	.cont:
		subq.w	#1,(Palette_cycle_counters).w ; decrement timer
		bpl.s	.skip	; if time remains, branch

		move.w	#5,(Palette_cycle_counters).w ; reset timer to 5 frames
		jmp		PalRotRight_4

	.skip:
		rts