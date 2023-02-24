; ----------------------------------------------------------------------------
; Object 15 - Swinging platform from Aquatic Ruin Zone
; ----------------------------------------------------------------------------
; Sprite_FC9C:
Obj_SwingingPlatform:
	btst	#6,render_flags(a0)
	jne		Draw_Sprite
	moveq	#0,d0
	move.b	routine(a0),d0
	move.w	Obj_SwingingPlatform_Index(pc,d0.w),d1
	jmp	Obj_SwingingPlatform_Index(pc,d1.w)
; ===========================================================================
; off_FCBC: Obj_SwingingPlatform_States:
Obj_SwingingPlatform_Index:	offsetTable
		offsetTableEntry.w Obj_SwingingPlatform_Init		;  0
		offsetTableEntry.w Obj_SwingingPlatform_State2		;  2
		offsetTableEntry.w Obj_SwingingPlatform_Display	;  4
		offsetTableEntry.w Obj_SwingingPlatform_State4		;  6
		offsetTableEntry.w Obj_SwingingPlatform_State5		;  8
		offsetTableEntry.w Obj_SwingingPlatform_State6		; $A
		offsetTableEntry.w Obj_SwingingPlatform_State7		; $C
		
; ===========================================================================

swing_child = objoff_30
swing_pivot_y = objoff_38
swing_pivot_x = objoff_3A

; ===========================================================================
; loc_FCCA:
Obj_SwingingPlatform_Init:
	addq.b	#2,routine(a0)
	move.l	#Map_SwingingPlatform,mappings(a0)
	move.w	#make_art_tile(ArtTile_LevelArt,2,0),art_tile(a0)
	move.b	#4,render_flags(a0)
	move.w	#$180,priority(a0)
	move.b	#$20,width_pixels(a0)
	move.b	#$10,height_pixels(a0)
	move.w	y_pos(a0),swing_pivot_y(a0)
	move.w	x_pos(a0),swing_pivot_x(a0)
	moveq	#0,d1
	move.b	subtype(a0),d1
	bpl.s	.posSubtype
	addq.b	#4,routine(a0)
.posSubtype:
	move.b	d1,d4
	andi.b	#$70,d4
	andi.w	#$F,d1
	move.w	x_pos(a0),d2
	move.w	y_pos(a0),d3
	jsr		SingleObjLoad2
	bne.w	.loadFail
	move.l	id(a0),id(a1) ; load Obj_SwingingPlatform
	move.l	mappings(a0),mappings(a1)
	move.w	art_tile(a0),art_tile(a1)
	move.b	#4,render_flags(a1)
	cmpi.b	#$20,d4
	bne.s	.initSubspr
	move.b	#4,routine(a1)
	move.w	#$200,priority(a1)
	move.b	#$10,width_pixels(a1)
	move.b	#$50,height_pixels(a1)
	bset	#4,render_flags(a1)
	move.b	#3,mapping_frame(a1)
	move.w	d2,x_pos(a1)
	addi.w	#$40,d3
	move.w	d3,y_pos(a1)
	addi.w	#$48,d3
	move.w	d3,y_pos(a0)
	bra.s	.skipSubspr
; ===========================================================================
.initSubspr:
	bset	#6,render_flags(a1)
	move.b	#$48,mainspr_width(a1)
	move.w	d1,mainspr_childsprites(a1)
	subq.w	#1,d1
	lea	sub2_x_pos(a1),a2

.initLoop:
	move.w	d2,(a2)+	; sub?_x_pos
	move.w	d3,(a2)+	; sub?_y_pos
	move.w	#1,(a2)+	; sub2_mapframe
	addi.w	#$10,d3
	dbf	d1,.initLoop

	move.b	#2,sub2_mapframe(a1)
	move.w	sub6_x_pos(a1),x_pos(a1)
	move.w	sub6_y_pos(a1),y_pos(a1)
	move.w	d2,sub6_x_pos(a1)
	move.w	d3,sub6_y_pos(a1)
	move.b	#1,mainspr_mapframe(a1)
	addi.w	#8,d3
	move.w	d3,y_pos(a0)
	move.b	#$50,mainspr_height(a1)
	bset	#4,render_flags(a1)
