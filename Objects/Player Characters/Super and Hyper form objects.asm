Obj_SuperSonicKnux_Stars:
		move.l	#ArtUnc_SuperSonic_Stars>>1,d1
		move.w	#tiles_to_bytes(ArtTile_Shield),d2
		move.w	#$1A0,d3
		jsr	(Add_To_DMA_Queue).l
		move.l	#Map_SuperSonic_Stars,mappings(a0)
		move.b	#4,render_flags(a0)
		move.w	#$80,priority(a0)
		move.b	#$18,width_pixels(a0)
		move.b	#$18,height_pixels(a0)
		move.w	#ArtTile_Shield,art_tile(a0)
		btst	#7,(Player_1+art_tile).w
		beq.s	loc_1919E
		bset	#7,art_tile(a0)

loc_1919E:
		move.l	#loc_191A4,(a0)

loc_191A4:
		tst.b	(Super_Sonic_Knux_flag).w
		jeq		Delete_Current_Sprite
		btst	#Status_Invincible,(Player_1+status_secondary).w
		jeq		Delete_Current_Sprite
		tst.b	anim(a0)
		beq.s	loc_191B6
		bsr.w	sub_19236

loc_191B6:
		tst.b	$34(a0)
		beq.s	loc_19200
		subq.b	#1,anim_frame_timer(a0)
		bpl.s	loc_191E8
		move.b	#1,anim_frame_timer(a0)
		addq.b	#1,mapping_frame(a0)
		cmpi.b	#6,mapping_frame(a0)
		blo.s	loc_191E8
		move.b	#0,mapping_frame(a0)
		move.b	#0,$34(a0)
		move.b	#1,$35(a0)
		rts
; ---------------------------------------------------------------------------

loc_191E8:
		tst.b	$35(a0)
		bne.s	loc_191FA

loc_191EE:
		move.w	(Player_1+x_pos).w,x_pos(a0)
		move.w	(Player_1+y_pos).w,y_pos(a0)

loc_191FA:
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_19200:
		tst.b	(Player_1+object_control).w
		bne.s	loc_19222
		move.w	(Player_1+ground_vel).w,d0
		bpl.s	loc_1920E
		neg.w	d0

loc_1920E:
		cmpi.w	#$800,d0
		blo.s	loc_19222
		move.b	#0,mapping_frame(a0)
		move.b	#1,$34(a0)
		bra.s	loc_191EE
; ---------------------------------------------------------------------------

loc_19222:
		move.b	#0,$34(a0)
		move.b	#0,$35(a0)
		rts

; =============== S U B R O U T I N E =======================================


sub_19236:
		move.b	#0,anim(a0)
		lea	(Player_1).w,a2
		moveq	#$F,d5
		move.w	#$488,d4

loc_19246:
		jsr		Create_New_Sprite
		bne.w	locret_192BE
		move.l	#Obj_SuperSonicKnux_Stars_Timer,(a1)
		move.w	x_pos(a2),x_pos(a1)
		move.w	y_pos(a2),y_pos(a1)
		move.l	#Map_SuperSonic_Stars2,mappings(a1)
		move.b	#4,(Hyper_Sonic_flash_timer).w
		move.w	#$879C,art_tile(a1)
		move.b	#$84,render_flags(a1)
		move.w	#$380,priority(a1)
		move.b	#8,width_pixels(a1)
		move.b	#8,height_pixels(a1)
		tst.w	d4
		bmi.s	loc_192AE
		move.w	d4,d0
		jsr	(GetSineCosine).l
		move.w	d4,d2
		lsr.w	#8,d2
		asl.w	d2,d0
		asl.w	d2,d1
		move.w	d0,d2
		move.w	d1,d3
		addi.b	#$10,d4
		bcc.s	loc_192AE
		subi.w	#$80,d4
		bcc.s	loc_192AE
		move.w	#$488,d4

loc_192AE:
		move.w	d2,x_vel(a1)
		move.w	d3,y_vel(a1)
		neg.w	d2
		neg.w	d4
		dbf	d5,loc_19246

locret_192BE:
		rts
; End of function sub_19236

; ---------------------------------------------------------------------------

Obj_SuperSonicKnux_Stars_Timer:
		tst.b	render_flags(a0)
		bmi.s	loc_192CC
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_192CC:
		addq.b	#1,mapping_frame(a0)
		andi.b	#3,mapping_frame(a0)
		jsr		MoveSprite2
		jmp		Draw_Sprite
; ---------------------------------------------------------------------------
Obj_HyperSonic_Stars:
		lea	(ArtKosM_HyperSonicStars).l,a1
		move.w	#tiles_to_bytes(ArtTile_Shield),d2
		jsr	(Queue_Kos_Module).l
		lea	(a0),a1
		moveq	#0,d0
		moveq	#0,d2
		moveq	#3,d1

	.createObject:
		move.l	#Obj_HyperSonic_Stars_Init,(a1)
		move.b	d0,angle(a1)
		addi.b	#$40,d0
		addq.b	#1,d2
		move.b	d2,anim_frame_timer(a1)
		lea	next_object(a1),a1
		dbf	d1,.createObject

Obj_HyperSonic_Stars_Init:
		; Wait for art to finish loading before we display
		tst.b	(Kos_modules_left).w
		beq.s	.artDoneLoading

	.return:
		rts
