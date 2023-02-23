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
		levartptrs TTPZ_8x8_KosM, TTPZ_16x16_Unc, TTPZ_128x128_Kos, palid_TTPZ		; TTPZ1
		levartptrs TTPZ_8x8_KosM, TTPZ_16x16_Unc, TTPZ_128x128_Kos, palid_TTPZ		; TTPZ2
		levartptrs TTPZ_8x8_KosM, TTPZ_16x16_Unc, TTPZ_128x128_Kos, palid_TTPZ		; TTPZ3
		levartptrs TTPZ_8x8_KosM, TTPZ_16x16_Unc, TTPZ_128x128_Kos, palid_TTPZ		; TTPZ4
		levartptrs MMZ_8x8_KosM, MMZ_16x16_Unc, MMZ_128x128_Kos, palid_MMZ		; MMZ1
		levartptrs MMZ_8x8_KosM, MMZ_16x16_Unc, MMZ_128x128_Kos, palid_MMZ		; MMZ2
		levartptrs MMZ_8x8_KosM, MMZ_16x16_Unc, MMZ_128x128_Kos, palid_MMZ		; MMZ3
		levartptrs MMZ_8x8_KosM, MMZ_16x16_Unc, MMZ_128x128_Kos, palid_MMZ		; MMZ4
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ1
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ2
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ3
		levartptrs DEZ_8x8_KosM, DEZ_16x16_Unc, DEZ_128x128_Kos, palid_DEZ		; DEZ4
		levartptrs TTSZ_8x8_KosM, TTSZ_16x16_Unc, TTSZ_128x128_Kos, palid_TTSZ		; TTSZ1
		levartptrs TTSZ_8x8_KosM, TTSZ_16x16_Unc, TTSZ2_128x128_Kos, palid_TTSZ		; TTSZ2
		levartptrs TTSZ_8x8_KosM, TTSZ_16x16_Unc, TTSZ2_128x128_Kos, palid_TTSZ		; TTSZ3
		levartptrs TTSZ_8x8_KosM, TTSZ_16x16_Unc, TTSZ2_128x128_Kos, palid_TTSZ		; TTSZ4

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

; TTPZ1
		dc.l AnPal_TTPZ, DLE_TTPZ, LevelPointer_Null, LevelPointer_Null
		dc.l TTPZ1_ScreenInit, TTPZ1_BackgroundInit, TTPZ1_ScreenEvent, TTPZ1_BackgroundEvent
		dc.l TTPZ_DoAniPLC, AniPLC_TTPZ

; TTPZ2-4
	rept 3
		dc.l AnPal_TTPZ, DLE_TTPZ, LevelPointer_Null, LevelPointer_Null
		dc.l TTPZ1_ScreenInit, TTPZ1_BackgroundInit, TTPZ1_ScreenEvent, TTPZ1_BackgroundEvent
		dc.l TTPZ_DoAniPLC, AniPLC_TTPZ
	endr

; MMZ1-4
	rept 4
		dc.l LevelPointer_Null, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l MMZ1_ScreenInit, MMZ1_BackgroundInit, MMZ1_ScreenEvent, MMZ1_BackgroundEvent
		dc.l AnimateTiles_MMZ, AniPLC_MMZ
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

; TTSZ1
		dc.l AnPal_TTSZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l TTSZ1_ScreenInit, TTSZ1_BackgroundInit, TTSZ1_ScreenEvent, TTSZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

; TTSZ2
		dc.l AnPal_TTSZ, LevelPointer_Null, DWE_TTSZ, LevelPointer_Null
		dc.l TTSZ1_ScreenInit, TTSZ1_BackgroundInit, TTSZ1_ScreenEvent, TTSZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

; TTSZ3
		dc.l AnPal_TTSZ, LevelPointer_Null, DWE_TTSZ, LevelPointer_Null
		dc.l TTSZ1_ScreenInit, TTSZ1_BackgroundInit, TTSZ1_ScreenEvent, TTSZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

