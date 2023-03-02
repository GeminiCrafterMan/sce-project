Obj_BackgroundCharacters:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	DeleteObject			; GHZ
	endr
	rept 4
		dc.l	DeleteObject			; SSLZ
	endr
	rept 4
		dc.l	Obj_FlareTheAlligator	; TTPZ
	endr
	rept 4
		dc.l	DeleteObject			; MMZ
	endr
	rept 4
		dc.l	DeleteObject			; DEZ
	endr
	rept 4
		dc.l	DeleteObject			; TTSZ
	endr
	zonewarning	.index,(4*4)
; ---------------------------------------------------------------------------

Obj_FlareTheAlligator:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	.index(pc,d0.w),d1
		jsr	.index(pc,d1.w)
		lea	DPLCPtr_FlareTheAlligator(pc),a2
		jmp	(Perform_DPLC).l
; ---------------------------------------------------------------------------
.index:
		dc.w	.init-.index
		dc.w	.main-.index
		dc.w	.falling-.index
		dc.w	.bounced-.index
; ---------------------------------------------------------------------------
.init:
		addq.b	#2,routine(a0)
		move.l	#Map_FlareTheAlligator,mappings(a0)
		move.w	#$A3F4,art_tile(a0)
		move.w	#$200,priority(a0)
		move.b	#4,render_flags(a0)
		move.w	#bytes_to_word(8*4,8*3),y_radius(a0)
		move.w	#bytes_to_word(4*4,4*3),height_pixels(a0)
		lea	(Pal_FlareTheAlligator).l,a1
		lea	(Normal_palette_line_2).w,a2
		jsr	(PalLoad_Line16).l
		move.l	#AniRaw_FlareVibe,aniraw(a0)	; vibin'

.main:
		out_of_xrange.w		.chkdel
	; check for speeding past
		jsr	(Find_SonicTails).w
		cmpi.w	#16*4,d2	; x distance
		bgt.w	.display
	; check for ducking
		cmpi.b	#id_Duck,anim(a1)
		bne.s	.notDucking
		cmpi.l	#AniRaw_FlareWait,aniraw(a0)
		beq.s	.contDucking
		clr.b	anim_frame(a0)
		clr.b	anim_frame_timer(a0)
		move.l	#AniRaw_FlareWait,aniraw(a0)	; waitin'
		bra.w	.display
	.notDucking:
		move.l	#AniRaw_FlareVibe,aniraw(a0)	; vibin'
	.contDucking:
		cmpi.w	#8*4,d3	; y distance
		bgt.w	.display
		cmpi.w	#8*4,d2	; x distance
		bgt.w	.display
		mvabs.w	x_vel(a1),d2
		mvabs.w	ground_vel(a1),d3
		cmp.w	d3,d2
		bge.s	.groundFaster
		move.w	d3,d2
	.groundFaster:
		cmpi.w	#$600,d2	; top running speed?
		blt.w	.display
		move.w	x_vel(a1),d2
		move.w	ground_vel(a1),d3
		cmp.w	d3,d2
		bge.s	.groundFaster2
		move.w	d3,d2
	.groundFaster2:
		asr.w	d2
		bpl.s	.left
		bset	#Status_ObjOrienX,status(a0)
		bset	#rbFacingX,render_flags(a0)

	.left:
		move.w	d2,x_vel(a0)
		move.w	#-$200,y_vel(a0)
		addq.b	#2,routine(a0)
		st		(Level_trigger_array+$10).w	; set trigger
		sfx		sfx_Thump,1
	
	.falling:
		move.b	#4,mapping_frame(a0)	; oh *shit* they hit me
		jsr		ObjectFall
		jsr		DisplaySprite
		move.l	#.bounce,jump(a0)
		clr.b	anim_frame(a0)
		clr.b	anim_frame_timer(a0)
		jmp		ObjHitFloor_DoRoutine

	.bounce:
		move.w	#-$400,y_vel(a0)
		move.b	#6,routine(a0)
		sfx		sfx_Thump,1
	.bounced:
		move.l	#AniRaw_FlareSpin,aniraw(a0)	; owww
		jsr		ObjectFall
		out_of_yrange.s	.fallOff

	.display:
		jsr	(Animate_Raw).l
		jmp	DisplaySprite

	.fallOff:
		sfx	sfx_Splash
		move.w	#$60,wait(a0)
		move.l	#Obj_Wait,address(a0)
		move.l	#.delete,jump(a0)
		rts

.chkdel:
		move.w	respawn_addr(a0),d0
		beq.s	.delete
		movea.w	d0,a2
		bclr	#7,(a2)
	.delete:
		lea	(Pal_TTPZ).l,a1
		lea	(Normal_palette_line_2).w,a2
		jsr	(PalLoad_Line16).l
		jmp		DeleteObject

; ---------------------------------------------------------------------------
DPLCPtr_FlareTheAlligator:
		dc.l	ArtUnc_FlareTheAlligator>>1
		dc.l	PLC_FlareTheAlligator

; ---------------------------------------------------------------------------
AniRaw_FlareVibe:
		dc.b	7, 1, 2, 3, 2, arfEnd

AniRaw_FlareWait:
		dc.b	7, 5, 6, 5, 6, arfEnd
		even

AniRaw_FlareSpin:
		dc.b	3, 7, 8, 9, 10, 11, 12, arfEnd
		even

; ---------------------------------------------------------------------------
Map_FlareTheAlligator:	binclude	"Objects/Background Characters/Object Data/Map - Flare the Alligator.bin"
PLC_FlareTheAlligator:	binclude	"Objects/Background Characters/Object Data/PLC - Flare the Alligator.bin"