.skipSubspr:
	move.l	a1,swing_child(a0)
.loadFail:
	move.w	#$8000,angle(a0)
	move.w	#0,objoff_3E(a0)
	move.b	subtype(a0),d1
	andi.w	#$70,d1
	move.b	d1,subtype(a0)
	cmpi.b	#$60,d1
	bne.s	Obj_SwingingPlatform_State2
	move.l	#Map_Saw,mappings(a0)
	move.w	#$43AA,art_tile(a0)
	clr.b	mapping_frame(a0)
	move.w	#$100,priority(a0)
	move.b	#$81,collision_flags(a0)

; loc_FE50:
Obj_SwingingPlatform_State2:
	move.w	x_pos(a0),-(sp)
	bsr.w	sub_FE70
	moveq	#0,d1
	move.b	width_pixels(a0),d1
	moveq	#0,d3
	move.b	height_pixels(a0),d3
	addq.b	#1,d3
	move.w	(sp)+,d4
	move.b	subtype(a0),d1
	cmpi.b	#$60,subtype(a0)
	bge.s	.skipSolid
	jsr		SolidObjectTop ; PlatformObject2
.skipSolid:
	bra.w	loc_1000C

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||


sub_FE70:

	moveq	#0,d0
	moveq	#0,d1
	move.b	(Oscillating_Data+$18).w,d0
	move.b	subtype(a0),d1
	beq.s	.movePlatform
	cmpi.b	#$10,d1
	bne.s	.notBounceLeft
	cmpi.b	#$3F,d0
	beq.s	.bounce
	bhs.s	.movePlatform
	moveq	#$40,d0
	bra.s	.movePlatform
; ===========================================================================

.bounce:
	tst.b	render_flags(a0)
	bpl.s	.notOnscreen
	sfx		sfx_Thump

.notOnscreen:	
	moveq	#$40,d0
	bra.s	.movePlatform
; ===========================================================================
.notBounceLeft:
	cmpi.b	#$20,d1
	beq.w	.ret
	cmpi.b	#$30,d1
	bne.s	.notBounceRight
	cmpi.b	#$41,d0
	beq.s	.bounce
	blo.s	.movePlatform
	moveq	#$40,d0
	bra.s	.movePlatform
; ===========================================================================
.notBounceRight:
	cmpi.b	#$40,d1
	bne.s	.movePlatform
	bsr.w	loc_FF6E

.movePlatform:
	move.b	objoff_2E(a0),d1
	cmp.b	d0,d1
	beq.w	.ret
	move.b	d0,objoff_2E(a0)
	move.w	#$80,d1
	btst	#0,status(a0)
	beq.s	.noflipX
	neg.w	d0
	add.w	d1,d0
.noflipX:
	jsr		CalcSine
	move.w	swing_pivot_y(a0),d2
	move.w	swing_pivot_x(a0),d3
	moveq	#0,d6
	movea.l	swing_child(a0),a1
	move.w	mainspr_childsprites(a1),d6
	subq.w	#1,d6
	bcs.s	.ret
	swap	d0
	swap	d1
	asr.l	#4,d0
	asr.l	#4,d1
	moveq	#0,d4
	moveq	#0,d5
	lea	sub2_x_pos(a1),a2

.subsprloop:
	movem.l	d4-d5,-(sp)
	swap	d4
	swap	d5
	add.w	d2,d4
	add.w	d3,d5
	move.w	d5,(a2)+	; sub?_x_pos
	move.w	d4,(a2)+	; sub?_y_pos
	movem.l	(sp)+,d4-d5
	add.l	d0,d4
	add.l	d1,d5
	addq.w	#next_subspr-4,a2
	dbf	d6, .subsprloop

	movem.l	d4-d5,-(sp)
	swap	d4
	swap	d5
	add.w	d2,d4
	add.w	d3,d5
	move.w	sub6_x_pos(a1),d2
	move.w	sub6_y_pos(a1),d3
	move.w	d5,sub6_x_pos(a1)
	move.w	d4,sub6_y_pos(a1)
	move.w	d2,x_pos(a1)
	move.w	d3,y_pos(a1)
	movem.l	(sp)+,d4-d5
	asr.l	#1,d0
	asr.l	#1,d1
	add.l	d0,d4
	add.l	d1,d5
	swap	d4
	swap	d5
	add.w	swing_pivot_y(a0),d4
	add.w	swing_pivot_x(a0),d5
	move.w	d4,y_pos(a0)
	move.w	d5,x_pos(a0)
