GetCtrlPressLogical:
	cmpa.w	#Player_1,a0
	bne.s	.p2
.p1:
	move.b	(Ctrl_1_pressed_logical).w,d0
	rts
.p2:
	move.b	(Ctrl_2_pressed_logical).w,d0
	rts
.d2:
	cmpa.w	#Player_1,a0
	bne.s	.d2p2
.d2p1:
	move.b	(Ctrl_1_pressed_logical).w,d2
	rts
.d2p2:
	move.b	(Ctrl_2_pressed_logical).w,d2
	rts

GetCtrlPressLogical_6btn:
	cmpa.w	#Player_1,a0
	bne.s	.p2
.p1:
	move.b	(Ctrl_1_pressed_logical_6btn).w,d0
	rts
.p2:
	move.b	(Ctrl_2_pressed_logical_6btn).w,d0
	rts
.d2:
	cmpa.w	#Player_1,a0
	bne.s	.d2p2
.d2p1:
	move.b	(Ctrl_1_pressed_logical_6btn).w,d2
	rts
.d2p2:
	move.b	(Ctrl_2_pressed_logical_6btn).w,d2
	rts

GetCtrlHeldLogical:
	cmpa.w	#Player_1,a0
	bne.s	.p2
.p1:
	move.b	(Ctrl_1_held_logical).w,d0
	rts
.p2:
	move.b	(Ctrl_2_held_logical).w,d0
	rts
.d2:
	cmpa.w	#Player_1,a0
	bne.s	.d2p2
.d2p1:
	move.b	(Ctrl_1_held_logical).w,d2
	rts
.d2p2:
	move.b	(Ctrl_2_held_logical).w,d2
	rts

GetCtrlHeldLogical_6btn:
	cmpa.w	#Player_1,a0
	bne.s	.p2
.p1:
	move.b	(Ctrl_1_held_logical_6btn).w,d0
	rts
.p2:
	move.b	(Ctrl_2_held_logical_6btn).w,d0
	rts
.d2:
	cmpa.w	#Player_1,a0
	bne.s	.d2p2
.d2p1:
	move.b	(Ctrl_1_held_logical_6btn).w,d2
	rts
.d2p2:
	move.b	(Ctrl_2_held_logical_6btn).w,d2
	rts

; =============== S U B R O U T I N E =======================================

Obj_Sonic:
		; Load some addresses into registers
		; This is done to allow some subroutines to be
		; shared with other characters.
		lea	(Distance_from_screen_top).w,a5
		cmpa.w	#Player_1,a0
		bne.s	.p2
		lea	(Top_speed_P1).w,a4
		lea	(v_Dust_P1).w,a6
		bra.s	.cont
	.p2:
		lea	(Top_speed_P2).w,a4
		lea	(v_Dust_P2).w,a6
	.cont:

	if GameDebug
		cmpa.w	#Player_1,a0
		bne.s	Sonic_Normal
		tst.w	(Debug_placement_mode).w
		beq.s	Sonic_Normal

; Debug only code
		cmpi.b	#1,(Debug_placement_type).w	; Are Sonic in debug object placement mode?
		jeq		DebugMode			; If so, skip to debug mode routine
		; By this point, we're assuming you're in frame cycling mode
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		clr.w	(Debug_placement_mode).w	; Leave debug mode
+		addq.b	#1,mapping_frame(a0)		; Next frame
		cmpi.b	#frS_Last,mapping_frame(a0)	; Have we reached the end of Sonic's frames?
		blo.s		+
		clr.b	mapping_frame(a0)	; If so, reset to Sonic's first frame
+		bsr.w	Player_Load_PLC
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

Sonic_Normal:
	endif
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Sonic_Index(pc,d0.w),d1
		jmp	Sonic_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Sonic_Index: offsetTable
ptr_Sonic_Init:		offsetTableEntry.w Sonic_Init		; 0
ptr_Sonic_Control:	offsetTableEntry.w Player_Control	; 2
ptr_Sonic_Hurt:		offsetTableEntry.w Player_Hurt		; 4
ptr_Sonic_Death:	offsetTableEntry.w Player_Death		; 6
ptr_Sonic_Restart:	offsetTableEntry.w Player_Restart	; 8
					offsetTableEntry.w loc_12590		; A
ptr_Sonic_Drown:	offsetTableEntry.w Player_Drown	; C
; ---------------------------------------------------------------------------

Sonic_Init:	; Routine 0
		addq.b	#2,routine(a0)				; => Obj01_Control
		move.w	#bytes_to_word(38/2,18/2),y_radius(a0)	; set y_radius and x_radius	; this sets Sonic's collision height (2*pixels)
		move.w	#bytes_to_word(38/2,18/2),default_y_radius(a0)	; set default_y_radius and default_x_radius
		move.l	#Map_Sonic,mappings(a0)
		move.w	#$100,priority(a0)
		move.w	#bytes_to_word(48/2,48/2),height_pixels(a0)		; set height and width
		move.b	#4,render_flags(a0)
		clr.b	character_id(a0)
		move.l	#Obj_Insta_Shield,(v_Shield).w
	.branchPoint:
		cmpa.w	#Player_1,a0
		bne.s	.p2
		move.w	#make_art_tile(ArtTile_Sonic,0,0),art_tile(a0)
		bra.s	.cont
	.p2:
		move.w	#make_art_tile(ArtTile_Tails,0,0),art_tile(a0)
	.cont:
		move.w	#bytes_to_word($C,$D),top_solid_bit(a0)
		move.w	#$600,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$C,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$80,Deceleration_P1-Top_speed_P1(a4)

Player_Init_Continued:
		clr.b	flips_remaining(a0)
		move.b	#4,flip_speed(a0)
		clr.b	(Super_Sonic_Knux_flag).w
		move.b	#30,air_left(a0)
		subi.w	#$20,x_pos(a0)
		addi.w	#4,y_pos(a0)
		bsr.w	Reset_Player_Position_Array
		addi.w	#$20,x_pos(a0)
		subi.w	#4,y_pos(a0)
	; CPU stuff
		cmpi.b	#$20,(Tails_CPU_routine).w
		beq.s	loc_137A4
		cmpi.b	#$12,(Tails_CPU_routine).w
		beq.s	loc_137A4
		clr.b	(Tails_CPU_routine).w

loc_137A4:
		clr.w	(Tails_CPU_idle_timer).w
		clr.w	(Tails_CPU_flight_timer).w
;		rts

; ---------------------------------------------------------------------------
; Normal state for Sonic
; ---------------------------------------------------------------------------

Player_Control:								; Routine 2
	if GameDebug
		cmpa.w	#Player_1,a0
		bne.s	loc_10BF0
		tst.b	(Debug_mode_flag).w				; is debug cheat enabled?
		beq.s	loc_10BF0					; if not, branch
		bclr	#button_A,(Ctrl_1_pressed).w		; is button A pressed?
		beq.s	loc_10BCE					; if not, branch
		eori.b	#1,(Reverse_gravity_flag).w		; toggle reverse gravity

loc_10BCE:
		btst	#button_B,(Ctrl_1_pressed).w		; is button B pressed?
		beq.s	loc_10BF0					; if not, branch
		move.w	#1,(Debug_placement_mode).w	; change Sonic into a ring/item
		clr.b	(Ctrl_1_locked).w					; unlock control
		btst	#button_C,(Ctrl_1_held).w			; was button C held before pressing B?
		beq.s	locret_10BEE					; if not, branch
		move.w	#2,(Debug_placement_mode).w	; enter animation cycle mode

locret_10BEE:
		rts
; ---------------------------------------------------------------------------

loc_10BF0:
	endif
		cmpa.w	#Player_1,a0
		bne.s	.p2
;		move.w	(Ctrl_1_logical).w,(Ctrl_2_logical).w
		tst.b	(Ctrl_1_locked).w					; are controls locked?
		bne.s	.doneController					; if yes, branch
;		move.w	(Ctrl_1).w,(Ctrl_2_logical).w	; copy new held buttons, to enable joypad control
		move.l	(Ctrl_1).w,(Ctrl_1_logical).w	; copy new held buttons, to enable joypad control
;		cmpi.b	#$1A,(Tails_CPU_routine).w
;		bhs.s	.cpu
		bra.s	.doneController
; ---------------------------------------------------------------------------

	.p2:
		tst.b	(Ctrl_2_locked).w					; are controls locked?
		bne.s	.cpu
		move.l	(Ctrl_2).w,(Ctrl_2_logical).w	; copy new held buttons, to enable joypad control

	.cpu:
		bsr.w	CPU_Control

.doneController:
		tst.w	(Carried_character).w	; test address's contents
		beq.s	.cont				; if it's empty, just go ahead
		cmpa.w	(Carried_character).w,a0	; compare to a0 (current address)
		bne.s	.contcarrier					; if it's equal, we can't control the character
	.cont:
		btst	#0,object_control(a0)				; is Sonic interacting with another object that holds him in place or controls his movement somehow?
		bne.w	loc_10C26					; if not, branch to skip Sonic's control
		bra.s	loc_10C0C
	.contcarrier:
		btst	#0,object_control(a0)				; is Sonic interacting with another object that holds him in place or controls his movement somehow?
		beq.s	loc_10C0C					; if not, branch to skip Sonic's control

; Change this to only be for the player carrying the other.
		clr.b	double_jump_flag(a0)				; enable double jump
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.s	loc_10C26
		cmpa.w	#Player_1,a0
		bne.s	.carryingp2
	.carryingp1:
		lea		(Player_1).w,a1
		bra.s	.carryingCont
	.carryingp2:
		lea		(Player_2).w,a1
	.carryingCont:
		clr.b	object_control(a1)
		bset	#Status_InAir,status(a1)
		clr.w	(Flying_carrying_Sonic_flag).w	; this makes him drop you
		bra.s	loc_10C26
; ---------------------------------------------------------------------------
; carrying/grounded player goes here
loc_10C0C:
		moveq	#0,d0
		move.b	character_id(a0),d0
		lsl.w	#2,d0
		movea.l	.controlLUT(pc,d0.w),a1
		jmp		(a1)
	.controlLUT:
		dc.l	.cont
		dc.l	Tails_Control
		dc.l	Knuckles_Control
		dc.l	Mighty_Control
		dc.l	Espio_Control

	.cont:
		movem.l	a4-a6,-(sp)
		moveq	#0,d0
		move.b	status(a0),d0
		andi.w	#6,d0
		move.w	Sonic_Modes(pc,d0.w),d1
		jsr	Sonic_Modes(pc,d1.w)	; run Sonic's movement control code
		movem.l	(sp)+,a4-a6
; carried player goes here
loc_10C26:
		cmpi.w	#-$100,(Camera_min_Y_pos).w		; is vertical wrapping enabled?
		bne.s	+								; if not, branch
		move.w	(Screen_Y_wrap_value).w,d0
		and.w	d0,y_pos(a0)						; perform wrapping of Sonic's y position
+		bsr.s	Player_Display
		bsr.w	SonicKnux_SuperHyper
		bsr.w	Player_RecordPos
		bsr.w	Player_Water
		move.b	(Primary_Angle).w,next_tilt(a0)
		move.b	(Secondary_Angle).w,tilt(a0)
		tst.b	(WindTunnel_flag).w
		beq.s	+
		tst.b	anim(a0)
		bne.s	+
		move.b	prev_anim(a0),anim(a0)
+		bsr.w	Animate_Player
		btst	#1,object_control(a0)
		bne.s	+
		tst.b	(Reverse_gravity_flag).w
		beq.s	+
		eori.b	#2,render_flags(a0)
+		bsr.w	Player_Load_PLC
+		move.b	object_control(a0),d0
		andi.b	#$A0,d0
		bne.s	+
		jsr	TouchResponse(pc)
+		rts
; ---------------------------------------------------------------------------
; secondary states under state Player_Control

Sonic_Modes: offsetTable
		offsetTableEntry.w Sonic_MdNormal		; 0
		offsetTableEntry.w Sonic_MdAir			; 2
		offsetTableEntry.w Sonic_MdRoll		; 4
		offsetTableEntry.w Sonic_MdJump		; 6

; =============== S U B R O U T I N E =======================================

Player_Display:
		move.b	invulnerability_timer(a0),d0
		beq.s	loc_10CA6
		subq.b	#1,invulnerability_timer(a0)
		lsr.b	#3,d0
		bcc.s	Player_ChkInvin

loc_10CA6:
		jsr	(Draw_Sprite).w

Player_ChkInvin:										; checks if invincibility has expired and disables it if it has.
		btst	#Status_Invincible,status_secondary(a0)
		beq.s	Player_RmvInvin.reset
		tst.b	invincibility_timer(a0)
		beq.s	Player_ChkShoes						; if there wasn't any time left, that means we're in Super/Hyper mode
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#7,d0
		bne.s	Player_ChkShoes
		subq.b	#1,invincibility_timer(a0)				; reduce invincibility_timer only on every 8th frame
		bne.s	Player_ChkShoes						; if time is still left, branch
		tst.b	(Level_end_flag).w						; don't change music if level is end
		bne.s	Player_RmvInvin
		tst.b	(Boss_flag).w								; don't change music if in a boss fight
		bne.s	Player_RmvInvin
		cmpi.b	#12,air_left(a0)						; don't change music if drowning
		blo.s		Player_RmvInvin
		move.w	(Current_music).w,d0
		jsr	(SMPS_QueueSound1).w					; stop playing invincibility theme and resume normal level music

Player_RmvInvin:
		bclr	#Status_Invincible,status_secondary(a0)
.reset:
		jsr		ResetEmotion

Player_ChkShoes:										; checks if Speed Shoes have expired and disables them if they have.
		btst	#Status_SpeedShoes,status_secondary(a0)	; does Sonic have speed shoes?
		beq.s	Player_ExitChk						; if so, branch
		tst.b	speed_shoes_timer(a0)
		beq.s	Player_ExitChk
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#7,d0
		bne.s	Player_ExitChk
		subq.b	#1,speed_shoes_timer(a0)				; reduce speed_shoes_timer only on every 8th frame
		bne.s	Player_ExitChk
		move.w	#$600,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$C,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$80,Deceleration_P1-Top_speed_P1(a4)
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	loc_10D32	; if Super/Hyper, set different values
		move.w	#$A00,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$30,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$100,Deceleration_P1-Top_speed_P1(a4)
	
