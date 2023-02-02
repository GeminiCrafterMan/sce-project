; TODO: fix dis shit
Obj_Knuckles:
		; Load some addresses into registers
		; This is done to allow some subroutines to be
		; shared with Sonic/Knuckles.
		lea	(Distance_from_screen_top).w,a5
		cmpa.l	#Player_1,a0
		bne.s	.p2
		lea	(Top_speed_P1).w,a4
		lea	(v_Dust_P1).w,a6
		bra.s	.cont
	.p2:
		lea	(Top_speed_P2).w,a4
		lea	(v_Dust_P2).w,a6
	.cont:

	if GameDebug
		cmpa.l	#Player_1,a0
		bne.s	Knuckles_Normal
		tst.w	(Debug_placement_mode).w
		beq.s	Knuckles_Normal

; Debug only code
		cmpi.b	#1,(Debug_placement_type).w	; Are Sonic in debug object placement mode?
		jeq		DebugMode			; If so, skip to debug mode routine
		; By this point, we're assuming you're in frame cycling mode
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		clr.w	(Debug_placement_mode).w	; Leave debug mode
+		addq.b	#1,mapping_frame(a0)		; Next frame
		cmpi.b	#frK_Last,mapping_frame(a0)	; Have we reached the end of Sonic's frames?
		blo.s		+
		clr.b	mapping_frame(a0)	; If so, reset to Sonic's first frame
+		bsr.w	Player_Load_PLC
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

Knuckles_Normal:
	endif
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Knuckles_Index(pc,d0.w),d1
		jmp	Knuckles_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Knuckles_Index: offsetTable
		offsetTableEntry.w Knuckles_Init		; 0
		offsetTableEntry.w .control	; 2
		offsetTableEntry.w .hurt		; 4
		offsetTableEntry.w .death		; 6
		offsetTableEntry.w .restart	; 8
		offsetTableEntry.w .loc_12590		; A
		offsetTableEntry.w .drown		; C
.control:	jmp	Player_Control
.hurt:		jmp	Player_Hurt
.death:		jmp	Player_Death
.restart:	jmp	Player_Restart
.loc_12590:	jmp	loc_12590
.drown:		jmp	Player_Drown
; ---------------------------------------------------------------------------

Knuckles_Init:	; Routine 0
		addq.b	#2,routine(a0)				; => Obj01_Control
		move.w	#bytes_to_word(38/2,18/2),y_radius(a0)	; set y_radius and x_radius	; this sets Knuckles's collision height (2*pixels)
		move.w	#bytes_to_word(38/2,18/2),default_y_radius(a0)	; set default_y_radius and default_x_radius
		move.l	#Map_Knuckles,mappings(a0)
		move.w	#$100,priority(a0)
		move.w	#bytes_to_word(48/2,48/2),height_pixels(a0)		; set height and width
		move.b	#4,render_flags(a0)
		move.b	#c_Knuckles,character_id(a0)
		jmp		Sonic_Init.branchPoint

Knuckles_Control:
		movem.l	a4-a6,-(sp)
		moveq	#0,d0
		move.b	status(a0),d0
		andi.w	#6,d0
		move.w	Knuckles_Modes(pc,d0.w),d1
		jsr	Knuckles_Modes(pc,d1.w)	; run Knuckles's movement control code
		movem.l	(sp)+,a4-a6
		jmp		loc_10C26

; ---------------------------------------------------------------------------
; secondary states under state Player_Control
Knuckles_Modes: offsetTable
		offsetTableEntry.w Knuckles_MdNormal		; 0
		offsetTableEntry.w Knuckles_MdAir			; 2
		offsetTableEntry.w Knuckles_MdRoll		; 4
		offsetTableEntry.w Knuckles_MdJump		; 6
; ---------------------------------------------------------------------------
; On the ground
Knuckles_MdNormal:
		jmp	Sonic_MdNormal

; ---------------------------------------------------------------------------
; Mid-air but not rolling
Knuckles_MdAir:
		tst.b	double_jump_flag(a0)
		bne.s	Knuckles_MdAir_Gliding
		jmp	Sonic_MdAir

Knuckles_MdAir_Gliding:
		bsr.w	Knuckles_GlideSpeedControl
		jsr		Player_LevelBound
		jsr		SpeedToPos		  ; AKA	SpeedToPos in Sonic 1
		bsr.s	Knuckles_GlideControl

return_3156B8:
		rts
; =============== S U B	R O U T	I N E =======================================


Knuckles_GlideControl:

; FUNCTION CHUNK AT 00315C40 SIZE 0000003C BYTES

		move.b	double_jump_flag(a0),d0
		beq.s	return_3156B8
		cmp.b	#2,d0
		beq.w	Knuckles_FallingFromGlide
		cmp.b	#3,d0
		beq.w	Knuckles_Sliding
		cmp.b	#4,d0
		beq.w	Knuckles_Climbing_Wall
		cmp.b	#5,d0
		beq.w	Knuckles_Climbing_Up

Knuckles_NormalGlide:
		move.b	#$A,y_radius(a0)
		move.b	#$A,x_radius(a0)
		bsr.w	Knuckles_DoLevelCollision2
		btst	#5,(Gliding_collision_flags).w
		bne.w	Knuckles_BeginClimb
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
		btst	#1,(Gliding_collision_flags).w
		beq.s	Knuckles_BeginSlide
		jsr		GetCtrlHeldLogical
		andi.b	#button_B_mask|button_C_mask|button_A_mask,d0
		bne.w	sub_315C7C
		move.b	#2,double_jump_flag(a0)
		move.b	#id_Ability2,anim(a0)
		bclr	#0,status(a0)
		tst.w	x_vel(a0)
		bpl.s	loc_315736
		bset	#0,status(a0)

