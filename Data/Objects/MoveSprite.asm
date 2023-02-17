
; =============== S U B R O U T I N E =======================================

ObjectFall:
MoveSprite:
        movem.w  obVelX(a0),d0/d2
        lsl.l    #8,d0
        add.l    d0,obX(a0)
        cmp.w   #$FC8,obVelY(a0)   ; check if Sonic's Y speed is lower than this value
        ble.s   .skipline       ; if yes, branch
        move.w  #$FC8,obVelY(a0)    ; alter Sonic's Y speed
    .skipline:		
		addi.w   #$38,obVelY(a0)
        lsl.l    #8,d2
        add.l    d2,obY(a0)
		rts	

; =============== S U B R O U T I N E =======================================

SpeedToPos:
MoveSprite2:
		movem.w	obVelX(a0),d0/d2
		lsl.l	#8,d0
		add.l	d0,obX(a0)
		lsl.l	#8,d2
		add.l	d2,obY(a0)
		rts
; =============== S U B R O U T I N E =======================================

MoveSprite_TestGravity:
		tst.b	(Reverse_gravity_flag).w
		beq.s	MoveSprite

MoveSprite_ReverseGravity:
		movem.w	x_vel(a0),d0-d1	; load xy speed
		ext.l	d0
		asl.l	#8,d0				; shift velocity to line up with the middle 16 bits of the 32-bit position
		add.l	d0,x_pos(a0)		; add x speed to x position	; note this affects the subpixel position x_sub(a0) = 2+x_pos(a0)
		addi.w	#$38,y_vel(a0)	; increase vertical speed (apply gravity)
		neg.w	d1				; reverse it
		ext.l	d1
		asl.l	#8,d1				; shift velocity to line up with the middle 16 bits of the 32-bit position
		add.l	d1,y_pos(a0)		; add old y speed to y position	; note this affects the subpixel position y_sub(a0) = 2+y_pos(a0)
		rts

; =============== S U B R O U T I N E =======================================

MoveSprite2_TestGravity:
		tst.b	(Reverse_gravity_flag).w
		beq.s	MoveSprite2

MoveSprite2_ReverseGravity:
		movem.w	x_vel(a0),d0-d1	; load xy speed
		ext.l	d0
		asl.l	#8,d0				; shift velocity to line up with the middle 16 bits of the 32-bit position
		add.l	d0,x_pos(a0)		; add to x-axis position	; note this affects the subpixel position x_sub(a0) = 2+x_pos(a0)
		neg.w	d1				; reverse it
		ext.l	d1
		asl.l	#8,d1				; shift velocity to line up with the middle 16 bits of the 32-bit position
		add.l	d1,y_pos(a0)		; add to y-axis position	; note this affects the subpixel position y_sub(a0) = 2+y_pos(a0)
		rts

; =============== S U B R O U T I N E =======================================

MoveSprite_LightGravity:
		moveq	#$20,d2

MoveSprite_CustomGravity:
		movem.w	x_vel(a0),d0-d1	; load xy speed
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,x_pos(a0)
		add.w	d2,y_vel(a0)
		ext.l	d1
		asl.l	#8,d1
		add.l	d1,y_pos(a0)
		rts

; =============== S U B R O U T I N E =======================================

MoveSprite_NormGravity:
		moveq	#$38,d2

MoveSprite_CustomGravity2:
		movem.w	x_vel(a1),d0-d1	; load xy speed
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,x_pos(a1)
		add.w	d2,y_vel(a1)
		ext.l	d1
		asl.l	#8,d1
		add.l	d1,y_pos(a1)
		rts

; =============== S U B R O U T I N E =======================================

MoveSprite_Reserve:
		movem.w	x_vel(a0),d0-d1	; load xy speed
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,objoff_30(a0)
		addi.w	#$38,y_vel(a0)
		ext.l	d1
		asl.l	#8,d1
		add.l	d1,objoff_34(a0)
		rts

; =============== S U B R O U T I N E =======================================

MoveSprite2_Reserve:
		movem.w	x_vel(a0),d0-d1	; load xy speed
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,objoff_30(a0)
		ext.l	d1
		asl.l	#8,d1
		add.l	d1,objoff_34(a0)
		rts
