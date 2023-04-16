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
		cmpi.w	#$0058,(v_screenposy).w
		bhi.s	.above58	; >= $50, return
		clr.w	(Camera_target_max_Y_pos).w
;		clr.w	(Camera_min_Y_pos).w
		move.w	#$0A00,(Camera_max_X_pos).w	; Right boundary to $C00 for the boss fight
		addq.b	#2,(Screen_event_routine).w

.ret:
		rts
.above58:
		move.w	#$06C0,(Camera_max_X_pos).w
		move.w	#$0F00,(Camera_target_max_Y_pos).w
		rts
; ===========================================================================

DLE_TechnoTower1boss:
		cmpi.w	#$0800,(v_screenposx).w
		bhs.s	.cont	; >= $800, continue
		subq.b	#2,(Screen_event_routine).w

.cont:
		cmpi.w	#$0A00,(v_screenposx).w
		blo.s	.ret	; <= $A00, return
		jsr		FindFreeObj
		bne.s	.cont2
		move.l	#Obj_MechaSonic,address(a1) ; load Mecha Sonic
		st		(Boss_flag).w
		move.w	#$0B00,obX(a1)
		move.w	#$0008,obY(a1)

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
DLE_TechnoTowerEX:
;		cmpi.w	#$CEA,(Normal_palette+$2).w	; Is the color shifting already active?
;		beq.s	.noShiftPlayer			; If so, skip.
;		ShiftPalDown1 $204				; Shift palette down in the red and blue sections.
;.noShiftPlayer:
		moveq	#0,d0
		move.b	(Screen_event_routine).w,d0
		move.w	.index(pc,d0.w),d0
		jmp	.index(pc,d0.w)
; ===========================================================================
.index:	dc.w DLE_TechnoTowerEXmain-.index
		dc.w DLE_TechnoTowerEXboss-.index
		dc.w DLE_TechnoTowerEXend-.index
; ===========================================================================

DLE_TechnoTowerEXmain:
		cmpi.w	#$0058,(v_screenposy).w
		bhi.s	.above58	; >= $50, return
		clr.w	(Camera_target_max_Y_pos).w
;		clr.w	(Camera_min_Y_pos).w
		move.w	#$0A00,(Camera_max_X_pos).w	; Right boundary to $C00 for the boss fight
		addq.b	#2,(Screen_event_routine).w

.ret:
		rts
.above58:
		move.w	#$06C0,(Camera_max_X_pos).w
		move.w	#$0F00,(Camera_target_max_Y_pos).w
		rts
; ===========================================================================

DLE_TechnoTowerEXboss:
		cmpi.w	#$0800,(v_screenposx).w
		bhs.s	.cont	; >= $800, continue
		subq.b	#2,(Screen_event_routine).w

.cont:
		cmpi.w	#$0A00,(v_screenposx).w
		blo.s	.ret	; <= $A00, return
		jsr		FindFreeObj
		bne.s	.cont2
		move.l	#Obj_MechaSonic,address(a1) ; load Mecha Sonic
		st		(Boss_flag).w
		move.w	#$0B00,obX(a1)
		move.w	#$0008,obY(a1)

.cont2:
		move.b	#1,(f_lockscreen).w ; lock screen
		addq.b	#2,(Screen_event_routine).w
;		moveq	#plcid_Boss,d0
;		bra.w	AddPLC		; load boss patterns
; ===========================================================================

.ret:
		rts
; ===========================================================================

DLE_TechnoTowerEXend:
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

TechnoTower_Deform:
		move.w	(Camera_Y_pos_copy).w,d0	; 1/1
		lsr.w	#2,d0	; 1/4
		subi.w	#$60,d0	; moves the bg down this many pixels and limits it at the top
		bpl.s	.limitY
		moveq	#0,d0
	.limitY:
		move.w	d0,(Camera_Y_pos_BG_copy).w

		move.l	(Camera_X_pos_copy).w,d0
		lsr.l	#2,d0	; 1/4
		andi.l	#$3FFFFFF,d0	; Loop every $400 pixels (8 chunks)
		move.l	d0,(Camera_X_pos_BG_copy).w
		rts