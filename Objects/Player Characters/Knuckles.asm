Obj_Knuckles:
		; Load some addresses into registers
		; This is done to allow some subroutines to be
		; shared with other characters.
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
+		jsr		Player_Load_PLC
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
		bsr.w	Knuckles_Move_Glide
		jsr		Player_LevelBound
		jsr	(MoveSprite2).l	; MoveSprite2_TestGravity, originally SpeedToPos
		bsr.s	Knuckles_Glide

return_3156B8:
		rts
; =============== S U B	R O U T	I N E =======================================


Knuckles_Glide:
		move.b	double_jump_flag(a0),d0
		beq.s	return_3156B8
		cmp.b	#2,d0
		beq.w	Knuckles_Fall_From_Glide
		cmp.b	#3,d0
		beq.w	Knuckles_Sliding
		cmp.b	#4,d0
		beq.w	Knuckles_Wall_Climb
		cmp.b	#5,d0
		beq.w	Knuckles_Climb_Ledge

		; This function updates 'Gliding_collision_flags'.
		bsr.w	Knux_DoLevelCollision_CheckRet

		btst	#Status_InAir,(Gliding_collision_flags).w
		beq.s	Knux_Gliding_HitFloor

		btst	#Status_Push,(Gliding_collision_flags).w
		bne.w	Knuckles_Gliding_HitWall

		jsr		GetCtrlHeldLogical
		andi.b	#button_B_mask|button_C_mask|button_A_mask,d0
		bne.s	.continueGliding

		; The player has let go of the jump button, so exit the gliding state
		; and enter the falling state.
		move.b	#2,double_jump_flag(a0)
		move.b	#id_Ability2,anim(a0)
		bclr	#Status_Facing,status(a0)
		tst.w	x_vel(a0)
		bpl.s	.skip1
		bset	#Status_Facing,status(a0)

.skip1:
		; Divide Knuckles' X velocity by 4.
		asr.w	x_vel(a0)
		asr.w	x_vel(a0)

		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius

		rts
; ---------------------------------------------------------------------------
; loc_1690A:
.continueGliding:
		bra.w	Knuckles_Set_Gliding_Animation
; ---------------------------------------------------------------------------

Knux_Gliding_HitFloor:
		bclr	#Status_Facing,status(a0)
		tst.w	x_vel(a0)
		bpl.s	loc_315762
		bset	#Status_Facing,status(a0)

loc_315762:
		move.b	angle(a0),d0
		add.b	#$20,d0
		and.b	#$C0,d0
		beq.s	loc_315780
		move.w	ground_vel(a0),x_vel(a0)
		clr.w	y_vel(a0)
		jmp		Player_TouchFloor_Check_Spindash
; ---------------------------------------------------------------------------

loc_315780:
		move.b	#3,double_jump_flag(a0)
		move.b	#frK_GlideSlide1,mapping_frame(a0)
		move.b	#$7F,anim_frame_timer(a0)
		clr.b	anim_frame(a0)
		cmp.b	#$C,air_left(a0)
		bcs.s	return_3157AC
		move.b	#6,routine(a6)
		move.b	#$15,mapping_frame(a6)

return_3157AC:
		rts
; ---------------------------------------------------------------------------

Knuckles_Gliding_HitWall:
		cmpa.w	#Player_1,a0
		beq.s	.notSidekick
		tst.w	(Tails_CPU_idle_timer).w
		bne.w	.fail
	.notSidekick:
		tst.b	(Disable_wall_grab).w
		bmi.w	.fail
		move.b	lrb_solid_bit(a0),d5
		move.b	double_jump_property(a0),d0
		add.b	#$40,d0
		bpl.s	.right
		bset	#Status_Facing,status(a0)
		jsr	CheckLeftCeilingDist
		or.w	d0,d1
		bne.s	.checkFloorLeft
		addq.w	#1,x_pos(a0)
		bra.s	.success
; ---------------------------------------------------------------------------

.right:
		bclr	#Status_Facing,status(a0)

		jsr		CheckRightCeilingDist
		or.w	d0,d1
		bne.w	.checkFloorRight
; loc_169A6:
.success:
		moveq	#signextendB(sfx_Grab),d0

		; If Hyper Knuckles glides into a wall at a high-enough
		; speed, then make the screen shake and harm all enemies
		; on-screen.
		tst.b	(Super_Sonic_Knux_flag).w
		bpl.s	.noQuake

		cmpi.w	#$480,ground_vel(a0)
		blo.s	.noQuake

		move.w	#$14,(Glide_screen_shake).w
		jsr		HyperAttackTouchResponse
		moveq	#signextendB(sfx_Thump),d0
		move.b	#1,(v_Invincibility_stars+anim).w	; This causes the screen flash, and sparks to come out of Sonic

