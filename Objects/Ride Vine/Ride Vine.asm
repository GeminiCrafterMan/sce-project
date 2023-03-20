Obj_TTPZRideVine:
		movea.l	a0,a1
		move.l	#loc_21D28,(a1)
		bsr.w	sub_21D00
		move.b	#$21,mapping_frame(a1)
		move.w	x_pos(a0),d2
		move.w	y_pos(a0),d3
		moveq	#0,d1
		move.b	subtype(a0),d1
		andi.w	#$7F,d1
		lsl.w	#4,d1
		add.w	d2,d1
		move.w	d1,parent3(a0)
		moveq	#3,d1
		addq.w	#1,d1
		jsr	(Create_New_Sprite3).l
		bne.w	loc_21CFE
		move.w	a1,objoff_3E(a0)
		move.l	#loc_21F80,(a1)
		move.w	a0,objoff_3C(a1)
		bra.s	loc_21CD0
; ---------------------------------------------------------------------------

loc_21CB8:
		jsr	(Create_New_Sprite3).l
		bne.w	loc_21CFE
		move.l	#loc_22014,(a1)
		move.w	a2,objoff_3C(a1)
		move.w	a1,objoff_3E(a2)

loc_21CD0:
		movea.l	a1,a2
		bsr.s	sub_21D00
		move.w	d2,x_pos(a1)
		move.w	d3,y_pos(a1)
		addi.w	#$10,d3
		addq.w	#1,objoff_36(a0)
		move.w	objoff_36(a0),objoff_36(a1)
		dbf	d1,loc_21CB8
		move.l	#Obj_TTPZRideVineHandle,(a1)
		move.b	#$20,mapping_frame(a1)
		move.w	a1,objoff_40(a0)

loc_21CFE:
		bra.s	loc_21D28

; =============== S U B R O U T I N E =======================================


sub_21D00:	; the actual vine
		move.b	#4,render_flags(a1)
		move.b	#8,width_pixels(a1)
		move.b	#8,height_pixels(a1)
		move.w	#$200,priority(a1)
		move.l	#Map_TTPZRideVine,mappings(a1)
		move.w	#make_art_tile(ArtTile_Crabmeat,0,0),art_tile(a1)
		rts
; End of function sub_21D00

; ---------------------------------------------------------------------------

loc_21D28:
		movea.w	objoff_40(a0),a1
		tst.w	objoff_32(a1)
		beq.s	loc_21D48
		move.l	#loc_21D4C,(a0)
		movea.w	objoff_3E(a0),a1
		move.w	#1,wait(a1)
		move.w	#0,objoff_38(a1)

loc_21D48:
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21D4C:	; Flame from the "burn" subtype
		addi.l	#$80000,x_pos(a0)
		addi.l	#$20000,y_pos(a0)
		move.w	x_pos(a0),d0
		cmp.w	parent3(a0),d0
		blo.w	loc_21DEE
		tst.b	subtype(a0)
		bpl.s	loc_21DC2
		move.l	#loc_21DF2,(a0)
		move.w	#$800,x_vel(a0)
		move.w	#$200,y_vel(a0)
		move.l	#Map_AnimatedStillSprites,mappings(a0)
		move.w	#$62E9,art_tile(a0)
		move.b	#8,width_pixels(a0)
		move.b	#$C,height_pixels(a0)
		clr.b	mapping_frame(a0)
		move.w	#1,anim(a0)
		movea.w	objoff_40(a0),a1
		lea	objoff_32(a1),a2
		tst.b	(a2)
		beq.s	loc_21DB6
		move.b	#$81,(a2)

loc_21DB6:
		addq.w	#1,a2
		tst.b	(a2)
		beq.s	loc_21DC0
		move.b	#$81,(a2)

loc_21DC0:
		bra.s	loc_21DEE
; ---------------------------------------------------------------------------

