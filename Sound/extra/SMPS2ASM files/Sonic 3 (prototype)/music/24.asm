s3p24_Header:
	smpsHeaderStartSong 3, 1
	smpsHeaderVoice     s3p24_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       s3p24_DAC,	$00, $0F
	smpsHeaderFM        s3p24_FM1,	$00, $0F
	smpsHeaderFM        s3p24_FM2,	$00, $0F
	smpsHeaderFM        s3p24_FM3,	$00, $0F
	smpsHeaderFM        s3p24_FM4,	$00, $0F
	smpsHeaderFM        s3p24_FM5,	$00, $11
	smpsHeaderPSG       s3p24_PSG1,	$E8, $02, $00, $00
	smpsHeaderPSG       s3p24_PSG2,	$E8, $02, $00, $00
	smpsHeaderPSG       s3p24_PSG3,	$E8, $02, $00, $00

; FM1 Data
s3p24_FM1:
	smpsSetvoice        $00
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panCenter, $00
	dc.b	nE5, $06, nE5, nE5, nRst, $12, nE5, $06, nE5, nE5, nRst, $2A

s3p24_Loop0E:
	smpsSetvoice        $00
	dc.b	nE5, $54, nF5, $60, nFs5, nF5, $6C
	smpsLoop            $00, $02, s3p24_Loop0E
	smpsSetvoice        $03
	dc.b	nRst, $18, nA4, nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5
	dc.b	$0C, nC5, $3C, nRst, $0C, nD5, nC5, nE5, $6C, nRst, $18, nA4
	dc.b	nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5, $0C, nC5, $60
	dc.b	nA5, $54, nRst, $18
	smpsJump            s3p24_Loop0E

; FM2 Data
s3p24_FM2:
	smpsSetvoice        $01
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panCenter, $00
	dc.b	nE2, $06, nE2, nE2, $0C, nRst, nE2, $06, nE2, nE2, $0C, nRst
	dc.b	$24

s3p24_Loop0D:
	smpsSetvoice        $01
	dc.b	nA2, $06, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3
	smpsLoop            $00, $08, s3p24_Loop0D
	dc.b	nF2, $06, nF2, nF3, nF3, nF2, nF2, nF3, nF3, nF2, nF2, nF3
	dc.b	nF3, nF2, nF2, nF3, nF3, nG2, nG2, nG3, nG3, nG2, nG2, nG3
	dc.b	nG3, nG2, nG2, nG3, nG3, nG2, nG2, nG3, nG3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nG2, nG2, nG3
	dc.b	nG3, nG2, nG2, nG3, nG3, nF2, nF2, nF3, nF3, nF2, nF2, nF3
	dc.b	nF3, nF2, nF2, nF3, nF3, nF2, nF2, nF3, nF3, nG2, nG2, nG3
	dc.b	nG3, nG2, nG2, nG3, nG3, nG2, nG2, nG3, nG3, nG2, nG2, nG3
	dc.b	nG3, nA2, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA2, $0C, nRst, nA2, $06
	dc.b	nA2, nA2, $0C, nRst, $24
	smpsJump            s3p24_Loop0D

; FM3 Data
s3p24_FM3:
	smpsSetvoice        $00
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panRight, $00
	dc.b	nB4, $06, nB4, nB4, nRst, $12, nB4, $06, nB4, nB4, nRst, $2A

s3p24_Loop0C:
	smpsSetvoice        $00
	dc.b	nC5, $54, nC5, $60, nC5, nC5, $6C
	smpsLoop            $00, $02, s3p24_Loop0C
	smpsSetvoice        $04
	dc.b	nC5, $54, nB4, $3C, nD5, $24, nE5, $7F, smpsNoAttack, nE5, $1D, nD5
	dc.b	$30, nC5, $54, nB4, $3C, nD5, $24, nE5, $6C, nRst, $60
	smpsJump            s3p24_Loop0C

; FM4 Data
s3p24_FM4:
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panLeft, $00
	dc.b	nRst, $60

s3p24_Loop04:
	smpsSetvoice        $02
	dc.b	nA4, $06, nC5, nE5, nC5
	smpsLoop            $00, $04, s3p24_Loop04

s3p24_Loop05:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, s3p24_Loop05

s3p24_Loop06:
	dc.b	nA4, $06, nC5, nFs5, nC5
	smpsLoop            $00, $04, s3p24_Loop06

s3p24_Loop07:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, s3p24_Loop07

s3p24_Loop08:
	dc.b	nA4, $06, nC5, nE5, nC5
	smpsLoop            $00, $04, s3p24_Loop08

s3p24_Loop09:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, s3p24_Loop09

s3p24_Loop0A:
	dc.b	nA4, $06, nC5, nFs5, nC5
	smpsLoop            $00, $04, s3p24_Loop0A

s3p24_Loop0B:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, s3p24_Loop0B
	dc.b	nF4, $0C, nA4, nC5, nF5, $3C, nG4, $0C, nB4, nD5, nG5, $3C
	dc.b	nA4, $0C, nC5, nE5, nA5, $3C, nA4, $0C, nC5, nE5, nA5, nG4
	dc.b	nB4, nD5, nG5, nF4, nA4, nC5, nF5, $3C, nG4, $0C, nB4, nD5
	dc.b	nG5, $3C, nA4, $0C, nC5, nE5, nA5, $3C, nRst, $60
	smpsJump            s3p24_Loop04

; FM5 Data
s3p24_FM5:
	dc.b	nRst, $10
	smpsSetvoice        $00
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panCenter, $00
	smpsFMAlterVol      $0C
	dc.b	nE5, $06, nE5, nE5, nRst, $12, nE5, $06, nE5, nE5, nRst, $2A
	smpsFMAlterVol      $F4

