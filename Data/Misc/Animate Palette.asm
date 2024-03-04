; ---------------------------------------------------------------------------
; Palette cycling routine loading subroutine
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Animate_Palette:
		bsr.s	SuperHyper_PalCycle
		tst.w	(Palette_fade_timer).w
		bmi.w	AnimateTiles_NULL
		beq.s	AnPal_Load
		subq.w	#1,(Palette_fade_timer).w
		jmp	(Pal_FromBlack).w
; ---------------------------------------------------------------------------

AnPal_Load:
		movea.l	(Level_data_addr_RAM.AnPal).w,a0
		jsr	(a0)
		jmp	updateWaterShift
; ===========================================================================

SuperHyper_PalCycle:
		move.b	(Super_palette_status).w,d0	; 0 = off | 1 = fading | -1 = fading done
		beq.w	locret_37EC			; return, if player isn't super
		bmi.w	SuperHyper_PalCycle_Normal	; branch, if fade-in is done
		subq.b	#1,d0
		bne.w	SuperHyper_PalCycle_Revert	; branch for values greater than 1

		; fade from Sonic's to Super Sonic's palette
		; run frame timer
		subq.b	#1,(Palette_timer).w
		bpl.w	locret_37EC
		move.b	#1,(Palette_timer).w

		; Tails and Knuckles only
		; Only Sonic has a fade-in; Tails and Knuckles just *pop* into their normal Super/Hyper palette cycle
		cmpi.b	#c_Tails,(Player_1+character_id).w
		blo.s	SuperHyper_PalCycle_FadeIn
		move.b	#-1,(Super_palette_status).w	; -1 = fading done
		move.w	#0,(Palette_frame).w			; Used by Knuckles and Tails' Super Flickies
		move.b	#0,(Palette_frame_Tails).w		; Used by Tails
		move.b	#0,(Player_1+object_control).w		; restore Player's movement
		rts
; ---------------------------------------------------------------------------

SuperHyper_PalCycle_FadeIn:
		; increment palette frame and update Sonic's palette
		cmpi.b	#c_Mighty,(Player_1+character_id).w		; ...or Knuckles, branch, making this code Sonic-specific
		bne.s	.sonic
	.mighty:
		lea	(PalCycle_SuperMighty).l,a0
		bra.s	.cont
	.sonic:
		lea	(PalCycle_SuperSonic).l,a0
	.cont:
		move.w	(Palette_frame).w,d0
		addq.w	#6,(Palette_frame).w			; 1 palette entry = 1 word, Sonic uses 3 shades of blue
		cmpi.w	#$24,(Palette_frame).w			; has palette cycle reached the 6th frame?
		blo.s	SuperHyper_PalCycle_SonicApply		; if not, branch
		move.b	#-1,(Super_palette_status).w	; mark fade-in as done
		move.b	#0,(Player_1+object_control).w		; restore Sonic's movement

SuperHyper_PalCycle_SonicApply:
		lea	(Normal_palette+$4).w,a1
		move.l	(a0,d0.w),(a1)+	; Write first two palette entries
		move.w	4(a0,d0.w),(a1) ; Write last palette entry

locret_37EC:
		rts
; ---------------------------------------------------------------------------

SuperHyper_PalCycle_Revert:	; runs the fade in transition backwards
		cmpi.b	#c_Tails,(Player_1+character_id).w	; If Tails or Knuckles, branch, making this code Sonic-specific
		beq.s	SuperHyper_PalCycle_RevertNotSonic
		cmpi.b	#c_Knuckles,(Player_1+character_id).w	; If Tails or Knuckles, branch, making this code Sonic-specific
		beq.s	SuperHyper_PalCycle_RevertNotSonic

		; run frame timer
		subq.b	#1,(Palette_timer).w
		bpl.s	locret_37EC
		move.b	#3,(Palette_timer).w

		; decrement palette frame and update Sonic's palette
		cmpi.b	#c_Mighty,(Player_1+character_id).w		; ...or Knuckles, branch, making this code Sonic-specific
		bne.s	.sonic
	.mighty:
		lea	(PalCycle_SuperHyperMightyRevert).l,a0
		bra.s	.cont
	.sonic:
		lea	(PalCycle_SuperSonic).l,a0
	.cont:
		move.w	(Palette_frame).w,d0
		subq.w	#6,(Palette_frame).w	; previous frame
		bhs.s	loc_381E		; branch, if it isn't the first frame
		move.w	#0,(Palette_frame).w
		move.b	#0,(Super_palette_status).w	; 0 = off

loc_381E:
		bra.s	SuperHyper_PalCycle_SonicApply
; ---------------------------------------------------------------------------

SuperHyper_PalCycle_RevertNotSonic:
		moveq	#0,d0
		move.w	d0,(Palette_frame).w
		move.b	d0,(Super_palette_status).w	; 0 = off
		move.b	d0,(Palette_frame_Tails).w
		cmpi.b	#c_Knuckles,(Player_1+character_id).w			; If Knuckles, branch, making this code Tails-specific
		beq.s	SuperHyper_PalCycle_RevertKnuckles

		lea	(PalCycle_SuperTails).l,a0		; Used here because the first set of colours is Tails' normal palette
		bsr.w	SuperHyper_PalCycle_ApplyTails
		lea	(PalCycle_SuperSonic).l,a0		; Why does Tails manipulate Sonic's palette? For his Super-form's Super Flickies
		bra.w	SuperHyper_PalCycle_Apply
