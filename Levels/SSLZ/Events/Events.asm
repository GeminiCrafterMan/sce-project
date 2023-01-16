; ---------------------------------------------------------------------------
; SSLZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

SSLZ1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

SSLZ1_ScreenEvent:
		bra.w	SSLZ_Refresh

DLE_SSLZ:
	cmpi.w	#$EAC,(Normal_palette+$2).w	; Is the color shifting already active?
	beq.s	.noShiftPlayer			; If so, skip.
	ShiftPalUp1 $200				; Shift player palette up in the blue section,
	ShiftPalDown1 $042				; and down in the red and green
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

SSLZ1_BackgroundInit:
		bsr.w	SSLZ_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	SSLZ1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

SSLZ1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	SSLZ1_Transition
		bsr.w	SSLZ_Deform

.deform:
		lea	SSLZ1_BGDeformArray(pc),a4
		lea	(H_scroll_table).w,a5
		jsr	(ApplyDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

SSLZ1_Transition:
		tst.b	(Kos_modules_left).w
		bne.w	.ret
		cmpi.b	#1,(Current_act).w	; actually act 2
		bge.w	.done
		tst.b	(TitleCard_end_flag).w
		beq.w	.ret
		addq.b	#1,(Current_act).w
		addq.b	#1,(Apparent_act).w
		clr.b	(Screen_event_routine).w
		jsr		Restart_LevelData
		jsr	(LoadLevelPointer).w
		jsr	(Get_LevelSizeStart).l
		jsr	Reset_TileOffsetPositionActual

	.done:
		clr.b	(Background_event_flag).w
	.ret:
		rts
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

SSLZ_Deform:
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
		move.l	d0,d2
	rept 40
		swap	d2
		move.l	d2,d3
		asr.l	d2
		add.l	d3,d2
		swap	d2
		move.w	d2,(a1)+
	endr
		rts
	lea		.ParallaxScriptSSLZ,a1
	jmp		ExecuteParallaxScript

; ---------------------------------------------------------------

.ParallaxScriptSSLZ:

;			Mode			Speed/dist		Number of lines		What's moving?
	dc.w	_moving,		$0004,			16					; clouds 7
	dc.w	_moving+2,		$0004,			32					; clouds 5
;							bottom half of clouds
	dc.w	_moving+4,		$0004,			56					; clouds 3
	dc.w	_normal,		$0000,			64					; nothing
	dc.w	_normal,		$0001,			8					; mountains
	dc.w	_linear+2,		$0001,			80					; ocean
	dc.w	-1
; End of function SwScrl_SSLZ