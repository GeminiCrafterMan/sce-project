; =============== S U B R O U T I N E =======================================


CPU_Control:
		move.b	(Ctrl_2_logical).w,d0
		andi.b	#$7F,d0
		beq.s	loc_139DC
		move.w	#600,(Tails_CPU_idle_timer).w

loc_139DC:
		lea	(Player_1).w,a1
		move.b	(Tails_CPU_routine).w,d0
		move.w	CPU_Routines(pc,d0.w),d0
		jmp	CPU_Routines(pc,d0.w)
; End of function Tails_CPU_Control

; ---------------------------------------------------------------------------
CPU_Routines:	offsetTable
		offsetTableEntry.w CPU_Spawn				; 0
		offsetTableEntry.w Tails_Catch_Up_Flying	; 2
		offsetTableEntry.w Tails_FlySwim_Unknown	; 4
		offsetTableEntry.w CPU_PlayerIsDead			; 6
		offsetTableEntry.w loc_13F40				; 8
		offsetTableEntry.w locret_13FC0				; A
		offsetTableEntry.w loc_13FC2				; C
		offsetTableEntry.w loc_13FFA				; E
		offsetTableEntry.w loc_1408A				; 10
		offsetTableEntry.w loc_140C6
		offsetTableEntry.w loc_140CE
		offsetTableEntry.w loc_14106
		offsetTableEntry.w loc_1414C
		offsetTableEntry.w loc_141F2
		offsetTableEntry.w loc_1421C
		offsetTableEntry.w loc_14254
		offsetTableEntry.w loc_1425C
		offsetTableEntry.w loc_14286
; ---------------------------------------------------------------------------

CPU_Spawn:
		move.b	#0,anim(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		move.b	#0,status(a0)

.fallingEntrance:
		move.b	#0,object_control(a0)

loc_13B18:
		move.b	#6,(Tails_CPU_routine).w
		move.w	#0,(Tails_CPU_flight_timer).w
		rts
; ---------------------------------------------------------------------------

Tails_Catch_Up_Flying:
		move.b	(Ctrl_2_logical).w,d0
		andi.b	#$F0,d0
		bne.s	loc_13B50
		move.w	(Level_frame_counter).w,d0
		andi.w	#$3F,d0
		bne.w	locret_13BF6
		tst.b	object_control(a1)
		bmi.w	locret_13BF6
		move.b	status(a1),d0
		andi.b	#$80,d0
		bne.w	locret_13BF6

loc_13B50:
		move.b	#4,(Tails_CPU_routine).w
		move.w	x_pos(a1),d0
		move.w	d0,x_pos(a0)
		move.w	d0,(Tails_CPU_target_X).w
		move.w	y_pos(a1),d0
		move.w	d0,(Tails_CPU_target_Y).w
		subi.w	#$C0,d0
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_13B78
		addi.w	#$180,d0

loc_13B78:
		move.w	d0,y_pos(a0)
		ori.w	#$8000,art_tile(a0)
		move.w	#$100,priority(a0)
		moveq	#0,d0
		move.w	d0,x_vel(a0)
		move.w	d0,y_vel(a0)
		move.w	d0,ground_vel(a0)
		move.b	d0,flip_type(a0)
		move.b	d0,double_jump_flag(a0)
		move.b	#2,status(a0)
		move.b	#$1E,air_left(a0)
		move.b	#$81,object_control(a0)
		move.b	d0,flips_remaining(a0)
		move.b	d0,flip_speed(a0)
		move.w	d0,move_lock(a0)
		move.b	d0,invulnerability_timer(a0)
		move.b	d0,invincibility_timer(a0)
		move.b	d0,speed_shoes_timer(a0)
		move.b	d0,status_tertiary(a0)
		move.b	d0,scroll_delay_counter(a0)
		move.w	d0,next_tilt(a0)
		move.b	d0,stick_to_convex(a0)
		move.b	d0,spin_dash_flag(a0)
		move.b	d0,spin_dash_flag(a0)
		move.w	d0,spin_dash_counter(a0)
		move.b	d0,jumping(a0)
		move.b	d0,jumping+1(a0)	; Uh... The hell is this?
		move.b	#$F0,double_jump_property(a0)
		bsr.w	Tails_Set_Flying_Animation

