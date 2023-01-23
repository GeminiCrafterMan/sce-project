; Unknown variables:
; $24 - byte
; $30 - longword (some sort of address?)
; $34 - longword (some sort of address?)
; $3E - byte
; $3F - byte

Obj_TensionBridge:
		move.l	#loc_387E0,(a0)
		move.l	#Map_TensionBridge,mappings(a0)
		move.w	#make_art_tile(ArtTile_Bridge,2,0),art_tile(a0)
		move.w	#$200,priority(a0)

		tst.b	subtype(a0)
		bpl.s	loc_386F0
		move.l	#loc_387B6,(a0)
		andi.b	#$7F,subtype(a0)

loc_386F0:
		move.b	#4,render_flags(a0)
		move.b	#-$80,width_pixels(a0)
		move.b	#8,height_pixels(a0)
		move.w	y_pos(a0),d2
		move.w	d2,ros_addr(a0)
		move.w	x_pos(a0),d3
		lea	subtype(a0),a2
		moveq	#0,d1
		move.b	(a2),d1
		move.w	d1,d0
		lsr.w	#1,d0
		lsl.w	#4,d0
		sub.w	d0,d3
		swap	d1
		move.w	#8,d1
		bsr.s	sub_38756
		move.w	$30(a1),d0
		subq.w	#8,d0
		move.w	d0,x_pos(a1)
		move.l	a1,$30(a0)
		swap	d1
		subq.w	#8,d1
		bls.s	loc_38752
		move.w	d1,d4
		bsr.s	sub_38756
		move.l	a1,$34(a0)
		move.w	d4,d0
		add.w	d0,d0
		add.w	d4,d0
		move.w	x_vel(a1,d0.w),d0
		subq.w	#8,d0
		move.w	d0,x_pos(a1)

loc_38752:
		bra.w	loc_387E0

; =============== S U B R O U T I N E =======================================


sub_38756:
		jsr	(Create_New_Sprite3).l
		bne.s	locret_387B4
		move.l	#loc_3887C,(a1)
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		move.l	mappings(a0),mappings(a1)
		move.w	art_tile(a0),art_tile(a1)
		move.b	render_flags(a0),render_flags(a1)
		move.w	priority(a0),priority(a1)
		bset	#6,render_flags(a1)
		move.b	#$40,width_pixels(a1)
		move.b	#8,height_pixels(a1)
		move.w	d1,mainspr_childsprites(a1)
		subq.b	#1,d1
		lea	x_vel(a1),a2

loc_387A4:
		move.w	d3,(a2)+
		move.w	d2,(a2)+
		move.w	#0,(a2)+
		addi.w	#$10,d3
		dbf	d1,loc_387A4

locret_387B4:
		rts
; End of function sub_38756

; ---------------------------------------------------------------------------

loc_387B6:
		move.b	subtype(a0),d0
		andi.w	#$F,d0
		lea	(Level_trigger_array).w,a3
		lea	(a3,d0.w),a3
		tst.b	(a3)
		beq.s	loc_387E0
		move.l	#loc_3890C,(a0)
		move.b	#$E,$34(a0)
		move.l	#loc_388E4,d4
		bra.w	loc_389C8
; ---------------------------------------------------------------------------

loc_387E0:
		move.b	status(a0),d0
		andi.b	#$18,d0
		bne.s	loc_387F6
		tst.b	$3E(a0)
		beq.s	loc_38822
		subq.b	#4,$3E(a0)
		bra.s	loc_3881E
; ---------------------------------------------------------------------------

loc_387F6:
		andi.b	#$10,d0
		beq.s	loc_38812
		move.b	$3F(a0),d0
		sub.b	ros_bit(a0),d0
		beq.s	loc_38812
		bcc.s	loc_3880E
		addq.b	#1,$3F(a0)
		bra.s	loc_38812
; ---------------------------------------------------------------------------

loc_3880E:
		subq.b	#1,$3F(a0)

loc_38812:
		cmpi.b	#$40,$3E(a0)
		beq.s	loc_3881E
		addq.b	#4,$3E(a0)

loc_3881E:
		bsr.w	sub_38CC2

loc_38822:
		moveq	#0,d1
		move.b	subtype(a0),d1
		lsl.w	#3,d1
		move.w	d1,d2
		addq.w	#8,d1
		add.w	d2,d2
		moveq	#8,d3
		move.w	x_pos(a0),d4
		bsr.w	sub_38A88

loc_3883A:
		move.w	x_pos(a0),d0
		andi.w	#-$80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bhi.s	loc_3884E
		rts
; ---------------------------------------------------------------------------

loc_3884E:
		movea.l	$30(a0),a1
		jsr	(Delete_Referenced_Sprite).l
		cmpi.b	#8,subtype(a0)
		bls.s	loc_3886A
		movea.l	$34(a0),a1
		jsr	(Delete_Referenced_Sprite).l

