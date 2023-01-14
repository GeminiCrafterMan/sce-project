; ---------------------------------------------------------------------------
; GHZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

GHZ1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

GHZ1_ScreenEvent:
		bra.w	GHZ_Refresh

DLE_GHZ1:
		move.w	#$300,(Camera_target_max_Y_pos).w ; set lower y-boundary
		cmpi.w	#$1780,(v_screenposx).w ; has the camera reached $1780 on x-axis?
		bcs.s	locret_6E08	; if not, branch
		move.w	#$400,(Camera_target_max_Y_pos).w ; set lower y-boundary

locret_6E08:
		rts
; ===========================================================================

DLE_GHZ2:
		move.w	#$300,(Camera_target_max_Y_pos).w
		cmpi.w	#$ED0,(v_screenposx).w
		bcs.s	locret_6E3A
		move.w	#$200,(Camera_target_max_Y_pos).w
		cmpi.w	#$1600,(v_screenposx).w
		bcs.s	locret_6E3A
		move.w	#$400,(Camera_target_max_Y_pos).w
		cmpi.w	#$1D60,(v_screenposx).w
		bcs.s	locret_6E3A
		move.w	#$300,(Camera_target_max_Y_pos).w

locret_6E3A:
		rts
; ===========================================================================

DLE_GHZ3:
		moveq	#0,d0
		move.b	(Screen_event_routine).w,d0
		move.w	off_6E4A(pc,d0.w),d0
		jmp	off_6E4A(pc,d0.w)
; ===========================================================================
off_6E4A:	dc.w DLE_GHZ3main-off_6E4A
		dc.w DLE_GHZ3boss-off_6E4A
		dc.w DLE_GHZ3end-off_6E4A
; ===========================================================================

DLE_GHZ3main:
		move.w	#$300,(Camera_target_max_Y_pos).w
		cmpi.w	#$380,(v_screenposx).w
		bcs.s	locret_6E96
		move.w	#$310,(Camera_target_max_Y_pos).w
		cmpi.w	#$960,(v_screenposx).w
		bcs.s	locret_6E96
		cmpi.w	#$280,(v_screenposy).w
		bcs.s	loc_6E98
		move.w	#$400,(Camera_target_max_Y_pos).w
		cmpi.w	#$1380,(v_screenposx).w
		bcc.s	loc_6E8E
		move.w	#$4C0,(Camera_target_max_Y_pos).w
		move.w	#$4C0,(Camera_max_Y_pos).w

loc_6E8E:
		cmpi.w	#$1700,(v_screenposx).w
		bcc.s	loc_6E98

locret_6E96:
		rts
; ===========================================================================

loc_6E98:
		move.w	#$300,(Camera_target_max_Y_pos).w
		addq.b	#2,(Screen_event_routine).w
		rts	
; ===========================================================================

DLE_GHZ3boss:
		cmpi.w	#$960,(v_screenposx).w
		bcc.s	loc_6EB0
		subq.b	#2,(Screen_event_routine).w

loc_6EB0:
		cmpi.w	#$2960,(v_screenposx).w
		bcs.s	locret_6EE8
;		jsr		FindFreeObj
;		bne.s	loc_6ED0
;		move.l	#Obj_RobotnikShipFlame,address(a1) ; load GHZ boss	object	; unfortunately this does not exist
;		move.w	#$2A60,obX(a1)
;		move.w	#$280,obY(a1)

loc_6ED0:
		music	bgm_ZoneBoss
		move.b	#1,(f_lockscreen).w ; lock screen
		addq.b	#2,(Screen_event_routine).w
;		moveq	#plcid_Boss,d0
;		bra.w	AddPLC		; load boss patterns
; ===========================================================================

locret_6EE8:
		rts
; ===========================================================================

DLE_GHZ3end:
		move.w	(v_screenposx).w,(Camera_min_X_pos).w
		rts	
; ===========================================================================

GHZ_Refresh:
		tst.b (Screen_event_flag).w
		bne.s	GHZ_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

GHZ_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

GHZ1_BackgroundInit:
		bsr.w	GHZ_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	GHZ1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

GHZ1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	GHZ1_Transition
		bsr.w	GHZ_Deform

.deform:
		lea	GHZ1_BGDeformArray(pc),a4
		lea	(H_scroll_table).w,a5
		jsr	(ApplyDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

GHZ1_Transition:
		tst.b	(Kos_modules_left).w
		bne.w	.ret
		cmpi.b	#2,(Current_act).w
		bge.w	.done
		tst.b	(TitleCard_end_flag).w
		beq.w	.ret
		addq.b	#1,(Current_act).w
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

GHZ1_BGDeformArray:
	rept 15
		dc.w 16
	endr
		dc.w $7FFF
; ---------------------------------------------------------------------------

GHZ_Deform:
		rts