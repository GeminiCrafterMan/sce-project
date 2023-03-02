; ===========================================================================
; Level pattern load cues
; ===========================================================================

Offs_PLC: offsetTable
	; Green Hill Zone
	rept 4
		offsetTableEntry.w PLC1_GHZ_Misc
		offsetTableEntry.w PLC2_GHZ_Enemy
	endr
	; Seaside Land Zone
		offsetTableEntry.w PLC1_SSLZ_Misc
		offsetTableEntry.w PLC2_SSLZ_Enemy
		offsetTableEntry.w PLC1_SSLZ_Misc
		offsetTableEntry.w PLC2_SSLZ2_Enemy
	rept 2
		offsetTableEntry.w PLC1_SSLZ_Misc
		offsetTableEntry.w PLC2_SSLZ_Enemy
	endr
	; Tree Top Zone
	rept 4
		offsetTableEntry.w PLC1_TTPZ_Misc
		offsetTableEntry.w PLC2_TTPZ_Enemy
	endr
	; Mecha Mushroom Zone
	rept 4
		offsetTableEntry.w PLC1_MMZ_Misc
		offsetTableEntry.w PLC2_MMZ_Enemy
	endr
	; Death Egg Zone
	rept 4
		offsetTableEntry.w PLC1_DEZ_Misc
		offsetTableEntry.w PLC2_DEZ_Enemy
	endr
	; Techno Test Zone
	rept 4
		offsetTableEntry.w PLC1_TTSZ_Misc
		offsetTableEntry.w PLC2_TTSZ_Enemy
	endr

		zonewarning Offs_PLC,(4*4)

; ===========================================================================
; Pattern load cues - Main 1
; ===========================================================================

PLC_Main: plrlistheader
		plreq ArtTile_EnemyScore, ArtKosM_EnemyScore	; Enemy score
		plreq ArtTile_StarPost, ArtKosM_StarPost	; StarPost
		plreq ArtTile_Ring_Sparks, ArtKosM_Ring_Sparks	; Rings
		plreq ArtTile_HUD, ArtKosM_Hud					; HUD
PLC_Main_end

; ===========================================================================
; Pattern load cues - Main 2
; ===========================================================================

PLC_Main2: plrlistheader
		plreq ArtTile_Spikes, ArtKosM_Spikes				; Spikes
		plreq ArtTile_Spring, ArtKosM_Spring				; Springs
		plreq ArtTile_Monitors, ArtKosM_Monitors			; Monitors
		plreq ArtTile_Button, ArtKosM_GrayButton			; Button
		plreq ArtTile_Explosion, ArtKosM_Explosion						; Explosion
PLC_Main2_end

; ===========================================================================
; Pattern load cues - Green Hill (Misc)
; ===========================================================================

PLC1_GHZ_Misc: plrlistheader
		plreq ArtTile_EdgeWalls, ArtKosM_EdgeWalls
		plreq ArtTile_Bridge,	ArtKosM_GHZBridge
		plreq ArtTile_PurpleRock, ArtKosM_PurpleRock		; Purple rock
		plreq ArtTile_SSLZWaterfall, ArtKosM_GHZWaterfall
		plreq ArtTile_SmashableWalls, ArtKosM_SmashableWalls
PLC1_GHZ_Misc_end

; ===========================================================================
; Pattern load cues - Green Hill (Enemy)
; ===========================================================================

PLC2_GHZ_Enemy: plrlistheader
		plreq ArtTile_Crabmeat, ArtKosM_Crabmeat		; Crabmeat
		plreq ArtTile_BuzzBomber, ArtKosM_BuzzBomber		; Buzz Bomber
		plreq ArtTile_Chopper, ArtKosM_Chopper			; Chopper
		plreq ArtTile_Motobug, ArtKosM_Motobug			; Motobug
PLC2_GHZ_Enemy_end

; ===========================================================================
; Pattern load cues - Seaside Land (Misc)
; ===========================================================================

PLC1_SSLZ_Misc: plrlistheader
		plreq ArtTile_Bridge,	ArtKosM_SSLZBridge
		plreq ArtTile_Bubbles, ArtKosM_Bubbles
PLC1_SSLZ_Misc_end

; ===========================================================================
; Pattern load cues - Seaside Land (Enemy)
; ===========================================================================

PLC2_SSLZ_Enemy: plrlistheader
		plreq ArtTile_Crabmeat, ArtKosM_Crabmeat		; Crabmeat
		plreq ArtTile_BuzzBomber, ArtKosM_BuzzBomber		; Buzz Bomber
		plreq ArtTile_Chopper, ArtKosM_Chopper			; Chopper
		plreq ArtTile_Motobug, ArtKosM_Motobug			; Motobug
PLC2_SSLZ_Enemy_end

; ===========================================================================
; Pattern load cues - Seaside Land 2 (Enemy)
; ===========================================================================

PLC2_SSLZ2_Enemy: plrlistheader
		plreq ArtTile_Crabmeat, ArtKosM_Burrobot		; Burrobot
PLC2_SSLZ2_Enemy_end

; ===========================================================================
; Pattern load cues - Tree Top (Misc)
; ===========================================================================

PLC1_TTPZ_Misc: plrlistheader
		plreq	ArtTile_PurpleRock, ArtKosM_MonkeyBars
		plreq	ArtTile_PurpleRock+16, ArtKosM_Pylon
PLC1_TTPZ_Misc_end

; ===========================================================================
; Pattern load cues - Tree Top (Enemy)
; ===========================================================================

PLC2_TTPZ_Enemy: plrlistheader
		plreq	ArtTile_Crabmeat, ArtKosM_MechaBu
		plreq	ArtTile_Motobug, ArtKosM_Motobug
PLC2_TTPZ_Enemy_end

; ===========================================================================
; Pattern load cues - Mecha Mushroom (Misc)
; ===========================================================================

PLC1_MMZ_Misc: plrlistheader
PLC1_MMZ_Misc_end

; ===========================================================================
; Pattern load cues - Mecha Mushroom (Enemy)
; ===========================================================================

PLC2_MMZ_Enemy: plrlistheader
PLC2_MMZ_Enemy_end

; ===========================================================================
; Pattern load cues - Death Egg (Misc)
; ===========================================================================

PLC1_DEZ_Misc: plrlistheader
		plreq ArtTile_Bubbles, ArtKosM_Bubbles
PLC1_DEZ_Misc_end

; ===========================================================================
; Pattern load cues - Death Egg (Enemy)
; ===========================================================================

PLC2_DEZ_Enemy: plrlistheader
		plreq $100, ArtKosM_Spikebonker					; Spikebonker badnik
		plreq $438, ArtKosM_BataPyon
PLC2_DEZ_Enemy_end

; ===========================================================================
; Pattern load cues - Techno Test (Misc)
; ===========================================================================

PLC1_TTSZ_Misc: plrlistheader
		plreq ArtTile_Bubbles, ArtKosM_Bubbles
PLC1_TTSZ_Misc_end

; ===========================================================================
; Pattern load cues - Techno Test (Enemy)
; ===========================================================================

PLC2_TTSZ_Enemy: plrlistheader
		plreq ArtTile_Crabmeat, ArtKosM_Burrobot
PLC2_TTSZ_Enemy_end