loc_21DC2:
		move.l	#loc_21E14,(a0)
		movea.w	objoff_3E(a0),a1
		move.l	#loc_21FE8,(a1)
		move.w	#0,objoff_3A(a1)
		movea.w	objoff_40(a0),a1
		move.w	#1,objoff_30(a1)
		move.w	#0,angle(a0)
		move.w	#$400,objoff_3A(a0)

loc_21DEE:
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21DF2:
		jsr	(MoveSprite).l
		tst.b	render_flags(a0)
		bmi.s	loc_21E04
		move.w	#$7FF0,x_pos(a0)

loc_21E04:
		lea	(Ani_AnimatedStillSprites).l,a1
		jsr	(Animate_Sprite).l
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21E14:
		movea.w	objoff_40(a0),a1
		move.w	objoff_3A(a0),d0
		move.b	angle(a0),d1
		ext.w	d1
		bpl.s	loc_21E26
		neg.w	d1

loc_21E26:
		add.w	d1,d1
		sub.w	d1,d0
		sub.w	d0,angle(a0)
		tst.w	objoff_32(a1)
		bne.s	loc_21E68
		move.b	angle(a0),d0
		addq.b	#8,d0
		cmpi.b	#$10,d0
		bhs.s	loc_21E68
		move.l	#loc_21E6C,(a0)
		clr.w	objoff_42(a0)
		move.w	#$FD00,objoff_44(a0)
		move.w	#$1000,objoff_38(a0)
		clr.w	wait(a0)
		movea.w	objoff_40(a0),a1
		move.w	#2,objoff_30(a1)

loc_21E68:
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21E6C:
		moveq	#0,d2
		move.b	objoff_38(a0),d2
		move.w	objoff_44(a0),d0
		move.w	#0,d1
		tst.w	wait(a0)
		bne.s	loc_21EC4
		add.w	d2,d0
		move.w	d0,objoff_44(a0)
		add.w	d0,objoff_42(a0)
		cmp.b	objoff_42(a0),d1
		bgt.s	loc_21EEE
		asr.w	#4,d0
		sub.w	d0,objoff_44(a0)
		move.w	#1,wait(a0)
		cmpi.w	#$C00,objoff_38(a0)
		beq.s	loc_21EAC
		subi.w	#$40,objoff_38(a0)
		bra.s	loc_21EEE
; ---------------------------------------------------------------------------

loc_21EAC:
		move.l	#loc_21F0A,(a0)
		move.w	#0,objoff_38(a0)
		movea.w	objoff_40(a0),a1
		move.w	#0,objoff_30(a1)
		bra.s	loc_21EEE
; ---------------------------------------------------------------------------

loc_21EC4:
		sub.w	d2,d0
		move.w	d0,objoff_44(a0)
		add.w	d0,objoff_42(a0)
		cmp.b	objoff_42(a0),d1
		ble.s	loc_21EEE
		asr.w	#4,d0
		sub.w	d0,objoff_44(a0)
		move.w	#0,wait(a0)
		cmpi.w	#$C00,objoff_38(a0)
		beq.s	loc_21EAC
		subi.w	#$40,objoff_38(a0)

loc_21EEE:
		move.w	objoff_42(a0),d0
		move.w	d0,angle(a0)
		asr.w	#3,d0
		move.w	d0,objoff_3A(a0)
		movea.w	objoff_3E(a0),a1
		move.w	objoff_3A(a0),objoff_3A(a1)
		bra.w	loc_21F38
; ---------------------------------------------------------------------------

loc_21F0A:
		move.b	objoff_38(a0),d0
		addi.w	#$200,objoff_38(a0)
		jsr	(GetSineCosine).l
		asl.w	#2,d0
		cmpi.w	#$400,d0
		bne.s	loc_21F26
		move.w	#$3FF,d0

loc_21F26:
		move.w	d0,angle(a0)
		move.w	d0,objoff_3A(a0)
		movea.w	objoff_3E(a0),a1
		move.w	objoff_3A(a0),objoff_3A(a1)

