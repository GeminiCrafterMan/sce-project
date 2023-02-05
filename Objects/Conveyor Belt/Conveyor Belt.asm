; ----------------------------------------------------------------------------
; Object 72 - Conveyor belt from CNZ
; ----------------------------------------------------------------------------
; Sprite_2893C:
Obj_ConveyorBelt:
	moveq	#0,d0
	move.b	routine(a0),d0
	move.w	Obj_ConveyorBelt_Index(pc,d0.w),d1
	jmp	Obj_ConveyorBelt_Index(pc,d1.w)
; ===========================================================================
; off_2894A:
Obj_ConveyorBelt_Index:	offsetTable
		offsetTableEntry.w Obj_ConveyorBelt_Init	; 0
		offsetTableEntry.w Obj_ConveyorBelt_Main	; 2
; ===========================================================================
; loc_2894E:
Obj_ConveyorBelt_Init:
	addq.b	#2,routine(a0)
	move.w	#$30,objoff_3C(a0)
	move.b	subtype(a0),d0
	bpl.s	+
	move.w	#$70,objoff_3C(a0)
+
	andi.b	#$7F,d0
	lsl.b	#4,d0
	move.b	d0,objoff_38(a0)
	move.w	#2,objoff_36(a0)
	btst	#0,status(a0)
	beq.s	Obj_ConveyorBelt_Main
	neg.w	objoff_36(a0)
; loc_28980:
Obj_ConveyorBelt_Main:
	lea	(Player_1).w,a1 ; a1=character
	bsr.s	Obj_ConveyorBelt_Action
	lea	(Player_2).w,a1 ; a1=character
	bsr.s	Obj_ConveyorBelt_Action
	jmp		Delete_Sprite_If_Not_In_Range
; ===========================================================================
; loc_28990:
Obj_ConveyorBelt_Action:
	moveq	#0,d2
	move.b	objoff_38(a0),d2
	move.w	d2,d3
	add.w	d3,d3
	move.w	x_pos(a1),d0
	sub.w	x_pos(a0),d0
	add.w	d2,d0
	cmp.w	d3,d0
	bhs.s	+	; rts
	move.w	y_pos(a1),d1
	sub.w	y_pos(a0),d1
	move.w	objoff_3C(a0),d0
	add.w	d0,d1
	cmp.w	d0,d1
	bhs.s	+	; rts
	btst	#1,status(a1)
	bne.s	+	; rts
	move.w	objoff_36(a0),d0
	add.w	d0,x_pos(a1)
+
	rts