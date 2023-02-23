; ---------------------------------------------------------------------------
; Object 22 - Buzz Bomber enemy	(GHZ, MZ, SYZ)
; ---------------------------------------------------------------------------

Obj_BuzzBomber:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Buzz_Index(pc,d0.w),d1
		jmp	Buzz_Index(pc,d1.w)
; ===========================================================================
Buzz_Index:	dc.w Buzz_Main-Buzz_Index
		dc.w Buzz_Action-Buzz_Index
		dc.w Buzz_Delete-Buzz_Index

buzz_buzzstatus = $34
; ===========================================================================

Buzz_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_BuzzBomber,obMap(a0)
		move.w	#make_art_tile(ArtTile_BuzzBomber,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.w	#3*$80,obPriority(a0)
		move.b	#8,obColType(a0)
		move.b	#$18,width_pixels(a0)
		move.b	#$18,height_pixels(a0)

Buzz_Action:	; Routine 2
		moveq	#0,d0
		move.b	ob2ndRout(a0),d0
		move.w	.index(pc,d0.w),d1
		jsr	.index(pc,d1.w)
		lea	(Ani_Buzz).l,a1
		jsr		AnimateSprite
		jsr		Add_SpriteToCollisionResponseList
		jmp		RememberState
; ===========================================================================
.index:		dc.w .move-.index
		dc.w .chknearsonic-.index
; ===========================================================================

.move:
		subq.w	#1,wait(a0) ; subtract 1 from time delay
		bpl.s	.noflip		; if time remains, branch
		btst	#1,buzz_buzzstatus(a0) ; is Buzz Bomber near Sonic?
		bne.s	.fire		; if yes, branch
		addq.b	#2,ob2ndRout(a0)
		move.w	#127,wait(a0) ; set time delay to just over 2 seconds
		move.w	#$400,obVelX(a0) ; move Buzz Bomber to the right
		move.b	#1,obAnim(a0)	; use "flying" animation
		btst	#0,obStatus(a0)	; is Buzz Bomber facing	left?
		bne.s	.noflip		; if not, branch
		neg.w	obVelX(a0)	; move Buzz Bomber to the left

.noflip:
		rts	
; ===========================================================================

.fire:
		jsr		FindFreeObj
		bne.s	.fail
		move.l	#Obj_BuzzMissile,address(a1) ; load missile object
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		addi.w	#$1C,obY(a1)
		move.w	#$200,obVelY(a1) ; move missile downwards
		move.w	#$200,obVelX(a1) ; move missile to the right
		move.w	#$18,d0
		btst	#0,obStatus(a0)	; is Buzz Bomber facing	left?
		bne.s	.noflip2	; if not, branch
		neg.w	d0
		neg.w	obVelX(a1)	; move missile to the left

.noflip2:
		add.w	d0,obX(a1)
		move.b	obStatus(a0),obStatus(a1)
		move.w	#$E,wait(a1)
;		move.w	a0,parent3(a1)
		move.b	#1,buzz_buzzstatus(a0) ; set to "already fired" to prevent refiring
		move.w	#59,wait(a0)
		move.b	#2,obAnim(a0)	; use "firing" animation

.fail:
		rts	
; ===========================================================================

.chknearsonic:
		subq.w	#1,wait(a0) ; subtract 1 from time delay
		bmi.s	.chgdirection
		jsr		SpeedToPos
		tst.b	buzz_buzzstatus(a0)
		bne.s	.keepgoing
		move.w	(v_player+obX).w,d0
		sub.w	obX(a0),d0
		bpl.s	.isleft
		neg.w	d0

.isleft:
		cmpi.w	#$60,d0		; is Buzz Bomber within	$60 pixels of Sonic?
		bcc.s	.keepgoing	; if not, branch
		tst.b	obRender(a0)
		bpl.s	.keepgoing
		move.b	#2,buzz_buzzstatus(a0) ; set Buzz Bomber to "near Sonic"
		move.w	#29,wait(a0) ; set time delay to half a second
		bra.s	.stop
; ===========================================================================

