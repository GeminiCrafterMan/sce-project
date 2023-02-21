FloatingPlatformArt:
	rept 4	; GHZ
		dc.l Map_FloatingPlatform_GHZ
		dc.w make_art_tile(ArtTile_LevelArt,2,0), 0
	endr
	rept 4	; SSLZ
		dc.l Map_FloatingPlatform_SSLZ
		dc.w make_art_tile(ArtTile_LevelArt,2,0), 0
	endr
	rept 4	; WZ
		dc.l Map_FloatingPlatform
		dc.w make_art_tile(ArtTile_LevelArt,3,0), 0
	endr
	rept 4	; DEZ
		dc.l Map_FloatingPlatform
		dc.w make_art_tile(ArtTile_LevelArt,3,0), 0
	endr
	rept 4	; TTZ
		dc.l Map_FloatingPlatform
		dc.w make_art_tile(ArtTile_LevelArt,3,0), 0
	endr
		zonewarning FloatingPlatformArt,(4*8)	; 6 bytes per act + 2 filler bytes, 4 acts per zone
; ---------------------------------------------------------------------------
FloatingPlatformSizes:
		dc.b 32, 8, 0
		dc.b 0, 24, $C
		dc.b 0, 0, $20
		dc.b 20, 0, 0
; ---------------------------------------------------------------------------
Obj_FloatingPlatform:
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#3,d0
		lea	FloatingPlatformArt(pc),a2
		lea		(a2,d0.w),a2
		move.l	(a2)+,mappings(a0)
		move.w	(a2)+,art_tile(a0)
		move.b	#4,render_flags(a0)
		move.w	#$180,priority(a0)
		moveq	#0,d0
		move.b	subtype(a0),d0
		lsr.w	#2,d0
		andi.w	#$1C,d0
		lea	FloatingPlatformSizes(pc,d0.w),a2
		move.b	(a2)+,width_pixels(a0)
		move.b	(a2)+,height_pixels(a0)
		move.b	(a2)+,mapping_frame(a0)
		move.w	x_pos(a0),$30(a0)
		move.w	x_pos(a0),$32(a0)
		move.w	y_pos(a0),$34(a0)
		move.b	status(a0),$2E(a0)
		move.w	#$280,$42(a0)
		move.w	x_pos(a0),$44(a0)
		moveq	#0,d0
		move.b	subtype(a0),d0
		andi.w	#$F,d0
		subq.w	#8,d0
		bcs.s	loc_255E0
		cmpi.w	#4,d0
		bhs.s	loc_255D4
		lsl.w	#2,d0
		lea	(Oscillating_variables+$2C).w,a2
		lea	(a2,d0.w),a2
		tst.w	(a2)
		bpl.s	loc_255E0
		bchg	#0,$2E(a0)
		bra.s	loc_255E0
; ---------------------------------------------------------------------------

loc_255D4:
		move.w	#$380,$42(a0)
		addi.w	#$100,$44(a0)

loc_255E0:
		move.b	subtype(a0),d0
		andi.b	#$F,d0
		add.b	d0,d0
		move.b	d0,subtype(a0)
		move.l	#loc_255F4,(a0)

loc_255F4:
		move.w	x_pos(a0),-(sp)
		moveq	#0,d0
		move.b	subtype(a0),d0
		move.w	FloatingPlatformIndex(pc,d0.w),d1
		jsr	FloatingPlatformIndex(pc,d1.w)
		move.w	(sp)+,d4
		tst.b	render_flags(a0)
		bpl.s	loc_25628
		moveq	#0,d1
		move.b	width_pixels(a0),d1
		moveq	#0,d3
		move.b	height_pixels(a0),d3
		addq.w	#1,d3
		jsr	(SolidObjectTop).l

loc_25628:
		move.w	$44(a0),d0
		andi.w	#-$80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmp.w	$42(a0),d0
		bhi.w	loc_25642
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_25642:
		move.w	respawn_addr(a0),d0
		beq.s	loc_2564E
		movea.w	d0,a2
		bclr	#7,(a2)

loc_2564E:
		jmp	(Delete_Current_Sprite).l

