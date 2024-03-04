Intermission_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     Intermission_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       Intermission_DAC,	$00, $F2
	smpsHeaderFM        Intermission_FM1,	$00, $00
	smpsHeaderFM        Intermission_FM2,	$00, $00
	smpsHeaderFM        Intermission_FM3,	$00, $00
	smpsHeaderFM        Intermission_FM4,	$00, $00
	smpsHeaderFM        Intermission_FM5,	$00, $00
	smpsHeaderFM        Intermission_FM6,	$00, $00
	smpsHeaderPSG       Intermission_PSG1,	$00, $00, $00, $00
	smpsHeaderPSG       Intermission_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       Intermission_PSG3,	$00, $00, $00, $00

; DAC Data
Intermission_DAC:
; FM1 Data
Intermission_FM1:
	smpsSetvoice        $00
	smpsAlterVol        $15
	smpsPan             panLeft, $00

Intermission_LoopAE:
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $0C, Intermission_LoopAE
	dc.b	nE1, $03, nRst, $15, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopAF:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopAF
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopB0:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB0
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_LoopB1:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB1
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_LoopB2:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB2
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopB3:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB3
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopB4:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB4
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$7F, $7F, $7F, $7F, $6A, nE1, $03, nRst, $09, nE1, $0A, nRst
	dc.b	$02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst
	dc.b	$09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst
	dc.b	$09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst
	dc.b	$02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopB5:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB5
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopB6:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB6
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_LoopB7:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB7
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_LoopB8:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB8
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopB9:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopB9
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopBA:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopBA
	dc.b	nD1, $03, nRst, $09, nEb1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$0E, nD1, $10, nFs1, nD1, nE1, $06, nRst, $7F, $0B, nFs1, $10
	dc.b	nA1, nFs1, nE1, $06, nRst, $7F, $0B, nBb1, $10, nG1, nFs1
	smpsLoop            $01, $02, Intermission_LoopAE
	smpsAlterVol        $EB
	smpsPan             panCenter, $00
	smpsJump            Intermission_FM1

; FM2 Data
Intermission_FM2:
	smpsSetvoice        $01
	smpsAlterVol        $15
	smpsPan             panRight, $00

Intermission_LoopA1:
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $0C, Intermission_LoopA1
	dc.b	nE1, $03, nRst, $15, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopA2:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA2
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopA3:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA3
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_LoopA4:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA4
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_LoopA5:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA5
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopA6:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA6
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopA7:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA7
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$7F, $7F, $7F, $7F, $6A, nE1, $03, nRst, $09, nE1, $0A, nRst
	dc.b	$02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst
	dc.b	$09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst
	dc.b	$09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst
	dc.b	$02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopA8:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA8
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopA9:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA9
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_LoopAA:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopAA
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_LoopAB:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopAB
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_LoopAC:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopAC
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopAD:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopAD
	dc.b	nD1, $03, nRst, $09, nEb1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$0E, nD1, $10, nFs1, nD1, nE1, $06, nRst, $7F, $0B, nFs1, $10
	dc.b	nA1, nFs1, nE1, $06, nRst, $7F, $0B, nBb1, $10, nG1, nFs1
	smpsLoop            $01, $02, Intermission_LoopA1
	smpsSetvoice        $00
	smpsAlterVol        $EB
	smpsPan             panCenter, $00
	smpsJump            Intermission_FM2

; FM3 Data
Intermission_FM3:
	smpsPan             panCenter, $00
	dc.b	nRst, $7F, $29
	smpsSetvoice        $05
	smpsAlterVol        $15
	smpsPan             panRight, $00
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02

Intermission_Loop9A:
	dc.b	nG1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop94:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop94
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop95:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop95
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_Loop96:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop96
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_Loop97:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop97
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop98:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop98
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop99:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop99
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$7F, $7F, $7F, $7F, $6A, nE1, $03, nRst, $09, nE1, $0C
	smpsLoop            $01, $03, Intermission_Loop9A
	dc.b	nG1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop9B:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop9B
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop9C:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop9C
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_Loop9D:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop9D
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_Loop9E:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop9E
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop9F:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop9F
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_LoopA0:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopA0
	dc.b	nD1, $03, nRst, $09, nEb1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$7F, $7F, $7F, $41
	smpsSetvoice        $00
	smpsAlterVol        $EB
	smpsPan             panCenter, $00
	smpsJump            Intermission_FM3

; FM4 Data
Intermission_FM4:
	smpsSetvoice        $02
	smpsAlterVol        $10
	smpsPan             panLeft, $00
	smpsAlterNote       $0D

