; ---------------------------------------------------------------------------
; Object $1A - Collapsing platform, pulled from S3K and adapted to be zone-adaptable
; ---------------------------------------------------------------------------
; Variables:
ledge_data1 = $30	; Heightmap...?
ledge_timedelay = $38		; time between touching the ledge and it collapsing
ledge_collapse_flag = $3A		; collapse flag
ledge_data2 = $3C	; Used with ledge_data1. No clue what this actually does.
; ---------------------------------------------------------------------------

CollapsingPlatformData:
	rept 4	; GHZ
		dc.l Map_GHZCollapsingPlatform
		dc.l GHZLedge_Data1, GHZLedge_Data2
		dc.w make_art_tile(ArtTile_GHZCollapsingLedge,0,0)
		dc.b $32, $1C
	endr
	rept (ZoneCount-1)*4 ; everything else
		dc.l Map_AIZCollapsingPlatform
		dc.l AIZLedge_Data1, AIZLedge_Data2
		dc.w make_art_tile(ArtTile_LevelArt,2,0)
		dc.b $3C, $20
	endr
	zonewarning	CollapsingPlatformData,(4*4*4)	; 4 bytes per longword, 4 acts per zone, 4 longwords' worth of data
; ---------------------------------------------------------------------------

Obj_CollapsingPlatform:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#6,d0
		lsl.w	#4,d0
		lea	CollapsingPlatformData(pc),a2
		lea		(a2,d0.w),a2

		move.l	(a2)+,mappings(a0)
		move.l	(a2)+,ledge_data1(a0)
		move.l	(a2)+,ledge_data2(a0)
		move.w	(a2)+,art_tile(a0)
		move.b	(a2)+,width_pixels(a0)
		move.b	(a2)+,height_pixels(a0)
		ori.b	#4,render_flags(a0)
		move.w	#$280,priority(a0)
		move.b	#7,ledge_timedelay(a0)
		move.b	subtype(a0),mapping_frame(a0)
		ori.b	#$80,status(a0)
		move.l	#loc_20594,(a0)

loc_20594:
		tst.b	ledge_collapse_flag(a0)
		beq.s	loc_205A6
		tst.b	ledge_timedelay(a0)
		beq.w	loc_20C24
		subq.b	#1,ledge_timedelay(a0)

loc_205A6:
		move.b	status(a0),d0
		andi.b	#$18,d0
		beq.s	sub_205B6
		move.b	#1,ledge_collapse_flag(a0)

; =============== S U B R O U T I N E =======================================


sub_205B6:
		moveq	#0,d1
		move.b	width_pixels(a0),d1
		movea.l	ledge_data2(a0),a2
		move.w	x_pos(a0),d4
		jsr	(SolidObjectTopSloped2).l
		jmp		Sprite_OnScreen_Test
; End of function sub_205B6

; ---------------------------------------------------------------------------

loc_205CE:
		subq.b	#1,ledge_timedelay(a0)
		bne.s	loc_205DA
		move.l	#loc_20620,(a0)

loc_205DA:
		jmp		Draw_Sprite
; ---------------------------------------------------------------------------

loc_205DE:
		bsr.w	sub_205B6
		subq.b	#1,ledge_timedelay(a0)
		bne.s	locret_2061E
		move.l	#loc_20620,(a0)
		lea	(Player_1).w,a1
		moveq	#3,d6
		bsr.s	sub_205FC
		lea	(Player_2).w,a1
		moveq	#4,d6

; =============== S U B R O U T I N E =======================================


sub_205FC:
		btst	d6,status(a0)
		beq.s	locret_2061E
		bclr	d6,status(a0)
		bclr	#Status_OnObj,status(a1)
		bclr	#Status_Push,status(a1)
		bset	#Status_InAir,status(a1)
		move.b	#id_Run,anim(a1)	; wait, so this sets their... animation? to running? huh.

locret_2061E:
		rts
; End of function sub_205FC

; ---------------------------------------------------------------------------

loc_20620:
		tst.b	render_flags(a0)
		jpl		Delete_Current_Sprite
		jsr		MoveSprite
		jmp		Draw_Sprite
; ---------------------------------------------------------------------------

loc_20C24:
		move.l	#loc_205DE,(a0)
		move.l	#loc_205CE,d4
		addq.b	#2,$22(a0)
		movea.l	ledge_data1(a0),a4

loc_20C38:
		moveq	#0,d0
		move.b	$22(a0),d0
		add.w	d0,d0
		movea.l	$C(a0),a3
		adda.w	(a3,d0.w),a3
		move.w	(a3)+,d1
		subq.w	#1,d1
		bset	#5,4(a0)
		move.b	4(a0),d5
		movea.l	a0,a1
		bra.s	loc_20C64
; ---------------------------------------------------------------------------

loc_20C5A:
		jsr		Create_New_Sprite3
		bne.s	loc_20C98
		addq.w	#6,a3
		move.l	d4,(a1)

loc_20C64:
		move.l	a3,$C(a1)
		move.b	d5,4(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	$A(a0),$A(a1)
		move.w	8(a0),8(a1)
		move.b	7(a0),7(a1)
		move.b	6(a0),6(a1)
		move.b	(a4)+,ledge_timedelay(a1)
		dbf	d1,loc_20C5A

loc_20C98:
		jsr	(Draw_Sprite).l
		move.w	respawn_addr(a0),d0
		beq.s	loc_20CAE
		movea.w	d0,a1
		bclr	#7,(a1)
		clr.w	respawn_addr(a0)

loc_20CAE:
		sfx		sfx_WallSmash,1
; ---------------------------------------------------------------------------
; AIZ ledge data
AIZLedge_Data1:
		dc.b  $30, $2C, $28, $24, $20, $1C, $2E, $2A, $26, $22, $1E, $1A, $2C, $28, $24, $20, $1C, $18, $2A, $26
		dc.b  $22, $1E, $1A, $16, $28, $24, $20, $1C, $18, $14
AIZLedge_Data2:
		dc.b  $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F
		dc.b  $1F, $1F, $1E, $1E, $1D, $1D, $1C, $1C, $1B, $1B, $1A, $1A, $19, $19, $18, $18, $17, $17, $16, $16
		dc.b  $15, $15, $14, $14, $13, $13, $12, $12, $11, $11, $10, $10,  $F,  $F,  $E,  $E,  $E,  $E,  $E,  $E
		dc.b   $E,  $E,  $E,  $E
Map_AIZCollapsingPlatform: binclude	"Objects/Collapsing Platform/Object Data/Map - Collapsing Platform (AIZ).bin"
		even
; GHZ ledge data
GHZLedge_Data1:
		dc.b $1C, $18, $14, $10, $1A, $16, $12,	$E, $A,	6, $18,	$14, $10, $C, 8, 4
		dc.b $16, $12, $E, $A, 6, 2, $14, $10, $C, 0
GHZLedge_Data2:
		dc.b $20,$20,$20,$20,$20,$20,$20,$20,$21,$21,$22,$22,$23,$23,$24,$24
		dc.b $25,$25,$26,$26,$27,$27,$28,$28,$29,$29,$2A,$2A,$2B,$2B,$2C,$2C; 16
		dc.b $2D,$2D,$2E,$2E,$2F,$2F,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30; 32
		dc.b $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30; 48    ;dummy values, to prevent accidentally going out of bounds.
Map_GHZCollapsingPlatform: binclude	"Objects/Collapsing Platform/Object Data/Map - Collapsing Platform (GHZ).bin"
		even