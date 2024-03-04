; -------------------------------------------------------------------------
; Spring Shell from Sonic Triple Trouble
; -------------------------------------------------------------------------
Obj_SpringShell:
	.init:
		move.l	#Map_SpringShell,mappings(a0)
		move.w	#make_art_tile(ArtTile_Motobug,0,0),art_tile(a0)
		move.b	#4,render_flags(a0)
		move.w	#4*$80,priority(a0)
		move.w	#bytes_to_word($14,$14),height_pixels(a0)
		move.w	#bytes_to_word($E,8),y_radius(a0)
		move.b	#$C,collision_flags(a0)
		move.l	#.theActualObject,address(a0)
		lea	ChildObjDat_SpringShellSpring(pc),a2
		jsr	(CreateChild1_Normal).w
	.theActualObject:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	.index(pc,d0.w),d1
		jmp	.index(pc,d1.w)
; ===========================================================================
.index:
		dc.w .main-.index
		dc.w .action-.index
		dc.w .animate-.index
		dc.w .delete-.index
; ===========================================================================

.main:	; Routine 0
		jsr		ObjectFall
		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	.notonfloor
		add.w	d1,y_pos(a0)	; match	object's position with the floor
		move.w	#0,y_vel(a0)
		addq.b	#2,routine(a0) ; goto .action next
		bchg	#Status_ObjOrienX,status(a0)

.notonfloor:
		rts
; ===========================================================================

.action:	; Routine 2
		moveq	#0,d0
		move.b	routine_secondary(a0),d0
		move.w	.actIndex(pc,d0.w),d1
		jsr	.actIndex(pc,d1.w)
		lea	(Ani_Motobug).l,a1
		jsr		AnimateSprite
		jsr		Add_SpriteToCollisionResponseList
		jmp		RememberState
; ===========================================================================
.actIndex:	dc.w .move-.actIndex
		dc.w .findfloor-.actIndex
; ===========================================================================

.move:
		subq.w	#1,wait(a0)	; subtract 1 from pause	time
		bpl.s	.wait		; if time remains, branch
		addq.b	#2,routine_secondary(a0)
		move.w	#-$100,x_vel(a0) ; move object to the left
		move.b	#1,anim(a0)
		bchg	#Status_ObjOrienX,status(a0)
		bne.s	.wait
		neg.w	x_vel(a0)	; change direction

.wait:
		rts
; ===========================================================================

.findfloor:
		jsr		SpeedToPos
		jsr	(ObjFloorDist).l
		cmpi.w	#-8,d1
		blt.s	.pause
		cmpi.w	#$C,d1
		bge.s	.pause
		add.w	d1,y_pos(a0)	; match	object's position with the floor
		rts

.pause:
		subq.b	#2,routine_secondary(a0)
		move.w	#59,wait(a0)	; set pause time to 1 second
		move.w	#0,x_vel(a0)	; stop the object moving
		move.b	#0,anim(a0)
		rts
; ===========================================================================

.animate:	; Routine 4
		lea	(Ani_Motobug).l,a1
		jsr		AnimateSprite
		jmp		DisplaySprite
; ===========================================================================

.delete:	; Routine 6
		jmp		DeleteObject

ChildObjDat_SpringShellSpring:
		dc.w	0	; amount to create -1
		dc.l	Obj_SpringShellSpring	; object pointer
		dc.b	0, -16	; X/Y offsets

Obj_SpringShellSpring:
		move.l	#Map_RedSpring,mappings(a0)
		move.w	#make_art_tile(ArtTile_Spring,0,0),art_tile(a0)
		ori.b	#4,render_flags(a0)
		move.w	#bytes_to_word(32/2,32/2),height_pixels(a0)		; set height and width
		move.w	#$200,priority(a0)
;		move.w	x_pos(a0),objoff_32(a0)
;		move.w	y_pos(a0),objoff_34(a0)
;		move.b	subtype(a0),d0
;		lsr.w	#3,d0
;		andi.w	#$E,d0
;		move.w	Spring_Index(pc,d0.w),d0
;		jmp	Spring_Index(pc,d0.w)
;		tst.b	(Reverse_gravity_flag).w
;		bne.s	loc_22DFC
;
;loc_22E96:
		move.l	#Obj_SpringShellSpring_Up,address(a0)