; loc_169C2:
.noQuake:
		jsr	(Play_SFX).l
		clr.w	ground_vel(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)
		move.b	#4,double_jump_flag(a0)
		move.b	#frK_Climb1,mapping_frame(a0)
		move.b	#$7F,anim_frame_timer(a0)
		clr.b	anim_frame(a0)
		move.b	#3,double_jump_property(a0)
		move.w	x_pos(a0),x_sub(a0)
		rts
; ---------------------------------------------------------------------------
; loc_16A00:
.checkFloorLeft:
		; This adds the Y radius to the X coordinate...
		; This appears to be a bug, but, luckily, the X and Y radius are both
		; 10, so this is harmless.
		move.w	x_pos(a0),d3
		move.b	y_radius(a0),d0
		ext.w	d0
		sub.w	d0,d3
		subq.w	#1,d3

		tst.b	(Reverse_gravity_flag).w
		bne.s	.reverseGravity
; loc_16A14:
.checkFloorCommon:
		move.w	y_pos(a0),d2
		subi.w	#11,d2
		jsr	(ChkFloorEdge_Part3).l

		tst.w	d1
		bmi.s	.fail
		cmpi.w	#12,d1
		bhs.s	.fail
		add.w	d1,y_pos(a0)
		bra.w	.success
; ---------------------------------------------------------------------------
; loc_16A34:
.reverseGravity:
		move.w	y_pos(a0),d2
		addi.w	#11,d2
		eori.w	#$F,d2
		jsr	(ChkFloorEdge_ReverseGravity_Part2).l

		tst.w	d1
		bmi.s	.fail
		cmpi.w	#12,d1
		bhs.s	.fail
		sub.w	d1,y_pos(a0)
		bra.w	.success
; ---------------------------------------------------------------------------
; loc_16A58:
.checkFloorRight:
		; This adds the Y radius to the X coordinate...
		; This appears to be a bug, but, luckily, the X and Y radius are both
		; 10, so this is harmless.
		move.w	x_pos(a0),d3
		move.b	y_radius(a0),d0
		ext.w	d0
		add.w	d0,d3
		addq.w	#1,d3

		tst.b	(Reverse_gravity_flag).w
		bne.s	Knuckles_Gliding_HitWall.reverseGravity

		bra.s	.checkFloorCommon
; ---------------------------------------------------------------------------
; loc_16A6E:
.fail:
		move.b	#2,double_jump_flag(a0)
		move.b	#id_Ability2,anim(a0)
		move.b	default_y_radius(a0),y_radius(a0)
		move.b	default_x_radius(a0),x_radius(a0)
		bset	#Status_InAir,(Gliding_collision_flags).w
		rts
; ---------------------------------------------------------------------------

Knuckles_Fall_From_Glide:
		jsr		Player_ChgJumpDir

		; Apply gravity.
		addi.w	#$38,y_vel(a0)

		; Fall slower when underwater.
		btst	#Status_Underwater,status(a0)
		beq.s	.skip1
		subi.w	#$28,y_vel(a0)

.skip1:
		; This function updates 'Gliding_collision_flags'.
		bsr.w	Knux_DoLevelCollision_CheckRet

		btst	#Status_InAir,(Gliding_collision_flags).w
		bne.s	.return

		; Knuckles has touched the ground.
		clr.w	ground_vel(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)

		move.b	y_radius(a0),d0
		sub.b	default_y_radius(a0),d0
		ext.w	d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	.skip2
		neg.w	d0

.skip2:
		add.w	d0,y_pos(a0)

		sfx		sfx_Land

		move.b	angle(a0),d0
		addi.b	#$20,d0
		andi.b	#$C0,d0
		beq.s	.skip3
		jmp		Player_TouchFloor_Check_Spindash

.skip3:
		jsr		Player_TouchFloor_Check_Spindash
		move.w	#$F,move_lock(a0)
		move.b	#id_Ability4,anim(a0)

.return:
		rts
; ---------------------------------------------------------------------------

Knuckles_Sliding:
		jsr		GetCtrlHeldLogical
		andi.b	#button_B_mask|button_C_mask|button_A_mask,d0
		beq.s	.getUp

		tst.w	x_vel(a0)
		bpl.s	.goingRight

;.goingLeft:
		addi.w	#$20,x_vel(a0)
		bmi.s	.continueSliding2

		bra.s	.getUp
