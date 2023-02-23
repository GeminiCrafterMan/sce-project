; ---------------------------------------------------------------------------
; MMZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

MMZ1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

MMZ1_ScreenEvent:
		bra.w	MMZ_Refresh

DLE_MMZ:
		rts
; ===========================================================================

MMZ_Refresh:
		tst.b (Screen_event_flag).w
		bne.s	MMZ_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

MMZ_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

MMZ1_BackgroundInit:
		bsr.w	MMZ_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		moveq	#0,d1
		jsr	(Refresh_PlaneFull).w
		jmp	PlainDeformation

; =============== S U B R O U T I N E =======================================

MMZ1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	MMZ1_Transition

.deform:
		bsr.w	MMZ_Deform
		lea	(Camera_Y_pos_BG_copy).w,a6
		lea	(Camera_Y_pos_BG_rounded).w,a5
		moveq	#0,d1
		moveq	#$20,d6
		jsr	Draw_TileRow
		jmp	PlainDeformation
; ---------------------------------------------------------------------------

MMZ1_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bra.s	MMZ1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

MMZ1_BGDeformArray:
		dc.w $7FFF
; ---------------------------------------------------------------------------

MMZ_Deform:
		move.w	(Camera_Y_pos_copy).w,d0
		swap	d0
		clr.w	d0
		asr.l	#3,d0
		move.l	d0,d1
		asr.l	#2,d1
		add.l	d1,d0
		swap	d0
		addi.w	#$76,d0
		move.w	d0,(Camera_Y_pos_BG_copy).w
		move.w	(Camera_X_pos_copy).w,d0	; Events_fg_1
		swap	d0
		clr.w	d0
		asr.l	#1,d0
		move.l	d0,d1
		asr.l	#2,d1
		sub.l	d1,d0
		asr.l	#1,d1
		swap	d0
		move.w	d0,(Camera_X_pos_BG_copy).w
		swap	d0
		sub.l	d1,d0
		swap	d0
		move.w	d0,(Events_bg+$10).w
		swap	d0
		sub.l	d1,d0
		swap	d0
		move.w	d0,(Events_bg+$12).w
		rts
; End of function MHZ_Deform