; TTSZ4
		dc.l AnPal_TTSZ, LevelPointer_Null, DWE_TTSZ, LevelPointer_Null
		dc.l TTSZ1_ScreenInit, TTSZ1_BackgroundInit, TTSZ1_ScreenEvent, TTSZ1_BackgroundEvent
		dc.l LevelPointer_Null, LevelPointer_Null

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
		dc.l TTPZ1_Solid		; TTPZ1
		dc.l TTPZ1_Solid		; TTPZ2
		dc.l TTPZ1_Solid		; TTPZ3
		dc.l TTPZ1_Solid		; TTPZ4
		dc.l MMZ1_Solid		; MMZ1
		dc.l MMZ1_Solid		; MMZ2
		dc.l MMZ1_Solid		; MMZ3
		dc.l MMZ1_Solid		; MMZ4
		dc.l DEZ1_Solid		; DEZ1
		dc.l DEZ1_Solid		; DEZ2
		dc.l DEZ1_Solid		; DEZ3
		dc.l DEZ1_Solid		; DEZ4
		dc.l TTSZ1_Solid		; TTSZ1
		dc.l TTSZ1_Solid		; TTSZ2
		dc.l TTSZ1_Solid		; TTSZ3
		dc.l TTSZ1_Solid		; TTSZ4

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
		dc.l TTPZ1_Layout		; TTPZ1
		dc.l TTPZ1_Layout		; TTPZ2
		dc.l TTPZ1_Layout		; TTPZ3
		dc.l TTPZ1_Layout		; TTPZ4
		dc.l MMZ1_Layout		; MMZ1
		dc.l MMZ1_Layout		; MMZ2
		dc.l MMZ1_Layout		; MMZ3
		dc.l MMZ1_Layout		; MMZ4
		dc.l DEZ1_Layout		; DEZ1
		dc.l DEZ1_Layout		; DEZ2
		dc.l DEZ1_Layout		; DEZ3
		dc.l DEZ1_Layout		; DEZ4
		dc.l TTSZ1_Layout		; TTSZ1
		dc.l TTSZ2_Layout		; TTSZ2
		dc.l TTSZ3_Layout		; TTSZ3
		dc.l TTSZ4_Layout		; TTSZ4

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
		dc.l TTPZ1_Sprites		; TTPZ1
		dc.l TTPZ1_Sprites		; TTPZ2
		dc.l TTPZ1_Sprites		; TTPZ3
		dc.l TTPZ1_Sprites		; TTPZ4
		dc.l MMZ1_Sprites		; MMZ1
		dc.l MMZ1_Sprites		; MMZ2
		dc.l MMZ1_Sprites		; MMZ3
		dc.l MMZ1_Sprites		; MMZ4
		dc.l DEZ1_Sprites		; DEZ1
		dc.l DEZ1_Sprites		; DEZ2
		dc.l DEZ1_Sprites		; DEZ3
		dc.l DEZ1_Sprites		; DEZ4
		dc.l TTSZ1_Sprites		; TTSZ1
		dc.l TTSZ2_Sprites		; TTSZ2
		dc.l TTSZ3_Sprites		; TTSZ3
		dc.l TTSZ4_Sprites		; TTSZ4

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
		dc.l TTPZ1_Rings		; TTPZ1
		dc.l TTPZ1_Rings		; TTPZ2
		dc.l TTPZ1_Rings		; TTPZ3
		dc.l TTPZ1_Rings		; TTPZ4
		dc.l MMZ1_Rings		; MMZ1
		dc.l MMZ1_Rings		; MMZ2
		dc.l MMZ1_Rings		; MMZ3
		dc.l MMZ1_Rings		; MMZ4
		dc.l DEZ1_Rings		; DEZ1
		dc.l DEZ1_Rings		; DEZ2
		dc.l DEZ1_Rings		; DEZ3
		dc.l DEZ1_Rings		; DEZ4
		dc.l TTSZ1_Rings		; TTSZ1
		dc.l TTSZ2_Rings		; TTSZ2
		dc.l TTSZ3_Rings		; TTSZ3
		dc.l TTSZ4_Rings		; TTSZ4

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

TTPZ_8x8_KosM:		binclude "Levels/TTPZ/Tiles/Primary.bin"
	even
