TTPZ_DoAniPLC:
	subq.b	#1,(Anim_Counters+4).w
	jpl		AnimateTiles_DoAniPLC		;bpl.s	loc_s1_1C1AE
	move	#$2700,sr
	lea	(VDP_data_port).l,a6
	move.b	#1,(Anim_Counters+4).w
	moveq	#0,d0
	move.b	(Anim_Counters+1).w,d0
	subq.b	#1,d0
	andi.b	#3,d0
	lea	(Art_TTPZPoison2).l,a4 ; load lava patterns
	ror.w	#7,d0
	adda.w	d0,a4
	move.l	#vdpComm(tiles_to_bytes($32D),VRAM,WRITE),(VDP_control_port).l
	moveq	#0,d3
	move.b	(Anim_Counters+5).w,d3
	addq.b	#1,(Anim_Counters+5).w
	move.b	(Oscillating_Numbers+$A).w,d3
	move.w	#3,d2

loc_s1_1C188:
	move.w	d3,d0
	add.w	d0,d0
	andi.w	#$1E,d0
	lea	(AniArt_TTPZextra).l,a3
	move.w	(a3,d0.w),d0
	lea	(a3,d0.w),a3
	movea.l	a4,a1
	move.w	#$1F,d1
	jsr	(a3)
	addq.w	#4,d3
	dbf	d2,loc_s1_1C188
	move	#$2300,sr
	jmp		AnimateTiles_DoAniPLC
	;rts
; ===========================================================================
; ---------------------------------------------------------------------------
; Animated pattern routine - more Marble Zone
; ---------------------------------------------------------------------------
AniArt_TTPZextra:	offsetTable
	offsetTableEntry.w loc_s1_1C3EE
	offsetTableEntry.w loc_s1_1C3FA
	offsetTableEntry.w loc_s1_1C410
	offsetTableEntry.w loc_s1_1C41E
	offsetTableEntry.w loc_s1_1C434
	offsetTableEntry.w loc_s1_1C442
	offsetTableEntry.w loc_s1_1C458
	offsetTableEntry.w loc_s1_1C466
	offsetTableEntry.w loc_s1_1C47C
	offsetTableEntry.w loc_s1_1C48A
	offsetTableEntry.w loc_s1_1C4A0
	offsetTableEntry.w loc_s1_1C4AE
	offsetTableEntry.w loc_s1_1C4C4
	offsetTableEntry.w loc_s1_1C4D2
	offsetTableEntry.w loc_s1_1C4E8
	offsetTableEntry.w loc_s1_1C4FA
; ===========================================================================

loc_s1_1C3EE:				; XREF: AniArt_MZextra
	move.l	(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C3EE
	rts	
; ===========================================================================

loc_s1_1C3FA:				; XREF: AniArt_MZextra
	move.l	2(a1),d0
	move.b	1(a1),d0
	ror.l	#8,d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C3FA
	rts	
; ===========================================================================

loc_s1_1C410:				; XREF: AniArt_MZextra
	move.l	2(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C410
	rts	
; ===========================================================================

loc_s1_1C41E:				; XREF: AniArt_MZextra
	move.l	4(a1),d0
	move.b	3(a1),d0
	ror.l	#8,d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C41E
	rts	
; ===========================================================================

loc_s1_1C434:				; XREF: AniArt_MZextra
	move.l	4(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C434
	rts	
; ===========================================================================

loc_s1_1C442:				; XREF: AniArt_MZextra
	move.l	6(a1),d0
	move.b	5(a1),d0
	ror.l	#8,d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C442
	rts	
; ===========================================================================

loc_s1_1C458:				; XREF: AniArt_MZextra
	move.l	6(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C458
	rts	
; ===========================================================================

loc_s1_1C466:				; XREF: AniArt_MZextra
	move.l	8(a1),d0
	move.b	7(a1),d0
	ror.l	#8,d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C466
	rts	
; ===========================================================================

loc_s1_1C47C:				; XREF: AniArt_MZextra
	move.l	8(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C47C
	rts	
; ===========================================================================

loc_s1_1C48A:				; XREF: AniArt_MZextra
	move.l	$A(a1),d0
	move.b	9(a1),d0
	ror.l	#8,d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C48A
	rts	
; ===========================================================================

loc_s1_1C4A0:				; XREF: AniArt_MZextra
	move.l	$A(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C4A0
	rts	
; ===========================================================================

loc_s1_1C4AE:				; XREF: AniArt_MZextra
	move.l	$C(a1),d0
	move.b	$B(a1),d0
	ror.l	#8,d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C4AE
	rts	
; ===========================================================================

loc_s1_1C4C4:				; XREF: AniArt_MZextra
	move.l	$C(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C4C4
	rts	
; ===========================================================================

loc_s1_1C4D2:				; XREF: AniArt_MZextra
	move.l	$C(a1),d0
	rol.l	#8,d0
	move.b	0(a1),d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C4D2
	rts	
; ===========================================================================

loc_s1_1C4E8:				; XREF: AniArt_MZextra
	move.w	$E(a1),(a6)
	move.w	0(a1),(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C4E8
	rts	
; ===========================================================================

loc_s1_1C4FA:				; XREF: AniArt_MZextra
	move.l	0(a1),d0
	move.b	$F(a1),d0
	ror.l	#8,d0
	move.l	d0,(a6)
	lea	$10(a1),a1
	dbf	d1,loc_s1_1C4FA
	rts

; ===========================================================================
; ZONE ANIMATION SCRIPTS
;
; The AnimateTiles_DoAniPLC subroutine uses these scripts to reload certain tiles,
; thus animating them. All the relevant art must be uncompressed, because
; otherwise the subroutine would spend so much time waiting for the art to be
; decompressed that the VBLANK window would close before all the animating was done.

;    zoneanimdecl -1, ArtUnc_Flowers1, ArtTile_ArtUnc_Flowers1, 6, 2
;	-1						Global frame duration. If -1, then each frame will use its own duration, instead

;	ArtUnc_Flowers1			Source address
;	ArtTile_ArtUnc_Flowers1	Destination VRAM address
;	6						Number of frames
;	2						Number of tiles to load into VRAM for each frame

;    dc.b   0,$7F				Start of the script proper
;	0						Tile ID of first tile in ArtUnc_Flowers1 to transfer
;	$7F						Frame duration. Only here if global duration is -1
; ===========================================================================

AniPLC_TTPZ:	zoneanimstart
	;poison surface
	zoneanimdecl -1, (Art_TTPZPoison1>>1), $33D, 3, 8
	dc.b   0,$13
	dc.b   8,$13
	dc.b  16,$13
	zoneanimend