Sound_3A_Header:
	smpsHeaderStartSong 3
	smpsHeaderVoice     Sound_3A_71_Voices
	smpsHeaderTempoSFX  $01
	smpsHeaderChanSFX   $02

	smpsHeaderSFXChannel cFM5, Sound_3A_71_FM5,	$0C, $00
	smpsHeaderSFXChannel cFM4, Sound_3A_71_FM4,	$0C, $01

; FM4 Data
Sound_3A_71_FM4:
	dc.b	nRst, $03

; FM5 Data
Sound_3A_71_FM5:
	smpsSetvoice        $00
	dc.b	nBb2, $05, smpsNoAttack, nB2, $26
	smpsStop

Sound_3A_71_Voices:
;	Voice $00
;	$30
;	$30, $30, $30, $30, 	$9E, $A8, $AC, $DC, 	$0E, $0A, $04, $05
;	$08, $08, $08, $08, 	$BF, $BF, $BF, $BF, 	$04, $2C, $14, $80
	smpsVcAlgorithm     $00
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $03, $03
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $03, $02, $02, $02
	smpsVcAttackRate    $1C, $2C, $28, $1E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $04, $0A, $0E
	smpsVcDecayRate2    $08, $08, $08, $08
	smpsVcDecayLevel    $0B, $0B, $0B, $0B
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $14, $2C, $04

