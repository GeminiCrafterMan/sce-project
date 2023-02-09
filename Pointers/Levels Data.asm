; ===========================================================================
; Levels Data
; ===========================================================================

		;		1st 8x8 data		1st 16x16 data		1st 128x128 data	palette
LevelLoadBlock:
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ1
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ2
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ3
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ4
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ1
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ2
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ3
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ4
		levartptrs SSLZ_8x8_KosM, SSLZ_16x16_Unc, SSLZ_128x128_Kos, palid_SSLZ		; SSLZ1
		levartptrs SSLZ_8x8_KosM, SSLZ_16x16_Unc, SSLZ_128x128_Kos, palid_SSLZ		; SSLZ2
		levartptrs SSLZ_8x8_KosM, SSLZ_16x16_Unc, SSLZ_128x128_Kos, palid_SSLZ		; SSLZ3
		levartptrs SSLZ_8x8_KosM, SSLZ_16x16_Unc, SSLZ_128x128_Kos, palid_SSLZ		; SSLZ4
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ1
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ2
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ3
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ4

		zonewarning LevelLoadBlock,(12*4)

; ===========================================================================
; Levels Pointer Data
; ===========================================================================

LevelLoadPointer:

; DEZ1
		dc.l AnPal_DEZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null					; Animate Palette, Resize, WaterResize, AfterBoss
		dc.l DEZ1_ScreenInit, DEZ1_BackgroundInit, DEZ1_ScreenEvent, DEZ1_BackgroundEvent	; ScreenInit, BackgroundInit, ScreenEvent, BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_DEZ											; Animate tiles main code, Animate tiles PLC scripts

; DEZ2
		dc.l AnPal_DEZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l DEZ1_ScreenInit, DEZ1_BackgroundInit, DEZ1_ScreenEvent, DEZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_DEZ

; DEZ3
		dc.l AnPal_DEZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l DEZ1_ScreenInit, DEZ1_BackgroundInit, DEZ1_ScreenEvent, DEZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_DEZ

; DEZ4
		dc.l AnPal_DEZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l DEZ1_ScreenInit, DEZ1_BackgroundInit, DEZ1_ScreenEvent, DEZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_DEZ

; GHZ1
		dc.l AnPal_GHZ, DLE_GHZ1, LevelPointer_Null, LevelPointer_Null					; Animate Palette, Resize, WaterResize, AfterBoss
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent	; ScreenInit, BackgroundInit, ScreenEvent, BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ											; Animate tiles main code, Animate tiles PLC scripts

; GHZ2
		dc.l AnPal_GHZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ

; GHZ3
		dc.l AnPal_GHZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ

; GHZ4
		dc.l AnPal_GHZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ

; SSLZ1
		dc.l LevelPointer_Null, DLE_SSLZ, LevelPointer_Null, LevelPointer_Null					; Animate Palette, Resize, WaterResize, AfterBoss
		dc.l SSLZ1_ScreenInit, SSLZ1_BackgroundInit, SSLZ1_ScreenEvent, SSLZ1_BackgroundEvent	; ScreenInit, BackgroundInit, ScreenEvent, BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null											; Animate tiles main code, Animate tiles PLC scripts

; SSLZ2
		dc.l LevelPointer_Null, DLE_SSLZ, LevelPointer_Null, LevelPointer_Null
		dc.l SSLZ1_ScreenInit, SSLZ1_BackgroundInit, SSLZ1_ScreenEvent, SSLZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

; SSLZ3
		dc.l LevelPointer_Null, DLE_SSLZ, LevelPointer_Null, LevelPointer_Null
		dc.l SSLZ1_ScreenInit, SSLZ1_BackgroundInit, SSLZ1_ScreenEvent, SSLZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

; SSLZ4
		dc.l LevelPointer_Null, DLE_SSLZ, LevelPointer_Null, LevelPointer_Null
		dc.l SSLZ1_ScreenInit, SSLZ1_BackgroundInit, SSLZ1_ScreenEvent, SSLZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

; WZ1
		dc.l AnPal_WZ, DLE_WZ, LevelPointer_Null, LevelPointer_Null					; Animate Palette, Resize, WaterResize, AfterBoss
		dc.l WZ1_ScreenInit, WZ1_BackgroundInit, WZ1_ScreenEvent, WZ1_BackgroundEvent	; ScreenInit, BackgroundInit, ScreenEvent, BackgroundEvent
		dc.l WZ_DoAniPLC, AniPLC_WZ											; Animate tiles main code, Animate tiles PLC scripts

; WZ2
		dc.l AnPal_WZ, DLE_WZ, LevelPointer_Null, LevelPointer_Null
		dc.l WZ1_ScreenInit, WZ1_BackgroundInit, WZ1_ScreenEvent, WZ1_BackgroundEvent
		dc.l WZ_DoAniPLC, AniPLC_WZ

