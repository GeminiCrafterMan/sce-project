; ---------------------------------------------------------------------------
; Techno Tower events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

TechnoTower1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

TechnoTower1_ScreenEvent:
		bra.w	TechnoTower_Refresh

DLE_TechnoTower1:
		rts
		cmpi.b	#id_TitleScreen,(Game_mode).w
		beq.w	DLE_TechnoTower1main.ret
		cmpi.w	#$CEE,(Normal_palette+$2).w	; Is the color shifting already active?
		beq.s	.noShiftPlayer			; If so, skip.
		ShiftPalUp1 $002				; Shift player palette up in the red section,
		ShiftPalDown1 $200				; and down in the blue
.noShiftPlayer:
		moveq	#0,d0
		move.b	(Screen_event_routine).w,d0
		move.w	.index(pc,d0.w),d0
		jmp	.index(pc,d0.w)
; ===========================================================================
.index:	dc.w DLE_TechnoTower1main-.index
		dc.w DLE_TechnoTower1boss-.index
		dc.w DLE_TechnoTower1end-.index
; ===========================================================================

DLE_TechnoTower1main:
.cont:
		cmpi.w	#$5B00,(v_screenposx).w
		bcc.s	.cont2

.ret:
		rts
; ===========================================================================

.cont2:
		move.w	#$500,(Camera_target_max_Y_pos).w
		addq.b	#2,(Screen_event_routine).w
		rts
; ===========================================================================

DLE_TechnoTower1boss:
		cmpi.w	#$4D60,(v_screenposx).w
		bcc.s	.cont
		subq.b	#2,(Screen_event_routine).w

.cont:
		cmpi.w	#$6D60,(v_screenposx).w
		bcs.s	.ret
		jsr		FindFreeObj
		bne.s	.cont2
		move.l	#Obj_MechaSonic,address(a1) ; load Mecha Sonic
		st		(Boss_flag).w
		move.w	#$6E60,obX(a1)
		move.w	#$480,obY(a1)

.cont2:
		move.b	#1,(f_lockscreen).w ; lock screen
		addq.b	#2,(Screen_event_routine).w
;		moveq	#plcid_Boss,d0
;		bra.w	AddPLC		; load boss patterns
; ===========================================================================

.ret:
		rts
; ===========================================================================

DLE_TechnoTower1end:
		move.w	(v_screenposx).w,(Camera_min_X_pos).w
		rts
; ===========================================================================

TechnoTower_Refresh:
		tst.b (Screen_event_flag).w
		bne.s	TechnoTower_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

TechnoTower_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

TechnoTower1_BackgroundInit:
		bsr.s	TechnoTower_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	TechnoTower1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

TechnoTower1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	TechnoTower1_Transition
		bsr.s	TechnoTower_Deform

.deform:
		jsr	(DrawBGAsYouMove).l
		jsr	(PlainDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

TechnoTower1_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.s	TechnoTower_Deform
		bra.w	TechnoTower1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

TechnoTower_Deform:	; Pachinko scrolling from S3K
		move.w	(Camera_Y_pos_copy).w,d0
;		asr.w	#1,d0
;		neg.w	d0
;		addi.w	#$BA0,d0
;		bpl.s	.limitY
;		subi.w	#$2E0,d0
;		bmi.s	.limitY
;		moveq	#0,d0
;	.limitY:
;		neg.w	d0
		move.w	d0,(Camera_Y_pos_BG_copy).w
		move.w	(Camera_X_pos_copy).w,d0
		subi.w	#$A0,d0
		swap	d0
		clr.w	d0
		asr.l	#1,d0
		move.l	d0,d1
		asr.l	#2,d1
		add.l	d1,d0
		swap	d0
		addi.w	#$60,d0
		move.w	d0,(Camera_X_pos_BG_copy).w
		rts
