; ---------------------------------------------------------------------------
; TechnoTower palette cycling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

AnPal_TechnoTower:
	; Foreground lights
		lea	(Palette_cycle_counters).w,a0
		subq.w	#1,(a0)
		bpl.s	.return
		move.w	#7,(a0)

		move.w	2(a0),d0
		addq.w	#3*2,2(a0)	; Amount of colors to transfer*2
		cmpi.w	#6*(3*2),2(a0)	; amount of color sets in cycle * previous value
		blo.s	.skip
		clr.w	2(a0)

	.skip:
		lea	(AnPal_PalTechnoTowerFGLights).l,a1
		lea	(Normal_palette_line_3+$18).w,a2
		move.l	(a1,d0.w),(a2)+
		move.w	4(a1,d0.w),(a2)+

	.return:
		rts

AnPal_PalTechnoTowerFGLights:	; Yep, writing it by hand again!
		dc.w	$024, $202, $002	; Yellow, orange, red
		dc.w	$046, $022, $004
		dc.w	$0EE, $06A, $02E
		dc.w	$0AC, $048, $00A
		dc.w	$068, $024, $006
		dc.w	$046, $022, $004