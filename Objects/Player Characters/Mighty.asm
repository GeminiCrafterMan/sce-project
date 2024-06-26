Obj_Mighty:
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
		bne.s	Mighty_Normal
		tst.w	(Debug_placement_mode).w
		beq.s	Mighty_Normal

; Debug only code
		cmpi.b	#1,(Debug_placement_type).w	; Are Sonic in debug object placement mode?
		jeq		DebugMode			; If so, skip to debug mode routine
		; By this point, we're assuming you're in frame cycling mode
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		clr.w	(Debug_placement_mode).w	; Leave debug mode
+		addq.b	#1,mapping_frame(a0)		; Next frame
		cmpi.b	#frM_Last,mapping_frame(a0)	; Have we reached the end of Sonic's frames?
		blo.s		+
		clr.b	mapping_frame(a0)	; If so, reset to Sonic's first frame
+		jsr		Player_Load_PLC
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

Mighty_Normal:
	endif
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Mighty_Index(pc,d0.w),d1
		jmp	Mighty_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Mighty_Index: offsetTable
		offsetTableEntry.w Mighty_Init		; 0
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

Mighty_Init:	; Routine 0
		addq.b	#2,routine(a0)				; => Obj01_Control
		move.w	#bytes_to_word(38/2,18/2),y_radius(a0)	; set y_radius and x_radius	; this sets Mighty's collision height (2*pixels)
		move.w	#bytes_to_word(38/2,18/2),default_y_radius(a0)	; set default_y_radius and default_x_radius
		move.l	#Map_Mighty,mappings(a0)
		move.w	#$100,priority(a0)
		move.w	#bytes_to_word(48/2,48/2),height_pixels(a0)		; set height and width
		move.b	#4,render_flags(a0)
		move.b	#c_Mighty,character_id(a0)
		jmp		Sonic_Init.branchPoint

Mighty_Control:
; Mercury Wall Jump
		tst.b	double_jump_flag(a0)
		beq.s	.nodec
		subq.b	#1,double_jump_flag(a0)
		bne.s	.chkLR
		move.b	#id_Roll,anim(a0) ; use "jumping" animation
		
	.chkLR:
		jsr		GetCtrlHeldLogical
		and.b	double_jump_property(a0),d0	; compare jpad to stored L,R button states
		bne.s	.skip		; if still held, branch
		clr.b	double_jump_flag(a0)	; clear wall jump flag and button states
		clr.b	double_jump_property(a0)	; clear wall jump flag and button states
		move.b	#id_Roll,anim(a0) ; use "jumping" animation
	
	.skip:
		; port smoke here if you wanna make that work
	.nodec:
; end wall jump
		movem.l	a4-a6,-(sp)
		moveq	#0,d0
		move.b	status(a0),d0
		andi.w	#6,d0
		move.w	Mighty_Modes(pc,d0.w),d1
		jsr	Mighty_Modes(pc,d1.w)	; run Mighty's movement control code
		movem.l	(sp)+,a4-a6
		jmp		loc_10C26

; ---------------------------------------------------------------------------
; secondary states under state Player_Control
Mighty_Modes: offsetTable
		offsetTableEntry.w Mighty_MdNormal		; 0
		offsetTableEntry.w Mighty_MdAir			; 2
		offsetTableEntry.w Mighty_MdRoll		; 4
		offsetTableEntry.w Mighty_MdJump		; 6
; ---------------------------------------------------------------------------
Mighty_MdNormal:	jmp	Sonic_MdNormal
; ---------------------------------------------------------------------------
; Start of subroutine Mighty_MdAir
; Called if Mighty is airborne, but not in a ball (thus, probably not jumping)
; Mighty_Stand_Freespace:
Mighty_MdAir:
		jsr		Player_SetFallingAnimation
	if RollInAir
		jsr	Player_AirRoll
	endif
	.cont:
		jsr		Mighty_JumpHeight
		jsr		Player_ChgJumpDir
		jsr		Player_LevelBound
		jsr	(MoveSprite_TestGravity).w
; Mercury Wall Jump
		tst.b	double_jump_flag(a0)
		beq.s	.nowalljump
		subi.w	#$30,y_vel(a0)
		bra.s	.notUnderwater
	
	.nowalljump:
		btst	#Status_Underwater,status(a0)	; is Mighty underwater?
		beq.s	.notUnderwater				; if not, branch
		subi.w	#$28,y_vel(a0)			; reduce gravity by $28 ($38-$28=$10)
; end Wall Jump
.notUnderwater:
		jsr		Player_JumpAngle
		jmp		Player_DoLevelCollision
; ---------------------------------------------------------------------------
Mighty_MdRoll:		jmp	Sonic_MdRoll
; ---------------------------------------------------------------------------
; Start of subroutine Mighty_MdJump
; Called if Mighty is in a ball and airborne (he could be jumping but not necessarily)
; Notes: This is identical to Mighty_MdAir, at least at this outer level.
; Why they gave it a separate copy of the code, I don't know.
; Mighty_Spin_Freespace:
Mighty_MdJump:
		jsr		Player_SetFallingAnimation
		jsr		Mighty_JumpHeight
		jsr		Player_ChgJumpDir
		jsr		Player_LevelBound
		jsr	(MoveSprite_TestGravity).w
; Mercury Wall Jump
		tst.b	double_jump_flag(a0)
		beq.s	.nowalljump
		subi.w	#$30,y_vel(a0)
		bra.s	.notUnderwater
	
	.nowalljump:
		btst	#Status_Underwater,status(a0)	; is Mighty underwater?
		beq.s	.notUnderwater				; if not, branch
		subi.w	#$28,y_vel(a0)			; reduce gravity by $28 ($38-$28=$10)
