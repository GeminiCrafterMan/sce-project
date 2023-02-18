; ---------------------------------------------------------------------------
; TTZ palette cycling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

AnPal_TTZ:
; Waterfalls
		lea	(Normal_palette_line_3+$10).w,a0
		lea	(Palette_cycle_counters).w,a1

		subq.w	#1,(a1)
		bpl.s	.anpal2

		move.w	#2,(a1)
		jsr		PalRotLeft_4

.anpal2:
; Vines
		subq.w	#1,4(a1)
		bpl.s	.return
		move.w	#$13,4(a1)

		move.w	2(a1),d0
		addq.w	#3*2,2(a1)
		cmpi.w	#6*(3*2),2(a1)
		blo.s	.skip2
		clr.w	2(a1)

.skip2:
		lea	(AnPal_PalTTZVine).l,a1
		lea	(Normal_palette_line_3+$A).w,a2
		move.l	(a1,d0.w),(a2)+
		move.w	4(a1,d0.w),(a2)+

.return:
		rts

AnPal_PalTTZVine:	; fuck you i'm writing it by hand bitch
		dc.w	$842, $C84, $EE8
		dc.w	$842, $C84, $EE8
		dc.w	$A64, $EA6, $EEA
		dc.w	$C86, $EC8, $EEC
		dc.w	$C86, $EC8, $EEC
		dc.w	$A64, $EA6, $EEA