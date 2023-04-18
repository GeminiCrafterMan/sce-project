Obj_CCZRotatingPlatform:
		move.l	#loc_45DFE,(a0)
		move.b	#4,render_flags(a0)
		move.b	#$20,height_pixels(a0)
		move.b	#$C,width_pixels(a0)
		move.w	#$100,priority(a0)
		move.w	#$437E,art_tile(a0)
		move.l	#Map_CCZRotatingPlatform,mappings(a0)
		jsr	(Create_New_Sprite3).l
		bne.s	loc_45DFE
		move.w	a1,$32(a0)
		move.l	#loc_45F10,(a1)
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		move.b	subtype(a0),subtype(a1)

loc_45DFE:
		move.w	x_pos(a0),d0
		andi.w	#-$80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bls.s	loc_45E2E
		move.w	$32(a0),d0
		beq.s	loc_45E1C
		movea.w	d0,a1
		st	routine(a1)

loc_45E1C:
		move.w	respawn_addr(a0),d0
		beq.s	loc_45E28
		movea.w	d0,a1
		bclr	#7,(a1)

loc_45E28:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_45E2E:
		lea	Ani_CCZRotatingPlatform(pc),a1
		jsr	(Animate_Sprite).l
		moveq	#$10,d1
		moveq	#$21,d2
		moveq	#$21,d3
		move.w	x_pos(a0),d4
		jsr	(SolidObjectTop).l
		lea	(Player_1).w,a1
		lea	(Ctrl_1_logical).w,a2
		lea	wait(a0),a3
		moveq	#3,d6
		bsr.s	sub_45E6E
		lea	(Player_2).w,a1
		lea	(Ctrl_2_logical).w,a2
		lea	$30(a0),a3
		moveq	#4,d6
		bsr.s	sub_45E6E
		jmp	(Draw_Sprite).l

; =============== S U B R O U T I N E =======================================


sub_45E6E:
		cmpa.w	#Player_1,a1				; player 1?
		bne.s	.notP1
		tst.w	(Debug_placement_mode).w	; debug mode?
		beq.s	.notP1
		bset	#Status_InAir,status(a1)
		bclr	#Status_OnObj,status(a1)
		clr.b	(a3)
		bra.w	locret_45F0E				; skip to prevent a crash
	.notP1:
		tst.b	(a3)
		bne.s	loc_45E82
		btst	d6,status(a0)
		beq.w	locret_45F0E
		move.w	#$100,(a3)
		bra.w	locret_45F0E
; ---------------------------------------------------------------------------

loc_45E82:
		tst.b	(a3)
		bmi.s	loc_45E90
		btst	d6,status(a0)
		bne.s	loc_45E90
		clr.b	(a3)
		bra.s	locret_45F0E
; ---------------------------------------------------------------------------

loc_45E90:
		st	(a3)
		clr.w	x_vel(a1)
		clr.w	ground_vel(a1)
		clr.b	spin_dash_flag(a1)
		clr.b	anim(a1)
		bclr	#Status_Roll,status(a1)
		move.b	#3,wait(a1)
		move.w	(a2),d0
		andi.w	#btnABC,d0
		beq.s	loc_45EEE
		clr.b	(a3)
		move.w	#-$680,y_vel(a1)
		clr.b	wait(a1)
		bset	#Status_Roll,status(a1)
		bset	#Status_InAir,status(a1)
		move.b	#1,jumping(a1)
		move.b	#id_Roll,anim(a1)
		move.b	#$E,y_radius(a1)
		move.b	#7,x_radius(a1)
		sfx		sfx_Jump,1
; ---------------------------------------------------------------------------

loc_45EEE:
		moveq	#1,d1
		move.w	x_pos(a1),d0
		cmp.w	x_pos(a0),d0
		beq.s	loc_45F02
		bmi.s	loc_45EFE
		neg.w	d1

loc_45EFE:
		add.w	d1,x_pos(a1)

loc_45F02:
		addq.b	#2,1(a3)
		move.b	1(a3),d0
		jmp	loc_460A6(pc)
; ---------------------------------------------------------------------------

locret_45F0E:
		rts
; ---------------------------------------------------------------------------

loc_45F10:
		move.l	#loc_45F2E,(a0)
		addi.w	#$30,y_pos(a0)
		moveq	#$60,d0
		btst	#0,subtype(a0)
		beq.s	loc_45F2A
		move.w	#$A0,d0

loc_45F2A:
		move.b	d0,width_pixels(a0)

loc_45F2E:
		tst.b	routine(a0)
		beq.s	loc_45F3A
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_45F3A:
		moveq	#$B,d1
		add.b	width_pixels(a0),d1
		moveq	#$11,d2
		moveq	#$11,d3
		move.w	x_pos(a0),d4
		jsr	(SolidObjectTop).l
		lea	(Player_1).w,a1
		lea	(Ctrl_1_logical).w,a2
		lea	wait(a0),a3
		lea	jump(a0),a4
		moveq	#3,d6
		bsr.s	loc_45F74
		lea	(Player_2).w,a1
		lea	(Ctrl_2_logical).w,a2
		lea	jump(a0),a3
		lea	wait(a0),a4
		moveq	#4,d6