loc_10D32:
		bclr	#Status_SpeedShoes,status_secondary(a0)
		music	bgm_Slowdown						; run music at normal speed
		jsr		ResetEmotion

Player_ExitChk:
		rts

		include	"Objects/Player Characters/CPU AI.asm"

; ---------------------------------------------------------------------------
; Subroutine to record Sonic's previous positions for invincibility stars
; and input/status flags for Tails' AI to follow
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_RecordPos:
		cmpa.w	#Player_1,a0
		bne.s	.p2
		move.w	(Pos_table_index).w,d0
		lea	(Pos_table).w,a1
		lea	(a1,d0.w),a1
		move.w	x_pos(a0),(a1)+			; write location to pos_table
		move.w	y_pos(a0),(a1)+
		addq.b	#4,(Pos_table_byte).w		; increment index as the post-increments did a1
		lea	(Stat_table).w,a1
		lea	(a1,d0.w),a1
		move.w	(Ctrl_1_logical).w,(a1)+
		move.b	status(a0),(a1)+
		move.b	art_tile(a0),(a1)+	; Wait, isn't art_tile a word?

	.p2:
		rts

; =============== S U B R O U T I N E =======================================

Reset_Player_Position_Array:
		cmpa.w	#Player_1,a0
		bne.s	.p2
		lea	(Pos_table).w,a1
		lea	(Stat_table).w,a2
		moveq	#$3F,d0

-		move.w	x_pos(a0),(a1)+			; write location to pos_table
		move.w	y_pos(a0),(a1)+
		clr.l	(a2)+
		dbf	d0,-
		clr.w	(Pos_table_index).w
	.p2:
		rts
; ---------------------------------------------------------------------------
; Subroutine for Sonic when he's underwater
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_Water:
		tst.b	(Water_flag).w			; does level have water?
		bne.s	Player_InWater		; if yes, branch

locret_10E2C:
		rts
; ---------------------------------------------------------------------------

Player_InWater:
		move.w	(Water_level).w,d0
		cmp.w	y_pos(a0),d0									; is Sonic above the water?
		bge.w	Player_OutWater								; if yes, branch
		bset	#Status_Underwater,status(a0)						; set underwater flag
		bne.s	locret_10E2C									; if already underwater, branch
		addq.b	#1,(Water_entered_counter).w
		movea.w	a0,a1
		jsr		Player_ResetAirTimer
		cmpa.w	#Player_1,a0
		bne.s	.p2
		move.l	#Obj_Air_CountDown,(v_Breathing_bubbles_P1).w		; load Sonic's breathing bubbles
		move.w	a0,(v_Breathing_bubbles_P1+parent).w
		move.b	#$81,(v_Breathing_bubbles_P1+subtype).w
		bra.s	.cont
	.p2:
		move.l	#Obj_Air_CountDown,(v_Breathing_bubbles_P2).w		; load Sonic's breathing bubbles
		move.w	a0,(v_Breathing_bubbles_P2+parent).w
		move.b	#$81,(v_Breathing_bubbles_P2+subtype).w
	.cont:
		move.w	#$300,Top_speed_P1-Top_speed_P1(a4)
		move.w	#6,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$40,Deceleration_P1-Top_speed_P1(a4)
		cmpa.w	#Player_1,a0
		bne.s	loc_10E82
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	loc_10E82	; if Super/Hyper, set different values
		move.w	#$500,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$18,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$80,Deceleration_P1-Top_speed_P1(a4)

loc_10E82:
		tst.b	object_control(a0)
		bne.s	locret_10E2C
	; Slow player once. The other two happen if they fail to skim.
		asr		y_vel(a0)				; memory operands can only be shifted one bit at a time
		beq.w	locret_10E2C
		move.w	#bytes_to_word(1,0),anim(a6)	; splash animation, write 1 to anim and clear prev_anim
		sfx	sfx_Splash				; splash sound
	; Water skimming, made by me for SHIMA, but I want it here.
		btst	#Status_InAir,status(a0)	; In the air?
		beq.s	.noSkim			; If not, return.
		btst	#Status_Roll,status(a0)	; Spinning?
		beq.s	.noSkim			; If not, return.
		cmpi.b	#id_Roll,anim(a0)	; Are you SUUUUURE?
		beq.s	.contSkim			; If so, get over there.
		cmpi.b	#id_Roll2,anim(a0); ABSOLUTELY FUCKING POSITIVE?
		bne.s	.noSkim			; If so, get over there. If not, gtfo.
	.contSkim:
		cmpi.w	#-$608,x_vel(a0)
		bgt.s	.rightSkim
		bra.s	.skim
	.rightSkim:
		cmpi.w	#$608,x_vel(a0)
		blt.s	.noSkim
	.skim:
		neg.w	y_vel(a0)
		rts
	.noSkim:
		asr	x_vel(a0)
		asr	y_vel(a0)	; slow player.
		rts
; ---------------------------------------------------------------------------

Player_OutWater:
		bclr	#Status_Underwater,status(a0)	; unset underwater flag
		beq.w	locret_10E2C				; if already above water, branch
		addq.b	#1,(Water_entered_counter).w

		movea.w	a0,a1
		jsr		Player_ResetAirTimer
		move.w	#$600,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$C,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$80,Deceleration_P1-Top_speed_P1(a4)
		cmpa.w	#Player_1,a0
		bne.s	loc_10EE0
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	loc_10EE0	; if Super/Hyper, set different values
		move.w	#$A00,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$30,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$100,Deceleration_P1-Top_speed_P1(a4)

loc_10EE0:
		cmpi.b	#id_SonicHurt,routine(a0)		; is Sonic falling back from getting hurt?
		beq.s	loc_10EFC			; if yes, branch
		tst.b	object_control(a0)
		bne.s	loc_10EFC
		move.w	y_vel(a0),d0
		cmpi.w	#-$400,d0
		blt.s		loc_10EFC
		asl	y_vel(a0)

loc_10EFC:
		cmpi.b	#id_Null,anim(a0)	; is Sonic in his 'blank' animation
		beq.w	locret_10E2C			; if so, branch
		tst.w	y_vel(a0)
		beq.w	locret_10E2C
		move.w	#bytes_to_word(1,0),anim(a6)	; splash animation, write 1 to anim and clear prev_anim
		cmpi.w	#-$1000,y_vel(a0)
		bgt.s	loc_10F22
		move.w	#-$1000,y_vel(a0)	; limit upward y velocity exiting the water

loc_10F22:
		sfx	sfx_Splash,1				; splash sound

; =============== S U B R O U T I N E =======================================

Sonic_MdNormal:
		jsr		GetCtrlPressLogical_6btn.d2
		btst	#button_X,d2
		beq.s	+
		sfx		sfx_BubbleAttack
+
		bsr.w	Player_Spindash
		bsr.w	Player_Jump
		bsr.w	Player_SlopeResist
		bsr.w	Player_Move
		bsr.w	Player_Roll
		bsr.w	Player_LevelBound
		jsr	(MoveSprite2_TestGravity).w
		bsr.s	Call_Player_AnglePos
		bra.w	Player_SlopeRepel

; =============== S U B R O U T I N E =======================================

Call_Player_AnglePos:
		tst.b	(Reverse_gravity_flag).w
		beq.w	Player_AnglePos
		move.b	angle(a0),d0
		addi.b	#$40,d0
		neg.b	d0
		subi.b	#$40,d0
		move.b	d0,angle(a0)
		bsr.w	Player_AnglePos
		move.b	angle(a0),d0
		addi.b	#$40,d0
		neg.b	d0
		subi.b	#$40,d0
		move.b	d0,angle(a0)
		rts
; ---------------------------------------------------------------------------
; Start of subroutine Sonic_MdAir
; Called if Sonic is airborne, but not in a ball (thus, probably not jumping)
; Sonic_Stand_Freespace:
Sonic_MdAir:
		bsr.s	Player_SetFallingAnimation
	if RollInAir
		bsr.w	Player_AirRoll
	endif
	.cont:
		bsr.w	Player_JumpHeight
		bsr.w	Player_ChgJumpDir
		bsr.w	Player_LevelBound
		jsr	(MoveSprite_TestGravity).w
		btst	#Status_Underwater,status(a0)	; is Sonic underwater?
		beq.s	loc_10FD6				; if not, branch
		subi.w	#$28,y_vel(a0)			; reduce gravity by $28 ($38-$28=$10)

loc_10FD6:
		bsr.w	Player_JumpAngle
		bra.w	Player_DoLevelCollision

Player_SetFallingAnimation:
		tst.w	y_vel(a0)
		ble.s	.dontSet
		cmpi.b	#id_Spring,anim(a0)
		bne.s	.dontSet
		move.b	#id_Fall,anim(a0)	; change to something like id_Fall if/when you add a falling animation
	.dontSet:
		rts
; ---------------------------------------------------------------------------
; Start of subroutine Sonic_MdRoll
; Called if Sonic is in a ball, but not airborne (thus, probably rolling)
; Sonic_Spin_Path:
Sonic_MdRoll:
		tst.b	spin_dash_flag(a0)
		bne.s	loc_10FEA
		bsr.w	Player_Jump

loc_10FEA:
		bsr.w	Player_RollRepel
		bsr.w	Player_RollSpeed
		bsr.w	Player_LevelBound
		jsr	(MoveSprite2_TestGravity).w
		bsr.w	Call_Player_AnglePos
		bra.w	Player_SlopeRepel
; ---------------------------------------------------------------------------
; Start of subroutine Sonic_MdJump
; Called if Sonic is in a ball and airborne (he could be jumping but not necessarily)
; Notes: This is identical to Sonic_MdAir, at least at this outer level.
; Why they gave it a separate copy of the code, I don't know.
; Sonic_Spin_Freespace:
Sonic_MdJump:
		bsr.s	Player_SetFallingAnimation
		bsr.w	Player_JumpHeight
		bsr.w	Player_ChgJumpDir
		bsr.w	Player_LevelBound
		jsr	(MoveSprite_TestGravity).w
		btst	#Status_Underwater,status(a0)		; is Sonic underwater?
		beq.s	loc_11056					; if not, branch
		subi.w	#$28,y_vel(a0)				; reduce gravity by $28 ($38-$28=$10)

loc_11056:
		bsr.w	Player_JumpAngle
		bra.w	Player_DoLevelCollision

	if RollInAir

; ---------------------------------------------------------------------------
; Subroutine to make Sonic roll
; ---------------------------------------------------------------------------

Player_AirRoll:
		jsr		GetCtrlPressLogical
		andi.b	#btnABC,d0					; read only A/B/C buttons
		beq.s	.ret
		move.b	#id_Roll,anim(a0)				; use "rolling"	animation
;		bset	#2,status(a0)
;		sfx		sfx_AirRoll
;		move.b	#1,jumping(a0)
	.ret:
		rts

	endif

; ---------------------------------------------------------------------------
; Subroutine to make Sonic walk/run
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_Move:
		move.w	Top_speed_P1-Top_speed_P1(a4),d6		; set Top_speed_P1
		move.w	Acceleration_P1-Top_speed_P1(a4),d5	; set Acceleration_P1
		move.w	Deceleration_P1-Top_speed_P1(a4),d4	; set Deceleration_P1
		tst.b	status_secondary(a0)				; is bit 7 set? (Infinite inertia)
		bmi.w	Player_Traction					; if so, branch
		tst.w	move_lock(a0)
		bne.w	Player_ResetScr
		jsr		GetCtrlHeldLogical.d2
		btst	#button_left,d2		; is left being pressed?
		beq.s	Player_NotLeft				; if not, branch
		bsr.w	Player_MoveLeft

Player_NotLeft:
		btst	#button_right,d2	; is right being pressed?
		beq.s	Player_NotRight				; if not, branch
		bsr.w	Player_MoveRight

Player_NotRight:
		move.w	(HScroll_Shift).w,d1
		beq.s	+
		bclr	#Status_Facing,status(a0)
		tst.w	d1
		bpl.s	+
		bset	#Status_Facing,status(a0)
+		move.b	angle(a0),d0
		addi.b	#$20,d0
		andi.b	#$C0,d0						; is Sonic on a slope?
		bne.w	Player_ResetScr					; if yes, branch
		tst.w	ground_vel(a0)				; is Sonic moving?
		bne.w	Player_ResetScr					; if yes, branch
		tst.w	d1
		bne.w	Player_ResetScr
		bclr	#Status_Push,status(a0)
		move.b	#id_Wait,anim(a0)			; use standing animation
		btst	#Status_OnObj,status(a0)
		beq.w	Player_Balance
		movea.w	interact(a0),a1				; load interacting object's RAM space
		tst.b	status(a1)						; is status bit 7 set? (Balance anim off)
		bmi.w	Player_Duck					; if so, branch

		; Calculations to determine where on the object Sonic is, and make him balance accordingly
		moveq	#0,d1						; Clear d1
		move.b	width_pixels(a1),d1			; Load interacting object's width into d1
		move.w	d1,d2						; Move to d2 for seperate calculations
		add.w	d2,d2						; Double object width, converting it to X pos' units of measurement
		subq.w	#2,d2						; Subtract 2: This is the margin for 'on edge'
		add.w	x_pos(a0),d1					; Add Sonic's X position to object width
		sub.w	x_pos(a1),d1					; Subtract object's X position from width+Sonic's X pos, giving you Sonic's distance from left edge of object
		cmpa.w	#Player_1,a0
		bne.s	.cont
		tst.b	(Super_Sonic_Knux_flag).w	; is Sonic Super/Hyper?
		bne.s	SuperPlayer_Balance	; if so, branch
	.cont:
		cmpi.w	#2,d1						; is Sonic within two units of object's left edge?
		blt.s		Player_BalanceOnObjLeft		; if so, branch
		cmp.w	d2,d1
		bge.s	Player_BalanceOnObjRight		; if Sonic is within two units of object's right edge, branch (Realistically, it checks this, and BEYOND the right edge of the object)
		bra.w	Player_Duck					; if Sonic is more than 2 units from both edges, branch
; ---------------------------------------------------------------------------

SuperPlayer_Balance:
		cmpi.w	#2,d1		; is Sonic within two units of object's left edge?
		blt.w	loc_11268	; if so, branch
		cmp.w	d2,d1
		bge.w	loc_11258	; if Sonic is within two units of object's right edge, branch (Realistically, it checks this, and BEYOND the right edge of the object)
		bra.w	Player_Duck	; if Sonic is more than 2 units from both edges, branch
