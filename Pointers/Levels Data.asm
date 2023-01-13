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
		dc.l AnPal_GHZ, DLE_GHZ2, LevelPointer_Null, LevelPointer_Null
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ

; GHZ3
		dc.l AnPal_GHZ, DLE_GHZ3, LevelPointer_Null, LevelPointer_Null
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ

; GHZ4
		dc.l AnPal_GHZ, LevelPointer_Null, LevelPointer_Null, LevelPointer_Null
		dc.l GHZ1_ScreenInit, GHZ1_BackgroundInit, GHZ1_ScreenEvent, GHZ1_BackgroundEvent
		dc.l AnimateTiles_DoAniPLC, AniPLC_GHZ

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
		dc.l GHZ2_Layout		; GHZ2
		dc.l GHZ3_Layout		; GHZ3
		dc.l GHZ1_Layout		; GHZ4

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
		dc.l GHZ2_Sprites		; GHZ2
		dc.l GHZ3_Sprites		; GHZ3
		dc.l GHZ1_Sprites		; GHZ4

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
		dc.l GHZ2_Rings		; GHZ2
		dc.l GHZ3_Rings		; GHZ3
		dc.l GHZ1_Rings		; GHZ4

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

; ===========================================================================
; Collision data
; ===========================================================================

AngleArray:			binclude "Misc Data/Angle Map.bin"
	even
HeightMaps:			binclude "Misc Data/Height Maps.bin"
	even
HeightMapsRot:		binclude "Misc Data/Height Maps Rotated.bin"
	even

; ===========================================================================
; Level collision data
; ===========================================================================

DEZ1_Solid:			binclude "Levels/DEZ/Collision/1.bin"
	even
GHZ1_Solid:			binclude "Levels/GHZ/Collision/1.bin"
	even

; ===========================================================================
; Level layout data
; ===========================================================================

		align $8000

DEZ1_Layout:		binclude "Levels/DEZ/Layout/1.bin"
	even
GHZ1_Layout:		binclude "Levels/GHZ/Layout/1.bin"
	even
GHZ2_Layout:		binclude "Levels/GHZ/Layout/2.bin"
	even
GHZ3_Layout:		binclude "Levels/GHZ/Layout/3.bin"
	even

; ===========================================================================
; Level object data
; ===========================================================================

	ObjectLayoutBoundary
DEZ1_Sprites:		binclude "Levels/DEZ/Object Pos/1.bin"
	ObjectLayoutBoundary
GHZ1_Sprites:		binclude "Levels/GHZ/Object Pos/1.bin"
	ObjectLayoutBoundary
GHZ2_Sprites:		binclude "Levels/GHZ/Object Pos/2.bin"
	ObjectLayoutBoundary
GHZ3_Sprites:		binclude "Levels/GHZ/Object Pos/3.bin"
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
GHZ2_Rings:			binclude "Levels/GHZ/Ring Pos/2.bin"
	RingLayoutBoundary
GHZ3_Rings:			binclude "Levels/GHZ/Ring Pos/3.bin"
	RingLayoutBoundary
	even