; ---------------------------------------------------------------------------
; loc_16B20:
.continueSliding2:
		bra.s	.continueSliding
; ---------------------------------------------------------------------------
; loc_16B22:
.goingRight:
		sub.w	#$20,x_vel(a0)
		bpl.s	.continueSliding
; loc_16B2A:
.getUp:
		clr.w	ground_vel(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)

		move.b	y_radius(a0),d0
		sub.b	default_y_radius(a0),d0
		ext.w	d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	.skip1
		neg.w	d0

.skip1:
		add.w	d0,y_pos(a0)

		jsr		Player_TouchFloor_Check_Spindash

		move.w	#$F,move_lock(a0)
		move.b	#id_Ability3,anim(a0)
		rts
; ---------------------------------------------------------------------------

.continueSliding:
		bsr.w	Knux_DoLevelCollision_CheckRet

		; Get distance from floor in 'd1', and angle of floor in 'd3'.
		jsr		sub_11FD6

		; If the distance from the floor is suddenly really high, then
		; Knuckles must have slid off a ledge, so make him enter his falling
		; state.
		cmpi.w	#14,d1
		bge.s	.fail

		tst.b	(Reverse_gravity_flag).w
		beq.s	.skip2
		neg.w	d1

.skip2:
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)

		; Play the sliding sound every 8 frames.
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#7,d0
		bne.s	.skip3
		sfx		sfx_Slide
.skip3:
		rts
; ---------------------------------------------------------------------------
; loc_16B96:
.fail:
		move.b	#2,double_jump_flag(a0)
		move.b	#id_Ability2,anim(a0)
		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius
		bset	#Status_InAir,(Gliding_collision_flags).w
		rts
; ---------------------------------------------------------------------------

Knuckles_Wall_Climb:
		tst.b	(Disable_wall_grab).w
		bmi.w	Knuckles_LetGoOfWall

		; If Knuckles' X coordinate is no longer the same as when he first
		; latched onto the wall, then detach him from the wall. This is
		; probably intended to detach Knuckles from the wall if something
		; physically pushes him away from it.
		move.w	x_pos(a0),d0
		cmp.w	x_sub(a0),d0
		bne.w	Knuckles_LetGoOfWall

		; If an object is now carrying Knuckles, then detach him from the
		; wall.
		btst	#Status_OnObj,status(a0)
		bne.w	Knuckles_LetGoOfWall

		clr.w	ground_vel(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)

		move.l	(Primary_collision_addr).w,(Collision_addr).w
		cmp.b	#$D,lrb_solid_bit(a0)
		beq.s	+
		move.l	(Secondary_collision_addr).w,(Collision_addr).w
+
		move.b	lrb_solid_bit(a0),d5

		moveq	#0,d1	; Climbing animation delta: make the animation pause.

		jsr		GetCtrlHeldLogical
		btst	#button_up,d0
		beq.w	.notClimbingUp

;.climbingUp:
		tst.b	(Reverse_gravity_flag).w
		bne.w	.climbingUp_ReverseGravity

		; Get Knuckles' distance from the wall in 'd1'.
		move.w	y_pos(a0),d2
		subi.w	#11,d2
		bsr.w	GetDistanceFromWall

		; If the wall is far away from Knuckles, then we must have reached a
		; ledge, so make Knuckles climb up onto it.
		cmpi.w	#4,d1
		bge.w	Knuckles_ClimbUp

		; If Knuckles has encountered a small dip in the wall, then make him
		; stop.
		tst.w	d1
		bne.w	.notMoving

		; Get Knuckles' distance from the ceiling in 'd1'.
		move.b	lrb_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		subq.w	#8,d2
		move.w	x_pos(a0),d3
		jsr		CheckCeilingDist_WithRadius

		; Check if Knuckles has room above him.
		tst.w	d1
		bpl.s	.moveUp

		; Knuckles is bumping into the ceiling, so push him out.
		sub.w	d1,y_pos(a0)

		moveq	#1,d1	; Climbing animation delta: make the animation play forwards.
		bra.w	.finishMoving
; ---------------------------------------------------------------------------
; loc_16C4C:
.moveUp:
		subq.w	#1,y_pos(a0)

		; Super Knuckles and Hyper Knuckles climb walls faster.
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	.notSuperOrHyper1
		subq.w	#1,y_pos(a0)