;Spring_Common:
		move.w	parent3(a0),a2
		move.b	subtype(a2),subtype(a0)
		move.b	subtype(a0),d0
		andi.w	#2,d0
		move.w	.strengths(pc,d0.w),objoff_30(a0)
		btst	#1,d0
		beq.s	.ret
		move.l	#Map_YellowSpring,mappings(a0)	; set yellow

.ret:
		rts
; ---------------------------------------------------------------------------

.strengths:		dc.w -$800, -$500

; =============== S U B R O U T I N E =======================================

Obj_SpringShellSpring_Up:
		move.w	parent3(a0),a2
		cmpi.l	#Obj_SpringShell.theActualObject,address(a2)
		bne.s	.del
		move.b	status(a2),status(a0)
		move.b	render_flags(a2),render_flags(a0)
		jsr	(Refresh_ChildPositionAdjusted).w
		moveq	#$1B,d1
		moveq	#8,d2
		moveq	#$10,d3
		move.w	x_pos(a0),d4
		lea	(Player_1).w,a1
		moveq	#p1_standing_bit,d6
		movem.l	d1-d4,-(sp)
		jsr	SolidObjectTop_1P
		btst	#p1_standing_bit,status(a0)
		beq.s	.notP1
		bsr.s	.hitSpring

.notP1:
		movem.l	(sp)+,d1-d4
		lea	(Player_2).w,a1
		moveq	#p2_standing_bit,d6
		jsr		SolidObjectTop_1P
		btst	#p2_standing_bit,status(a0)
		beq.s	.animate
		bsr.s	.hitSpring

.animate:
		lea	(Ani_Spring).l,a1
		jsr	(Animate_Sprite).w
		jmp	Child_Draw_Sprite
	.del:
		jmp		DeleteObject

; =============== S U B R O U T I N E =======================================

.hitSpring:
		move.w	#bytes_to_word(1,0),anim(a0)	; set anim and clear next_anim/prev_anim
		addq.w	#8,y_pos(a1)
		move.w	objoff_30(a0),y_vel(a1)
		bset	#Status_InAir,status(a1)
		bclr	#Status_OnObj,status(a1)
		clr.b	jumping(a1)
		clr.b	spin_dash_flag(a1)
		move.b	#id_Spring,anim(a1)
		move.b	#id_SonicControl,routine(a1)
		move.b	subtype(a0),d0
		bpl.s	.dontKillTransverse
		clr.w	x_vel(a1)

.dontKillTransverse:
		btst	#0,d0
		beq.s	.loc_23020
		move.w	#1,ground_vel(a1)
		move.b	#1,flip_angle(a1)
		clr.b	anim(a1)		; id_Walk
		clr.b	flips_remaining(a1)
		move.b	#4,flip_speed(a1)
		btst	#1,d0
		bne.s	.loc_23010
		move.b	#1,flips_remaining(a1)

.loc_23010:
		btst	#Status_Facing,status(a1)
		beq.s	.loc_23020
		neg.b	flip_angle(a1)
		neg.w	ground_vel(a1)

.loc_23020:
		andi.b	#$C,d0
		cmpi.b	#4,d0
		bne.s	.loc_23036
		move.b	#$C,top_solid_bit(a1)
		move.b	#$D,lrb_solid_bit(a1)

.loc_23036:
		cmpi.b	#8,d0
		bne.s	.playSound
		move.b	#$E,top_solid_bit(a1)
		move.b	#$F,lrb_solid_bit(a1)

.playSound:
		sfx	sfx_Spring,1

; -------------------------------------------------------------------------
; Object data
; -------------------------------------------------------------------------
Map_SpringShell:	binclude "Objects/Enemies/Badniks/Spring Shell/Object Data/Map - Spring Shell.bin"
