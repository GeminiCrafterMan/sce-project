; -------------------------------------------------------------------------
; Sonic CD Disassembly
; By Ralakimus 2021
; -------------------------------------------------------------------------
; Bata-pyon object
; -------------------------------------------------------------------------
; Ported to Sonic Clean Engine by Gemini0
; -------------------------------------------------------------------------

oBataSensorX	EQU	$1C		; word
oBataColDist	EQU	$20		; word

; -------------------------------------------------------------------------

Obj_BataPyon:
	moveq	#0,d0
	move.b	routine(a0),d0
	move.w	.Index(pc,d0.w),d0
	jsr	.Index(pc,d0.w)
	jmp	Sprite_CheckDeleteTouch

; -------------------------------------------------------------------------

.Index:
	dc.w	ObjBataPyon_Init-.Index
	dc.w	ObjBataPyon_Fall-.Index
	dc.w	ObjBataPyon_Landed-.Index
	dc.w	ObjBataPyon_Jump-.Index

; -------------------------------------------------------------------------

ObjBataPyon_Init:
	addq.b	#2,routine(a0)
	ori.b	#4,render_flags(a0)
	move.w	#3*$80,priority(a0)
	move.w	#$438,art_tile(a0)
	move.b	#16,x_radius(a0)
	move.b	#16,width_pixels(a0)
	
	move.w	#$700,y_vel(a0)
	move.l	#ObjCheckLeftWallDist,jump(a0)
	move.w	#-16,oBataSensorX(a0)
	move.b	#1,mapping_frame(a0)
	bsr.w	ObjBataPyon_SwapFrames

	move.l	#Map_BataPyon,mappings(a0)
	move.w	#-$A0,x_vel(a0)
	btst	#0,status(a0)
	beq.s	.notFlipped
	neg.w	x_vel(a0)
	move.l	#ObjCheckRightWallDist,jump(a0)
.notFlipped:
	move.w	#$700,y_vel(a0)
	move.b	#7,count(a0)
	addq.b	#1,count(a0)

; -------------------------------------------------------------------------

ObjBataPyon_Fall:
	jsr	ObjectFall
	jsr	ObjFloorDist
	move.w	d1,oBataColDist(a0)
	move.w	oBataSensorX(a0),d3
	movea.l	jump(a0),a1
	jsr	(a1)
	tst.w	d1
	bpl.s	.NoWall

.Wall:
	tst.w	oBataColDist(a0)
	bpl.w	ObjBataPyon_Flip
	cmp.w	oBataColDist(a0),d1
	ble.w	ObjBataPyon_Flip
	bra.s	.Landed

.NoWall:
	tst.w	oBataColDist(a0)
	bmi.s	.Landed
	addi.w	#$20,y_vel(a0)
	cmpi.w	#$700,y_vel(a0)
	blt.s	.End
	move.w	#$700,y_vel(a0)

.End:
	rts

.Landed:
	addq.b	#2,routine(a0)
	move.w	oBataColDist(a0),d0
	add.w	d0,y_pos(a0)

.SetLandTime:
	move.w	#1,wait(a0)
	rts

; -------------------------------------------------------------------------

ObjBataPyon_Landed:
	subq.w	#1,wait(a0)
	bne.s	.End
	addq.b	#2,routine(a0)
	subq.w	#7,y_pos(a0)
	bsr.w	ObjBataPyon_SwapFrames

	sfx	sfx_BatapyonSpring
	move.w	#-$600,y_vel(a0)
	subq.b	#1,count(a0)
	bmi.s	ObjBataPyon_Flip

.End:
	rts

; -------------------------------------------------------------------------

ObjBataPyon_Jump:
	jsr	ObjectFall
	jsr	ObjCheckCeilingDist
	move.w	d1,oBataColDist(a0)
	move.w	oBataSensorX(a0),d3
	movea.l	jump(a0),a1
	jsr	(a1)
	tst.w	d1
	bpl.s	.NoWall

.Wall:
	tst.w	oBataColDist(a0)
	bpl.s	ObjBataPyon_Flip
	cmp.w	oBataColDist(a0),d1
	ble.s	ObjBataPyon_Flip
	bra.s	.HitCeiling

.NoWall:
	tst.w	oBataColDist(a0)
	bmi.s	.HitCeiling
	addi.w	#$20,y_vel(a0)
	bpl.s	.Falling
	rts

.HitCeiling:
	move.w	oBataColDist(a0),d0
	sub.w	d0,y_pos(a0)
	clr.w	y_vel(a0)

.Falling:
	subq.b	#4,routine(a0)
	subi.w	#11,y_pos(a0)
	bra.s	ObjBataPyon_SwapFrames

; -------------------------------------------------------------------------

ObjBataPyon_Flip:
	move.b	#7,count(a0)

	bchg	#0,render_flags(a0)
	bchg	#0,status(a0)
	neg.w	x_vel(a0)
	neg.w	oBataSensorX(a0)

	lea	ObjCheckLeftWallDist,a1
	lea	ObjCheckRightWallDist,a2
	cmpa.l	jump(a0),a1
	bne.s	.SwapWallChk
	exg	a1,a2

.SwapWallChk:
	move.l	a1,jump(a0)
	rts

; -------------------------------------------------------------------------

ObjBataPyon_SwapFrames:
	tst.b	mapping_frame(a0)
	beq.s	.Frame0

	moveq	#0,d0
	moveq	#19,d1
	moveq	#$2F,d2
	bra.s	.SetFrame

.Frame0:
	moveq	#1,d0
	moveq	#28,d1
	moveq	#$30,d2

.SetFrame:
	move.b	d0,mapping_frame(a0)
	move.b	d1,y_radius(a0)
	move.b	d1,height_pixels(a0)
	move.b	d2,collision_flags(a0)
	rts

; -------------------------------------------------------------------------

	include	"Objects/Bata-pyon/Object Data/Map - Bata-pyon.asm"