.notSuperOrHyper1:
		moveq	#1,d1	; Climbing animation delta: make the animation play forwards.

		; Don't let Knuckles climb through the level's upper boundary.
		move.w	(Camera_min_Y_pos).w,d0

		; If the level wraps vertically, then don't bother with any of this.
		cmpi.w	#-$100,d0
		beq.w	.finishMoving

		; Check if Knuckles is over the level's top boundary.
		addi.w	#16,d0
		cmp.w	y_pos(a0),d0
		ble.w	.finishMoving

		; Knuckles is climbing over the level's top boundary: push him back
		; down.
		move.w	d0,y_pos(a0)
		bra.w	.finishMoving
; ---------------------------------------------------------------------------
; loc_16C7C:
.climbingDown_ReverseGravity:
		; Knuckles is climbing down.

		; ...I'm not sure what this code is for.
		cmpi.b	#frK_Climb6+1,mapping_frame(a0)
		bne.s	.skip3
		move.b	#frK_Climb1,mapping_frame(a0)
		subq.w	#3,y_pos(a0)
		subq.w	#3,x_pos(a0)
		btst	#Status_Facing,status(a0)
		beq.s	.skip3
		addq.w	#3*2,x_pos(a0)

.skip3:
		; Get Knuckles' distance from the wall in 'd1'.
		move.w	y_pos(a0),d2
		subi.w	#11,d2
		bsr.w	GetDistanceFromWall

		; If Knuckles is no longer against the wall (he has climbed off the
		; bottom of it) then make him let go.
		tst.w	d1
		bne.w	Knuckles_LetGoOfWall

		; Get Knuckles' distance from the floor in 'd1'.
		move.b	top_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		subi.w	#9,d2
		move.w	x_pos(a0),d3
		jsr		CheckCeilingDist_WithRadius

		; Check if Knuckles has room below him.
		tst.w	d1
		bpl.s	.moveDown_ReverseGravity

		; Knuckles has reached the floor.
		sub.w	d1,y_pos(a0)
		move.b	(Primary_Angle).w,d0
		addi.b	#$40,d0
		neg.b	d0
		subi.b	#$40,d0
		move.b	d0,angle(a0)

		clr.w	ground_vel(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)

		jsr		Player_TouchFloor_Check_Spindash

		move.b	#id_Walk,anim(a0)

		rts
; ---------------------------------------------------------------------------
; loc_16CFC:
.moveDown_ReverseGravity:
		subq.w	#1,y_pos(a0)

		; Super Knuckles and Hyper Knuckles climb walls faster.
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	.notSuperOrHyper2
		subq.w	#1,y_pos(a0)

.notSuperOrHyper2:
		moveq	#-1,d1	; Climbing animation delta: make the animation play backwards.
		bra.w	.finishMoving
; ---------------------------------------------------------------------------
; loc_16D10:
.notClimbingUp:
		jsr		GetCtrlHeldLogical
		btst	#button_down,d0
		beq.w	.finishMoving

;.climbingDown:
		tst.b	(Reverse_gravity_flag).w
		bne.w	.climbingDown_ReverseGravity

		; ...I'm not sure what this code is for.
		cmp.b	#frK_Climb6+1,mapping_frame(a0)
		bne.s	.skip4
		move.b	#frK_Climb1,mapping_frame(a0)
		addq.w	#3,y_pos(a0)
		subq.w	#3,x_pos(a0)
		btst	#Status_Facing,status(a0)
		beq.s	.skip4
		addq.w	#3*2,x_pos(a0)

.skip4:
		; Get Knuckles' distance from the wall in 'd1'.
		move.w	y_pos(a0),d2
		addi.w	#11,d2
		bsr.w	GetDistanceFromWall

		; If Knuckles is no longer against the wall (he has climbed off the
		; bottom of it) then make him let go.
		tst.w	d1
		bne.w	Knuckles_LetGoOfWall

		; Get Knuckles' distance from the floor in 'd1'.
		move.b	top_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		addi.w	#9,d2
		move.w	x_pos(a0),d3
		jsr		sub_F828

		; Check if Knuckles has room below him.
		tst.w	d1
		bpl.s	.moveDown
; loc_16D6E:
.reachedFloor:
		; Knuckles has reached the floor.
		add.w	d1,y_pos(a0)
		move.b	(Primary_Angle).w,angle(a0)

		clr.w	ground_vel(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)
		jsr		Player_TouchFloor_Check_Spindash
		move.b	#id_Wait,anim(a0)
		rts
; ---------------------------------------------------------------------------
; loc_16D96:
.moveDown:
		addq.w	#1,y_pos(a0)

		; Super Knuckles and Hyper Knuckles climb walls faster.
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	.notSuperOrHyper3
		addq.w	#1,y_pos(a0)

.notSuperOrHyper3:
		moveq	#-1,d1	; Climbing animation delta: make the animation play backwards.
		bra.s	.finishMoving