; ---------------------------------------------------------------------------

	.artDoneLoading:
		subq.b	#1,anim_frame_timer(a0)
		bne.s	.return
		move.l	#Map_HyperSonic_Stars,mappings(a0)
		move.b	#4,render_flags(a0)
		move.w	#$80,priority(a0)
		move.b	#$18,width_pixels(a0)
		move.b	#$18,height_pixels(a0)
		move.w	#ArtTile_Shield,art_tile(a0)
		move.b	#6,mapping_frame(a0)
		cmpa.w	#v_Invincibility_stars,a0
		beq.s	.isParent
		move.l	#Obj_HyperSonic_Stars_Main.child,(a0)
		bra.s	Obj_HyperSonic_Stars_Main.child
; ---------------------------------------------------------------------------

	.isParent:
		move.l	#Obj_HyperSonic_Stars_Main,(a0)

Obj_HyperSonic_Stars_Main:
		tst.b	anim(a0)
		beq.s	Obj_HyperSonic_Stars_Main.child
		clr.b	anim(a0)
		move.w	(Player_1+x_pos).w,x_pos(a0)
		move.w	(Player_1+y_pos).w,y_pos(a0)
		moveq	#2,d2
		bsr.w	Obj_Lightning_Shield_Create_Spark.part2
		move.b	#8,(Negative_flash_timer).w

	.child:
		tst.b	(Super_Sonic_Knux_flag).w
		beq.w	.delete
		btst	#Status_Invincible,(Player_1+status_secondary).w
		beq.w	.delete
		addq.b	#1,mapping_frame(a0)
		cmpi.b	#6,mapping_frame(a0)
		bcs.s	.noReset
		move.b	#0,mapping_frame(a0)

	.noReset:
		move.b	angle(a0),d0
		jsr		(CalcSine).l
		asl.w	#5,d1
		move.w	d1,d3
		move.w	d1,d2
		move.b	objoff_30(a0),d0
		jsr		(CalcSine).l
		asr.w	#4,d0
		addi.w	#$40,d0 ; '@'
		move.b	(Player_1+flip_angle).w,d4
		bne.s	.flip
		move.b	(Player_1+angle).w,d4
	.flip:
		sub.b	d4,d0
		jsr		(CalcSine).l
		muls.w	d0,d2
		muls.w	d1,d3
		swap	d2
		swap	d3
		add.w	(Player_1+x_pos).w,d2
		add.w	(Player_1+y_pos).w,d3
		move.w	d2,x_pos(a0)
		move.w	d3,y_pos(a0)
		move.w	#$80,priority(a0)
		tst.b	angle(a0)
		bpl.s	.behindPlayer
		move.w	#$100,priority(a0)

	.behindPlayer:
		addq.b	#8,angle(a0)
		addq.b	#4,objoff_30(a0)
		andi.w	#drawing_mask,art_tile(a0)
		tst.b	(Player_1+art_tile).w
		bpl.s	.display
		ori.w	#high_priority,art_tile(a0)

	.display:
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

	.delete:
		jmp	(DeleteObject).l
; ---------------------------------------------------------------------------

Obj_HyperSonicKnux_Trail:
		; init
		move.w	#$100,priority(a0)
		move.b	#$18,width_pixels(a0)
		move.b	#$18,height_pixels(a0)
		move.b	#4,render_flags(a0)
		move.l	#Obj_HyperSonicKnux_Trail_Main,(a0)

Obj_HyperSonicKnux_Trail_Main:
		movea.w	parent(a0),a2
		tst.b	(Super_Sonic_Knux_flag).w	; Are we in super/hyper state?
		bne.s	.cont		; If so, branch
		btst	#Status_SpeedShoes,(Player_1+status_secondary).w
		jeq		Delete_Current_Sprite
	.cont:
		moveq	#$C,d1				; This will be subtracted from Pos_table_index, giving the object an older entry
		btst	#0,(Level_frame_counter+1).w	; Even frame? (Think of it as 'every other number' logic)
		beq.s	.evenframe			; If so, branch
		moveq	#$14,d1				; On every other frame, use a different number to subtract, giving the object an even older entry

	.evenframe:
		move.w	(Pos_table_index).w,d0
		lea	(Pos_table).w,a1
		sub.b	d1,d0
		lea	(a1,d0.w),a1
		move.w	(a1)+,x_pos(a0)			; Use previous player x_pos
		move.w	(a1)+,y_pos(a0)			; Use previous player y_pos
		move.l	mappings(a2),mappings(a0)
		move.w	art_tile(a2),art_tile(a0)
		move.b	mapping_frame(a2),mapping_frame(a0)	; Use player's current mapping_frame
		move.b	render_flags(a2),render_flags(a0)	; Use player's current render_flags
		move.w	priority(a2),priority(a0)		; Use player's current priority
		jsr		Draw_Sprite
		cmpi.b	#c_Tails,character_id(a2)
		bne.s	.notTails
		tst.l	(v_Super_stars_2).w
		bne.s	.notTails
		move.l	#Obj_HyperSonicKnux_Trail,(v_Super_stars_2).w
		move.w	#v_FollowObject_P1,(v_Super_stars_2+parent).w
	.notTails:
		rts

; ---------------------------------------------------------------------------
Map_SuperSonic_Stars:		binclude "Objects/Player Characters/Object Data/Map - Super Sonic Stars.bin"
Map_SuperSonic_Stars2:		binclude "Objects/Player Characters/Object Data/Map - Super Sonic Stars 2.bin"
Map_HyperSonic_Stars:		binclude "Objects/Player Characters/Object Data/Map - Hyper Sonic Stars.bin"