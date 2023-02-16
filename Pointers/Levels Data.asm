; ===========================================================================
; Levels Data
; ===========================================================================

		;		1st 8x8 data		1st 16x16 data		1st 128x128 data	palette
LevelLoadBlock:
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ1
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ2
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ3
		levartptrs GHZ_8x8_KosM, GHZ_16x16_Unc, GHZ_128x128_Kos, palid_GHZ		; GHZ4
		levartptrs SSLZ1_8x8_KosM, SSLZ1_16x16_Unc, SSLZ1_128x128_Kos, palid_SSLZ1		; SSLZ1
		levartptrs SSLZ2_8x8_KosM, SSLZ2_16x16_Unc, SSLZ2_128x128_Kos, palid_SSLZ2		; SSLZ2
		levartptrs SSLZ1_8x8_KosM, SSLZ1_16x16_Unc, SSLZ1_128x128_Kos, palid_SSLZ3		; SSLZ3
		levartptrs SSLZ1_8x8_KosM, SSLZ1_16x16_Unc, SSLZ1_128x128_Kos, palid_SSLZ1		; SSLZ4
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ1
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ2
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ3
		levartptrs WZ_8x8_KosM, WZ_16x16_Unc, WZ_128x128_Kos, palid_WZ		; WZ4
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ1
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ2
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ3
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ4
		levartptrs TTZ_8x8_KosM, TTZ_16x16_Unc, TTZ_128x128_Kos, palid_TTZ		; TTZ1
		levartptrs TTZ_8x8_KosM, TTZ_16x16_Unc, TTZ_128x128_Kos, palid_TTZ		; TTZ2
		levartptrs TTZ_8x8_KosM, TTZ_16x16_Unc, TTZ_128x128_Kos, palid_TTZ		; TTZ3
		levartptrs TTZ_8x8_KosM, TTZ_16x16_Unc, TTZ_128x128_Kos, palid_TTZ		; TTZ4

		zonewarning LevelLoadBlock,(12*4)

; ===========================================================================
; Levels Pointer Data
; ===========================================================================

LevelLoadPointer:

; GHZ1
		dc.l AnPal_GHZ, DLE_GHZ1, LevelPointer_Null, LevelPointer_Null					; Animate Palette, Resize, WaterResize, AfterBoss
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent	; ScreenInit, BackgroundInit, ScreenEvent, BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ											; Animate tiles main code, Animate tiles PLC scripts
; GHZ2-4
	rept 3
		dc.l AnPal_GHZ, DLE_GHZ1, LevelPointer_Null, LevelPointer_Null					; Animate Palette, Resize, WaterResize, AfterBoss
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent	; ScreenInit, BackgroundInit, ScreenEvent, BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ											; Animate tiles main code, Animate tiles PLC scripts
	endr

; SSLZ1
		dc.l LevelPointer_Null, DLE_SSLZ1, LevelPointer_Null, LevelPointer_Null
		dc.l SSLZ_ScreenInit, SSLZ_BackgroundInit, SSLZ_ScreenEvent, SSLZ_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_SSLZ

; SSLZ2
		dc.l LevelPointer_Null, DLE_SSLZ2, LevelPointer_Null, LevelPointer_Null
		dc.l SSLZ_ScreenInit, SSLZ_BackgroundInit, SSLZ_ScreenEvent, SSLZ_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_SSLZ

; SSLZ3
		dc.l LevelPointer_Null, DLE_SSLZ3, LevelPointer_Null, LevelPointer_Null
		dc.l SSLZ_ScreenInit, SSLZ_BackgroundInit, SSLZ_ScreenEvent, SSLZ_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_SSLZ

; SSLZ4
		dc.l LevelPointer_Null, DLE_SSLZ1, LevelPointer_Null, LevelPointer_Null
		dc.l SSLZ_ScreenInit, SSLZ_BackgroundInit, SSLZ_ScreenEvent, SSLZ_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_SSLZ