; ---------------------------------------------------------------------------
; loc_16DA8:
.climbingUp_ReverseGravity:
		; Get Knuckles' distance from the wall in 'd1'.
		move.w	y_pos(a0),d2
		addi.w	#11,d2
		bsr.w	GetDistanceFromWall

		; If the wall is far away from Knuckles, then we must have reached a
		; ledge, so make Knuckles climb up onto it.
		cmpi.w	#4,d1
		bge.w	Knuckles_ClimbUp

		; If Knuckles has encountered a small dip in the wall, then make him
		; stop.
		tst.w	d1
		bne.w	.notMoving

		; Get Knuckles' distance from the ceiling in 'd1'.
		move.b	lrb_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		addq.w	#8,d2
		move.w	x_pos(a0),d3
		jsr		sub_F828

		; Check if Knuckles has room above him.
		tst.w	d1
		bpl.s	.moveUp_ReverseGravity

		; Knuckles is bumping into the ceiling, so push him out.
		add.w	d1,y_pos(a0)

		moveq	#1,d1	; Climbing animation delta: make the animation play forwards.
		bra.w	.finishMoving
; ---------------------------------------------------------------------------
; loc_16DE2:
.moveUp_ReverseGravity:
		addq.w	#1,y_pos(a0)

		; Super Knuckles and Hyper Knuckles climb walls faster.
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	.notSuperOrHyper4
		addq.w	#1,y_pos(a0)

.notSuperOrHyper4:
		moveq	#1,d1	; Climbing animation delta: make the animation play forwards.

		; Don't let Knuckles climb through the level's upper boundary.

		; If the level wraps vertically, then don't bother with any of this.
		cmpi.w	#-$100,(Camera_min_Y_pos).w
		beq.w	.finishMoving

		; Check if Knuckles is over the level's top boundary.
		move.w	(Camera_max_Y_pos).w,d0
		addi.w	#$D0,d0
		cmp.w	y_pos(a0),d0
		bge.w	.finishMoving

		; Knuckles is climbing over the level's top boundary: push him back
		; down.
		move.w	d0,y_pos(a0)
; loc_16E10:
.finishMoving:
		; This block of code was not here in KiS2.
		; This code detaches Knuckles from the wall if there is
		; ground directly below him. Note that this code specifically
		; does not run if the player is holding up or down: this is
		; because similar code already runs if either of those
		; buttons are being held. Presumably, this check was added so
		; that Knuckles would properly detach from the wall if a
		; rising floor (think Marble Garden Zone Act 2) came up from
		; under him. With that said, KiS2 lacks this logic, and yet
		; Knuckles seems to detach from the wall in Hill Top Zone's
		; rising wall section just fine, so I'm not sure whether this
		; code was ever actually needed in the first place.
		jsr		GetCtrlHeldLogical
		andi.b	#button_up_mask|button_down_mask,d0
		bne.s	.isMovingUpOrDown

		; Get Knuckles' distance from the floor in 'd1'.
		move.b	top_solid_bit(a0),d5
		move.w	y_pos(a0),d2
		addi.w	#9,d2
		move.w	x_pos(a0),d3
		jsr		sub_F828

		; Check if Knuckles has room below him.
		tst.w	d1
		bmi.w	.reachedFloor

		; Bug! 'd1' has been overwritten by 'sub_F828', but the code
		; after this needs it for updating Knuckles' animation. This
		; bug is the reason why Knuckles resets to his first climbing
		; frame when the player is not holding up or down.

.isMovingUpOrDown:
		; If Knuckles has not moved, skip this.
		tst.w	d1
		beq.s	.notMoving

		; Only animate every 4 frames.
		subq.b	#1,double_jump_property(a0)
		bpl.s	.notMoving
		move.b	#3,double_jump_property(a0)

		; Add delta to animation frame.
		add.b	mapping_frame(a0),d1
		jsr		GetCtrlHeldLogical
		btst	#button_up,d0
		bne.s	.ClimbUpAni
		btst	#button_down,d0
		bne.s	.ClimbDownAni
		bra.s	.ResetAniClimb

	.ClimbUpAni:
		cmp.b	#frK_Climb1,d1
		bcc.s	.noLoop1
		move.b	#frK_Climb6,d1
		bra.s	.noLoop2

.noLoop1:
		cmp.b	#frK_Climb6,d1
		bls.s	.noLoop2
		move.b	#frK_Climb1,d1
		bra.s	.noLoop2

	.ClimbDownAni:
		cmp.b	#frK_ClimbD1,d1
		bcs.s	.noLoop1_D
		move.b	#frK_ClimbD1,d1
		bra.s	.noLoop2