loc_3886A:
		move.w	respawn_addr(a0),d0
		beq.s	loc_38876
		movea.w	d0,a2
		bclr	#7,(a2)

loc_38876:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_3887C:
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_3890C:
		tst.b	$34(a0)
		beq.s	loc_38918
		subq.b	#1,$34(a0)
		rts
; ---------------------------------------------------------------------------

loc_38918:
		bclr	#3,status(a0)
		beq.s	loc_3892C
		bclr	#3,(Player_1+status).w
		bset	#1,(Player_1+status).w

loc_3892C:
		bclr	#4,status(a0)
		beq.s	loc_38940
		bclr	#3,(Player_2+status).w
		bset	#1,(Player_2+status).w

loc_38940:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_388E4:
		tst.b	$34(a0)
		beq.s	loc_388F4
		subq.b	#1,$34(a0)
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_388F4:
		jsr	(MoveSprite).l
		tst.b	render_flags(a0)
		bpl.s	loc_38906
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_38906:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_389C8:
		movea.l	$30(a0),a3
		bsr.s	sub_389DE
		cmpi.b	#8,subtype(a0)
		bls.s	locret_389DC
		movea.l	$34(a0),a3
		bsr.s	sub_389DE

locret_389DC:
		rts

; =============== S U B R O U T I N E =======================================


sub_389DE:
		lea	(byte_38A78).l,a4
		lea	x_vel(a3),a2
		move.w	mainspr_childsprites(a3),d6
		subq.w	#1,d6
		bclr	#6,render_flags(a3)
		movea.l	a3,a1
		bra.s	loc_38A00
; ---------------------------------------------------------------------------

loc_389F8:
		jsr	(Create_New_Sprite3).l
		bne.s	loc_38A64

loc_38A00:
		move.l	d4,(a1)
		move.l	mappings(a3),mappings(a1)
		move.b	render_flags(a3),render_flags(a1)
		move.w	art_tile(a3),art_tile(a1)
		move.w	priority(a3),priority(a1)
		move.b	width_pixels(a3),width_pixels(a1)
		move.b	height_pixels(a3),height_pixels(a1)
		move.w	priority(a3),priority(a1)
		move.w	(a2)+,x_pos(a1)
		move.w	(a2)+,y_pos(a1)
		move.w	(a2)+,d0
		move.b	d0,mapping_frame(a1)
		move.b	(a4)+,$34(a1)
		movea.l	a1,a5
		jsr	(Create_New_Sprite3).l
		bne.s	loc_38A64
		move.l	#sub_1E6EC,(a1)
		move.w	x_pos(a5),x_pos(a1)
		move.w	y_pos(a5),y_pos(a1)
		move.b	-1(a4),$24(a1)
		dbf	d6,loc_389F8

loc_38A64:
		move.w	#0,x_vel(a3)
		move.w	#0,y_vel(a3)
		sfx		sfx_BridgeCollapse,1
; End of function sub_389DE

; ---------------------------------------------------------------------------
byte_38A78:	dc.b    8, $10,  $C,  $E,   6,  $A,   4,   2
		dc.b    8, $10,  $C,  $E,   6,  $A,   4,   2

; =============== S U B R O U T I N E =======================================


sub_38A88:
		lea	(Player_2).w,a1
		moveq	#4,d6
		moveq	#$3B,d5
		movem.l	d1-d4,-(sp)
		bsr.s	sub_38AA2
		movem.l	(sp)+,d1-d4
		lea	(Player_1).w,a1
		subq.b	#1,d6
		moveq	#$3F,d5
; End of function sub_38A88


; =============== S U B R O U T I N E =======================================


sub_38AA2:
		btst	d6,status(a0)
		beq.s	loc_38B06
		btst	#1,status(a1)
		bne.s	loc_38AC2
		moveq	#0,d0
		move.w	x_pos(a1),d0
		sub.w	x_pos(a0),d0
		add.w	d1,d0
		bmi.s	loc_38AC2
		cmp.w	d2,d0
		blo.s	loc_38AD0

loc_38AC2:
		bclr	#3,status(a1)
		bclr	d6,status(a0)
		moveq	#0,d4
		rts
; ---------------------------------------------------------------------------

loc_38AD0:
		lsr.w	#4,d0
		move.b	d0,(a0,d5.w)
		movea.l	$30(a0),a2
		cmpi.w	#8,d0
		blo.s	loc_38AE8
		movea.l	$34(a0),a2
		subi.w	#8,d0

loc_38AE8:
		add.w	d0,d0
		move.w	d0,d1
		add.w	d0,d0
		add.w	d1,d0
		move.w	y_vel(a2,d0.w),d0
		subq.w	#8,d0
		moveq	#0,d1
		move.b	$1E(a1),d1
		sub.w	d1,d0
		move.w	d0,y_pos(a1)
		moveq	#0,d4
		rts
