; ---------------------------------------------------------------------------
; WZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

WZ1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

WZ1_ScreenEvent:
		bra.w	WZ_Refresh

DLE_WZ:
		rts
; ===========================================================================

WZ_Refresh:
		tst.b (Screen_event_flag).w
		bne.s	WZ_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

WZ_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

WZ1_BackgroundInit:
		bsr.w	WZ_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	WZ1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

WZ1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	WZ1_Transition
		bsr.w	WZ_Deform

.deform:
		lea	WZ1_BGDeformArray(pc),a4
		lea	(H_scroll_table).w,a5
		jsr	(ApplyDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

WZ1_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.s	WZ_Deform
		bra.s	WZ1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

WZ1_BGDeformArray:
		dc.w $7FFF
; ---------------------------------------------------------------------------

WZ_Deform:
	; Vertical scrolling!!
		move.w	(Camera_Y_pos_copy).w,d0
		andi.w	#$FFF,d0	; used to be $7FF
		lsr.w	#5,d0
		neg.w	d0
		addi.w	#$80,d0
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
	rts