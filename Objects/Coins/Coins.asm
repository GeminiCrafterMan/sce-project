; ---------------------------------------------------------------------------
; Coin (Object)
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Obj_Coin:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Coin_Index(pc,d0.w),d1
		jmp	Coin_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Coin_Index: offsetTable
		offsetTableEntry.w Obj_CoinInit			; 0
		offsetTableEntry.w Obj_CoinAnimate	; 2
		offsetTableEntry.w Obj_CoinCollect		; 4
		offsetTableEntry.w Obj_CoinSparkle		; 6
		offsetTableEntry.w Obj_CoinDelete		; 8
; ---------------------------------------------------------------------------

Obj_CoinInit:
		addq.b	#2,routine(a0)
		move.l	#Map_Ring,mappings(a0)
		move.w	#make_art_tile(ArtTile_Coin,1,1),art_tile(a0)
		move.b	#4,render_flags(a0)
		move.w	#$100,priority(a0)
		move.b	#7|$40,collision_flags(a0)
		move.b	#16/2,width_pixels(a0)

Obj_CoinAnimate:
		jmp	(Sprite_OnScreen_Test_Collision).w
; ---------------------------------------------------------------------------

Obj_CoinCollect:
		addq.b	#2,routine(a0)
		clr.b	collision_flags(a0)
		move.w	#$80,priority(a0)
		jsr	(GiveRing).w
		move.b	#emotion_happy,(Current_emotion).w
		jsr		UpdateEmotionWindow

Obj_CoinSparkle:
		move.w	#make_art_tile(ArtTile_Ring,1,1),art_tile(a0)
		lea	Ani_RingSparkle(pc),a1
		jsr	(Animate_Sprite).w
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

Obj_CoinDelete:
		jmp	(Delete_Current_Sprite).w
