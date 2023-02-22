; ---------------------------------------------------------------------------
; TTPZ palette cycling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

AnPal_TTPZ:
		lea		(Normal_palette_line_4+$2).w,a0

	.cont:
		subq.w	#1,(Palette_cycle_counters).w ; decrement timer
		bpl.s	.skip	; if time remains, branch

		move.w	#2,(Palette_cycle_counters).w ; reset timer to 5 frames
		jmp		PalRotRight_4

	.skip:
		rts