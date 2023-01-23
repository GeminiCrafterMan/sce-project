Phantom_Ensemble_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     Phantom_Ensemble_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $05

	smpsHeaderDAC       Phantom_Ensemble_DAC
	smpsHeaderFM        Phantom_Ensemble_FM1,	$00, $08
	smpsHeaderFM        Phantom_Ensemble_FM2,	$00, $08
	smpsHeaderFM        Phantom_Ensemble_FM3,	$00, $08
	smpsHeaderFM        Phantom_Ensemble_FM4,	$00, $08
	smpsHeaderFM        Phantom_Ensemble_FM5,	$00, $08
	smpsHeaderPSG       Phantom_Ensemble_PSG1,	$00, $02, $00, fTone_01
	smpsHeaderPSG       Phantom_Ensemble_PSG2,	$00, $02, $00, fTone_04
	smpsHeaderPSG       Phantom_Ensemble_PSG3,	$00, $02, $00, fTone_02

; DAC Data
Phantom_Ensemble_DAC:
	smpsPan             panCenter, $00
	dc.b	dKick

Phantom_Ensemble_Loop00:
	dc.b	$10, $9A, $08, dKick, $10, $08, $9A, dKick
	smpsLoop            $00, $03, Phantom_Ensemble_Loop00
	dc.b	dKick, $10, $9A, $08, dKick, $10, $08, $9A, dKick, $04, $04

Phantom_Ensemble_Loop01:
	dc.b	$10, $9A, $08, dKick, $10, $08, $9A, dKick
	smpsLoop            $00, $03, Phantom_Ensemble_Loop01
	dc.b	dKick, $10, $9A, $08, dKick, $9A, $04, $04, dKick, $08, $9A, $04
	dc.b	$04, $04, $04, dKick

Phantom_Ensemble_Loop02:
	dc.b	$10, $9A, $08, dKick, $10, $08, $9A, dKick
	smpsLoop            $00, $03, Phantom_Ensemble_Loop02
	dc.b	dKick, $10, $9A, $08, dKick, $10, $08, $9A, dKick, $04, $04

Phantom_Ensemble_Loop03:
	dc.b	$10, $9A, $08, dKick, $10, $08, $9A, dKick
	smpsLoop            $00, $03, Phantom_Ensemble_Loop03
	dc.b	dKick, $10, $9A, $08, dKick, $9A, $04, $04, dKick, $08, dMidTimpani, $04
	dc.b	dLowTimpani, dVLowTimpani, dVLowTimpani, dKick, $08, $08, $9B, $76

Phantom_Ensemble_Loop04:
	dc.b	nRst
	smpsLoop            $00, $59, Phantom_Ensemble_Loop04
	smpsPan             panCenter, $00
	dc.b	$01
	smpsPan             panCenter, $00
	smpsStop

; FM1 Data
Phantom_Ensemble_FM1:
	smpsPan             panCenter, $00
	smpsSetvoice        $00

Phantom_Ensemble_Loop0D:
	dc.b	nAb4, $10, nE5, nEb5, nCs5, $08, nB4, $18, nFs5, $10, nE5, nEb5
	dc.b	$08, nA4, $18, nAb5, $10, nFs5, nE5, $08, nEb5, $10, nE5, $08
	dc.b	nEb5, nCs5, nB4, nFs4, nB4, nAb4, $18, nE5, $10, nEb5, nCs5, $08
	dc.b	nB4, $18, nFs5, $10, nE5, nEb5, $08, nBb4, $18, nAb5, $10, nFs5
	dc.b	nE5, $08, nCs6, $10, nAb4, $08, nE5, nFs5, nEb5, $04, nB4, nAb4
	dc.b	nFs4, nE4, $08, nFs4
	smpsLoop            $00, $02, Phantom_Ensemble_Loop0D
	dc.b	nRst, $10, nCs5, $20, nRst

Phantom_Ensemble_Loop0E:
	dc.b	$4F
	smpsLoop            $00, $86, Phantom_Ensemble_Loop0E
	dc.b	$02
	smpsPan             panCenter, $00
	smpsSetvoice        $00
	dc.b	$01
	smpsPan             panCenter, $00
	smpsSetvoice        $00
	smpsStop

