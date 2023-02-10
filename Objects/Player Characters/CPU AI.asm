; ---------------------------------------------------------------------------
; Tails' AI code for when he's player 2
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

; loc_1BAD4:
CPU_Control: ; a0=Tails
	move.l	(Ctrl_2_logical).w,d0	; did the real player 2 hit something?
	beq.s	+			; if not, branch
	move.w	#600,(Tails_CPU_idle_timer).w ; give player 2 control for 10 seconds (minimum)
+
	lea	(Player_1).w,a1	; P1 won't be using this anyway
	move.b	(Tails_CPU_routine).w,d0
	move.w	TailsCPU_States(pc,d0.w),d0
	jmp	TailsCPU_States(pc,d0.w)
; ===========================================================================
; off_1BAF4:
TailsCPU_States: offsetTable
	offsetTableEntry.w TailsCPU_Init	; 0
	offsetTableEntry.w TailsCPU_Spawning	; 2
	offsetTableEntry.w TailsCPU_Flying	; 4
	offsetTableEntry.w TailsCPU_Normal	; 6
	offsetTableEntry.w TailsCPU_Panic	; 8
	offsetTableEntry.w return_1BF36	; $A
	offsetTableEntry.w loc_13FC2	; $C
	offsetTableEntry.w loc_13FFA	; $E
	offsetTableEntry.w loc_1408A	; $10
	offsetTableEntry.w loc_140C6	; $12
	offsetTableEntry.w loc_140CET	; $14
	offsetTableEntry.w loc_14106	; $16
	offsetTableEntry.w loc_1414C	; $18
	offsetTableEntry.w loc_141F2	; $1A
	offsetTableEntry.w loc_1421C	; $1C
	offsetTableEntry.w loc_14254	; $1E
	offsetTableEntry.w loc_1425C	; $20
	offsetTableEntry.w loc_14286	; $22

; ===========================================================================
; initial AI State
; ---------------------------------------------------------------------------
; loc_1BAFE:
TailsCPU_Init:
	clr.b	object_control(a0)
	move.b	#id_Walk,anim(a0)
	clr.w	x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
	clr.b	status(a0)
	move.b	#6,(Tails_CPU_routine).w	; => TailsCPU_Normal
	clr.w	(Tails_respawn_counter).w
	rts

; ===========================================================================
; AI State where Tails is waiting to respawn
; ---------------------------------------------------------------------------
; loc_1BB30:
TailsCPU_Spawning:
	move.b	(Ctrl_2_Logical).w,d0
	andi.b	#button_B_mask|button_C_mask|button_A_mask|button_start_mask,d0
	bne.s	TailsCPU_Respawn
	move.w	(Level_frame_counter).w,d0
	andi.w	#$3F,d0
	bne.w	return_1BB88
	tst.b	object_control(a1)
	bmi.w	return_1BB88
	move.b	status(a1),d0
	andi.b	#$80,d0
	bne.w	return_1BB88

TailsCPU_Respawn:
	move.b	#4,(Tails_CPU_routine).w	; => TailsCPU_Flying
	move.w	x_pos(a1),d0
	move.w	d0,x_pos(a0)
	move.w	d0,(Tails_CPU_target_x).w
	move.w	y_pos(a1),d0
	move.w	d0,(Tails_CPU_target_y).w
	subi.w	#$C0,d0
	tst.b	(Reverse_gravity_flag).w
	beq.s	loc_13B78
	addi.w	#$180,d0

loc_13B78:
	move.w	d0,y_pos(a0)
	ori.w	#high_priority,art_tile(a0)
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
	move.w	d0,spin_dash_counter(a0)
	move.b	d0,jumping(a0)
	move.b	d0,jumping+1(a0)	; Uh... The hell is this?
	move.b	#-$10,double_jump_property(a0)
	bsr.w	Tails_Set_Flying_Animation

return_1BB88:
	rts
; ===========================================================================
; AI State where Tails pretends to be a helicopter
; ---------------------------------------------------------------------------
; loc_1BB8A:
TailsCPU_Flying:
	tst.b	render_flags(a0)
	bmi.s	TailsCPU_FlyingOnscreen
	addq.w	#1,(Tails_respawn_counter).w
	cmpi.w	#300,(Tails_respawn_counter).w
	blo.s	TailsCPU_Flying_Part2
	clr.w	(Tails_respawn_counter).w
	move.b	#2,(Tails_CPU_routine).w
	move.b	#$81,object_control(a0)
	move.b	#2,status(a0)
	clr.w	x_pos(a0)
	clr.w	y_pos(a0)
	move.b	#-$10,double_jump_property(a0)
	bsr.w	Tails_Set_Flying_Animation
	rts
