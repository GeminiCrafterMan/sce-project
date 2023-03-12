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

AniPLC_TechnoTower:	zoneanimstart
	; Foreground fans
	zoneanimdecl 3, (Art_TechnoTowerFans>>1), $11F, 2, 4
	dc.b	0
	dc.b	4
	even
	; Background turbine
	zoneanimdecl 1, (Art_TechnoTowerTurbine>>1), $26E, 4, 32
	dc.b	0
	dc.b	32
	dc.b	64
	dc.b	96
	even
	zoneanimend
