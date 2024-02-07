; ---------------------------------------------------------------------------
; Snailer enemy (SSLZ)
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
		dc.w Snailer_Flame-Snailer_Index
; ===========================================================================

Snailer_Main:	; Routine 0
		move.l	#Map_Snailer,mappings(a0)
		move.w	#make_art_tile(ArtTile_Motobug,0,0),art_tile(a0)
		move.b	#4,render_flags(a0)
		move.w	#4*$80,priority(a0)
		move.b	#$14,width_pixels(a0)
		move.b	#$14,height_pixels(a0)
		cmpi.b	#3,anim(a0)	; is object an exhaust flame?
		beq.s	.flame		; if yes, branch
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

.flame:
		move.w	#3*$80,priority(a0)
		move.b	#8,routine(a0) ; goto Snailer_Flame next
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

.flamedelay = $33
; ===========================================================================

.move:
		subq.w	#1,wait(a0)	; subtract 1 from pause	time
		bpl.s	.wait		; if time remains, branch
		addq.b	#2,routine_secondary(a0)
		move.w	#-$100,x_vel(a0) ; move object to the left
		subq.w	#1,x_pos(a0)	; slow down
		move.b	#1,anim(a0)
		bchg	#0,status(a0)
		bne.s	.cont
		neg.w	x_vel(a0)	; change direction
		addq.w	#2,x_pos(a0)	; slow down

	.cont:
		move.w	parent3(a0),a1
		btst	#3,status(a0)
		bne.s	.wait
		lea		.range(pc),a1
		jsr		(Check_PlayerInRange).l
		tst.l	d0
		beq.s	.done
		move.w	x_vel(a0),d3
		asl.w	#1,d3
		move.w	d3,x_vel(a0)
		bra.s	.loadExhaustFlame

	.wait:
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)

	.done:
		rts
	
	.range:
		dc.w	-128
		dc.w	128*2
		dc.w	-64
		dc.w	64*2
; ===========================================================================

.findfloor:
		jsr		SpeedToPos
		jsr	(ObjFloorDist).l
		cmpi.w	#-8,d1
		blt.s	.pause
		cmpi.w	#$C,d1
		bge.s	.pause
		add.w	d1,y_pos(a0)	; match	object's position with the floor
		bra.s	.cont
	
	.loadexhaustflame:
		jsr		FindFreeObj
		bne.s	.noflame
		move.l	#Obj_Snailer,address(a1) ; load exhaust smoke object
		move.w	x_pos(a0),x_pos(a1)
		move.w	y_pos(a0),y_pos(a1)
		move.b	status(a0),status(a1)
		move.b	#3,anim(a1)
		move.w	a0,parent3(a1)
		move.w	a1,parent3(a0)
		bset	#3,status(a0)
		sfx		sfx_MechaRoll
		move.b	#2,anim(a0)

	.noflame:
		rts

.pause:
		subq.b	#2,routine_secondary(a0)
		move.w	#59,wait(a0)	; set pause time to 1 second
		move.w	#0,x_vel(a0)	; stop the object moving
		move.b	#0,anim(a0)
		bclr	#3,status(a0)
		rts	

Snailer_TestCharPos:
		addi.w	#$20,d3
		cmpi.w	#$40,d3			; is character too low?
		bhs.s	.noCharge	; if yes, branch
		tst.w	d2			; is character to the left?
		bmi.s	.testLeft	; if yes, branch
		tst.w	x_vel(a0)		; is object moving left, towards character?
		bpl.s	.noCharge	; if not, branch
		bra.w	.testHorizDist

.testLeft:
		tst.w	x_vel(a0)		; is object moving right, towards character?
		bmi.s	.noCharge	; if not, branch
		neg.w	d2			; get absolute value

.testHorizDist:
		cmpi.w	#$20,d2			; is distance less than $20?
		blo.s	.noCharge	; if yes, don't attack
		cmpi.w	#$70,d2			; is distance less than $A0?
		blo.s	.inRange	; if yes, attack

.noCharge:
		moveq	#0,d2			; -> don't charge at player
		rts

.inRange:
		moveq	#1,d2			; -> charge at player
		rts
; ===========================================================================

Snailer_Animate:	; Routine 4
		lea	(Ani_Snailer).l,a1
		jsr		AnimateSprite
		jmp		DisplaySprite
; ===========================================================================

Snailer_Delete:	; Routine 6
		jmp		DeleteObject
; ===========================================================================

Snailer_Flame:
		move.w	parent3(a0),a1
		btst	#7,status(a1)
		bne.s	.del
		btst	#3,status(a1)
		beq.s	.del
		tst.b	wait(a1)
		beq.s	.del
		bset	#3,status(a1)
		bra.s	Snailer_Animate

	.del:
		bclr	#3,status(a1)
		bra.s	Snailer_Delete

; ---------------------------------------------------------------------------
; Animation script - Snailer enemy
; ---------------------------------------------------------------------------
Ani_Snailer:
		dc.w .stand-Ani_Snailer
		dc.w .move-Ani_Snailer
		dc.w .charge-Ani_Snailer
		dc.w .flame-Ani_Snailer

.stand:		dc.b $F, 1, afEnd
		even
.move:		dc.b 7,	0, 1, afEnd
		even
.charge:	dc.b 3,	2, 3, afEnd
		even
.flame:		dc.b 1,	4, 5, 6, 7, afEnd
		even

Map_Snailer:		binclude "Objects/Badniks/Snailer/Object Data/Map - Snailer.bin"