; ---------------------------------------------------------------------------

TailsCPU_FlyingOnscreen:
	move.b	#-$10,double_jump_property(a0)
	ori.b	#2,status(a0)
	bsr.w	Tails_Set_Flying_Animation
	clr.w	(Tails_respawn_counter).w

; loc_1BBCE:
TailsCPU_Flying_Part2:
	lea	(Pos_table).w,a2
	move.w	#$10,d2
	lsl.b	#2,d2
	addq.b	#4,d2
	move.w	(Pos_table_index).w,d3
	sub.b	d2,d3
	move.w	(a2,d3.w),(Tails_CPU_target_x).w
	move.w	2(a2,d3.w),(Tails_CPU_target_y).w
	move.w	x_pos(a0),d0
	sub.w	(Tails_CPU_target_x).w,d0
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
	sub.w	(Tails_CPU_target_y).w,d1
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
	move.b	#6,(Tails_CPU_routine).w	; => TailsCPU_Normal
	clr.b	object_control(a0)
	move.b	#id_Walk,anim(a0)
	clr.w	x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
	andi.b	#$40,status(a0)
	ori.b	#2,status(a0)
	clr.w	move_lock(a0)
	andi.w	#drawing_mask,art_tile(a0)
	tst.b	art_tile(a1)
	bpl.s	loc_13D34
	ori.w	#high_priority,art_tile(a0)
loc_13D34:
	move.b	top_solid_bit(a1),top_solid_bit(a0)
	move.b	lrb_solid_bit(a1),lrb_solid_bit(a0)
	rts
; ---------------------------------------------------------------------------

loc_13D42:
	move.b	#$81,object_control(a0)
	rts

; ===========================================================================
; AI State where Tails follows the player normally
; ---------------------------------------------------------------------------
; loc_1BCE0:
TailsCPU_Normal:
	cmpi.b	#6,(Player_1+routine).w	; is Sonic dead?
	blo.s	TailsCPU_Normal_SonicOK		; if not, branch
	; Sonic's dead; fly down to his corpse
	move.b	#4,(Tails_CPU_routine).w	; => TailsCPU_Flying
	clr.b	spin_dash_flag(a0)
	clr.w	spin_dash_counter(a0)
	move.b	#$81,object_control(a0)
	move.b	#2,status(a0)
	move.b	#id_Ability1,anim(a0)
	rts
; ---------------------------------------------------------------------------
; loc_1BD0E:
TailsCPU_Normal_SonicOK:
	bsr.w	TailsCPU_CheckDespawn
	tst.w	(Tails_CPU_idle_timer).w	; if CPU has control
	bne.w	TailsCPU_Normal_HumanControl		; (if not, branch)
	tst.b	object_control(a0)			; and Tails isn't fully object controlled (&$80)
	bmi.w	TailsCPU_Normal_HumanControl		; (if not, branch)
	tst.w	move_lock(a0)			; and Tails' movement is locked (usually because he just fell down a slope)
	beq.s	+					; (if not, branch)
	tst.w	ground_vel(a0)			; and Tails is stopped, then...
	bne.s	+					; (if not, branch)
	move.b	#8,(Tails_CPU_routine).w	; => TailsCPU_Panic
+; loc_13DA6
	lea	(Pos_table).w,a2
	move.w	#$10,d1
	lsl.b	#2,d1
	addq.b	#4,d1
	move.w	(Pos_table_index).w,d0
	sub.b	d1,d0
	move.w	(a2,d0.w),d2	; d2 = earlier x position of Sonic
	btst	#3,status(a1)
	bne.s	loc_13DD0
	cmpi.w	#$400,ground_vel(a1)
	bge.s	loc_13DD0
	subi.w	#$20,d2

