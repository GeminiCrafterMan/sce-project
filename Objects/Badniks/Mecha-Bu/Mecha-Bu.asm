Obj_MechaBu:
	.init:
		move.l	#Map_MechaBu,mappings(a0)
		move.w	#make_art_tile(ArtTile_Crabmeat,0,0),art_tile(a0)
		ori.b	#4,render_flags(a0)
		move.w	#$200,priority(a0)
		move.b	#4,mapping_frame(a0)	; so the saw can use bchg
		move.w	#bytes_to_word(4*4,4*6),y_radius(a0)
		move.w	#bytes_to_word(8*4,8*6),height_pixels(a0)
		move.b	#$C,obColType(a0)
		move.l	#.main,address(a0)
		lea	ChildObjDat_MechaBuPartTwo(pc),a2
		jsr	(CreateChild1_Normal).w
	.main:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	.index(pc,d0.w),d1
		jsr	.index(pc,d1.w)
		jsr	Add_SpriteToCollisionResponseList
		jmp	RememberState
; ===========================================================================
.index:
		dc.w .backtrack-.index
		dc.w .advance-.index
; ===========================================================================
	; Wait, should I, like, make it go back here...?
	.backtrack:
	; MECHABU_BACKTRACK
		cmpi.w	#416,wait(a0)
		bge.s	.changeDirection
		addq.w	#1,wait(a0)
		move.w	#$80,x_vel(a0)	; originally added x pos, don't care
;		bra.s	.grip
	.grip:
		jsr		ObjectFall
		jsr	(ObjFloorDist).l
		cmpi.w	#-8,d1
		blt.s	.pause
		cmpi.w	#$C,d1
		bge.s	.pause
		add.w	d1,y_pos(a0)	; match	object's position with the floor
		move.w	#0,y_vel(a0)
		rts
	.pause:
		move.w	#0,x_vel(a0)	; stop the object moving
		bra.s	.changeDirection
	.ret:
		rts
	.advance:
	; MECHABU_ADVANCE
		cmpi.w	#416,wait(a0)
		bge.s	.changeDirection
		addq.w	#1,wait(a0)
		move.w	#-$80,x_vel(a0)	; originally subtracted x pos, don't care
		bra.s	.grip

	.changeDirection:
		clr.w	wait(a0)
		bchg	#1,routine(a0)	; flip
		rts

Obj_MechaBuPartTwo:	; saw and horn
	.main:
		move.w	parent3(a0),a2
		cmpi.l	#Obj_MechaBu.main,address(a2)
		bne.s	.del
		move.b	status(a2),status(a0)
		move.b	render_flags(a2),render_flags(a0)
		move.w	height_pixels(a2),height_pixels(a0)
		move.w	#$180,priority(a0)
		jsr	(Refresh_ChildPositionAdjusted).w
		move.b	#%10010010,collision_flags(a0)	; should be harmful 24x32 sprite. 9 + the last two bits being 10
	.animate:
		cmpi.w	#59,wait(a0)
		bgt.s	.swap
		addq.w	#1,wait(a0)
		btst	#1,(Level_frame_byte).w
		beq.s	.display
		bchg	#0,mapping_frame(a0)
	.display:
		jmp		Child_DrawTouch_Sprite
	.swap:
		bchg	#1,mapping_frame(a0)
		beq.s	.up
	.down:
		move.w	#bytes_to_word(-20,-13),child_dx(a0)
		bra.s	.swapdone
	.up:
		move.w	#bytes_to_word(-25,-1),child_dx(a0)
;		move.w	child_dx(a0),d0
;		ror.w	#8,d0
;		move.w	d0,child_dx(a0)
	.swapdone:
		clr.w	wait(a0)
		sfx		sfx_MechaBuSawLift
		bra.s	.display
	.ret:
		rts
	.del:
		jmp		DeleteObject


ChildObjDat_MechaBuPartTwo:
		dc.w	0	; amount to create -1
		dc.l	Obj_MechaBuPartTwo	; object pointer
		dc.b	-20, -13 ;-13, -20	; X/Y offsets

Map_MechaBu:		binclude	"Objects/Badniks/Mecha-Bu/Object Data/Map - Mecha-Bu.bin"
	even
