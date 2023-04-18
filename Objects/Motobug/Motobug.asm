; ---------------------------------------------------------------------------
; Motobug enemy (GHZ)
; ---------------------------------------------------------------------------

Obj_Motobug:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Motobug_Index(pc,d0.w),d1
		jmp	Motobug_Index(pc,d1.w)
; ===========================================================================
Motobug_Index:
		dc.w Motobug_Main-Motobug_Index
		dc.w Motobug_Action-Motobug_Index
		dc.w Motobug_Animate-Motobug_Index
		dc.w Motobug_Delete-Motobug_Index
; ===========================================================================

Motobug_Main:	; Routine 0
		move.l	#Map_Motobug,obMap(a0)
		move.w	#make_art_tile(ArtTile_Motobug,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.w	#4*$80,obPriority(a0)
		move.b	#$14,width_pixels(a0)
		move.b	#$14,height_pixels(a0)
		tst.b	obAnim(a0)	; is object a smoke trail?
		bne.s	.smoke		; if yes, branch
		move.b	#$E,obHeight(a0)
		move.b	#8,obWidth(a0)
		move.b	#$C,obColType(a0)
		jsr		ObjectFall
		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	.notonfloor
		add.w	d1,obY(a0)	; match	object's position with the floor
		move.w	#0,obVelY(a0)
		addq.b	#2,obRoutine(a0) ; goto Motobug_Action next
		bchg	#0,obStatus(a0)

.notonfloor:
		rts	
; ===========================================================================

.smoke:
		addq.b	#4,obRoutine(a0) ; goto Motobug_Animate next
		bra.w	Motobug_Animate
; ===========================================================================

Motobug_Action:	; Routine 2
		moveq	#0,d0
		move.b	ob2ndRout(a0),d0
		move.w	Motobug_ActIndex(pc,d0.w),d1
		jsr	Motobug_ActIndex(pc,d1.w)
		lea	(Ani_Motobug).l,a1
		jsr		AnimateSprite
		jsr		Add_SpriteToCollisionResponseList
		jmp		RememberState
; ===========================================================================
Motobug_ActIndex:	dc.w .move-Motobug_ActIndex
		dc.w .findfloor-Motobug_ActIndex

.smokedelay = $33
; ===========================================================================

.move:
		subq.w	#1,wait(a0)	; subtract 1 from pause	time
		bpl.s	.wait		; if time remains, branch
		addq.b	#2,ob2ndRout(a0)
		move.w	#-$100,obVelX(a0) ; move object to the left
		move.b	#1,obAnim(a0)
		bchg	#0,obStatus(a0)
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
		add.w	d1,obY(a0)	; match	object's position with the floor
		subq.b	#1,.smokedelay(a0)
		bpl.s	.nosmoke
		move.b	#$F,.smokedelay(a0)
		jsr		FindFreeObj
		bne.s	.nosmoke
		move.l	#Obj_Motobug,address(a1) ; load exhaust smoke object
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.b	obStatus(a0),obStatus(a1)
		move.b	#2,obAnim(a1)

.nosmoke:
		rts	

.pause:
		subq.b	#2,ob2ndRout(a0)
		move.w	#59,wait(a0)	; set pause time to 1 second
		move.w	#0,obVelX(a0)	; stop the object moving
		move.b	#0,obAnim(a0)
		rts	
; ===========================================================================

Motobug_Animate:	; Routine 4
		lea	(Ani_Motobug).l,a1
		jsr		AnimateSprite
		jmp		DisplaySprite
; ===========================================================================

Motobug_Delete:	; Routine 6
		jmp		DeleteObject

; ---------------------------------------------------------------------------
; Animation script - Motobug enemy
; ---------------------------------------------------------------------------
Ani_Motobug:
		dc.w .stand-Ani_Motobug
		dc.w .move-Ani_Motobug
		dc.w .smoke-Ani_Motobug

.stand:		dc.b $F, 2, afEnd
		even
.move:		dc.b 7,	0, 1, 0, 2, afEnd
		even
.smoke:		dc.b 1,	3, 6, 3, 6, 4, 6, 4, 6,	4, 6, 5, afRoutine
		even

Map_Motobug:		binclude "Objects/Motobug/Object Data/Map - Motobug.bin"