; ---------------------------------------------------------------------------

loc_38B06:
		move.w	d1,-(sp)
		jsr	(sub_1E410).l
		move.w	(sp)+,d1
		btst	d6,status(a0)
		beq.s	locret_38B28
		moveq	#0,d0
		move.w	x_pos(a1),d0
		sub.w	x_pos(a0),d0
		add.w	d1,d0
		lsr.w	#4,d0
		move.b	d0,(a0,d5.w)

locret_38B28:
		rts
; End of function sub_38AA2


; =============== S U B R O U T I N E =======================================


sub_38CC2:
		move.b	$3E(a0),d0
		jsr	(GetSineCosine).l
		move.w	d0,d4
		lea	(BridgeBendData).l,a4
		moveq	#0,d0
		move.b	subtype(a0),d0
		lsl.w	#4,d0
		moveq	#0,d3
		move.b	$3F(a0),d3
		move.w	d3,d2
		add.w	d0,d3
		moveq	#0,d5
		lea	(loc_38DAA).l,a5
		move.b	(a5,d3.w),d5
		andi.w	#$F,d3
		lsl.w	#4,d3
		lea	(a4,d3.w),a3
		movea.l	$30(a0),a1
		lea	next_object(a1),a2
		lea	y_vel(a1),a1

loc_38D08:
		moveq	#0,d0
		move.b	(a3)+,d0
		addq.w	#1,d0
		mulu.w	d5,d0
		mulu.w	d4,d0
		swap	d0
		add.w	ros_addr(a0),d0
		move.w	d0,(a1)
		addq.w	#6,a1
		cmpa.w	a2,a1
		bne.s	loc_38D28
		movea.l	$34(a0),a1
		lea	y_vel(a1),a1

loc_38D28:
		dbf	d2,loc_38D08
		moveq	#0,d0
		move.b	subtype(a0),d0
		moveq	#0,d3
		move.b	$3F(a0),d3
		addq.b	#1,d3
		sub.b	d0,d3
		neg.b	d3
		bmi.s	locret_38D72
		move.w	d3,d2
		lsl.w	#4,d3
		lea	(a4,d3.w),a3
		adda.w	d2,a3
		subq.w	#1,d2
		bcs.s	locret_38D72

loc_38D4E:
		moveq	#0,d0
		move.b	-(a3),d0
		addq.w	#1,d0
		mulu.w	d5,d0
		mulu.w	d4,d0
		swap	d0
		add.w	ros_addr(a0),d0
		move.w	d0,(a1)
		addq.w	#6,a1
		cmpa.w	a2,a1
		bne.s	loc_38D6E
		movea.l	$34(a0),a1
		lea	y_vel(a1),a1

loc_38D6E:
		dbf	d2,loc_38D4E

locret_38D72:
		rts
; End of function sub_38CC2


; =============== S U B R O U T I N E =======================================


sub_38D74:
		move.b	$3E(a0),d0
		jsr	(GetSineCosine).l
		move.w	d0,d4
		lea	(BridgeBendData).l,a4
		moveq	#0,d0
		move.b	subtype(a0),d0
		lsl.w	#4,d0
		moveq	#0,d3
		move.b	$3F(a0),d3
		move.w	d3,d2
		add.w	d0,d3
		moveq	#0,d5
		lea	(loc_38DAA).l,a5
		move.b	(a5,d3.w),d5
		andi.w	#$F,d3
		lsl.w	#4,d3

loc_38DAA:
		lea	(a4,d3.w),a3
		move.w	ros_addr(a0),d6
		movea.l	$30(a0),a1
		lea	next_object(a1),a2
		lea	y_vel(a1),a1

loc_38DBE:
		moveq	#0,d0
		move.b	(a3)+,d0
		addq.w	#1,d0
		mulu.w	d5,d0
		mulu.w	d4,d0
		swap	d0
		add.w	d6,d0
		addq.w	#3,d6
		move.w	d0,(a1)
		addq.w	#6,a1
		cmpa.w	a2,a1
		bne.s	loc_38DDE
		movea.l	$34(a0),a1
		lea	y_vel(a1),a1

loc_38DDE:
		dbf	d2,loc_38DBE
		moveq	#0,d0
		move.b	subtype(a0),d0
		moveq	#0,d3
		move.b	$3F(a0),d3
		addq.b	#1,d3
		sub.b	d0,d3
		neg.b	d3
		bmi.s	locret_38E28
		move.w	d3,d2
		lsl.w	#4,d3
		lea	(a4,d3.w),a3
		adda.w	d2,a3
		subq.w	#1,d2
		bcs.s	locret_38E28