; FM2 Data
Phantom_Ensemble_FM2:
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	smpsAlterVol        $06

Phantom_Ensemble_Loop0B:
	dc.b	nE3, $38, nEb3, $40, nCs3, nCs3, $28, nEb3, $18, nE3, $40, nEb3
	dc.b	nCs3, nCs3, $28, nEb3, $20
	smpsLoop            $00, $02, Phantom_Ensemble_Loop0B
	dc.b	nRst

Phantom_Ensemble_Loop0C:
	dc.b	$4D
	smpsLoop            $00, $8A, Phantom_Ensemble_Loop0C
	dc.b	$0A
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	dc.b	$01
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	smpsStop

; FM3 Data
Phantom_Ensemble_FM3:
	smpsPan             panCenter, $00
	smpsSetvoice        $03
	smpsAlterVol        $06

Phantom_Ensemble_Loop09:
	dc.b	nCs3, $38, nB2, $40, nA2, $48, $20, nB2, $18, nCs3, $40, nB2
	dc.b	nRst, $48, nA2, $20, nB2
	smpsLoop            $00, $02, Phantom_Ensemble_Loop09
	dc.b	nRst, $10, nCs3, $40, nRst

Phantom_Ensemble_Loop0A:
	dc.b	$74
	smpsLoop            $00, $5B, Phantom_Ensemble_Loop0A
	smpsPan             panCenter, $00
	smpsSetvoice        $03
	dc.b	$01
	smpsPan             panCenter, $00
	smpsSetvoice        $03
	smpsStop

; FM4 Data
Phantom_Ensemble_FM4:
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	smpsAlterVol        $06

Phantom_Ensemble_Loop07:
	dc.b	nAb3, $38, nFs3, $40, nE3, nE3, $28, nFs3, $18, nAb3, $40, nFs3
	dc.b	nE3, nE3, $28, nFs3, $20
	smpsLoop            $00, $02, Phantom_Ensemble_Loop07
	dc.b	nRst

Phantom_Ensemble_Loop08:
	dc.b	$4D
	smpsLoop            $00, $8A, Phantom_Ensemble_Loop08
	dc.b	$0A
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	dc.b	$01
	smpsPan             panCenter, $00
	smpsSetvoice        $01
	smpsStop

; FM5 Data
Phantom_Ensemble_FM5:
	smpsPan             panCenter, $00
	smpsSetvoice        $02
	smpsAlterVol        $06

Phantom_Ensemble_Loop05:
	dc.b	nE2, $38, nEb2, $40, nCs2, nCs2, $28, nEb2, $18, nE2, $40, nEb2
	dc.b	nCs2, nCs2, $28, nEb2, $20
	smpsLoop            $00, $02, Phantom_Ensemble_Loop05
	dc.b	nRst

Phantom_Ensemble_Loop06:
	dc.b	$4D
	smpsLoop            $00, $8A, Phantom_Ensemble_Loop06
	dc.b	$0A
	smpsPan             panCenter, $00
	smpsSetvoice        $02
	dc.b	$01
	smpsPan             panCenter, $00
	smpsSetvoice        $02
	smpsStop

; PSG1 Data
Phantom_Ensemble_PSG1:
	smpsPSGAlterVol     $02

Phantom_Ensemble_Loop14:
	dc.b	nCs3, $04, nB2, nAb2, nFs2, nE2, nEb2, nFs2, nAb2, nB2, nCs3, nB2
	dc.b	nAb2, nFs2, nE2, nEb2, nE2
	smpsLoop            $00, $10, Phantom_Ensemble_Loop14
	dc.b	nRst

Phantom_Ensemble_Loop15:
	dc.b	$4D
	smpsLoop            $00, $8A, Phantom_Ensemble_Loop15
	dc.b	$0A
	smpsPSGvoice        fTone_01
	dc.b	$01
	smpsPSGvoice        fTone_01
	smpsStop