.noLoop1_D:
		move.b	#frK_ClimbD2,d1
		bra.s	.noLoop2

	.ResetAniClimb:
		move.b	#frK_Climb1,d1

.noLoop2:
		; Apply the frame.
		move.b	d1,mapping_frame(a0)
; loc_16E60:
.notMoving:
		move.b	#$20,anim_frame_timer(a0)
		clr.b	anim_frame(a0)
	; why the original code moved the held button as a word to d0
	; to accomplish the same thing, i will never know
		jsr		GetCtrlPressLogical
		andi.b	#button_B_mask|button_C_mask|button_A_mask,d0
		beq.s	.hasNotJumped

		; Knuckles has jumped off the wall.
		move.w	#-$380,y_vel(a0)
		move.w	#$400,x_vel(a0)

		bchg	#Status_Facing,status(a0)
		bne.s	.goingRight
		neg.w	x_vel(a0)

.goingRight:
		bset	#Status_InAir,status(a0)
		move.b	#1,jumping(a0)

		move.b	#$E,y_radius(a0)
		move.b	#7,x_radius(a0)

		move.b	#id_Roll,anim(a0)
		bset	#Status_Roll,status(a0)
		clr.b	double_jump_flag(a0)
; locret_16EB8:
.hasNotJumped:
		rts
; ---------------------------------------------------------------------------

Knuckles_ClimbUp:
		move.b	#5,double_jump_flag(a0)		  ; Climb up to	the floor above	you

		cmp.b	#frK_Climb6+1,mapping_frame(a0)
		beq.s	+

		clr.b	double_jump_property(a0)
		bsr.s	Knuckles_DoLedgeClimbingAnimation
+
		rts
; ---------------------------------------------------------------------------

Knuckles_LetGoOfWall:
		move.b	#2,double_jump_flag(a0)

		move.w	#bytes_to_word(id_Ability2,id_Ability2),anim(a0)
		move.b	#frK_GlideFall2,mapping_frame(a0)
		move.b	#7,anim_frame_timer(a0)
		move.b	#1,anim_frame(a0)

		move.w	default_y_radius(a0),y_radius(a0)	; also does x radius

		rts
; End of function Knuckles_Glide


; =============== S U B	R O U T	I N E =======================================


Knuckles_DoLedgeClimbingAnimation:
		moveq	#0,d0
		move.b	double_jump_property(a0),d0
		lea	Knuckles_ClimbLedge_Frames(pc,d0.w),a1

		move.b	(a1)+,mapping_frame(a0)

		move.b	(a1)+,d0
		ext.w	d0
		btst	#Status_Facing,status(a0)
		beq.s	+
		neg.w	d0
+
		add.w	d0,x_pos(a0)

		move.b	(a1)+,d1
		ext.w	d1
		tst.b	(Reverse_gravity_flag).w
		beq.s	+
		neg.w	d1
+
		add.w	d1,y_pos(a0)

		move.b	(a1)+,anim_frame_timer(a0)

		addq.b	#4,double_jump_property(a0)
		clr.b	anim_frame(a0)
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


GetDistanceFromWall:
		move.b	lrb_solid_bit(a0),d5
		btst	#Status_Facing,status(a0)
		bne.s	.facingLeft

;.facingRight:
		move.w	x_pos(a0),d3
		jmp		loc_FAA4
; ---------------------------------------------------------------------------
; loc_16F62:
.facingLeft:
		move.w	x_pos(a0),d3
		subq.w	#1,d3
		jmp		loc_FDC8
; End of function GetDistanceFromWall

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR Knuckles_Glide

Knuckles_Climb_Ledge:
		tst.b	anim_frame_timer(a0)
		bne.s	return_315C7A

		bsr.w	Knuckles_DoLedgeClimbingAnimation

		; Have we reached the end of the ledge-climbing animation?
		cmp.b	#Knuckles_ClimbLedge_Frames_End-Knuckles_ClimbLedge_Frames,double_jump_property(a0)
		bne.s	return_315C7A

		; Yes.
		clr.w	ground_vel(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)

		btst	#Status_Facing,status(a0)
		beq.s	+
		subq.w	#1,x_pos(a0)
+
		jsr		Player_TouchFloor_Check_Spindash
		move.b	#id_Wait,anim(a0)

return_315C7A:
		rts
; END OF FUNCTION CHUNK	FOR Knuckles_Glide

; =============== S U B	R O U T	I N E =======================================


