; ----------------------------------------------------------------------------
; Object ?? - Sideways log in TTZ
; ----------------------------------------------------------------------------
; OST:
sidelog_char1submersion	= objoff_38 ; $38(a0)
sidelog_char2submersion	= objoff_3A ; $3A(a0)
; ----------------------------------------------------------------------------
; Sprite_24020:
Obj_SideLog:
	moveq	#0,d0
	move.b	routine(a0),d0
	move.w	Obj_SideLog_Index(pc,d0.w),d1
	jmp	Obj_SideLog_Index(pc,d1.w)
; ===========================================================================
; off_2402E: Obj_SideLog_States:
Obj_SideLog_Index:	offsetTable
		offsetTableEntry.w Obj_SideLog_Init	; 0
		offsetTableEntry.w Obj_SideLog_Main	; 2
; ===========================================================================
; loc_24032:
Obj_SideLog_Init:
	addq.b	#2,routine(a0) ; => Obj_SideLog_Main
	move.l	#Map_SidewaysLog,mappings(a0)
	ori.b	#4,render_flags(a0)
	move.w	#$200,priority(a0)
	move.w	#bytes_to_word(16,32),height_pixels(a0)
	move.w	#bytes_to_word(32,64),y_radius(a0)
	move.b	#32,sidelog_char1submersion(a0)
	bset	#7,status(a0)

; loc_24054:
Obj_SideLog_Main:
	; check player 1
	tst.w	(Debug_placement_mode).w
	bne.w	Obj_SideLog_End
	lea	(Player_1).w,a1 ; a1=character
	moveq	#p1_standing,d1
	move.b	status(a0),d0
	and.b	d1,d0
	bne.s	Obj_SideLog_CheckDropChar1
	cmpi.b	#32,sidelog_char1submersion(a0)
	beq.s	Obj_SideLog_CheckSupportChar1
	addq.b	#2,sidelog_char1submersion(a0)
	bra.s	Obj_SideLog_CheckSupportChar1
; ---------------------------------------------------------------------------
; loc_24078:
Obj_SideLog_CheckDropChar1:
	moveq	#p1_standing_bit,d6
	tst.b	sidelog_char1submersion(a0)
	beq.s	Obj_SideLog_DropCharacter
	subq.b	#2,sidelog_char1submersion(a0)

; loc_24082:
Obj_SideLog_CheckSupportChar1:
	moveq	#32,d1
	moveq	#8,d2
	moveq	#0,d3
	move.b	sidelog_char1submersion(a0),d3
	moveq	#p1_standing_bit,d6
	move.w	x_pos(a0),d4
	jsr		SolidObjectTop_1P ; stop the character from falling past the log

	; check player 2
	lea	(Player_2).w,a1 ; a1=character
	tst.b	render_flags(a1)
	bpl.w	Obj_SideLog_End
	moveq	#p2_standing,d1
	move.b	status(a0),d0
	and.b	d1,d0
	bne.s	Obj_SideLog_CheckDropChar2
	cmpi.b	#32,sidelog_char2submersion(a0)
	beq.s	Obj_SideLog_CheckSupportChar2
	addq.b	#2,sidelog_char2submersion(a0)
	bra.s	Obj_SideLog_CheckSupportChar2
; ---------------------------------------------------------------------------
; loc_240B4:
Obj_SideLog_CheckDropChar2:
	moveq	#p2_standing_bit,d6
	tst.b	sidelog_char2submersion(a0)
	beq.s	Obj_SideLog_DropCharacter
	subq.b	#2,sidelog_char2submersion(a0)

; loc_240BE:
Obj_SideLog_CheckSupportChar2:
	moveq	#32,d1
	moveq	#8,d2
	moveq	#0,d3
	move.b	sidelog_char2submersion(a0),d3
	moveq	#p2_standing_bit,d6
	move.w	x_pos(a0),d4
	jsr		SolidObjectTop_1P ; stop the character from falling past the log
	jmp		DisplaySprite
; ---------------------------------------------------------------------------
; loc_240D6:
Obj_SideLog_DropCharacter:
	not.b	d1
	and.b	d1,status(a0)
;	addq.w	#4,y_pos(a1)
	bset	#Status_InAir,status(a1)
	bclr	#Status_OnObj,status(a1)
	bclr	d6,status(a0)
	cmpa.w	#Player_1,a1
	bne.s	.p2
	move.b	#32,sidelog_char1submersion(a0)
	bra.s	.flip
.p2:
	move.b	#32,sidelog_char2submersion(a0)
.flip:
		move.w	#1,ground_vel(a1)
		move.b	#1,flip_angle(a1)
		clr.b	anim(a1)		; id_Walk
		clr.b	flips_remaining(a1)
		move.b	#4,flip_speed(a1)
		btst	#Status_Facing,status(a1)
		beq.s	Obj_SideLog_End
		neg.b	flip_angle(a1)
		neg.w	ground_vel(a1)
;	bra.s	Obj_SideLog_End

;	move.l	a0,-(sp)
;	movea.l	a0,a2
;	movea.l	a1,a0
;	jsr	KillSonic
;	movea.l	(sp)+,a0 ; load 0bj address

Obj_SideLog_End:
	jmp		DisplaySprite


Map_SidewaysLog:	binclude "Objects/Sideways Log/Object Data/Map - Sideways Log.bin"
PLC_SidewaysLog:	binclude "Objects/Sideways Log/Object Data/PLC - Sideways Log.bin"