FloatingPlatformIndex:	; Movement
		dc.w Platform_Stationary-FloatingPlatformIndex
		dc.w Platform_Horizontal64-FloatingPlatformIndex
		dc.w Platform_Horizontal128-FloatingPlatformIndex
		dc.w Platform_Vertical64-FloatingPlatformIndex
		dc.w Platform_Vertical128-FloatingPlatformIndex
		dc.w Platform_DiagonalUp-FloatingPlatformIndex
		dc.w Platform_DiagonalDown-FloatingPlatformIndex
		dc.w Platform_Rising-FloatingPlatformIndex
		dc.w Platform_Square32-FloatingPlatformIndex
		dc.w Platform_Square96-FloatingPlatformIndex
		dc.w Platform_Square160-FloatingPlatformIndex
		dc.w Platform_Square224-FloatingPlatformIndex
		dc.w Platform_Horizontal256-FloatingPlatformIndex
		dc.w Platform_FallingDelayed-FloatingPlatformIndex
		dc.w Platform_Falling-FloatingPlatformIndex
; ---------------------------------------------------------------------------

Platform_Stationary:
		move.b	status(a0),d0
		andi.b	#$18,d0
		bne.s	loc_24FA6
		tst.b	$3A(a0)
		beq.s	loc_24FB2
		subq.b	#4,$3A(a0)
		bra.s	loc_24FB2
; ---------------------------------------------------------------------------

loc_24FA6:
		cmpi.b	#$40,$3A(a0)
		beq.s	loc_24FB2
		addq.b	#4,$3A(a0)

loc_24FB2:
		move.b	$3A(a0),d0
		jsr	(GetSineCosine).l
		asr.w	#6,d0
		add.w	$34(a0),d0
		move.w	d0,y_pos(a0)
		rts
; ---------------------------------------------------------------------------

Platform_Horizontal64:
		move.w	#$40,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$0A).w,d0
		bra.s	sub_24FDE
; ---------------------------------------------------------------------------

Platform_Horizontal128:
		move.w	#$80,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$1E).w,d0

; =============== S U B R O U T I N E =======================================


sub_24FDE:
		btst	#0,status(a0)
		beq.s	loc_24FEA
		neg.w	d0
		add.w	d1,d0

loc_24FEA:
		move.w	$30(a0),d1
		add.w	d0,d1
		move.w	d1,x_pos(a0)
		rts
; End of function sub_24FDE

; ---------------------------------------------------------------------------

Platform_Vertical64:
		move.w	#$40,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$0A).w,d0
		bra.s	loc_2500C
; ---------------------------------------------------------------------------

Platform_Vertical128:
		move.w	#$80,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$1E).w,d0

loc_2500C:
		btst	#0,status(a0)
		beq.s	loc_25018
		neg.w	d0
		add.w	d1,d0

loc_25018:
		move.w	$34(a0),d1
		sub.w	d0,d1
		move.w	d1,y_pos(a0)
		rts
; ---------------------------------------------------------------------------

Platform_DiagonalUp:
		move.w	#$80,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$1E).w,d0
		bsr.s	sub_24FDE
		move.w	#$40,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$1E).w,d0
		lsr.b	#1,d0
		bra.s	loc_2500C
; ---------------------------------------------------------------------------

Platform_DiagonalDown:
		move.w	#$80,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$1E).w,d0
		neg.w	d0
		add.w	d1,d0
		bsr.s	sub_24FDE
		move.w	#$40,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$1E).w,d0
		lsr.b	#1,d0
		bra.s	loc_2500C
; ---------------------------------------------------------------------------

Platform_DiagonalLift:
		move.b	status(a0),d0
		andi.b	#$18,d0
		bne.s	loc_2507C
		move.w	$38(a0),d2
		move.w	$36(a0),d1
		beq.s	locret_250AA
		subq.w	#4,d1
		bcc.s	loc_25076
		moveq	#0,d1

loc_25076:
		move.w	d1,$36(a0)
		bra.s	loc_25090
; ---------------------------------------------------------------------------

loc_2507C:
		move.w	$38(a0),d2
		move.w	$36(a0),d1
		addq.w	#2,d1
		cmp.w	d2,d1
		blo.s	loc_2508C
		move.w	d2,d1

loc_2508C:
		move.w	d1,$36(a0)

loc_25090:
		move.w	$32(a0),d0
		sub.w	d1,d0
		move.w	d0,x_pos(a0)
		move.w	d0,$30(a0)
		lsr.w	#1,d1
		move.w	$34(a0),d0
		sub.w	d1,d0
		move.w	d0,y_pos(a0)

