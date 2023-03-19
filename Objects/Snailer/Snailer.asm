; ---------------------------------------------------------------------------
; Snailer enemy (GHZ)
; ---------------------------------------------------------------------------

Obj_Snailer:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Snailer_Index(pc,d0.w),d1
		jmp	Snailer_Index(pc,d1.w)
; ===========================================================================
Snailer_Index:
		dc.w Snailer_Main-Snailer_Index
		dc.w Snailer_Action-Snailer_Index
		dc.w Snailer_Animate-Snailer_Index
		dc.w Snailer_Delete-Snailer_Index
; ===========================================================================

Snailer_Main:	; Routine 0
		move.l	#Map_Snailer,mappings(a0)
		move.w	#make_art_tile(ArtTile_Snailer,0,0),art_tile(a0)
		move.b	#4,render_flags(a0)
		move.w	#4*$80,priority(a0)
		move.b	#$14,width_pixels(a0)
		move.b	#$14,height_pixels(a0)
		tst.b	anim(a0)	; is object a smoke trail?
		bne.s	.smoke		; if yes, branch
		move.b	#$E,y_radius(a0)
		move.b	#8,x_radius(a0)
		move.b	#$C,collision_flags(a0)
		jsr		ObjectFall
		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	.notonfloor
		add.w	d1,y_pos(a0)	; match	object's position with the floor
		move.w	#0,y_vel(a0)
		addq.b	#2,routine(a0) ; goto Snailer_Action next
		bchg	#0,status(a0)

.notonfloor:
		rts	
; ===========================================================================

.smoke:
		addq.b	#4,routine(a0) ; goto Snailer_Animate next
		bra.w	Snailer_Animate
; ===========================================================================

Snailer_Action:	; Routine 2
		moveq	#0,d0
		move.b	routine_secondary(a0),d0
		move.w	Snailer_ActIndex(pc,d0.w),d1
		jsr	Snailer_ActIndex(pc,d1.w)
		lea	(Ani_Snailer).l,a1
		jsr		AnimateSprite
		jsr		Add_SpriteToCollisionResponseList
		jmp		RememberState
; ===========================================================================
Snailer_ActIndex:	dc.w .move-Snailer_ActIndex
		dc.w .findfloor-Snailer_ActIndex

.smokedelay = $33
; ===========================================================================

.move:
		subq.w	#1,wait(a0)	; subtract 1 from pause	time
		bpl.s	.wait		; if time remains, branch
		addq.b	#2,routine_secondary(a0)
		move.w	#-$100,obVelX(a0) ; move object to the left
		move.b	#1,anim(a0)
		bchg	#0,status(a0)
		bne.s	.wait
		neg.w	obVelX(a0)	; change direction

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
		subq.b	#1,.smokedelay(a0)
		bpl.s	.nosmoke
		move.b	#$F,.smokedelay(a0)
		jsr		FindFreeObj
		bne.s	.nosmoke
		move.l	#Obj_Snailer,address(a1) ; load exhaust smoke object
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		move.b	status(a0),status(a1)
		move.b	#2,anim(a1)

.nosmoke:
		rts	

.pause:
		subq.b	#2,routine_secondary(a0)
		move.w	#59,wait(a0)	; set pause time to 1 second
		move.w	#0,obVelX(a0)	; stop the object moving
		move.b	#0,anim(a0)
		rts	
; ===========================================================================

Snailer_Animate:	; Routine 4
		lea	(Ani_Snailer).l,a1
		jsr		AnimateSprite
		jmp		DisplaySprite
; ===========================================================================

Snailer_Delete:	; Routine 6
		jmp		DeleteObject

; ---------------------------------------------------------------------------
; Animation script - Snailer enemy
; ---------------------------------------------------------------------------
Ani_Snailer:
		dc.w .stand-Ani_Snailer
		dc.w .move-Ani_Snailer
		dc.w .flame-Ani_Snailer

.stand:		dc.b $F, 2, afEnd
		even
.move:		dc.b 7,	0, 1, 0, 2, afEnd
		even
.flame:		dc.b 2,	3, 4, afEnd
		even

Map_Snailer:		binclude "Objects/Snailer/Object Data/Map - Snailer.bin"