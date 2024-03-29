; ---------------------------------------------------------------------------
; Object 3C - smashable	wall (GHZ, SLZ)
; ---------------------------------------------------------------------------

Obj_SmashWall:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Smash_Index(pc,d0.w),d1
		jsr	Smash_Index(pc,d1.w)
		jmp		RememberState
; ===========================================================================
Smash_Index:	dc.w Smash_Main-Smash_Index
		dc.w Smash_Solid-Smash_Index
		dc.w Smash_FragMove-Smash_Index

smash_speed = $30		; Sonic's horizontal speed
; ===========================================================================

Smash_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_SmashWall,obMap(a0)
		move.w	#make_art_tile(ArtTile_SmashableWalls,0,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.b	#$10,width_pixels(a0)
		move.b	#$20,height_pixels(a0)
		move.w	#4*$80,obPriority(a0)
		move.b	obSubtype(a0),obFrame(a0)

Smash_Solid:	; Routine 2
		move.w	(Player_1+obVelX).w,smash_speed(a0) ; load Sonic's horizontal speed
		move.w	#$1B,d1
		move.w	#$20,d2
		move.w	#$20,d3
		move.w	obX(a0),d4
		jsr		SolidObject
		swap	d6
		btst	#p1_touch_side_bit,d6
		bne.s	.chkroll
;		andi.w	#p1_touch_side,d6
;		beq.s	.chkroll
;		btst	#p1_pushing_bit,status(a0)
;		bne.s	.chkroll

.donothing:
		rts
; ===========================================================================

.chkroll:
		lea		(Player_1).w,a1	; a1 = character
		cmpi.b	#c_Knuckles,character_id(a1)
		beq.s	.smashAnyway
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	.smashAnyway
		btst	#Status_FireShield,status_secondary(a1)
		beq.s	.noFireShield
		cmpi.b	#1,(v_Shield+anim).w
		beq.s	.smashAnyway
	.noFireShield:
		cmpi.b	#id_Roll,obAnim(a1) ; is Sonic rolling?
		bne.s	.donothing	; if not, branch
	.rolling:
		move.w	smash_speed(a0),d0
		bpl.s	.chkspeed
		neg.w	d0

.chkspeed:
		cmpi.w	#$480,d0	; is Sonic's speed $480 or higher?
		bcs.w	.donothing	; if not, branch
	.smashAnyway:
		move.w	smash_speed(a0),obVelX(a1)
		addq.w	#4,obX(a1)
		lea	(Smash_FragSpd1).l,a4 ;	use fragments that move	right
		move.w	obX(a0),d0
		cmp.w	obX(a1),d0	; is Sonic to the right	of the block?
		bcs.s	.smash		; if yes, branch
		subq.w	#8,obX(a1)
		lea	(Smash_FragSpd2).l,a4 ;	use fragments that move	left

.smash:
		move.w	obVelX(a1),obInertia(a1)
		bclr	#5,obStatus(a0)
		bclr	#5,obStatus(a1)
		jsr		SmashObject

Smash_FragMove:	; Routine 4
		addq.l	#4,sp
		jsr		SpeedToPos
		addi.w	#$70,obVelY(a0)	; make fragment	fall faster
		tst.b	obRender(a0)
		jpl		DeleteObject
		jmp		DisplaySprite

; ===========================================================================
; Smashed block	fragment speeds
;
Smash_FragSpd1:
		dc.w $400, -$500	; x-move speed,	y-move speed
		dc.w $600, -$100
		dc.w $600, $100
		dc.w $400, $500
		dc.w $600, -$600
		dc.w $800, -$200
		dc.w $800, $200
		dc.w $600, $600

Smash_FragSpd2:
		dc.w -$600, -$600
		dc.w -$800, -$200
		dc.w -$800, $200
		dc.w -$600, $600
		dc.w -$400, -$500
		dc.w -$600, -$100
		dc.w -$600, $100
		dc.w -$400, $500

Map_SmashWall:		binclude	"Objects/Smashable Walls/Object Data/Map - Smashable Walls.bin"