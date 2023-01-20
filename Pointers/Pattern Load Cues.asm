; ===========================================================================
; Level pattern load cues
; ===========================================================================

Offs_PLC: offsetTable

		offsetTableEntry.w PLC1_DEZ_Misc
		offsetTableEntry.w PLC2_DEZ_Enemy
		offsetTableEntry.w PLC1_DEZ_Misc
		offsetTableEntry.w PLC2_DEZ_Enemy
		offsetTableEntry.w PLC1_DEZ_Misc
		offsetTableEntry.w PLC2_DEZ_Enemy
		offsetTableEntry.w PLC1_DEZ_Misc
		offsetTableEntry.w PLC2_DEZ_Enemy

		offsetTableEntry.w PLC1_GHZ_Misc
		offsetTableEntry.w PLC2_GHZ_Enemy
		offsetTableEntry.w PLC1_GHZ_Misc
		offsetTableEntry.w PLC2_GHZ_Enemy
		offsetTableEntry.w PLC1_GHZ_Misc
		offsetTableEntry.w PLC2_GHZ_Enemy
		offsetTableEntry.w PLC1_GHZ_Misc
		offsetTableEntry.w PLC2_GHZ_Enemy

		offsetTableEntry.w PLC1_SSLZ_Misc
		offsetTableEntry.w PLC2_SSLZ_Enemy
		offsetTableEntry.w PLC1_SSLZ_Misc
		offsetTableEntry.w PLC2_SSLZ_Enemy
		offsetTableEntry.w PLC1_SSLZ_Misc
		offsetTableEntry.w PLC2_SSLZ_Enemy
		offsetTableEntry.w PLC1_SSLZ_Misc
		offsetTableEntry.w PLC2_SSLZ_Enemy

		zonewarning Offs_PLC,(4*4)

; ===========================================================================
; Pattern load cues - Main 1
; ===========================================================================

PLC_Main: plrlistheader
		plreq ArtTile_StarPost, ArtKosM_EnemyPtsStarPost	; StarPost
		plreq ArtTile_Ring_Sparks, ArtKosM_Ring_Sparks	; Rings
		plreq ArtTile_HUD, ArtKosM_Hud					; HUD
PLC_Main_end

; ===========================================================================
; Pattern load cues - Main 2
; ===========================================================================

PLC_Main2: plrlistheader
		plreq $47E, ArtKosM_GrayButton						; Button
		plreq ArtTile_Spikes, ArtKosM_Spikes				; Spikes
		plreq ArtTile_Spring, ArtKosM_Spring				; Springs
		plreq ArtTile_Monitors, ArtKosM_Monitors			; Monitors
		plreq $5A0, ArtKosM_Explosion						; Explosion
PLC_Main2_end

; ===========================================================================
; Pattern load cues - Death Egg (Misc)
; ===========================================================================

PLC1_DEZ_Misc: plrlistheader
		plreq ArtTile_Bubbles, ArtKosM_Bubbles
		plreq $7C0, ArtKosM_WaterWave
PLC1_DEZ_Misc_end

; ===========================================================================
; Pattern load cues - Death Egg (Enemy)
; ===========================================================================

PLC2_DEZ_Enemy: plrlistheader
		plreq $100, ArtKosM_Spikebonker					; Spikebonker badnik
		plreq $438, ArtKosM_BataPyon
PLC2_DEZ_Enemy_end

; ===========================================================================
; Pattern load cues - Green Hill (Misc)
; ===========================================================================

PLC1_GHZ_Misc: plrlistheader
		plreq ArtTile_EdgeWalls, ArtKosM_EdgeWalls
		plreq ArtTile_PurpleRock, ArtKosM_PurpleRock		; Purple rock
		plreq ArtTile_SmashableWalls, ArtKosM_SmashableWalls
		plreq ArtTile_Bubbles, ArtKosM_Bubbles
		plreq $7C0, ArtKosM_WaterWave
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
		plreq ArtTile_PurpleRock, ArtKosM_PurpleRock		; Purple rock
		plreq ArtTile_Bubbles, ArtKosM_Bubbles
		plreq $7C0, ArtKosM_WaterWave
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
