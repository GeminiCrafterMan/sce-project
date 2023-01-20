
; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||

; sub_15E18:
SmashObject:
BreakObjectToPieces:	; splits up one object into its current mapping frame pieces
	moveq	#0,d0
	move.b	mapping_frame(a0),d0
	add.w	d0,d0
	movea.l	mappings(a0),a3
	adda.w	(a3,d0.w),a3	; put address of appropriate frame to a3
	move.w	(a3)+,d1	; amount of pieces the frame consists of
	subq.w	#1,d1
	bset	#5,render_flags(a0)
	_move.l	address(a0),d4
	move.b	render_flags(a0),d5
	movea.l	a0,a1
	bra.s	BreakObjectToPieces_InitObject
; ===========================================================================
; loc_15E3E:
BreakObjectToPieces_Loop:
	bsr.w	SingleObjLoad2
	bne.s	loc_15E82
	addq.w	#8,a3	; next mapping piece
; loc_15E46:
BreakObjectToPieces_InitObject:
	move.b	#4,routine(a1)
	_move.l	d4,address(a1) ; load object with ID of parent object and routine 4
	move.l	a3,mappings(a1)
	move.b	d5,render_flags(a1)
	move.w	x_pos(a0),x_pos(a1)
	move.w	y_pos(a0),y_pos(a1)
	move.w	art_tile(a0),art_tile(a1)
	move.w	priority(a0),priority(a1)
	move.w	height_pixels(a0),height_pixels(a1)
	move.w	(a4)+,x_vel(a1)
	move.w	(a4)+,y_vel(a1)
	dbf	d1,BreakObjectToPieces_Loop

loc_15E82:
		sfx		sfx_WallSmash,1
; End of function BreakObjectToPieces