; ---------------------------------------------------------------------------
; balancing checks for when you're on the right edge of an object

Player_BalanceOnObjRight:
		btst	#Status_Facing,status(a0)	; is Sonic facing right?
		bne.s	loc_11128			; if so, branch
		move.b	#id_Balance,anim(a0)	; Balance animation 1
		addq.w	#6,d2				; extend balance range
		cmp.w	d2,d1				; is Sonic within (two units before and) four units past the right edge?
		blt.w	Player_ResetScr			; if so branch
		move.b	#id_Balance2,anim(a0)	; if REALLY close to the edge, use different animation (Balance animation 2)
		bra.w	Player_ResetScr
loc_11128:	; +
		; Somewhat dummied out/redundant code from Sonic 2
		; Originally, Sonic displayed different animations for each direction faced
		; But now, Sonic uses only the one set of animations no matter what, making the check pointless, and the code redundant
		bclr	#Status_Facing,status(a0)
		move.b	#id_Balance,anim(a0)	; Balance animation 1
		addq.w	#6,d2				; extend balance range
		cmp.w	d2,d1				; is Sonic within (two units before and) four units past the right edge?
		blt.w	Player_ResetScr			; if so branch
		move.b	#id_Balance2,anim(a0)	; if REALLY close to the edge, use different animation (Balance animation 2)
		bra.w	Player_ResetScr
; ---------------------------------------------------------------------------

Player_BalanceOnObjLeft:
		btst	#Status_Facing,status(a0)	; is Sonic facing right?
		beq.s	loc_11166
		move.b	#id_Balance,anim(a0)	; Balance animation 1
		cmpi.w	#-4,d1		; is Sonic within (two units before and) four units past the left edge?
		bge.w	Player_ResetScr	; if so branch (instruction signed to match)
		move.b	#id_Balance2,anim(a0)	; if REALLY close to the edge, use different animation (Balance animation 2)
		bra.w	Player_ResetScr
loc_11166:	; +
		; Somewhat dummied out/redundant code from Sonic 2
		; Originally, Sonic displayed different animations for each direction faced
		; But now, Sonic uses only the one set of animations no matter what, making the check pointless, and the code redundant
		bset	#Status_Facing,status(a0)	; is Sonic facing right?
		move.b	#id_Balance,anim(a0)	; Balance animation 1
		cmpi.w	#-4,d1		; is Sonic within (two units before and) four units past the left edge?
		bge.w	Player_ResetScr	; if so branch (instruction signed to match)
		move.b	#id_Balance2,anim(a0)	; if REALLY close to the edge, use different animation (Balance animation 2)
		bra.w	Player_ResetScr
; ---------------------------------------------------------------------------
; balancing checks for when you're on the edge of part of the level
Player_Balance:
		move.w	x_pos(a0),d3
		bsr.w	ChooseChkFloorEdge
		cmpi.w	#$C,d1
		blt.w	Player_Duck
		cmpa.w	#Player_1,a0
		bne.s	.cont
		tst.b	(Super_Sonic_Knux_flag).w	; is Sonic Super/Hyper?
		bne.w	loc_11250			; if so, branch
	.cont:
		cmpi.b	#3,next_tilt(a0)
		bne.s	loc_111F6
		btst	#Status_Facing,status(a0)
		bne.s	loc_111CE
		move.b	#id_Balance,anim(a0)
		move.w	x_pos(a0),d3
		subq.w	#6,d3
		bsr.w	ChooseChkFloorEdge
		cmpi.w	#$C,d1
		blt.w	Player_ResetScr
		move.b	#id_Balance2,anim(a0)
		bra.w	Player_ResetScr
		; on right edge but facing left:
loc_111CE:	; +
		; Somewhat dummied out/redundant code from Sonic 2
		; Originally, Sonic displayed different animations for each direction faced
		; But now, Sonic uses only the one set of animations no matter what, making the check pointless, and the code redundant
		bclr	#Status_Facing,status(a0)
		move.b	#id_Balance,anim(a0)
		move.w	x_pos(a0),d3
		subq.w	#6,d3
		bsr.w	ChooseChkFloorEdge
		cmpi.w	#$C,d1
		blt.w	Player_ResetScr
		move.b	#id_Balance2,anim(a0)
		bra.w	Player_ResetScr
; ---------------------------------------------------------------------------

loc_111F6:
		cmpi.b	#3,tilt(a0)
		bne.s	Player_Duck
		btst	#Status_Facing,status(a0)
		beq.s	loc_11228
		move.b	#id_Balance,anim(a0)
		move.w	x_pos(a0),d3
		addq.w	#6,d3
		bsr.w	ChooseChkFloorEdge
		cmpi.w	#$C,d1
		blt.w	Player_ResetScr
		move.b	#id_Balance2,anim(a0)
		bra.w	Player_ResetScr
; ---------------------------------------------------------------------------

loc_11228:
		bset	#Status_Facing,status(a0)
		move.b	#id_Balance,anim(a0)
		move.w	x_pos(a0),d3
		addq.w	#6,d3
		bsr.w	ChooseChkFloorEdge
		cmpi.w	#$C,d1
		blt.w	Player_ResetScr
		move.b	#id_Balance2,anim(a0)
		bra.w	Player_ResetScr
; ---------------------------------------------------------------------------

loc_11250:
		cmpi.b	#3,next_tilt(a0)
		bne.s	loc_11260

loc_11258:
		bclr	#0,status(a0)
		bra.s	loc_1126E
; ---------------------------------------------------------------------------

loc_11260:
		cmpi.b	#3,tilt(a0)
		bne.s	Player_Duck

loc_11268:
		bset	#0,status(a0)

loc_1126E:
		move.b	#id_Balance,anim(a0)
		bra.w	Player_ResetScr
; ---------------------------------------------------------------------------

Player_Duck:
		tst.w	(HScroll_Shift).w
		bne.s	Player_LookUp
		jsr		GetCtrlHeldLogical
		btst	#button_down,d0
		beq.s	Player_LookUp
		move.b	#id_Duck,anim(a0)
		cmpa.w	#Player_1,a0
		bne.w	Player_UpdateSpeedOnGround
		addq.b	#1,scroll_delay_counter(a0)
		cmpi.b	#2*60,scroll_delay_counter(a0)
		bcs.s	Player_ResetScr_Part2
		move.b	#2*60,scroll_delay_counter(a0)
		tst.b	(Reverse_gravity_flag).w
		bne.s	.reverse
		cmpi.w	#8,(a5)
		beq.s	Player_UpdateSpeedOnGround
		subq.w	#2,(a5)
		bra.s	Player_UpdateSpeedOnGround
.reverse:
		cmpi.w	#$D8,(a5)
		beq.s	Player_UpdateSpeedOnGround
		addq.w	#2,(a5)
		bra.s	Player_UpdateSpeedOnGround
; ---------------------------------------------------------------------------

Player_LookUp:
		jsr		GetCtrlHeldLogical
		btst	#button_up,d0
		beq.s	Player_ResetScr
		move.b	#id_LookUp,anim(a0)
		cmpa.w	#Player_1,a0
		bne.s	Player_UpdateSpeedOnGround
		addq.b	#1,scroll_delay_counter(a0)
		cmpi.b	#2*60,scroll_delay_counter(a0)
		bcs.s	Player_ResetScr_Part2
		move.b	#2*60,scroll_delay_counter(a0)
		tst.b	(Reverse_gravity_flag).w
		bne.s	.reverse
		cmpi.w	#$C8,(a5)
		beq.s	Player_UpdateSpeedOnGround
		addq.w	#2,(a5)
		bra.s	Player_UpdateSpeedOnGround
.reverse:
		cmpi.w	#$18,(a5)
		beq.s	Player_UpdateSpeedOnGround
		subq.w	#2,(a5)
		bra.s	Player_UpdateSpeedOnGround
; ---------------------------------------------------------------------------

Player_ResetScr:
		clr.b	scroll_delay_counter(a0)

Player_ResetScr_Part2:
		cmpa.w	#Player_1,a0
		bne.s	Player_UpdateSpeedOnGround
		cmpi.w	#(224/2)-16,(a5)
		beq.s	Player_UpdateSpeedOnGround
		bcc.s	+
		addq.w	#4,(a5)
+		subq.w	#2,(a5)

; ---------------------------------------------------------------------------
; updates the player's speed on the ground
; ---------------------------------------------------------------------------
; sub_1A5F8:
Player_UpdateSpeedOnGround:
		cmpa.w	#Player_1,a0
		bne.s	loc_11306
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	loc_11306
		move.w	#$C,d5

loc_11306:
		jsr		GetCtrlHeldLogical
		andi.b	#btnL+btnR,d0
		bne.s	Player_Traction
		move.w	ground_vel(a0),d0
		beq.s	Player_Traction
		bmi.s	Player_SettleLeft

; slow down when facing right and not pressing a direction
; Player_SettleRight:
		sub.w	d5,d0
		bcc.s	+
		moveq	#0,d0
+
		move.w	d0,ground_vel(a0)
		bra.s	Player_Traction
; ---------------------------------------------------------------------------

Player_SettleLeft:
		add.w	d5,d0
		bcc.s	+
		moveq	#0,d0
+
		move.w	d0,ground_vel(a0)

; increase or decrease speed on the ground
Player_Traction:
		move.b	angle(a0),d0
		jsr	(GetSineCosine).w
		muls.w	ground_vel(a0),d1
		asr.l	#8,d1
		move.w	d1,x_vel(a0)
		muls.w	ground_vel(a0),d0
		asr.l	#8,d0
		move.w	d0,y_vel(a0)

; stops Sonic from running through walls that meet the ground
Player_CheckWallsOnGround:
		btst	#6,object_control(a0)
		bne.s	locret_113CE
		move.b	angle(a0),d0
		andi.b	#$3F,d0
		beq.s	loc_11370
		move.b	angle(a0),d0
		addi.b	#$40,d0
		bmi.s	locret_113CE

loc_11370:
		move.b	#$40,d1
		tst.w	ground_vel(a0)
		beq.s	locret_113CE
		bmi.s	loc_1137E
		neg.w	d1

loc_1137E:
		move.b	angle(a0),d0
		add.b	d1,d0
		move.w	d0,-(sp)
		bsr.w	CalcRoomInFront
		move.w	(sp)+,d0
		tst.w	d1
		bpl.s	locret_113CE
		asl.w	#8,d1
		addi.b	#$20,d0
		andi.b	#$C0,d0
		beq.s	loc_113F0
		cmpi.b	#$40,d0
		beq.s	loc_113D6
		cmpi.b	#$80,d0
		beq.s	loc_113D0
		add.w	d1,x_vel(a0)
		clr.w	ground_vel(a0)
		btst	#Status_Facing,status(a0)
		bne.s	locret_113CE
		bset	#Status_Push,status(a0)

locret_113CE:
		rts
; ---------------------------------------------------------------------------

loc_113D0:
		sub.w	d1,y_vel(a0)
		rts
; ---------------------------------------------------------------------------

loc_113D6:
		sub.w	d1,x_vel(a0)
		clr.w	ground_vel(a0)
		btst	#Status_Facing,status(a0)
		beq.s	locret_113CE
		bset	#Status_Push,status(a0)
		rts
; ---------------------------------------------------------------------------

loc_113F0:
		add.w	d1,y_vel(a0)
		rts

; =============== S U B R O U T I N E =======================================

Player_MoveLeft:
		move.w	ground_vel(a0),d0
		beq.s	loc_113FE
		bpl.s	Player_TurnLeft

loc_113FE:
		tst.w	(HScroll_Shift).w
		bne.s	loc_11412
		bset	#Status_Facing,status(a0)
		bne.s	loc_11412
		bclr	#Status_Push,status(a0)
		move.b	#id_Run,prev_anim(a0)

loc_11412:
		sub.w	d5,d0
		move.w	d6,d1
		neg.w	d1
		cmp.w	d1,d0
		bgt.s	loc_11424
		add.w	d5,d0
		cmp.w	d1,d0
		ble.s		loc_11424
		move.w	d1,d0

loc_11424:
		move.w	d0,ground_vel(a0)
		clr.b	anim(a0)	; id_Walk
		rts
; ---------------------------------------------------------------------------

Player_TurnLeft:
		sub.w	d4,d0
		bcc.s	loc_11438
		move.w	#-$80,d0

loc_11438:
		move.w	d0,ground_vel(a0)
		move.b	angle(a0),d1
		addi.b	#$20,d1
		andi.b	#$C0,d1
		bne.s	locret_11480
		cmpi.w	#$400,d0
		blt.s		locret_11480
		tst.b	flip_type(a0)
		bmi.s	locret_11480
		sfx	sfx_Skid
		move.b	#id_Stop,anim(a0)
		bclr	#Status_Facing,status(a0)
		cmpi.b	#12,air_left(a0)
		bcs.s	locret_11480
		move.b	#6,routine(a6)			; v_Dust_P1
		move.b	#$15,mapping_frame(a6)	; v_Dust_P1

locret_11480:
		rts

; =============== S U B R O U T I N E =======================================

Player_MoveRight:
		move.w	ground_vel(a0),d0
		bmi.s	Player_TurnRight
		bclr	#Status_Facing,status(a0)
		beq.s	loc_1149C
		bclr	#Status_Push,status(a0)
		move.b	#id_Run,prev_anim(a0)

loc_1149C:
		add.w	d5,d0
		cmp.w	d6,d0
		blt.s		loc_114AA
		sub.w	d5,d0
		cmp.w	d6,d0
		bge.s	loc_114AA
		move.w	d6,d0

loc_114AA:
		move.w	d0,ground_vel(a0)
		clr.b	anim(a0)	; id_Walk
		rts
; ---------------------------------------------------------------------------

Player_TurnRight:
		add.w	d4,d0
		bcc.s	loc_114BE
		move.w	#$80,d0

loc_114BE:
		move.w	d0,ground_vel(a0)
		move.b	angle(a0),d1
		addi.b	#$20,d1
		andi.b	#$C0,d1
		bne.s	locret_11506
		cmpi.w	#-$400,d0
		bgt.s	locret_11506
		tst.b	flip_type(a0)
		bmi.s	locret_11506
		sfx	sfx_Skid
		move.b	#id_Stop,anim(a0)
		bset	#Status_Facing,status(a0)
		cmpi.b	#12,air_left(a0)
		bcs.s	locret_11506
		move.b	#6,routine(a6)			; v_Dust_P1
		move.b	#$15,mapping_frame(a6)	; v_Dust_P1

