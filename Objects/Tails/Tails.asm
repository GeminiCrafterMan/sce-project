Obj_Tails:
		rts

;LoadTailsTailsDynPLC:
;		moveq	#0,d0
;		move.b	obFrame(a0),d0
;		cmp.b	TailsTails_prevframe(a0),d0
;		beq.s	.ret
;		move.b	d0,TailsTails_prevframe(a0)
;		lea	(DPLC_TailsTails).l,a2
;		add.w	d0,d0
;		adda.w	(a2,d0.w),a2
;		moveq	#0,d5
;		move.b	(a2)+,d5
;		subq.w	#1,d5
;		bmi.s	.ret
;		move.w	obGfx(a0),d4    ; get art tile
;		andi.w  #$7FF,d4	; clear art flags
;		lsl.w   #5,d4	   ; get VRAM address
;		move.l	#Art_TailsTails,d6
;		bra.s	Player_LoadGfx.readentry
;	.ret:
;		rts

; ===========================================================================
; ---------------------------------------------------------------------------
; Tails animation, mapping, and PLC data
; ---------------------------------------------------------------------------

		include "Objects/Tails/Object Data/Anim - Tails.asm"
		include "Objects/Tails/Object Data/Map - Tails.asm"
		include "Objects/Tails/Object Data/Tails pattern load cues.asm"
		include "Objects/Tails/Object Data/Map - Tails tails.asm"
		include "Objects/Tails/Object Data/Tails tails pattern load cues.asm"