s3p24_Loop03:
	smpsSetvoice        $00
	dc.b	nE5, $54, nF5, $60, nFs5, nF5, $6C
	smpsLoop            $00, $02, s3p24_Loop03
	smpsSetvoice        $03
	dc.b	nRst, $18, nA4, nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5
	dc.b	$0C, nC5, $3C, nRst, $0C, nD5, nC5, nE5, $6C, nRst, $18, nA4
	dc.b	nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5, $0C, nC5, $60
	dc.b	nA5, $54, nRst, $18
	smpsJump            s3p24_Loop03

; DAC Data
s3p24_DAC:
	dc.b	dSnareS3, $06, dSnareS3, dSnareS3, $18, dSnareS3, $06, dSnareS3, dSnareS3, $18, dSnareS3, $06
	dc.b	dSnareS3, dSnareS3, dSnareS3

s3p24_Loop00:
	dc.b	dKickS3, $18, dKickS3, dKickS3, dKickS3
	smpsLoop            $00, $07, s3p24_Loop00

s3p24_Loop01:
	dc.b	dKickS3, $18, dKickS3, dKickS3, $0C, dSnareS3, dSnareS3, $06, dSnareS3, dSnareS3, $0C
	smpsLoop            $00, $03, s3p24_Loop01

s3p24_Loop02:
	dc.b	dKickS3, $0C, dKickS3, dSnareS3, dKickS3, dKickS3, $06, dKickS3, dKickS3, $0C, dSnareS3, dKickS3
	smpsLoop            $00, $04, s3p24_Loop02
	dc.b	dKickS3, $0C, dKickS3, dSnareS3, dKickS3, dKickS3, $06, dKickS3, dKickS3, $0C, dSnareS3, $06
	dc.b	dSnareS3, dSnareS3, dSnareS3, dSnareS3, dSnareS3, dSnareS3, $18, dSnareS3, $06, dSnareS3, dSnareS3, $18
	dc.b	dSnareS3, $06, dSnareS3, dSnareS3, dSnareS3
	smpsJump            s3p24_Loop00

; PSG1 Data
s3p24_PSG1:
	smpsStop

; PSG2 Data
s3p24_PSG2:
	smpsStop

; PSG3 Data
s3p24_PSG3:
	smpsStop

s3p24_Voices:
;	Voice $00
;	$3D
;	$41, $10, $72, $61, 	$0F, $14, $53, $14, 	$04, $06, $06, $03
;	$00, $0F, $00, $00, 	$1F, $3F, $5F, $1F, 	$1A, $8A, $8A, $8A
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $07, $01, $04
	smpsVcCoarseFreq    $01, $02, $00, $01
	smpsVcRateScale     $00, $01, $00, $00
	smpsVcAttackRate    $14, $13, $14, $0F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $06, $06, $04
	smpsVcDecayRate2    $00, $00, $0F, $00
	smpsVcDecayLevel    $01, $05, $03, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $8A, $8A, $8A, $1A

;	Voice $01
;	$08
;	$07, $70, $30, $00, 	$9F, $9F, $9F, $9F, 	$12, $0E, $0A, $0A
;	$00, $04, $04, $03, 	$28, $25, $25, $25, 	$1F, $2B, $11, $81
	smpsVcAlgorithm     $00
	smpsVcFeedback      $01
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $07, $00
	smpsVcCoarseFreq    $00, $00, $00, $07
	smpsVcRateScale     $02, $02, $02, $02
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0A, $0A, $0E, $12
	smpsVcDecayRate2    $03, $04, $04, $00
	smpsVcDecayLevel    $02, $02, $02, $02
	smpsVcReleaseRate   $05, $05, $05, $08
	smpsVcTotalLevel    $81, $11, $2B, $1F

;	Voice $02
;	$04
;	$75, $11, $31, $71, 	$1F, $1F, $1F, $1F, 	$08, $05, $0C, $09
;	$00, $00, $00, $00, 	$FF, $FF, $FF, $FF, 	$1E, $86, $22, $8D
	smpsVcAlgorithm     $04
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $03, $01, $07
	smpsVcCoarseFreq    $01, $01, $01, $05
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $09, $0C, $05, $08
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $0F, $0F, $0F, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $8D, $22, $86, $1E

;	Voice $03
;	$29
;	$20, $31, $51, $71, 	$0E, $11, $12, $17, 	$00, $00, $00, $00
;	$08, $00, $09, $00, 	$89, $F8, $F9, $F8, 	$20, $20, $10, $88
	smpsVcAlgorithm     $01
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $05, $03, $02
	smpsVcCoarseFreq    $01, $01, $01, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $17, $12, $11, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $00, $09, $00, $08
	smpsVcDecayLevel    $0F, $0F, $0F, $08
	smpsVcReleaseRate   $08, $09, $08, $09
	smpsVcTotalLevel    $88, $10, $20, $20

;	Voice $04
;	$3D
;	$31, $50, $21, $41, 	$0D, $13, $13, $14, 	$03, $01, $06, $05
;	$05, $01, $05, $01, 	$FF, $FF, $FF, $FF, 	$1D, $8A, $88, $87
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $02, $05, $03
	smpsVcCoarseFreq    $01, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $14, $13, $13, $0D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $05, $06, $01, $03
	smpsVcDecayRate2    $01, $05, $01, $05
	smpsVcDecayLevel    $0F, $0F, $0F, $0F
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $87, $88, $8A, $1D