loc_13DD0:
	move.w	2(a2,d0.w),d3	; d3 = earlier y position of Sonic
	lea	(Stat_table).w,a2
	move.w	(a2,d0.w),d1	; d1 = earlier input of Sonic
	move.b	2(a2,d0.w),d4	; d4 = earlier status of Sonic
	move.w	d1,d0
	btst	#5,status(a0)	; is Tails pushing against something?
	beq.s	+		; if not, branch
	btst	#5,d4		; was Sonic pushing against something?
	beq.w	TailsCPU_Normal_FilterAction_Part2 ; if not, branch elsewhere

; either Tails isn't pushing, or Tails and Sonic are both pushing
+	sub.w	x_pos(a0),d2
	beq.s	TailsCPU_Normal_Stand ; branch if Tails is already lined up horizontally with Sonic
	bpl.s	TailsCPU_Normal_FollowRight
	neg.w	d2

; Tails wants to go left because that's where Sonic is
; loc_1BD76: TailsCPU_Normal_FollowLeft:
	cmpi.w	#$30,d2
	blo.s	+
	andi.w	#~(((button_left_mask|button_right_mask)<<8)|(button_left_mask|button_right_mask)),d1	; AND out Sonic's left/right input...
	ori.w	#(button_left_mask<<8)|button_left_mask,d1	; ...and give Tails his own
+
	tst.w	ground_vel(a0)
	beq.s	TailsCPU_Normal_FilterAction
	btst	#0,status(a0)
	beq.s	TailsCPU_Normal_FilterAction
	btst	#0,object_control(a0)
	bne.s	TailsCPU_Normal_FilterAction
	subq.w	#1,x_pos(a0)
	bra.s	TailsCPU_Normal_FilterAction
; ===========================================================================
; Tails wants to go right because that's where Sonic is
; loc_1BD98:
TailsCPU_Normal_FollowRight:
	cmpi.w	#$30,d2
	blo.s	+
	andi.w	#~(((button_left_mask|button_right_mask)<<8)|(button_left_mask|button_right_mask)),d1	; AND out Sonic's left/right input
	ori.w	#(button_right_mask<<8)|button_right_mask,d1	; ...and give Tails his own
+
	tst.w	ground_vel(a0)
	beq.s	TailsCPU_Normal_FilterAction
	btst	#0,status(a0)
	bne.s	TailsCPU_Normal_FilterAction
	btst	#0,object_control(a0)
	bne.s	TailsCPU_Normal_FilterAction
	addq.w	#1,x_pos(a0)
	bra.s	TailsCPU_Normal_FilterAction
; ===========================================================================
; Tails is happy where he is
; loc_1BDBA:
TailsCPU_Normal_Stand:
	bclr	#0,status(a0)
	move.b	d4,d0
	andi.b	#1,d0
	beq.s	TailsCPU_Normal_FilterAction
	bset	#0,status(a0)

; Filter the action we chose depending on a few things
; loc_1BDCE:
TailsCPU_Normal_FilterAction:
	tst.b	(Tails_CPU_jumping).w
	beq.s	+
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8),d1
	btst	#1,status(a0)
	bne.s	TailsCPU_Normal_SendAction
	clr.b	(Tails_CPU_jumping).w
+
	move.w	(Level_frame_counter).w,d0
	andi.w	#$FF,d0
	beq.s	+
	cmpi.w	#$40,d2
	bhs.s	TailsCPU_Normal_SendAction
+
	sub.w	y_pos(a0),d3
	beq.s	TailsCPU_Normal_SendAction
	bpl.s	TailsCPU_Normal_SendAction
	neg.w	d3
	cmpi.w	#$20,d3
	blo.s	TailsCPU_Normal_SendAction
; loc_1BE06:
TailsCPU_Normal_FilterAction_Part2:
	move.b	(Level_frame_byte).w,d0
	andi.b	#$3F,d0
	bne.s	TailsCPU_Normal_SendAction
	cmpi.b	#id_Duck,anim(a0)
	beq.s	TailsCPU_Normal_SendAction
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),d1
	move.b	#1,(Tails_CPU_jumping).w

; Send the action we chose by storing it into player 2's input
; loc_1BE22:
TailsCPU_Normal_SendAction:
	move.w	d1,(Ctrl_2_Logical).w
	rts

; ===========================================================================
; Follow orders from controller 2
; and decrease the counter to when the CPU will regain control
; loc_1BE28:
TailsCPU_Normal_HumanControl:
	tst.w	(Tails_CPU_idle_timer).w
	beq.s	+	; don't decrease if it's already 0
	subq.w	#1,(Tails_CPU_idle_timer).w