locret_13BF6:
		rts
; ---------------------------------------------------------------------------

Tails_FlySwim_Unknown:
		tst.b	render_flags(a0)
		bmi.s	loc_13C3A
		addq.w	#1,(Tails_CPU_flight_timer).w
		cmpi.w	#300,(Tails_CPU_flight_timer).w
		blo.s	loc_13C50
		move.w	#0,(Tails_CPU_flight_timer).w
		move.b	#2,(Tails_CPU_routine).w
		move.b	#$81,object_control(a0)
		move.b	#2,status(a0)
		move.w	#0,x_pos(a0)
		move.w	#0,y_pos(a0)
		move.b	#$F0,double_jump_property(a0)
		bsr.w	Tails_Set_Flying_Animation
		rts
; ---------------------------------------------------------------------------

loc_13C3A:
		move.b	#$F0,double_jump_property(a0)
		ori.b	#2,status(a0)
		bsr.w	Tails_Set_Flying_Animation
		move.w	#0,(Tails_CPU_flight_timer).w

loc_13C50:
		lea	(Pos_table).w,a2
		move.w	#$10,d2
		lsl.b	#2,d2
		addq.b	#4,d2
		move.w	(Pos_table_index).w,d3
		sub.b	d2,d3
		move.w	(a2,d3.w),(Tails_CPU_target_X).w
		move.w	2(a2,d3.w),(Tails_CPU_target_Y).w
		move.w	x_pos(a0),d0
		sub.w	(Tails_CPU_target_X).w,d0
		beq.s	loc_13CBE
		move.w	d0,d2
		bpl.s	loc_13C7E
		neg.w	d2

loc_13C7E:
		lsr.w	#4,d2
		cmpi.w	#$C,d2
		blo.s	loc_13C88
		moveq	#$C,d2

loc_13C88:
		move.b	x_vel(a1),d1
		bpl.s	loc_13C90
		neg.b	d1

loc_13C90:
		add.b	d1,d2
		addq.w	#1,d2
		tst.w	d0
		bmi.s	loc_13CAA
		bset	#0,status(a0)
		cmp.w	d0,d2
		blo.s	loc_13CA6
		move.w	d0,d2
		moveq	#0,d0

loc_13CA6:
		neg.w	d2
		bra.s	loc_13CBA
; ---------------------------------------------------------------------------

loc_13CAA:
		bclr	#0,status(a0)
		neg.w	d0
		cmp.w	d0,d2
		blo.s	loc_13CBA
		move.b	d0,d2
		moveq	#0,d0

loc_13CBA:
		add.w	d2,x_pos(a0)

loc_13CBE:
		moveq	#1,d2
		move.w	y_pos(a0),d1
		sub.w	(Tails_CPU_target_Y).w,d1
		beq.s	loc_13CD2
		bmi.s	loc_13CCE
		neg.w	d2

loc_13CCE:
		add.w	d2,y_pos(a0)

loc_13CD2:
		lea	(Stat_table).w,a2
		move.b	2(a2,d3.w),d2
		andi.b	#$80,d2
		bne.s	loc_13D42
		or.w	d0,d1
		bne.s	loc_13D42
		cmpi.b	#6,(Player_1+routine).w
		bhs.s	loc_13D42
		move.b	#6,(Tails_CPU_routine).w
		move.b	#0,object_control(a0)
		move.b	#0,anim(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		andi.b	#$40,status(a0)
		ori.b	#2,status(a0)
		move.w	#0,move_lock(a0)
		andi.w	#$7FFF,art_tile(a0)
		tst.b	art_tile(a1)
		bpl.s	loc_13D34
		ori.w	#$8000,art_tile(a0)

loc_13D34:
		move.b	top_solid_bit(a1),top_solid_bit(a0)
		move.b	lrb_solid_bit(a1),lrb_solid_bit(a0)
		rts
; ---------------------------------------------------------------------------

