Obj_WoodPointer:	; TTPZ version of Star Pointer
		jsr	(Obj_WaitOffscreen).l
		lea	ObjDat3_8BF8E(pc),a1
		jsr	SetUp_ObjAttributes
		move.l	#loc_8BE74,(a0)
		bclr	#1,render_flags(a0)
		beq.s	loc_8BE50
		bset	#7,art_tile(a0)

loc_8BE50:
		moveq	#0,d0
		move.b	subtype(a0),d0
		andi.w	#6,d0
		move.w	word_8BE6C(pc,d0.w),d4
		jsr	(Set_VelocityXTrackSonic).l
		lea	ChildObjDat_8BFA0(pc),a2
		jmp	CreateChild3_NormalRepeated
; ---------------------------------------------------------------------------
word_8BE6C:	dc.w  $FFC0, $FFA0, $FF80, $FF00
; ---------------------------------------------------------------------------

loc_8BE74:
		jsr	(MoveSprite2).l
		jsr	Find_SonicTails
		cmpi.w	#$80,d2
		bhs.s	loc_8BE92
		btst	#0,render_flags(a0)
		beq.s	loc_8BE8E
		subq.w	#2,d0

loc_8BE8E:
		tst.w	d0
		beq.s	loc_8BE96

loc_8BE92:
		jmp	Sprite_CheckDeleteTouch
; ---------------------------------------------------------------------------

loc_8BE96:
		move.l	#loc_8BEA6,(a0)
		bset	#1,$38(a0)
		jmp	Sprite_CheckDeleteTouch
; ---------------------------------------------------------------------------

loc_8BEA6:
		jsr	(MoveSprite2).l
		jmp	Sprite_CheckDeleteTouch
; ---------------------------------------------------------------------------

loc_8BEB0:
		lea	word_8BF9A(pc),a1
		jsr	SetUp_ObjAttributes3
		bset	#3,shield_reaction(a0)	; Destroyed by all shields... figure out how to make this a Fire shield thing
		move.b	#8,x_radius(a0)
		move.l	#loc_8BEE6,(a0)
		moveq	#0,d0
		move.b	subtype(a0),d0
		lsr.b	#1,d0
		move.b	byte_8BEE2(pc,d0.w),$3C(a0)
		move.l	#loc_8BF64,jump(a0)
		rts
; ---------------------------------------------------------------------------
byte_8BEE2:	dc.b 0
		dc.b $40
		dc.b $80
		dc.b $C0
; ---------------------------------------------------------------------------

loc_8BEE6:
		btst	#0,(V_int_run_count+3).w
		bne.s	loc_8BF3E
		movea.w	$46(a0),a1
		btst	#0,render_flags(a1)
		beq.s	loc_8BF02
		addq.b	#1,$3C(a0)
		bra.w	loc_8BF06
; ---------------------------------------------------------------------------

loc_8BF02:
		subq.b	#1,$3C(a0)

loc_8BF06:
		bne.s	loc_8BF3E
		btst	#1,$38(a1)
		beq.s	loc_8BF3E
		move.l	#loc_8BF4C,(a0)
		move.w	$18(a1),d0
		asl.w	#1,d0
		move.l	#ObjHitWall_DoRoutine,$30(a0)
		move.w	#8,$44(a0)
		move.w	d0,$18(a0)
		bpl.s	loc_8BF3E
		move.l	#ObjHitWall2_DoRoutine,$30(a0)
		move.w	#-8,$44(a0)

loc_8BF3E:
		bsr.w	sub_8BF80
		moveq	#4,d2
		jsr	MoveSprite_CircularSimple
		jmp	Child_DrawTouch_Sprite
; ---------------------------------------------------------------------------

loc_8BF4C:
		jsr	(MoveSprite2).l
		movea.l	$30(a0),a1
		move.w	$44(a0),d3
		jsr	(a1)
		bsr.w	sub_8BF80
		jmp	Sprite_CheckDeleteTouchXY
; ---------------------------------------------------------------------------

loc_8BF64:
		move.l	#loc_8BF74,(a0)
		move.l	#Go_Delete_Sprite,jump(a0)
		rts
; ---------------------------------------------------------------------------

loc_8BF74:
		lea	byte_8BFA8(pc),a1
		jsr	Animate_RawNoSST
		jmp	Sprite_CheckDeleteTouchXY

; =============== S U B R O U T I N E =======================================


sub_8BF80:
		tst.b	$28(a0)
		bne.s	locret_8BF8C
		movea.l	jump(a0),a1
		jsr	(a1)

locret_8BF8C:
		rts
; End of function sub_8BF80

; ---------------------------------------------------------------------------
ObjDat3_8BF8E:
		dc.l Map_WoodPointer
		dc.w make_art_tile(ArtTile_BuzzBomber,0,0)	; VRAM location
		dc.w $280
		dc.b 8
		dc.b 8
		dc.b 0
		dc.b $B
word_8BF9A:
		dc.w $280
		dc.b 8
		dc.b 8
		dc.b 1
		dc.b $8B
ChildObjDat_8BFA0:
		dc.w 3
		dc.l loc_8BEB0
		dc.w 0
byte_8BFA8:	dc.b    3,   1,   2,   3, $F4,   0

Map_WoodPointer:	binclude "Objects/Wood Pointer/Object Data/Map - Wood Pointer.bin"