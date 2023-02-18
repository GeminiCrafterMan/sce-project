; ---------------------------------------------------------------------------
; Object 2D - Burrobot enemy (LZ)
; ---------------------------------------------------------------------------

Obj_Burrobot:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Burro_Index(pc,d0.w),d1
		jmp	Burro_Index(pc,d1.w)
; ===========================================================================
Burro_Index:	dc.w Burro_Main-Burro_Index
		dc.w Burro_Action-Burro_Index
; ===========================================================================

Burro_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.b	#$13,obHeight(a0)
		move.b	#8,obWidth(a0)
		move.l	#Map_Burrobot,obMap(a0)
		move.w	#make_art_tile(ArtTile_Crabmeat,0,0),obGfx(a0)
		ori.b	#4,obRender(a0)
		move.w	#4*$80,obPriority(a0)
		move.b	#5,obColType(a0)
		move.b	#$C,obActWid(a0)
		addq.b	#6,ob2ndRout(a0) ; run "Burro_ChkSonic" routine
		move.b	#2,obAnim(a0)

Burro_Action:	; Routine 2
		moveq	#0,d0
		move.b	ob2ndRout(a0),d0
		move.w	.index(pc,d0.w),d1
		jsr	.index(pc,d1.w)
		lea	(Ani_Burrobot).l,a1
		jsr		AnimateSprite
		jsr		Add_SpriteToCollisionResponseList
		jmp		RememberState
; ===========================================================================
.index:		dc.w .changedir-.index
		dc.w Burro_Move-.index
		dc.w Burro_Jump-.index
		dc.w Burro_ChkSonic-.index
; ===========================================================================

.changedir:
		subq.w	#1,wait(a0)
		bpl.s	.nochg
		addq.b	#2,ob2ndRout(a0)
		move.w	#255,wait(a0)
		move.w	#$80,obVelX(a0)
		move.b	#1,obAnim(a0)
		bchg	#0,obStatus(a0)	; change direction the Burrobot	is facing
		beq.s	.nochg
		neg.w	obVelX(a0)	; change direction the Burrobot	is moving

.nochg:
		rts	
; ===========================================================================

Burro_Move:
		subq.w	#1,wait(a0)
		bmi.s	loc_AD84
		jsr		SpeedToPos
;		bchg	#0,$32(a0)	; Seems to be unused otherwise.
		bne.s	loc_AD78
		move.w	obX(a0),d3
		addi.w	#$C,d3
		btst	#0,obStatus(a0)
		bne.s	loc_AD6A
		subi.w	#$18,d3

loc_AD6A:
		jsr	(ObjFloorDist2).l
		cmpi.w	#$C,d1
		bge.s	loc_AD84
		rts	
; ===========================================================================

loc_AD78:
		jsr	(ObjFloorDist).l
		add.w	d1,obY(a0)
		rts	
; ===========================================================================

loc_AD84:
		btst	#2,(v_vbla_byte).w
		beq.s	loc_ADA4
		subq.b	#2,ob2ndRout(a0)
		move.w	#59,wait(a0)
		move.w	#0,obVelX(a0)
		move.b	#0,obAnim(a0)
		rts	
; ===========================================================================

loc_ADA4:
		addq.b	#2,ob2ndRout(a0)
		move.w	#-$400,obVelY(a0)
		move.b	#2,obAnim(a0)
		rts	
; ===========================================================================

Burro_Jump:
		jsr		SpeedToPos
		addi.w	#$18,obVelY(a0)
		bmi.s	locret_ADF0
		move.b	#3,obAnim(a0)
		jsr	(ObjFloorDist).l
		tst.w	d1
		bpl.s	locret_ADF0
		add.w	d1,obY(a0)
		move.w	#0,obVelY(a0)
		move.b	#1,obAnim(a0)
		move.w	#255,wait(a0)
		subq.b	#2,ob2ndRout(a0)
		bsr.w	Burro_ChkSonic2

locret_ADF0:
		rts	
; ===========================================================================

Burro_ChkSonic:
		bsr.w	Burro_ChkSonic2	; go here first
		cmp.w	#$60,d0
		bcc.s	.ret
		jsr		Find_SonicTails	; makes d0-d3 dirty
		move.w	y_pos(a1),d0			; moves d3 (nearest character's y-pos) to d0
;		move.w	(Player_1+y_pos).w,d0
		sub.w	obY(a0),d0
		bcc.s	.ret
		cmpi.w	#-$80,d0
		bcs.s	.ret
		tst.w	(Debug_placement_mode).w
		bne.s	.ret
		subq.b	#2,ob2ndRout(a0)
		move.w	d1,obVelX(a0)
		move.w	#-$400,obVelY(a0)
.ret:
		rts	

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Burro_ChkSonic2:
		move.w	#$80,d1
		move.w	d1,-(sp)
		bset	#0,obStatus(a0)
		jsr		Find_SonicTails	; makes d0-d3 dirty
		move.w	x_pos(a1),d0			; moves d2 (nearest character's x-pos) to d0
;		move.w	(Player_1+x_pos).w,d0
		move.w	(sp)+,d1
		sub.w	obX(a0),d0
		bcc.s	.ret
		neg.w	d0
		neg.w	d1
		bclr	#0,obStatus(a0)

.ret:
		rts	
; End of function Burro_ChkSonic2

	include	"Objects/Burrobot/Object Data/Map - Burrobot.asm"
	include	"Objects/Burrobot/Object Data/Anim - Burrobot.asm"