loc_13D42:
		move.b	#$81,object_control(a0)
		rts
; ---------------------------------------------------------------------------

CPU_PlayerIsDead:
		cmpi.b	#6,(Player_1+routine).w
		blo.s	loc_13D78
		move.b	#4,(Tails_CPU_routine).w
		move.b	#0,spin_dash_flag(a0)
		move.w	#0,spin_dash_counter(a0)
		move.b	#$81,object_control(a0)
		move.b	#2,status(a0)
		move.b	#$20,anim(a0)
		rts
; ---------------------------------------------------------------------------

loc_13D78:
		bsr.w	sub_13EFC
		tst.w	(Tails_CPU_idle_timer).w
		bne.w	loc_13EBE
		tst.b	object_control(a0)
		bmi.w	loc_13EBE
		tst.b	status_tertiary(a1)
		bmi.w	loc_13EBE
		tst.w	move_lock(a0)
		beq.s	loc_13DA6
		tst.w	ground_vel(a0)
		bne.s	loc_13DA6
		move.b	#8,(Tails_CPU_routine).w

loc_13DA6:
		lea	(Pos_table).w,a2
		move.w	#$10,d1
		lsl.b	#2,d1
		addq.b	#4,d1
		move.w	(Pos_table_index).w,d0
		sub.b	d1,d0
		move.w	(a2,d0.w),d2
		btst	#3,status(a1)
		bne.s	loc_13DD0
		cmpi.w	#$400,ground_vel(a1)
		bge.s	loc_13DD0
		subi.w	#$20,d2

loc_13DD0:
		move.w	2(a2,d0.w),d3
		lea	(Stat_table).w,a2
		move.w	(a2,d0.w),d1
		move.b	2(a2,d0.w),d4
		move.w	d1,d0
		btst	#5,status(a0)
		beq.s	loc_13DF2
		btst	#5,d4
		beq.w	loc_13E9C

loc_13DF2:
		sub.w	x_pos(a0),d2
		beq.s	loc_13E50
		bpl.s	loc_13E26
		neg.w	d2
		cmpi.w	#$30,d2
		blo.s	loc_13E0A
		andi.w	#$F3F3,d1
		ori.w	#$404,d1

loc_13E0A:
		tst.w	ground_vel(a0)
		beq.s	loc_13E64
		btst	#0,status(a0)
		beq.s	loc_13E64
		btst	#0,object_control(a0)
		bne.s	loc_13E64
		subq.w	#1,x_pos(a0)
		bra.s	loc_13E64
; ---------------------------------------------------------------------------

loc_13E26:
		cmpi.w	#$30,d2
		blo.s	loc_13E34
		andi.w	#$F3F3,d1
		ori.w	#$808,d1

loc_13E34:
		tst.w	ground_vel(a0)
		beq.s	loc_13E64
		btst	#0,status(a0)
		bne.s	loc_13E64
		btst	#0,object_control(a0)
		bne.s	loc_13E64
		addq.w	#1,x_pos(a0)
		bra.s	loc_13E64
; ---------------------------------------------------------------------------

loc_13E50:
		bclr	#0,status(a0)
		move.b	d4,d0
		andi.b	#1,d0
		beq.s	loc_13E64
		bset	#0,status(a0)

loc_13E64:
		tst.b	(Tails_CPU_auto_jump_flag).w
		beq.s	loc_13E7C
		ori.w	#$7000,d1
		btst	#1,status(a0)
		bne.s	loc_13EB8
		move.b	#0,(Tails_CPU_auto_jump_flag).w

loc_13E7C:
		move.w	(Level_frame_counter).w,d0
		andi.w	#$FF,d0
		beq.s	loc_13E8C
		cmpi.w	#$40,d2
		bhs.s	loc_13EB8

loc_13E8C:
		sub.w	y_pos(a0),d3
		beq.s	loc_13EB8
		bpl.s	loc_13EB8
		neg.w	d3
		cmpi.w	#$20,d3
		blo.s	loc_13EB8