loc_315736:
		asr		x_vel(a0)
		asr		x_vel(a0)
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
		rts
; ---------------------------------------------------------------------------

Knuckles_BeginSlide:
		bclr	#0,status(a0)
		tst.w	x_vel(a0)
		bpl.s	loc_315762
		bset	#0,status(a0)

loc_315762:
		move.b	angle(a0),d0
		add.b	#$20,d0
		and.b	#$C0,d0
		beq.s	loc_315780
		move.w	ground_vel(a0),x_vel(a0)
		move.w	#0,y_vel(a0)
		bra.w	Player_TouchFloor_Check_Spindash
; ---------------------------------------------------------------------------

loc_315780:
		move.b	#3,double_jump_flag(a0)
		move.b	#frK_GlideSlide1,mapping_frame(a0)
		move.b	#$7F,anim_frame_timer(a0)
		move.b	#0,anim_frame(a0)
		cmp.b	#$C,air_left(a0)
		bcs.s	return_3157AC
		move.b	#6,routine(a6)
		move.b	#$15,mapping_frame(a6)

return_3157AC:
		rts
; ---------------------------------------------------------------------------

Knuckles_BeginClimb:
		cmpa.w	#Player_1,a0
		beq.s	.notSidekick
		tst.w	(Tails_CPU_idle_timer).w
		bne.w	loc_31587A
	.notSidekick:
		tst.b	(Disable_wall_grab).w
		bmi.w	loc_31587A
		move.b	lrb_solid_bit(a0),d5
		move.b	double_jump_property(a0),d0
		add.b	#$40,d0
		bpl.s	loc_3157D8
		bset	#0,status(a0)
		jsr	CheckLeftCeilingDist
		or.w	d0,d1
		bne.s	Knuckles_FallFromGlide
		addq.w	#1,x_pos(a0)
		bra.s	loc_3157E8
; ---------------------------------------------------------------------------

loc_3157D8:
		bclr	#0,status(a0)
		jsr		CheckRightCeilingDist
		or.w	d0,d1
		bne.w	loc_31586A

loc_3157E8:
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
		tst.b	(Super_Sonic_flag).w
		beq.s	loc_315804
		cmp.w	#$480,ground_vel(a0)
		bcs.s	loc_315804
		nop

loc_315804:
		move.w	#0,ground_vel(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.b	#4,double_jump_flag(a0)
		move.b	#frK_Climb1,mapping_frame(a0)
		move.b	#$7F,anim_frame_timer(a0)
		move.b	#0,anim_frame(a0)
		move.b	#3,double_jump_property(a0)
		move.w	x_pos(a0),x_sub(a0)
		sfx		sfx_Grab
		rts
; ---------------------------------------------------------------------------

Knuckles_FallFromGlide:
		move.w	x_pos(a0),d3
		move.b	y_radius(a0),d0
		ext.w	d0
		sub.w	d0,d3
		subq.w	#1,d3

loc_31584A:
		move.w	y_pos(a0),d2
		sub.w	#$B,d2
		jsr		ChkFloorEdge_Part2
		tst.w	d1
		bmi.s	loc_31587A
		cmp.w	#$C,d1
		bcc.s	loc_31587A
		add.w	d1,y_pos(a0)
		bra.w	loc_3157E8
; ---------------------------------------------------------------------------

loc_31586A:
		move.w	x_pos(a0),d3
		move.b	y_radius(a0),d0
		ext.w	d0
		add.w	d0,d3
		addq.w	#1,d3

		bra.s	loc_31584A
; ---------------------------------------------------------------------------

loc_31587A:
		move.b	#2,double_jump_flag(a0)
		move.b	#id_Ability2,anim(a0)
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
		bset	#1,(Gliding_collision_flags).w
		rts
; ---------------------------------------------------------------------------

Knuckles_FallingFromGlide:
		jsr		Player_ChgJumpDir
		add.w	#$38,y_vel(a0)
		btst	#6,status(a0)
		beq.s	loc_3158B2
		sub.w	#$28,y_vel(a0)

loc_3158B2:
		bsr.w	Knuckles_DoLevelCollision2
		btst	#1,(Gliding_collision_flags).w
		bne.s	return_315900
		move.w	#0,ground_vel(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.b	y_radius(a0),d0
		sub.b	#$13,d0
		ext.w	d0
		add.w	d0,y_pos(a0)
		move.b	angle(a0),d0
		add.b	#$20,d0
		and.b	#$C0,d0
		beq.s	loc_3158F0
		bra.w	Player_TouchFloor_Check_Spindash
; ---------------------------------------------------------------------------

loc_3158F0:
		bsr.w	Player_TouchFloor_Check_Spindash
		move.w	#$F,move_lock(a0)
		move.b	#id_Ability4,anim(a0)
		sfx		sfx_Land

return_315900:
		rts
; ---------------------------------------------------------------------------

Knuckles_Sliding:
		jsr		GetCtrlHeldLogical
		andi.b	#button_B_mask|button_C_mask|button_A_mask,d0
		beq.s	loc_315926
		tst.w	x_vel(a0)
		bpl.s	loc_31591E
		add.w	#$20,x_vel(a0)
		bmi.s	loc_31591C
		bra.s	loc_315926