; ---------------------------------------------------------------------------

SuperHyper_PalCycle_RevertKnuckles:
		lea	(PalCycle_SuperHyperKnucklesRevert).l,a0
		bra.w	SuperHyper_PalCycle_Apply
; ---------------------------------------------------------------------------

SuperHyper_PalCycle_Normal:
		cmpi.b	#c_Tails,(Player_1+character_id).w		; If Tails...
		beq.w	SuperHyper_PalCycle_NormalTails
		cmpi.b	#c_Knuckles,(Player_1+character_id).w		; ...or Knuckles, branch, making this code Sonic-specific
		beq.w	SuperHyper_PalCycle_NormalKnuckles
		tst.b	(Super_Sonic_Knux_flag).w	; If Hyper Sonic, branch
		bmi.s	SuperHyper_PalCycle_HyperSonic

SuperHyper_PalCycle_SuperSonic:	; Tails' code falls back here so the Super Flickies' palette can update
		; run frame timer
		subq.b	#1,(Palette_timer).w
		bpl.w	locret_37EC
		move.b	#6,(Palette_timer).w

		; increment palette frame and update Sonic's palette
		cmpi.b	#c_Mighty,(Player_1+character_id).w		; ...or Knuckles, branch, making this code Sonic-specific
		bne.s	.sonic
	.mighty:
		lea	(PalCycle_SuperMighty).l,a0
		bra.s	.cont
	.sonic:
		lea	(PalCycle_SuperSonic).l,a0
	.cont:
		move.w	(Palette_frame).w,d0
		addq.w	#6,(Palette_frame).w	; next frame
		cmpi.w	#$3C,(Palette_frame).w	; is it the last frame?
		blo.s	loc_3898		; if not, branch
		move.w	#$24,(Palette_frame).w	; reset frame counter (Super Sonic's normal palette cycle starts at $24. Everything before that is for the palette fade)

loc_3898:
		bra.w	SuperHyper_PalCycle_SonicApply
; ---------------------------------------------------------------------------

SuperHyper_PalCycle_HyperSonic:
		; run frame timer
		subq.b	#1,(Palette_timer).w
		bpl.w	locret_37EC
		move.b	#4,(Palette_timer).w

		; increment palette frame and update Sonic's palette
		cmpi.b	#c_Mighty,(Player_1+character_id).w		; ...or Knuckles, branch, making this code Sonic-specific
		bne.s	.sonic
	.mighty:
		lea	(PalCycle_HyperMighty).l,a0
		bra.s	.cont
	.sonic:
		lea	(PalCycle_HyperSonic).l,a0
	.cont:
		move.w	(Palette_frame).w,d0
		addq.w	#6,(Palette_frame).w			; next frame
		cmpi.w	#$48,(Palette_frame).w			; is it the last frame?
		blo.s	SuperHyper_PalCycle_HyperSonicApply	; if not, branch
		move.w	#0,(Palette_frame).w			; reset frame counter

SuperHyper_PalCycle_HyperSonicApply:
		; Redundant. SuperHyper_PalCycle_Apply does the exact same thing
		; and other areas of code do branch to it instead of duplicating the code as seen here
		lea	(Normal_palette+$4).w,a1
		move.l	(a0,d0.w),(a1)+	; Write first two palette entries
		move.w	4(a0,d0.w),(a1) ; Write last palette entry
		rts
; ---------------------------------------------------------------------------

SuperHyper_PalCycle_NormalTails:
		; run frame timer
		subq.b	#1,(Palette_timer_Tails).w
		bpl.w	SuperHyper_PalCycle_SuperSonic
		move.b	#$B,(Palette_timer_Tails).w

		; increment palette frame and update Tails' palette
		lea	(PalCycle_SuperTails).l,a0
		moveq	#0,d0
		move.b	(Palette_frame_Tails).w,d0
		addq.b	#6,(Palette_frame_Tails).w	; next frame
		cmpi.b	#$24,(Palette_frame_Tails).w	; is it the last frame?
		blo.s	SuperHyper_PalCycle_ApplyTails	; if not, branch
		move.b	#0,(Palette_frame_Tails).w	; reset frame counter
		; go straight to SuperHyper_PalCycle_ApplyTails...
; End of function SuperHyper_PalCycle


; =============== S U B R O U T I N E =======================================


SuperHyper_PalCycle_ApplyTails:
		; Tails gets his own because of the unique location of his palette entries
		lea	(Normal_palette+$10).w,a1
		move.l	(a0,d0.w),(a1)+		; Write first two palette entries
		move.w	4(a0,d0.w),2(a1)	; Write last palette entry
		bra.w	SuperHyper_PalCycle_SuperSonic
; End of function SuperHyper_PalCycle_ApplyTails

; ---------------------------------------------------------------------------

