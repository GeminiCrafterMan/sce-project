; ===========================================================================
; Level Music Playlist
; ===========================================================================

LevelMusic_Playlist:
		dc.b bgm_DEZ1, bgm_DEZ1, bgm_DEZ1, bgm_DEZ1	; DEZ 1,2,3,4
		dc.b bgm_GHZ, bgm_GHZ, bgm_GHZ, bgm_GHZ	; GHZ 1,2,3,4
		dc.b bgm_DiS, bgm_DiS, bgm_DiS, bgm_DiS ; SSLZ 1,2,3,4
		dc.b bgm_MCZ2P, bgm_MCZ2P, bgm_MCZ2P, bgm_MCZ2P ; WZ 1,2,3,4

		zonewarning LevelMusic_Playlist,(1*4)