locret_11506:
		rts

; =============== S U B R O U T I N E =======================================

Player_RollSpeed:
		move.w	(a4),d6
		asl.w	#1,d6
		move.w	Acceleration_P1-Top_speed_P1(a4),d5
		asr.w	#1,d5
		cmpa.w	#Player_1,a0
		bne.s	loc_1151C
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	loc_1151C
		move.w	#6,d5

loc_1151C:
		move.w	#$20,d4
		tst.b	spin_dash_flag(a0)
		bmi.w	loc_115C6
		tst.b	status_secondary(a0)
		bmi.w	loc_115C6
		tst.w	move_lock(a0)
		bne.s	loc_1154E
		jsr		GetCtrlHeldLogical
		btst	#button_left,d0
		beq.s	loc_11542
		bsr.w	sub_11608

loc_11542:
		btst	#button_right,d0
		beq.s	loc_1154E
		bsr.w	sub_1162C

loc_1154E:
		move.w	ground_vel(a0),d0
		beq.s	loc_11570
		bmi.s	loc_11564
		sub.w	d5,d0
		bcc.s	loc_1155E
		moveq	#0,d0

loc_1155E:
		move.w	d0,ground_vel(a0)
		bra.s	loc_11570
; ---------------------------------------------------------------------------

loc_11564:
		add.w	d5,d0
		bcc.s	loc_1156C
		moveq	#0,d0

loc_1156C:
		move.w	d0,ground_vel(a0)

loc_11570:
		move.w	ground_vel(a0),d0
		bpl.s	loc_11578
		neg.w	d0

loc_11578:
		cmpi.w	#$80,d0
		bcc.s	loc_115C6
		tst.b	spin_dash_flag(a0)
		bne.s	loc_115B4
		bclr	#Status_Roll,status(a0)
		move.b	y_radius(a0),d0
		move.b	default_y_radius(a0),y_radius(a0)
		move.b	default_x_radius(a0),x_radius(a0)
		move.b	#id_Wait,anim(a0)
		sub.b	default_y_radius(a0),d0
		ext.w	d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_115AE
		neg.w	d0

loc_115AE:
		add.w	d0,y_pos(a0)
		bra.s	loc_115C6
; ---------------------------------------------------------------------------

loc_115B4:
		move.w	#$400,ground_vel(a0)
		btst	#Status_Facing,status(a0)
		beq.s	loc_115C6
		neg.w	ground_vel(a0)

loc_115C6:
		cmpi.w	#$60,(a5)
		beq.s	loc_115D2
		bcc.s	loc_115D0
		addq.w	#4,(a5)

loc_115D0:
		subq.w	#2,(a5)

loc_115D2:
		move.b	angle(a0),d0
		jsr	(GetSineCosine).w
		muls.w	ground_vel(a0),d0
		asr.l	#8,d0
		move.w	d0,y_vel(a0)
		muls.w	ground_vel(a0),d1
		asr.l	#8,d1
		cmpi.w	#$1000,d1
		ble.s		loc_115F6
		move.w	#$1000,d1

loc_115F6:
		cmpi.w	#-$1000,d1
		bge.s	loc_11600
		move.w	#-$1000,d1

loc_11600:
		move.w	d1,x_vel(a0)
		bra.w	Player_CheckWallsOnGround

; =============== S U B R O U T I N E =======================================

sub_11608:
		move.w	ground_vel(a0),d0
		beq.s	loc_11610
		bpl.s	loc_1161E

loc_11610:
		bset	#Status_Facing,status(a0)
		move.b	#id_Roll,anim(a0)
		rts
; ---------------------------------------------------------------------------

loc_1161E:
		sub.w	d4,d0
		bcc.s	loc_11626
		move.w	#-$80,d0

loc_11626:
		move.w	d0,ground_vel(a0)
		rts

; =============== S U B R O U T I N E =======================================

sub_1162C:
		move.w	ground_vel(a0),d0
		bmi.s	loc_11640
		bclr	#Status_Facing,status(a0)
		move.b	#id_Roll,anim(a0)
		rts
; ---------------------------------------------------------------------------

loc_11640:
		add.w	d4,d0
		bcc.s	loc_11648
		move.w	#$80,d0

loc_11648:
		move.w	d0,ground_vel(a0)
		rts
; ---------------------------------------------------------------------------
; Subroutine for moving Sonic left or right when he's in the air
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_ChgJumpDir:
		move.w	Top_speed_P1-Top_speed_P1(a4),d6
		move.w	Acceleration_P1-Top_speed_P1(a4),d5
		asl.w	#1,d5
		btst	#Status_RollJump,status(a0)
		bne.w	loc_116A2
		move.w	x_vel(a0),d0
		cmpi.b	#c_Tails,character_id(a0)
		bne.s	.notTails
		cmpa.w	#Player_1,a0
		beq.s	.p1
		tst.w	(Tails_CPU_idle_timer).w
		bne.s	.p2
		tst.b	(Flying_carrying_Sonic_flag).w
		bne.s	.p1
	.p2:
		jsr		GetCtrlHeldLogical.d2p2
		bra.s	.cont
	.p1:
		jsr		GetCtrlHeldLogical.d2p1
		bra.s	.cont
	.notTails:
		jsr		GetCtrlHeldLogical.d2
	.cont:
		btst	#button_left,d2
		beq.s	loc_11682
	
		bset	#Status_Facing,status(a0)
		sub.w	d5,d0
		move.w	d6,d1
		neg.w	d1
		cmp.w	d1,d0
		bgt.s	loc_11682
		add.w	d5,d0
		cmp.w	d1,d0
		ble.s	loc_11682
		move.w	d1,d0

loc_11682:
		cmpi.b	#c_Tails,character_id(a0)
		bne.s	.cont
		cmpa.w	#Player_1,a0
		beq.s	.p1
		tst.w	(Tails_CPU_idle_timer).w
		bne.s	.p2
		tst.b	(Flying_carrying_Sonic_flag).w
		bne.s	.p1
	.p2:
		jsr		GetCtrlHeldLogical.d2p2
		bra.s	.cont
	.p1:
		jsr		GetCtrlHeldLogical.d2p1
	.cont:
		btst	#button_right,d2
		beq.s	loc_1169E
		bclr	#Status_Facing,status(a0)
		add.w	d5,d0
		cmp.w	d6,d0
		blt.s		loc_1169E
		sub.w	d5,d0
		cmp.w	d6,d0
		bge.s	loc_1169E
		move.w	d6,d0

loc_1169E:
		move.w	d0,x_vel(a0)

loc_116A2:
		cmpi.w	#$60,(a5)
		beq.s	loc_116AE
		bcc.s	loc_116AC
		addq.w	#4,(a5)

loc_116AC:
		subq.w	#2,(a5)

loc_116AE:
		cmpi.w	#-$400,y_vel(a0)
		bcs.s	locret_116DC
		move.w	x_vel(a0),d0
		move.w	d0,d1
		asr.w	#5,d1
		beq.s	locret_116DC
		bmi.s	loc_116D0
		sub.w	d1,d0
		bcc.s	loc_116CA
		moveq	#0,d0

loc_116CA:
		move.w	d0,x_vel(a0)
		rts
; ---------------------------------------------------------------------------

loc_116D0:
		sub.w	d1,d0
		bcs.s	loc_116D8
		moveq	#0,d0

loc_116D8:
		move.w	d0,x_vel(a0)

locret_116DC:
		rts

; =============== S U B R O U T I N E =======================================

Player_LevelBound:
		move.l	x_pos(a0),d1
		move.w	x_vel(a0),d0
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,d1
		swap	d1
		move.w	(Camera_min_X_pos).w,d0
		addi.w	#$10,d0
		cmp.w	d1,d0
		bhi.s	loc_11732
		move.w	(Camera_max_X_pos).w,d0
		addi.w	#$128,d0
		cmp.w	d1,d0
		bcs.s	loc_11732

Player_Boundary_CheckBottom:
		tst.b	(Reverse_gravity_flag).w
		bne.s	loc_11722
		move.w	(Camera_max_Y_pos).w,d0
		cmp.w	(Camera_target_max_Y_pos).w,d0
		blt.s		locret_11720
		addi.w	#224,d0
		cmp.w	y_pos(a0),d0
		blt.s		Player_Boundary_Bottom

locret_11720:
		rts
; ---------------------------------------------------------------------------

loc_11722:
		move.w	(Camera_min_Y_pos).w,d0
		cmp.w	y_pos(a0),d0
		blt.s		locret_11720

Player_Boundary_Bottom:
		jmp	Kill_Character(pc)
; ---------------------------------------------------------------------------

loc_11732:
		move.w	d0,x_pos(a0)
		clr.w	2+x_pos(a0)
		clr.w	x_vel(a0)
		clr.w	ground_vel(a0)
		bra.s	Player_Boundary_CheckBottom

; =============== S U B R O U T I N E =======================================

Player_Roll:
		tst.b	status_secondary(a0)
		bmi.s	locret_1177E
		tst.w	(HScroll_Shift).w
		bne.s	locret_1177E
		jsr		GetCtrlHeldLogical
		btst	#button_down,d0
		beq.s	loc_11780
		andi.b	#btnL+btnR,d0
		bne.s	locret_1177E
		move.w	ground_vel(a0),d0
		bpl.s	loc_1176A
		neg.w	d0

loc_1176A:
		cmpi.w	#$100,d0
		bcc.s	loc_11790
		btst	#Status_OnObj,status(a0)
		bne.s	locret_1177E
		move.b	#id_Duck,anim(a0)

locret_1177E:
		rts
; ---------------------------------------------------------------------------

loc_11780:
		cmpi.b	#id_Duck,anim(a0)
		bne.s	locret_1177E
		clr.b	anim(a0)	; id_Walk
		rts
; ---------------------------------------------------------------------------

loc_11790:
		btst	#Status_Roll,status(a0)
		beq.s	loc_1179A
		rts
; ---------------------------------------------------------------------------

loc_1179A:
		bset	#Status_Roll,status(a0)
		move.b	#id_Roll,anim(a0)
		cmpi.b	#c_Espio,character_id(a0)
		beq.s	.notReversed
		btst	#Status_Shrunk,status_secondary(a0)
		beq.s	.notShrunk
;		move.w	#bytes_to_word(14/2,7/2),y_radius(a0)	; set y_radius and x_radius
;		subq.w	#1,y_pos(a0)
		bra.s	.gravchk
	.notShrunk:
		move.w	#bytes_to_word(28/2,14/2),y_radius(a0)	; set y_radius and x_radius
		addq.w	#5,y_pos(a0)
	.gravchk:
		tst.b	(Reverse_gravity_flag).w
		beq.s	.notReversed
		subi.w	#$A,y_pos(a0)

.notReversed:
		sfx	sfx_Roll
		tst.w	ground_vel(a0)
		bne.s	locret_117D8
		move.w	#$200,ground_vel(a0)

locret_117D8:
		rts
; ---------------------------------------------------------------------------
; Subroutine allowing Sonic to jump
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_Jump:
		jsr		GetCtrlPressLogical
		andi.b	#btnA+btnB+btnC,d0
		beq.s	locret_117D8
		moveq	#0,d0
		move.b	angle(a0),d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_117FC
		addi.b	#$40,d0
		neg.b	d0
		subi.b	#$40,d0

loc_117FC:
		addi.b	#$80,d0
		movem.l	a4-a6,-(sp)
		bsr.w	CalcRoomOverHead
		movem.l	(sp)+,a4-a6
		cmpi.w	#6,d1
		blt.s		locret_117D8
		move.w	#$680,d2
		btst	#Status_Underwater,status(a0)	; Test if underwater
		beq.s	loc_1182E
		move.w	#$380,d2

loc_1182E:
		cmpa.w	#Player_1,a0
		bne.s	.notSuper
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	.notSuper
		add.w	#$180,d2	; set higher jump speed if super
	.notSuper:
		cmpi.b	#c_Knuckles,character_id(a0)
		bne.s	.notKnux
		sub.w	#$80,d2
	.notKnux:
		moveq	#0,d0
		move.b	angle(a0),d0
		subi.b	#$40,d0
		jsr	(GetSineCosine).w
		muls.w	d2,d1
		asr.l	#8,d1
		add.w	d1,x_vel(a0)
		muls.w	d2,d0
		asr.l	#8,d0
		add.w	d0,y_vel(a0)
		bset	#Status_InAir,status(a0)
		bclr	#Status_Push,status(a0)
		addq.l	#4,sp
		move.b	#1,jumping(a0)
		clr.b	stick_to_convex(a0)
		sfx	sfx_Jump
		move.b	default_y_radius(a0),y_radius(a0)
		move.b	default_x_radius(a0),x_radius(a0)
		btst	#Status_Roll,status(a0)
		bne.s	locret_118B2
		move.b	#id_Roll,anim(a0)
		bset	#Status_Roll,status(a0)
		cmpi.b	#c_Espio,character_id(a0)
		beq.s	locret_118B2
		move.w	#bytes_to_word(28/2,14/2),y_radius(a0)	; set y_radius and x_radius
		btst	#Status_Shrunk,status_secondary(a0)
		beq.s	.notShrunk
		bra.s	.shrunkCont
;		move.w	#bytes_to_word(14/2,7/2),y_radius(a0)	; set y_radius and x_radius
	.notShrunk:
		move.w	#bytes_to_word(28/2,14/2),y_radius(a0)	; set y_radius and x_radius
	.shrunkCont:
		move.b	y_radius(a0),d0
		sub.b	default_y_radius(a0),d0
		ext.w	d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_118AE
		neg.w	d0

loc_118AE:
		sub.w	d0,y_pos(a0)

locret_118B2:
		rts

; =============== S U B R O U T I N E =======================================

Player_JumpHeight:
		tst.b	jumping(a0)	; is Sonic jumping?
		beq.w	Player_UpVelCap						; if not, branch

		move.w	#-$400,d1
		btst	#Status_Underwater,status(a0)				; is Sonic underwater?
		beq.s	.notUnderwater							; if not, branch
		move.w	#-$200,d1							; Underwater-specific
	.notUnderwater:
		cmp.w	y_vel(a0),d1							; is y speed greater than 4? (2 if underwater)
		ble.s	+								; if not, branch
		jsr		GetCtrlHeldLogical
		andi.b	#btnABC,d0					; are buttons A, B or C being pressed?
		bne.s	+							; if yes, branch
		move.w	d1,y_vel(a0)							; cap jump height
