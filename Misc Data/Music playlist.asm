; ===========================================================================
; Level Music Playlist
; ===========================================================================

LevelMusic_Playlist:
		dc.b bgm_DEZ1, bgm_DEZ1, bgm_DEZ1, bgm_DEZ1	; DEZ 1,2,3,4
		dc.b bgm_GHZ, bgm_GHZ, bgm_GHZ, bgm_GHZ	; GHZ 1,2,3,4

		zonewarning LevelMusic_Playlist,(1*4)