; WZ1
		dc.l AnPal_WZ, DLE_WZ, LevelPointer_Null, LevelPointer_Null
		dc.l WZ1_ScreenInit, WZ1_BackgroundInit, WZ1_ScreenEvent, WZ1_BackgroundEvent
		dc.l WZ_DoAniPLC, AniPLC_WZ

; WZ2-4
	rept 3
		dc.l AnPal_WZ, DLE_WZ, LevelPointer_Null, LevelPointer_Null
		dc.l WZ1_ScreenInit, WZ1_BackgroundInit, WZ1_ScreenEvent, WZ1_BackgroundEvent
		dc.l WZ_DoAniPLC, AniPLC_WZ
	endr

; DEZ1
		dc.l AnPal_DEZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l DEZ1_ScreenInit, DEZ1_BackgroundInit, DEZ1_ScreenEvent, DEZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_DEZ

; DEZ2-4
	rept 3
		dc.l AnPal_DEZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l DEZ1_ScreenInit, DEZ1_BackgroundInit, DEZ1_ScreenEvent, DEZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_DEZ
	endr

; TTZ1
		dc.l LevelPointer_Null, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l TTZ1_ScreenInit, TTZ1_BackgroundInit, TTZ1_ScreenEvent, TTZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

; TTZ2-4
	rept 3
		dc.l LevelPointer_Null, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l TTZ1_ScreenInit, TTZ1_BackgroundInit, TTZ1_ScreenEvent, TTZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null
	endr

		zonewarning LevelLoadPointer,(40*4)

; ===========================================================================
; Collision index pointers
; ===========================================================================

SolidIndexes:
		dc.l GHZ1_Solid		; GHZ1
		dc.l GHZ1_Solid		; GHZ2
		dc.l GHZ1_Solid		; GHZ3
		dc.l GHZ1_Solid		; GHZ4
		dc.l SSLZ1_Solid		; SSLZ1
		dc.l SSLZ2_Solid		; SSLZ2
		dc.l SSLZ1_Solid		; SSLZ3
		dc.l SSLZ1_Solid		; SSLZ4
		dc.l WZ1_Solid		; WZ1
		dc.l WZ1_Solid		; WZ2
		dc.l WZ1_Solid		; WZ3
		dc.l WZ1_Solid		; WZ4
		dc.l DEZ1_Solid		; DEZ1
		dc.l DEZ1_Solid		; DEZ2
		dc.l DEZ1_Solid		; DEZ3
		dc.l DEZ1_Solid		; DEZ4
		dc.l TTZ1_Solid		; TTZ1
		dc.l TTZ1_Solid		; TTZ2
		dc.l TTZ1_Solid		; TTZ3
		dc.l TTZ1_Solid		; TTZ4

		zonewarning SolidIndexes,(4*4)

; ===========================================================================
; Level layout index
; ===========================================================================

LevelPtrs:
		dc.l GHZ1_Layout		; GHZ1
		dc.l GHZ1_Layout		; GHZ2
		dc.l GHZ1_Layout		; GHZ3
		dc.l GHZ1_Layout		; GHZ4
		dc.l SSLZ1_Layout		; SSLZ1
		dc.l SSLZ2_Layout		; SSLZ2
		dc.l SSLZ3_Layout		; SSLZ3
		dc.l SSLZ1_Layout		; SSLZ4
		dc.l WZ1_Layout		; WZ1
		dc.l WZ1_Layout		; WZ2
		dc.l WZ1_Layout		; WZ3
		dc.l WZ1_Layout		; WZ4
		dc.l DEZ1_Layout		; DEZ1
		dc.l DEZ1_Layout		; DEZ2
		dc.l DEZ1_Layout		; DEZ3
		dc.l DEZ1_Layout		; DEZ4
		dc.l TTZ1_Layout		; TTZ1
		dc.l TTZ1_Layout		; TTZ2
		dc.l TTZ1_Layout		; TTZ3
		dc.l TTZ1_Layout		; TTZ4

		zonewarning LevelPtrs,(4*4)

