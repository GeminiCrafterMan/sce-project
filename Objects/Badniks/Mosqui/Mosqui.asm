; ---------------------------------------------------------------------------
; Object 29 - Mosqui enemy from Palmtree Panic Zone, now in Blossom Gardens
; ---------------------------------------------------------------------------

obStartX:	equ $2C
obEndX:		equ $2E

Obj_Mosqui:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Obj_Mosqui_Index(pc,d0.w),d1 ; used to be (pc,d0.w),d0
		jsr	Obj_Mosqui_Index(pc,d1.w) ; used to be (pc,d0.w)
		jsr	Add_SpriteToCollisionResponseList
		jmp	RememberState
; ===========================================================================
Obj_Mosqui_Index:
		dc.w	Obj_Mosqui_Init-Obj_Mosqui_Index
		dc.w	Obj_Mosqui_Main-Obj_Mosqui_Index
		dc.w	Obj_Mosqui_Animate-Obj_Mosqui_Index
		dc.w	Obj_Mosqui_Dive-Obj_Mosqui_Index
		dc.w	Obj_Mosqui_Wait-Obj_Mosqui_Index
; ===========================================================================

Obj_Mosqui_Init:
		addq.b	#2,obRoutine(a0)
		move.l	#Map_Mosqui,obMap(a0)
		move.w	#ArtTile_Mosqui,obGfx(a0) ; replace in a bit
		ori.b	#4,obRender(a0)
		move.w	#3*$80,obPriority(a0)
		move.b	#$10,obWidth(a0)
		move.b	#$10,obActWid(a0)
		move.b	#$10,obHeight(a0)
		move.b	#$C,obColType(a0)
		move.w	obX(a0),obStartX(a0)
		moveq	#0,d0
		move.l	#-$10000,d0
		move.l	d0,obEndX(a0)

; End of function Obj_Mosqui_Init
; ===========================================================================

Obj_Mosqui_Main:
		tst.w	(Debug_placement_mode).l
		bne.s	.skipRange
		lea	(v_player).w,a1
		bsr.s	Obj_Mosqui_CheckInRange
		bcs.s	.startDive

	.skipRange:
		move.l	obEndX(a0),d0
		add.l	d0,obX(a0)
		move.w	obX(a0),d0
		sub.w	obStartX(a0),d0
		bpl.s	.chkTurn
		neg.w	d0

	.chkTurn:
		cmpi.w	#$80,d0
		blt.w	Obj_Mosqui_Animate
		neg.l	obEndX(a0)
		bchg	#0,obRender(a0)
		bchg	#0,obStatus(a0)
		bra.s	.skipRange

; -------------------------------------------------------------------------------

	.startDive:
		addq.b	#2,obRoutine(a0)
		move.b	#1,obAnim(a0)
		rts
; End of function Obj_Mosqui_Main
; ===========================================================================

Obj_Mosqui_CheckInRange:
		move.w	obY(a1),d0
		sub.w	obY(a0),d0
		subi.w	#-$30,d0
		subi.w	#$100,d0
		bcc.s	.end
		move.w	obX(a1),d0
		sub.w	obX(a0),d0
		move.w	d0,d1
		subi.w	#-$30,d1
		subi.w	#$60,d1

	.end:
		rts
; End of function Obj_Mosqui_CheckInRange
; ===========================================================================

Obj_Mosqui_Animate:
		lea	(Ani_Mosqui).l,a1
		jmp	AnimateSprite
; End of function Obj_Mosqui_Animate
; ===========================================================================

Obj_Mosqui_Dive:
		addq.w	#6,obY(a0)
		bsr.w	Obj_Mosqui_Falling
		jsr	ObjFloorDist	; CheckFloorEdge in CD
		cmpi.w	#-8,d1
		bgt.s	Obj_Mosqui_DiveEnd
		subi.w	#-8,d1
Obj_Mosqui_Check_Top_Solids:
		add.w	d1,obY(a0)
		addq.b	#2,obRoutine(a0)
		tst.b	obRender(a0)
		bpl.s	Obj_Mosqui_DiveEnd
		sfx		sfx_Grab	; was sound A7 in CD, sfx_ArrowStick in SHIMA

Obj_Mosqui_DiveEnd:
		rts
; End of function Obj_Mosqui_Dive
; ===========================================================================

Obj_Mosqui_Wait:
		rts

Obj_Mosqui_Falling:
		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	.end
		bra.w	Obj_Mosqui_Check_Top_Solids
	.end:
		rts

; End of function Mosqui_Wait
; ===========================================================================
; Object data
; ===========================================================================
Ani_Mosqui:
	dc.w	.fly-Ani_Mosqui
	dc.w	.stab-Ani_Mosqui
.fly:	dc.b	0,	0, 1, 2, 1, afEnd
.stab:	dc.b	6,	3, 4, 4, afRoutine, 0

Map_Mosqui:		binclude	"Objects/Badniks/Mosqui/Object Data/Map - Mosqui.bin"