.ret:
	rts
; End of function sub_FE70

; ===========================================================================

loc_FF6E:
	tst.w	objoff_36(a0)
	beq.s	+
	subq.w	#1,objoff_36(a0)
	bra.w	loc_10006
; ===========================================================================
+
	tst.b	objoff_34(a0)
	bne.s	+
	move.w	(Player_1+x_pos).w,d0
	sub.w	swing_pivot_x(a0),d0
	addi.w	#$20,d0
	cmpi.w	#$40,d0
	bhs.s	loc_10006
	tst.w	(Debug_placement_mode).w
	bne.w	loc_10006
	move.b	#1,objoff_34(a0)
+
	tst.b	objoff_3D(a0)
	beq.s	+
	move.w	objoff_3E(a0),d0
	addi.w	#8,d0
	move.w	d0,objoff_3E(a0)
	add.w	d0,angle(a0)
	cmpi.w	#$200,d0
	bne.s	loc_10006
	move.w	#0,objoff_3E(a0)
	move.w	#$8000,angle(a0)
	move.b	#0,objoff_3D(a0)
	move.w	#$3C,objoff_36(a0)
	bra.s	loc_10006
; ===========================================================================
+
	move.w	objoff_3E(a0),d0
	subi.w	#8,d0
	move.w	d0,objoff_3E(a0)
	add.w	d0,angle(a0)
	cmpi.w	#$FE00,d0
	bne.s	loc_10006
	move.w	#0,objoff_3E(a0)
	move.w	#$4000,angle(a0)
	move.b	#1,objoff_3D(a0)
; loc_10000:
	move.w	#$3C,objoff_36(a0)

loc_10006:
	move.b	angle(a0),d0
	rts
; ===========================================================================

loc_1000C:
	out_of_xrange.s .offscreen, swing_pivot_x(a0)
	cmpi.b	#$60,subtype(a0)
	blt.s	.skipPLC
	move.w	(Level_frame_counter).w,d0
	andi.w	#3,d0
	bne.s	.skipPLC
	bchg	#0,mapping_frame(a0)
	lea		PLCPtr_Saw(pc),a2
	jsr		(Perform_DPLC).w
.skipPLC:
	jmp		DisplaySprite
; ===========================================================================
.offscreen:
	move.w	respawn_addr(a0),d0
	beq.s	.delete
	movea.w	d0,a2
	bclr	#7,(a2)
.delete:
	movea.l	swing_child(a0),a1
	jsr		DeleteObject2
	jmp		DeleteObject
; ===========================================================================

Obj_SwingingPlatform_Display: ;;
	jmp		DisplaySprite
; ===========================================================================

; loc_1003E:
Obj_SwingingPlatform_State4:
	move.w	x_pos(a0),-(sp)
	bsr.w	sub_FE70
	moveq	#0,d1
	move.b	width_pixels(a0),d1
	moveq	#0,d3
	move.b	height_pixels(a0),d3
	addq.b	#1,d3
	move.w	(sp)+,d4
	jsr		SolidObjectTop ; PlatformObject2
	move.b	status(a0),d0
	andi.b	#standing_mask,d0
	beq.w	loc_1000C
	tst.b	(Oscillating_Data+$18).w
	bne.w	loc_1000C
	jsr		SingleObjLoad2
	bne.s	loc_100E4
	moveq	#0,d0

	move.w	#bytesToLcnt(object_size),d1