; end Wall Jump
.notUnderwater:
		jsr		Player_JumpAngle
		jmp		Player_DoLevelCollision
;		jmp		FireShield_ReleaseDropDash	; He can't do that
; ---------------------------------------------------------------------------
Mighty_JumpHeight:
; Mercury Wall Jump
		tst.b	double_jump_flag(a0)	; on wall?
		beq.s	.skip
		jsr		GetCtrlHeldLogical
		andi.b	#btnABC,d0	; is A, B or C pressed?
		beq.s	.skip	; if yes, branch
		clr.b	double_jump_flag(a0)	; clear Wall Jump data
		clr.b	double_jump_property(a0)	; clear Wall Jump data
		move.b	#1,jumping(a0)	;Mercury Constants
		move.b	#id_Roll,anim(a0) ; use "jumping" animation
		move.w	#-$600,d2
		btst	#bitUp,d0
		bne.s	.uponly
		move.w	#-$580,d2
		move.w	#-$400,x_vel(a0)
		btst	#Status_Facing,status(a0)	;Mercury Constants
		beq.s	.uponly
		neg.w	x_vel(a0)
		
	.uponly:
		btst	#Status_Underwater,status(a0)	;Mercury Constants
		beq.s	.nowtr
		addi.w	#$280,d2
		
	.nowtr:
		move.w	d2,y_vel(a0)
		sfx	sfx_Jump	; play jumping sound
		
	.skip:
		jmp		Player_JumpHeight
; End Wall Jump
; ---------------------------------------------------------------------------
Mighty_WallJump:
		cmpi.b	#c_Mighty,character_id(a0)
		bne.s	.return
;		btst	#Status_Push,status(a0) ; this one's a test, redo solidobject changes if it fails
;		bne.s	.return
		tst.b	jumping(a0)	;Mercury Constants
		beq.s	.return
		tst.b	y_vel(a0)
		bmi.s	.return
		jsr		GetCtrlHeldLogical	; get jpad
		andi.b	#(btnL|btnR),d0	; keep just L and R state
		beq.s	.return			; fail if neither are pressed
		cmpi.b	#(btnL|btnR),d0	; fail if both are pressed
		beq.s	.return
		and.b	d1,d0			; keep only L or R depending on d1
		beq.s	.return			; fail if not pressed
		move.b	d0,double_jump_property(a0)	; remember them
		move.w	#0,y_vel(a0)
		move.b	#48,double_jump_flag(a0)	;Mercury Constants
		clr.b	jumping(a0)
		move.b	#id_Ability1,anim(a0)
		sfx		sfx_Grab
		
	.return:
		rts
; ---------------------------------------------------------------------------
Animate_Mighty:
		lea	AniMighty(pc),a1
;		tst.b	(Super_Sonic_Knux_flag).w
;		beq.s	Animate_Mighty_Part2
;		lea	(AniSuperMighty).l,a1
;
;Animate_Mighty_Part2:
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
		lea	MtyAni_Mach(pc),a1	; use mach speed animation
		cmpi.w	#$A00,d2
		bcc.s	.loc_12724
		lea	MtyAni_Run(pc),a1 	; use running	animation
		cmpi.w	#$600,d2
		bcc.s	.loc_12724
		lea	MtyAni_Walk(pc),a1 	; use walking animation
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
		addi.b	#frM_TumbleWalk1,d0
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
		addi.b	#frM_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.byte_1286E:
		dc.b frM_Null
		dc.b frM_TumbleStand1
		dc.b frM_TumbleHCylinder1
		dc.b frM_TumbleHCylinder1
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
		addi.b	#frM_TumbleWalk1,d0
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
		addi.b	#frM_TumbleWalk1,d0
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
		addi.b	#frM_TumbleWalk1,d0
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
		lea	MtyAni_Roll(pc),a1

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
		lea	MtyAni_Push(pc),a1
		bra.w	.Do2
; ===========================================================================

Obj_MightyDeathShell:
		movea.w	parent(a0),a2	; Is Parent in S2
		move.b	angle(a2),angle(a0)
		move.b	status(a2),status(a0)
		move.w	x_pos(a2),x_pos(a0)
		move.w	y_pos(a2),y_pos(a0)
		move.w	height_pixels(a2),height_pixels(a0)
		move.w	y_radius(a2),y_radius(a0)
		move.b	render_flags(a2),render_flags(a0)
		move.b	character_id(a2),character_id(a0)
		move.w	y_vel(a2),y_vel(a0)
		subi.w	#$200,y_vel(a0)
		move.w	x_vel(a2),x_vel(a0)
		lsl.w	#1,x_vel(a0)
		move.l	mappings(a2),mappings(a0)
		move.w	priority(a2),priority(a0)
		andi.w	#drawing_mask,art_tile(a0)
		move.l	#.main,address(a0)
		move.b	#frM_Shell,mapping_frame(a0)
		tst.w	art_tile(a2)
		bpl.s	.main
		ori.w	#high_priority,art_tile(a0)
	.main:
		jsr	(MoveSprite_TestGravity).w
		out_of_yrange.s	.delete
		moveq	#0,d0
		move.b	mapping_frame(a0),d0
		jsr		Player_Load_PLC2
		jmp	(Draw_Sprite).l
	.delete:
		jmp		DeleteObject
; ===========================================================================
; ---------------------------------------------------------------------------
; Mighty animation, mapping, and PLC data
; ---------------------------------------------------------------------------

		include "Objects/Player Characters/Object Data/Anim - Mighty.asm"
Map_Mighty:		binclude "Objects/Player Characters/Object Data/Map - Mighty.bin"
PLC_Mighty:		binclude "Objects/Player Characters/Object Data/PLC - Mighty.bin"