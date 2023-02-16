; ---------------------------------------------------------------------------
; SSLZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

SSLZ_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

SSLZ_ScreenEvent:
		bra.w	SSLZ_Refresh

DLE_SSLZ1:
		cmpi.w	#$EAC,(Normal_palette+$2).w	; Is the color shifting already active?
		beq.s	.noShiftPlayer			; If so, skip.
		ShiftPalUp1 $200				; Shift player palette up in the blue section,
		ShiftPalDown1 $042				; and down in the red and green
	.noShiftPlayer:
		rts

DLE_SSLZ2:
		move.w	#$644,(Normal_palette+$1C).w	; edit player palette because S/H shenanigans
		move.w	#$8C89,(VDP_control_port).l	; enable S/H mode
	.ret:
		rts

DLE_SSLZ3:
		cmpi.w	#$CEE,(Normal_palette+$2).w	; Is the color shifting already active?
		beq.s	.noShiftPlayer			; If so, skip.
		ShiftPalUp1 $002				; Shift player palette up in the red and green sections,
		ShiftPalDown1 $200				; and down in the blue
.noShiftPlayer:
		rts
; ===========================================================================

SSLZ_Refresh:
		tst.b (Screen_event_flag).w
		bne.s	SSLZ_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

SSLZ_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

SSLZ_BackgroundInit:
		bsr.w	SSLZ_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	SSLZ_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

SSLZ_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	SSLZ_Transition
		bsr.s	SSLZ_Deform

.deform:
	; The deformation table is loaded inside the scrolling routine already.
		lea	(H_scroll_table).w,a5
		jsr	(ApplyDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

SSLZ_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.s	SSLZ_Deform
		bra.s	SSLZ_BackgroundEvent.deform
; ---------------------------------------------------------------------------

SSLZ_Deform:
		moveq	#0,d0
		move.b	(Current_act).w,d0
		lsl.w	#2,d0	; multiply by 4
		move.l	.routines(pc,d0.w),a1
		jmp		(a1)

.routines:
		dc.l SSLZ1_Deform
		dc.l SSLZ2_Deform
		dc.l SSLZ1_Deform
		dc.l SSLZ1_Deform

; ---------------------------------------------------------------------------

SSLZ1_BGDeformArray:
		dc.w 16
		dc.w 32
		dc.w 56
		dc.w 64
		dc.w 8
	rept 40
		dc.w 2
	endr
		dc.w $7FFF
; ---------------------------------------------------------------------------

SSLZ1_Deform:
	; Vertical scrolling!!
		move.w	(Camera_Y_pos_copy).w,d0
		andi.w	#$7FF,d0
		lsr.w	#5,d0
		neg.w	d0
		addi.w	#$20,d0
		bpl.s	.limitY
		moveq	#0,d0
	.limitY:
		move.w	d0,d4
		move.w	d0,(Camera_Y_pos_BG_copy).w
	; It's good!!
		lea	(H_scroll_table).w,a1
		move.l	(Camera_X_pos_copy).w,d0
;		neg.l	d0
		move.w	(Level_frame_counter).w,d1
		swap	d1
		clr.w	d1

	; Clouds 1
		move.l	d0,d2
		move.l	d1,d3
		asr.l	#4,d2
		asr.l	#1,d3
		add.l	d3,d2
		swap	d2
		move.w	d2,(a1)+

	; Clouds 2 & 3
	rept 2
		swap	d2
		asr.l	#1,d2
		asr.l	#1,d3
		add.l	d3,d2
		swap	d2
		move.w	d2,(a1)+
	endr
	; Nothing
		clr.w	d2
		move.w	d2,(a1)+

	; Mountains
		move.l	d0,d2
		asr.l	#7,d2
		swap	d2
		move.w	d2,(a1)+
	; Ocean
		move.w	(Camera_X_pos_BG_copy).w,d0
		move.w	(Camera_X_pos_copy).w,d2
		andi.w	#$FFF,d0
		andi.w	#$FFF,d2
		sub.w	d0,d2
		ext.l	d2
		asl.l	#8,d2
		divs.w	#$68,d2
		ext.l	d2
		asl.l	#8,d2
		moveq	#0,d3
		move.w	d0,d3
		move.w	#$47,d1
		add.w	d4,d1
	.waterLoop:			; water deformation
		move.w	d3,d0
		move.w	d0,(a1)+
		swap	d3
		add.l	d2,d3
		swap	d3
		dbf	d1,.waterLoop
		lea	SSLZ1_BGDeformArray(pc),a4
		rts
; ---------------------------------------------------------------------------

SSLZ2_BGDeformArray:
		dc.w $7FFF
; ---------------------------------------------------------------------------

SSLZ2_Deform:
	; Vertical scrolling!!
		move.w	(Camera_Y_pos_copy).w,d0
		andi.w	#$FFF,d0	; used to be $7FF
		lsr.w	#5,d0
		neg.w	d0
		addi.w	#64,d0
		bpl.s	.limitY
		moveq	#0,d0
	.limitY:
		move.w	d0,d4
		move.w	d0,(Camera_Y_pos_BG_copy).w
	; It's good!!
		lea	(H_scroll_table).w,a1
		move.l	(Camera_X_pos_copy).w,d0
		move.l	d0,d2
		swap	d2
		asr.l	#1,d2
		move.w	d2,(a1)+
		lea	SSLZ2_BGDeformArray(pc),a4
		rts