Intermission_Loop77:
	dc.b	nEb3, $01, nRst, $0B
	smpsLoop            $00, $0C, Intermission_Loop77
	dc.b	nEb3, $01, nRst, $17
	smpsSetvoice        $06
	smpsAlterVol        $05
	smpsAlterNote       $00
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02

Intermission_Loop78:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop78
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop79:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop79
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_Loop7A:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop7A
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_Loop7B:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop7B
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop7C:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop7C
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop7D:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop7D
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$0E
	smpsSetvoice        $02
	smpsAlterVol        $FB

Intermission_Loop7E:
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $0F
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0F
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $0F
	smpsPan             panLeft, $00
	smpsAlterNote       $0D
	dc.b	nEb3, $01, nRst, $7F, $10
	smpsLoop            $00, $02, Intermission_Loop7E
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $05, nFs4, $01, nRst, $0B
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0B
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $05, nAb3, $01, nRst, $0B
	smpsPan             panLeft, $00
	smpsAlterNote       $0D
	dc.b	nEb3, $01, nRst, $5F

Intermission_Loop7F:
	dc.b	nEb3, $01, nRst, $0B
	smpsLoop            $00, $04, Intermission_Loop7F
	dc.b	nEb3, $01, nRst, $17
	smpsSetvoice        $06
	smpsAlterVol        $05
	smpsAlterNote       $00
	dc.b	nE1, $03, nRst, $09, nE1, $0C, nG1, $0A, nRst, $02, nE1, $03
	dc.b	nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A
	dc.b	nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A
	dc.b	nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A
	dc.b	nRst, $02

Intermission_Loop80:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop80
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop81:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop81
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_Loop82:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop82
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_Loop83:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop83
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop84:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop84
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop85:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop85
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$0E
	smpsSetvoice        $02
	smpsAlterVol        $FB
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $0F
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0F
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $0F
	smpsPan             panLeft, $00
	smpsAlterNote       $0D
	dc.b	nEb3, $01, nRst, $7F, $10
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $0F
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0F
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $0F
	smpsPan             panLeft, $00
	smpsAlterNote       $0D
	dc.b	nEb3, $01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack, nB2, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nAb2, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $19
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2, smpsNoAttack
	smpsAlterNote       $09
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack, nB1, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $19
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $09
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1, $02, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack, nB0, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nA0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $19
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE0, smpsNoAttack
	smpsAlterNote       $09
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	nCs0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $4D
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $05, nFs4, $01, nRst, $0B
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0B
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $05, nAb3, $01, nRst, $0B
	smpsPan             panLeft, $00
	smpsAlterNote       $0D

Intermission_Loop86:
	dc.b	nEb3, $01, nRst, $0B
	smpsLoop            $00, $0C, Intermission_Loop86
	dc.b	nEb3, $01, nRst, $17
	smpsSetvoice        $06
	smpsAlterVol        $05
	smpsAlterNote       $00
	dc.b	nE1, $03, nRst, $09, nE1, $0C, nG1, $0A, nRst, $02, nE1, $03
	dc.b	nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A
	dc.b	nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A
	dc.b	nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A
	dc.b	nRst, $02

Intermission_Loop87:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop87
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop88:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop88
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_Loop89:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop89
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_Loop8A:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop8A
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop8B:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop8B
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop8C:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop8C
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09
	smpsSetvoice        $05
	dc.b	nE1, $03, nRst, $7F, $7F, $7F, $7F, $7F, $22
	smpsSetvoice        $02
	smpsAlterVol        $FB
	smpsAlterNote       $0D

Intermission_Loop8D:
	dc.b	nEb3, $01, nRst, $05
	smpsLoop            $00, $08, Intermission_Loop8D
	dc.b	nEb3, $01, nRst, $17
	smpsSetvoice        $05
	smpsAlterVol        $05
	smpsAlterNote       $00
	dc.b	nE1, $03, nRst, $09, nE1, $0C
	smpsSetvoice        $06
	dc.b	nG1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop8E:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop8E
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop8F:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop8F
	dc.b	nFs1, $03, nRst, $09, nG1, $03, nRst, $09, nBb1, $0A, nRst, $02
	dc.b	nG1, $03, nRst, $09, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nC2, $0A, nRst, $02

Intermission_Loop90:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop90
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $16, nRst, $02, nG1, $03, nRst, $09, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nG1, $03, nRst, $09, nG1, $03, nRst, $09
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02

