; ---------------------------------------------------------------------------
; TTZ events
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

TTZ1_ScreenInit:
		cmpi.b	#3,(Current_act).w
		bne.s	.notAct4
		move.w	#$7FF,(Screen_Y_wrap_value).w
		move.w	#$7F0,(Camera_Y_pos_mask).w
		move.w	#$3C,(Layout_row_index_mask).w		; We're in a looping level!
	.notAct4:
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
		beq.s	.ret
		jmp		Transition_Generic
	.ret:
		bsr.s	TTZ_Deform
		bra.s	TTZ1_BackgroundEvent.deform
; ---------------------------------------------------------------------------

TTZ1_BGDeformArray:
		dc.w $7FFF
; ---------------------------------------------------------------------------

TTZ_Deform:
	; Vertical scrolling!!
		move.w	(Camera_Y_pos_copy).w,d0
;		andi.w	#$7FF,d0	; used to be $7FF
;		lsr.w	#5,d0
;		neg.w	d0
;		addi.w	#$20,d0
;		bpl.s	.limitY
;		moveq	#0,d0
;	.limitY:
;		move.w	d0,d4
		move.w	d0,(Camera_Y_pos_BG_copy).w
	; It's good!!
		lea	(H_scroll_table).w,a1
		move.l	(Camera_X_pos_copy).w,d0
		move.l	d0,d2
		swap	d2
		asr.l	#1,d2
		move.w	d2,(a1)+
		rts
; ---------------------------------------------------------------------------

DWE_TTZ:
		moveq	#0,d0
		move.b	(Current_act).w,d0
		add.w	d0,d0
		move.w	.index(pc,d0.w),d0
		jsr	.index(pc,d0.w)
		moveq	#0,d1
		move.b	(Water_on).w,d1
		move.w	(Target_water_level).w,d0
		sub.w	(Mean_water_level).w,d0
		beq.s	.exit		; if water level is correct, branch
		bcc.s	.movewater	; if water level is too high, branch
		neg.w	d1		; set water to move up instead

.movewater:
		add.w	d1,(Mean_water_level).w ; move water up/down

.exit:
		rts	
; ===========================================================================
.index:	dc.w .exit-.index
		dc.w DWE_TTZ2-.index
		dc.w DWE_TTZ3-.index
		dc.w DWE_TTZ4-.index
; ===========================================================================

DWE_TTZ2:
		move.w	(Camera_X_pos).w,d0
		move.b	(WaterEvent_routine).w,d2
		bne.s	.routine2
		move.w	#$B8,d1		; water height
		cmpi.w	#$600,d0	; has screen reached next position?
		bcs.s	.setwater	; if not, branch
		move.w	#$108,d1
		cmpi.w	#$200,(Player_1+y_pos).w ; is Sonic above $200 y-axis?
		bcs.s	.sonicishigh	; if yes, branch
		cmpi.w	#$C00,d0
		bcs.s	.setwater
		move.w	#$318,d1
		cmpi.w	#$1080,d0
		bcs.s	.setwater
		move.b	#$80,(Level_trigger_array+5).w
		move.w	#$5C8,d1
		cmpi.w	#$1380,d0
		bcs.s	.setwater
		move.w	#$3A8,d1
		cmp.w	(Mean_water_level).w,d1 ; has water reached last height?
		bne.s	.setwater	; if not, branch
		move.b	#1,(WaterEvent_routine).w ; use second routine next

.setwater:
		move.w	d1,(Target_water_level).w
		rts	
; ===========================================================================

.sonicishigh:
		cmpi.w	#$C80,d0
		bcs.s	.setwater
		move.w	#$E8,d1
		cmpi.w	#$1500,d0
		bcs.s	.setwater
		move.w	#$108,d1
		bra.s	.setwater
; ===========================================================================

.routine2:
		subq.b	#1,d2
		bne.s	.skip
		cmpi.w	#$2E0,(Player_1+y_pos).w ; is Sonic above $2E0 y-axis?
		bcc.s	.skip		; if not, branch
		move.w	#$3A8,d1
		cmpi.w	#$1300,d0
		bcs.s	.setwater2
		move.w	#$108,d1
		move.b	#2,(WaterEvent_routine).w