+
		tst.b	move_lock(a0)
		bne.w	locret_118E8
	.superchk:
		jsr		GetCtrlPressLogical
		andi.b	#btnABC,d0					; are buttons A, B or C being pressed?
		beq.w	locret_118E8
		cmpi.b	#7,(Super_emerald_count).w	; does Sonic have all 7 Super Emeralds?
		bhs.s	.emeralds			; if yes, branch
		cmpi.b	#7,(Emerald_count).w		; does Sonic have all 7 Chaos Emeralds?
		blo.s	.abilities		; if not, branch
		tst.b	(Emeralds_converted_flag).w
		bne.s	.abilities

	.emeralds:
		cmpi.w	#50,(Ring_count).w	; does Sonic have at least 50 rings?
		blo.s	.abilities	; if not, perform Insta-Shield
		tst.b	(Update_HUD_timer).w
		beq.s	.abilities
		bra.w	Player_Transform

	.abilities:
		moveq	#0,d0
		move.b	character_id(a0),d0
		lsl.w	#2,d0
		movea.l	.playerLUT(pc,d0.w),a1
		jmp		(a1)

	.playerLUT:
		dc.l	Sonic_InstaAndShieldMoves, Tails_Test_For_Flight, Knux_Test_For_Glide, locret_118E8, locret_118E8

locret_118E8:
		rts
; ---------------------------------------------------------------------------

Player_UpVelCap:
		tst.b	spin_dash_flag(a0)						; is Sonic charging his spin dash?
		bne.s	locret_118FE							; if yes, branch
		cmpi.w	#-$FC0,y_vel(a0)						; is Sonic's Y speed faster (less than) than -15.75 (-$FC0)?
		bge.s	locret_118FE							; if not, branch
		move.w	#-$FC0,y_vel(a0)						; cap upward speed

locret_118FE:
		rts
; ---------------------------------------------------------------------------

Sonic_InstaAndShieldMoves:
		cmpa.w	#Player_1,a0
		bne.s	locret_118FE
		tst.b	double_jump_flag(a0)						; is Sonic currently performing a double jump?
		bne.s	locret_118FE							; if yes, branch
		jsr		GetCtrlPressLogical
		andi.b	#btnA+btnB+btnC,d0					; are buttons A, B, or C being pressed?
		beq.s	locret_118FE							; if not, branch
		bclr	#Status_RollJump,status(a0)
		tst.b	(Super_Sonic_Knux_flag).w	; check Super-state
		beq.s	Sonic_FireShield		; if not in a super-state, branch
		bmi.w	Sonic_HyperDash			; if Hyper, branch
		move.b	#1,double_jump_flag(a0)
		rts
; ---------------------------------------------------------------------------

Sonic_FireShield:
		btst	#Status_Invincible,status_secondary(a0)		; first, does Sonic have invincibility?
		bne.s	locret_118FE							; if yes, branch
		btst	#Status_FireShield,status_secondary(a0)		; does Sonic have a Fire Shield?
		beq.s	Sonic_LightningShield					; if not, branch
		move.b	#1,(v_Shield+anim).w
		move.b	#1,double_jump_flag(a0)
		move.w	#$800,d0
		btst	#Status_Facing,status(a0)					; is Sonic facing left?
		beq.s	loc_11958							; if not, branch
		neg.w	d0									; reverse speed value, moving Sonic left

loc_11958:
		move.w	d0,x_vel(a0)							; apply velocity...
		move.w	d0,ground_vel(a0)					; ...both ground and air
		clr.w	y_vel(a0)							; kill y-velocity
		move.w	#$2000,(H_scroll_frame_offset).w
		bsr.w	Reset_Player_Position_Array
		sfx	sfx_FireAttack,1							; play Fire Shield attack sound
; ---------------------------------------------------------------------------

Sonic_LightningShield:
		btst	#Status_LtngShield,status_secondary(a0)		; does Sonic have a Lightning Shield?
		beq.s	Sonic_BubbleShield					; if not, branch
		move.b	#1,(v_Shield+anim).w
		move.b	#1,double_jump_flag(a0)
		move.w	#-$580,y_vel(a0)						; bounce Sonic up, creating the double jump effect
		clr.b	jumping(a0)
		sfx	sfx_ElectricAttack,1						; play Lightning Shield attack sound
; ---------------------------------------------------------------------------

Sonic_BubbleShield:
		btst	#Status_BublShield,status_secondary(a0)		; does Sonic have a Bubble Shield
		beq.s	Sonic_InstaShield						; if not, branch
		move.b	#1,(v_Shield+anim).w
		move.b	#1,double_jump_flag(a0)
		clr.w	x_vel(a0)							; halt horizontal speed...
		clr.w	ground_vel(a0)						; ...both ground and air
		move.w	#$800,y_vel(a0)						; force Sonic down
		sfx	sfx_BubbleAttack,1						; play Bubble Shield attack sound
; ---------------------------------------------------------------------------
Sonic_InstaShield:
		btst	#Status_Shield,status_secondary(a0)		; does Sonic have an S2 shield (The Elementals were already filtered out at this point)?
		bne.s	.ret							; if yes, branch
		move.b	#1,(v_Shield+anim).w
		move.b	#1,double_jump_flag(a0)
		sfx	sfx_InstaAttack,1							; play Insta-Shield sound
	.ret:
		rts
; ---------------------------------------------------------------------------

Player_Transform:
		move.b	#1,(Super_palette_status).w	; set Super/Hyper palette status to 'fading'
		move.b	#$F,(Palette_timer).w
		move.w	#60,(Super_frame_count).w
		move.b	#$81,object_control(a0)
		move.b	#id_Transform,anim(a0)				; enter 'transformation' animation
		cmpi.b	#7,(Super_emerald_count).w		; does Sonic have all 7 Super Emeralds?
		blo.s	.super					; if not, turn Super

		move.b	#-1,(Super_Sonic_Knux_flag).w		; set flag to Hyper Sonic
		music	bgm_SKInvincible					; if invincible, play invincibility music
		move.l	#Obj_HyperSonic_Stars,(v_Invincibility_stars).w	; load Hyper Stars object
		move.l	#Obj_HyperSonicKnux_Trail,(v_Super_stars).w	; load After-Images object
		move.w	a0,(v_Super_stars+parent).w
		bra.s	.continued
; ---------------------------------------------------------------------------

	.super:
		move.b	#1,(Super_Sonic_Knux_flag).w		; set flag to Super Sonic
		music	bgm_S3Invincible					; if invincible, play invincibility music
		move.l	#Obj_SuperSonicKnux_Stars,(v_Super_stars).w	; load Super Stars object

	.continued:
		move.w	#$A00,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$30,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$100,Deceleration_P1-Top_speed_P1(a4)
		move.b	#0,invincibility_timer(a0)
		bset	#Status_Invincible,status_secondary(a0)
		jsr		ResetEmotion.super
		sfx	sfx_SuperTransform, 1
; ---------------------------------------------------------------------------

Sonic_HyperDash:
		bsr.w	HyperAttackTouchResponse
		move.w	#$2000,(H_scroll_frame_offset).w
		bsr.w	Reset_Player_Position_Array
		move.b	#1,double_jump_flag(a0)
		move.b	#1,(v_Invincibility_stars+anim).w	; This causes the screen flash, and sparks to come out of Sonic
		sfx	sfx_Dash
		jsr		GetCtrlHeldLogical
		andi.w	#button_up_mask|button_down_mask|button_left_mask|button_right_mask,d0	; Get D-pad input
		beq.s	.noInput
		; Any values totalling $B or above are produced by holding
		; both opposing directions on the D-pad, which is invalid
		cmpi.b	#$B,d0
		bhs.s	.noInput
		lsl.w	#2,d0
		lea	Sonic_HyperDash_Velocities-4(pc,d0.w),a1
		move.w	(a1)+,d0
		move.w	d0,x_vel(a0)
		move.w	d0,ground_vel(a0)
		move.w	(a1)+,d0
		move.w	d0,y_vel(a0)
		rts
; ---------------------------------------------------------------------------

	.noInput:
		; If there's no directional input, we just dash forward
		move.w	#$800,d0	; Go right...
		btst	#Status_Facing,status(a0)	; ...unless Sonic is facing left...
		beq.s	.applySpeeds
		neg.w	d0		; ...in which case, go left

	.applySpeeds:
		move.w	d0,x_vel(a0)
		move.w	d0,ground_vel(a0)
		move.w	#0,y_vel(a0)
		rts
; End of function Player_JumpHeight

; ---------------------------------------------------------------------------
Sonic_HyperDash_Velocities:
		dc.w      0, -$800	; up
		dc.w      0,  $800	; down
		dc.w      0,     0	; up + down (shouldn't happen)
		dc.w  -$800,     0	; left
		dc.w  -$800, -$800	; left + up
		dc.w  -$800,  $800	; left + down
		dc.w      0,     0	; left + up + down (shouldn't happen)
		dc.w   $800,     0	; right
		dc.w   $800, -$800	; right + up
		dc.w   $800,  $800	; right + down
		; Everything after this would be bad button combinations
; ---------------------------------------------------------------------------


; =============== S U B R O U T I N E =======================================


SonicKnux_SuperHyper:
		cmpa.w	#Player_1,a0
		bne.w	.return
		tst.b	(Super_Sonic_Knux_flag).w
		beq.w	.return		; If not Super/Hyper, return

	.continued:
		tst.b	(Update_HUD_timer).w	; Level over?
		beq.s	.revertToNormal
		subq.w	#1,(Super_frame_count).w
		bhi.w	.return
		move.w	#60,(Super_frame_count).w
		tst.w	(Ring_count).w
		beq.s	.revertToNormal	; If rings depleted, return to normal
		; This checks if the ring counter needs to be blanked
		; for example, this ticks '10' down to ' 9' instead of '19' (yes, this does happen)
		ori.b	#1,(Update_HUD_ring_count).w	; Update ring counter
		cmpi.w	#1,(Ring_count).w
		beq.s	.resetHUD
		cmpi.w	#10,(Ring_count).w
		beq.s	.resetHUD
		cmpi.w	#100,(Ring_count).w
		bne.s	.updateHUD

	.resetHUD:
		ori.b	#$80,(Update_HUD_ring_count).w	; Re-init ring counter

	.updateHUD:
		subq.w	#1,(Ring_count).w
		bne.s	.return	; If rings aren't depleted, we're done here
		; If rings depleted, return to normal

	.revertToNormal:
		move.b	#2,(Super_palette_status).w
		move.w	#$1E,(Palette_frame).w
		clr.b	(Super_Sonic_Knux_flag).w
		move.b	#-1,previous_frame(a0)
		move.b	#id_Run,prev_anim(a0)
		move.b	#1,invincibility_timer(a0)
		move.w	#$600,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$C,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$80,Deceleration_P1-Top_speed_P1(a4)
		btst	#6,status(a0)
		beq.s	.return
		; If underwater, apply corrected speed/acceleration/deceleration
		move.w	#$300,Top_speed_P1-Top_speed_P1(a4)
		move.w	#6,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$40,Deceleration_P1-Top_speed_P1(a4)

	.return:
		rts
; End of function SonicKnux_SuperHyper

; =============== S U B R O U T I N E =======================================

Player_Spindash:
		tst.b	spin_dash_flag(a0)
		bne.s	Player_UpdateSpindash
		cmpi.b	#id_Duck,anim(a0)
		bne.s	.ret
		jsr		GetCtrlPressLogical
		andi.b	#btnA+btnB+btnC,d0
		beq.s	.ret
		move.b	#id_SpinDash,anim(a0)
		sfx	sfx_SpinDash
		addq.l	#4,sp
		move.b	#1,spin_dash_flag(a0)
		clr.w	spin_dash_counter(a0)
		cmpi.b	#12,air_left(a0)
		bcs.s	+
		move.b	#2,anim(a6)		; v_Dust_P1
+
		bsr.w	Player_LevelBound
		bra.w	Call_Player_AnglePos
	.ret:
		rts
; ---------------------------------------------------------------------------

Player_UpdateSpindash:
		jsr		GetCtrlHeldLogical
		btst	#button_down,d0
		bne.w	Player_ChargingSpindash

	; unleash the charged spindash and start rolling quickly:
		move.b	#id_Roll,anim(a0)
		cmpi.b	#c_Espio,character_id(a0)
		beq.s	.notReversed
		btst	#Status_Shrunk,status_secondary(a0)
		beq.s	.notShrunk
;		move.w	#bytes_to_word(14/2,7/2),y_radius(a0)	; set y_radius and x_radius
;		subq.w	#1,y_pos(a0)
		bra.s	.gravchk
	.notShrunk:
		move.w	#bytes_to_word(28/2,14/2),y_radius(a0)	; set y_radius and x_radius
		addq.w	#5,y_pos(a0)
	.gravchk:
		tst.b	(Reverse_gravity_flag).w
		beq.s	.notReversed
		subi.w	#$A,y_pos(a0)
	.notReversed:
		moveq	#0,d0
		move.b	d0,spin_dash_flag(a0)
		move.b	spin_dash_counter(a0),d0
		add.w	d0,d0
		move.w	SpindashSpeeds(pc,d0.w),ground_vel(a0)
		cmpa.w	#Player_1,a0
		bne.s	.notSuper
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	.notSuper
		move.w	SpindashSpeedsSuper(pc,d0.w),ground_vel(a0)
	.notSuper:
		move.w	ground_vel(a0),d0
		subi.w	#$800,d0
		add.w	d0,d0
		andi.w	#$1F00,d0
		neg.w	d0
		addi.w	#$2000,d0
		lea	(H_scroll_frame_offset).w,a1
		move.w	d0,(a1)
		btst	#Status_Facing,status(a0)
		beq.s	.right
		neg.w	ground_vel(a0)
	.right:
		bset	#Status_Roll,status(a0)
		clr.b	anim(a6)		; v_Dust_P1
		sfx	sfx_Dash
		bra.s	Player_Spindash_ResetScr
; ---------------------------------------------------------------------------

SpindashSpeeds:
		dc.w $800
		dc.w $880
		dc.w $900
		dc.w $980
		dc.w $A00
		dc.w $A80
		dc.w $B00
		dc.w $B80
		dc.w $C00
SpindashSpeedsSuper:
		dc.w $B00
		dc.w $B80
		dc.w $C00
		dc.w $C80
		dc.w $D00
		dc.w $D80
		dc.w $E00
		dc.w $E80
		dc.w $F00
; ---------------------------------------------------------------------------

Player_ChargingSpindash:
		tst.w	spin_dash_counter(a0)
		beq.s	+
		move.w	spin_dash_counter(a0),d0
		lsr.w	#5,d0
		sub.w	d0,spin_dash_counter(a0)
		bcc.s	+
		clr.w	spin_dash_counter(a0)
+
		jsr		GetCtrlPressLogical
		andi.b	#btnA+btnB+btnC,d0
		beq.w	Player_Spindash_ResetScr
		move.w	#bytes_to_word(id_SpinDash,id_Walk),anim(a0)
		sfx	sfx_SpinDash
		addi.w	#$200,spin_dash_counter(a0)
		cmpi.w	#$800,spin_dash_counter(a0)
		bcs.s	Player_Spindash_ResetScr
		move.w	#$800,spin_dash_counter(a0)

Player_Spindash_ResetScr:
	if	ExtendedCamera
		moveq	#0,d0
		move.b	spin_dash_counter(a0),d0
		add.w	d0,d0
		move.w	SpindashSpeeds(pc,d0.w),ground_vel(a0)
		btst	#Status_Facing,status(a0)
		beq.s	+
		neg.w	ground_vel(a0)
+
	endif
		addq.l	#4,sp
		cmpa.w	#Player_1,a0
		bne.s	loc_11D6C
		cmpi.w	#$60,(a5)
		beq.s	loc_11D6C
		bcc.s	+
		addq.w	#4,(a5)
+		subq.w	#2,(a5)

loc_11D6C:
		bsr.w	Player_LevelBound
		bra.w	Call_Player_AnglePos

; ---------------------------------------------------------------------------
; Subroutine to slow Sonic walking up a slope
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_SlopeResist:
		move.b	angle(a0),d0
		addi.b	#$60,d0
		cmpi.b	#$C0,d0
		bcc.s	locret_11DDA
		move.b	angle(a0),d0
		jsr	(GetSineCosine).w
		muls.w	#$20,d0
		asr.l	#8,d0
		tst.w	ground_vel(a0)
		beq.s	loc_11DDC
		bmi.s	loc_11DD6
		tst.w	d0
		beq.s	locret_11DD4
		add.w	d0,ground_vel(a0)

locret_11DD4:
		rts
; ---------------------------------------------------------------------------

loc_11DD6:
		add.w	d0,ground_vel(a0)

locret_11DDA:
		rts
; ---------------------------------------------------------------------------

loc_11DDC:
		move.w	d0,d1
		bpl.s	loc_11DE2
		neg.w	d1

loc_11DE2:
		cmpi.w	#$D,d1
		bcs.s	locret_11DDA
		add.w	d0,ground_vel(a0)
		rts

; ---------------------------------------------------------------------------
; Subroutine to push Sonic down a slope while he's rolling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_RollRepel:
		move.b	angle(a0),d0
		addi.b	#$60,d0
		cmpi.b	#$C0,d0
		bcc.s	locret_11E28
		move.b	angle(a0),d0
		jsr	(GetSineCosine).w
		muls.w	#$50,d0
		asr.l	#8,d0
		tst.w	ground_vel(a0)
		bmi.s	loc_11E1E
		tst.w	d0
		bpl.s	loc_11E18
		asr.l	#2,d0

loc_11E18:
		add.w	d0,ground_vel(a0)
		rts
; ---------------------------------------------------------------------------

loc_11E1E:
		tst.w	d0
		bmi.s	loc_11E24
		asr.l	#2,d0

loc_11E24:
		add.w	d0,ground_vel(a0)

locret_11E28:
		rts

; ---------------------------------------------------------------------------
; Subroutine to push Sonic down a slope
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_SlopeRepel:
		tst.b	stick_to_convex(a0)
		bne.s	locret_11E6E
		tst.w	move_lock(a0)
		bne.s	loc_11E86
		move.b	angle(a0),d0
		addi.b	#$18,d0
		cmpi.b	#$30,d0
		bcs.s	locret_11E6E
		move.w	ground_vel(a0),d0
		bpl.s	loc_11E4E
		neg.w	d0

loc_11E4E:
		cmpi.w	#$280,d0
		bcc.s	locret_11E6E
		move.w	#30,move_lock(a0)
		move.b	angle(a0),d0
		addi.b	#$30,d0
		cmpi.b	#$60,d0
		bcs.s	loc_11E70
		bset	#Status_InAir,status(a0)

locret_11E6E:
		rts
; ---------------------------------------------------------------------------

loc_11E70:
		cmpi.b	#$30,d0
		bcs.s	loc_11E7E
		addi.w	#$80,ground_vel(a0)
		rts
; ---------------------------------------------------------------------------

loc_11E7E:
		subi.w	#$80,ground_vel(a0)
		rts
; ---------------------------------------------------------------------------

loc_11E86:
		subq.w	#1,move_lock(a0)
		rts

; ---------------------------------------------------------------------------
; Subroutine to return Sonic's angle to 0 as he jumps
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_JumpAngle:
		move.b	angle(a0),d0	; get Sonic's angle
		beq.s	Player_JumpFlip	; if already 0, branch
		bpl.s	loc_11E9C	; if higher than 0, branch
		addq.b	#2,d0		; increase angle
		bcc.s	loc_11E9A
		moveq	#0,d0

loc_11E9A:
		bra.s	Player_JumpAngleSet
; ---------------------------------------------------------------------------

loc_11E9C:
		subq.b	#2,d0		; decrease angle
		bcc.s	Player_JumpAngleSet
		moveq	#0,d0

Player_JumpAngleSet:
		move.b	d0,angle(a0)
		; continue straight to Player_JumpFlip

; ---------------------------------------------------------------------------
; Updates Sonic's secondary angle if he's tumbling
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Player_JumpFlip:
		move.b	flip_angle(a0),d0
		beq.s	locret_11EEA
		tst.w	ground_vel(a0)
		bmi.s	Player_JumpLeftFlip

Player_JumpRightFlip:
		move.b	flip_speed(a0),d1
		add.b	d1,d0
		bcc.s	loc_11EC8
		subq.b	#1,flips_remaining(a0)
		bcc.s	loc_11EC8
		moveq	#0,d0
		move.b	d0,flips_remaining(a0)

loc_11EC8:
		bra.s	Player_JumpFlipSet
; ---------------------------------------------------------------------------

Player_JumpLeftFlip:
		tst.b	flip_type(a0)
		bmi.s	Player_JumpRightFlip
		move.b	flip_speed(a0),d1
		sub.b	d1,d0
		bcc.s	Player_JumpFlipSet
		subq.b	#1,flips_remaining(a0)
		bcc.s	Player_JumpFlipSet
		moveq	#0,d0
		move.b	d0,flips_remaining(a0)

Player_JumpFlipSet:
		move.b	d0,flip_angle(a0)

locret_11EEA:
		rts

; ---------------------------------------------------------------------------
; Subroutine for Sonic to interact with the floor and walls when he's in the air
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

; Sonic_Floor:
Player_DoLevelCollision:
		move.l	(Primary_collision_addr).w,(Collision_addr).w
		cmpi.b	#$C,top_solid_bit(a0)
		beq.s	+
		move.l	(Secondary_collision_addr).w,(Collision_addr).w
+		move.b	lrb_solid_bit(a0),d5
		move.w	x_vel(a0),d1
		move.w	y_vel(a0),d2
		jsr	(GetArcTan).w
		subi.b	#$20,d0
		andi.b	#$C0,d0
		cmpi.b	#$40,d0
		beq.w	Player_HitLeftWall
		cmpi.b	#$80,d0
		beq.w	Player_HitCeilingAndWalls
		cmpi.b	#$C0,d0
		beq.w	loc_12102
		bsr.w	CheckLeftWallDist
		tst.w	d1
		bpl.s	loc_11F44
		sub.w	d1,x_pos(a0)
		clr.w	x_vel(a0)	; stop Sonic since he hit a wall

loc_11F44:
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_11F56
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)	; stop Sonic since he hit a wall

loc_11F56:
		bsr.w	sub_11FD6
		tst.w	d1
		bpl.s	locret_11FD4
		move.b	y_vel(a0),d2
		addq.b	#8,d2
		neg.b	d2
		cmp.b	d2,d1
		bge.s	loc_11F6E
		cmp.b	d2,d0
		blt.s		locret_11FD4

loc_11F6E:
		move.b	d3,angle(a0)
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_11F7A
		neg.w	d1

loc_11F7A:
		add.w	d1,y_pos(a0)
		move.b	d3,d0
		addi.b	#$20,d0
		andi.b	#$40,d0
		bne.s	loc_11FAE
		move.b	d3,d0
		addi.b	#$10,d0
		andi.b	#$20,d0
		beq.s	loc_11F9C
		asr	y_vel(a0)
		bra.s	loc_11FC2
; ---------------------------------------------------------------------------

loc_11F9C:
		clr.w	y_vel(a0)
		move.w	x_vel(a0),ground_vel(a0)
		bra.w	Player_TouchFloor_Check_Spindash
; ---------------------------------------------------------------------------

loc_11FAE:
		clr.w	x_vel(a0)	; stop Sonic since he hit a wall
		cmpi.w	#$FC0,y_vel(a0)
		ble.s		loc_11FC2
		move.w	#$FC0,y_vel(a0)

loc_11FC2:
		bsr.w	Player_TouchFloor_Check_Spindash
		move.w	y_vel(a0),ground_vel(a0)
		tst.b	d3
		bpl.s	locret_11FD4
		neg.w	ground_vel(a0)

locret_11FD4:
		rts

; =============== S U B R O U T I N E =======================================

sub_11FD6:
		tst.b	(Reverse_gravity_flag).w
		beq.w	Player_CheckFloor
		bsr.w	Player_CheckCeiling
		addi.b	#$40,d3
		neg.b	d3
		subi.b	#$40,d3
		rts

; =============== S U B R O U T I N E =======================================

sub_11FEE:
		tst.b	(Reverse_gravity_flag).w
		beq.w	Player_CheckCeiling
		bsr.w	Player_CheckFloor
		addi.b	#$40,d3
		neg.b	d3
		subi.b	#$40,d3
		rts

; =============== S U B R O U T I N E =======================================

ChooseChkFloorEdge:
		tst.b	(Reverse_gravity_flag).w
		beq.w	ChkFloorEdge_Part2
		bra.w	ChkFloorEdge_ReverseGravity
; ---------------------------------------------------------------------------

Player_HitLeftWall:
		bsr.w	CheckLeftWallDist
		tst.w	d1
		bpl.s	Player_HitCeiling	; branch if distance is positive (not inside wall)
		sub.w	d1,x_pos(a0)
		clr.w	x_vel(a0)		; stop Sonic since he hit a wall
		move.w	y_vel(a0),ground_vel(a0)

Player_HitCeiling:
		bsr.w	sub_11FEE
		tst.w	d1
		bpl.s	loc_12068	; branch if distance is positive (not inside ceiling)
		neg.w	d1
		cmpi.w	#$14,d1
		bcc.s	loc_12054
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_12042
		neg.w	d1

loc_12042:
		add.w	d1,y_pos(a0)
		tst.w	y_vel(a0)
		bpl.s	locret_12052
		clr.w	y_vel(a0)	; stop Sonic in y since he hit a ceiling

locret_12052:
		rts
; ---------------------------------------------------------------------------

loc_12054:
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	locret_12066
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)

locret_12066:
		rts
; ---------------------------------------------------------------------------

loc_12068:
		tst.b	(WindTunnel_flag).w
		bne.s	loc_12074
		tst.w	y_vel(a0)
		bmi.s	locret_1209C

loc_12074:
		bsr.w	sub_11FD6
		tst.w	d1
		bpl.s	locret_1209C
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_12084
		neg.w	d1

loc_12084:
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		clr.w	y_vel(a0)
		move.w	x_vel(a0),ground_vel(a0)
		bsr.w	Player_TouchFloor_Check_Spindash

locret_1209C:
		rts
; ---------------------------------------------------------------------------

Player_HitCeilingAndWalls:
		bsr.w	CheckLeftWallDist
		tst.w	d1
		bpl.s	loc_120B0
		sub.w	d1,x_pos(a0)
		clr.w	x_vel(a0)	; stop Sonic since he hit a wall

loc_120B0:
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_120C2
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)	; stop Sonic since he hit a wall

loc_120C2:
		bsr.w	sub_11FEE
		tst.w	d1
		bpl.s	locret_12100
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_120D2
		neg.w	d1

loc_120D2:
		sub.w	d1,y_pos(a0)
		move.b	d3,d0
		addi.b	#$20,d0
		andi.b	#$40,d0
		bne.s	loc_120EA
		clr.w	y_vel(a0)	; stop Sonic in y since he hit a ceiling
		rts
; ---------------------------------------------------------------------------

loc_120EA:
		move.b	d3,angle(a0)
		bsr.w	Player_TouchFloor_Check_Spindash
		move.w	y_vel(a0),ground_vel(a0)
		tst.b	d3
		bpl.s	locret_12100
		neg.w	ground_vel(a0)

locret_12100:
		rts
; ---------------------------------------------------------------------------

loc_12102:
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_1211A
		add.w	d1,x_pos(a0)
		clr.w	x_vel(a0)
		move.w	y_vel(a0),ground_vel(a0)

loc_1211A:
		bsr.w	sub_11FEE
		tst.w	d1
		bpl.s	loc_1213C
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_1212A
		neg.w	d1

loc_1212A:
		sub.w	d1,y_pos(a0)
		tst.w	y_vel(a0)
		bpl.s	locret_1213A
		clr.w	y_vel(a0)

locret_1213A:
		rts
; ---------------------------------------------------------------------------

loc_1213C:
		tst.b	(WindTunnel_flag).w
		bne.s	loc_12148
		tst.w	y_vel(a0)
		bmi.s	locret_1213A

loc_12148:
		bsr.w	sub_11FD6
		tst.w	d1
		bpl.s	locret_1213A
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_12158
		neg.w	d1

loc_12158:
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		clr.w	y_vel(a0)
		move.w	x_vel(a0),ground_vel(a0)

; =============== S U B R O U T I N E =======================================

Player_TouchFloor_Check_Spindash:
		tst.b	spin_dash_flag(a0)
		bne.s	loc_121D8
		clr.b	anim(a0)	; id_Walk

Player_ResetOnFloor:
		move.b	y_radius(a0),d0
		move.b	default_y_radius(a0),y_radius(a0)
		move.b	default_x_radius(a0),x_radius(a0)
		btst	#Status_Roll,status(a0)
		beq.s	loc_121D8
		bclr	#Status_Roll,status(a0)
		clr.b	anim(a0)	; id_Walk
		sub.b	default_y_radius(a0),d0
		ext.w	d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_121C4
		neg.w	d0

loc_121C4:
		move.w	d0,-(sp)
		move.b	angle(a0),d0
		addi.b	#$40,d0
		bpl.s	loc_121D2
		neg.w	(sp)

loc_121D2:
		move.w	(sp)+,d0
		add.w	d0,y_pos(a0)

loc_121D8:
		bclr	#Status_InAir,status(a0)
		bclr	#Status_Push,status(a0)
		bclr	#Status_RollJump,status(a0)
		tst.w	(Carried_character).w
		beq.s	+
		cmpa.w	(Carried_character).w,a0
		beq.s	+
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.s	+
		move.w	(Carried_character).w,a1
		clr.b	object_control(a1)
		bset	#1,status(a1)
		clr.w	(Flying_carrying_Sonic_flag).w
+
		moveq	#0,d0
		move.b	d0,jumping(a0)
		move.w	d0,(Chain_bonus_counter).w
		move.b	d0,flip_angle(a0)
		move.b	d0,flip_type(a0)
		move.b	d0,flips_remaining(a0)
		move.b	d0,scroll_delay_counter(a0)
		tst.b	double_jump_flag(a0)
		beq.s	locret_12230
		tst.b	character_id(a0)
		bne.s	loc_1222A
		btst	#Status_Invincible,status_secondary(a0)		; don't bounce when invincible... or Super, I guess.
		bne.s	loc_1222A
		btst	#Status_BublShield,status_secondary(a0)
		beq.s	loc_1222A
		bsr.s	BubbleShield_Bounce

loc_1222A:
		clr.b	double_jump_flag(a0)

locret_12230:
		rts

; =============== S U B R O U T I N E =======================================

BubbleShield_Bounce:
		movem.l	d1-d2,-(sp)
		move.w	#$780,d2
		btst	#Status_Underwater,status(a0)
		beq.s	+
		move.w	#$400,d2
+		moveq	#0,d0
		move.b	angle(a0),d0
		subi.b	#$40,d0
		jsr	(GetSineCosine).w
		muls.w	d2,d1
		asr.l	#8,d1
		add.w	d1,x_vel(a0)
		muls.w	d2,d0
		asr.l	#8,d0
		add.w	d0,y_vel(a0)
		movem.l	(sp)+,d1-d2
		bset	#Status_InAir,status(a0)
		bclr	#Status_Push,status(a0)
		move.b	#1,jumping(a0)
		clr.b	stick_to_convex(a0)
		btst	#Status_Shrunk,status_secondary(a0)
		beq.s	.notShrunk
		bra.s	.shrunkCont
;		move.w	#bytes_to_word(14/2,7/2),y_radius(a0)	; set y_radius and x_radius
	.notShrunk:
		move.w	#bytes_to_word(28/2,14/2),y_radius(a0)	; set y_radius and x_radius
	.shrunkCont:
		move.b	#id_Roll,anim(a0)
		bset	#Status_Roll,status(a0)
		move.b	y_radius(a0),d0
		sub.b	default_y_radius(a0),d0
		ext.w	d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	+
		neg.w	d0
+		sub.w	d0,y_pos(a0)
		move.b	#2,(v_Shield+anim).w
		sfx	sfx_BubbleAttack,1
; ---------------------------------------------------------------------------

Player_Hurt:
	if GameDebug
		cmpa.w	#Player_1,a0
		bne.s	+
		tst.b	(Debug_mode_flag).w
		beq.s	+
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		move.w	#1,(Debug_placement_mode).w
		clr.b	(Ctrl_1_locked).w
		rts
; ---------------------------------------------------------------------------
+
	endif
		tst.w	(Carried_character).w
		beq.s	+
		cmpa.w	(Carried_character).w,a0
		beq.s	+
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.s	+
		move.w	(Carried_character).w,a1
		clr.b	object_control(a1)
		bset	#1,status(a1)
		clr.w	(Flying_carrying_Sonic_flag).w
+
		jsr	(MoveSprite2_TestGravity).w
		addi.w	#$30,y_vel(a0)
		btst	#Status_Underwater,status(a0)
		beq.s	loc_122F2
		subi.w	#$20,y_vel(a0)

loc_122F2:
		cmpi.w	#-$100,(Camera_min_Y_pos).w
		bne.s	loc_12302
		move.w	(Screen_Y_wrap_value).w,d0
		and.w	d0,y_pos(a0)

loc_12302:
		bsr.s	sub_12318
		bsr.w	Player_LevelBound
		bsr.w	Player_RecordPos
		bsr.w	sub_125E0
		jmp	(Draw_Sprite).w

; =============== S U B R O U T I N E =======================================

sub_12318:
		tst.b	(Reverse_gravity_flag).w
		bne.s	loc_12336
		move.w	(Camera_max_Y_pos).w,d0
		addi.w	#224,d0
		cmp.w	y_pos(a0),d0
		blt.s		loc_1238A
		bra.s	loc_12344
; ---------------------------------------------------------------------------

loc_12336:
		move.w	(Camera_min_Y_pos).w,d0
		cmp.w	y_pos(a0),d0
		blt.s		loc_12344
		bra.s	loc_1238A
; ---------------------------------------------------------------------------

loc_12344:
		movem.l	a4-a6,-(sp)
		bsr.w	Player_DoLevelCollision
		movem.l	(sp)+,a4-a6
		btst	#Status_InAir,status(a0)
		bne.s	locret_12388
		moveq	#0,d0
		move.w	d0,y_vel(a0)
		move.w	d0,x_vel(a0)
		move.w	d0,ground_vel(a0)
		move.b	d0,object_control(a0)
		clr.b	anim(a0)	; id_Walk
		move.w	#$100,priority(a0)
		move.b	#id_SonicControl,routine(a0)
		move.b	#2*60,invulnerability_timer(a0)
		clr.b	spin_dash_flag(a0)

locret_12388:
		rts
; ---------------------------------------------------------------------------

loc_1238A:
		jmp	Kill_Character(pc)

; =============== S U B R O U T I N E =======================================

Player_Death:
	if GameDebug
		cmpa.w	#Player_1,a0
		bne.s	+
		tst.b	(Debug_mode_flag).w
		beq.s	+
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		move.w	#1,(Debug_placement_mode).w
		clr.b	(Ctrl_1_locked).w
		rts
; ---------------------------------------------------------------------------
+
	endif
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.s	+
		move.w	(Carried_character).w,a1
		clr.b	object_control(a1)
		bset	#1,status(a1)
		clr.w	(Flying_carrying_Sonic_flag).w
+
		bsr.s	sub_123C2
		jsr	(MoveSprite_TestGravity).w
		bsr.w	Player_RecordPos
		bsr.w	sub_125E0
		jmp	(Draw_Sprite).w

; =============== S U B R O U T I N E =======================================

sub_123C2:	; CheckGameOver equivalent
		cmpa.w	#Player_1,a0
		beq.s	.p1
	.p2:
		move.w	(Camera_Y_pos).w,d0
		clr.b	spin_dash_flag(a0)
		tst.b	(Reverse_gravity_flag).w
		beq.s	.notReversed
	; gravity has been reversed
		subi.w	#$10,d0
		cmp.w	y_pos(a0),d0
		bge.s	.respawn	; respawn
		rts
	.notReversed:	; gravity has not been reversed
		addi.w	#$100,d0
		cmp.w	y_pos(a0),d0
		bge.s	locret_124C6
	.respawn:
		move.b	#2,routine(a0)
		bra.w	TailsCPU_Despawn
	.p1:
		move.w	(Camera_Y_pos).w,d0
		st	(Scroll_lock).w
		clr.b	spin_dash_flag(a0)
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_123FA
	; gravity has been reversed
		subi.w	#$10,d0
		cmp.w	y_pos(a0),d0
		bge.s	loc_12410	; respawn
		rts
; ---------------------------------------------------------------------------

loc_123FA:	; gravity has not been reversed
		addi.w	#$100,d0
		cmp.w	y_pos(a0),d0
		bge.s	locret_124C6
	; falls into respawn
loc_12410:	; respawn
		move.b	#id_SonicRestart,routine(a0)
		move.w	#1*60,restart_timer(a0)
		clr.b	(Respawn_table_keep).w

locret_124C6:
		rts

; =============== S U B R O U T I N E =======================================

Player_Restart:
		tst.w	restart_timer(a0)
		beq.s	locret_1258E
		subq.w	#1,restart_timer(a0)
		bne.s	locret_1258E
		st	(Restart_level_flag).w

locret_1258E:
		rts

; =============== S U B R O U T I N E =======================================

loc_12590:
		tst.w	(H_scroll_amount).w
		bne.s	+
		tst.w	(V_scroll_amount).w
		bne.s	+
		move.b	#id_SonicControl,routine(a0)
+		bsr.s	sub_125E0
		jmp	(Draw_Sprite).w

; =============== S U B R O U T I N E =======================================

Player_Drown:
	if GameDebug
		cmpa.w	#Player_1,a0
		bne.s	+
		tst.b	(Debug_mode_flag).w
		beq.s	+
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		move.w	#1,(Debug_placement_mode).w
		clr.b	(Ctrl_1_locked).w
		rts
; ---------------------------------------------------------------------------
+
	endif
		jsr	(MoveSprite2_TestGravity).w
		addi.w	#$10,y_vel(a0)
		bsr.w	Player_RecordPos
		bsr.s	sub_125E0
		jmp	(Draw_Sprite).w

; =============== S U B R O U T I N E =======================================

sub_125E0:
		bsr.s	Animate_Player
		tst.b	(Reverse_gravity_flag).w
		beq.s	+
		eori.b	#2,render_flags(a0)
+		bra.w	Player_Load_PLC

; =============== S U B R O U T I N E =======================================

Animate_Player:
		moveq	#0,d0
		move.b	character_id(a0),d0
		lsl.w	#2,d0
		move.l	.aniRoutLUT(pc,d0.w),a1
		jmp		(a1)

	.aniRoutLUT:
		dc.l	Animate_Sonic, Animate_Tails, Animate_Knuckles, Animate_Mighty, Animate_Espio

Animate_Sonic:
		lea	AniSonic(pc),a1
		cmpa.w	#Player_1,a0
		bne.s	loc_12612
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	loc_12612
		lea	(AniSuperSonic).l,a1

loc_12612:
		moveq	#0,d0
		move.b	anim(a0),d0
		cmp.b	prev_anim(a0),d0
		beq.s	SAnim_Do
		move.b	d0,prev_anim(a0)
		clr.b	anim_frame(a0)
		clr.b	anim_frame_timer(a0)
		bclr	#Status_Push,status(a0)

SAnim_Do:
		add.w	d0,d0
		adda.w	(a1,d0.w),a1
		move.b	(a1),d0
		bmi.s	SAnim_WalkRun
		move.b	status(a0),d1
		andi.b	#1,d1
		andi.b	#-4,render_flags(a0)
		or.b	d1,render_flags(a0)
		subq.b	#1,anim_frame_timer(a0)
		bpl.s	SAnim_Delay
		move.b	d0,anim_frame_timer(a0)

SAnim_Do2:
		moveq	#0,d1
		move.b	anim_frame(a0),d1
		move.b	1(a1,d1.w),d0
		cmpi.b	#-4,d0
		bcc.s	SAnim_End_FF

SAnim_Next:
		move.b	d0,mapping_frame(a0)
		addq.b	#1,anim_frame(a0)

SAnim_Delay:
		rts
; ---------------------------------------------------------------------------

SAnim_End_FF:
		addq.b	#1,d0
		bne.s	SAnim_End_FE
		clr.b	anim_frame(a0)
		move.b	1(a1),d0
		bra.s	SAnim_Next
; ---------------------------------------------------------------------------

SAnim_End_FE:
		addq.b	#1,d0
		bne.s	SAnim_End_FD
		move.b	2(a1,d1.w),d0
		sub.b	d0,anim_frame(a0)
		sub.b	d0,d1
		move.b	1(a1,d1.w),d0
		bra.s	SAnim_Next
; ---------------------------------------------------------------------------

SAnim_End_FD:
		addq.b	#1,d0
		bne.s	SAnim_End
		move.b	2(a1,d1.w),anim(a0)

SAnim_End:
		rts
; ---------------------------------------------------------------------------

SAnim_WalkRun:
		addq.b	#1,d0
		bne.w	loc_12A2A
		moveq	#0,d0
		tst.b	flip_type(a0)
		bmi.w	SAnim_Tumble
		move.b	flip_angle(a0),d0
		bne.w	SAnim_Tumble
		moveq	#0,d1
		move.b	angle(a0),d0
		bmi.s	loc_126C8
		beq.s	loc_126C8
		subq.b	#1,d0

loc_126C8:
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	loc_126D4
		not.b	d0

loc_126D4:
		addi.b	#$10,d0
		bpl.s	loc_126DC
		moveq	#3,d1

loc_126DC:
		andi.b	#-4,render_flags(a0)
		eor.b	d1,d2
		or.b	d2,render_flags(a0)
		btst	#Status_Push,status(a0)
		bne.w	SAnim_Push
		lsr.b	#4,d0
		andi.b	#6,d0
		move.w	ground_vel(a0),d2
		bpl.s	loc_12700
		neg.w	d2

loc_12700:
		add.w	(HScroll_Shift).w,d2
		tst.b	status_secondary(a0)
		bpl.w	loc_1270A
		add.w	d2,d2

loc_1270A:
		cmpa.w	#Player_1,a0
		bne.s	+
		tst.b	(Super_Sonic_Knux_flag).w
		beq.s	+
		lea	SonAni_Mach(pc),a1	; use mach speed animation
		cmpi.w	#$C00,d2
		bcc.s	loc_12724
		lea	SonAni_Run(pc),a1 	; use running	animation
		cmpi.w	#$800,d2
		bcc.s	loc_12724
		lea	SonAni_Walk(pc),a1 	; use walking animation
		add.b	d0,d0
		bra.s	loc_12724