; ---------------------------------------------------------------------------

loc_31591C:
		bra.s	loc_315958
; ---------------------------------------------------------------------------

loc_31591E:
		sub.w	#$20,x_vel(a0)
		bpl.s	loc_315958

loc_315926:
		move.w	#0,ground_vel(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.b	y_radius(a0),d0
		sub.b	#$13,d0
		ext.w	d0
		add.w	d0,y_pos(a0)
		bsr.w	Player_TouchFloor_Check_Spindash
		move.w	#$F,move_lock(a0)
		move.b	#id_Ability3,anim(a0)
		rts
; ---------------------------------------------------------------------------

loc_315958:
		move.b	#$A,y_radius(a0)
		move.b	#$A,x_radius(a0)
		bsr.w	Knuckles_DoLevelCollision2
		jsr		Player_CheckFloor
		cmp.w	#$E,d1
		bge.s	loc_315988
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
	; play slide sfx
		move.b	(Timer_frames+1).w,d0
		andi.b	#7,d0
		bne.s	+
		sfx		sfx_Slide
+		rts
; ---------------------------------------------------------------------------

loc_315988:
		move.b	#2,double_jump_flag(a0)
		move.b	#id_Ability2,anim(a0)
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
		bset	#1,(Gliding_collision_flags).w
		rts
; ---------------------------------------------------------------------------

Knuckles_Climbing_Wall:
		tst.b	(Disable_wall_grab).w
		bmi.w	loc_315BAE
		move.w	x_pos(a0),d0
		cmp.w	x_sub(a0),d0
		bne.w	loc_315BAE
		btst	#3,status(a0)
		bne.w	loc_315BAE
		move.w	#0,ground_vel(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.l	(Primary_collision_addr).w,(Collision_addr).w
		cmp.b	#$D,lrb_solid_bit(a0)
		beq.s	loc_3159F0
		move.l	(Secondary_collision_addr).w,(Collision_addr).w

loc_3159F0:
		move.b	lrb_solid_bit(a0),d5
		move.b	#$A,y_radius(a0)
		move.b	#$A,x_radius(a0)
		moveq	#0,d1
		jsr		GetCtrlHeldLogical
		btst	#button_up,d0
		beq.w	loc_315A76
		move.w	y_pos(a0),d2
		sub.w	#$B,d2
		bsr.w	sub_315C22
		cmp.w	#4,d1
		bge.w	Knuckles_ClimbUp	  ; Climb onto the floor above you
		tst.w	d1
		bne.w	loc_315B30
		move.b	lrb_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		subq.w	#8,d2
		move.w	x_pos(a0),d3
		bsr.w	sub_3192E6		  ; Doesn't exist in S2
		tst.w	d1
		bpl.s	loc_315A46
		sub.w	d1,y_pos(a0)
		moveq	#1,d1
		bra.w	loc_315B04
; ---------------------------------------------------------------------------

loc_315A46:
		subq.w	#1,y_pos(a0)
		tst.b	(Super_Sonic_flag).w
		beq.s	loc_315A54
		subq.w	#1,y_pos(a0)

loc_315A54:
		moveq	#1,d1
		move.w	(Camera_Min_Y_pos).w,d0
		cmp.w	#-$100,d0
		beq.w	loc_315B04
		add.w	#$10,d0
		cmp.w	y_pos(a0),d0
		ble.w	loc_315B04
		move.w	d0,y_pos(a0)
		bra.w	loc_315B04
; ---------------------------------------------------------------------------

loc_315A76:
		jsr		GetCtrlHeldLogical
		btst	#button_down,d0
		beq.w	loc_315B04
		cmp.b	#frK_Climb6+1,mapping_frame(a0)
		bne.s	loc_315AA2
		move.b	#frK_Climb1,mapping_frame(a0)
		addq.w	#3,y_pos(a0)
		subq.w	#3,x_pos(a0)
		btst	#0,status(a0)
		beq.s	loc_315AA2
		addq.w	#6,x_pos(a0)

loc_315AA2:
		move.w	y_pos(a0),d2
		add.w	#$B,d2
		bsr.w	sub_315C22
		tst.w	d1
		bne.w	loc_315BAE
		move.b	top_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		add.w	#9,d2
		move.w	x_pos(a0),d3
		bsr.w	sub_318FF6
		tst.w	d1
		bpl.s	loc_315AF4
	; victory animation code, stolen from delta
	; sorry man, i... wait, you already know why i was so mad,
	; i explained this to you
	.victory:
		add.w	d1,y_pos(a0)
		move.b	(Primary_Angle).w,angle(a0)
		move.w	#0,ground_vel(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		jmp		Player_TouchFloor_Check_Spindash
; ---------------------------------------------------------------------------

loc_315AF4:
		addq.w	#1,y_pos(a0)
		tst.b	(Super_Sonic_flag).w
		beq.s	loc_315B02
		addq.w	#1,y_pos(a0)

loc_315B02:
		moveq	#-1,d1

loc_315B04:
		jsr		GetCtrlHeldLogical
		andi.b	#button_right,d0	; ???
		bne.s	loc_16E34
		move.b	top_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		addi.w	#9,d2
		move.w	x_pos(a0),d3
		bsr.w	sub_318FF6
		tst.w	d1
		bmi.w	loc_315AA2.victory

