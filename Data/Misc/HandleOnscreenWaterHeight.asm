; ---------------------------------------------------------------------------
; Water handle
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Handle_Onscreen_Water_Height:
		tst.b	(Water_flag).w							; does level have water?
		beq.s	.return								; if not, branch
		tst.b	(Deform_lock).w
		bne.s	.skip
		cmpi.b	#id_SonicDeath,(Player_1+routine).w	; is player dead?
		bhs.s	.skip								; if yes, branch
		bsr.s	DynamicWaterHeight

.skip
		clr.b	(Water_full_screen_flag).w
		moveq	#0,d0
		move.b	(Oscillating_Data).w,d0
		lsr.w	d0
		add.w	(Mean_water_level).w,d0
		move.w	d0,(Water_level).w

		; calculate distance between water surface and top of screen
		move.w	(Water_level).w,d0
		sub.w	(Camera_Y_pos).w,d0
		beq.s	.set
		bhs.s	.check
		tst.w	d0
		bpl.s	.check

.set
		st	(Water_full_screen_flag).w
		st	(H_int_counter).w	; set 256-1
		rts
; ---------------------------------------------------------------------------

.check
		cmpi.w	#224-1,d0
		blo.s		.counter
		move.w	#256-1,d0

.counter
		move.b	d0,(H_int_counter).w

.return
		rts

; =============== S U B R O U T I N E =======================================

DynamicWaterHeight:
		movea.l	(Level_data_addr_RAM.WaterResize).w,a0
		jsr	(a0)
		moveq	#0,d1
		move.b	(Water_speed).w,d1
		move.w	(Target_water_level).w,d0
		sub.w	(Mean_water_level).w,d0
		beq.s	No_WaterResize
		bhs.s	.skip
		neg.w	d1

.skip
		add.w	d1,(Mean_water_level).w

No_WaterResize:
		rts

StartLevelWater:
		st	(Water_flag).w

		tst.b	(Water_flag).w
		beq.s	LoadWaterPalette
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#5,d0
		move.w	StartingWaterHeights(pc,d0.w),d0
		cmpi.w	#$1000,d0
		bne.s	.keepWaterOn
		clr.b	(Water_flag).w
	.keepWaterOn:
		move.w	d0,(Water_level).w
		move.w	d0,(Mean_water_level).w
		move.w	d0,(Target_water_level).w
		clr.b	(Water_entered_counter).w
		clr.b	(Water_full_screen_flag).w
		move.b	#1,(Water_speed).w

LoadWaterPalette:
		tst.b	(Water_flag).w
		beq.s	.ret
		jmp		loadWaterShift
	.ret:
		rts
; ---------------------------------------------------------------------------

StartingWaterHeights:
	rept 4
		dc.w $1000	; GHZ 1-4
	endr
		dc.w $1000	; SSLZ 1
		dc.w $C80	; SSLZ 2
		dc.w $390	; SSLZ 3
		dc.w $1000	; SSLZ 4
	rept 4
		dc.w $1000	; TTPZ 1-4
	endr
	rept 4
		dc.w $1000	; CCZ 1-4
	endr
	rept 4
		dc.w $1000	; MMZ 1-4
	endr
		dc.w $500	; DEZ 1
		dc.w $480	; DEZ 2
		dc.w $400	; DEZ 3
		dc.w $380	; DEZ 4
		dc.w $500	; TTZ 1
		dc.w $88	; TTZ 2
		dc.w $328	; TTZ 3
		dc.w $900	; TTZ 4

		zonewarning StartingWaterHeights,(2*4)