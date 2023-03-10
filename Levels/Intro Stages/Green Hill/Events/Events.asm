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
		cmpi.b	#id_TitleScreen,(Game_mode).w
		beq.w	DLE_GHZ1main.ret
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
.index:	dc.w DLE_GHZ1main-.index
		dc.w DLE_GHZ1boss-.index
		dc.w DLE_GHZ1end-.index
; ===========================================================================

DLE_GHZ1main:
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

DLE_GHZ1boss:
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

DLE_GHZ1end:
		move.w	(v_screenposx).w,(Camera_min_X_pos).w
		rts
; ===========================================================================

DLE_GHZEX:
		moveq	#0,d0
		move.b	(Screen_event_routine).w,d0
		move.w	.index(pc,d0.w),d0
		jmp	.index(pc,d0.w)
; ===========================================================================
.index:	dc.w DLE_GHZEXmain-.index
		dc.w DLE_GHZEXboss-.index
		dc.w DLE_GHZEXend-.index
; ===========================================================================

DLE_GHZEXmain:
		move.w	#$300,(Camera_target_max_Y_pos).w ; set lower y-boundary
		cmpi.w	#$1780,(v_screenposx).w ; has the camera reached $1780 on x-axis?
		bcs.s	.ret	; if not, branch
		move.w	#$400,(Camera_target_max_Y_pos).w ; set lower y-boundary
		cmpi.w	#$2500,(v_screenposx).w	; has camera reached the start of act 2?
		bcs.s	.ret
		move.w	#$500,(Camera_target_max_Y_pos).w
		cmpi.w	#$33D0,(v_screenposx).w
		bcs.s	.ret
		move.w	#$400,(Camera_target_max_Y_pos).w
		cmpi.w	#$3B00,(v_screenposx).w
		bcs.s	.ret
		move.w	#$600,(Camera_target_max_Y_pos).w
		cmpi.w	#$4260,(v_screenposx).w
		bcs.s	.ret
	; act 3
		move.w	#$500,(Camera_target_max_Y_pos).w
		cmpi.w	#$4780,(v_screenposx).w
		bcs.s	.ret
		move.w	#$510,(Camera_target_max_Y_pos).w
		cmpi.w	#$4D60,(v_screenposx).w
		bcs.s	.ret
		cmpi.w	#$480,(v_screenposy).w
		bcs.s	.cont2
		move.w	#$600,(Camera_target_max_Y_pos).w
		cmpi.w	#$5780,(v_screenposx).w
		bcc.s	.cont
		move.w	#$6C0,(Camera_target_max_Y_pos).w
		move.w	#$6C0,(Camera_max_Y_pos).w

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

DLE_GHZEXboss:
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

DLE_GHZEXend:
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
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.w	GHZ_Deform
		bra.w	GHZ1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

GHZ1_BGDeformArray:
		dc.w 32	; clouds 1 (2 blocks)
		dc.w 16	; clouds 2 (1 block)
		dc.w 16	; clouds 3 (1 block)
		dc.w 48	; mountains 1 (3 blocks)
		dc.w 40	; mountains 2 (2.5 blocks)
	rept 104
		dc.w 1	; water (6.5 blocks, linear... may have to just dc.w 1 104 times)
	endr
		dc.w $7FFF
; ---------------------------------------------------------------------------

GHZ_Deform:
	; Vertical scrolling!!
		move.w	(Camera_Y_pos_copy).w,d0
		andi.w	#$7FF,d0
		lsr.w	#5,d0
		neg.w	d0
		addi.w	#$20,d0
		bpl.s	.limitY
		moveq	#0,d0
	.limitY:
		move.w	d0,d4
		move.w	d0,(Camera_Y_pos_BG_copy).w
	; It's good!!
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

	; Mountains
		move.l	d0,d2
		asr.l	#6,d2
		swap	d2
		move.w	d2,(a1)+

		move.l	d0,d2
		asr.l	#5,d2
		swap	d2
		move.w	d2,(a1)+
	; Ocean
		move.w	(Camera_X_pos_BG_copy).w,d0
		move.w	(Camera_X_pos_copy).w,d2
		andi.w	#$FFF,d0
		andi.w	#$FFF,d2
		sub.w	d0,d2
		ext.l	d2
		asl.l	#8,d2
		divs.w	#$68,d2
		ext.l	d2
		asl.l	#8,d2
		moveq	#0,d3
		move.w	d0,d3
		move.w	#$47,d1
		add.w	d4,d1
	.waterLoop:			; water deformation
		move.w	d3,d0
		move.w	d0,(a1)+
		swap	d3
		add.l	d2,d3
		swap	d3
		dbf	d1,.waterLoop
		rts
