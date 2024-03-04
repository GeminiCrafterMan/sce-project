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
		dc.l	Obj_MonkeyBarHanger
		dc.l	Obj_ZoneSpecificDecoration1
		dc.l	Obj_ZoneSpecificDecoration2
		dc.l	Obj_ZoneSpecificDecoration3
		dc.l	Obj_ZoneSpecificDecoration4
		dc.l	Obj_ZoneSpecificDecoration5
		dc.l	Obj_ZoneSpecificDecoration6
; ---------------------------------------------------------------------------

Obj_BridgeStake:
		move.l	#Map_TensionBridge,mappings(a0)
		move.w	#make_art_tile(ArtTile_Bridge,2,0),art_tile(a0)
		move.b	#1,mapping_frame(a0)
		move.w	#bytes_to_word(8,16),height_pixels(a0)
		move.w	#$80,priority(a0)
		ori.b	#4,render_flags(a0)
		jmp		DisplaySprite	; Do I really have to?
; ---------------------------------------------------------------------------

Obj_MonkeyBarHanger:
		move.l	#Map_MonkeyBars,mappings(a0)
		move.w	#make_art_tile(ArtTile_PurpleRock,0,0),art_tile(a0)
		move.b	#$F,mapping_frame(a0)
		move.w	#bytes_to_word(40,16),height_pixels(a0)
		move.w	#$80,priority(a0)
		ori.b	#4,render_flags(a0)
		jmp		DisplaySprite	; Do I really have to?
; ---------------------------------------------------------------------------

Obj_Waterfall:
		moveq	#0,d0
		move.l	#Map_SSLZWaterfall,mappings(a0)
		cmpi.b	#z_Intro,(Current_zone).w	; just check for the Intro zone, not like Techno Tower will use waterfalls
		bne.s	.notGHZ
		move.l	#Map_GHZWaterfall,mappings(a0)
	.notGHZ:
		move.w	#make_art_tile(ArtTile_SSLZWaterfall,0,0),art_tile(a0)
		ori.b	#4,render_flags(a0)
		move.w	#bytes_to_word($70,$20),height_pixels(a0)
		move.w	#0,priority(a0)
		move.b	#$80,y_radius(a0)
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
		jmp		DisplaySprite
; ---------------------------------------------------------------------------

Obj_Pylon:
		move.l	#Map_Pylon,mappings(a0)
		move.w	#make_art_tile(ArtTile_PurpleRock+12,0,0),art_tile(a0)
		move.w	#bytes_to_word($60,$10),height_pixels(a0)
		move.l	#.display,address(a0)

	.display:
		move.l	(Camera_X_pos).w,d1
		add.l	d1,d1
		swap	d1
		neg.w	d1
		move.w	d1,x_pos(a0)
		move.l	(Camera_Y_pos).w,d1
		add.l	d1,d1
		swap	d1
		andi.w	#$3F,d1
		neg.w	d1
		addi.w	#$100,d1
		move.w	d1,y_pos(a0)
		jmp		DisplaySprite
; ---------------------------------------------------------------------------

Obj_TTPZBottom2:
		move.b	#1,mapping_frame(a0)
		move.w	#$200,priority(a0)
		bra.s	Obj_TTPZBottom_Common
Obj_TTPZBottom1:
		move.w	#$80,priority(a0)
Obj_TTPZBottom_Common:
		move.l	#Map_TTPZDecor,mappings(a0)
		move.w	#make_art_tile(ArtTile_LevelArt,0,0),art_tile(a0)
		move.w	#bytes_to_word(8,32),height_pixels(a0)
		ori.b	#4,render_flags(a0)
		jmp		DisplaySprite	; Do I really have to?
; ---------------------------------------------------------------------------

Obj_GHZFire2:
		move.b	#1,mapping_frame(a0)
Obj_GHZFire1:
		move.w	#$200,priority(a0)
Obj_GHZFire_Common:
		move.l	#Map_GHZFire,mappings(a0)
		move.w	#$3A0,art_tile(a0)
		move.w	#bytes_to_word(24,16),height_pixels(a0)
		ori.b	#4,render_flags(a0)
		jmp		DisplaySprite