Knuckles_Set_Gliding_Animation:
		move.b	#$20,anim_frame_timer(a0)
		clr.b	anim_frame(a0)
		move.w	#bytes_to_word(id_Ability1,id_Ability1),anim(a0)
		bclr	#Status_Push,status(a0)
		bclr	#Status_Facing,status(a0)

		; Update Knuckles' frame, depending on where he's facing.
		moveq	#0,d0
		move.b	double_jump_property(a0),d0
		add.b	#$10,d0
		lsr.w	#5,d0
		move.b	RawAni_Knuckles_GlideTurn(pc,d0.w),d1
		move.b	d1,mapping_frame(a0)
		cmp.b	#frK_Float5,d1
		bne.s	+
		bset	#Status_Facing,status(a0)
		move.b	#frK_Float1,mapping_frame(a0)
+
		rts
; End of function Knuckles_Set_Gliding_Animation

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


Knuckles_Move_Glide:
		cmp.b	#1,double_jump_flag(a0)
		bne.w	.doNotKillSpeed

		move.w	ground_vel(a0),d0
		cmpi.w	#$400,d0
		bhs.s	.mediumSpeed

;.lowSpeed:
		; Increase Knuckles' speed.
		addq.w	#8,d0
		bra.s	.applySpeed
; ---------------------------------------------------------------------------
; loc_1700E:
.mediumSpeed:
		; If Knuckles is at his speed limit, then don't increase his speed.
		cmpi.w	#$1800,d0
		bhs.s	.applySpeed

		; If Knuckles is turning, then don't increase his speed either.
		move.b	double_jump_property(a0),d1
		andi.b	#$7F,d1
		bne.s	.applySpeed

		; Increase Knuckles' speed.
		addq.w	#4,d0

		; Super Knuckles and Hyper Knuckles glide faster.
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	.applySpeed
		addq.w	#8,d0
; loc_17028:
.applySpeed:
		move.w	d0,ground_vel(a0)

		move.b	double_jump_property(a0),d0
		jsr		GetCtrlHeldLogical.d2
		btst	#button_left,d2
		beq.s	.notHoldingLeft

;.holdingLeft:
		; Playing is holding left.
		cmp.b	#$80,d0
		beq.s	.notHoldingLeft
		tst.b	d0
		bpl.s	.doNotNegate1
		neg.b	d0

.doNotNegate1:
		addq.b	#2,d0
		bra.s	.setNewTurningValue
; ---------------------------------------------------------------------------
; loc_17048:
.notHoldingLeft:
		jsr		GetCtrlHeldLogical.d2
		btst	#button_right,d2
		beq.s	.notHoldingRight

;.holdingRight:
		; Playing is holding right.
		tst.b	d0
		beq.s	.notHoldingRight
		bmi.s	.doNotNegate2
		neg.b	d0

.doNotNegate2:
		addq.b	#2,d0
		bra.s	.setNewTurningValue
; ---------------------------------------------------------------------------
; loc_1705C:
.notHoldingRight:
		move.b	d0,d1
		andi.b	#$7F,d1
		beq.s	.setNewTurningValue
		addq.b	#2,d0
; loc_17066:
.setNewTurningValue:
		move.b	d0,double_jump_property(a0)

		move.b	double_jump_property(a0),d0
		jsr	(GetSineCosine).l
		muls.w	ground_vel(a0),d1
		asr.l	#8,d1
		move.w	d1,x_vel(a0)

		; Is Knuckles is falling at a high speed, then create a parachute
		; effect, where gliding makes Knuckles fall slower.
		cmpi.w	#$80,y_vel(a0)
		blt.s	.fallingSlow
		subi.w	#$20,y_vel(a0)
		bra.s	.fallingFast
; ---------------------------------------------------------------------------
; loc_1708E:
.fallingSlow:
		; Apply gravity.
		addi.w	#$20,y_vel(a0)
; loc_17094:
.fallingFast:
		; If Knuckles is above the level's top boundary, then kill his
		; horizontal speed.
		move.w	(Camera_min_Y_pos).w,d0
		cmpi.w	#-$100,d0
		beq.w	.doNotKillspeed

		addi.w	#$10,d0
		cmp.w	y_pos(a0),d0
		ble.w	.doNotKillspeed

		asr.w	x_vel(a0)
		asr.w	ground_vel(a0)
; loc_170B4:
.doNotKillspeed:
		cmpi.w	#$60,(a5)
		beq.s	.doNotModifyBias
		bhs.s	.goUp
		addq.w	#2*2,(a5)

.goUp:
		subq.w	#2,(a5)
