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
		move.l	#Map_HyperSonicStars,mappings(a0)
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
		beq.w	loc_19486
		subq.b	#1,anim_frame_timer(a0)
		bpl.s	loc_1941C
		move.b	#1,anim_frame_timer(a0)
		addq.b	#1,mapping_frame(a0)
		cmpi.b	#3,mapping_frame(a0)
		blo.s	loc_1941C
		move.b	#0,mapping_frame(a0)
		moveq	#0,d0
		move.w	d0,$30(a0)
		move.w	d0,$34(a0)

loc_1941C:
		move.b	angle(a0),d0
		addi.b	#-$10,angle(a0)
		jsr	(GetSineCosine).l
		asl.w	#3,d0
		asl.w	#3,d1
		move.w	d0,x_vel(a0)
		move.w	d1,y_vel(a0)
		move.w	x_vel(a0),d0
		add.w	d0,$30(a0)
		move.w	y_vel(a0),d1
		add.w	d1,$34(a0)
		move.b	$30(a0),d2
		ext.w	d2
		btst	#0,(Player_1+status).w
		beq.s	loc_19458
		neg.w	d2

loc_19458:
		move.b	$34(a0),d3
		ext.w	d3
		add.w	(Player_1+x_pos).w,d2
		add.w	(Player_1+y_pos).w,d3
		move.w	d2,x_pos(a0)
		move.w	d3,y_pos(a0)
		andi.w	#drawing_mask,art_tile(a0)
		tst.b	(Player_1+art_tile).w
		bpl.s	loc_19480
		ori.w	#high_priority,art_tile(a0)

loc_19480:
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_19486:
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------
Map_HyperSonicStars:include "Objects/Player Characters/Object Data/Map - Hyper Sonic Stars.asm"
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