; WZ3
		dc.l AnPal_WZ, DLE_WZ, LevelPointer_Null, LevelPointer_Null
		dc.l WZ1_ScreenInit, WZ1_BackgroundInit, WZ1_ScreenEvent, WZ1_BackgroundEvent
		dc.l WZ_DoAniPLC, AniPLC_WZ

; WZ4
		dc.l AnPal_WZ, DLE_WZ, LevelPointer_Null, LevelPointer_Null
		dc.l WZ1_ScreenInit, WZ1_BackgroundInit, WZ1_ScreenEvent, WZ1_BackgroundEvent
		dc.l WZ_DoAniPLC, AniPLC_WZ

		zonewarning LevelLoadPointer,(40*4)

; ===========================================================================
; Collision index pointers
; ===========================================================================

SolidIndexes:
		dc.l DEZ1_Solid		; DEZ1
		dc.l DEZ1_Solid		; DEZ2
		dc.l DEZ1_Solid		; DEZ3
		dc.l DEZ1_Solid		; DEZ4
		dc.l GHZ1_Solid		; GHZ1
		dc.l GHZ1_Solid		; GHZ2
		dc.l GHZ1_Solid		; GHZ3
		dc.l GHZ1_Solid		; GHZ4
		dc.l SSLZ1_Solid		; SSLZ1
		dc.l SSLZ1_Solid		; SSLZ2
		dc.l SSLZ1_Solid		; SSLZ3
		dc.l SSLZ1_Solid		; SSLZ4
		dc.l WZ1_Solid		; WZ1
		dc.l WZ1_Solid		; WZ2
		dc.l WZ1_Solid		; WZ3
		dc.l WZ1_Solid		; WZ4

		zonewarning SolidIndexes,(4*4)

; ===========================================================================
; Level layout index
; ===========================================================================

LevelPtrs:
		dc.l DEZ1_Layout		; DEZ1
		dc.l DEZ1_Layout		; DEZ2
		dc.l DEZ1_Layout		; DEZ3
		dc.l DEZ1_Layout		; DEZ4
		dc.l GHZ1_Layout		; GHZ1
		dc.l GHZ1_Layout		; GHZ2
		dc.l GHZ1_Layout		; GHZ3
		dc.l GHZ1_Layout		; GHZ4
		dc.l SSLZ1_Layout		; SSLZ1
		dc.l SSLZ1_Layout		; SSLZ2
		dc.l SSLZ1_Layout		; SSLZ3
		dc.l SSLZ1_Layout		; SSLZ4
		dc.l WZ1_Layout		; WZ1
		dc.l WZ1_Layout		; WZ2
		dc.l WZ1_Layout		; WZ3
		dc.l WZ1_Layout		; WZ4

		zonewarning LevelPtrs,(4*4)

; ===========================================================================
; Sprite locations index
; ===========================================================================

SpriteLocPtrs:
		dc.l DEZ1_Sprites		; DEZ1
		dc.l DEZ1_Sprites		; DEZ2
		dc.l DEZ1_Sprites		; DEZ3
		dc.l DEZ1_Sprites		; DEZ4
		dc.l GHZ1_Sprites		; GHZ1
		dc.l GHZ1_Sprites		; GHZ2
		dc.l GHZ1_Sprites		; GHZ3
		dc.l GHZ1_Sprites		; GHZ4
		dc.l SSLZ1_Sprites		; SSLZ1
		dc.l SSLZ1_Sprites		; SSLZ2
		dc.l SSLZ1_Sprites		; SSLZ3
		dc.l SSLZ1_Sprites		; SSLZ4
		dc.l WZ1_Sprites		; WZ1
		dc.l WZ1_Sprites		; WZ2
		dc.l WZ1_Sprites		; WZ3
		dc.l WZ1_Sprites		; WZ4

		zonewarning SpriteLocPtrs,(4*4)

; ===========================================================================
; Ring locations index
; ===========================================================================

RingLocPtrs:
		dc.l DEZ1_Rings		; DEZ1
		dc.l DEZ1_Rings		; DEZ2
		dc.l DEZ1_Rings		; DEZ3
		dc.l DEZ1_Rings		; DEZ4
		dc.l GHZ1_Rings		; GHZ1
		dc.l GHZ1_Rings		; GHZ2
		dc.l GHZ1_Rings		; GHZ3
		dc.l GHZ1_Rings		; GHZ4
		dc.l SSLZ1_Rings		; SSLZ1
		dc.l SSLZ1_Rings		; SSLZ2
		dc.l SSLZ1_Rings		; SSLZ3
		dc.l SSLZ1_Rings		; SSLZ4
		dc.l WZ1_Rings		; WZ1
		dc.l WZ1_Rings		; WZ2
		dc.l WZ1_Rings		; WZ3
		dc.l WZ1_Rings		; WZ4

		zonewarning RingLocPtrs,(4*4)

