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

AniPLC_GHZ:	zoneanimstart
	; flower stalk
	zoneanimdecl 4, (Art_GhzFlowerStalk>>1), $358, 1, 4
	dc.b	0
	even
	; waterfall
	zoneanimdecl 5, (Art_GhzWater>>1), $378, 1, 8
	dc.b	0
	dc.b	1
	even
	; big flower (sunflower)
	zoneanimdecl $F, (Art_GhzFlower1>>1), $35C, 2, 16
	dc.b	0
	dc.b	16
	even
	; small flower
	zoneanimdecl -1, (Art_GhzFlower2>>1), $36C, 4, 12
	dc.b	0, $7F
	dc.b	12, 7
	dc.b	24, $7F
	dc.b	12, 7
	zoneanimend
