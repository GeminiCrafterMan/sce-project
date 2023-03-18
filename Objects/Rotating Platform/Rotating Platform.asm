Obj_CCZRotatingPlatform:
		move.l	#loc_45DFE,(a0)
		move.b	#4,4(a0)
		move.b	#$20,6(a0)
		move.b	#$C,7(a0)
		move.w	#$100,8(a0)
		move.w	#$437E,$A(a0)
		move.l	#Map_CCZRotatingPlatform,$C(a0)
		jsr	(Create_New_Sprite3).l
		bne.s	loc_45DFE
		move.w	a1,$32(a0)
		move.l	#loc_45F10,(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	$2C(a0),$2C(a1)

loc_45DFE:
		move.w	$10(a0),d0
		andi.w	#-$80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bls.s	loc_45E2E
		move.w	$32(a0),d0
		beq.s	loc_45E1C
		movea.w	d0,a1
		st	5(a1)

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
		move.w	$10(a0),d4
		jsr	(SolidObjectTop).l
		lea	(Player_1).w,a1
		lea	(Ctrl_1_logical).w,a2
		lea	$2E(a0),a3
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
		tst.b	(a3)
		bne.s	loc_45E82
		btst	d6,$2A(a0)
		beq.w	locret_45F0E
		move.w	#$100,(a3)
		bra.w	locret_45F0E
; ---------------------------------------------------------------------------

loc_45E82:
		tst.b	(a3)
		bmi.s	loc_45E90
		btst	d6,$2A(a0)
		bne.s	loc_45E90
		clr.b	(a3)
		bra.s	locret_45F0E
; ---------------------------------------------------------------------------

loc_45E90:
		st	(a3)
		clr.w	$18(a1)
		clr.w	$1C(a1)
		clr.b	$3D(a1)
		clr.b	$20(a1)
		bclr	#2,$2A(a1)
		move.b	#3,$2E(a1)
		move.w	(a2),d0
		andi.w	#$70,d0
		beq.s	loc_45EEE
		clr.b	(a3)
		move.w	#-$680,$1A(a1)
		clr.b	$2E(a1)
		bset	#2,$2A(a1)
		bset	#1,$2A(a1)
		move.b	#1,$40(a1)
		move.b	#2,$20(a1)
		move.b	#$E,$1E(a1)
		move.b	#7,$1F(a1)
		sfx		sfx_Jump,1
; ---------------------------------------------------------------------------

loc_45EEE:
		moveq	#1,d1
		move.w	$10(a1),d0
		cmp.w	$10(a0),d0
		beq.s	loc_45F02
		bmi.s	loc_45EFE
		neg.w	d1

loc_45EFE:
		add.w	d1,$10(a1)

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
		addi.w	#$30,$14(a0)
		moveq	#$60,d0
		btst	#0,$2C(a0)
		beq.s	loc_45F2A
		move.w	#$A0,d0

loc_45F2A:
		move.b	d0,7(a0)

loc_45F2E:
		tst.b	5(a0)
		beq.s	loc_45F3A
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_45F3A:
		moveq	#$B,d1
		add.b	7(a0),d1
		moveq	#$11,d2
		moveq	#$11,d3
		move.w	$10(a0),d4
		jsr	(SolidObjectTop).l
		lea	(Player_1).w,a1
		lea	(Ctrl_1_logical).w,a2
		lea	$2E(a0),a3
		lea	$34(a0),a4
		moveq	#3,d6
		bsr.s	loc_45F74
		lea	(Player_2).w,a1
		lea	(Ctrl_2_logical).w,a2
		lea	$34(a0),a3
		lea	$2E(a0),a4
		moveq	#4,d6

loc_45F74:
		tst.b	(a3)
		bne.s	loc_45FD6
		btst	d6,$2A(a0)
		bne.s	loc_45FB8
		tst.b	1(a3)
		beq.s	locret_45FB6
		move.w	$14(a0),d0
		subi.w	#$64,d0
		cmp.w	$14(a1),d0
		bhs.s	loc_45FAC
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		moveq	#0,d1
		move.b	7(a0),d1
		addi.w	#$B,d1
		add.w	d1,d0
		add.w	d1,d1
		cmp.w	d1,d0
		blo.s	locret_45FB6

loc_45FAC:
		clr.b	1(a3)
		move.w	#$100,8(a1)

locret_45FB6:
		rts
; ---------------------------------------------------------------------------

loc_45FB8:
		move.w	#$1FF,(a3)
		moveq	#0,d1
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		bpl.s	loc_45FCC
		neg.w	d0
		moveq	#-$80,d1

loc_45FCC:
		move.w	d0,4(a3)
		move.b	d1,2(a3)
		rts
; ---------------------------------------------------------------------------

loc_45FD6:
		tst.b	(a3)
		bmi.s	loc_45FE4
		btst	d6,$2A(a0)
		bne.s	loc_45FE4
		clr.b	(a3)
		rts
; ---------------------------------------------------------------------------

loc_45FE4:
		st	(a3)
		clr.w	$18(a1)
		clr.w	$1C(a1)
		clr.b	$3D(a1)
		clr.b	$20(a1)
		bclr	#2,$2A(a1)
		move.b	#3,$2E(a1)
		move.w	(a2),d0
		andi.w	#$70,d0
		beq.s	loc_46042
		clr.b	(a3)
		move.w	#-$680,$1A(a1)
		clr.b	$2E(a1)
		bset	#2,$2A(a1)
		bset	#1,$2A(a1)
		move.b	#1,$40(a1)
		move.b	#2,$20(a1)
		move.b	#$E,$1E(a1)
		move.b	#7,$1F(a1)
		sfx		sfx_Jump,1
; ---------------------------------------------------------------------------

loc_46042:
		addq.b	#2,2(a3)
		cmpi.w	#$14,4(a3)
		bhs.s	loc_46052
		addq.w	#1,4(a3)

loc_46052:
		move.b	2(a3),d0
		cmpi.b	#-$80,d0
		blo.s	loc_46074
		move.w	#$180,d1
		tst.b	(a4)
		beq.s	loc_4608A
		move.w	4(a4),d2
		cmp.w	4(a3),d2
		bhs.s	loc_4608A
		move.w	#$200,d1
		bra.s	loc_4608A
; ---------------------------------------------------------------------------

loc_46074:
		move.w	#$100,d1
		tst.b	(a4)
		beq.s	loc_4608A
		move.w	4(a4),d2
		cmp.w	4(a3),d2
		bhs.s	loc_4608A
		move.w	#$80,d1

loc_4608A:
		move.w	d1,8(a1)
		jsr	(GetSineCosine).l
		muls.w	4(a3),d1
		asr.l	#8,d1
		add.w	$10(a0),d1
		move.w	d1,$10(a1)
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
		andi.b	#-4,4(a1)
		or.b	d0,4(a1)
		move.b	(a2),d0
		move.b	d0,$22(a1)
		tst.w	(Debug_placement_mode).w
		bne.s	.ret
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