.chgdirection:
		move.b	#0,buzz_buzzstatus(a0) ; set Buzz Bomber to "normal"
		bchg	#0,obStatus(a0)	; change direction
		move.w	#59,wait(a0)

.stop:
		subq.b	#2,ob2ndRout(a0)
		move.w	#0,obVelX(a0)	; stop Buzz Bomber moving
		move.b	#0,obAnim(a0)	; use "hovering" animation

.keepgoing:
		rts	
; ===========================================================================

Buzz_Delete:	; Routine 4
		jmp		DeleteObject

; ---------------------------------------------------------------------------
; Object 23 - missile that Buzz	Bomber throws
; ---------------------------------------------------------------------------

Obj_BuzzMissile:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Msl_Index(pc,d0.w),d1
		jmp	Msl_Index(pc,d1.w)
; ===========================================================================
Msl_Index:	dc.w Msl_Main-Msl_Index
		dc.w Msl_Animate-Msl_Index
		dc.w Msl_FromBuzz-Msl_Index
		dc.w Msl_Delete-Msl_Index
		dc.w Msl_FromNewt-Msl_Index
; ===========================================================================

Msl_Main:	; Routine 0
		subq.w	#1,wait(a0)
		bpl.s	.ret
		move.b	#3,obAnim(a0)
		addq.b	#2,obRoutine(a0)
		move.l	#Map_BuzzBomber,obMap(a0)
		move.w	#make_art_tile(ArtTile_BuzzBomber,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.w	#3*$80,obPriority(a0)
		move.b	#8,width_pixels(a0)
		move.b	#8,height_pixels(a0)
		andi.b	#3,obStatus(a0)
		tst.b	obSubtype(a0)	; was object created by	a Newtron?
		beq.s	Msl_Animate	; if not, branch

		move.b	#8,obRoutine(a0) ; run "Msl_FromNewt" routine
		move.b	#$87,obColType(a0)
		move.b	#4,obAnim(a0)
		bra.w	Msl_Animate2
	.ret:
		rts
; ===========================================================================

Msl_Animate:	; Routine 2
		lea	(Ani_Buzz).l,a1
		jsr		AnimateSprite
		jmp		DisplaySprite

; ===========================================================================

Msl_FromBuzz:	; Routine 4
		btst	#7,obStatus(a0)
		bne.s	.explode
		move.b	#$87,obColType(a0)
		move.b	#4,obAnim(a0)
		jsr		SpeedToPos
	; check if it hit the floor, and if it did, set bit 7
		jsr		(ObjFloorDist).l
		tst.w	d1
		bpl.s	.didntHit
		bset	#7,obStatus(a0)
	.didntHit:
		lea	(Ani_Buzz).l,a1
		jsr		AnimateSprite
		move.w	(v_limitbtm2).w,d0
		addi.w	#$E0,d0
		cmp.w	obY(a0),d0	; has object moved below the level boundary?
		bcs.s	Msl_Delete	; if yes, branch
		jsr		Add_SpriteToCollisionResponseList
		jmp		DisplaySprite
;		jmp		Child_DrawTouch_Sprite
; ===========================================================================

.explode:
		move.l	#Obj_Explosion,address(a0) ; change object to an explosion
		move.b	#2,obRoutine(a0)
		jmp		Obj_Explosion
; ===========================================================================

Msl_Delete:	; Routine 6
		jmp		DeleteObject
; ===========================================================================

Msl_FromNewt:	; Routine 8
		tst.b	obRender(a0)
		bpl.s	Msl_Delete
		jsr		SpeedToPos

Msl_Animate2:
		lea	(Ani_Buzz).l,a1
		jsr		AnimateSprite
		jsr		Add_SpriteToCollisionResponseList
		jmp		DisplaySprite
;		jmp		Child_DrawTouch_Sprite

		include "Objects/Buzz Bomber/Object Data/Anim - Buzz Bomber.asm"
Map_BuzzBomber:		binclude "Objects/Buzz Bomber/Object Data/Map - Buzz Bomber.bin"