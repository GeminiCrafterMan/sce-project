; ===========================================================================
; Level Music Playlist
; ===========================================================================

LevelMusic_Playlist:
		dc.b bgm_GHZ, bgm_Elec, bgm_GHZ, bgm_GHZ	; GHZ 1,2,3,4
		dc.b bgm_DiS, bgm_DiS, bgm_DiS, bgm_DiS ; SSLZ 1,2,3,4
		dc.b bgm_MCZ2P, bgm_MCZ2P, bgm_MCZ2P, bgm_MCZ2P ; TTPZ 1,2,3,4
		dc.b bgm_TFFZ, bgm_TFFZ, bgm_TFFZ, bgm_TFFZ ; CCZ 1,2,3,4
		dc.b bgm_MHZ1, bgm_MHZ1, bgm_MHZ1, bgm_MHZ1 ; MMZ 1,2,3,4
		dc.b bgm_DEZ1, bgm_DEZ1, bgm_DEZ1, bgm_DEZ1	; DEZ 1,2,3,4
		dc.b bgm_TFFZ, bgm_LZ, bgm_LZ, bgm_LZ	; TTSZ 1,2,3,4

		zonewarning LevelMusic_Playlist,(1*4)