Intermission_Loop91:
	dc.b	nG1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop91
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $03, nRst, $09
	dc.b	nG1, $03, nRst, $09, nG1, $0A, nRst, $02, nCs2, $0A, nRst, $02
	dc.b	nG1, $0A, nRst, $02, nC2, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nF1, $03, nRst, $09, nF1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02, nA1, $0A, nRst, $02

Intermission_Loop92:
	dc.b	nE1, $0A, nRst, $02, nG1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop92
	dc.b	nE1, $0A, nRst, $02, nFs1, $0A, nRst, $02, nE1, $03, nRst, $09
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02
	dc.b	nE1, $0A, nRst, $02, nA1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nG1, $16, nRst, $02

Intermission_Loop93:
	dc.b	nE1, $03, nRst, $09, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09, nE1, $03, nRst, $09, nE1, $0A, nRst, $02
	dc.b	nFs1, $0A, nRst, $02, nE1, $03, nRst, $09, nE1, $03, nRst, $09
	dc.b	nE1, $0A, nRst, $02, nBb1, $0A, nRst, $02, nE1, $0A, nRst, $02
	dc.b	nA1, $0A, nRst, $02, nE1, $0A, nRst, $02, nG1, $0A, nRst, $02
	dc.b	nE1, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop93
	dc.b	nD1, $03, nRst, $09, nEb1, $03, nRst, $09, nE1, $03, nRst, $7F
	dc.b	$0E
	smpsSetvoice        $02
	smpsAlterVol        $FB
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $0F
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0F
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $0F
	smpsPan             panLeft, $00
	smpsAlterNote       $0D
	dc.b	nEb3, $01, nRst, $7F, $10
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $0F
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0F
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $0F
	smpsPan             panLeft, $00
	smpsAlterNote       $0D
	dc.b	nEb3, $01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack, nB2, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nAb2, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $19
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2, smpsNoAttack
	smpsAlterNote       $09
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack, nB1, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $19
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $09
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	nCs1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1, $02, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack, nB0, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nA0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $19
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE0, smpsNoAttack
	smpsAlterNote       $09
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	nCs0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $4D
	smpsPan             panRight, $00
	smpsAlterNote       $17
	dc.b	nFs4, $01, nRst, $05, nFs4, $01, nRst, $0B
	smpsPan             panCenter, $00
	smpsAlterNote       $09
	dc.b	nCs4, $01, nRst, $0B
	smpsAlterNote       $14
	dc.b	nAb3, $01, nRst, $05, nAb3, $01, nRst, $0B
	smpsSetvoice        $00
	smpsAlterVol        $F0
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	smpsJump            Intermission_FM4

; FM5 Data
Intermission_FM5:
	smpsSetvoice        $03
	smpsAlterVol        $10
	smpsPan             panCenter, $00

Intermission_Loop4D:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0C, Intermission_Loop4D
	dc.b	nE2, $03, nRst, $15, nE2, $03, nRst, $09, nE2, $0C, nG2, $0A
	dc.b	nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A
	dc.b	nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03
	dc.b	nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A
	dc.b	nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop4E:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop4E
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop4F:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop4F
	dc.b	nFs2, $03, nRst, $09, nG2, $03, nRst, $09, nBb2, $0A, nRst, $02
	dc.b	nG2, $03, nRst, $09, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02

Intermission_Loop50:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop50
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $16, nRst, $02, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02

Intermission_Loop51:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop51
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nF2, $03, nRst, $09, nF2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop52:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop52
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop53:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop53

Intermission_Loop54:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $03, Intermission_Loop54
	smpsAlterVol        $06

Intermission_Loop55:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $33, Intermission_Loop55

Intermission_Loop56:
	smpsAlterVol        $FF
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop56

Intermission_Loop57:
	smpsAlterVol        $FE
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop57

Intermission_Loop58:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $04, Intermission_Loop58
	dc.b	nE2, $03, nRst, $15, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop59:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop59
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop5A:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop5A
	dc.b	nFs2, $03, nRst, $09, nG2, $03, nRst, $09, nBb2, $0A, nRst, $02
	dc.b	nG2, $03, nRst, $09, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02

Intermission_Loop5B:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop5B
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $16, nRst, $02, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02

Intermission_Loop5C:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop5C
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nF2, $03, nRst, $09, nF2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop5D:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop5D
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop5E:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop5E
	dc.b	nD2, $03, nRst, $09, nEb2, $03, nRst, $09, nE2, $03, nRst, $09
	smpsAlterVol        $06

