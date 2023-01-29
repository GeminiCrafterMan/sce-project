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
.control:	jmp	Sonic_Control
.hurt:		jmp	Sonic_Hurt
.death:		jmp	Sonic_Death
.restart:	jmp	Sonic_Restart
.loc_12590:	jmp	loc_12590
.drown:		jmp	Sonic_Drown
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
		move.w	#$600,Top_speed_P1-Top_speed_P1(a4)
		move.w	#$C,Acceleration_P1-Top_speed_P1(a4)
		move.w	#$80,Deceleration_P1-Top_speed_P1(a4)
		tst.b	(Last_star_post_hit).w
		bne.s	Knuckles_Init_Continued
		; only happens when not starting at a checkpoint:
		cmpa.l	#Player_1,a0
		bne.s	.p2
		move.w	#make_art_tile(ArtTile_Sonic,0,0),art_tile(a0)
		bra.s	.cont
	.p2:
		move.w	#make_art_tile(ArtTile_Tails,0,0),art_tile(a0)
	.cont:
		move.w	#bytes_to_word($C,$D),top_solid_bit(a0)

Knuckles_Init_Continued:
		clr.b	flips_remaining(a0)
		move.b	#4,flip_speed(a0)
		clr.b	(Super_Sonic_Knux_flag).w
		move.b	#30,air_left(a0)
		subi.w	#$20,x_pos(a0)
		addi.w	#4,y_pos(a0)
		bsr.w	Reset_Player_Position_Array
		addi.w	#$20,x_pos(a0)
		subi.w	#4,y_pos(a0)
		rts

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