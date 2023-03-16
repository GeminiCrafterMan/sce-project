; ---------------------------------------------------------------------------
; DEZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

DEZ1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

DEZ1_ScreenEvent:
		tst.b (Screen_event_flag).w
		bne.s	DEZ1_ScreenEvent_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

DEZ1_ScreenEvent_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

DEZ1_BackgroundInit:
		bsr.s	DEZ1_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	DEZ1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

DEZ1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	DEZ1_Transition
		bsr.w	DEZ1_Deform

.deform:
		lea	DEZ1_BGDeformArray(pc),a4
		lea	(H_scroll_table).w,a5
		jsr	(ApplyDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

DEZ1_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.w	DEZ1_Deform
		bra.w	DEZ1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

DEZ1_BGDeformArray:
	rept 15
		dc.w 16
	endr
		dc.w $7FFF
; ---------------------------------------------------------------------------

DEZ1_Deform:
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

DLE_DEZ2:
		tst.b	(Screen_event_routine).w
		bne.s	+
		move.w	#320,d0
		cmp.w	(Camera_X_pos).w,d0
		bhi.s	+	; rts
		addq.b	#2,(Screen_event_routine).w
		jsr	SingleObjLoad
		bne.s	+	; rts
		move.l	#Obj_SilverSonic,id(a1) ; load objAF (Silver Sonic)
;		move.b	#$48,subtype(a1)
		move.w	#$348,x_pos(a1)
		move.w	#$A0,y_pos(a1)
;		moveq	#PLCID_FieryExplosion,d0
;		jmpto	LoadPLC, JmpTo2_LoadPLC
; ===========================================================================
+
	rts