Intermission_Loop5F:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0B, Intermission_Loop5F
	smpsAlterVol        $FA
	dc.b	nD2, $10, nFs2, nD2, nE2, $06, nRst
	smpsAlterVol        $06

Intermission_Loop60:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0B, Intermission_Loop60
	smpsAlterVol        $FA
	dc.b	nFs2, $10, nA2, nFs2, nE2, $03, nRst, $09
	smpsAlterVol        $06

Intermission_Loop61:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0B, Intermission_Loop61
	smpsAlterVol        $FA
	dc.b	nBb2, $10, nG2, nFs2

Intermission_Loop62:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0C, Intermission_Loop62
	dc.b	nE2, $03, nRst, $15, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop63:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop63
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop64:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop64
	dc.b	nFs2, $03, nRst, $09, nG2, $03, nRst, $09, nBb2, $0A, nRst, $02
	dc.b	nG2, $03, nRst, $09, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02

Intermission_Loop65:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop65
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $16, nRst, $02, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02

Intermission_Loop66:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop66
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nF2, $03, nRst, $09, nF2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop67:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop67
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop68:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop68

Intermission_Loop69:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $03, Intermission_Loop69
	smpsAlterVol        $06

Intermission_Loop6A:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $33, Intermission_Loop6A

Intermission_Loop6B:
	smpsAlterVol        $FF
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop6B

Intermission_Loop6C:
	smpsAlterVol        $FE
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop6C

Intermission_Loop6D:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $04, Intermission_Loop6D
	dc.b	nE2, $03, nRst, $15, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop6E:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop6E
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop6F:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop6F
	dc.b	nFs2, $03, nRst, $09, nG2, $03, nRst, $09, nBb2, $0A, nRst, $02
	dc.b	nG2, $03, nRst, $09, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nC3, $0A, nRst, $02

Intermission_Loop70:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop70
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $16, nRst, $02, nG2, $03, nRst, $09, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nG2, $03, nRst, $09, nG2, $03, nRst, $09
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02

Intermission_Loop71:
	dc.b	nG2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop71
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $03, nRst, $09
	dc.b	nG2, $03, nRst, $09, nG2, $0A, nRst, $02, nCs3, $0A, nRst, $02
	dc.b	nG2, $0A, nRst, $02, nC3, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nF2, $03, nRst, $09, nF2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02, nA2, $0A, nRst, $02

Intermission_Loop72:
	dc.b	nE2, $0A, nRst, $02, nG2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop72
	dc.b	nE2, $0A, nRst, $02, nFs2, $0A, nRst, $02, nE2, $03, nRst, $09
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02
	dc.b	nE2, $0A, nRst, $02, nA2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nG2, $16, nRst, $02

Intermission_Loop73:
	dc.b	nE2, $03, nRst, $09, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09, nE2, $03, nRst, $09, nE2, $0A, nRst, $02
	dc.b	nFs2, $0A, nRst, $02, nE2, $03, nRst, $09, nE2, $03, nRst, $09
	dc.b	nE2, $0A, nRst, $02, nBb2, $0A, nRst, $02, nE2, $0A, nRst, $02
	dc.b	nA2, $0A, nRst, $02, nE2, $0A, nRst, $02, nG2, $0A, nRst, $02
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop73
	dc.b	nD2, $03, nRst, $09, nEb2, $03, nRst, $09, nE2, $03, nRst, $09
	smpsAlterVol        $06

Intermission_Loop74:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0B, Intermission_Loop74
	smpsAlterVol        $FA
	dc.b	nD2, $10, nFs2, nD2, nE2, $06, nRst
	smpsAlterVol        $06

Intermission_Loop75:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0B, Intermission_Loop75
	smpsAlterVol        $FA
	dc.b	nFs2, $10, nA2, nFs2, nE2, $03, nRst, $09
	smpsAlterVol        $06

Intermission_Loop76:
	dc.b	nE2, $03, nRst, $09
	smpsLoop            $00, $0B, Intermission_Loop76
	smpsAlterVol        $FA
	dc.b	nBb2, $10, nG2, nFs2
	smpsSetvoice        $00
	smpsAlterVol        $F0
	smpsPan             panCenter, $00
	smpsJump            Intermission_FM5

; FM6 Data
Intermission_FM6:
	smpsSetvoice        $04
	smpsAlterVol        $12
	smpsPan             panCenter, $00
	smpsAlterNote       $17

Intermission_Loop00:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $0C, Intermission_Loop00
	dc.b	nFs3, $01, nRst, $2F
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop01:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop01
	dc.b	nFs3, $01, nRst, $17