loc_13E9C:
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#$3F,d0
		bne.s	loc_13EB8
		cmpi.b	#8,anim(a0)
		beq.s	loc_13EB8
		ori.w	#$7070,d1
		move.b	#1,(Tails_CPU_auto_jump_flag).w

loc_13EB8:
		move.w	d1,(Ctrl_2_logical).w
		rts
; ---------------------------------------------------------------------------

loc_13EBE:
		tst.w	(Tails_CPU_idle_timer).w
		beq.s	locret_13EC8
		subq.w	#1,(Tails_CPU_idle_timer).w

locret_13EC8:
		rts

; =============== S U B R O U T I N E =======================================


sub_13ECA:
		move.w	#0,(Tails_CPU_idle_timer).w
		move.w	#0,(Tails_CPU_flight_timer).w
		move.b	#2,(Tails_CPU_routine).w
		move.b	#$81,object_control(a0)
		move.b	#2,status(a0)
		move.w	#$7F00,x_pos(a0)
		move.w	#0,y_pos(a0)
		move.b	#0,double_jump_flag(a0)
		rts
; End of function sub_13ECA


; =============== S U B R O U T I N E =======================================


sub_13EFC:
		tst.b	render_flags(a0)
		bmi.s	loc_13F28
		btst	#3,status(a0)
		beq.s	loc_13F18
		moveq	#0,d0
		movea.w	interact(a0),a3
		move.w	(Tails_CPU_interact).w,d0
		cmp.w	(a3),d0
		bne.s	loc_13F24

loc_13F18:
		addq.w	#1,(Tails_CPU_flight_timer).w
		cmpi.w	#300,(Tails_CPU_flight_timer).w
		blo.s	loc_13F2E

loc_13F24:
		bra.w	sub_13ECA
; ---------------------------------------------------------------------------

loc_13F28:
		move.w	#0,(Tails_CPU_flight_timer).w

loc_13F2E:
		btst	#3,status(a0)
		beq.s	locret_13F3E
		movea.w	interact(a0),a3
		move.w	(a3),(Tails_CPU_interact).w

locret_13F3E:
		rts
; End of function sub_13EFC

; ---------------------------------------------------------------------------

loc_13F40:
		bsr.w	sub_13EFC
		tst.w	(Tails_CPU_idle_timer).w
		bne.w	locret_13FBE
		tst.w	move_lock(a0)
		bne.s	locret_13FBE
		tst.b	spin_dash_flag(a0)
		bne.s	loc_13F94
		tst.w	ground_vel(a0)
		bne.s	locret_13FBE
		bclr	#0,status(a0)
		move.w	x_pos(a0),d0
		sub.w	x_pos(a1),d0
		bcs.s	loc_13F74
		bset	#0,status(a0)

loc_13F74:
		move.w	#$202,(Ctrl_2_logical).w
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#$7F,d0
		beq.s	loc_13FA4
		cmpi.b	#8,anim(a0)
		bne.s	locret_13FBE
		move.w	#$7272,(Ctrl_2_logical).w
		rts
; ---------------------------------------------------------------------------

loc_13F94:
		move.w	#$202,(Ctrl_2_logical).w
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#$7F,d0
		bne.s	loc_13FB2

loc_13FA4:
		move.w	#0,(Ctrl_2_logical).w
		move.b	#6,(Tails_CPU_routine).w
		rts
; ---------------------------------------------------------------------------

loc_13FB2:
		andi.b	#$1F,d0
		bne.s	locret_13FBE
		ori.w	#$7070,(Ctrl_2_logical).w

locret_13FBE:
		rts
; ---------------------------------------------------------------------------

locret_13FC0:
		rts
; ---------------------------------------------------------------------------

loc_13FC2:
		move.b	#1,double_jump_flag(a0)
		move.b	#$F0,double_jump_property(a0)
		move.b	#2,status(a0)
		move.w	#$100,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		lea	(Player_1).w,a1
		bsr.w	sub_1459E
		move.b	#1,(Flying_carrying_Sonic_flag).w
		move.b	#$E,(Tails_CPU_routine).w

loc_13FFA:
		move.w	#0,(Tails_CPU_idle_timer).w
		move.w	#0,(Ctrl_2_logical).w
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#$1F,d0
		bne.s	loc_14016
		ori.w	#$808,(Ctrl_2_logical).w