+
	rts

; ===========================================================================
; loc_1BE34:
TailsCPU_Despawn:
	clr.w	(Tails_CPU_idle_timer).w
	clr.w	(Tails_respawn_counter).w
	move.b	#2,(Tails_CPU_routine).w	; => TailsCPU_Spawning
	move.b	#$81,object_control(a0)
	move.b	#2,status(a0)
	move.w	#$4000,x_pos(a0)
	clr.w	y_pos(a0)
	clr.b	double_jump_flag(a0)
	rts
; ===========================================================================
; sub_1BE66:
TailsCPU_CheckDespawn:
	tst.b	render_flags(a0)
	bmi.s	TailsCPU_ResetRespawnTimer
	btst	#3,status(a0)
	beq.s	TailsCPU_TickRespawnTimer

	moveq	#0,d0
	movea.w	interact(a0),a3
	move.w	(Tails_interact_ID).w,d0
	cmp.w	(a3),d0
;	move.b	interact(a0),d0
;	if object_size=$40
;	lsl.w	#6,d0
;	else
;	mulu.w	#object_size,d0
;	endif
;	addi.l	#Object_RAM,d0
;	movea.l	d0,a3	; a3=object
;	move.b	(Tails_interact_ID).w,d0
;	cmp.b	(a3),d0
	bne.s	BranchTo_TailsCPU_Despawn

; loc_1BE8C:
TailsCPU_TickRespawnTimer:
	addq.w	#1,(Tails_respawn_counter).w
	cmpi.w	#300,(Tails_respawn_counter).w
	blo.s	TailsCPU_UpdateObjInteract

BranchTo_TailsCPU_Despawn
	bra.w	TailsCPU_Despawn
; ===========================================================================
; loc_1BE9C:
TailsCPU_ResetRespawnTimer:
	clr.w	(Tails_respawn_counter).w
; loc_1BEA2:
TailsCPU_UpdateObjInteract:
	btst	#3,status(a0)
	beq.s	locret_13F3E

;	moveq	#0,d0
;	move.b	interact(a0),d0
;	if object_size=$40
;	lsl.w	#6,d0
;	else
;	mulu.w	#object_size,d0
;	endif
;	addi.l	#Object_RAM,d0
;	movea.l	d0,a3	; a3=object
;	move.b	(a3),(Tails_interact_ID).w

	movea.w	interact(a0),a3
	move.w	(a3),(Tails_interact_ID).w
locret_13F3E:
	rts

; ===========================================================================
; AI State where Tails stops, drops, and spindashes in Sonic's direction
; ---------------------------------------------------------------------------
; loc_1BEB8:
TailsCPU_Panic:
	bsr.w	TailsCPU_CheckDespawn
	tst.w	(Tails_CPU_idle_timer).w
	bne.w	return_1BF36
	tst.w	move_lock(a0)
	bne.s	return_1BF36
	tst.b	spin_dash_flag(a0)
	bne.s	TailsCPU_Panic_ChargingDash
	tst.w	ground_vel(a0)
	bne.s	return_1BF36
	
	bclr	#0,status(a0)
	move.w	x_pos(a0),d0
	sub.w	x_pos(a1),d0
	bcs.s	+
	bset	#0,status(a0)
+
	move.w	#(button_down_mask<<8)|button_down_mask,(Ctrl_2_Logical).w
	move.b	(Level_frame_byte).w,d0
	andi.b	#$7F,d0
	beq.s	TailsCPU_Panic_ReleaseDash

	cmpi.b	#id_Duck,anim(a0)
	bne.s	return_1BF36
	move.w	#((button_down_mask|button_B_mask|button_C_mask|button_A_mask)<<8)|(button_down_mask|button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w
	rts
; ---------------------------------------------------------------------------
; loc_1BF0C:
TailsCPU_Panic_ChargingDash:
	move.w	#(button_down_mask<<8)|button_down_mask,(Ctrl_2_Logical).w
	move.b	(Level_frame_byte).w,d0
	andi.b	#$7F,d0
	bne.s	TailsCPU_Panic_RevDash

; loc_1BF1C:
TailsCPU_Panic_ReleaseDash:
	clr.l	(Ctrl_2_Logical).w
	move.b	#6,(Tails_CPU_routine).w	; => TailsCPU_Normal
	rts