; ---------------------------------------------------------------------------

Obj_ZoneSpecificDecoration1:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	Obj_GHZFire1		; GHZ
	endr
	rept 4
		dc.l	DeleteObject		; SSLZ
	endr
	rept 4
		dc.l	Obj_TTPZBottom1		; TTPZ
	endr
	rept 4
		dc.l	DeleteObject		; CCZ
	endr
	rept 4
		dc.l	DeleteObject		; MMZ
	endr
	rept 4
		dc.l	DeleteObject		; DEZ
	endr
	rept 4
		dc.l	DeleteObject		; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_ZoneSpecificDecoration2:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	Obj_GHZFire2		; GHZ
	endr
	rept 4
		dc.l	DeleteObject		; SSLZ
	endr
	rept 4
		dc.l	Obj_TTPZBottom2		; TTPZ
	endr
	rept 4
		dc.l	DeleteObject		; CCZ
	endr
	rept 4
		dc.l	DeleteObject		; MMZ
	endr
	rept 4
		dc.l	DeleteObject		; DEZ
	endr
	rept 4
		dc.l	DeleteObject		; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_ZoneSpecificDecoration3:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	DeleteObject		; GHZ
	endr
	rept 4
		dc.l	DeleteObject		; SSLZ
	endr
	rept 4
		dc.l	DeleteObject		; TTPZ
	endr
	rept 4
		dc.l	DeleteObject		; CCZ
	endr
	rept 4
		dc.l	DeleteObject		; MMZ
	endr
	rept 4
		dc.l	DeleteObject		; DEZ
	endr
	rept 4
		dc.l	DeleteObject		; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_ZoneSpecificDecoration4:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	DeleteObject		; GHZ
	endr
	rept 4
		dc.l	DeleteObject		; SSLZ
	endr
	rept 4
		dc.l	DeleteObject		; TTPZ
	endr
	rept 4
		dc.l	DeleteObject		; CCZ
	endr
	rept 4
		dc.l	DeleteObject		; MMZ
	endr
	rept 4
		dc.l	DeleteObject		; DEZ
	endr
	rept 4
		dc.l	DeleteObject		; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_ZoneSpecificDecoration5:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	DeleteObject		; GHZ
	endr
	rept 4
		dc.l	DeleteObject		; SSLZ
	endr
	rept 4
		dc.l	DeleteObject		; TTPZ
	endr
	rept 4
		dc.l	DeleteObject		; CCZ
	endr
	rept 4
		dc.l	DeleteObject		; MMZ
	endr
	rept 4
		dc.l	DeleteObject		; DEZ
	endr
	rept 4
		dc.l	DeleteObject		; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_ZoneSpecificDecoration6:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	DeleteObject		; GHZ
	endr
	rept 4
		dc.l	DeleteObject		; SSLZ
	endr
	rept 4
		dc.l	DeleteObject		; TTPZ
	endr
	rept 4
		dc.l	DeleteObject		; CCZ
	endr
	rept 4
		dc.l	DeleteObject		; MMZ
	endr
	rept 4
		dc.l	DeleteObject		; DEZ
	endr
	rept 4
		dc.l	DeleteObject		; TTSZ
	endr
	zonewarning	.index,(4*4)

; ---------------------------------------------------------------------------
; Mappings for foreground objects
; ---------------------------------------------------------------------------
Map_GHZFire:			binclude	"Objects/Decoration/Object Data/Map - GHZ flames.bin"
Map_GHZWaterfall:		binclude	"Objects/Decoration/Object Data/Map - GHZ Waterfall.bin"
Map_SSLZWaterfall:		binclude	"Objects/Decoration/Object Data/Map - SSLZ Waterfall.bin"
Map_TTPZDecor:			binclude	"Objects/Decoration/Object Data/Map - TTPZ Decorations.bin"
Map_Pylon:				binclude	"Objects/Decoration/Object Data/Map - Pylon.bin"