loc_14016:
		lea	(Flying_carrying_Sonic_flag).w,a2
		lea	(Player_1).w,a1
		btst	#1,status(a1)
		bne.s	loc_14082
		move.b	#6,(Tails_CPU_routine).w
		move.b	#0,object_control(a0)
		move.b	#0,anim(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		move.b	#2,status(a0)
		move.w	#0,move_lock(a0)
		andi.w	#$7FFF,art_tile(a0)
		tst.b	art_tile(a1)
		bpl.s	loc_14068
		ori.w	#$8000,art_tile(a0)

loc_14068:
		move.b	top_solid_bit(a1),top_solid_bit(a0)
		move.b	lrb_solid_bit(a1),lrb_solid_bit(a0)
		cmpi.w	#1,(Player_mode).w	; Sonic alone?
		bne.s	loc_14082
		move.b	#$10,(Tails_CPU_routine).w

loc_14082:
		move.w	(Ctrl_1).w,d0
		bra.w	Tails_Carry_Sonic
; ---------------------------------------------------------------------------

loc_1408A:
		move.w	#0,(Tails_CPU_idle_timer).w
		move.b	#$F0,double_jump_property(a0)
		move.w	#0,(Ctrl_2_logical).w
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#$F,d0
		bne.s	loc_140AC
		ori.w	#$7878,(Ctrl_2_logical).w

loc_140AC:
		tst.b	render_flags(a0)
		bmi.s	locret_140C4
		moveq	#0,d0
		move.l	d0,(a0)
		move.w	d0,x_pos(a0)
		move.w	d0,y_pos(a0)
		move.b	#$A,(Tails_CPU_routine).w

locret_140C4:
		rts
; ---------------------------------------------------------------------------

loc_140C6:
		move.w	#0,(Ctrl_2_logical).w
		rts
; ---------------------------------------------------------------------------

loc_140CE:
		move.b	#1,double_jump_flag(a0)
		move.b	#$F0,double_jump_property(a0)
		move.b	#2,status(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		lea	(Player_1).w,a1
		bsr.w	sub_1459E
		move.b	#1,(Flying_carrying_Sonic_flag).w
		move.b	#$16,(Tails_CPU_routine).w

loc_14106:
		move.w	#0,(Tails_CPU_idle_timer).w
		move.b	#$F0,double_jump_property(a0)
		move.w	#0,(Ctrl_2_logical).w
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#7,d0
		bne.s	loc_14128
		ori.w	#$7070,(Ctrl_2_logical).w

loc_14128:
		move.w	(Camera_Y_pos).w,d0
		addi.w	#$90,d0
		cmp.w	y_pos(a0),d0
		blo.s	loc_1413C
		move.b	#$18,(Tails_CPU_routine).w

loc_1413C:
		lea	(Flying_carrying_Sonic_flag).w,a2
		lea	(Player_1).w,a1
		move.w	(Ctrl_1).w,d0
		bra.w	Tails_Carry_Sonic
; ---------------------------------------------------------------------------

loc_1414C:
		move.b	#$F0,double_jump_property(a0)
		tst.w	(Tails_CPU_idle_timer).w
		beq.s	loc_14164
		tst.b	(Flying_carrying_Sonic_flag).w
		bne.w	loc_141E2
		bra.w	loc_142E2
; ---------------------------------------------------------------------------

loc_14164:
		move.w	#0,(Ctrl_2_logical).w
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.w	loc_142E2
		clr.b	(_unkFAAC).w
		btst	#1,(Ctrl_1).w
		beq.s	loc_14198
		addq.b	#1,(Tails_CPU_auto_fly_timer).w
		cmpi.b	#$C0,(Tails_CPU_auto_fly_timer).w
		blo.s	loc_141D2
		move.b	#0,(Tails_CPU_auto_fly_timer).w
		ori.w	#$7070,(Ctrl_2_logical).w
		bra.s	loc_141D2
; ---------------------------------------------------------------------------