; ===========================================================================
; Compressed level graphics - tile, primary patterns and block mappings
; ===========================================================================

DEZ_8x8_KosM:		binclude "Levels/DEZ/Tiles/Primary.bin"
	even
DEZ_16x16_Unc:		binclude "Levels/DEZ/Blocks/Primary.bin"
	even
DEZ_128x128_Kos:	binclude "Levels/DEZ/Chunks/Primary.bin"
	even

GHZ_8x8_KosM:		binclude "Levels/GHZ/Tiles/Primary.bin"
	even
GHZ_16x16_Unc:		binclude "Levels/GHZ/Blocks/Primary.bin"
	even
GHZ_128x128_Kos:	binclude "Levels/GHZ/Chunks/Primary.bin"
	even

SSLZ_8x8_KosM:		binclude "Levels/SSLZ/Tiles/Primary.bin"
	even
SSLZ_16x16_Unc:		binclude "Levels/SSLZ/Blocks/Primary.bin"
	even
SSLZ_128x128_Kos:	binclude "Levels/SSLZ/Chunks/Primary.bin"
	even

WZ_8x8_KosM:		binclude "Levels/WZ/Tiles/Primary.bin"
	even
WZ_16x16_Unc:		binclude "Levels/WZ/Blocks/Primary.bin"
	even
WZ_128x128_Kos:	binclude "Levels/WZ/Chunks/Primary.bin"
	even

; ===========================================================================
; Collision data
; ===========================================================================

S1AngleArray:			binclude "Misc Data/Collision/S1 Angle Map.bin"
	even
S1HeightMaps:			binclude "Misc Data/Collision/S1 Height Maps.bin"
	even
S1HeightMapsRot:		binclude "Misc Data/Collision/S1 Height Maps Rotated.bin"
	even
S2AngleArray:			binclude "Misc Data/Collision/S2 Angle Map.bin"
	even
S2HeightMaps:			binclude "Misc Data/Collision/S2 Height Maps.bin"
	even
S2HeightMapsRot:		binclude "Misc Data/Collision/S2 Height Maps Rotated.bin"
	even
S3KAngleArray:			binclude "Misc Data/Collision/S3K Angle Map.bin"
	even
S3KHeightMaps:			binclude "Misc Data/Collision/S3K Height Maps.bin"
	even
S3KHeightMapsRot:		binclude "Misc Data/Collision/S3K Height Maps Rotated.bin"
	even

; ===========================================================================
; Level collision data
; ===========================================================================

DEZ1_Solid:			binclude "Levels/DEZ/Collision/1.bin"
	even
GHZ1_Solid:			binclude "Levels/GHZ/Collision/1.bin"
	even
SSLZ1_Solid:			binclude "Levels/SSLZ/Collision/1.bin"
	even
WZ1_Solid:			binclude "Levels/WZ/Collision/1.bin"
	even

; ===========================================================================
; Level layout data
; ===========================================================================

		align $8000

DEZ1_Layout:		binclude "Levels/DEZ/Layout/1.bin"
	even
GHZ1_Layout:		binclude "Levels/GHZ/Layout/1.bin"
	even
SSLZ1_Layout:		binclude "Levels/SSLZ/Layout/1.bin"
	even
WZ1_Layout:		binclude "Levels/WZ/Layout/1.bin"
	even

; ===========================================================================
; Level object data
; ===========================================================================

	ObjectLayoutBoundary
DEZ1_Sprites:		binclude "Levels/DEZ/Object Pos/1.bin"
	ObjectLayoutBoundary
GHZ1_Sprites:		binclude "Levels/GHZ/Object Pos/1.bin"
	ObjectLayoutBoundary
SSLZ1_Sprites:		binclude "Levels/SSLZ/Object Pos/1.bin"
	ObjectLayoutBoundary
WZ1_Sprites:		binclude "Levels/WZ/Object Pos/1.bin"
	ObjectLayoutBoundary
	even

; ===========================================================================
; Level ring data
; ===========================================================================

	RingLayoutBoundary
DEZ1_Rings:			binclude "Levels/DEZ/Ring Pos/1.bin"
	RingLayoutBoundary
GHZ1_Rings:			binclude "Levels/GHZ/Ring Pos/1.bin"
	RingLayoutBoundary
SSLZ1_Rings:		binclude "Levels/SSLZ/Ring Pos/1.bin"
	RingLayoutBoundary
WZ1_Rings:		binclude "Levels/WZ/Ring Pos/1.bin"
	RingLayoutBoundary
	even