; ---------------------------------------------------------------------------
; loc_1BF2A:
TailsCPU_Panic_RevDash:
	andi.b	#$1F,d0
	bne.s	return_1BF36
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w

return_1BF36:
	rts
; End of function TailsCPU_Control


loc_13FC2:
	move.b	#1,double_jump_flag(a0)
	move.b	#-$10,double_jump_property(a0)
	move.b	#2,status(a0)
	move.w	#$100,x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
	bsr.w	sub_1459E
	move.b	#1,(Flying_carrying_Sonic_flag).w
;	raiseError "13FC2"
	move.b	#$E,(Tails_CPU_routine).w

loc_13FFA:
	clr.w	(Tails_CPU_idle_timer).w
	clr.l	(Ctrl_2_Logical).w
	move.b	(Level_frame_byte).w,d0
	andi.b	#$1F,d0
	bne.s	loc_14016
	ori.w	#(button_right_mask<<8)|button_right_mask,(Ctrl_2_Logical).w

loc_14016:
	lea	(Flying_carrying_Sonic_flag).w,a2
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
	btst	#1,status(a1)
	bne.s	loc_14082
	move.b	#6,(Tails_CPU_routine).w
	clr.b	object_control(a0)
	clr.b	anim(a0)
	clr.w	x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
	move.b	#2,status(a0)
	clr.w	move_lock(a0)
	andi.w	#drawing_mask,art_tile(a0)
	tst.b	art_tile(a1)
	bpl.s	loc_14068
	ori.w	#high_priority,art_tile(a0)

loc_14068:
	move.b	top_solid_bit(a1),top_solid_bit(a0)
	move.b	lrb_solid_bit(a1),lrb_solid_bit(a0)
loc_14082:
	bra.w	Tails_Carry_Sonic
; ---------------------------------------------------------------------------

loc_1408A:
	clr.w	(Tails_CPU_idle_timer).w
	move.b	#$F0,double_jump_property(a0)
	clr.l	(Ctrl_2_Logical).w
	move.b	(Level_frame_byte).w,d0
	andi.b	#$F,d0
	bne.s	loc_140ACT
	ori.w	#((button_B_mask|button_C_mask|button_A_mask|button_right_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask|button_right_mask),(Ctrl_2_Logical).w
loc_140ACT:
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
	clr.l	(Ctrl_2_Logical).w
	rts
; ---------------------------------------------------------------------------

loc_140CET:
	move.b	#1,double_jump_flag(a0)
	move.b	#-$10,double_jump_property(a0)
	move.b	#2,status(a0)
	clr.w	x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
	bsr.w	sub_1459E
	move.b	#1,(Flying_carrying_Sonic_flag).w
;	raiseError "140CET"
	move.b	#$16,(Tails_CPU_routine).w

loc_14106:
	clr.w	(Tails_CPU_idle_timer).w
	move.b	#$F0,double_jump_property(a0)
	clr.l	(Ctrl_2_Logical).w
	move.b	(Level_frame_byte).w,d0
	andi.b	#7,d0
	bne.s	loc_14128
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w

loc_14128:
	move.w	(Camera_Y_pos).w,d0
	addi.w	#$90,d0
	cmp.w	y_pos(a0),d0
	blo.s	loc_1413C
	move.b	#$18,(Tails_CPU_routine).w

loc_1413C:
	lea	(Flying_carrying_Sonic_flag).w,a2
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
	bra.w	Tails_Carry_Sonic
; ---------------------------------------------------------------------------

loc_1414C:
	move.b	#$F0,double_jump_property(a0)
	tst.w	(Tails_CPU_idle_timer).w
	beq.s	loc_14164
	tst.b	(Flying_carrying_Sonic_flag).w
	bne.w	loc_141E2
	bra.w	loc_142E2T
; ---------------------------------------------------------------------------

loc_14164:
	clr.l	(Ctrl_2_Logical).w
	tst.b	(Flying_carrying_Sonic_flag).w
	beq.w	loc_142E2T
	btst	#1,(Ctrl_1).w
	beq.s	loc_14198
	addq.b	#1,(Tails_CPU_flight_timer).w
	cmpi.b	#-$40,(Tails_CPU_flight_timer).w
	blo.s	loc_141D2
	clr.b	(Tails_CPU_flight_timer).w
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w
	bra.s	loc_141D2