loc_21F38:
		move.w	x_pos(a0),d0
		andi.w	#$FF80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bhi.w	loc_21F52
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_21F52:
		move.w	objoff_36(a0),d2
		subq.w	#1,d2
		bcs.s	loc_21F6E
		movea.w	objoff_3E(a0),a2

loc_21F5E:
		movea.l	a2,a1
		movea.w	objoff_3E(a1),a2
		jsr	(Delete_Referenced_Sprite).l
		dbf	d2,loc_21F5E

loc_21F6E:
		move.w	respawn_addr(a0),d0
		beq.s	loc_21F7A
		movea.w	d0,a2
		bclr	#7,(a2)

loc_21F7A:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_21F80:
		tst.w	wait(a0)
		bne.s	loc_21FA8
		move.b	objoff_38(a0),d0
		addi.w	#$200,objoff_38(a0)
		jsr	(GetSineCosine).l
		asl.w	#2,d0
		cmpi.w	#$400,d0
		bne.s	loc_21FA2
		move.w	#$3FF,d0

loc_21FA2:
		move.w	d0,objoff_3A(a0)
		bra.s	loc_21FBE
; ---------------------------------------------------------------------------

loc_21FA8:
		move.b	objoff_38(a0),d0
		addi.w	#$100,objoff_38(a0)
		jsr	(GetSineCosine).l
		asl.w	#3,d0
		move.w	d0,objoff_3A(a0)