locret_250AA:
		rts
; ---------------------------------------------------------------------------

Platform_Horizontal256:
		move.w	#$7F,d2
		tst.b	$3C(a0)
		bne.s	loc_250D2
		move.w	$40(a0),d1
		addq.w	#4,d1
		move.w	d1,$40(a0)
		add.w	d1,$36(a0)
		cmp.b	$36(a0),d2
		bhi.s	loc_250EC
		move.b	#1,$3C(a0)
		bra.s	loc_250EC
; ---------------------------------------------------------------------------

loc_250D2:
		move.w	$40(a0),d1
		subq.w	#4,d1
		move.w	d1,$40(a0)
		add.w	d1,$36(a0)
		cmp.b	$36(a0),d2
		bls.s	loc_250EC
		move.b	#0,$3C(a0)

loc_250EC:
		moveq	#0,d0
		move.b	$36(a0),d0
		btst	#0,status(a0)
		beq.s	loc_250FE
		neg.w	d0
		add.w	d2,d0

loc_250FE:
		add.w	$30(a0),d0
		move.w	d0,x_pos(a0)
		rts
; ---------------------------------------------------------------------------

Platform_FallingDelayed:
		tst.w	$3A(a0)
		bne.s	loc_25120
		move.b	status(a0),d0
		andi.b	#$18,d0
		beq.s	locret_2511E
		move.w	#$1E,$3A(a0)

locret_2511E:
		rts
; ---------------------------------------------------------------------------

loc_25120:
		subq.w	#1,$3A(a0)
		bne.s	locret_2511E
		move.w	#$20,$3A(a0)
		addq.b	#2,subtype(a0)
		rts
; ---------------------------------------------------------------------------

Platform_Falling:
		tst.w	$3A(a0)
		beq.s	loc_25160
		subq.w	#1,$3A(a0)
		bne.s	loc_25160
		bclr	#3,status(a0)
		beq.s	loc_2514C
		lea	(Player_1).w,a1
		bsr.s	sub_25194

loc_2514C:
		bclr	#4,status(a0)
		beq.s	loc_2515A
		lea	(Player_2).w,a1
		bsr.s	sub_25194

loc_2515A:
		move.l	#Obj_FallingPlatformIntangible,(a0)

loc_25160:
		move.l	y_pos(a0),d3
		move.w	$1A(a0),d0
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,d3
		move.l	d3,y_pos(a0)
		addi.w	#$38,$1A(a0)
		move.w	(Camera_max_Y_pos).w,d0
		addi.w	#$120,d0
		cmp.w	y_pos(a0),d0
		bhs.s	locret_25192
		move.w	#$7F00,x_pos(a0)
		move.w	#$7F00,$44(a0)

locret_25192:
		rts

; =============== S U B R O U T I N E =======================================


sub_25194:
		bset	#1,status(a1)
		bclr	#3,status(a1)
		move.b	#2,5(a1)
		move.w	$1A(a0),$1A(a1)
		rts
; End of function sub_25194

; ---------------------------------------------------------------------------

Obj_FallingPlatformIntangible:
		move.l	y_pos(a0),d3
		move.w	$1A(a0),d0
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,d3
		move.l	d3,y_pos(a0)
		addi.w	#$38,$1A(a0)
		move.w	(Camera_max_Y_pos).w,d0
		addi.w	#$120,d0
		cmp.w	y_pos(a0),d0
		bhs.s	loc_251E0
		move.w	#$7F00,x_pos(a0)
		move.w	#$7F00,$44(a0)

loc_251E0:
loc_24F1C:
		move.w	$44(a0),d0
		andi.w	#$FF80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmp.w	$42(a0),d0
		bhi.w	loc_24F36
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_24F36:
		tst.b	$3D(a0)
		beq.s	loc_24F46
		movea.w	$3E(a0),a1
		jsr	(Delete_Referenced_Sprite).l

loc_24F46:
		move.w	respawn_addr(a0),d0
		beq.s	loc_24F52
		movea.w	d0,a2
		bclr	#7,(a2)

loc_24F52:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

Platform_Rising:
		tst.b	$3C(a0)
		bne.s	loc_25202
		move.b	status(a0),d0
		andi.b	#$18,d0
		beq.s	locret_25200
		move.b	#1,$3C(a0)
		move.b	#$C,$1E(a0)