TTPZ_16x16_Unc:		binclude "Levels/TTPZ/Blocks/Primary.bin"
	even
TTPZ_128x128_Kos:	binclude "Levels/TTPZ/Chunks/Primary.bin"
	even

MMZ_8x8_KosM:		binclude "Levels/MMZ/Tiles/Primary.bin"
	even
MMZ_16x16_Unc:		binclude "Levels/MMZ/Blocks/Primary.bin"
	even
MMZ_128x128_Kos:	binclude "Levels/MMZ/Chunks/Primary.bin"
	even

DEZ_8x8_KosM:		binclude "Levels/DEZ/Tiles/Primary.bin"
	even
DEZ_16x16_Unc:		binclude "Levels/DEZ/Blocks/Primary.bin"
	even
DEZ_128x128_Kos:	binclude "Levels/DEZ/Chunks/Primary.bin"
	even

TTSZ_8x8_KosM:		binclude "Levels/TTSZ/Tiles/Primary.bin"
	even
TTSZ_16x16_Unc:		binclude "Levels/TTSZ/Blocks/Primary.bin"
	even
TTSZ_128x128_Kos:	binclude "Levels/TTSZ/Chunks/Primary.bin"
	even
TTSZ2_128x128_Kos:	binclude "Levels/TTSZ/Chunks/Secondary.bin"
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
TTPZ1_Solid:			binclude "Levels/TTPZ/Collision/1.bin"
	even
MMZ1_Solid:			binclude "Levels/MMZ/Collision/1.bin"
	even
DEZ1_Solid:			binclude "Levels/DEZ/Collision/1.bin"
	even
TTSZ1_Solid:			binclude "Levels/TTSZ/Collision/1.bin"
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
TTPZ1_Layout:			binclude "Levels/TTPZ/Layout/1.bin"
	even
MMZ1_Layout:			binclude "Levels/MMZ/Layout/1.bin"
	even
DEZ1_Layout:		binclude "Levels/DEZ/Layout/1.bin"
	even
TTSZ1_Layout:		binclude "Levels/TTSZ/Layout/1.bin"
	even
TTSZ2_Layout:		binclude "Levels/TTSZ/Layout/2.bin"
	even
TTSZ3_Layout:		binclude "Levels/TTSZ/Layout/3.bin"
	even
TTSZ4_Layout:		binclude "Levels/TTSZ/Layout/4.bin"
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
TTPZ1_Sprites:		binclude "Levels/TTPZ/Object Pos/1.bin"
	ObjectLayoutBoundary
MMZ1_Sprites:		binclude "Levels/MMZ/Object Pos/1.bin"
	ObjectLayoutBoundary
DEZ1_Sprites:		binclude "Levels/DEZ/Object Pos/1.bin"
	ObjectLayoutBoundary
TTSZ1_Sprites:		binclude "Levels/TTSZ/Object Pos/1.bin"
	ObjectLayoutBoundary
TTSZ2_Sprites:		binclude "Levels/TTSZ/Object Pos/2.bin"
	ObjectLayoutBoundary
TTSZ3_Sprites:		binclude "Levels/TTSZ/Object Pos/3.bin"
	ObjectLayoutBoundary
TTSZ4_Sprites:		binclude "Levels/TTSZ/Object Pos/4.bin"
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
TTPZ1_Rings:			binclude "Levels/TTPZ/Ring Pos/1.bin"
	RingLayoutBoundary
MMZ1_Rings:			binclude "Levels/MMZ/Ring Pos/1.bin"
	RingLayoutBoundary
DEZ1_Rings:			binclude "Levels/DEZ/Ring Pos/1.bin"
	RingLayoutBoundary
TTSZ1_Rings:			binclude "Levels/TTSZ/Ring Pos/1.bin"
	RingLayoutBoundary
TTSZ2_Rings:			binclude "Levels/TTSZ/Ring Pos/2.bin"
	RingLayoutBoundary
TTSZ3_Rings:			binclude "Levels/TTSZ/Ring Pos/3.bin"
	RingLayoutBoundary
TTSZ4_Rings:			binclude "Levels/TTSZ/Ring Pos/4.bin"
	RingLayoutBoundary
	even