Intermission_Loop03:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop02:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop02
	smpsLoop            $01, $03, Intermission_Loop03
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17

Intermission_Loop05:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop04:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop04
	smpsLoop            $01, $03, Intermission_Loop05

Intermission_Loop07:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop06:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop06
	smpsLoop            $01, $03, Intermission_Loop07
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop08:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $06, Intermission_Loop08
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop0A:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop09:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop09
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $03, Intermission_Loop0A
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop0C:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop0B:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $08, Intermission_Loop0C

Intermission_Loop0E:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop0D:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop0D
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $02, Intermission_Loop0E

Intermission_Loop10:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop0F:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop0F
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $08, Intermission_Loop10
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $23, nFs3, $01, nRst, $17

Intermission_Loop12:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop11:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17
	smpsLoop            $00, $02, Intermission_Loop11
	smpsLoop            $01, $02, Intermission_Loop12
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17

Intermission_Loop13:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $04, Intermission_Loop13
	dc.b	nFs3, $01, nRst, $2F
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop14:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop14
	dc.b	nFs3, $01, nRst, $17

Intermission_Loop16:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop15:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop15
	smpsLoop            $01, $03, Intermission_Loop16
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17

Intermission_Loop18:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop17:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop17
	smpsLoop            $01, $03, Intermission_Loop18

Intermission_Loop1A:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop19:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop19
	smpsLoop            $01, $03, Intermission_Loop1A
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop1B:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $06, Intermission_Loop1B
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop1D:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop1C:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop1C
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $03, Intermission_Loop1D
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop1F:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop1E:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop1E
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $08, Intermission_Loop1F

Intermission_Loop21:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop20:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop20
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $02, Intermission_Loop21

Intermission_Loop23:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop22:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop22
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $08, Intermission_Loop23
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $23, nFs3, $01, nRst, $17
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop24:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17
	smpsLoop            $00, $02, Intermission_Loop24
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02

Intermission_Loop25:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $0C, Intermission_Loop25
	dc.b	nFs3, $01, nRst, $2F
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop26:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop26
	dc.b	nFs3, $01, nRst, $17

Intermission_Loop28:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop27:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop27
	smpsLoop            $01, $03, Intermission_Loop28
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17

Intermission_Loop2A:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop29:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop29
	smpsLoop            $01, $03, Intermission_Loop2A

Intermission_Loop2C:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop2B:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop2B
	smpsLoop            $01, $03, Intermission_Loop2C
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop2D:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $06, Intermission_Loop2D
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop2F:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop2E:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop2E
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $03, Intermission_Loop2F
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop31:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop30:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop30
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $08, Intermission_Loop31

Intermission_Loop33:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop32:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop32
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $02, Intermission_Loop33

Intermission_Loop35:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop34:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop34
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $09, Intermission_Loop35

Intermission_Loop37:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop36:
	dc.b	nFs3, $01, nRst, $05
	smpsLoop            $00, $04, Intermission_Loop36
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $05, nFs3, $01, nRst, $05, nFs3, $01, nRst, $0B
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $05, Intermission_Loop37
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop38:
	dc.b	nFs3, $01, nRst, $05
	smpsLoop            $00, $04, Intermission_Loop38
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop39:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $05
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $05
	smpsLoop            $00, $02, Intermission_Loop39
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop3A:
	dc.b	nFs3, $01, nRst, $05
	smpsLoop            $00, $04, Intermission_Loop3A
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17

Intermission_Loop3B:
	dc.b	nFs3, $01, nRst, $05
	smpsLoop            $00, $08, Intermission_Loop3B
	dc.b	nFs3, $01, nRst, $2F
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop3C:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop3C
	dc.b	nFs3, $01, nRst, $17

Intermission_Loop3E:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop3D:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop3D
	smpsLoop            $01, $03, Intermission_Loop3E
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17

Intermission_Loop40:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop3F:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop3F
	smpsLoop            $01, $03, Intermission_Loop40

Intermission_Loop42:
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop41:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop41
	smpsLoop            $01, $03, Intermission_Loop42
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop43:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $06, Intermission_Loop43
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop45:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop44:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop44
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $03, Intermission_Loop45
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B

Intermission_Loop47:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop46:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop46
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $08, Intermission_Loop47

Intermission_Loop49:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop48:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop48
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $02, Intermission_Loop49