locret_25200:
		rts
; ---------------------------------------------------------------------------

loc_25202:
		jsr	(MoveSprite2).l
		moveq	#8,d1
		move.w	$34(a0),d0
		subi.w	#$80,d0
		cmp.w	y_pos(a0),d0
		bhs.s	loc_2521E
		neg.w	d1
		add.w	d1,$1A(a0)

loc_2521E:
		jsr	(ObjCheckCeilingDist).l
		tst.w	d1
		bpl.s	loc_25236
		sub.w	d1,y_pos(a0)
		clr.b	$3C(a0)
		clr.w	$1A(a0)
		rts
; ---------------------------------------------------------------------------

loc_25236:
		btst	#3,status(a0)
		beq.s	loc_25256
		move.l	a0,-(sp)
		lea	(Player_1).w,a0
		jsr	(sub_F846).l
		tst.w	d1
		bpl.s	loc_25254
		jsr	(Kill_Character).l

loc_25254:
		movea.l	(sp)+,a0

loc_25256:
		btst	#4,status(a0)
		beq.s	locret_25276
		move.l	a0,-(sp)
		lea	(Player_2).w,a0
		jsr	(sub_F846).l
		tst.w	d1
		bpl.s	loc_25274
		jsr	(Kill_Character).l

loc_25274:
		movea.l	(sp)+,a0

locret_25276:
		rts
; ---------------------------------------------------------------------------

Platform_Square32:
		move.w	#$10,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$2A).w,d0
		lsr.w	#1,d0
		move.w	(Oscillating_variables+$2C).w,d3
		bra.s	loc_252B8
; ---------------------------------------------------------------------------

Platform_Square96:
		move.w	#$30,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$2E).w,d0
		move.w	(Oscillating_variables+$30).w,d3
		bra.s	loc_252B8
; ---------------------------------------------------------------------------

Platform_Square160:
		move.w	#$50,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$32).w,d0
		move.w	(Oscillating_variables+$34).w,d3
		bra.s	loc_252B8
; ---------------------------------------------------------------------------

Platform_Square224:
		move.w	#$70,d1
		moveq	#0,d0
		move.b	(Oscillating_variables+$36).w,d0
		move.w	(Oscillating_variables+$38).w,d3

loc_252B8:
		tst.w	d3
		bne.s	loc_252C6
		addq.b	#1,$2E(a0)
		andi.b	#3,$2E(a0)

loc_252C6:
		move.b	$2E(a0),d2
		andi.b	#3,d2
		bne.s	loc_252E6
		sub.w	d1,d0
		add.w	$30(a0),d0
		move.w	d0,x_pos(a0)
		neg.w	d1
		add.w	$34(a0),d1
		move.w	d1,y_pos(a0)
		rts
; ---------------------------------------------------------------------------

loc_252E6:
		subq.b	#1,d2
		bne.s	loc_25304
		subq.w	#1,d1
		sub.w	d1,d0
		neg.w	d0
		add.w	$34(a0),d0
		move.w	d0,y_pos(a0)
		addq.w	#1,d1
		add.w	$30(a0),d1
		move.w	d1,x_pos(a0)
		rts
; ---------------------------------------------------------------------------

loc_25304:
		subq.b	#1,d2
		bne.s	loc_25322
		subq.w	#1,d1
		sub.w	d1,d0
		neg.w	d0
		add.w	$30(a0),d0
		move.w	d0,x_pos(a0)
		addq.w	#1,d1
		add.w	$34(a0),d1
		move.w	d1,y_pos(a0)
		rts
; ---------------------------------------------------------------------------

loc_25322:
		sub.w	d1,d0
		add.w	$34(a0),d0
		move.w	d0,y_pos(a0)
		neg.w	d1
		add.w	$30(a0),d1
		move.w	d1,x_pos(a0)
		rts

; ---------------------------------------------------------------------------
; Mappings - Floating Platform
; ---------------------------------------------------------------------------
Map_FloatingPlatform:			binclude	"Objects/Floating Platform/Object Data/Map - Floating Platform.bin"
Map_FloatingPlatform_GHZ:		binclude	"Objects/Floating Platform/Object Data/Map - Floating Platform (GHZ).bin"
Map_FloatingPlatform_SSLZ:		binclude	"Objects/Floating Platform/Object Data/Map - Floating Platform (SSLZ).bin"