; locret_170C0:
.doNotModifyBias:
		rts
; End of function Knuckles_Move_Glide

; ---------------------------------------------------------------------------

Knux_Test_For_Glide:
		cmpa.w	#Player_1,a0
		bne.w	return_3165D2
		tst.b	double_jump_flag(a0)
		bne.w	return_3165D2

Knuckles_BeginGlide:
		bclr	#2,status(a0)
		move.b	#$A,y_radius(a0)
		move.b	#$A,x_radius(a0)
		bclr	#4,status(a0)
		move.b	#1,double_jump_flag(a0)
		addi.w	#$200,y_vel(a0)
;		illegal
		bpl.s	loc_17898
		clr.w	y_vel(a0)

loc_17898: ; Momentum glide by ProjectFM for SHIMA
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
		btst	#Status_Facing,status(a0)
		beq.s	loc_3165B4
		neg.w	d2
		moveq	#-$80,d1

loc_3165B4:
		move.w	d0,ground_vel(a0)
		move.w	d2,x_vel(a0)
		move.b	d1,double_jump_property(a0)
		clr.w	angle(a0)
		clr.b	(Gliding_collision_flags).w
		bset	#Status_InAir,(Gliding_collision_flags).w
		bsr.w	Knuckles_Set_Gliding_Animation

return_3165D2:
		rts
; End of function Knuckles_JumpHeight


; =============== S U B	R O U T	I N E =======================================


Knux_DoLevelCollision_CheckRet:
		move.l	(Primary_collision_addr).w,(Collision_addr).w
		cmp.b	#$C,top_solid_bit(a0)
		beq.s	+
		move.l	(Secondary_collision_addr).w,(Collision_addr).w
+
		move.b	lrb_solid_bit(a0),d5
		move.w	x_vel(a0),d1
		move.w	y_vel(a0),d2
		jsr	(GetArcTan).l
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
		clr.w	x_vel(a0)
		bset	#Status_Push,(Gliding_collision_flags).w
+
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	+
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)
		bset	#Status_Push,(Gliding_collision_flags).w
+
		jsr	Player_CheckFloor
		tst.w	d1
		bpl.s	return_3169CC
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		clr.w	y_vel(a0)
		bclr	#Status_InAir,(Gliding_collision_flags).w

return_3169CC:
		rts
; ---------------------------------------------------------------------------

Knuckles_HitLeftWall2:
		jsr	CheckLeftWallDist
		tst.w	d1
		bpl.s	Knuckles_HitCeilingAlt
		sub.w	d1,x_pos(a0)
		clr.w	x_vel(a0)
		bset	#Status_Push,(Gliding_collision_flags).w

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
		clr.w	y_vel(a0)

return_316A06:
		rts
; ---------------------------------------------------------------------------

loc_316A08:
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	return_316A20
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)
		bset	#Status_Push,(Gliding_collision_flags).w

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
		clr.w	y_vel(a0)
		bclr	#Status_InAir,(Gliding_collision_flags).w

return_316A44:
		rts
; ---------------------------------------------------------------------------

Knuckles_HitCeilingAndWalls2:
		jsr	CheckLeftWallDist
		tst.w	d1
		bpl.s	loc_316A5E
		sub.w	d1,x_pos(a0)
		clr.w	x_vel(a0)
		bset	#Status_Push,(Gliding_collision_flags).w

loc_316A5E:
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_316A76
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)
		bset	#Status_Push,(Gliding_collision_flags).w

loc_316A76:
		jsr	Player_CheckCeiling
		tst.w	d1
		bpl.s	return_316A88
		sub.w	d1,y_pos(a0)
		clr.w	y_vel(a0)

return_316A88:
		rts
; ---------------------------------------------------------------------------

Knuckles_HitRightWall2:
		jsr	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_316AA2
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)
		bset	#Status_Push,(Gliding_collision_flags).w

loc_316AA2:
		jsr	Player_CheckCeiling
		tst.w	d1
		bpl.s	loc_316ABC
		sub.w	d1,y_pos(a0)
		tst.w	y_vel(a0)
		bpl.s	return_316ABA
		clr.w	y_vel(a0)

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
		clr.w	y_vel(a0)
		bclr	#Status_InAir,(Gliding_collision_flags).w

return_316ADE:
		rts
; End of function Knux_DoLevelCollision_CheckRet

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
; Removed Roll2 code
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
Map_Knuckles:		binclude "Objects/Player Characters/Object Data/Map - Knuckles.bin"
		even
PLC_Knuckles:		binclude "Objects/Player Characters/Object Data/PLC - Knuckles.bin"
		even