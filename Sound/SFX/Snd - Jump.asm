Sound_62_Header:
	smpsHeaderStartSong 3
	smpsHeaderVoice     Sound_62_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $01

	smpsHeaderSFXChannel cPSG2, Sound_62_PSG2,	$00, $00

; PSG2 Data
Sound_62_PSG2:
	smpsPSGvoice        sTone_0D
	dc.b	nF2, $05
	smpsModSet          $02, $01, $F8, $65
	dc.b	nBb2, $15
	smpsStop

; Song seems to not use any FM voices
Sound_62_Voices:
