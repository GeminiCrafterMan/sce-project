Obj_Tails:
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
		bne.s	Tails_Normal
		tst.w	(Debug_placement_mode).w
		beq.s	Tails_Normal

; Debug only code
		cmpi.b	#1,(Debug_placement_type).w	; Are Sonic in debug object placement mode?
		jeq		DebugMode			; If so, skip to debug mode routine
		; By this point, we're assuming you're in frame cycling mode
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		clr.w	(Debug_placement_mode).w	; Leave debug mode
+		addq.b	#1,mapping_frame(a0)		; Next frame
		cmpi.b	#frT_Last,mapping_frame(a0)	; Have we reached the end of Sonic's frames?
		blo.s		+
		clr.b	mapping_frame(a0)	; If so, reset to Sonic's first frame
+		bsr.w	Player_Load_PLC
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

Tails_Normal:
	endif
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Tails_Index(pc,d0.w),d1
		jmp	Tails_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Tails_Index: offsetTable
		offsetTableEntry.w Tails_Init		; 0
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

Tails_Init:	; Routine 0
		addq.b	#2,routine(a0)				; => Obj01_Control
		move.w	#bytes_to_word(30/2,18/2),y_radius(a0)	; set y_radius and x_radius	; this sets Tails's collision height (2*pixels)
		move.w	#bytes_to_word(30/2,18/2),default_y_radius(a0)	; set default_y_radius and default_x_radius
		move.l	#Map_Tails,mappings(a0)
		move.w	#$100,priority(a0)
		move.w	#bytes_to_word(48/2,48/2),height_pixels(a0)		; set height and width
		move.b	#4,render_flags(a0)
		move.b	#c_Tails,character_id(a0)
		cmpa.w	#Player_1,a0
		bne.s	.p2
		move.l	#Obj_Tails_Tail,(v_FollowObject_P1).w
		move.w	#ArtTile_FollowObject_P1,(v_FollowObject_P1+art_tile).w
		move.w	a0,(v_FollowObject_P1+parent).w
		bra.s	.cont
	.p2:
		move.l	#Obj_Tails_Tail,(v_FollowObject_P2).w
		move.w	#ArtTile_FollowObject_P2,(v_FollowObject_P2+art_tile).w
		move.w	a0,(v_FollowObject_P2+parent).w
	.cont:
		jmp		Sonic_Init.branchPoint

Tails_Control:
		movem.l	a4-a6,-(sp)
		moveq	#0,d0
		move.b	status(a0),d0
		andi.w	#6,d0
		move.w	Tails_Modes(pc,d0.w),d1
		jsr	Tails_Modes(pc,d1.w)	; run Tails's movement control code
		movem.l	(sp)+,a4-a6
		jmp		loc_10C26

; ---------------------------------------------------------------------------
; secondary states under state Player_Control
Tails_Modes: offsetTable
		offsetTableEntry.w Tails_MdNormal		; 0
		offsetTableEntry.w Tails_MdAir			; 2
		offsetTableEntry.w Tails_MdRoll		; 4
		offsetTableEntry.w Tails_MdJump		; 6

; ---------------------------------------------------------------------------
; Start of subroutine Tails_MdNormal
; Called if Tails is neither airborne nor rolling this frame
; ---------------------------------------------------------------------------
; loc_1C00A:
Tails_MdNormal:
		tst.b	(Flying_carrying_Sonic_flag).w
		jeq		Sonic_MdNormal
		move.w	(Carried_character).w,a1
		clr.b	object_control(a1)
		bset	#1,status(a1)
		clr.w	(Flying_carrying_Sonic_flag).w
		clr.w	(Carried_character).w
		jmp		Sonic_MdNormal

; ---------------------------------------------------------------------------
; Start of subroutine Obj_Tails_MdAir
; Called if Tails is airborne, but not in a ball (thus, probably not jumping)
; loc_1C032: Obj_Tails_MdJump
Tails_MdAir:
	tst.b	double_jump_flag(a0)
	bne.s	Tails_FlyingSwimming
	jmp		Sonic_MdAir	; change this to MdAir.cont and put the Player_SetFallingAnimation branch at the start if it fucks up

Tails_FlyingSwimming:
		bsr.w	Tails_Move_FlySwim
		bsr.w	Player_ChgJumpDir
		bsr.w	Player_LevelBound
		jsr	(MoveSprite2_TestGravity).l
		bsr.w	Player_JumpAngle
		movem.l	a4-a6,-(sp)
		bsr.w	Player_DoLevelCollision
		movem.l	(sp)+,a4-a6
		lea	(Flying_carrying_Sonic_flag).w,a2
		cmpa.w	#Player_1,a0
		bne.s	.p2
		lea	(Player_2).w,a1
		move.w	(Ctrl_1).w,d0
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
		move.w	(Ctrl_2).w,d0
		tst.w	(Tails_CPU_idle_timer).w
		beq.s	.cont
		move.w	(Ctrl_1).w,d0
	.cont:
		bsr.w	Tails_Carry_Sonic

locret_14820:
		rts

; =============== S U B R O U T I N E =======================================


Tails_Move_FlySwim:
		move.b	(Level_frame_byte).w,d0
		andi.b	#1,d0
		beq.s	.spamBlock
		tst.b	double_jump_property(a0)
		beq.s	.spamBlock
		subq.b	#1,double_jump_property(a0)

.spamBlock:
		cmpi.b	#1,double_jump_flag(a0)
		beq.s	.control
		cmpi.w	#-$100,y_vel(a0)
		blt.s	.velCap
		subi.w	#$20,y_vel(a0)
		addq.b	#1,double_jump_flag(a0)
		cmpi.b	#$20,double_jump_flag(a0)
		bne.s	.blockTopBranch

.velCap:
		move.b	#1,double_jump_flag(a0)

.blockTopBranch:
		bra.s	.blockTop
; ---------------------------------------------------------------------------

.control:  ; Come back to this one
		cmpa.w	#Player_1,a0
		beq.s	.p1
		tst.w	(Tails_CPU_idle_timer).w
		bne.s	.p2
		tst.b	(Flying_carrying_Sonic_flag).w
		bne.s	.p1
	.p2:
		move.b	(Ctrl_2_pressed_logical).w,d0
		bra.s	.done
	.p1:
		move.b	(Ctrl_1_pressed_logical).w,d0
	.done:
		andi.b	#button_B_mask|button_C_mask|button_A_mask,d0
		beq.s	.carrying
		tst.b	(Flying_carrying_Sonic_flag).w
		bne.s	.cont
	; expanded version of the flight cancel I wrote for SHIMA
		jsr		GetCtrlHeldLogical	; unnecessary ; guess not
		andi.b	#button_down_mask,d0
		beq.s	.cont
		jsr		Player_AirRoll
		bset	#2,status(a0)
		clr.b	jumping(a0)
		rts
	.cont:
	; old SNI, but genuinely a good idea
		cmpi.w	#-$100,y_vel(a0)
		blt.s	.carrying

		tst.b	double_jump_property(a0)
		beq.s	.carrying
		btst	#6,status(a0)
		beq.s	.underwater
		tst.b	(Flying_carrying_Sonic_flag).w
		bne.s	.carrying

	.underwater:
		move.b	#2,double_jump_flag(a0)

	.carrying:
		addi.w	#8,y_vel(a0)

	.blockTop:
		move.w	(Camera_Min_Y_pos).w,d0
		addi.w	#$10,d0
		cmp.w	y_pos(a0),d0
		blt.s	Tails_Set_Flying_Animation
		tst.w	y_vel(a0)
		bpl.s	Tails_Set_Flying_Animation
		move.w	#0,y_vel(a0)
; End of function Tails_Move_FlySwim


; =============== S U B R O U T I N E =======================================

Tails_Set_Flying_Animation:
		btst	#6,status(a0)
		bne.s	loc_14914
		moveq	#id_Ability1,d0	; Fly
		tst.w	y_vel(a0)
		bpl.s	loc_148C4
		moveq	#id_Ability2,d0	; FlyFast

loc_148C4:
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.s	loc_148CC
		addq.b	#2,d0	; set to holding versions

loc_148CC:
		tst.b	double_jump_property(a0)
		bne.s	loc_148F4
		moveq	#id_Ability5,d0
	; An animation for this doesn't exist yet.
;		tst.b	(Flying_carrying_Sonic_flag).w
;		beq.s	+
;		moveq	#AniIDTailsAni_CarryTired,d0		
;	+
		move.b	d0,anim(a0)
		tst.b	render_flags(a0)
		bpl.s	locret_148F2
		move.b	(Level_frame_byte).w,d0
		addq.b	#8,d0
		andi.b	#$F,d0
		bne.s	locret_148F2
		sfx		sfx_FlyTired

locret_148F2:
	rts
; ---------------------------------------------------------------------------

loc_148F4:
		move.b	d0,anim(a0)
		tst.b	render_flags(a0)
		bpl.s	locret_14912
		move.b	(Level_frame_byte).w,d0
		addq.b	#8,d0
		andi.b	#$F,d0
		bne.s	locret_14912
		sfx		sfx_Fly
	
locret_14912:
		rts
; ---------------------------------------------------------------------------

loc_14914:
		moveq	#id_Ability6,d0
		tst.w	y_vel(a0)
		bpl.s	loc_1491E
		moveq	#id_Ability7,d0

loc_1491E:
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.s	loc_14926
		moveq	#id_Ability8,d0

loc_14926:
		tst.b	double_jump_property(a0)
		bne.s	loc_1492E
		moveq	#id_Ability9,d0
loc_1492E:
		move.b	d0,anim(a0)
		rts
; End of function Tails_Set_Flying_Animation

Tails_Test_For_Flight:
		cmpa.w	#Player_1,a0
		beq.s	loc_1515C
		move.b	(Ctrl_1_Logical).w,d0
		andi.b	#button_up_mask,d0
		bne.w	loc_1515C
		tst.w	(Tails_CPU_idle_timer).w
		beq.s	locret_151A2

loc_1515C:
		btst	#2,status(a0)
		beq.s	loc_1518C
		bclr	#2,status(a0)
		move.b	y_radius(a0),d1
		move.b	default_x_radius(a0),x_radius(a0)
		move.b	default_y_radius(a0),y_radius(a0)
		sub.b	default_y_radius(a0),d1
		ext.w	d1
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_15188
		neg.w	d0

loc_15188:
		add.w	d1,y_pos(a0)

loc_1518C:
		bclr	#4,status(a0)
		move.b	#1,double_jump_flag(a0)
		move.b	#-$10,double_jump_property(a0)
		bsr.w	Tails_Set_Flying_Animation

locret_151A2:
		rts

; ===========================================================================
; Start of subroutine Tails_MdRoll
; Called if Tails is in a ball, but not airborne (thus, probably rolling)
; loc_1C05C:
Tails_MdRoll:
		tst.b	(Flying_carrying_Sonic_flag).w
		jeq		Sonic_MdRoll
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
		clr.b	object_control(a1)
		bset	#1,status(a1)
		clr.w	(Flying_carrying_Sonic_flag).w
		clr.w	(Carried_character).w
		jmp		Sonic_MdRoll
; End of subroutine Tails_MdRoll
; ===========================================================================
; Start of subroutine Tails_MdJump
; Called if Tails is in a ball and airborne (he could be jumping but not necessarily)
; Notes: This is identical to Tails_MdAir, at least at this outer level.
;        Why they gave it a separate copy of the code, I don't know.
; loc_1C082: Obj_Tails_MdJump2:
Tails_MdJump:
		tst.b	(Flying_carrying_Sonic_flag).w
		jeq		Sonic_MdJump
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
		clr.b	object_control(a1)
		bset	#1,status(a1)
		clr.w	(Flying_carrying_Sonic_flag).w
		clr.w	(Carried_character).w
		jmp		Sonic_MdJump
; End of subroutine Tails_MdJump

; ---------------------------------------------------------------------------
; Animate Tails
Animate_Tails:
		lea	AniTails(pc),a1
;		tst.b	(Super_Sonic_Knux_flag).w
;		beq.s	Animate_Tails_Part2
;		lea	(AniSuperTails).l,a1
;
Animate_Tails_Part2:
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
		bne.w	.Roll
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
		lea	TailsAni_Mach(pc),a1	; use mach speed animation
		cmpi.w	#$700,d2
		bcc.s	.loc_12724
		lea	TailsAni_Run(pc),a1 	; use running	animation
		cmpi.w	#$600,d2
		bcc.s	.loc_12724
		lea	TailsAni_Walk(pc),a1 	; use walking animation
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
		addi.b	#frT_TumbleWalk1,d0
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
		addi.b	#frT_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.byte_1286E:
		dc.b frT_Null
		dc.b frT_TumbleStand1
		dc.b frT_TumbleHCylinder1
		dc.b frT_TumbleHCylinder1
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
		addi.b	#frT_TumbleWalk1,d0
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
		addi.b	#frT_TumbleWalk1,d0
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
		addi.b	#frT_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.Roll:
		addq.b	#1,d0
		bne.w	.GetTailFrame
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
		lea	TailsAni_Roll2(pc),a1
		cmpi.w	#$600,d2
		bcc.s	.loc_12A5E
		lea	TailsAni_Roll(pc),a1

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
		lea	TailsAni_Push(pc),a1
		bra.w	.Do2
; ---------------------------------------------------------------------------

.GetTailFrame:
		subq.b	#1,anim_frame_timer(a0)
		bpl.w	loc_15A92.ret
		move.w	x_vel(a2),d1
		move.w	y_vel(a2),d2
		jsr	(GetArcTan).l
		moveq	#0,d1
		move.b	status(a0),d2
		andi.b	#1,d2
		bne.s	loc_15A6E
		not.b	d0
		bra.s	loc_15A72
; ---------------------------------------------------------------------------

loc_15A6E:
		addi.b	#$80,d0

loc_15A72:
		addi.b	#$10,d0
		bpl.s	+
		moveq	#3,d1
+
		andi.b	#-4,render_flags(a0)
		eor.b	d1,d2
		or.b	d2,render_flags(a0)
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_15A92
		eori.b	#2,render_flags(a0)

loc_15A92:
		lsr.b	#3,d0
		andi.b	#$C,d0
		move.b	d0,d3
		lea	(AniTails_Tail03).l,a1
		move.b	#3,anim_frame_timer(a0)
		bsr.w	Animate_Tails_Part2.Do2
		add.b	d3,mapping_frame(a0)
	.ret:
		rts
; ---------------------------------------------------------------------------

Obj_Tails_Tail:
		; Init
		move.l	#Map_TailsTails,mappings(a0)
		move.w	#$100,priority(a0)
		move.b	#$18,width_pixels(a0)
		move.b	#$18,height_pixels(a0)
		move.b	#4,render_flags(a0)
		move.l	#Obj_Tails_Tail_Main,(a0)

Obj_Tails_Tail_Main:
		; Here, several SSTs are inheritied from the parent, normally Tails
		movea.w	parent(a0),a2	; Is Parent in S2
		move.b	angle(a2),angle(a0)
		move.b	status(a2),status(a0)
		move.w	x_pos(a2),x_pos(a0)
		move.w	y_pos(a2),y_pos(a0)
		move.w	priority(a2),priority(a0)
		andi.w	#drawing_mask,art_tile(a0)
		tst.w	art_tile(a2)
		bpl.s	loc_16106
		ori.w	#high_priority,art_tile(a0)

loc_16106:
		moveq	#0,d0
		move.b	anim(a2),d0
		; This is checking if parent (Tails) is in its pushing animation
		cmpi.b	#frT_Push1,mapping_frame(a2)
		blo.s	loc_1612C
		cmpi.b	#frT_Push4,mapping_frame(a2)
		bhi.s	loc_1612C
		moveq	#4,d0