loc_16E34:
		tst.w	d1
		beq.s	loc_315B30
		subq.b	#1,double_jump_property(a0)
		bpl.s	loc_315B30
		move.b	#3,double_jump_property(a0)
		add.b	mapping_frame(a0),d1
		jsr		GetCtrlHeldLogical
		btst	#button_up,d0
		bne.s	ClimbUpAni
		btst	#button_down,d0
		bne.s	ClimbDownAni
		bra.s	ResetAniClimb

	ClimbUpAni:
		cmp.b	#frK_Climb1,d1
		bcc.s	loc_315B22
		move.b	#frK_Climb6,d1
		bra.s	loc_315B2C

loc_315B22:
		cmp.b	#frK_Climb6,d1
		bls.s	loc_315B2C
		move.b	#frK_Climb1,d1
		bra.s	loc_315B2C

	ClimbDownAni:
		cmp.b	#frK_ClimbD1,d1
		bcs.s	loc_315B22_D
		move.b	#frK_ClimbD1,d1
		bra.s	loc_315B2C

loc_315B22_D:
		move.b	#frK_ClimbD2,d1
		bra.s	loc_315B2C

	ResetAniClimb:
		move.b	#frK_Climb1,d1

loc_315B2C:
		move.b	d1,mapping_frame(a0)

loc_315B30:
		move.b	#$20,anim_frame_timer(a0)
		move.b	#0,anim_frame(a0)
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
	; why the original code moved the held button as a word to d0
	; to accomplish the same thing, i will never know
		jsr		GetCtrlPressLogical
		andi.b	#button_B_mask|button_C_mask|button_A_mask,d0
		beq.s	return_315B94
		move.w	#$FC80,y_vel(a0)
		move.w	#$400,x_vel(a0)
		bchg	#0,status(a0)
		bne.s	loc_315B6A
		neg.w	x_vel(a0)

loc_315B6A:
		bset	#1,status(a0)
		move.b	#1,jumping(a0)
		move.b	#$E,y_radius(a0)
		move.b	#7,x_radius(a0)
		move.b	#id_Roll,anim(a0)
		bset	#2,status(a0)
		move.b	#0,double_jump_flag(a0)

return_315B94:
		rts
; ---------------------------------------------------------------------------

Knuckles_ClimbUp:
		move.b	#5,double_jump_flag(a0)		  ; Climb up to	the floor above	you
		cmp.b	#frK_Climb6+1,mapping_frame(a0)
		beq.s	return_315BAC
		move.b	#0,double_jump_property(a0)
		bsr.s	Knuckles_DoLedgeClimbingAnimation

return_315BAC:
		rts
; ---------------------------------------------------------------------------

loc_315BAE:
		move.b	#2,double_jump_flag(a0)
		move.b	#id_Ability2,anim(a0)
		move.b	#id_Ability2,next_anim(a0)
		move.b	#frK_GlideFall2,mapping_frame(a0)
		move.b	#7,anim_frame_timer(a0)
		move.b	#1,anim_frame(a0)
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
		rts
; End of function Knuckles_GlideControl


; =============== S U B	R O U T	I N E =======================================


Knuckles_DoLedgeClimbingAnimation:
		moveq	#0,d0
		move.b	double_jump_property(a0),d0
		lea	Knuckles_ClimbLedge_Frames(pc,d0.w),a1
		move.b	(a1)+,mapping_frame(a0)
		move.b	(a1)+,d0
		ext.w	d0
		btst	#0,status(a0)
		beq.s	loc_315BF6
		neg.w	d0

loc_315BF6:
		add.w	d0,x_pos(a0)
		move.b	(a1)+,d1
		ext.w	d1
		add.w	d1,y_pos(a0)
		move.b	(a1)+,anim_frame_timer(a0)
		addq.b	#4,double_jump_property(a0)
		move.b	#0,anim_frame(a0)
		rts
; End of function Knuckles_DoLedgeClimbingAnimation

; ---------------------------------------------------------------------------
; Strangely, the last frame uses frame frK_Idle2. It will never be seen, however,
; because it is immediately overwritten by Knuckles' waiting animation.

Knuckles_ClimbLedge_Frames:
	; mapping_frame, x_pos, y_pos, anim_frame_timer
	dc.b  frK_ClimbUp1,    3,   -3,    6
	dc.b  frK_ClimbUp2,    8,  -10,    6
	dc.b  frK_ClimbUp3,   -8,  -12,    6
	dc.b  frK_Idle2,    8,   -5,    6
Knuckles_ClimbLedge_Frames_End:	even

; =============== S U B	R O U T	I N E =======================================


sub_315C22:

; FUNCTION CHUNK AT 00319208 SIZE 00000020 BYTES
; FUNCTION CHUNK AT 003193D2 SIZE 00000024 BYTES

		move.b	lrb_solid_bit(a0),d5
		btst	#0,status(a0)
		bne.s	loc_315C36
		move.w	x_pos(a0),d3
		bra.w	loc_319208
; ---------------------------------------------------------------------------

loc_315C36:
		move.w	x_pos(a0),d3
		subq.w	#1,d3
		bra.w	loc_3193D2
; End of function sub_315C22

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR Knuckles_GlideControl