Intermission_Loop4B:
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop4A:
	dc.b	nFs3, $01, nRst, $0B
	smpsLoop            $00, $03, Intermission_Loop4A
	smpsSetvoice        $04
	smpsAlterVol        $02
	smpsLoop            $01, $08, Intermission_Loop4B
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $23, nFs3, $01, nRst, $17
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE

Intermission_Loop4C:
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17
	smpsLoop            $00, $02, Intermission_Loop4C
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $23
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B
	smpsSetvoice        $04
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $17
	smpsSetvoice        $07
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $0B, nFs3, $01, nRst, $17, nFs3, $01, nRst, $0B
	smpsSetvoice        $00
	smpsAlterVol        $F0
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	smpsJump            Intermission_FM6

; PSG1 Data
Intermission_PSG1:
	dc.b	nRst

Intermission_LoopF4:
	dc.b	$7F
	smpsLoop            $00, $30, Intermission_LoopF4
	dc.b	$30
	smpsPSGAlterVol     $02

Intermission_LoopF5:
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsLoop            $00, $0C, Intermission_LoopF5
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $15
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopF6:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopF6
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopF7:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopF7
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopF9:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopF8:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopF8
	smpsLoop            $01, $02, Intermission_LoopF9
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopFA:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopFA
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$17
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopFB:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopFB
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopFC:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopFC
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopFE:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopFD:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopFD
	smpsLoop            $01, $02, Intermission_LoopFE
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopFF:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopFF
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop100:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop100
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop101:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop101
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop103:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop102:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop102
	smpsLoop            $01, $02, Intermission_Loop103
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop104:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop104
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$17
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop105:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop105
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop106:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop106
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop108:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop107:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop107
	smpsLoop            $01, $02, Intermission_Loop108
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop109:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop109
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nA0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nA0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop10A:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop10A
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop10B:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop10B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop10D:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop10C:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop10C
	smpsLoop            $01, $02, Intermission_Loop10D
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop10E:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop10E
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$17
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop10F:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop10F
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop110:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop110
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop112:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop111:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop111
	smpsLoop            $01, $02, Intermission_Loop112
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop113:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop113
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop114:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $03, Intermission_Loop114
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $7F, $7F, $7F, $7F, $7F, $6A
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop115:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop115
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop116:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop116
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop118:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop117:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop117
	smpsLoop            $01, $02, Intermission_Loop118
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop119:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop119
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$17
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop11A:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop11A
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop11B:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop11B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop11D:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop11C:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop11C
	smpsLoop            $01, $02, Intermission_Loop11D
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop11E:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop11E
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop11F:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop11F
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop120:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop120
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop122:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop121:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop121
	smpsLoop            $01, $02, Intermission_Loop122
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop123:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop123
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$17
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop124:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop124
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop125:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop125
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop127:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop126:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop126
	smpsLoop            $01, $02, Intermission_Loop127
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_Loop128:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop128
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nA0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nA0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop129:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop129
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop12A:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop12A
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop12C:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop12B:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop12B
	smpsLoop            $01, $02, Intermission_Loop12C
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop12D:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop12D
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$17
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop12E:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop12E
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop12F:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop12F
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop131:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop130:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop130
	smpsLoop            $01, $02, Intermission_Loop131
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_Loop132:
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_Loop132
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nFs0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nG0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nAb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $7F, $7F, $7F, $7F, $41
	smpsPSGAlterVol     $FB
	smpsJump            Intermission_PSG1

; PSG2 Data
Intermission_PSG2:
	dc.b	nRst

Intermission_LoopD5:
	dc.b	$7F
	smpsLoop            $00, $49, Intermission_LoopD5
	dc.b	$71
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopD6:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopD6
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopD7:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopD7
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopD9:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopD8:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopD8
	smpsLoop            $01, $02, Intermission_LoopD9
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopDA:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopDA
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$17
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopDB:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopDB
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopDC:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopDC
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopDE:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopDD:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopDD
	smpsLoop            $01, $02, Intermission_LoopDE
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopDF:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopDF
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE0:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE0
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE1:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE1
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE3:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE2:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE2
	smpsLoop            $01, $02, Intermission_LoopE3
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE4:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE4
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	dc.b	$17
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE5:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE5
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE6:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE6
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE8:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE7:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE7
	smpsLoop            $01, $02, Intermission_LoopE8
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopE9:
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopE9
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nAb1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nG1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nC1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nC1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopEA:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopEA
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopEB:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopEB
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopED:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopEC:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopEC
	smpsLoop            $01, $02, Intermission_LoopED
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopEE:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopEE
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$17
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopEF:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopEF
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopF0:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopF0
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopF2:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B

