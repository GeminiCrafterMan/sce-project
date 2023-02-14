; ---------------------------------------------------------------------------
; TTZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

TTZ1_ScreenInit:
		jsr	(Reset_TileOffsetPositionActual).w
		jmp	(Refresh_PlaneFull).w

; =============== S U B R O U T I N E =======================================

TTZ1_ScreenEvent:
		bra.w	TTZ_Refresh

DLE_TTZ:
		rts
; ===========================================================================

TTZ_Refresh:
		tst.b (Screen_event_flag).w
		bne.s	TTZ_RefreshPlane
		move.w	(Screen_shaking_flag+2).w,d0
		add.w	d0,(Camera_Y_pos_copy).w
		jmp	(DrawTilesAsYouMove).w
; ---------------------------------------------------------------------------

TTZ_RefreshPlane:
		clr.b	(Screen_event_flag).w
		jmp	(Refresh_PlaneScreenDirect).w

; =============== S U B R O U T I N E =======================================

TTZ1_BackgroundInit:
		bsr.w	TTZ_Deform
		jsr	(Reset_TileOffsetPositionEff).w
		jsr	(Refresh_PlaneFull).w
		bra.s	TTZ1_BackgroundEvent.deform

; =============== S U B R O U T I N E =======================================

TTZ1_BackgroundEvent:
		tst.b (Background_event_flag).w
		bne.s	TTZ1_Transition
		bsr.w	TTZ_Deform

.deform:
		lea	TTZ1_BGDeformArray(pc),a4
		lea	(H_scroll_table).w,a5
		jsr	(ApplyDeformation).w
		jmp	(ShakeScreen_Setup).w
; ---------------------------------------------------------------------------

TTZ1_Transition:
		st		(LastAct_end_flag).w
		tst.b	(LevResults_end_flag).w
		beq.w	.ret
	; a replication of S1's Sign_SonicRun & loc_EC70, without giant ring checks
		move.b	#1,(Ctrl_1_locked).w ; lock player's controls
		move.b	#1,(Ctrl_2_locked).w ; lock player's controls
		st		(Scroll_lock).w
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#3,d0
		lea		(LevelSizes).l,a1
		lea		(a1,d0.w),a1
		move.w	2(a1),d0
		addi.w	#128,d0
		move.w	d0,(Camera_max_X_pos).w
		clr.b	(Player_1+object_control).w
		clr.b	(Player_2+object_control).w
		move.w	#(button_right_mask<<8),(Ctrl_1_held_logical).w ; move Sonic to the right
		move.w	#(button_right_mask<<8),(Ctrl_2_held_logical).w ; move Tails to the right
		move.w	(Player_1+x_pos).w,d0
		move.w	(Camera_max_X_pos).w,d1
		addi.w	#$128,d1
		cmp.w	d1,d0
		bcs.s	.ret
		tst.l	(Player_2).w
		beq.s	.skipP2
		move.w	(Player_2+x_pos).w,d0	; make sure both are off-screen
		move.w	(Camera_max_X_pos).w,d1
		addi.w	#$128,d1
		cmp.w	d1,d0
		bcs.s	.ret
	.skipP2:
		cmpi.b	#1,(Current_act).w
		bge.w	.act2
		move.w	(Current_zone_and_act).w,d0
		addq.b	#1,d0
		jmp		(StartNewLevel).l

	.act2:
		move.w	#bytes_to_word(z_TTZ, 0),d0
		jmp		(StartNewLevel).l
	.ret:
		rts
; ---------------------------------------------------------------------------

TTZ1_BGDeformArray:
		dc.w $7FFF
; ---------------------------------------------------------------------------

TTZ_Deform:
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