; ---------------------------------------------------------------------------

loc_14198:
	btst	#0,(Ctrl_1).w
	beq.s	loc_141BA
	addq.b	#1,(Tails_CPU_flight_timer).w
	cmpi.b	#$20,(Tails_CPU_flight_timer).w
	blo.s	loc_141D2
	clr.b	(Tails_CPU_flight_timer).w
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w
	bra.s	loc_141D2
; ---------------------------------------------------------------------------

loc_141BA:
	addq.b	#1,(Tails_CPU_flight_timer).w
	cmpi.b	#$58,(Tails_CPU_flight_timer).w
	blo.s	loc_141D2
	clr.b	(Tails_CPU_flight_timer).w
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w

loc_141D2:
	move.b	(Ctrl_1).w,d0
	andi.b	#$C,d0
	or.b	(Ctrl_2_Logical).w,d0
	move.b	d0,(Ctrl_2_Logical).w

loc_141E2:
	lea	(Flying_carrying_Sonic_flag).w,a2
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
	bra.w	Tails_Carry_Sonic
; ---------------------------------------------------------------------------

loc_141F2:
	move.b	#1,double_jump_flag(a0)
	move.b	#-$10,double_jump_property(a0)
	move.b	#2,status(a0)
	clr.w	x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
	move.b	#$1C,(Tails_CPU_routine).w

loc_1421C:
	clr.w	(Tails_CPU_idle_timer).w
	move.b	#$F0,double_jump_property(a0)
	clr.l	(Ctrl_2_Logical).w
	move.b	(Level_frame_byte).w,d0
	andi.b	#7,d0
	bne.s	loc_1423E
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w

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
	move.b	#-$10,double_jump_property(a0)
	rts
; ---------------------------------------------------------------------------

loc_1425C:
	move.b	#1,double_jump_flag(a0)
	move.b	#-$10,double_jump_property(a0)
	move.b	#2,status(a0)
	move.w	#$100,x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
	move.b	#$22,(Tails_CPU_routine).w

loc_14286:
	clr.w	(Tails_CPU_idle_timer).w
	clr.l	(Ctrl_2_Logical).w
	move.b	(Level_frame_byte).w,d0
	andi.b	#$1F,d0
	bne.s	loc_142A2
	ori.w	#(button_right_mask<<8)|button_right_mask,(Ctrl_2_Logical).w

loc_142A2:
	btst	#1,status(a0)
	bne.s	locret_142E0
	move.b	#6,(Tails_CPU_routine).w
	clr.b	object_control(a0)
	clr.b	anim(a0)
	clr.w	x_vel(a0)
	clr.w	y_vel(a0)
	clr.w	ground_vel(a0)
	move.b	#2,status(a0)
	clr.w	move_lock(a0)
	andi.w	#$7FFF,art_tile(a0)

locret_142E0:
	rts
; ---------------------------------------------------------------------------

loc_142E2T:
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
	tst.b	render_flags(a1)
	bpl.s	loc_143AA
	tst.w	(Tails_CPU_idle_timer).w
	bne.w	loc_143AA
	cmpi.w	#$300,y_vel(a1)
	bge.w	loc_143AA
	clr.w	x_vel(a0)
	clr.l	(Ctrl_2_Logical).w
	cmpi.w	#$200,y_vel(a0)
	bge.s	loc_14328
	addq.b	#1,(Tails_CPU_flight_timer).w
	cmpi.b	#$58,(Tails_CPU_flight_timer).w
	blo.s	loc_143AA
	clr.b	(Tails_CPU_flight_timer).w

loc_14328:
	ori.w	#((button_B_mask|button_C_mask|button_A_mask)<<8)|(button_B_mask|button_C_mask|button_A_mask),(Ctrl_2_Logical).w

loc_143AA:
	lea	(Flying_carrying_Sonic_flag).w,a2
		cmpa.w	#Player_1,a0
		beq.s	.p2
		lea	(Player_2).w,a1
		bra.s	.cont
	.p2:
		lea	(Player_1).w,a1
	.cont:
	bra.w	Tails_Carry_Sonic

; =============== S U B R O U T I N E =======================================


