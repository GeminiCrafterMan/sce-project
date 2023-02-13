Obj_Espio:
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
		bne.s	Espio_Normal
		tst.w	(Debug_placement_mode).w
		beq.s	Espio_Normal

; Debug only code
		cmpi.b	#1,(Debug_placement_type).w	; Are Sonic in debug object placement mode?
		jeq		DebugMode			; If so, skip to debug mode routine
		; By this point, we're assuming you're in frame cycling mode
		btst	#button_B,(Ctrl_1_pressed).w
		beq.s	+
		clr.w	(Debug_placement_mode).w	; Leave debug mode
+		addq.b	#1,mapping_frame(a0)		; Next frame
		cmpi.b	#frE_Last,mapping_frame(a0)	; Have we reached the end of Sonic's frames?
		blo.s		+
		clr.b	mapping_frame(a0)	; If so, reset to Sonic's first frame
+		jsr		Player_Load_PLC
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

Espio_Normal:
	endif
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Espio_Index(pc,d0.w),d1
		jmp	Espio_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Espio_Index: offsetTable
		offsetTableEntry.w Espio_Init		; 0
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

Espio_Init:	; Routine 0
		addq.b	#2,routine(a0)				; => Obj01_Control
		move.w	#bytes_to_word(38/2,18/2),y_radius(a0)	; set y_radius and x_radius	; this sets Espio's collision height (2*pixels)
		move.w	#bytes_to_word(38/2,18/2),default_y_radius(a0)	; set default_y_radius and default_x_radius
		move.l	#Map_Espio,mappings(a0)
		move.w	#$100,priority(a0)
		move.w	#bytes_to_word(48/2,48/2),height_pixels(a0)		; set height and width
		move.b	#4,render_flags(a0)
		move.b	#c_Espio,character_id(a0)
		jmp		Sonic_Init.branchPoint

Espio_Control:
		movem.l	a4-a6,-(sp)
		moveq	#0,d0
		move.b	status(a0),d0
		andi.w	#6,d0
		move.w	Espio_Modes(pc,d0.w),d1
		jsr	Espio_Modes(pc,d1.w)	; run Espio's movement control code
		movem.l	(sp)+,a4-a6
		jmp		loc_10C26

; ---------------------------------------------------------------------------
; secondary states under state Player_Control
Espio_Modes: offsetTable
		offsetTableEntry.w Espio_MdNormal		; 0
		offsetTableEntry.w Espio_MdAir			; 2
		offsetTableEntry.w Espio_MdRoll		; 4
		offsetTableEntry.w Espio_MdJump		; 6
; ---------------------------------------------------------------------------
Espio_MdNormal:	jmp	Sonic_MdNormal
Espio_MdAir:		jmp	Sonic_MdAir
Espio_MdRoll:		jmp	Sonic_MdRoll
Espio_MdJump:		jmp	Sonic_MdJump

Animate_Espio:
		lea	AniEspio(pc),a1
;		tst.b	(Super_Sonic_Knux_flag).w
;		beq.s	Animate_Espio_Part2
;		lea	(AniSuperEspio).l,a1
;
;Animate_Espio_Part2:
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
		lea	EspAni_Mach(pc),a1	; use mach speed animation
		cmpi.w	#$A00,d2
		bcc.s	.loc_12724
		lea	EspAni_Run(pc),a1 	; use running	animation
		cmpi.w	#$600,d2
		bcc.s	.loc_12724
		lea	EspAni_Walk(pc),a1 	; use walking animation
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
		addi.b	#frE_TumbleWalk1,d0
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
		addi.b	#frE_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.byte_1286E:
		dc.b frE_Null
		dc.b frE_TumbleStand1
		dc.b frE_TumbleHCylinder1
		dc.b frE_TumbleHCylinder1
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
		addi.b	#frE_TumbleWalk1,d0
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
		addi.b	#frE_TumbleWalk1,d0
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
		addi.b	#frE_TumbleWalk1,d0
		move.b	d0,mapping_frame(a0)
		clr.b	anim_frame_timer(a0)
		rts
; ---------------------------------------------------------------------------

.loc_12A2A:
		move.b	status(a0),d1
		andi.b	#1,d1
		andi.b	#-4,render_flags(a0)
		or.b	d1,render_flags(a0)
		subq.b	#1,anim_frame_timer(a0) ; subtract 1 from frame duration
		bpl.w	.Delay			; if time remains, branch
		moveq	#0,d1
		move.b	angle(a0),d0	; get Espio's angle
		move.b	status(a0),d2
		andi.b	#1,d2		; is Espio mirrored horizontally?
		bne.s	.flip		; if yes, branch
		not.b	d0		; reverse angle

.flip:
		addi.b	#$10,d0		; add $10 to angle
		bpl.s	.noinvert	; if angle is $0-$7F, branch
		moveq	#3,d1

.noinvert:
		andi.b	#-4,render_flags(a0)
		eor.b	d1,d2
		or.b	d2,render_flags(a0)

		lsr.b	#4,d0		; divide angle by $10
		andi.b	#6,d0		; angle	must be	0, 2, 4	or 6
		mvabs.w	x_vel(a0),d2 ; get Espio's speed
;		add.w	(HScroll_Shift).w,d2
		lea	EspAni_Spin2(pc),a1
		cmpi.w	#$600,d2
		bcc.s	.loc_12A5E

		lea	EspAni_Spin(pc),a1

.loc_12A5E:
		move.b	d0,d1
		lsr.b	#1,d1
		add.b	d1,d0

		add.b	d0,d0
		move.b	d0,d3
		neg.w	d2
		addi.w	#$400,d2
		bpl.s	.belowmax
		moveq	#0,d2		; max animation speed

.belowmax:
		lsr.w	#8,d2
		move.b	d2,anim_frame_timer(a0)
		bsr.w	.Do2
		add.b	d3,mapping_frame(a0)	; modify frame number
		rts	
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
		lea	EspAni_Push(pc),a1
		bra.w	.Do2

; ===========================================================================
; ---------------------------------------------------------------------------
; Espio animation, mapping, and PLC data
; ---------------------------------------------------------------------------

		include "Objects/Player Characters/Object Data/Anim - Espio.asm"
		include "Objects/Player Characters/Object Data/Map - Espio.asm"
		include "Objects/Player Characters/Object Data/Espio pattern load cues.asm"