SuperHyper_PalCycle_NormalKnuckles:
		; run frame timer
		subq.b	#1,(Palette_timer).w
		bpl.w	locret_37EC
		move.b	#2,(Palette_timer).w

		; increment palette frame and update Knuckles' palette
		lea	(PalCycle_SuperHyperKnuckles).l,a0
		move.w	(Palette_frame).w,d0
		addq.w	#6,(Palette_frame).w			; next frame
		cmpi.w	#$3C,(Palette_frame).w			; is it the last frame?
		blo.s	SuperHyper_PalCycle_Apply		; if not, branch
		move.w	#0,(Palette_frame).w			; reset frame counter
		move.b	#$E,(Palette_timer).w

SuperHyper_PalCycle_Apply:
		lea	(Normal_palette+$4).w,a1
		move.l	(a0,d0.w),(a1)+	; Write first two palette entries
		move.w	4(a0,d0.w),(a1)	; Write last palette entry
		rts
; ---------------------------------------------------------------------------
PalCycle_SuperSonic:
		dc.w $E66,$C42,$822
		dc.w $E88,$C66,$844
		dc.w $EAA,$C88,$A66
		dc.w $ECC,$EAA,$C88
		dc.w $EEE,$ECC,$EAA
		dc.w $EEE,$EEE,$EEE
		dc.w $CEE,$CEE,$AEE	; $24
		dc.w $AEE,$8EE,$6CC	; $2A
		dc.w $8EE,$0EE,$0AA	; $30
		dc.w $AEE,$8EE,$6CC	; $36

PalCycle_HyperSonic:
		dc.w $EEC,$ECA,$EA8
		dc.w $EEE,$EEE,$EEE
		dc.w $CEC,$AEA,$2E0
		dc.w $EEE,$EEE,$EEE
		dc.w $AEC,$4EC,$0CC
		dc.w $EEE,$EEE,$EEE
		dc.w $CEE,$8EE,$4CE
		dc.w $EEE,$EEE,$EEE
		dc.w $EEE,$CCE,$AAE
		dc.w $EEE,$EEE,$EEE
		dc.w $EEE,$ECE,$CAC
		dc.w $EEE,$EEE,$EEE

PalCycle_SuperTails:
		dc.w $0AE,$08E,$46A
		dc.w $4CE,$2AE,$46A
		dc.w $8CE,$4CE,$46C
		dc.w $AEE,$8CE,$48E
		dc.w $8CE,$4CE,$46C
		dc.w $4CE,$2AE,$46A

PalCycle_SuperHyperKnuckles:
		dc.w $A6E,$64E,$428
		dc.w $C8E,$86E,$64A
		dc.w $EAE,$A8E,$86C
		dc.w $ECE,$CAE,$A8E
		dc.w $EEE,$ECE,$CAE
		dc.w $ECE,$CAE,$A8E
		dc.w $EAE,$A8E,$86C
		dc.w $C8E,$86E,$64A
		dc.w $A6E,$64E,$428
		dc.w $84E,$40C,$206

PalCycle_SuperHyperKnucklesRevert:
		dc.w $64E,$20C,$206

PalCycle_SuperMighty:
        dc.w $66E,$44E,$20A
        dc.w $88E,$66E,$22A
        dc.w $AAE,$88E,$44A
        dc.w $AAE,$88E,$64C
        dc.w $CCE,$AAE,$68E
        dc.w $CCE,$AAE,$68E
        dc.w $AAE,$88E,$64C
        dc.w $AAE,$88E,$44A
        dc.w $88E,$66E,$22A
        dc.w $66E,$44E,$20A
PalCycle_HyperMighty:
        dc.w $4CE,$2AC,$268
        dc.w $4EE,$4CE,$28A
        dc.w $AEE,$4EE,$2AA
        dc.w $CEE,$8EE,$4CC
        dc.w $EEE,$AEE,$6EE
        dc.w $CEE,$8EE,$4CC
        dc.w $AEE,$4EE,$2AA
        dc.w $4EE,$4CE,$28A
        dc.w $4CE,$2AC,$268
        dc.w $2CE,$08A,$068
        dc.w $0AC,$068,$046
        dc.w $2CE,$08A,$068
PalCycle_SuperHyperMightyRevert:
        dc.w $44E,$22A,$226

; by Naoto, for SHIMA, yoinked by Gem
PalRotLeft_4:
		move.w	(a0)+,d0
		move.w	(a0)+,d1
		move.l	(a0)+,d2
		move.w	d0,-(a0)
		move.l	d2,-(a0)
		move.w	d1,-(a0)
		rts

PalRotRight_4:
		move.w	(a0)+,d0
		move.l	(a0)+,d1
		move.w	(a0)+,d2
		move.l	d1,-(a0)
		move.w	d0,-(a0)
		move.w	d2,-(a0)
		rts

PalRotLeft_3:
		move.w	(a0)+,d0
		move.l	(a0)+,d1
		move.w	d0,-(a0)
		move.l	d1,-(a0)
		rts

PalRotRight_3:
		move.l	(a0)+,d0
		move.w	(a0)+,d1
		move.l	d0,-(a0)
		move.w	d1,-(a0)
		rts