Tails_Carry_Sonic:
	tst.b	(a2)
	beq.w	loc_14534
	cmpi.b	#4,routine(a1)	; hurt?
	bhs.w	loc_14466		; if that or higher shit doesn't work anyway
	btst	#1,status(a1)
	beq.w	loc_1445A

	move.w	(Carried_character_x_vel).w,d1
	cmp.w	x_vel(a1),d1
	bne.w	loc_1445A
	move.w	(Carried_character_y_vel).w,d1
	cmp.w	y_vel(a1),d1
	bne.w	loc_14460

	tst.b	object_control(a1)
	bmi.w	loc_1446A	;  this also makes him drop you
	; but if you comment both this and the one in Sonic.asm/Player_Control.carryingCont out, it gets weird...
		cmpa.w	#Player_1,a0
		bne.s	.p2
		move.b	(Ctrl_2).w,d0
		move.b	(Ctrl_2_pressed).w,d1
		bra.s	.cont
	.p2:
		move.b	(Ctrl_1).w,d0
		move.b	(Ctrl_1_pressed).w,d1
	.cont:
	btst	#button_down,d0	; is down being pressed?
	beq.w	loc_14474
	andi.b	#button_B_mask|button_C_mask|button_A_mask,d1
	beq.w	loc_14474
	clr.b	object_control(a1)
	clr.b	(a2)
;	raiseError "Tails_Carry_Sonic"
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
	move.b	#$E,y_radius(a1)
	move.b	#7,x_radius(a1)
	move.b	#id_Roll,anim(a1)
	bset	#2,status(a1)
	bclr	#4,status(a1)
	rts
; ---------------------------------------------------------------------------

loc_1445A:
	move.w	#-$100,y_vel(a1)

loc_14460:
	clr.b	jumping(a1)

loc_14466:
	clr.b	object_control(a1)

loc_1446A:
	clr.b	(a2)	; drop the player
;	raiseError "1446A"
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
	beq.s	loc_144F8
	eori.b	#2,render_flags(a1)

loc_144F8:
	move.w	x_vel(a0),x_vel(a1)
	move.w	x_vel(a0),(Carried_character_x_vel).w
	move.w	y_vel(a0),y_vel(a1)
	move.w	y_vel(a0),(Carried_character_y_vel).w
	movem.l	d0-a6,-(sp)
	move.w	a1,a0
	bsr.w	Player_DoLevelCollision
	movem.l	(sp)+,d0-a6
	rts
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
	cmpi.b	#4,routine(a1)
	bhs.s	locret_1459C
	tst.w	(Debug_placement_mode).w
	bne.s	locret_1459C
	tst.b	spin_dash_flag(a1)
	bne.s	locret_1459C
	bsr.s	sub_1459E
	sfx		sfx_Grab
	move.w	a1,(Carried_character).w	; move address of a1 (carried character) to contents of address
	move.b	#1,(a2)

locret_1459C:
	rts
; End of function Tails_Carry_Sonic


; =============== S U B R O U T I N E =======================================


sub_1459E:
	clr.w	x_vel(a1)
	clr.w	y_vel(a1)
	clr.w	ground_vel(a1)
	clr.w	angle(a1)
	move.w	x_pos(a0),x_pos(a1)
	move.w	y_pos(a0),y_pos(a1)
	addi.w	#$1C,y_pos(a1)
	move.w	#bytes_to_word(id_Hang,0),anim(a1)
	clr.b	anim_frame_timer(a1)
	clr.b	anim_frame(a1)
	move.b	#3,object_control(a1)
	bset	#1,status(a1)
	bclr	#4,status(a1)
	clr.b	spin_dash_flag(a1)
	andi.b	#-4,render_flags(a1)
	andi.b	#-2,status(a1)
	move.b	status(a0),d0
	andi.b	#1,d0
	or.b	d0,render_flags(a1)
	or.b	d0,status(a1)
	move.w	x_vel(a0),(Carried_character_x_vel).w
	move.w	x_vel(a0),x_vel(a1)
	move.w	y_vel(a0),(Carried_character_y_vel).w
	move.w	y_vel(a0),y_vel(a1)
	tst.b	(Reverse_gravity_flag).w
	beq.s	locret_14630
	subi.w	#$38,y_pos(a1)
	eori.b	#2,render_flags(a1)

locret_14630:
	rts
; End of function sub_1459E

; End of Tails CPU stuff