Knuckles_Climbing_Up:
		tst.b	anim_frame_timer(a0)
		bne.s	return_315C7A

		bsr.w	Knuckles_DoLedgeClimbingAnimation

		cmp.b	#Knuckles_ClimbLedge_Frames_End-Knuckles_ClimbLedge_Frames,double_jump_property(a0)
		bne.s	return_315C7A

		move.w	#0,ground_vel(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)

		btst	#0,status(a0)
		beq.s	loc_315C70
		subq.w	#1,x_pos(a0)

loc_315C70:
		bsr.w	Player_TouchFloor_Check_Spindash
		move.b	#id_Wait,anim(a0)

return_315C7A:
		rts
; END OF FUNCTION CHUNK	FOR Knuckles_GlideControl

; =============== S U B	R O U T	I N E =======================================


sub_315C7C:
		move.b	#$20,anim_frame_timer(a0)
		move.b	#0,anim_frame(a0)
		move.b	#id_Ability1,anim(a0)
		move.b	#id_Ability1,next_anim(a0)
		bclr	#5,status(a0)
		bclr	#0,status(a0)
		moveq	#0,d0
		move.b	double_jump_property(a0),d0
		add.b	#$10,d0
		lsr.w	#5,d0
		move.b	RawAni_Knuckles_GlideTurn(pc,d0.w),d1
		move.b	d1,mapping_frame(a0)
		cmp.b	#frK_Float5,d1
		bne.s	return_315CC0
		bset	#0,status(a0)
		move.b	#frK_Float1,mapping_frame(a0)

return_315CC0:
		rts
; End of function sub_315C7C

; ---------------------------------------------------------------------------
RawAni_Knuckles_GlideTurn:
		dc.b frK_Float1
		dc.b frK_Float2
		dc.b frK_Float3
		dc.b frK_Float4
		dc.b frK_Float5
		dc.b frK_Float4
		dc.b frK_Float3
		dc.b frK_Float2

; =============== S U B	R O U T	I N E =======================================


Knuckles_GlideSpeedControl:
		cmp.b	#1,double_jump_flag(a0)
		bne.w	loc_315D88
		move.w	ground_vel(a0),d0
		cmp.w	#$400,d0
		bcc.s	loc_315CE2
		addq.w	#8,d0
		bra.s	loc_315CFC
; ---------------------------------------------------------------------------

loc_315CE2:
		cmp.w	#$1800,d0
		bcc.s	loc_315CFC
		move.b	double_jump_property(a0),d1
		and.b	#$7F,d1
		bne.s	loc_315CFC
		addq.w	#4,d0
		tst.b	(Super_Sonic_flag).w
		beq.s	loc_315CFC
		addq.w	#8,d0

loc_315CFC:
		move.w	d0,ground_vel(a0)
		move.b	double_jump_property(a0),d0
		jsr		GetCtrlHeldLogical.d2
		btst	#button_left,d2
		beq.s	loc_315D1C
		cmp.b	#$80,d0
		beq.s	loc_315D1C
		tst.b	d0
		bpl.s	loc_315D18
		neg.b	d0

loc_315D18:
		addq.b	#2,d0
		bra.s	loc_315D3A
; ---------------------------------------------------------------------------

loc_315D1C:
		jsr		GetCtrlHeldLogical.d2
		btst	#button_right,d2
		beq.s	loc_315D30
		tst.b	d0
		beq.s	loc_315D30
		bmi.s	loc_315D2C
		neg.b	d0

loc_315D2C:
		addq.b	#2,d0
		bra.s	loc_315D3A
; ---------------------------------------------------------------------------

loc_315D30:
		move.b	d0,d1
		and.b	#$7F,d1
		beq.s	loc_315D3A
		addq.b	#2,d0

loc_315D3A:
		move.b	d0,double_jump_property(a0)
		move.b	double_jump_property(a0),d0
		jsr	CalcSine
		muls.w	ground_vel(a0),d1
		asr.l	#8,d1
		move.w	d1,x_vel(a0)
		cmp.w	#$80,y_vel(a0)
		blt.s	loc_315D62
		sub.w	#$20,y_vel(a0)
		bra.s	loc_315D68
; ---------------------------------------------------------------------------

loc_315D62:
		add.w	#$20,y_vel(a0)

loc_315D68:
		move.w	(Camera_Min_Y_pos).w,d0
		cmp.w	#-$100,d0
		beq.w	loc_315D88
		add.w	#$10,d0
		cmp.w	y_pos(a0),d0
		ble.w	loc_315D88
		asr	x_vel(a0)
		asr	ground_vel(a0)

loc_315D88:	; this is a copy of Player_ResetScr_Part2, except it doesn't continue into Player_UpdateSpeedOnGround
		cmp.w	#$60,(a5)
		beq.s	return_315D9A
		bcc.s	loc_315D96
		addq.w	#4,(a5)

loc_315D96:
		subq.w	#2,(a5)

return_315D9A:
		rts
; End of function Knuckles_GlideSpeedControl


Knuckles_CheckGlide:
		tst.b	double_jump_flag(a0)
		bne.w	return_3165D2

Knuckles_BeginGlide:
		bclr	#2,status(a0)
		move.b	#$A,y_radius(a0)
		move.b	#$A,x_radius(a0)
		bclr	#4,status(a0)
		move.b	#1,double_jump_flag(a0)
		add.w	#$200,y_vel(a0)
		bpl.s	loc_31659E
		move.w	#0,y_vel(a0)

