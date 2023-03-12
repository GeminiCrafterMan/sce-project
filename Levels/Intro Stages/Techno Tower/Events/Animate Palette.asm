; ---------------------------------------------------------------------------
; TechnoTower palette cycling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

AnPal_TechnoTower:
	; Foreground lights
		lea	(Palette_cycle_counters).w,a0
		subq.w	#1,(a0)
		bpl.s	.anpal2
		move.w	#7,(a0)

		move.w	2(a0),d0
		addq.w	#3*2,2(a0)	; Amount of colors to transfer*2
		cmpi.w	#6*(3*2),2(a0)	; amount of color sets in cycle * previous value
		blo.s	.skip
		clr.w	2(a0)

	.skip:
		lea	(AnPal_PalTechnoTowerFGLights).l,a1
		lea	(Normal_palette_line_3+$14).w,a2
		move.l	(a1,d0.w),(a2)+
		move.w	4(a1,d0.w),(a2)+

	; BG water (occurs at the same time)
		move.w	4(a0),d0
		addq.w	#2*2,4(a0)	; Amount of colors to transfer*2
		cmpi.w	#6*(2*2),4(a0)	; amount of color sets in cycle * previous value
		blo.s	.skip2
		clr.w	4(a0)

	.skip2:
		lea	(AnPal_PalTechnoTowerBGWater).l,a1
		lea	(Normal_palette_line_4+$1C).w,a2
		move.l	(a1,d0.w),(a2)+

.anpal2:
	; Background lights
		subq.w	#1,6(a0)
		bpl.s	.return
		move.w	#3,6(a0)

		move.w	8(a0),d0
		addq.w	#1*2,8(a0)	; Amount of colors to transfer*2
		cmpi.w	#8*(1*2),8(a0)	; amount of color sets in cycle * previous value
		blo.s	.skip3
		clr.w	8(a0)

	.skip3:
		lea	(AnPal_PalTechnoTowerBGLights).l,a1
		lea	(Normal_palette_line_4+$1A).w,a2
		move.w	(a1,d0.w),(a2)+

	.return:
		rts

AnPal_PalTechnoTowerFGLights:	; Yep, writing it by hand again!
		dc.w	$024, $202, $002	; Yellow, orange, red
		dc.w	$046, $022, $004
		dc.w	$0EE, $06A, $02E
		dc.w	$0AC, $048, $00A
		dc.w	$068, $024, $006
		dc.w	$046, $022, $004

AnPal_PalTechnoTowerBGWater:
		dc.w	$C88, $A66
		dc.w	$A88, $A68
	; Swap
		dc.w	$A68, $A88
		dc.w	$A66, $C88
		dc.w	$C66, $C86
	; Swap
		dc.w	$C86, $C66

AnPal_PalTechnoTowerBGLights:
		dc.w	$006, $008, $00A, $00C, $00E, $00C, $00A, $008	; red