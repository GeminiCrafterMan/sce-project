; ---------------------------------------------------------------------------
; SS events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

SS1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

SS1_ScreenEvent:
		tst.b (Screen_event_flag).w
		bne.s	SS1_ScreenEvent_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

SS1_ScreenEvent_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

SS1_BackgroundInit:
		bsr.s	SS1_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	SS1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

SS1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	SS1_Transition
		bsr.w	SS1_Deform

.deform:
		lea	SS1_BGDeformArray(pc),a4
		lea	(H_scroll_table).w,a5
		jsr	(ApplyDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

SS1_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.w	SS1_Deform
		bra.w	SS1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

SS1_BGDeformArray:
		dc.w 128
		dc.w 128
		dc.w $7FFF
; ---------------------------------------------------------------------------

SS1_Deform:
		lea	(H_scroll_table).w,a1
		move.l	(Camera_X_pos_copy).w,d0
		neg.l	d0
		move.w	(Level_frame_counter).w,d1
		swap	d1
		clr.w	d1

	rept 16/2
; Star 1
		move.l	d0,d2
		move.l	d1,d3
		asr.l	#7,d2
		asr.l	#1,d3
		add.l	d3,d2
		swap	d2
		move.w	d2,(a1)+

; Star 2
		swap	d2
		asr.l	#3,d2
		asr.l	#1,d3
		add.l	d3,d2
		swap	d2
		move.w	d2,(a1)+
	endr
		rts