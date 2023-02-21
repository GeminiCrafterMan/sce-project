; ---------------------------------------------------------------------------
; Object 0E - Sonic on the title screen
; ---------------------------------------------------------------------------

Obj_TitleSonic:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	TSon_Index(pc,d0.w),d1
		jsr	TSon_Index(pc,d1.w)
		lea	DPLCPtr_TitleSonic(pc),a2
		jsr	(Perform_DPLC).l
		jmp	(Draw_Sprite).l
; ===========================================================================
TSon_Index:	dc.w TSon_Main-TSon_Index
		dc.w TSon_Delay-TSon_Index
		dc.w TSon_Move-TSon_Index
		dc.w TSon_Animate-TSon_Index
; ===========================================================================

TSon_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.w	#$F8,obX(a0)
		move.w	#$DE,obY(a0) ; position is fixed to screen
		move.l	#Map_TitleSonic,obMap(a0)
		move.w	#$400,obGfx(a0)
		move.b	#1,obPriority(a0)
		move.b	#1,obFrame(a0)
		move.b	#29,wait(a0) ; set time delay to 0.5 seconds
		lea	Ani_TitleSonic(pc),a1
		jsr	(AnimateSprite).w

TSon_Delay:	;Routine 2
		subq.b	#1,wait(a0) ; subtract 1 from time delay
		bpl.s	.wait		; if time remains, branch
		addq.b	#2,obRoutine(a0) ; go to next routine

.wait:
		rts
; ===========================================================================

TSon_Move:	; Routine 4
		subq.w	#8,obY(a0) ; move Sonic up
		cmpi.w	#$96,obY(a0) ; has Sonic reached final position?
		bne.s	.ret	; if not, branch
		addq.b	#2,obRoutine(a0)

.ret:
		rts

; ===========================================================================

TSon_Animate:	; Routine 6
		lea	Ani_TitleSonic(pc),a1
		jmp	(AnimateSprite).w

Map_TitleSonic:		binclude	"Objects/Title Screen Sonic/Object Data/Map - Title Screen Sonic.bin"
PLC_TitleSonic:		binclude	"Objects/Title Screen Sonic/Object Data/PLC - Title Screen Sonic.bin"

DPLCPtr_TitleSonic:
		dc.l ArtUnc_TitleSonic>>1
		dc.l PLC_TitleSonic
; ---------------------------------------------------------------------------
; Animation script - Sonic on the title screen
; ---------------------------------------------------------------------------
Ani_TitleSonic:	dc.w byte_A706-Ani_TitleSonic
byte_A706:	dc.b 7,	1, 2, 3, 4, 5, 6, 7, 8,	afBack, 2
		even