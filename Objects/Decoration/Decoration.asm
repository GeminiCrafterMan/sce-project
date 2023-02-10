Obj_Decoration:
		moveq	#0,d0
		move.b	subtype(a0),d0
		lsl.w	#2,d0
		move.l	.types(pc,d0.w),address(a0)
		rts
; ---------------------------------------------------------------------------
; Some of these change based on what zone they're in.
; Obj_Waterfall wasn't included because I really don't want to define like 17 different entries for that alone...
.types:
		dc.l	Obj_BridgeStake
; ---------------------------------------------------------------------------

Obj_BridgeStake:
		move.l	#Map_TensionBridge,mappings(a0)
		move.w	#make_art_tile(ArtTile_Bridge,2,0),art_tile(a0)
		move.b	#1,mapping_frame(a0)
		move.w	#bytes_to_word(8,16),height_pixels(a0)
		move.w	#$200,priority(a0)
		ori.b	#4,render_flags(a0)
		jmp		RememberState	; Do I really have to?

; ---------------------------------------------------------------------------

Obj_Waterfall:
		moveq	#0,d0
		move.l	#Map_SSLZWaterfall,mappings(a0)
		move.w	#make_art_tile(ArtTile_SSLZWaterfall,0,0),art_tile(a0)
		move.b	#4,render_flags(a0)
		move.w	#bytes_to_word($60,$20),height_pixels(a0)
		move.w	#0,priority(a0)
		move.b	#$80,y_radius(a0)
		bset	#4,render_flags(a0)
	; sprite change code here
	; this is basically a copy of how the swinging
	; platforms from S1 handle the ball subtype...
	; or, was, until i decided to do it myself
		moveq	#0,d1
		lea		subtype(a0),a2	; move subtype to a2
		move.b	(a2),d1	; move a2 to d1
		btst	#4,d1		; is object type $1X? (does the top part exist?)
		beq.s	.middle	; if not, branch
		andi.b	#$F,d1	; AND by $F, so you don't get invalid mappings
		addi.b	#8,d1
		bra.s	.done
	; if not...
	.middle:
		cmpi.b	#8,d1	; 8 or above?
		blt.s	.done	; if not, be done
		move.b	#7,d1	; just move #7 to it, you can't make longer waterfalls with 1 object
	.done:
		move.b	d1,mapping_frame(a0)
		jmp		MarkObjGone

; ---------------------------------------------------------------------------
; Mappings for foreground objects
; ---------------------------------------------------------------------------
		include	"Objects/Decoration/Object Data/Map - SSLZ Waterfall.asm"