loc_14198:
		btst	#0,(Ctrl_1).w
		beq.s	loc_141BA
		addq.b	#1,(Tails_CPU_auto_fly_timer).w
		cmpi.b	#$20,(Tails_CPU_auto_fly_timer).w
		blo.s	loc_141D2
		move.b	#0,(Tails_CPU_auto_fly_timer).w
		ori.w	#$7070,(Ctrl_2_logical).w
		bra.s	loc_141D2
; ---------------------------------------------------------------------------

loc_141BA:
		addq.b	#1,(Tails_CPU_auto_fly_timer).w
		cmpi.b	#$58,(Tails_CPU_auto_fly_timer).w
		blo.s	loc_141D2
		move.b	#0,(Tails_CPU_auto_fly_timer).w
		ori.w	#$7070,(Ctrl_2_logical).w

loc_141D2:
		move.b	(Ctrl_1).w,d0
		andi.b	#$C,d0
		or.b	(Ctrl_2_logical).w,d0
		move.b	d0,(Ctrl_2_logical).w

loc_141E2:
		lea	(Flying_carrying_Sonic_flag).w,a2
		lea	(Player_1).w,a1
		move.w	(Ctrl_1).w,d0
		bra.w	Tails_Carry_Sonic
; ---------------------------------------------------------------------------

loc_141F2:
		move.b	#1,double_jump_flag(a0)
		move.b	#$F0,double_jump_property(a0)
		move.b	#2,status(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		move.b	#$1C,(Tails_CPU_routine).w

loc_1421C:
		move.w	#0,(Tails_CPU_idle_timer).w
		move.b	#$F0,double_jump_property(a0)
		move.w	#0,(Ctrl_2_logical).w
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#7,d0
		bne.s	loc_1423E
		ori.w	#$7070,(Ctrl_2_logical).w

loc_1423E:
		move.w	(Camera_Y_pos).w,d0
		addi.w	#$90,d0
		cmp.w	y_pos(a0),d0
		blo.s	locret_14252
		move.b	#$1E,(Tails_CPU_routine).w

locret_14252:
		rts
; ---------------------------------------------------------------------------

loc_14254:
		move.b	#$F0,double_jump_property(a0)
		rts
; ---------------------------------------------------------------------------

loc_1425C:
		move.b	#1,double_jump_flag(a0)
		move.b	#$F0,double_jump_property(a0)
		move.b	#2,status(a0)
		move.w	#$100,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		move.b	#$22,(Tails_CPU_routine).w

loc_14286:
		move.w	#0,(Tails_CPU_idle_timer).w
		move.w	#0,(Ctrl_2_logical).w
		move.b	(Level_frame_counter+1).w,d0
		andi.b	#$1F,d0
		bne.s	loc_142A2
		ori.w	#$808,(Ctrl_2_logical).w

loc_142A2:
		btst	#1,status(a0)
		bne.s	locret_142E0
		move.b	#6,(Tails_CPU_routine).w
		move.b	#0,object_control(a0)
		move.b	#0,anim(a0)
		move.w	#0,x_vel(a0)
		move.w	#0,y_vel(a0)
		move.w	#0,ground_vel(a0)
		move.b	#2,status(a0)
		move.w	#0,move_lock(a0)
		andi.w	#$7FFF,art_tile(a0)

locret_142E0:
		rts
; ---------------------------------------------------------------------------

loc_142E2:
		tst.b	(_unkFAAC).w
		bne.s	loc_14362
		lea	(Player_1).w,a1
		tst.b	render_flags(a1)
		bpl.s	loc_14330
		tst.w	(Tails_CPU_idle_timer).w
		bne.w	loc_143AA
		cmpi.w	#$300,y_vel(a1)
		bge.s	loc_14330
		move.w	#0,x_vel(a0)
		move.w	#0,(Ctrl_2_logical).w
		cmpi.w	#$200,y_vel(a0)
		bge.s	loc_14328
		addq.b	#1,(Tails_CPU_auto_fly_timer).w
		cmpi.b	#$58,(Tails_CPU_auto_fly_timer).w
		blo.s	loc_1432E
		move.b	#0,(Tails_CPU_auto_fly_timer).w