Intermission_LoopF1:
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopF1
	smpsLoop            $01, $02, Intermission_LoopF2
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	dc.b	nCs1, $01
	smpsPSGAlterVol     $03
	dc.b	$0B

Intermission_LoopF3:
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsLoop            $00, $02, Intermission_LoopF3
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nF1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nE1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $00
	dc.b	nD1, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $00
	dc.b	$0B
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nA0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nBb0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $09
	smpsPSGAlterVol     $FD
	dc.b	nB0, $01
	smpsPSGAlterVol     $03
	dc.b	$02, nRst, $7F, $7F, $7F, $7F, $41
	smpsPSGAlterVol     $FB
	smpsJump            Intermission_PSG2

; PSG3 Data
Intermission_PSG3:
	dc.b	nRst, $7F, $11
	smpsPSGAlterVol     $02
	smpsPSGform         $E7
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $03
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $04
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $02
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02, nRst, $23

Intermission_LoopBE:
	smpsPSGAlterVol     $F4
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC

Intermission_LoopBC:
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopBB:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopBB
	dc.b	nRst, $01
	smpsPSGAlterVol     $F5
	smpsLoop            $01, $06, Intermission_LoopBC
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopBD:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopBD
	dc.b	nRst, $01
	smpsLoop            $02, $0C, Intermission_LoopBE
	smpsPSGAlterVol     $F4
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopBF:
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $28
	smpsPSGAlterVol     $F6
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsLoop            $00, $0D, Intermission_LoopBF
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $40
	smpsPSGAlterVol     $F5
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $03
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $04
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $02
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02, nRst, $23

Intermission_LoopC3:
	smpsPSGAlterVol     $F4
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC

Intermission_LoopC1:
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopC0:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopC0
	dc.b	nRst, $01
	smpsPSGAlterVol     $F5
	smpsLoop            $01, $06, Intermission_LoopC1
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopC2:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopC2
	dc.b	nRst, $01
	smpsLoop            $02, $0C, Intermission_LoopC3
	smpsPSGAlterVol     $F4

Intermission_LoopC5:
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopC4:
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $28
	smpsPSGAlterVol     $F6
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsLoop            $00, $03, Intermission_LoopC4
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $10
	smpsPSGAlterVol     $F5
	smpsLoop            $01, $02, Intermission_LoopC5
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopC6:
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $28
	smpsPSGAlterVol     $F6
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsLoop            $00, $03, Intermission_LoopC6
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $7F, $21
	smpsPSGAlterVol     $F5
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $03
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $04
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $02
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02, nRst, $23

Intermission_LoopCA:
	smpsPSGAlterVol     $F4
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC

Intermission_LoopC8:
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopC7:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopC7
	dc.b	nRst, $01
	smpsPSGAlterVol     $F5
	smpsLoop            $01, $06, Intermission_LoopC8
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopC9:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopC9
	dc.b	nRst, $01
	smpsLoop            $02, $0C, Intermission_LoopCA
	smpsPSGAlterVol     $F4
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC

Intermission_LoopCC:
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $04
	smpsPSGAlterVol     $F6
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01

Intermission_LoopCB:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $05, Intermission_LoopCB
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $FA
	smpsLoop            $01, $1B, Intermission_LoopCC
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopCD:
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $04
	smpsPSGAlterVol     $F6
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsLoop            $00, $03, Intermission_LoopCD
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $04
	smpsPSGAlterVol     $F5
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$03
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $03
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $04
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $02
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02, nRst, $23

Intermission_LoopD1:
	smpsPSGAlterVol     $F4
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC

Intermission_LoopCF:
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopCE:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopCE
	dc.b	nRst, $01
	smpsPSGAlterVol     $F5
	smpsLoop            $01, $06, Intermission_LoopCF
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopD0:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $0B, Intermission_LoopD0
	dc.b	nRst, $01
	smpsLoop            $02, $0C, Intermission_LoopD1
	smpsPSGAlterVol     $F4

Intermission_LoopD3:
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopD2:
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $28
	smpsPSGAlterVol     $F6
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsLoop            $00, $03, Intermission_LoopD2
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $10
	smpsPSGAlterVol     $F5
	smpsLoop            $01, $02, Intermission_LoopD3
	smpsAlterNote       $FC
	dc.b	nAb5, $04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC
	smpsAlterNote       $01
	dc.b	nMaxPSG