; ===========================================================================
; Sprite locations index
; ===========================================================================

SpriteLocPtrs:
		dc.l GHZ1_Sprites		; GHZ1
		dc.l GHZ1_Sprites		; GHZ2
		dc.l GHZ1_Sprites		; GHZ3
		dc.l GHZ1_Sprites		; GHZ4
		dc.l SSLZ1_Sprites		; SSLZ1
		dc.l SSLZ2_Sprites		; SSLZ2
		dc.l SSLZ3_Sprites		; SSLZ3
		dc.l SSLZ1_Sprites		; SSLZ4
		dc.l WZ1_Sprites		; WZ1
		dc.l WZ1_Sprites		; WZ2
		dc.l WZ1_Sprites		; WZ3
		dc.l WZ1_Sprites		; WZ4
		dc.l DEZ1_Sprites		; DEZ1
		dc.l DEZ1_Sprites		; DEZ2
		dc.l DEZ1_Sprites		; DEZ3
		dc.l DEZ1_Sprites		; DEZ4
		dc.l TTZ1_Sprites		; TTZ1
		dc.l TTZ1_Sprites		; TTZ2
		dc.l TTZ1_Sprites		; TTZ3
		dc.l TTZ1_Sprites		; TTZ4

		zonewarning SpriteLocPtrs,(4*4)

; ===========================================================================
; Ring locations index
; ===========================================================================

RingLocPtrs:
		dc.l GHZ1_Rings		; GHZ1
		dc.l GHZ1_Rings		; GHZ2
		dc.l GHZ1_Rings		; GHZ3
		dc.l GHZ1_Rings		; GHZ4
		dc.l SSLZ1_Rings		; SSLZ1
		dc.l SSLZ2_Rings		; SSLZ2
		dc.l SSLZ3_Rings		; SSLZ3
		dc.l SSLZ1_Rings		; SSLZ4
		dc.l WZ1_Rings		; WZ1
		dc.l WZ1_Rings		; WZ2
		dc.l WZ1_Rings		; WZ3
		dc.l WZ1_Rings		; WZ4
		dc.l DEZ1_Rings		; DEZ1
		dc.l DEZ1_Rings		; DEZ2
		dc.l DEZ1_Rings		; DEZ3
		dc.l DEZ1_Rings		; DEZ4
		dc.l TTZ1_Rings		; TTZ1
		dc.l TTZ1_Rings		; TTZ2
		dc.l TTZ1_Rings		; TTZ3
		dc.l TTZ1_Rings		; TTZ4

		zonewarning RingLocPtrs,(4*4)

; ===========================================================================
; Compressed level graphics - tile, primary patterns and block mappings
; ===========================================================================

GHZ_8x8_KosM:		binclude "Levels/GHZ/Tiles/Primary.bin"
	even
GHZ_16x16_Unc:		binclude "Levels/GHZ/Blocks/Primary.bin"
	even
GHZ_128x128_Kos:	binclude "Levels/GHZ/Chunks/Primary.bin"
	even

SSLZ1_8x8_KosM:		binclude "Levels/SSLZ/Tiles/Primary.bin"
	even
SSLZ1_16x16_Unc:		binclude "Levels/SSLZ/Blocks/Primary.bin"
	even
SSLZ1_128x128_Kos:	binclude "Levels/SSLZ/Chunks/Primary.bin"
	even

SSLZ2_8x8_KosM:		binclude "Levels/SSLZ/Tiles/Secondary.bin"
	even
SSLZ2_16x16_Unc:	binclude "Levels/SSLZ/Blocks/Secondary.bin"
	even
SSLZ2_128x128_Kos:	binclude "Levels/SSLZ/Chunks/Secondary.bin"
	even

WZ_8x8_KosM:		binclude "Levels/WZ/Tiles/Primary.bin"
	even
WZ_16x16_Unc:		binclude "Levels/WZ/Blocks/Primary.bin"
	even
WZ_128x128_Kos:	binclude "Levels/WZ/Chunks/Primary.bin"
	even