; PSG2 Data
Phantom_Ensemble_PSG2:
	smpsPSGAlterVol     $04

Phantom_Ensemble_Loop12:
	dc.b	nE2, $04, nCs3, nB2, nAb2, nFs2, nE2, nEb2, nFs2, nAb2, nB2, nCs3
	dc.b	nB2, nAb2, nFs2, nE2, nEb2
	smpsLoop            $00, $10, Phantom_Ensemble_Loop12
	dc.b	nRst

Phantom_Ensemble_Loop13:
	dc.b	$4D
	smpsLoop            $00, $8A, Phantom_Ensemble_Loop13
	dc.b	$0A
	smpsPSGvoice        fTone_04
	dc.b	$01
	smpsPSGvoice        fTone_04
	smpsStop

; PSG3 Data
Phantom_Ensemble_PSG3:
	smpsPSGform         $E7
	smpsPSGAlterVol     $02
	dc.b	nMaxPSG

Phantom_Ensemble_Loop0F:
	dc.b	$08
	smpsLoop            $00, $07, Phantom_Ensemble_Loop0F
	smpsPSGvoice        fTone_01
	dc.b	$08
	smpsPSGvoice        fTone_02
	smpsLoop            $01, $0F, Phantom_Ensemble_Loop0F

Phantom_Ensemble_Loop10:
	dc.b	$08
	smpsLoop            $00, $07, Phantom_Ensemble_Loop10
	smpsPSGvoice        fTone_01

Phantom_Ensemble_Loop11:
	dc.b	$70, smpsNoAttack
	smpsLoop            $00, $5E, Phantom_Ensemble_Loop11
	dc.b	$75
	smpsStop

Phantom_Ensemble_Voices:
;	Voice $00
;	$3A
;	$01, $07, $01, $01, 	$8E, $8E, $8D, $53, 	$0E, $0E, $0E, $03
;	$00, $00, $00, $00, 	$13, $F7, $13, $09, 	$18, $28, $27, $09
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $07, $01
	smpsVcRateScale     $01, $02, $02, $02
	smpsVcAttackRate    $13, $0D, $0E, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $0E, $0E, $0E
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $01, $0F, $01
	smpsVcReleaseRate   $09, $03, $07, $03
	smpsVcTotalLevel    $09, $27, $28, $18

;	Voice $01
;	$07
;	$78, $54, $42, $11, 	$1F, $1F, $1F, $1F, 	$01, $01, $01, $01
;	$00, $00, $00, $00, 	$FF, $FF, $FF, $FF, 	$1C, $16, $15, $16
	smpsVcAlgorithm     $07
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $04, $05, $07
	smpsVcCoarseFreq    $01, $02, $04, $08
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $01, $01, $01, $01
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $0F, $0F, $0F, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $16, $15, $16, $1C

;	Voice $02
;	$38
;	$05, $02, $00, $00, 	$91, $91, $1F, $1F, 	$09, $10, $00, $00
;	$00, $00, $00, $00, 	$15, $15, $08, $08, 	$15, $16, $19, $11
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $02, $05
	smpsVcRateScale     $00, $00, $02, $02
	smpsVcAttackRate    $1F, $1F, $11, $11
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $10, $09
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $01, $01
	smpsVcReleaseRate   $08, $08, $05, $05
	smpsVcTotalLevel    $11, $19, $16, $15

;	Voice $03
;	$20
;	$66, $65, $60, $61, 	$DF, $DF, $9F, $9F, 	$07, $06, $09, $06
;	$07, $06, $06, $08, 	$29, $19, $19, $F9, 	$1C, $3A, $16, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $06, $06, $06
	smpsVcCoarseFreq    $01, $00, $05, $06
	smpsVcRateScale     $02, $02, $03, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $06, $09, $06, $07
	smpsVcDecayRate2    $08, $06, $06, $07
	smpsVcDecayLevel    $0F, $01, $01, $02
	smpsVcReleaseRate   $09, $09, $09, $09
	smpsVcTotalLevel    $00, $16, $3A, $1C