loc_38E04:
		moveq	#0,d0
		move.b	-(a3),d0
		addq.w	#1,d0
		mulu.w	d5,d0
		mulu.w	d4,d0
		swap	d0
		add.w	d6,d0
		addq.w	#3,d6
		move.w	d0,(a1)
		addq.w	#6,a1
		cmpa.w	a2,a1
		bne.s	loc_38E24
		movea.l	$34(a0),a1
		lea	y_vel(a1),a1

loc_38E24:
		dbf	d2,loc_38E04

locret_38E28:
		rts
; End of function sub_38D74
; ---------------------------------------------------------------------------
byte_38E2A:	dc.b    2,   4,   6,   8,   8,   6,   4,   2,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b    2,   4,   6,   8,  $A,   8,   6,   4,   2,   0,   0,   0,   0,   0,   0,   0
		dc.b    2,   4,   6,   8,  $A,  $A,   8,   6,   4,   2,   0,   0,   0,   0,   0,   0
		dc.b    2,   4,   6,   8,  $A,  $C,  $A,   8,   6,   4,   2,   0,   0,   0,   0,   0
		dc.b    2,   4,   6,   8,  $A,  $C,  $C,  $A,   8,   6,   4,   2,   0,   0,   0,   0
		dc.b    2,   4,   6,   8,  $A,  $C,  $E,  $C,  $A,   8,   6,   4,   2,   0,   0,   0
		dc.b    2,   4,   6,   8,  $A,  $C,  $E,  $E,  $C,  $A,   8,   6,   4,   2,   0,   0
		dc.b    2,   4,   6,   8,  $A,  $C,  $E, $10,  $E,  $C,  $A,   8,   6,   4,   2,   0
		dc.b    2,   4,   6,   8,  $A,  $C,  $E, $10, $10,  $E,  $C,  $A,   8,   6,   4,   2
BridgeBendData:	dc.b  $FF,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $B5, $FF,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $7E, $DB, $FF,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $61, $B5, $EC, $FF,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $4A, $93, $CD, $F3, $FF,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $3E, $7E, $B0, $DB, $F6, $FF,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $38, $6D, $9D, $C5, $E4, $F8, $FF,   0,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $31, $61, $8E, $B5, $D4, $EC, $FB, $FF,   0,   0,   0,   0,   0,   0,   0,   0
		dc.b  $2B, $56, $7E, $A2, $C1, $DB, $EE, $FB, $FF,   0,   0,   0,   0,   0,   0,   0
		dc.b  $25, $4A, $73, $93, $B0, $CD, $E1, $F3, $FC, $FF,   0,   0,   0,   0,   0,   0
		dc.b  $1F, $44, $67, $88, $A7, $BD, $D4, $E7, $F4, $FD, $FF,   0,   0,   0,   0,   0
		dc.b  $1F, $3E, $5C, $7E, $98, $B0, $C9, $DB, $EA, $F6, $FD, $FF,   0,   0,   0,   0
		dc.b  $19, $38, $56, $73, $8E, $A7, $BD, $D1, $E1, $EE, $F8, $FE, $FF,   0,   0,   0
		dc.b  $19, $38, $50, $6D, $83, $9D, $B0, $C5, $D8, $E4, $F1, $F8, $FE, $FF,   0,   0
		dc.b  $19, $31, $4A, $67, $7E, $93, $A7, $BD, $CD, $DB, $E7, $F3, $F9, $FE, $FF,   0
		dc.b  $19, $31, $4A, $61, $78, $8E, $A2, $B5, $C5, $D4, $E1, $EC, $F4, $FB, $FE, $FF

		include "Objects/Tension Bridge/Object Data/Map - Tension Bridge.asm"

byte_39006:	dc.b    2,   4,   4,   4,   4,   4,  $C,   0

byte_3900E:	dc.b    2,   4,   6,   6,   6,   6,   8,   8,   8,   8,  $A,  $A,   0,   0

byte_3901C:	dc.b    2,   4,   6,   6,   6,   6,   8,   8,   8,   8,  $A,   0

byte_39028:	dc.b    2,   4,   6,   6,   6,   6,   8,   8,   8,   8,   8,   8,   8,   8,   8,   8,   8,   8,  $E,   0

word_3903C:	dc.w $840
		dc.w $120
		dc.l byte_39006
		dc.w $1540
		dc.w $620
		dc.l byte_3900E
		dc.w $1740
		dc.w $3A0
		dc.l byte_3900E
		dc.w $1CC0
		dc.w $620
		dc.l byte_39006
		dc.w $1FC0
		dc.w $2A0
		dc.l byte_3901C
		dc.w $24C0
		dc.w $220
		dc.l byte_39028
		dc.w $26C0
		dc.w $120
		dc.l byte_39006
		dc.w $3040
		dc.w $620
		dc.l byte_3900E
; ---------------------------------------------------------------------------