loc_31659E: ; Momentum glide by ProjectFM for SHIMA
		moveq	#0,d1
		move.w	x_vel(a0),d0
		move.w	d0,d2
		add.w	#$100,d2
		cmpi.w	#$200,d2
		bls.s	.nomomentum
		move.w	d0,d2
		tst.w	d0
		bpl.s	loc_3165B4
		moveq	#-$80,d1
		neg.w	d0
		bra.s	loc_3165B4

.nomomentum:
		move.w	#$100,d0
		btst	#0,status(a0)
		beq.s	loc_3165B4
		neg.w	d2
		moveq	#-$80,d1

loc_3165B4:
		move.w	d0,ground_vel(a0)
		move.w	d2,x_vel(a0)
		move.b	d1,double_jump_property(a0)
		move.w	#0,angle(a0)
		move.b	#0,(Gliding_collision_flags).w
		bset	#1,(Gliding_collision_flags).w
		bsr.w	sub_315C7C

return_3165D2:
		rts
; End of function Knuckles_JumpHeight


; =============== S U B	R O U T	I N E =======================================


Knuckles_DoLevelCollision2:
		move.l	(Primary_collision_addr).w,(Collision_addr).w
		cmp.b	#$C,top_solid_bit(a0)
		beq.s	+
		move.l	(Secondary_collision_addr).w,(Collision_addr).w
+
		move.b	lrb_solid_bit(a0),d5
		move.w	x_vel(a0),d1
		move.w	y_vel(a0),d2
		jsr	CalcAngle
		sub.b	#$20,d0
		and.b	#$C0,d0
		cmp.b	#$40,d0
		beq.w	Knuckles_HitLeftWall2
		cmp.b	#$80,d0
		beq.w	Knuckles_HitCeilingAndWalls2
		cmp.b	#$C0,d0
		beq.w	Knuckles_HitRightWall2
		jsr	CheckLeftWallDist
		tst.w	d1
		bpl.s	+
		sub.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,(Gliding_collision_flags).w
+
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	+
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,(Gliding_collision_flags).w
+
		jsr	Player_CheckFloor
		tst.w	d1
		bpl.s	return_3169CC
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		move.w	#0,y_vel(a0)
		bclr	#1,(Gliding_collision_flags).w

return_3169CC:
		rts
; ---------------------------------------------------------------------------

Knuckles_HitLeftWall2:
		jsr	CheckLeftWallDist
		tst.w	d1
		bpl.s	Knuckles_HitCeilingAlt
		sub.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,(Gliding_collision_flags).w

Knuckles_HitCeilingAlt:
		jsr	Player_CheckCeiling
		tst.w	d1
		bpl.s	Knuckles_HitFloor
		neg.w	d1
		cmp.w	#$14,d1
		bcc.s	loc_316A08
		add.w	d1,y_pos(a0)
		tst.w	y_vel(a0)
		bpl.s	return_316A06
		move.w	#0,y_vel(a0)

return_316A06:
		rts
; ---------------------------------------------------------------------------

loc_316A08:
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	return_316A20
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,(Gliding_collision_flags).w

return_316A20:
		rts
; ---------------------------------------------------------------------------

Knuckles_HitFloor:
		tst.w	y_vel(a0)
		bmi.s	return_316A44
		jsr	Player_CheckFloor
		tst.w	d1
		bpl.s	return_316A44
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		move.w	#0,y_vel(a0)
		bclr	#1,(Gliding_collision_flags).w

return_316A44:
		rts
; ---------------------------------------------------------------------------

Knuckles_HitCeilingAndWalls2:
		jsr	CheckLeftWallDist
		tst.w	d1
		bpl.s	loc_316A5E
		sub.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,(Gliding_collision_flags).w

loc_316A5E:
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_316A76
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,(Gliding_collision_flags).w

loc_316A76:
		jsr	Player_CheckCeiling
		tst.w	d1
		bpl.s	return_316A88
		sub.w	d1,y_pos(a0)
		move.w	#0,y_vel(a0)

return_316A88:
		rts
; ---------------------------------------------------------------------------

Knuckles_HitRightWall2:
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_316AA2
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,(Gliding_collision_flags).w

loc_316AA2:
		jsr	Player_CheckCeiling
		tst.w	d1
		bpl.s	loc_316ABC
		sub.w	d1,y_pos(a0)
		tst.w	y_vel(a0)
		bpl.s	return_316ABA
		move.w	#0,y_vel(a0)

return_316ABA:
		rts
; ---------------------------------------------------------------------------

loc_316ABC:
		tst.w	y_vel(a0)
		bmi.s	return_316ADE
		jsr	Player_CheckFloor
		tst.w	d1
		bpl.s	return_316ADE
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		move.w	#0,y_vel(a0)
		bclr	#1,(Gliding_collision_flags).w

return_316ADE:
		rts
; End of function Knuckles_DoLevelCollision2

; =============== S U B	R O U T	I N E =======================================

; Doesn't exist in S2

sub_3192E6:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		sub.w	d0,d2
		eor.w	#$F,d2
		lea	(Primary_Angle).w,a4
		move.w	#-$10,a3
		move.w	#$800,d6
		jsr	FindFloor
		move.b	#$80,d2

loc_319306:
		jmp	loc_F81A
; End of function sub_3192E6

; =============== S U B	R O U T	I N E =======================================