Intermission_LoopD4:
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $28
	smpsPSGAlterVol     $F6
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsLoop            $00, $03, Intermission_LoopD4
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$01, nRst, $10
	smpsPSGAlterVol     $F3
	smpsJump            Intermission_PSG3

Intermission_Voices:
;	Voice $00
;	$3B
;	$26, $12, $73, $36, 	$10, $11, $1F, $11, 	$00, $0F, $0F, $00
;	$00, $00, $00, $00, 	$00, $17, $40, $07, 	$13, $13, $19, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $07, $01, $02
	smpsVcCoarseFreq    $06, $03, $02, $06
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $11, $1F, $11, $10
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $0F, $0F, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $04, $01, $00
	smpsVcReleaseRate   $07, $00, $07, $00
	smpsVcTotalLevel    $00, $19, $13, $13

;	Voice $01
;	$3B
;	$76, $12, $73, $36, 	$10, $11, $1F, $11, 	$00, $0F, $0F, $00
;	$00, $00, $00, $00, 	$00, $18, $40, $08, 	$13, $12, $19, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $07, $01, $07
	smpsVcCoarseFreq    $06, $03, $02, $06
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $11, $1F, $11, $10
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $0F, $0F, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $04, $01, $00
	smpsVcReleaseRate   $08, $00, $08, $00
	smpsVcTotalLevel    $00, $19, $12, $13

;	Voice $02
;	$3B
;	$01, $01, $01, $00, 	$1B, $1B, $17, $1F, 	$13, $17, $1A, $00
;	$16, $12, $14, $00, 	$F9, $B9, $C9, $02, 	$00, $00, $00, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $17, $1B, $1B
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1A, $17, $13
	smpsVcDecayRate2    $00, $14, $12, $16
	smpsVcDecayLevel    $00, $0C, $0B, $0F
	smpsVcReleaseRate   $02, $09, $09, $09
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $03
;	$3B
;	$38, $00, $00, $00, 	$1F, $1F, $1F, $1F, 	$0F, $0F, $0F, $0F
;	$08, $08, $08, $08, 	$27, $27, $27, $07, 	$1B, $28, $0E, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $03
	smpsVcCoarseFreq    $00, $00, $00, $08
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0F, $0F, $0F, $0F
	smpsVcDecayRate2    $08, $08, $08, $08
	smpsVcDecayLevel    $00, $02, $02, $02
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $0E, $28, $1B

;	Voice $04
;	$3C
;	$30, $30, $50, $51, 	$17, $17, $1F, $1F, 	$00, $00, $17, $00
;	$00, $00, $18, $00, 	$04, $06, $FE, $05, 	$00, $00, $04, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $01, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $17, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $00
	smpsVcDecayRate2    $00, $18, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $00
	smpsVcReleaseRate   $05, $0E, $06, $04
	smpsVcTotalLevel    $00, $04, $00, $00

;	Voice $05
;	$39
;	$04, $73, $51, $11, 	$1F, $10, $17, $1F, 	$13, $15, $04, $04
;	$00, $05, $04, $04, 	$2F, $0F, $2F, $7F, 	$0B, $1B, $17, $00
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $05, $07, $00
	smpsVcCoarseFreq    $01, $01, $03, $04
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $17, $10, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $04, $15, $13
	smpsVcDecayRate2    $04, $04, $05, $00
	smpsVcDecayLevel    $07, $02, $00, $02
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $17, $1B, $0B

;	Voice $06
;	$3B
;	$04, $73, $51, $11, 	$1F, $17, $17, $17, 	$13, $15, $00, $04
;	$00, $05, $04, $04, 	$2E, $0B, $26, $77, 	$0B, $1B, $17, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $05, $07, $00
	smpsVcCoarseFreq    $01, $01, $03, $04
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $17, $17, $17, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $00, $15, $13
	smpsVcDecayRate2    $04, $04, $05, $00
	smpsVcDecayLevel    $07, $02, $00, $02
	smpsVcReleaseRate   $07, $06, $0B, $0E
	smpsVcTotalLevel    $00, $17, $1B, $0B

;	Voice $07
;	$3B
;	$00, $00, $00, $00, 	$19, $19, $19, $19, 	$19, $19, $19, $00
;	$19, $19, $19, $00, 	$FA, $FA, $FA, $02, 	$00, $00, $00, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $19, $19
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $19, $19
	smpsVcDecayRate2    $00, $19, $19, $19
	smpsVcDecayLevel    $00, $0F, $0F, $0F
	smpsVcReleaseRate   $02, $0A, $0A, $0A
	smpsVcTotalLevel    $00, $00, $00, $00