loc_14328:
		ori.w	#$7070,(Ctrl_2_logical).w

loc_1432E:
		bra.s	loc_143AA
; ---------------------------------------------------------------------------

loc_14330:
		st	(_unkFAAC).w
		move.w	y_pos(a1),d1
		sub.w	y_pos(a0),d1
		bpl.s	loc_14340
		neg.w	d1

loc_14340:
		lsr.w	#2,d1
		move.w	d1,d2
		lsr.w	#1,d2
		add.w	d2,d1
		move.w	d1,(Camera_stored_min_X_pos).w
		move.w	x_pos(a1),d1
		sub.w	x_pos(a0),d1
		bpl.s	loc_14358
		neg.w	d1

loc_14358:
		lsr.w	#2,d1
		move.w	d1,(Camera_stored_max_X_pos).w
		bra.w	loc_143AA
; ---------------------------------------------------------------------------

loc_14362:
		move.w	#0,(Ctrl_2_logical).w
		lea	(Player_1).w,a1
		move.w	x_pos(a0),d0
		move.w	y_pos(a0),d1
		subi.w	#$10,d1
		move.w	(Camera_stored_max_X_pos).w,d2
		bclr	#0,status(a0)
		cmp.w	x_pos(a1),d0
		blo.s	loc_14390
		bset	#0,status(a0)
		neg.w	d2

loc_14390:
		add.w	d2,x_vel(a0)
		cmp.w	y_pos(a1),d1
		bhs.s	loc_143AA
		move.w	(Camera_stored_min_X_pos).w,d2
		cmp.w	y_pos(a1),d1
		blo.s	loc_143A6
		neg.w	d2

loc_143A6:
		add.w	d2,y_vel(a0)

loc_143AA:
		lea	(Flying_carrying_Sonic_flag).w,a2
		lea	(Player_1).w,a1
		move.w	(Ctrl_1).w,d0
		bra.w	Tails_Carry_Sonic

; =============== S U B R O U T I N E =======================================


Tails_Carry_Sonic:
		tst.b	(a2)
		beq.w	loc_14534
		cmpi.b	#4,5(a1)
		bhs.w	loc_14466
		btst	#1,status(a1)
		beq.w	loc_1445A
		move.w	(_unkF744).w,d1
		cmp.w	x_vel(a1),d1
		bne.s	loc_1445A
		move.w	(_unkF74C).w,d1
		cmp.w	y_vel(a1),d1
		bne.s	loc_14460
		tst.b	object_control(a1)
		bmi.s	loc_1446A
		andi.b	#$70,d0
		beq.w	loc_14474
		clr.b	object_control(a1)
		clr.b	(a2)
		move.b	#$12,1(a2)
		andi.w	#$F00,d0
		beq.w	loc_14410
		move.b	#$3C,1(a2)

loc_14410:
		btst	#$A,d0
		beq.s	loc_1441C
		move.w	#-$200,x_vel(a1)

loc_1441C:
		btst	#$B,d0
		beq.s	loc_14428
		move.w	#$200,x_vel(a1)

loc_14428:
		move.w	#-$380,y_vel(a1)
		bset	#1,status(a1)
		move.b	#1,jumping(a1)
		move.b	#$E,$1E(a1)
		move.b	#7,$1F(a1)
		move.b	#2,anim(a1)
		bset	#2,status(a1)
		bclr	#4,status(a1)
		rts
; ---------------------------------------------------------------------------

loc_1445A:
		move.w	#-$100,y_vel(a1)

loc_14460:
		move.b	#0,jumping(a1)

loc_14466:
		clr.b	object_control(a1)

loc_1446A:
		clr.b	(a2)
		move.b	#$3C,1(a2)
		rts
; ---------------------------------------------------------------------------

loc_14474:
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		addi.w	#$1C,y_pos(a1)
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_14492
		subi.w	#$38,y_pos(a1)