sub_318FF6:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		add.w	d0,d2
		lea	(Primary_Angle).w,a4
		move.w	#$10,a3
		move.w	#0,d6
		jsr	FindFloor
		move.b	#0,d2
		jmp	loc_F81A
; End of function sub_318FF6

; ---------------------------------------------------------------------------
; This doesn't exist in S2...
; START	OF FUNCTION CHUNK FOR sub_315C22

loc_319208:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		add.w	d0,d3
		lea	(Primary_Angle).w,a4
		move.w	#$10,a3
		move.w	#0,d6
		jsr	FindWall
		move.b	#$C0,d2
		jmp	loc_F81A
; END OF FUNCTION CHUNK	FOR sub_315C22

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_315C22

loc_3193D2:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		sub.w	d0,d3
		eor.w	#$F,d3
		lea	(Primary_Angle).w,a4
		move.w	#$FFF0,a3
		move.w	#$400,d6
		jsr	FindWall
		move.b	#$40,d2
		jmp	loc_F81A
; END OF FUNCTION CHUNK	FOR sub_315C22

; ---------------------------------------------------------------------------
; Rolling
Knuckles_MdRoll:
		jmp	Sonic_MdRoll

; ---------------------------------------------------------------------------
; Mid-air and rolling
Knuckles_MdJump:
		jmp	Sonic_MdJump

; ---------------------------------------------------------------------------
Animate_Knuckles:
		lea	AniKnuckles(pc),a1
;		tst.b	(Super_Sonic_Knux_flag).w
;		beq.s	Animate_Knuckles_Part2
;		lea	(AniSuperKnuckles).l,a1
;
;Animate_Knuckles_Part2:
		moveq	#0,d0
		move.b	anim(a0),d0
		cmp.b	prev_anim(a0),d0
		beq.s	.Do
		move.b	d0,prev_anim(a0)
		clr.b	anim_frame(a0)
		clr.b	anim_frame_timer(a0)
		bclr	#Status_Push,status(a0)

.Do:
		add.w	d0,d0
		adda.w	(a1,d0.w),a1
		move.b	(a1),d0
		bmi.s	.WalkRun
		move.b	status(a0),d1
		andi.b	#1,d1
		andi.b	#-4,render_flags(a0)
		or.b	d1,render_flags(a0)
		subq.b	#1,anim_frame_timer(a0)
		bpl.s	.Delay
		move.b	d0,anim_frame_timer(a0)

.Do2:
		moveq	#0,d1
		move.b	anim_frame(a0),d1
		move.b	1(a1,d1.w),d0
		cmpi.b	#-4,d0
		bcc.s	.End_FF

.Next:
		move.b	d0,mapping_frame(a0)
		addq.b	#1,anim_frame(a0)

.Delay:
		rts
; ---------------------------------------------------------------------------

.End_FF:
		addq.b	#1,d0
		bne.s	.End_FE
		clr.b	anim_frame(a0)
		move.b	1(a1),d0
		bra.s	.Next
; ---------------------------------------------------------------------------

.End_FE:
		addq.b	#1,d0
		bne.s	.End_FD
		move.b	2(a1,d1.w),d0
		sub.b	d0,anim_frame(a0)
		sub.b	d0,d1
		move.b	1(a1,d1.w),d0
		bra.s	.Next
; ---------------------------------------------------------------------------

.End_FD:
		addq.b	#1,d0
		bne.s	.End
		move.b	2(a1,d1.w),anim(a0)

.End:
		rts
; ---------------------------------------------------------------------------

.WalkRun:
		addq.b	#1,d0
		bne.w	.loc_12A2A
		moveq	#0,d0
		tst.b	flip_type(a0)
		bmi.w	.Tumble
		move.b	flip_angle(a0),d0
		bne.w	.Tumble
		moveq	#0,d1
		move.b	angle(a0),d0
		bmi.s	.loc_126C8
		beq.s	.loc_126C8
		subq.b	#1,d0

.loc_126C8:
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	.loc_126D4
		not.b	d0

.loc_126D4:
		addi.b	#$10,d0
		bpl.s	.loc_126DC
		moveq	#3,d1

.loc_126DC:
		andi.b	#-4,render_flags(a0)
		eor.b	d1,d2
		or.b	d2,render_flags(a0)
		btst	#Status_Push,status(a0)
		bne.w	.Push
		lsr.b	#4,d0
		andi.b	#6,d0
		move.w	ground_vel(a0),d2
		bpl.s	.loc_12700
		neg.w	d2

.loc_12700:
		add.w	(HScroll_Shift).w,d2
		tst.b	status_secondary(a0)
		bpl.w	.loc_1270A
		add.w	d2,d2

.loc_1270A:
		; there WAS a super check here, but i don't care...
		lea	KnuxAni_Mach(pc),a1	; use mach speed animation
		cmpi.w	#$A00,d2
		bcc.s	.loc_12724
		lea	KnuxAni_Run(pc),a1 	; use running	animation
		cmpi.w	#$600,d2
		bcc.s	.loc_12724
		lea	KnuxAni_Walk(pc),a1 	; use walking animation
		add.b	d0,d0

.loc_12724:
		add.b	d0,d0
		move.b	d0,d3
		moveq	#0,d1
		move.b	anim_frame(a0),d1
		move.b	1(a1,d1.w),d0
		cmpi.b	#-1,d0
		bne.s	.loc_12742
		clr.b	anim_frame(a0)
		move.b	1(a1),d0

