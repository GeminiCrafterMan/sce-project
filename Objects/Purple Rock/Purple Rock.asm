; ---------------------------------------------------------------------------
; Object 3B - purple rock (GHZ)
; ---------------------------------------------------------------------------

Obj_PurpleRock:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Rock_Index(pc,d0.w),d1
		jmp	Rock_Index(pc,d1.w)
; ===========================================================================
Rock_Index:	dc.w Rock_Main-Rock_Index
		dc.w Rock_Solid-Rock_Index
; ===========================================================================

Rock_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_PurpleRock,obMap(a0)
		move.w	#make_art_tile(ArtTile_PurpleRock,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.b	#$13,width_pixels(a0)
		move.b	#$13,height_pixels(a0)
		move.w	#4*$80,obPriority(a0)

Rock_Solid:	; Routine 2
		move.w	#$1B,d1
		move.w	#$10,d2
		move.w	#$10,d3
		move.w	obX(a0),d4
		jsr		SolidObject
		out_of_xrange.s	Rock_ChkDel
		jmp		DisplaySprite
Rock_ChkDel:
		move.w	respawn_addr(a0),d0
		beq.s	.delete
		movea.w	d0,a2
		bclr	#7,(a2)
	.delete:
		jmp		DeleteObject

Map_PurpleRock:		binclude "Objects/Purple Rock/Object Data/Map - Purple Rock.bin"