loc_21FBE:
		move.w	objoff_3A(a0),d0
		move.w	d0,angle(a0)
		move.b	angle(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,mapping_frame(a0)
		movea.w	objoff_3C(a0),a1
		move.w	x_pos(a1),x_pos(a0)
		move.w	y_pos(a1),y_pos(a0)
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_21FE8:
		movea.w	objoff_3C(a0),a1
		move.w	angle(a1),angle(a0)
		move.b	angle(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,mapping_frame(a0)
		movea.w	objoff_3C(a0),a1
		move.w	x_pos(a1),x_pos(a0)
		move.w	y_pos(a1),y_pos(a0)
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_22014:
		movea.w	objoff_3C(a0),a1
		move.w	objoff_3A(a1),objoff_3A(a0)
		move.w	angle(a1),d0
		add.w	objoff_3A(a0),d0
		move.w	d0,angle(a0)
		move.b	angle(a0),d0
		addq.b	#4,d0
		lsr.b	#3,d0
		move.b	d0,mapping_frame(a0)
		bsr.w	sub_22040
		jmp	(Draw_Sprite).l

; =============== S U B R O U T I N E =======================================


sub_22040:
		movea.w	objoff_3C(a0),a1
		move.b	angle(a1),d0
		addq.b	#4,d0
		andi.b	#-8,d0
		jsr	(GetSineCosine).l
		neg.w	d0
		addi.w	#8,d0
		addi.w	#8,d1
		asr.w	#4,d0
		asr.w	#4,d1
		add.w	x_pos(a1),d0
		move.w	d0,x_pos(a0)
		add.w	y_pos(a1),d1
		move.w	d1,y_pos(a0)
		rts
; End of function sub_22040

; ---------------------------------------------------------------------------

Obj_TTPZRideVineHandle:
		move.w	x_pos(a0),d4
		move.w	y_pos(a0),d5
		bsr.w	sub_22040
		cmp.w	x_pos(a0),d4
		beq.s	loc_2208A
		move.w	d4,objoff_42(a0)

loc_2208A:
		cmp.w	y_pos(a0),d5
		beq.s	loc_22094
		move.w	d5,objoff_44(a0)

loc_22094:
		lea	objoff_32(a0),a2
		lea	(Player_1).w,a1
		move.w	(Ctrl_1_logical).w,d0
		bsr.s	sub_220C2
		lea	(Player_2).w,a1
		addq.w	#1,a2
		move.w	(Ctrl_2_logical).w,d0
		bsr.s	sub_220C2
		tst.w	objoff_32(a0)
		beq.s	loc_220BA
		tst.w	objoff_30(a0)
		bne.s	locret_220C0

loc_220BA:
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

locret_220C0:
		rts

; =============== S U B R O U T I N E =======================================


sub_220C2:
		tst.b	(a2)
		beq.w	loc_222F4
		bmi.w	loc_2217E
		tst.b	render_flags(a1)
		bpl.w	loc_22190
		cmpi.b	#4,routine(a1)
		bhs.w	loc_22190
		move.b	d0,d1
		andi.b	#$70,d1
		beq.w	loc_221EC
		clr.b	wait(a1)
		clr.b	(a2)
		cmpi.w	#1,objoff_30(a0)
		beq.s	loc_2215C
		move.w	x_pos(a0),d1
		sub.w	objoff_42(a0),d1
		asl.w	#7,d1
		move.w	d1,x_vel(a1)
		move.w	y_pos(a0),d1
		sub.w	objoff_44(a0),d1
		asl.w	#7,d1
		move.w	d1,y_vel(a1)
		move.b	#$3C,2(a2)
		btst	#$A,d0
		beq.s	loc_22124
		move.w	#-$200,x_vel(a1)

loc_22124:
		btst	#$B,d0
		beq.s	loc_22130
		move.w	#$200,x_vel(a1)

loc_22130:
		addi.w	#-$380,y_vel(a1)

loc_22136:
		bset	#1,status(a1)
		move.b	#1,jumping(a1)
		move.b	#$E,y_radius(a1)
		move.b	#7,x_radius(a1)
		move.b	#id_Roll,anim(a1)
		bset	#2,status(a1)
		rts
; ---------------------------------------------------------------------------

loc_2215C:
		move.b	#$3C,2(a2)
		movea.w	objoff_3C(a0),a3
		move.b	angle(a3),d0
		jsr	(GetSineCosine).l
		asl.w	#3,d1
		move.w	d1,x_vel(a1)
		asl.w	#3,d0
		move.w	d0,y_vel(a1)
		bra.s	loc_22136
; ---------------------------------------------------------------------------

loc_2217E:
		move.w	#$300,x_vel(a1)
		move.w	#$200,y_vel(a1)
		bset	#1,status(a1)

loc_22190:
		clr.b	wait(a1)
		clr.b	(a2)
		move.b	#$3C,2(a2)
		rts
; End of function sub_220C2
; ---------------------------------------------------------------------------

loc_221EC:
		tst.w	objoff_30(a0)
		bne.s	loc_22258
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		addi.w	#$14,y_pos(a1)
		movea.w	objoff_3C(a0),a3
		moveq	#0,d0
		move.b	angle(a3),d0
		btst	#0,status(a1)
		beq.s	loc_2221A
		neg.b	d0

loc_2221A:
		addq.b	#8,d0
		lsr.w	#4,d0
		move.b	byte_22248(pc,d0.w),mapping_frame(a1)

loc_22224:
		move.b	status(a1),d1
		andi.b	#1,d1
		andi.b	#$FC,render_flags(a1)
		or.b	d1,render_flags(a1)
		moveq	#0,d0
		move.b	mapping_frame(a1),d0
		move.l	a0,-(sp)
		move.l	a2,-(sp)
		lea		(a1),a0
		jsr	(Player_Load_PLC).l
		movea.l	(sp)+,a2
		movea.l	(sp)+,a0
		rts
; ---------------------------------------------------------------------------
byte_22248:	dc.b frS_Hang2
		dc.b frS_Hang2
		dc.b frS_Hang1
		dc.b frS_Hang1
		dc.b frS_Hang1
		dc.b frS_Hang1
		dc.b frS_Hang1
		dc.b frS_Hang1
		dc.b frS_Hang3
		dc.b frS_Hang3
		dc.b frS_Hang3
		dc.b frS_Hang3
		dc.b frS_Hang3
		dc.b frS_Hang3
		dc.b frS_Hang2
		dc.b frS_Hang2
; ---------------------------------------------------------------------------

loc_22258:
		movea.w	objoff_3C(a0),a3
		moveq	#0,d0
		move.b	angle(a3),d0
		btst	#0,status(a1)
		beq.s	loc_2226C
		neg.b	d0

loc_2226C:
		addi.b	#$10,d0
		lsr.w	#5,d0
		add.w	d0,d0
		move.b	byte_222D4(pc,d0.w),mapping_frame(a1)
		clr.b	anim(a1)
		andi.w	#$FFFE,d0
		move.b	byte_222E4(pc,d0.w),d2
		move.b	byte_222E4+1(pc,d0.w),d3
		ext.w	d2
		ext.w	d3
		btst	#0,status(a1)
		beq.s	loc_2229A
		neg.w	d2

loc_2229A:
		movea.w	objoff_3C(a0),a3
		move.b	angle(a3),d0
		addq.b	#4,d0
		andi.b	#$F8,d0
		jsr	(GetSineCosine).l
		neg.w	d0
		addi.w	#8,d0
		addi.w	#8,d1
		asr.w	#4,d0
		asr.w	#4,d1
		add.w	x_pos(a3),d0
		add.w	d2,d0
		move.w	d0,x_pos(a1)
		add.w	y_pos(a3),d1
		add.w	d3,d1
		move.w	d1,y_pos(a1)
		bra.w	loc_22224
; ---------------------------------------------------------------------------
byte_222D4:	dc.b frS_RopeSwing1
		dc.b frS_RopeSwing1
		dc.b frS_RopeSwing8
		dc.b frS_RopeSwing8
		dc.b frS_RopeSwing7
		dc.b frS_RopeSwing7
		dc.b frS_RopeSwing6
		dc.b frS_RopeSwing6
		dc.b frS_RopeSwing5
		dc.b frS_RopeSwing5
		dc.b frS_RopeSwing4
		dc.b frS_RopeSwing4
		dc.b frS_RopeSwing3
		dc.b frS_RopeSwing3
		dc.b frS_RopeSwing2
		dc.b frS_RopeSwing2
byte_222E4:	dc.b 0
		dc.b $18
		dc.b $EE
		dc.b $13
		dc.b $E8
		dc.b 0
		dc.b $EE
		dc.b $ED
		dc.b 0
		dc.b $E8
		dc.b $12
		dc.b $ED
		dc.b $18
		dc.b 0
		dc.b $12
		dc.b $13
; ---------------------------------------------------------------------------

loc_222F4:
		tst.b	2(a2)
		beq.s	loc_22302
		subq.b	#1,2(a2)
		bne.w	locret_2237C

loc_22302:
		move.w	x_pos(a1),d0
		sub.w	x_pos(a0),d0
		addi.w	#$10,d0
		cmpi.w	#$20,d0
		bhs.w	locret_2237C
		move.w	y_pos(a1),d1
		sub.w	y_pos(a0),d1
		cmpi.w	#$18,d1
		bhs.w	locret_2237C
		tst.b	wait(a1)
		bne.s	locret_2237C
		cmpi.b	#4,routine(a1)
		bhs.s	locret_2237C
		tst.w	(Debug_placement_mode).w
		bne.s	locret_2237C
		clr.w	x_vel(a1)
		clr.w	y_vel(a1)
		clr.w	ground_vel(a1)
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		addi.w	#$14,y_pos(a1)
		move.b	#id_Hang,anim(a1)
		clr.b	spin_dash_flag(a1)
		move.b	#3,wait(a1)
		andi.b	#$FD,render_flags(a1)
		move.b	#1,(a2)
		sfx		sfx_Grab

locret_2237C:
		rts

Map_TTPZRideVine:	binclude	"Objects/Ride Vine/Object Data/Map - Ride Vine.bin"