loc_45F74:
		cmpa.w	#Player_1,a1				; player 1?
		bne.s	.notP1
		tst.w	(Debug_placement_mode).w	; debug mode?
		beq.s	.notP1
		bset	#Status_InAir,status(a1)
		bclr	#Status_OnObj,status(a1)
		clr.b	(a3)
		bra.s	locret_45FB6				; skip to prevent a crash
	.notP1:
		tst.b	(a3)
		bne.s	loc_45FD6
		btst	d6,status(a0)
		bne.s	loc_45FB8
		tst.b	1(a3)
		beq.s	locret_45FB6
		move.w	y_pos(a0),d0
		subi.w	#$64,d0
		cmp.w	y_pos(a1),d0
		bhs.s	loc_45FAC
		move.w	x_pos(a1),d0
		sub.w	x_pos(a0),d0
		moveq	#0,d1
		move.b	width_pixels(a0),d1
		addi.w	#$B,d1
		add.w	d1,d0
		add.w	d1,d1
		cmp.w	d1,d0
		blo.s	locret_45FB6

loc_45FAC:
		clr.b	1(a3)
		move.w	#$100,priority(a1)

locret_45FB6:
		rts
; ---------------------------------------------------------------------------

loc_45FB8:
		move.w	#$1FF,(a3)
		moveq	#0,d1
		move.w	x_pos(a1),d0
		sub.w	x_pos(a0),d0
		bpl.s	loc_45FCC
		neg.w	d0
		moveq	#-$80,d1

loc_45FCC:
		move.w	d0,render_flags(a3)
		move.b	d1,2(a3)
		rts
; ---------------------------------------------------------------------------

loc_45FD6:
		tst.b	(a3)
		bmi.s	loc_45FE4
		btst	d6,status(a0)
		bne.s	loc_45FE4
		clr.b	(a3)
		rts
; ---------------------------------------------------------------------------

loc_45FE4:
		st	(a3)
		clr.w	x_vel(a1)
		clr.w	ground_vel(a1)
		clr.b	spin_dash_flag(a1)
		clr.b	anim(a1)
		bclr	#Status_Roll,status(a1)
		move.b	#3,wait(a1)
		move.w	(a2),d0
		andi.w	#btnABC,d0
		beq.s	loc_46042
		clr.b	(a3)
		move.w	#-$680,y_vel(a1)
		clr.b	wait(a1)
		bset	#Status_Roll,status(a1)
		bset	#Status_InAir,status(a1)
		move.b	#1,jumping(a1)
		move.b	#id_Roll,anim(a1)
		move.b	#$E,y_radius(a1)
		move.b	#7,x_radius(a1)
		sfx		sfx_Jump,1
; ---------------------------------------------------------------------------

loc_46042:
		addq.b	#2,2(a3)
		cmpi.w	#$14,render_flags(a3)
		bhs.s	loc_46052
		addq.w	#1,render_flags(a3)

loc_46052:
		move.b	2(a3),d0
		cmpi.b	#-$80,d0
		blo.s	loc_46074
		move.w	#$180,d1
		tst.b	(a4)
		beq.s	loc_4608A
		move.w	render_flags(a4),d2
		cmp.w	render_flags(a3),d2
		bhs.s	loc_4608A
		move.w	#$200,d1
		bra.s	loc_4608A
; ---------------------------------------------------------------------------

loc_46074:
		move.w	#$100,d1
		tst.b	(a4)
		beq.s	loc_4608A
		move.w	render_flags(a4),d2
		cmp.w	render_flags(a3),d2
		bhs.s	loc_4608A
		move.w	#$80,d1

loc_4608A:
		move.w	d1,priority(a1)
		jsr	(GetSineCosine).l
		muls.w	render_flags(a3),d1
		asr.l	#8,d1
		add.w	x_pos(a0),d1
		move.w	d1,x_pos(a1)
		move.b	2(a3),d0

loc_460A6:
		addi.w	#$A,d0
		andi.w	#$FF,d0
		move.w	d0,d1
		add.w	d0,d0
		add.w	d1,d0
		lsr.w	#5,d0
		andi.w	#-2,d0
		lea	RotatingPlatform_PlayerFrames(pc),a2
		adda.w	d0,a2
		move.b	(a2)+,d0
		andi.b	#-4,render_flags(a1)
		or.b	d0,render_flags(a1)
		move.b	(a2),d0
		move.b	d0,mapping_frame(a1)
		move.l	a0,-(sp)
		move.l	a2,-(sp)
		lea		(a1),a0
		jsr	(Player_Load_PLC).l
		movea.l	(sp)+,a2
		movea.l	(sp)+,a0
	.ret:
		rts
; End of function sub_45E6E

Map_CCZRotatingPlatform:	binclude	"Objects/Rotating Platform/Object Data/Map - Rotating Platform.bin"

Ani_CCZRotatingPlatform:	; maybe make this a raw animation later, i don't see the point of doing it like this
		dc.w byte_46D1A-Ani_CCZRotatingPlatform
byte_46D1A:	dc.b	7,   0,	  1,   2, afEnd
		even

RotatingPlatform_PlayerFrames:
		dc.b    1, frS_Turntable1
		dc.b    0, frS_Turntable5
		dc.b    0, frS_Turntable6
		dc.b    0, frS_Turntable7
		dc.b    1, frS_Turntable6
		dc.b    1, frS_Turntable5
		dc.b    0, frS_Turntable1
		dc.b    0, frS_Turntable2
		dc.b    0, frS_Turntable3
		dc.b    0, frS_Turntable4
		dc.b    1, frS_Turntable3
		dc.b    1, frS_Turntable2