.loc_12742:
		move.b	d0,mapping_frame(a0)
		add.b	d3,mapping_frame(a0)
		subq.b	#1,anim_frame_timer(a0)
		bpl.s	.ret
		neg.w	d2
		addi.w	#$800,d2
		bpl.s	.loc_1275A
		moveq	#0,d2

.loc_1275A:
		lsr.w	#8,d2
		move.b	d2,anim_frame_timer(a0)
		addq.b	#1,anim_frame(a0)

.ret:
		rts
; ---------------------------------------------------------------------------

.Tumble:
		move.b	flip_type(a0),d1
		andi.w	#$7F,d1
		bne.w	.loc_12872
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	.Tumble_Left
	.Tumble_Right:
		andi.b	#-4,render_flags(a0)
		tst.b	flip_type(a0)
		bpl.s	.loc_12806
		ori.b	#2,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		bra.s	.loc_1280A
; ---------------------------------------------------------------------------

.loc_12806:
		addi.b	#$B,d0

.loc_1280A:
		divu.w	#$16,d0
		addi.b	#frK_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.Tumble_Left:
		andi.b	#-4,render_flags(a0)
		ori.b	#3,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		divu.w	#$16,d0
		addi.b	#frK_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.byte_1286E:
		dc.b frK_Null
		dc.b frK_TumbleStand1
		dc.b frK_TumbleHCylinder1
		dc.b frK_TumbleHCylinder1
; ---------------------------------------------------------------------------

.loc_12872:
		move.b	.byte_1286E(pc,d1.w),d3
		cmpi.b	#1,d1
		bne.s	.loc_128CA
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	.loc_128A8
		andi.b	#-4,render_flags(a0)
		addi.b	#-8,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_128A8:
		andi.b	#-4,render_flags(a0)
		ori.b	#1,render_flags(a0)
		addi.b	#-8,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_128CA:
		cmpi.b	#2,d1
		bne.s	.loc_12920
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	.loc_128FC
		andi.b	#-4,render_flags(a0)
		addi.b	#$B,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_128FC:
		andi.b	#-4,render_flags(a0)
		ori.b	#3,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_12920:
		cmpi.b	#3,d1
		bne.s	.loc_1297C
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	.loc_1295A
		andi.b	#-4,render_flags(a0)
		ori.b	#2,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_1295A:
		andi.b	#-4,render_flags(a0)
		ori.b	#1,render_flags(a0)
		addi.b	#$B,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_1297C:
		cmpi.b	#4,d1
		bne.s	.loc_129F6
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	.loc_129BC
		andi.b	#-4,render_flags(a0)
		tst.b	flip_type(a0)
		bpl.s	.loc_129A4
		addi.b	#$B,d0
		bra.s	.loc_129A8
; ---------------------------------------------------------------------------

.loc_129A4:
		addi.b	#$B,d0

.loc_129A8:
		divu.w	#$16,d0
		addi.b	#frK_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_129BC:
		andi.b	#-4,render_flags(a0)
		tst.b	flip_type(a0)
		bpl.s	.loc_129D6
		ori.b	#3,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		bra.s	.loc_129E2
; ---------------------------------------------------------------------------

.loc_129D6:
		ori.b	#3,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0

.loc_129E2:
		divu.w	#$16,d0
		addi.b	#frK_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_129F6:
		move.b	flip_angle(a0),d0
		andi.b	#-4,render_flags(a0)
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		beq.s	.loc_12A12
		ori.b	#1,render_flags(a0)

.loc_12A12:
		addi.b	#$B,d0
		divu.w	#$16,d0
		addi.b	#frK_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_12A2A:
		move.b	status(a0),d1
		andi.b	#1,d1
		andi.b	#-4,render_flags(a0)
		or.b	d1,render_flags(a0)
		subq.b	#1,anim_frame_timer(a0)
		bpl.w	.Delay
		move.w	ground_vel(a0),d2
		bpl.s	.loc_12A4C
		neg.w	d2

.loc_12A4C:
		add.w	(HScroll_Shift).w,d2
		lea	KnuxAni_Roll2(pc),a1
		cmpi.w	#$600,d2
		bcc.s	.loc_12A5E
		lea	KnuxAni_Roll(pc),a1

.loc_12A5E:
		neg.w	d2
		addi.w	#$400,d2
		bpl.s	.loc_12A68
		moveq	#0,d2

.loc_12A68:
		lsr.w	#8,d2
		move.b	d2,anim_frame_timer(a0)
		bra.w	.Do2
; ---------------------------------------------------------------------------

.Push:
		subq.b	#1,anim_frame_timer(a0)
		bpl.w	.Delay
		move.w	ground_vel(a0),d2
		bmi.s	.loc_12A82
		neg.w	d2

.loc_12A82:
		addi.w	#$800,d2
		bpl.s	.loc_12A8A
		moveq	#0,d2

.loc_12A8A:
		lsr.w	#6,d2
		move.b	d2,anim_frame_timer(a0)
		lea	KnuxAni_Push(pc),a1
		bra.w	.Do2

; ===========================================================================
; ---------------------------------------------------------------------------
; Knuckles animation, mapping, and PLC data
; ---------------------------------------------------------------------------

		include "Objects/Player Characters/Object Data/Anim - Knuckles.asm"
		include "Objects/Player Characters/Object Data/Map - Knuckles.asm"
		include "Objects/Player Characters/Object Data/Knuckles pattern load cues.asm"