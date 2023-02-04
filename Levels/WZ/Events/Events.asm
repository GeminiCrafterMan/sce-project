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
		clr.b	(Background_event_flag).w
		rts
; ---------------------------------------------------------------------------

WZ1_BGDeformArray:
	rept 15
		dc.w 16
	endr
		dc.w $7FFF
; ---------------------------------------------------------------------------

WZ_Deform:
	rts