loc_14492:
		andi.b	#-4,render_flags(a1)
		andi.b	#-2,status(a1)
		move.b	status(a0),d0
		andi.b	#1,d0
		or.b	d0,render_flags(a1)
		or.b	d0,status(a1)
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_144BA
		eori.b	#2,render_flags(a1)

loc_144BA:
		subq.b	#1,anim_frame_timer(a1)
		bpl.s	loc_144F8
		move.b	#$B,anim_frame_timer(a1)
		moveq	#0,d1
		move.b	anim_frame(a1),d1
		addq.b	#1,anim_frame(a1)
		move.b	AniRaw_Tails_Carry(pc,d1.w),d0
		cmpi.b	#-1,d0
		bne.s	loc_144E4
		move.b	#0,anim_frame(a1)
		move.b	AniRaw_Tails_Carry(pc),d0

loc_144E4:
		move.b	d0,mapping_frame(a1)
		moveq	#0,d0
		move.b	mapping_frame(a1),d0
		move.l	a2,-(sp)
		jsr	(Perform_Player_DPLC).l
		movea.l	(sp)+,a2

loc_144F8:
		move.w	x_vel(a0),(Player_1+x_vel).w
		move.w	x_vel(a0),(_unkF744).w
		move.w	y_vel(a0),(Player_1+y_vel).w
		move.w	y_vel(a0),(_unkF74C).w
		movem.l	d0-a6,-(sp)
		lea	(Player_1).w,a0
		bsr.w	SonicKnux_DoLevelCollision
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------
AniRaw_Tails_Carry:
		dc.b  $91, $91, $90, $90, $90, $90, $90, $90, $92, $92, $92, $92, $92, $92, $91, $91, $FF
		even
; ---------------------------------------------------------------------------

loc_14534:
		tst.b	1(a2)
		beq.s	loc_14542
		subq.b	#1,1(a2)
		bne.w	locret_1459C

loc_14542:
		move.w	x_pos(a1),d0
		sub.w	x_pos(a0),d0
		addi.w	#$10,d0
		cmpi.w	#$20,d0
		bhs.w	locret_1459C
		move.w	y_pos(a1),d1
		sub.w	y_pos(a0),d1
		subi.w	#$20,d1
		tst.b	(Reverse_gravity_flag).w
		beq.s	loc_1456C
		addi.w	#$50,d1

loc_1456C:
		cmpi.w	#$10,d1
		bhs.w	locret_1459C
		tst.b	object_control(a1)
		bne.s	locret_1459C
		cmpi.b	#4,5(a1)
		bhs.s	locret_1459C
		tst.w	(Debug_placement_mode).w
		bne.s	locret_1459C
		tst.b	spin_dash_flag(a1)
		bne.s	locret_1459C
		bsr.s	sub_1459E
		moveq	#signextendB(sfx_Grab),d0
		jsr	(Play_SFX).l
		move.b	#1,(a2)

locret_1459C:
		rts
; End of function Tails_Carry_Sonic


; =============== S U B R O U T I N E =======================================


sub_1459E:
		clr.w	x_vel(a1)
		clr.w	y_vel(a1)
		clr.w	ground_vel(a1)
		clr.w	$26(a1)
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		addi.w	#$1C,y_pos(a1)
		move.w	#$2200,anim(a1)
		move.b	#0,anim_frame_timer(a1)
		move.b	#0,anim_frame(a1)
		move.b	#3,object_control(a1)
		bset	#1,status(a1)
		bclr	#4,status(a1)
		move.b	#0,spin_dash_flag(a1)
		andi.b	#-4,render_flags(a1)
		andi.b	#-2,status(a1)
		move.b	status(a0),d0
		andi.b	#1,d0
		or.b	d0,render_flags(a1)
		or.b	d0,status(a1)
		move.w	x_vel(a0),(_unkF744).w
		move.w	x_vel(a0),x_vel(a1)
		move.w	y_vel(a0),(_unkF74C).w
		move.w	y_vel(a0),y_vel(a1)
		tst.b	(Reverse_gravity_flag).w
		beq.s	locret_14630
		subi.w	#$38,y_pos(a1)
		eori.b	#2,render_flags(a1)

locret_14630:
		rts
; End of function sub_1459E