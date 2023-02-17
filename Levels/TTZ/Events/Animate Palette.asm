; ---------------------------------------------------------------------------
; TTZ palette cycling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

AnPal_TTZ:
		lea	(Palette_cycle_counters).w,a0
		subq.w	#1,(a0)
		bpl.s	.return
		move.w	#$13,(a0)

		move.w	2(a0),d0
		addq.w	#3*2,2(a0)
		cmpi.w	#6*(3*2),2(a0)
		blo.s	.skip
		clr.w	2(a0)

.skip:
		lea	(AnPal_PalTTZ).l,a1
		lea	(Normal_palette_line_3+$A).w,a2
		move.l	(a1,d0.w),(a2)+
		move.w	4(a1,d0.w),(a2)+

.return:
		rts

AnPal_PalTTZ:	; fuck you i'm writing it by hand bitch
		dc.w	$842, $C84, $EE8
		dc.w	$842, $C84, $EE8
		dc.w	$A64, $EA6, $EEA
		dc.w	$C86, $EC8, $EEC
		dc.w	$C86, $EC8, $EEC
		dc.w	$A64, $EA6, $EEA