loc_1612C:
		cmp.b	objoff_34(a0),d0	; Has the input parent anim changed since last check?
		beq.s	loc_1613C		; If not, branch and skip setting a matching Tails' Tails anim
		move.b	d0,objoff_34(a0)	; Store d0 for the above comparision
		move.b	Obj_Tails_Tail_AniSelection(pc,d0.w),anim(a0)	; Load anim relative to parent's

loc_1613C:
		lea		(AniTails_Tail).l,a1
		bsr.w	Animate_Tails_Part2
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_1615A
		cmpi.b	#3,anim(a0)		; Is this the Directional animation?
		beq.s	loc_1615A		; If so, skip the mirroring
		eori.b	#2,render_flags(a0)	; Reverse the vertical mirror render_flag bit (On if Off beforehand and vice versa)

loc_1615A:
		bsr.w	Tails_Tail_Load_PLC
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------
; animation master script table for the tails
; chooses which animation script to run depending on what Tails is doing

Obj_Tails_Tail_AniSelection:
		dc.b 0,0	; TailsAni_Walk,Run	->
		dc.b 3,3	; TailsAni_Roll,Roll2	-> Directional
		dc.b 9		; TailsAni_Push		-> Pushing
		dc.b 1		; TailsAni_Wait		-> Swish
		dc.b 0		; TailsAni_Balance	-> Blank
		dc.b 2		; TailsAni_LookUp	-> Flick
		dc.b 1		; TailsAni_Duck		-> Swish
		dc.b 7		; TailsAni_Spindash	-> Spindash
		dc.b 0		; TailsAni_MGZHang	->
		dc.b 0		; TailsAni_Balance2	-> Blank
		dc.b 8		; TailsAni_Stop		-> Skidding
		dc.b 0,0	; TailsAni_Float,2	->
		dc.b 0		; TailsAni_Spring	->
		dc.b 0		; TailsAni_LZHang	->
		dc.b 0		; TailsAni_Victory	->
		dc.b $A		; TailsAni_Hang		-> Hanging
		dc.b 0,0,0,0,0,0,0,0,0,0,0		; TailsAni_GetAir,Burnt,Drown,Death,Slide,Hurt,Zapped,Null,Mach,Transform,Fall	->
		dc.b $B,$C	; TailsAni_Fly,FlyFast	-> Fly1,2
		dc.b $B		; TailsAni_FlyHold	-> Fly1
		dc.b $C		; TailsAni_FlyHoldUp	-> Fly2
		dc.b $B		; TailsAni_FlyTired	-> Fly1
		dc.b 0,0	; TailsAni_Swim,SwimFast	->
		dc.b 0		; TailsAni_SwimHoldTired	->
		dc.b 0		; TailsAni_SwimTired	->
	; and a bunch of blanks for good measure
		dc.b 0
		dc.b 0
		dc.b 0
		dc.b 0
		dc.b 0
		dc.b 0
		dc.b 0
		even

Tails_Tail_Load_PLC:
		moveq	#0,d0
		move.b	mapping_frame(a0),d0
		cmp.b	previous_frame(a0),d0
		beq.s	.ret
		move.b	d0,previous_frame(a0)
		lea	(PLC_TailsTails).l,a2
		add.w	d0,d0
		adda.w	(a2,d0.w),a2
		moveq	#0,d5
		move.w	(a2)+,d5
		subq.w	#1,d5
		bmi.s	.ret
		move.w	art_tile(a0),d4    ; get art tile
		andi.w  #$7FF,d4	; clear art flags
		lsl.w   #5,d4	   ; get VRAM address
		move.l	#ArtUnc_TailsTails>>1,d6
		bra.w	Player_Load_PLC2.readentry
	.ret:
		rts

; ===========================================================================
; ---------------------------------------------------------------------------
; Tails animation, mapping, and PLC data
; ---------------------------------------------------------------------------

		include "Objects/Player Characters/Object Data/Anim - Tails.asm"
		include "Objects/Player Characters/Object Data/Map - Tails.asm"
		include "Objects/Player Characters/Object Data/Tails pattern load cues.asm"
		include "Objects/Player Characters/Object Data/Map - Tails tails.asm"
		include "Objects/Player Characters/Object Data/Tails tails pattern load cues.asm"