+
		lea	SonAni_Mach(pc),a1	; use mach speed animation
		cmpi.w	#$A00,d2
		bcc.s	loc_12724
		lea	SonAni_Run(pc),a1 	; use running	animation
		cmpi.w	#$600,d2
		bcc.s	loc_12724
		lea	SonAni_Walk(pc),a1 	; use walking animation
		add.b	d0,d0

loc_12724:
		add.b	d0,d0
		move.b	d0,d3
		moveq	#0,d1
		move.b	anim_frame(a0),d1
		move.b	1(a1,d1.w),d0
		cmpi.b	#-1,d0
		bne.s	loc_12742
		clr.b	anim_frame(a0)
		move.b	1(a1),d0

loc_12742:
		move.b	d0,mapping_frame(a0)
		add.b	d3,mapping_frame(a0)
		subq.b	#1,anim_frame_timer(a0)
		bpl.s	locret_12764
		neg.w	d2
		addi.w	#$800,d2
		bpl.s	loc_1275A
		moveq	#0,d2

loc_1275A:
		lsr.w	#8,d2
		move.b	d2,anim_frame_timer(a0)
		addq.b	#1,anim_frame(a0)

locret_12764:
		rts
; ---------------------------------------------------------------------------

SAnim_Tumble:
		move.b	flip_type(a0),d1
		andi.w	#$7F,d1
		bne.w	loc_12872
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	SAnim_Tumble_Left
	SAnim_Tumble_Right:
		andi.b	#-4,render_flags(a0)
		tst.b	flip_type(a0)
		bpl.s	loc_12806
		ori.b	#2,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		bra.s	loc_1280A
; ---------------------------------------------------------------------------

loc_12806:
		addi.b	#$B,d0

loc_1280A:
		divu.w	#$16,d0
		addi.b	#frS_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

SAnim_Tumble_Left:
		andi.b	#-4,render_flags(a0)
		ori.b	#3,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		divu.w	#$16,d0
		addi.b	#frS_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

byte_1286E:
		dc.b frS_Null
		dc.b frS_TumbleStand1
		dc.b frS_TumbleHCylinder1
		dc.b frS_TumbleHCylinder1
; ---------------------------------------------------------------------------

loc_12872:
		move.b	byte_1286E(pc,d1.w),d3
		cmpi.b	#1,d1
		bne.s	loc_128CA
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	loc_128A8
		andi.b	#-4,render_flags(a0)
		addi.b	#-8,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

loc_128A8:
		andi.b	#-4,render_flags(a0)
		ori.b	#1,render_flags(a0)
		addi.b	#-8,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

loc_128CA:
		cmpi.b	#2,d1
		bne.s	loc_12920
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	loc_128FC
		andi.b	#-4,render_flags(a0)
		addi.b	#$B,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

loc_128FC:
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

loc_12920:
		cmpi.b	#3,d1
		bne.s	loc_1297C
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	loc_1295A
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

loc_1295A:
		andi.b	#-4,render_flags(a0)
		ori.b	#1,render_flags(a0)
		addi.b	#$B,d0
		divu.w	#$16,d0
		add.b	d3,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

loc_1297C:
		cmpi.b	#4,d1
		bne.s	loc_129F6
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	loc_129BC
		andi.b	#-4,render_flags(a0)
		tst.b	flip_type(a0)
		bpl.s	loc_129A4
		addi.b	#$B,d0
		bra.s	loc_129A8
; ---------------------------------------------------------------------------

loc_129A4:
		addi.b	#$B,d0

loc_129A8:
		divu.w	#$16,d0
		addi.b	#frS_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

loc_129BC:
		andi.b	#-4,render_flags(a0)
		tst.b	flip_type(a0)
		bpl.s	loc_129D6
		ori.b	#3,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0
		bra.s	loc_129E2
; ---------------------------------------------------------------------------

loc_129D6:
		ori.b	#3,render_flags(a0)
		neg.b	d0
		addi.b	#$8F,d0

loc_129E2:
		divu.w	#$16,d0
		addi.b	#frS_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

loc_129F6:
		move.b	flip_angle(a0),d0
		andi.b	#-4,render_flags(a0)
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		beq.s	loc_12A12
		ori.b	#1,render_flags(a0)

loc_12A12:
		addi.b	#$B,d0
		divu.w	#$16,d0
		addi.b	#frS_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

loc_12A2A:
		move.b	status(a0),d1
		andi.b	#1,d1
		andi.b	#-4,render_flags(a0)
		or.b	d1,render_flags(a0)
		subq.b	#1,anim_frame_timer(a0)
		bpl.w	SAnim_Delay
		move.w	ground_vel(a0),d2
		bpl.s	loc_12A4C
		neg.w	d2

loc_12A4C:
		add.w	(HScroll_Shift).w,d2
		lea	SonAni_Roll2(pc),a1
		cmpi.w	#$600,d2
		bcc.s	loc_12A5E
		lea	SonAni_Roll(pc),a1

loc_12A5E:
		neg.w	d2
		addi.w	#$400,d2
		bpl.s	loc_12A68
		moveq	#0,d2

loc_12A68:
		lsr.w	#8,d2
		move.b	d2,anim_frame_timer(a0)
		bra.w	SAnim_Do2
; ---------------------------------------------------------------------------

SAnim_Push:
		subq.b	#1,anim_frame_timer(a0)
		bpl.w	SAnim_Delay
		move.w	ground_vel(a0),d2
		bmi.s	loc_12A82
		neg.w	d2

loc_12A82:
		addi.w	#$800,d2
		bpl.s	loc_12A8A
		moveq	#0,d2

loc_12A8A:
		lsr.w	#6,d2
		move.b	d2,anim_frame_timer(a0)
		lea	SonAni_Push(pc),a1
		bra.w	SAnim_Do2

; =============== S U B R O U T I N E =======================================
; ---------------------------------------------------------------------------
; Player graphics loading subroutine
; ---------------------------------------------------------------------------



Player_Load_PLC:	; huge thanks to AngelKOR64.
		bsr.w	ReloadPlayerMaps
		moveq	#0,d0
		move.b	mapping_frame(a0),d0

Player_Load_PLC2:
		cmp.b	previous_frame(a0),d0
		beq.s	.noChange
		move.b	d0,previous_frame(a0)
		bsr.w	PlayerDPLCToA2
		add.w	d0,d0
		adda.w	(a2,d0.w),a2
		moveq	#0,d5
		move.w	(a2)+,d5
		subq.w	#1,d5
		bmi.s	.noChange
		move.w	art_tile(a0),d4	; get art tile
		andi.w	#$7FF,d4		; clear art flags
		lsl.w	#5,d4			; get VRAM address
		bsr.w	PlayerArtToD6

	.readEntry:
		moveq	#0,d1
		move.w	(a2)+,d1
		move.w	d1,d3
		lsr.w	#8,d3
		andi.w	#$F0,d3
		addi.w	#$10,d3
		andi.w	#$FFF,d1
		lsl.l	#4,d1
		add.l	d6,d1
		move.w	d4,d2
		add.w	d3,d4
		add.w	d3,d4
		jsr	(Add_To_DMA_Queue).w
		dbf	d5,.readEntry
	.noChange:
		rts
; End of function Player_Load_PLC

ReloadPlayerMaps:
		moveq	#0,d0
		move.b	character_id(a0),d0
		lsl.w	#2,d0
		btst	#Status_Shrunk,status_secondary(a0)
		bne.s	.shrunk
		cmpa.w	#Player_1,a0
		bne.s	.notSuper
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	.super
	.notSuper:
		move.l	.mapLUT(pc,d0.w),mappings(a0)
		rts
	.super:
		move.l	.superMapLUT(pc,d0.w),mappings(a0)
		rts
	.shrunk:
		cmpa.w	#Player_1,a0
		bne.s	.shrunkNotSuper
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	.shrunkSuper
	.shrunkNotSuper:
		move.l	.shrunkMapLUT(pc,d0.w),mappings(a0)
		rts
	.shrunkSuper:
		move.l	.shrunkSuperMapLUT(pc,d0.w),mappings(a0)
		rts

	.mapLUT:
		dc.l	Map_Sonic, Map_Tails, Map_Knuckles, Map_Mighty, Map_Espio
	.superMapLUT:
		dc.l	Map_SuperSonic, Map_Tails, Map_Knuckles, Map_Mighty, Map_Espio
	.shrunkMapLUT:
		dc.l	Map_MiniSonic, Map_Tails, Map_Knuckles, Map_Mighty, Map_Espio
	.shrunkSuperMapLUT:
		dc.l	Map_SuperSonic, Map_Tails, Map_Knuckles, Map_Mighty, Map_Espio

PlayerDPLCToA2:
		moveq	#0,d1
		move.b	character_id(a0),d1
		lsl.w	#2,d1
		btst	#Status_Shrunk,status_secondary(a0)
		bne.s	.shrunk
		cmpa.w	#Player_1,a0
		bne.s	.notSuper
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	.super
	.notSuper:
		movea.l	.plcLUT(pc,d1.w),a2
		rts
	.super:
		movea.l	.superplcLUT(pc,d1.w),a2
		rts
	.shrunk:
		cmpa.w	#Player_1,a0
		bne.s	.shrunkNotSuper
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	.shrunkSuper
	.shrunkNotSuper:
		movea.l	.shrunkPlcLUT(pc,d1.w),a2
		rts
	.shrunkSuper:
		movea.l	.shrunkSuperplcLUT(pc,d1.w),a2
		rts

	.plcLUT:
		dc.l	PLC_Sonic, PLC_Tails, PLC_Knuckles, PLC_Mighty, PLC_Espio
	.superplcLUT:
		dc.l	PLC_SuperSonic, PLC_Tails, PLC_Knuckles, PLC_Mighty, PLC_Espio
	.shrunkPlcLUT:
		dc.l	PLC_MiniSonic, PLC_Tails, PLC_Knuckles, PLC_Mighty, PLC_Espio
	.shrunkSuperplcLUT:
		dc.l	PLC_SuperSonic, PLC_Tails, PLC_Knuckles, PLC_Mighty, PLC_Espio

PlayerArtToD6:
		moveq	#0,d6
		move.b	character_id(a0),d6
		lsl.w	#2,d6
		btst	#Status_Shrunk,status_secondary(a0)
		bne.s	.shrunk
		cmpa.w	#Player_1,a0
		bne.s	.notSuper
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	.super
	.notSuper:
		move.l	.artLUT(pc,d6.w),d6
		rts
	.super:
		move.l	.superartLUT(pc,d6.w),d6
		rts
	.shrunk:
		cmpa.w	#Player_1,a0
		bne.s	.shrunkNotSuper
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	.shrunkSuper
	.shrunkNotSuper:
		move.l	.shrunkArtLUT(pc,d6.w),d6
		rts
	.shrunkSuper:
		move.l	.shrunkSuperartLUT(pc,d6.w),d6
		rts

	.artLUT:
		dc.l	ArtUnc_Sonic>>1, ArtUnc_Tails>>1, ArtUnc_Knuckles>>1, ArtUnc_Mighty>>1, ArtUnc_Espio>>1
	.superartLUT:
		dc.l	ArtUnc_SuperSonic>>1, ArtUnc_Tails>>1, ArtUnc_Knuckles>>1, ArtUnc_Mighty>>1, ArtUnc_Espio>>1
	.shrunkArtLUT:
		dc.l	ArtUnc_MiniSonic>>1, ArtUnc_Tails>>1, ArtUnc_Knuckles>>1, ArtUnc_Mighty>>1, ArtUnc_Espio>>1
	.shrunkSuperartLUT:
		dc.l	ArtUnc_SuperSonic>>1, ArtUnc_Tails>>1, ArtUnc_Knuckles>>1, ArtUnc_Mighty>>1, ArtUnc_Espio>>1


Obj_MiniSonic:
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
		bne.s	MiniSonic_Normal
		tst.w	(Debug_placement_mode).w
		beq.s	MiniSonic_Normal

; Debug only code
		cmpi.b	#1,(Debug_placement_type).w	; Are Sonic in debug object placement mode?
		jeq		DebugMode			; If so, skip to debug mode routine
		; By this point, we're assuming you're in frame cycling mode
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		clr.w	(Debug_placement_mode).w	; Leave debug mode
+		addq.b	#1,mapping_frame(a0)		; Next frame
		cmpi.b	#frS_Last,mapping_frame(a0)	; Have we reached the end of Sonic's frames?
		blo.s		+
		clr.b	mapping_frame(a0)	; If so, reset to Sonic's first frame
+		jsr		Player_Load_PLC
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

MiniSonic_Normal:
	endif
		moveq	#0,d0
		bset	#Status_Shrunk,status_secondary(a0)
		move.b	routine(a0),d0
		move.w	MiniSonic_Index(pc,d0.w),d1
		jmp	MiniSonic_Index(pc,d1.w)
; ---------------------------------------------------------------------------

MiniSonic_Index: offsetTable
		offsetTableEntry.w MiniSonic_Init		; 0
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

MiniSonic_Init:	; Routine 0
		addq.b	#2,routine(a0)				; => Obj01_Control
		move.w	#bytes_to_word(19/2,9/2),y_radius(a0)	; set y_radius and x_radius	; this sets MiniSonic's collision height (2*pixels)
		move.w	#bytes_to_word(19/2,9/2),default_y_radius(a0)	; set default_y_radius and default_x_radius
		move.l	#Map_MiniSonic,mappings(a0)
		move.w	#$100,priority(a0)
		move.w	#bytes_to_word(24/2,24/2),height_pixels(a0)		; set height and width
		move.b	#4,render_flags(a0)
		move.b	#c_Sonic,character_id(a0)
		jmp		Sonic_Init.branchPoint

; ===========================================================================
; ---------------------------------------------------------------------------
; Sonic animation, mapping, and PLC data
; ---------------------------------------------------------------------------

		include "Objects/Player Characters/Object Data/Anim - Sonic.asm"
		include "Objects/Player Characters/Object Data/Map - Sonic.asm"
		include "Objects/Player Characters/Object Data/Sonic pattern load cues.asm"
		include "Objects/Player Characters/Object Data/Map - Super Sonic.asm"
		include "Objects/Player Characters/Object Data/Super Sonic pattern load cues.asm"
		include "Objects/Player Characters/Object Data/Map - Mini Sonic.asm"
		include "Objects/Player Characters/Object Data/Mini Sonic pattern load cues.asm"