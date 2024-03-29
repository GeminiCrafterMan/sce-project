; ---------------------------------------------------------------------------
; TTPZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

TTPZ1_ScreenInit:
		move.l	#Obj_Oil,(v_WaterWave1+address).w
		move.w	#$608,(v_WaterWave1+y_pos).w
		move.l	#Obj_Pylon,(v_WaterWave2+address).w
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

TTPZ1_ScreenEvent:
		bra.w	TTPZ_Refresh

DLE_TTPZ:
		move.w	#$608,(v_WaterWave1+y_pos).w
		cmpi.w	#$8F0,(Camera_X_pos).w
		blo.s	.ret
		move.w	#$788,(v_WaterWave1+y_pos).w
	.ret:
		rts
; ===========================================================================

TTPZ_Refresh:
		tst.b (Screen_event_flag).w
		bne.s	TTPZ_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

TTPZ_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

TTPZ1_BackgroundInit:
		bsr.w	TTPZ_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	TTPZ1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

TTPZ1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	TTPZ1_Transition
		bsr.w	TTPZ_Deform

.deform:
		jsr	(DrawBGAsYouMove).l
		jsr	(PlainDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

TTPZ1_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.s	TTPZ_Deform
		bra.s	TTPZ1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

TTPZ_Deform:
	; goal: get 5/8
		move.l	(Camera_Y_pos_copy).w,d0	; 1/1
		lsr.l	#1,d0	; 4/8 (or 1/2)
		move.l	d0,d1
		lsr.l	#2,d1	; 1/8
		add.l	d1,d0	; 5/8
		move.l	d0,(Camera_Y_pos_BG_copy).w

		move.l	(Camera_X_pos_copy).w,d0
		lsr.l	#1,d0	; 4/8 (or 1/2)
		move.l	d0,d1
		lsr.l	#2,d1	; 1/8
		add.l	d1,d0	; 5/8
		andi.l	#$3FFFFFF,d0	; Loop every $400 pixels (8 chunks)
		move.l	d0,(Camera_X_pos_BG_copy).w
		rts