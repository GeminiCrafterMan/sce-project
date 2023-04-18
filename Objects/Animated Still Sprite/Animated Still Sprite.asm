Obj_AnimatedStillSprite:
		move.l	#Map_AnimatedStillSprites,$C(a0)
		ori.b	#4,4(a0)
		moveq	#0,d0
		move.b	$2C(a0),d0
		move.b	d0,$20(a0)
		add.w	d0,d0
		move.w	d0,d1
		add.w	d0,d0
		add.w	d1,d0
		lea	word_2BF6C(pc,d0.w),a1
		move.w	(a1)+,$A(a0)
		move.w	(a1)+,8(a0)
		move.b	(a1)+,7(a0)
		move.b	(a1)+,6(a0)
		move.l	#loc_2BF5A,(a0)

loc_2BF5A:
		lea	(Ani_AnimatedStillSprites).l,a1
		jsr	(Animate_Sprite).l
		jmp	(Sprite_OnScreen_Test).l
; ---------------------------------------------------------------------------
word_2BF6C:	dc.w $62E9
		dc.w $300
		dc.b 8
		dc.b $C
		dc.w $62E9
		dc.w $300
		dc.b 8
		dc.b $C
		dc.w $C0D3
		dc.w $200
		dc.b $10
		dc.b 4
		dc.w $240D
		dc.w $300
		dc.b $10
		dc.b 4
		dc.w $440F
		dc.w $300
		dc.b 4
		dc.b 4
		dc.w $440F
		dc.w $300
		dc.b $14
		dc.b 4
		dc.w $440F
		dc.w $300
		dc.b $34
		dc.b 4
		dc.w $440F
		dc.w $300
		dc.b $54
		dc.b 4
Ani_AnimatedStillSprites:
		dc.w byte_2BFAC-Ani_AnimatedStillSprites
		dc.w byte_2BFB3-Ani_AnimatedStillSprites
		dc.w byte_2BFB9-Ani_AnimatedStillSprites
		dc.w byte_2BFBD-Ani_AnimatedStillSprites
		dc.w byte_2BFC2-Ani_AnimatedStillSprites
		dc.w byte_2BFC8-Ani_AnimatedStillSprites
		dc.w byte_2BFCE-Ani_AnimatedStillSprites
		dc.w byte_2BFD4-Ani_AnimatedStillSprites
byte_2BFAC:	dc.b	3,   0,	  1,   2,   3,	 4, $FF	
byte_2BFB3:	dc.b	3,   5,	  6,   7,   8, $FF 
byte_2BFB9:	dc.b	7,   9,	 $A, $FF 
byte_2BFBD:	dc.b	4,  $B,	 $C,  $D, $FF 
byte_2BFC2:	dc.b	7,  $E,	 $F, $10, $11, $FF 
byte_2BFC8:	dc.b	7, $12,	$13, $14, $15, $FF 
byte_2BFCE:	dc.b	7, $16,	$17, $18, $19, $FF 
byte_2BFD4:	dc.b	7, $1A,	$1B, $1C, $1D, $FF 

Map_AnimatedStillSprites:
		binclude "Objects/Animated Still Sprite/Object Data/Map - Animated Still Sprites.bin"