.setwater2:
		move.w	d1,(Target_water_level).w

.skip:
		rts	
; ===========================================================================

DWE_TTZ3:
		move.w	(Camera_X_pos).w,d0
		move.w	#$328,d1
		cmpi.w	#$500,d0
		bcs.s	.setwater
		move.w	#$3C8,d1
		cmpi.w	#$B00,d0
		bcs.s	.setwater
		move.w	#$428,d1

.setwater:
		move.w	d1,(Target_water_level).w
		rts	
; ===========================================================================

DWE_TTZ4:
		move.w	(Camera_X_pos).w,d0
		move.b	(WaterEvent_routine).w,d2
		bne.s	.routine2

		move.w	#$900,d1
		cmpi.w	#$600,d0	; has screen reached position?
		bcs.s	.setwaterlz3	; if not, branch
		cmpi.w	#$3C0,(Player_1+y_pos).w
		bcs.s	.setwaterlz3
		cmpi.w	#$600,(Player_1+y_pos).w ; is Sonic in a y-axis range?
		bcc.s	.setwaterlz3	; if not, branch

		move.w	#$4C8,d1	; set new water height
;		move.l	#Level_LZ3,(v_lvllayoutfg).w ; MJ: Set normal version of act 3's layout to be read
		move.b	#1,(WaterEvent_routine).w ; use second routine next
;		move.w	#sfx_Rumbling,d0
;		bsr.w	PlaySound_Special ; play sound $B7 (rumbling)

.setwaterlz3:
		move.w	d1,(Target_water_level).w
		move.w	d1,(Mean_water_level).w ; change water height instantly
		rts	
; ===========================================================================

.routine2:
		subq.b	#1,d2
		bne.s	.routine3
		move.w	#$4C8,d1
		cmpi.w	#$770,d0
		bcs.s	.setwater2
		move.w	#$308,d1
		cmpi.w	#$1400,d0
		bcs.s	.setwater2
		cmpi.w	#$508,(Target_water_level).w
		beq.s	.sonicislow
		cmpi.w	#$600,(Player_1+y_pos).w ; is Sonic below $600 y-axis?
		bcc.s	.sonicislow	; if yes, branch
		cmpi.w	#$280,(Player_1+y_pos).w
		bcc.s	.setwater2

.sonicislow:
		move.w	#$508,d1
		move.w	d1,(Mean_water_level).w
		cmpi.w	#$1770,d0
		bcs.s	.setwater2
		move.b	#2,(WaterEvent_routine).w

.setwater2:
		move.w	d1,(Target_water_level).w
		rts	
; ===========================================================================

.routine3:
		subq.b	#1,d2
		bne.s	.routine4
		move.w	#$508,d1
		cmpi.w	#$1860,d0
		bcs.s	.setwater3
		move.w	#$188,d1
		cmpi.w	#$1AF0,d0
		bcc.s	.loc_3DC6
		cmp.w	(Mean_water_level).w,d1
		bne.s	.setwater3

.loc_3DC6:
		move.b	#3,(WaterEvent_routine).w

.setwater3:
		move.w	d1,(Target_water_level).w
		rts	
; ===========================================================================

.routine4:
		subq.b	#1,d2
		bne.s	.routine5
		move.w	#$188,d1
		cmpi.w	#$1AF0,d0
		bcs.s	.setwater4
		move.w	#$900,d1
		cmpi.w	#$1BC0,d0
		bcs.s	.setwater4
		move.b	#4,(WaterEvent_routine).w
		move.w	#$608,(Target_water_level).w
		move.w	#$7C0,(Mean_water_level).w
		move.b	#1,(Level_trigger_array+8).w
		rts	
; ===========================================================================

.setwater4:
		move.w	d1,(Target_water_level).w
		move.w	d1,(Mean_water_level).w
		rts	
; ===========================================================================

.routine5:
		cmpi.w	#$1E00,d0	; has screen passed final position?
		bcs.s	.dontset	; if not, branch
		move.w	#$128,(Target_water_level).w

.dontset:
		rts	