DEZ_8x8_KosM:		binclude "Levels/DEZ/Tiles/Primary.bin"
	even
DEZ_16x16_Unc:		binclude "Levels/DEZ/Blocks/Primary.bin"
	even
DEZ_128x128_Kos:	binclude "Levels/DEZ/Chunks/Primary.bin"
	even

TTZ_8x8_KosM:		binclude "Levels/TTZ/Tiles/Primary.bin"
	even
TTZ_16x16_Unc:		binclude "Levels/TTZ/Blocks/Primary.bin"
	even
TTZ_128x128_Kos:	binclude "Levels/TTZ/Chunks/Primary.bin"
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

GHZ1_Solid:			binclude "Levels/GHZ/Collision/1.bin"
	even
SSLZ1_Solid:		binclude "Levels/SSLZ/Collision/1.bin"
	even
SSLZ2_Solid:		binclude "Levels/SSLZ/Collision/2.bin"
	even
WZ1_Solid:			binclude "Levels/WZ/Collision/1.bin"
	even
DEZ1_Solid:			binclude "Levels/DEZ/Collision/1.bin"
	even
TTZ1_Solid:			binclude "Levels/TTZ/Collision/1.bin"
	even

; ===========================================================================
; Level layout data
; ===========================================================================

GHZ1_Layout:		binclude "Levels/GHZ/Layout/1.bin"
	even
SSLZ1_Layout:		binclude "Levels/SSLZ/Layout/1.bin"
	even
SSLZ2_Layout:		binclude "Levels/SSLZ/Layout/2.bin"
	even
SSLZ3_Layout:		binclude "Levels/SSLZ/Layout/3.bin"
	even
WZ1_Layout:			binclude "Levels/WZ/Layout/1.bin"
	even
DEZ1_Layout:		binclude "Levels/DEZ/Layout/1.bin"
	even
TTZ1_Layout:		binclude "Levels/TTZ/Layout/1.bin"
	even

; ===========================================================================
; Level object data
; ===========================================================================

	ObjectLayoutBoundary
GHZ1_Sprites:		binclude "Levels/GHZ/Object Pos/1.bin"
	ObjectLayoutBoundary
SSLZ1_Sprites:		binclude "Levels/SSLZ/Object Pos/1.bin"
	ObjectLayoutBoundary
SSLZ2_Sprites:		binclude "Levels/SSLZ/Object Pos/2.bin"
	ObjectLayoutBoundary
SSLZ3_Sprites:		binclude "Levels/SSLZ/Object Pos/3.bin"
	ObjectLayoutBoundary
WZ1_Sprites:		binclude "Levels/WZ/Object Pos/1.bin"
	ObjectLayoutBoundary
DEZ1_Sprites:		binclude "Levels/DEZ/Object Pos/1.bin"
	ObjectLayoutBoundary
TTZ1_Sprites:		binclude "Levels/TTZ/Object Pos/1.bin"
	ObjectLayoutBoundary
	even

; ===========================================================================
; Level ring data
; ===========================================================================

	RingLayoutBoundary
GHZ1_Rings:			binclude "Levels/GHZ/Ring Pos/1.bin"
	RingLayoutBoundary
SSLZ1_Rings:		binclude "Levels/SSLZ/Ring Pos/1.bin"
	RingLayoutBoundary
SSLZ2_Rings:		binclude "Levels/SSLZ/Ring Pos/2.bin"
	RingLayoutBoundary
SSLZ3_Rings:		binclude "Levels/SSLZ/Ring Pos/3.bin"
	RingLayoutBoundary
WZ1_Rings:			binclude "Levels/WZ/Ring Pos/1.bin"
	RingLayoutBoundary
DEZ1_Rings:			binclude "Levels/DEZ/Ring Pos/1.bin"
	RingLayoutBoundary
TTZ1_Rings:			binclude "Levels/TTZ/Ring Pos/1.bin"
	RingLayoutBoundary
	even