-	move.l	(a0,d0.w),(a1,d0.w)
	addq.w	#4,d0
	dbf	d1,-
    if object_size&3
	move.w	(a0,d0.w),(a1,d0.w)
    endif

	move.b	#$A,routine(a1)
	move.w	#$200,x_vel(a1)
	btst	#0,status(a0)
	beq.s	+
	neg.w	x_vel(a1)
+
	bset	#1,status(a1)		; [REDACTED]: optimized the following code.
	cmp.w	Player_1+interact.w,a0
	bne.s	+
	move.w	a1,Player_1+interact.w
+
	cmp.w	Player_2+interact.w,a0
	bne.s	loc_100E4
	move.w	a1,Player_2+interact.w

loc_100E4:
	move.b	#3,mapping_frame(a0)
	addq.b	#2,routine(a0)
	andi.b	#$E7,status(a0)
	bra.w	loc_1000C
; ===========================================================================
; loc_100F8:
Obj_SwingingPlatform_State5:
	bsr.w	sub_FE70
	bra.w	loc_1000C

; ===========================================================================
; loc_10100:
Obj_SwingingPlatform_State6:
	move.w	x_pos(a0),-(sp)
	btst	#1,status(a0)
	beq.s	+
	jsr	SpeedToPos
	addi.w	#$18,y_vel(a0)
	cmpi.w	#$720,y_pos(a0)
	blo.s	++
	move.w	#$720,y_pos(a0)
	bclr	#1,status(a0)
	move.w	#0,x_vel(a0)
	move.w	#0,y_vel(a0)
	move.w	y_pos(a0),swing_pivot_y(a0)
	bra.s	++
; ===========================================================================
+
	moveq	#0,d0
	move.b	(Oscillating_Data+$14).w,d0
	lsr.w	#1,d0
	add.w	swing_pivot_y(a0),d0
	move.w	d0,y_pos(a0)
+
	moveq	#0,d1
	move.b	width_pixels(a0),d1
	moveq	#0,d3
	move.b	height_pixels(a0),d3
	addq.b	#1,d3
	move.w	(sp)+,d4
	jsr		SolidObjectTop ; PlatformObject2
	jmp		MarkObjGone

; ===========================================================================
; loc_10166:
Obj_SwingingPlatform_State7:
	move.w	x_pos(a0),-(sp)
	jsr	SpeedToPos
	btst	#1,status(a0)
	beq.s	+
	addi.w	#$18,y_vel(a0)
	move.w	(Water_Level_2).w,d0
	cmp.w	y_pos(a0),d0
	bhi.s	++
	move.w	d0,y_pos(a0)
	move.w	d0,swing_pivot_y(a0)
	bclr	#1,status(a0)
	move.w	#$100,x_vel(a0)
	move.w	#0,y_vel(a0)
	bra.s	++
; ===========================================================================
+
	moveq	#0,d0
	move.b	(Oscillating_Data+$14).w,d0
	lsr.w	#1,d0
	add.w	swing_pivot_y(a0),d0
	move.w	d0,y_pos(a0)
	tst.w	x_vel(a0)
	beq.s	+
	moveq	#0,d3
	move.b	width_pixels(a0),d3
	jsr		ObjCheckRightWallDist
	tst.w	d1
	bpl.s	+
	add.w	d1,x_pos(a0)
	move.w	#0,x_vel(a0)
+
	moveq	#0,d1
	move.b	width_pixels(a0),d1
	moveq	#0,d3
	move.b	height_pixels(a0),d3
	addq.b	#1,d3
	move.w	(sp)+,d4
	jsr		SolidObjectTop ; PlatformObject2
	jmp		MarkObjGone

PLCPtr_Saw:
		dc.l ArtUnc_Saw>>1, PLC_Saw

Map_SwingingPlatform:		binclude	"Objects/Swinging Platform/Object Data/Map - Swinging Platform.bin"
Map_Saw:		binclude	"Objects/Swinging Platform/Object Data/Map - Saw.bin"
PLC_Saw:		binclude	"Objects/Swinging Platform/Object Data/PLC - Saw.bin"