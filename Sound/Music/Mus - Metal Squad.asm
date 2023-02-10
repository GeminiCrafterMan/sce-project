Metal_Squad_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     Metal_Squad_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       Metal_Squad_DAC,	$00, $F2
	smpsHeaderFM        Metal_Squad_FM1,	$00, $00
	smpsHeaderFM        Metal_Squad_FM2,	$00, $00
	smpsHeaderFM        Metal_Squad_FM3,	$00, $00
	smpsHeaderFM        Metal_Squad_FM4,	$00, $00
	smpsHeaderFM        Metal_Squad_FM5,	$00, $00
	smpsHeaderFM        Metal_Squad_FM6,	$00, $00
	smpsHeaderPSG       Metal_Squad_PSG1,	$00, $00, $00, $00
	smpsHeaderPSG       Metal_Squad_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       Metal_Squad_PSG3,	$00, $00, $00, $00

; DAC Data
Metal_Squad_DAC:
; PSG3 Data
Metal_Squad_PSG3:
	smpsStop

; FM1 Data
Metal_Squad_FM1:
	smpsSetvoice        $00
	smpsAlterVol        $0E
	smpsPan             panCenter, $00
	dc.b	nEb2, $08, nRst, $01, nF2, $11, nRst, $0B

Metal_Squad_Jump05:
	dc.b	nAb3, $07, nRst, $0B, nG3, $07, nRst, $02, nF2, $01, nRst, $08
	dc.b	nAb3, nRst, $01, nF2, $11, nRst, $01, nF2, nRst, $09, nAb3, $07
	dc.b	nRst, $0B, nG3, $07, nRst, $02, nF2, $01, nRst, $08, nAb3, $07
	dc.b	nRst, $02, nF2, $11, nRst, $01, nF2, nRst, $08, nAb3, nRst, $01
	dc.b	nF2, nRst, $09, nG3, $07, nRst, $0B, nAb3, $07, nRst, $02, nF2
	dc.b	$10, nRst, $02, nF2, $01, nRst, $08, nAb3, nRst, $01, nF2, nRst
	dc.b	$08, nG3, nRst, $01, nF3, nRst, $09, smpsNoAttack, nRst, nCs2, $10, nRst
	dc.b	$02, nCs2, $01, nRst, $08, nF3, $07, nRst, $02, nCs2, $01, nRst
	dc.b	$08, nEb3, nRst, $01, nCs2, nRst, $08, nF3, nRst, $01, nCs2, $11
	dc.b	nRst, $0B, nF3, $07, nRst, $02, nCs2, $01, nRst, $08, nEb3, $07
	dc.b	nRst, $02, nCs2, $01, nRst, $08, nCs2, $01, nRst, $08, nEb2, $11
	dc.b	nRst, $01, nEb2, nRst, $09, nG3, $07, nRst, $0B, nF3, $07, nRst
	dc.b	$02, nEb2, $01, nRst, $08, nG3, $07, nRst, $02, nEb2, $11, nRst
	dc.b	$01, nEb2, nRst, $08, nG3, nRst, $01, nEb2, nRst, $09, nF3, $07
	dc.b	nRst, $14, nF2, $11, nRst, $02, nF2, $01, nRst, $08, nAb3, $07
	dc.b	nRst, $02, nF2, $01, nRst, $08, nG3, nRst, $01, nF2, nRst, $08
	dc.b	nAb3, nRst, $01, nF2, $11, nRst, $0B, nAb3, $07, nRst, $02, nF2
	dc.b	$01, nRst, $08, nG3, $07, nRst, $02, nF2, $01, nRst, $08, nAb3
	dc.b	nRst, $02, nF2, $11, nRst, $01, nF2, nRst, $08, nAb3, nRst, $01
	dc.b	nF2, nRst, $09, nG3, $07, nRst, $0B, nAb3, $07, nRst, $02, nF2
	dc.b	$10, nRst, $02, nF2, $01, nRst, $08, nAb3, nRst, $01, nF2, nRst
	dc.b	$08, nG3, nRst, $01, nF3, nRst, $12, nCs2, $10, nRst, $02, nCs2
	dc.b	$01, nRst, $08, nF3, $07, nRst, $02, nCs2, $01, nRst, $08, nEb3
	dc.b	nRst, $01, nCs2, nRst, $08, nF3, nRst, $01, nCs2, $11, nRst, $0B
	dc.b	nF3, $07, nRst, $02, nCs2, $01, nRst, $08, nEb3, $07, nRst, $02
	dc.b	nCs2, $01, nRst, $08, nCs2, $01, nRst, $08, nEb2, $11, nRst, $01
	dc.b	nEb2, nRst, $09, nG3, $07, nRst, $0B, nF3, $07, nRst, $02, nEb2
	dc.b	$01, nRst, $08, nG3, nRst, $02, nEb2, $10, nRst, $02, nEb2, $01
	dc.b	nRst, $08, nG3, nRst, $01, nEb2, nRst, $08, nF3, nRst, $01, nEb2
	dc.b	nRst, $12, nF3, $11, nRst, $1D, nF2, $01, nRst, $08, nF2, $01
	dc.b	nRst, $08, nF2, $01, nRst, $09, nF3, $11, nRst, $01, nF2

Metal_Squad_Loop7C:
	dc.b	nRst, $08, nF2, $01
	smpsLoop            $00, $03, Metal_Squad_Loop7C
	dc.b	nRst, $1B, nF3, $10, nRst, $02

Metal_Squad_Loop7D:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $05, Metal_Squad_Loop7D
	dc.b	nF2, $01, nRst, $09, nF3, $10, nRst, $0B, nF2, $01, nRst, $08
	dc.b	nF2, $01, nRst, $08, nF3, $1A, nRst, $01, nCs3, $11, nRst, $1D
	dc.b	nCs2, $01, nRst, $08, nCs2, $01, nRst, $08, nCs2, $01, nRst, $09
	dc.b	nCs3, $11, nRst, $01, nCs2, nRst, $08, nCs2, $01

Metal_Squad_Loop7E:
	dc.b	nRst, $08, nCs2, $01, nRst, $08, nCs2, $02
	smpsLoop            $00, $02, Metal_Squad_Loop7E
	dc.b	nRst, $08, nEb3, $11, nRst, $01, nEb2, nRst, $09, smpsNoAttack, nRst, smpsNoAttack
	dc.b	nRst, smpsNoAttack, nRst, nEb2, $01, nRst, $08, nEb2, $01, nRst, $08, nG3
	dc.b	$11, nRst, $01, nF3, $08, nRst, $01, nEb3, $08, nRst, $01, nCs3
	dc.b	$08, nRst, $02, nEb3, $07, nRst, $02, nG3, $10, nRst, $02, nF3
	dc.b	$10, nRst, $02

Metal_Squad_Loop7F:
	dc.b	nF2, $01, nRst, $08, nF2, $02, nRst, $08
	smpsLoop            $00, $03, Metal_Squad_Loop7F
	dc.b	nF3, $11, nRst, $01, nF2

Metal_Squad_Loop80:
	dc.b	nRst, $08, nF2, $01
	smpsLoop            $00, $03, Metal_Squad_Loop80
	dc.b	nRst, $1B, nF3, $10, nRst, $02

Metal_Squad_Loop81:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $05, Metal_Squad_Loop81
	dc.b	nF2, $01, nRst, $09, nF3, $10, nRst, $0B, nF2, $01, nRst, $08
	dc.b	nF2, $01, nRst, $08, nF3, $1B, nRst, $01, nCs3, $11, nRst, $02

Metal_Squad_Loop82:
	dc.b	nCs2, $01, nRst, $08
	smpsLoop            $00, $04, Metal_Squad_Loop82
	dc.b	nCs2, $01, nRst, $09, nCs2, $01, nRst, $08, nEb3, $11, nRst, $14

Metal_Squad_Loop83:
	dc.b	nEb2, $01, nRst, $08
	smpsLoop            $00, $03, Metal_Squad_Loop83
	dc.b	nEb2, $02, nRst, $08, nF3, $11, nRst, $01, nF2, nRst, $08, nF2
	dc.b	$01, nRst, $08, nF2, $01, nRst, $1B, smpsNoAttack, nF2, $01, nRst, $09
	dc.b	nCs3, $10, nRst, $0B, nCs2, $01, nRst, $08, nEb3, $11, nRst, $01
	dc.b	nEb2, nRst, $08, nEb2, $02, nRst, $08, nEb2, $01, nRst, $08, nG3
	dc.b	$4A, smpsNoAttack, $47, nRst, $02, nAb3, $49, smpsNoAttack, $48, nRst, $02, nG3
	dc.b	$49, smpsNoAttack, $48, nRst, $01, nAb3, $47, nRst, $02, nBb3, $3E, nRst
	dc.b	$02, nF2, $11, nRst, $0B, nAb3, $07, nRst, $0B, nG3, $08, nRst
	dc.b	$0B, nAb3, $08, nRst, $02, nF2, $11, nRst, $0B, nAb3, $07, nRst
	dc.b	$02, nF2, $01, nRst, $08, nG3, $07, nRst, $02, nF3, $01, nRst
	dc.b	$08, nB2, $01, nRst, $08, nCs2, $12, nRst, $01, nCs2, nRst, $08
	dc.b	nF3, $09, nRst, $01, nCs2, nRst, $08, nEb3, $09, nRst, $01, nCs2
	dc.b	nRst, $08, nCs2, $02, nRst, $08, nEb2, $11, nRst, $02, nEb2, $01
	dc.b	nRst, $08, nG3, nRst, $02, nEb2, $01, nRst, $08, nF3, nRst, $01
	dc.b	nEb2, nRst, $08, nEb2, $01, nRst, $08, nF2, $12, nRst, $01, nF2
	dc.b	nRst, $08, nAb3, nRst, $0B, nG3, $08, nRst, $0B, nAb3, $08, nRst
	dc.b	$02, nF2, $11, nRst, $01, nF2, nRst, $09, nAb3, $07, nRst, $0B
	dc.b	nG3, $07, nRst, $02, nF3, $01, nRst, $08, nB2, $01, nRst, $08
	dc.b	nCs2, $11, nRst, $02, nCs2, $01, nRst, $08, nF3, nRst, $02, nCs2
	dc.b	$01, nRst, $08, nEb3, nRst, $02, nCs2, $01, nRst, $08, nCs2, $01
	dc.b	nRst, $09, nEb2, $11, nRst, $02, nEb2, $01, nRst, $08, nG3, $07
	dc.b	nRst, $02, nEb2, $01, nRst, $08, nF3, nRst, $02, nEb2, $01, nRst
	dc.b	$08, nEb2, $01, nRst, $08, nF2, $12, nRst, $01, nF2, nRst, $08
	dc.b	nAb3, nRst, $01, nF2, nRst, $09, nG3, $07, nRst, $0B, nAb3, $07
	dc.b	nRst, $02, nBb3, $10, nRst, $02, nF2, $01, nRst, $08, nAb3, nRst
	dc.b	$02, nF2, $01, nRst, $08, nG3, nRst, $02, nF2, $01, nRst, $08
	dc.b	nAb3, nRst, $02, nF2, $10, nRst, $02, nF2, $01, nRst, $08, nAb3
	dc.b	nRst, $02, nF2, $01, nRst, $08, nG3, nRst, $02, nF2, $01, nRst
	dc.b	$09, nAb3, $07, nRst, $02, nF2, $11, nRst, $01, nF2, nRst, $08
	dc.b	nAb3, nRst, $01, nF2, nRst, $08, nG3, nRst, $0B, nEb2, $08, nRst
	dc.b	$02, nF2, $10, nRst, $0B, nAb3, $07, nRst, $02, nF2, $01, nRst
	dc.b	$08, nG3, nRst, $01, nF2, nRst, $08, nAb3, nRst, $01, nF2, $11
	dc.b	nRst, $0B, nAb3, $07, nRst, $0B, nG3, $07, nRst, $02, nF2, $01
	dc.b	nRst, $08, nAb3, nRst, $01, nF2, $11, nRst, $01, nF2, nRst, $08
	dc.b	nAb3, nRst, $0B, nG3, $07, nRst, $0B, nAb3, $07, nRst, $02, nF2
	dc.b	$11, nRst, $01, nF2, nRst, $08, nAb3, nRst, $01, nF2, nRst, $08
	dc.b	nG3, nRst, $14, nCs2, $10, nRst, $02, nCs2, $01, nRst, $08, nF3
	dc.b	nRst, $01, nCs2, nRst, $08, nEb3, nRst, $01, nCs2, nRst, $08, nF3
	dc.b	nRst, $02, nCs2, $10, nRst, $0B, nF3, $07, nRst, $02, nCs2, $01
	dc.b	nRst, $08, nEb3, nRst, $01, nCs2, nRst, $08, nCs2, $01, nRst, $08
	dc.b	nEb2, $11, nRst, $0B, nG3, $07, nRst, $0B, nF3, $07, nRst, $02
	dc.b	nEb2, $01, nRst, $08, nG3, nRst, $01, nEb2, $11, nRst, $01, nEb2
	dc.b	nRst, $08, nG3, nRst, $0B, nF3, $07, nRst, $0B, nEb2, $01, nRst
	dc.b	$08, nF2, $11, nRst, $02, nF2, $01, nRst, $08, nAb3, nRst, $01
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF2, nRst, $08, nAb3, nRst, $02
	dc.b	nF2, $10, nRst, $0B, nAb3, $07, nRst, $02, nF2, $01, nRst, $08
	dc.b	nG3, nRst, $01, nF2, nRst, $08, nAb3, nRst, $01, nF2, $11, nRst
	dc.b	$0B, nAb3, $07, nRst, $0B, nG3, $07, nRst, $02, nF2, $01, nRst
	dc.b	$08, nAb3, nRst, $01, nF2, $11, nRst, $01, nF2, nRst, $08, nAb3
	dc.b	nRst, $0B, nG3, $07, nRst, $0B, nB2, $01, nRst, $08, nCs2, $11
	dc.b	nRst, $01, nCs2, nRst, $08, nF3, nRst, $01, nCs2, nRst, $08, nEb3
	dc.b	nRst, $0B, nF3, $07, nRst, $02, nCs2, $10, nRst, $02, nCs2, $01
	dc.b	nRst, $08, nF3, nRst, $01, nCs2, nRst, $08, nEb3, nRst, $01, nCs2
	dc.b	nRst, $08, nCs2, $01, nRst, $09, nEb2, $10, nRst, $0B, nG3, $07
	dc.b	nRst, $02, nEb2, $01, nRst, $08, nF3, nRst, $01, nEb2, nRst, $08
	dc.b	nG3, nRst, $01, nEb2, $11, nRst, $0B, nG3, $07, nRst, $0B, nF3
	dc.b	$07, nRst, $02, nEb2, $01, nRst, $08, nEb2, $01, nRst, $08, nF3
	dc.b	$12, nRst, $01, nF2

Metal_Squad_Loop84:
	dc.b	nRst, $08, nF2, $01
	smpsLoop            $00, $03, Metal_Squad_Loop84
	dc.b	nRst, $12, nF2, $01, nRst, $09, nF3, $10, nRst, $0B

Metal_Squad_Loop85:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $05, Metal_Squad_Loop85
	dc.b	nF3, $11, nRst, $1D

Metal_Squad_Loop86:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $03, Metal_Squad_Loop86
	dc.b	nF3, $11, nRst, $01, nF2, nRst, $08, nF2, $01, nRst, $12, nF3
	dc.b	$19, nRst, $02, nCs3, $11, nRst, $01, nCs2

Metal_Squad_Loop87:
	dc.b	nRst, $08, nCs2, $01
	smpsLoop            $00, $03, Metal_Squad_Loop87
	dc.b	nRst, $12, nCs2, $01, nRst, $09, nEb3, $10, nRst, $14

Metal_Squad_Loop88:
	dc.b	nEb2, $01, nRst, $08
	smpsLoop            $00, $03, Metal_Squad_Loop88
	dc.b	nEb2, $02, nRst, $08, nF3, $11, nRst, $01, nF2, nRst, $08, nF2
	dc.b	$01, nRst, $08, nF2, $01, nRst, $24, nCs3, $10, nRst, $02, nCs2
	dc.b	$01, nRst, $08, nCs2, $01, nRst, $08, nEb3, $11, nRst, $01, nEb2
	dc.b	nRst, $09, smpsNoAttack, nRst, smpsNoAttack, nRst, nBb3, $11, nRst, $02, nBb2, $01
	dc.b	nRst, $09, nBb3, $10, nRst, $0B, nBb2, $01, nRst, $09, nBb2, $01
	dc.b	nRst, $08, nBb3, $11, nRst, $02, nBb2, $01, nRst, $09, nBb3, $10
	dc.b	nRst, $02, nBb2, $01, nRst, $08, nBb2, $01, nRst, $09, nBb2, $01

Metal_Squad_Loop89:
	dc.b	nRst, $08, nFs3, $11, nRst, $02, nFs2, $01, nRst, $09, nFs3, $10
	dc.b	nRst, $02, nFs2, $01, nRst, $08, nFs2, $02, nRst, $08, nFs2, $01
	smpsLoop            $00, $02, Metal_Squad_Loop89
	dc.b	nRst, $08, nF3, $11, nRst, $02, nF2, nRst, $08, nF3, $11, nRst
	dc.b	$01, nF2, nRst, $08, nF2, $02, nRst, $08, nF2, $01, nRst, $08
	dc.b	nEb3, $12, nRst, $01, nEb2, $02, nRst, $08, nEb3, $11, nRst, $01
	dc.b	nEb2, nRst, $08, nEb2, $02, nRst, $08, nEb2, $01

Metal_Squad_Loop8A:
	dc.b	nRst, $08, nAb2, $02, nRst, $08, nAb2, $01
	smpsLoop            $00, $04, Metal_Squad_Loop8A
	dc.b	nRst, $08, nCs3, $48, nRst, $02, nFs3, $1A, nRst, $02, nF3, $10
	dc.b	nRst, $02, nF2, $01, nRst, $09, smpsNoAttack, nRst, nF2, $01, nRst, $08
	dc.b	nFs3, $1A, nRst, $02, nF3, $11, nRst, $02, nF2, $01, nRst, $09
	dc.b	nF2, $01, nRst, $08, nF2, $01, nRst, $08, nFs3, $1B, nRst, $01
	dc.b	nF3, $12, nRst, $01, nF2

Metal_Squad_Loop8B:
	dc.b	nRst, $08, nF2, $01
	smpsLoop            $00, $03, Metal_Squad_Loop8B
	dc.b	nRst, $24, nF3, $07, nRst, $02, nF2, $01, nRst, $08, nEb3, nRst
	dc.b	$02, nF2, $11, nRst, $02, nF2, $01, nRst, $08, nAb3, $07, nRst
	dc.b	$02, nF2, $01, nRst, $08, nG3, nRst, $02, nF2, $01, nRst, $08
	dc.b	nAb3, nRst, $02, nF2, $11, nRst, $02, nF2, $01, nRst, $08, nAb3
	dc.b	nRst, $02, nF2, $01, nRst, $08, nG3, nRst, $01, nF3, nRst, $08
	dc.b	nB2, $01, nRst, $08, nCs2, $12, nRst, $01, nCs2, nRst, $08, nF3
	dc.b	$09, nRst, $01, nCs2, nRst, $08, nEb3, $09, nRst, $01, nCs2, nRst
	dc.b	$08, nCs2, $02, nRst, $08, nEb2, $11, nRst, $02, nEb2, $01, nRst
	dc.b	$08, nG3, nRst, $02, nEb2, $01, nRst, $08, nF3, nRst, $01, nEb2
	dc.b	nRst, $08, nEb2, $01, nRst, $08, nF2, $12, nRst, $01, nF2, nRst
	dc.b	$09, nAb3, $07, nRst, $0B, nG3, $08, nRst, $0B, nAb3, $08, nRst
	dc.b	$02, nF2, $11, nRst, $0B, nAb3, $07, nRst, $0B, nG3, $07, nRst
	dc.b	$02, nF3, $01, nRst, $08, nB2, $01, nRst, $08, nCs2, $11, nRst
	dc.b	$02, nCs2, $01, nRst, $08, nF3, nRst, $02, nCs2, $01, nRst, $08
	dc.b	nEb3, nRst, $02, nCs2, $01, nRst, $08, nCs2, $02, nRst, $08, nEb2
	dc.b	$11, nRst, $02, nEb2, $01, nRst, $08, nG3, nRst, $02, nEb2, $01
	dc.b	nRst, $08, nF3, $07, nRst, $02, nEb2, $01, nRst, $08, nEb2, $01
	dc.b	nRst, $08, nF2, $12, nRst, $01, nF2, nRst, $08, nAb3, nRst, $01
	dc.b	nF2, nRst, $09, nG3, $07, nRst, $0B, nAb3, $07, nRst, $02, nBb3
	dc.b	$10, nRst, $02, nF2, $01, nRst, $08, nAb3, nRst, $02, nF2, $01
	dc.b	nRst, $08, nG3, nRst, $02, nF2, $01, nRst, $08, nAb3, nRst, $02
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08, nAb3, nRst, $01, nF2, nRst
	dc.b	$08, nG3, nRst, $0B, nAb3, $07, nRst, $02, nF2, $11, nRst, $0B
	dc.b	nAb3, $07, nRst, $02, nF2, $01, nRst, $08, nBb3, nRst, $02, nF2
	dc.b	$01, nRst, $08, nAb3, nRst, $02, nF2, $11, nRst, $0B, nAb3, $07
	dc.b	nRst, $02, nF2, $01, nRst, $08, nG3, nRst, $02, nF2, $01, nRst
	dc.b	$08, nAb3, nRst, $02, nF2, $11, nRst, $02, nF2, $01, nRst, $08
	dc.b	nAb3, nRst, $01, nF2, nRst, $08, nG3, nRst, $01, nF3, nRst, $08
	dc.b	nB2, $01, nRst, $08, nCs2, $12, nRst, $01, nCs2, nRst, $09, nF3
	dc.b	$08, nRst, $01, nCs2, nRst, $08, nEb3, $09, nRst, $01, nCs2, nRst
	dc.b	$08, nCs2, $02, nRst, $08, nEb2, $12, nRst, $01, nEb2, nRst, $08
	dc.b	nG3, $09, nRst, $01, nEb2, nRst, $08, nF3, nRst, $01, nEb2, nRst
	dc.b	$12, nF2, $11, nRst, $0B, nAb3, $07, nRst, $0B, nG3, $08, nRst
	dc.b	$0B, nAb3, $08, nRst, $02, nF2, $11, nRst, $0B, nAb3, $07, nRst
	dc.b	$02, nF2, $01, nRst, $08, nG3, $07, nRst, $02, nF3, $01, nRst
	dc.b	$08, nB2, $01, nRst, $08, nCs2, $12, nRst, $01, nCs2, nRst, $08
	dc.b	nF3, $09, nRst, $01, nCs2, nRst, $08, nEb3, $09, nRst, $01, nCs2
	dc.b	nRst, $08, nCs2, $02, nRst, $08, nEb2, $11, nRst, $02, nEb2, $01
	dc.b	nRst, $08, nG3, nRst, $02, nEb2, $01, nRst, $08, nF3, nRst, $01
	dc.b	nEb2, nRst, $08, nEb2, $01, nRst, $08, nF2, $12, nRst, $01, nF2
	dc.b	nRst, $08, nAb3, nRst, $0B, nG3, $07, nRst, $0B, nAb3, $07, nRst
	dc.b	$02, nBb3, $11, nRst, $01, nF2, nRst, $08, nAb3, $09, nRst, $01
	dc.b	nF2, nRst, $08, nG3, $09, nRst, $01, nF2, nRst, $08, nAb3, nRst
	dc.b	$02, nF2, $11, nRst, $01, nF2, nRst, $08, nAb3, $09, nRst, $01
	dc.b	nF2, nRst, $08, nG3, $09, nRst, $01, nF2, $02, nRst, $08, nAb3
	dc.b	nRst, $01, nF2, $11, nRst, $01, nF2, nRst, $08, nAb3, nRst, $0B
	dc.b	nG3, $07, nRst, $0B, nEb2, $08, nRst, $02, nF2, $10, nRst, $02
	dc.b	nF2, $01, nRst, $08
	smpsPan             panCenter, $00
	smpsJump            Metal_Squad_Jump05

; FM2 Data
Metal_Squad_FM2:
	smpsSetvoice        $01
	smpsAlterVol        $10
	smpsPan             panCenter, $00
	dc.b	nEb2, $08, nRst, $02, nF2, $1B

Metal_Squad_Jump04:
	dc.b	smpsNoAttack, nF2, $76, smpsNoAttack, $49, smpsNoAttack, $3E, nRst, $02, nB1, $07, nRst
	dc.b	$02, nCs2, $52, smpsNoAttack, $35, nRst, $01, nCs2, $08, nRst, $01, nEb2
	dc.b	$49, smpsNoAttack, $3E, nRst, $02, nEb2, $07, nRst, $02, nF2, $11, nRst
	dc.b	$02, nF2, $07, nRst, $02, nF2, $07, nRst, $02

Metal_Squad_Loop21:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop21
	dc.b	nF2, $08, nRst, $02, nF2, $10

Metal_Squad_Loop22:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop22
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $08, nRst, $02, nF2, $11
	dc.b	nRst, $01, nF2, $08, nRst, $01, nF2, $08, nRst, $02, smpsNoAttack

Metal_Squad_Loop23:
	dc.b	nF2, $07, nRst, $02
	smpsLoop            $00, $04, Metal_Squad_Loop23
	dc.b	nF2, $10, nRst, $02

Metal_Squad_Loop24:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop24
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02, nB1, $07, nRst, $02
	dc.b	nCs2, $10, nRst, $02, nCs2, $07, nRst, $02, nCs2, $07, nRst, $02

Metal_Squad_Loop25:
	dc.b	nCs2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop25
	dc.b	nCs2, $08, nRst, $02, nCs2, $10

Metal_Squad_Loop26:
	dc.b	nRst, $02, nCs2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop26
	dc.b	nRst, $02, nCs2, $08, nRst, $01, nCs2, $08, nRst, $01, nEb2, $11

Metal_Squad_Loop27:
	dc.b	nRst, $02, nEb2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop27
	dc.b	nRst, $02, nEb2, $08, nRst, $02, nEb2, $10, nRst, $02

Metal_Squad_Loop28:
	dc.b	nEb2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop28
	dc.b	nEb2, $08, nRst, $02, smpsNoAttack, nEb2, $07, nRst, $02, nEb2, $07, nRst
	dc.b	$02, nF2, $11

Metal_Squad_Loop29:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop29
	dc.b	nRst, $02, nF2, $08, nRst, $02, nF2, $11

Metal_Squad_Loop2A:
	dc.b	nRst, $01, nF2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop2A

Metal_Squad_Loop2B:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop2B
	dc.b	nRst, $02, nF2, $10, nRst, $02, nF2, $07, nRst, $02

Metal_Squad_Loop2C:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop2C
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $10

Metal_Squad_Loop2D:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop2D
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $08, nRst, $01, nB1, $08
	dc.b	nRst, $01, nCs2, $11

Metal_Squad_Loop2E:
	dc.b	nRst, $02, nCs2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop2E
	dc.b	nRst, $02, nCs2, $08, nRst, $02, nCs2, $11

Metal_Squad_Loop2F:
	dc.b	nRst, $01, nCs2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop2F
	dc.b	nRst, $02, nCs2, $08, nRst, $01, nCs2, $08, nRst, $01, nCs2, $09
	dc.b	nRst, $01, nEb2, $11

Metal_Squad_Loop30:
	dc.b	nRst, $02, nEb2, $07
	smpsLoop            $00, $06, Metal_Squad_Loop30
	dc.b	nRst, $02, nEb2, $11, nRst, $01, nEb2, $08, nRst, $01, nEb2, $08

Metal_Squad_Loop31:
	dc.b	nRst, $02, nEb2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop31
	dc.b	nRst, $02, nF2, $10

Metal_Squad_Loop32:
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop32
	dc.b	nRst, $02, nF2, $07, nRst, $02, nF2, $08, nRst, $02, nF2, $11

Metal_Squad_Loop33:
	dc.b	nRst, $01, nF2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop33

Metal_Squad_Loop34:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop34
	dc.b	nRst, $02, nF2, $10, nRst, $02, nF2, $07, nRst, $02

Metal_Squad_Loop35:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop35
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $10

Metal_Squad_Loop36:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop36
	dc.b	nRst, $02, nF2, $08, nRst, $02, nF2, $07, nRst, $02, nB1, $08
	dc.b	nRst, $01, nCs2, $11, nRst, $02

Metal_Squad_Loop37:
	dc.b	nCs2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop37
	dc.b	nCs2, $08, nRst, $02, nCs2, $07, nRst, $02, nCs2, $08, nRst, $02
	dc.b	nEb2, $10

Metal_Squad_Loop38:
	dc.b	nRst, $02, nEb2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop38
	dc.b	nRst, $02, nEb2, $08, nRst, $01, nEb2, $08, nRst, $02, nF2, $11
	dc.b	nRst, $01, nF2, $08, nRst, $01, nF2, $08, nRst, $02, smpsNoAttack

Metal_Squad_Loop39:
	dc.b	nF2, $07, nRst, $02
	smpsLoop            $00, $03, Metal_Squad_Loop39
	dc.b	nF2, $08, nRst, $02, nCs2, $10, nRst, $02, nCs2, $07, nRst, $02
	dc.b	nCs2, $07, nRst, $02, nEb2, $11, nRst, $01, nEb2, $08, nRst, $01
	dc.b	nEb2, $09, nRst, $01, nEb2, $08, nRst, $01, nC2, $1B, nRst, $01
	dc.b	nC2, $1A, nRst, $02, nC2, $07, nRst, $02, nC2, $07, nRst, $02
	dc.b	nC2, $1A, nRst, $01, nC2, $1A, nRst, $01, nC2, $08, nRst, $02
	dc.b	smpsNoAttack, nC2, $07, nRst, $02, nCs2, $1A, nRst, $02, nCs2, $19, nRst
	dc.b	$02, nCs2, $07, nRst, $02, nCs2, $08, nRst, $01, nCs2, $1B, nRst
	dc.b	$01, nCs2, $1A, nRst, $02, nCs2, $07, nRst, $02, nCs2, $07, nRst
	dc.b	$02, nC2, $1A, nRst, $02, nC2, $1A, nRst, $01, nC2, $08, nRst
	dc.b	$01, nC2, $08, nRst, $01, nC2, $1A, nRst, $02, nC2, $19, nRst
	dc.b	$02, nC2, $07, nRst, $02, nC2, $08, nRst, $01, nCs2, $1A, nRst
	dc.b	$01, nCs2, $1A, nRst, $02, nCs2, $07, nRst, $02, nCs2, $07, nRst
	dc.b	$02, nEb2, $1A, nRst, $01, nEb2, $1A, nRst, $02, nEb2, $07, nRst
	dc.b	$02, nF2, $11

Metal_Squad_Loop3A:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop3A
	dc.b	nRst, $02, nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $08
	dc.b	nRst, $02, nF2, $11

Metal_Squad_Loop3B:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop3B
	dc.b	nRst, $02, nF2, $08, nRst, $01, nB1, $08, nRst, $01, nCs2, $12

Metal_Squad_Loop3C:
	dc.b	nRst, $01, nCs2, $08, nRst, $01, nCs2, $09
	smpsLoop            $00, $03, Metal_Squad_Loop3C
	dc.b	nRst, $01, nEb2, $11

Metal_Squad_Loop3D:
	dc.b	nRst, $02, nEb2, $08, nRst, $01, nEb2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop3D
	dc.b	nRst, $01, nEb2, $08, nRst, $01, nEb2, $08, nRst, $02, nF2, $11
	dc.b	nRst, $01, smpsNoAttack, nRst, smpsNoAttack

Metal_Squad_Loop3E:
	dc.b	nF2, $07, nRst, $02
	smpsLoop            $00, $03, Metal_Squad_Loop3E
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $08, nRst, $02
	dc.b	nF2, $11

Metal_Squad_Loop3F:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop3F
	dc.b	nRst, $02, nB1, $07, nRst, $02, nCs2, $11

Metal_Squad_Loop40:
	dc.b	nRst, $02, nCs2, $08, nRst, $01, nCs2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop40
	dc.b	nRst, $02, nCs2, $07, nRst, $02, nCs2, $08, nRst, $02, nEb2, $11
	dc.b	nRst, $02, nEb2, $07, nRst, $02, nEb2, $07

Metal_Squad_Loop41:
	dc.b	nRst, $02, nEb2, $08, nRst, $01, nEb2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop41
	dc.b	nRst, $01, nF2, $12, nRst, $01, nF2, $08, nRst, $01, nF2, $08
	dc.b	nRst, $02, smpsNoAttack

Metal_Squad_Loop42:
	dc.b	nF2, $07, nRst, $02
	smpsLoop            $00, $04, Metal_Squad_Loop42
	dc.b	nF2, $10, nRst, $02, nF2, $08, nRst, $01

Metal_Squad_Loop43:
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02
	smpsLoop            $00, $02, Metal_Squad_Loop43
	dc.b	nF2, $08, nRst, $02, nF2, $11, nRst, $01

Metal_Squad_Loop44:
	dc.b	nF2, $08, nRst, $01, nF2, $08, nRst, $02
	smpsLoop            $00, $02, Metal_Squad_Loop44
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $11

Metal_Squad_Loop45:
	dc.b	nRst, $01, nF2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop45
	dc.b	nRst, $02, nF2, $07, nRst, $02, nF2, $07, nRst, $02, nEb2, $08
	dc.b	nRst, $02, nF2, $48, smpsNoAttack, $49, smpsNoAttack, nF2, smpsNoAttack, $3E, nRst, $02
	dc.b	nB1, $07, nRst, $02, nCs2, $52, smpsNoAttack, $35, nRst, $01, nCs2, $08
	dc.b	nRst, $01, nEb2, $49, smpsNoAttack, $3E, nRst, $02, nEb2, $07, nRst, $02
	dc.b	nF2, $11, nRst, $02, nF2, $07, nRst, $02

Metal_Squad_Loop46:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop46
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $10

Metal_Squad_Loop47:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop47
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $08, nRst, $01, nF2, $08
	dc.b	nRst, $02, smpsNoAttack, nF2, $10

Metal_Squad_Loop48:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop48
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $11, nRst, $01, nF2, $08

Metal_Squad_Loop49:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop49
	dc.b	nRst, $02, nB1, $07, nRst, $02, nCs2, $11

Metal_Squad_Loop4A:
	dc.b	nRst, $01, nCs2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop4A

Metal_Squad_Loop4B:
	dc.b	nRst, $02, nCs2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop4B
	dc.b	nRst, $02, nCs2, $10, nRst, $02, nCs2, $07, nRst, $02, nCs2, $08
	dc.b	nRst, $01, nCs2, $08, nRst, $01, nCs2, $08, nRst, $02, smpsNoAttack, nCs2
	dc.b	$07, nRst, $02, nCs2, $07, nRst, $02, nEb2, $10, nRst, $02, nEb2
	dc.b	$07, nRst, $02, nEb2, $07, nRst, $02

Metal_Squad_Loop4C:
	dc.b	nEb2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop4C
	dc.b	nEb2, $08, nRst, $02, nEb2, $10

Metal_Squad_Loop4D:
	dc.b	nRst, $02, nEb2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop4D
	dc.b	nRst, $02, nEb2, $08, nRst, $01, nEb2, $08, nRst, $01, nF2, $12

Metal_Squad_Loop4E:
	dc.b	nRst, $01, nF2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop4E
	dc.b	nRst, $02, nF2, $07, nRst, $02, nF2, $07, nRst, $02, nF2, $08
	dc.b	nRst, $02, nF2, $10

Metal_Squad_Loop4F:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop4F
	dc.b	nRst, $02

Metal_Squad_Loop50:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop50
	dc.b	nF2, $11

Metal_Squad_Loop51:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop51
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $11, nRst, $01, nF2, $08

Metal_Squad_Loop52:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop52
	dc.b	nRst, $02, nB1, $07, nRst, $02, nCs2, $11

Metal_Squad_Loop53:
	dc.b	nRst, $01, nCs2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop53
	dc.b	nRst, $02, nCs2, $07, nRst, $02, nCs2, $07, nRst, $02, nCs2, $08
	dc.b	nRst, $02, nEb2, $10

Metal_Squad_Loop54:
	dc.b	nRst, $02, nEb2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop54
	dc.b	nRst, $02, nEb2, $08, nRst, $01, nEb2, $08, nRst, $01, nEb2, $08
	dc.b	nRst, $02, nF2, $11, nRst, $01, nF2, $08, nRst, $02, smpsNoAttack

Metal_Squad_Loop55:
	dc.b	nF2, $07, nRst, $02
	smpsLoop            $00, $05, Metal_Squad_Loop55
	dc.b	nCs2, $11, nRst, $01, nCs2, $08, nRst, $01, nCs2, $08, nRst, $01
	dc.b	nEb2, $11

Metal_Squad_Loop56:
	dc.b	nRst, $02, nEb2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop56

Metal_Squad_Loop57:
	dc.b	nRst, $02, nBb2, $08, nRst, $02, nBb2, $07
	smpsLoop            $00, $02, Metal_Squad_Loop57
	dc.b	nRst, $02, nBb2, $07

Metal_Squad_Loop58:
	dc.b	nRst, $02, nBb2, $07, nRst, $02, nBb2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop58

Metal_Squad_Loop59:
	dc.b	nRst, $02, nBb2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop59
	dc.b	nRst, $02, nBb2, $08, nRst, $02, nBb2, $07

Metal_Squad_Loop5A:
	dc.b	nRst, $02, nFs2, $08, nRst, $02, nFs2, $07
	smpsLoop            $00, $02, Metal_Squad_Loop5A
	dc.b	nRst, $02, nFs2, $07

Metal_Squad_Loop5B:
	dc.b	nRst, $02, nFs2, $07, nRst, $02, nFs2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop5B
	dc.b	nRst, $02, nFs2, $07, nRst, $02, nFs2, $07, nRst, $02, nFs2, $08
	dc.b	nRst, $01, nFs2, $08, nRst, $02, nFs2, $08, nRst, $01

Metal_Squad_Loop5C:
	dc.b	nF2, $08, nRst, $02, nF2, $07, nRst, $02
	smpsLoop            $00, $02, Metal_Squad_Loop5C
	dc.b	nF2, $08, nRst, $01, nF2, $08, nRst, $01, nF2, $09, nRst, $01
	dc.b	nF2, $08

Metal_Squad_Loop5D:
	dc.b	nRst, $01, nEb2, $08, nRst, $02, nEb2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop5D
	dc.b	nRst, $01, nEb2, $08, nRst, $01, nEb2, $08, nRst, $01, nEb2, $09
	dc.b	nRst, $01, nEb2, $08

Metal_Squad_Loop5E:
	dc.b	nRst, $01, nAb2, $09, nRst, $01, nAb2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop5E

Metal_Squad_Loop5F:
	dc.b	nRst, $01, nAb2, $08, nRst, $02, nAb2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop5F
	dc.b	nRst, $01, nCs2, $08, nRst, $02, nCs2, $07, nRst, $02

Metal_Squad_Loop60:
	dc.b	nCs2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop60
	dc.b	nCs2, $08, nRst, $02, smpsNoAttack, nCs2, $07, nRst, $02, nCs2, $07, nRst
	dc.b	$02, nFs2, $08, nRst, $02, nFs2, $07, nRst, $02, nFs2, $07, nRst
	dc.b	$02, nF2, $07, nRst, $02, nF2, $07, nRst, $02, nF2, $08, nRst
	dc.b	$02, nF2, $07, nRst, $02, nF2, $07, nRst, $02, nFs2, $08, nRst
	dc.b	$02, nFs2, $07, nRst, $02, nFs2, $07

Metal_Squad_Loop61:
	dc.b	nRst, $02, nF2, $08, nRst, $02, nF2, $07
	smpsLoop            $00, $02, Metal_Squad_Loop61
	dc.b	nRst, $02, nF2, $08, nRst, $01, nFs2, $08, nRst, $02, nFs2, $07
	dc.b	nRst, $02, nFs2, $08, nRst, $01, nF2, $08, nRst, $02

Metal_Squad_Loop62:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop62
	dc.b	nF2, $08

Metal_Squad_Loop63:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop63
	dc.b	nRst, $0B, nEb2, $08, nRst, $02, nF2, $11, nRst, $02, nF2, $07
	dc.b	nRst, $02, nF2, $07

Metal_Squad_Loop64:
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop64
	dc.b	nRst, $02, nF2, $11

Metal_Squad_Loop65:
	dc.b	nRst, $02, nF2, $07, nRst, $02, nF2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop65
	dc.b	nRst, $01, nF2, $08, nRst, $01, nB1, $08, nRst, $01, nCs2, $12

Metal_Squad_Loop66:
	dc.b	nRst, $01, nCs2, $08, nRst, $01, nCs2, $09
	smpsLoop            $00, $03, Metal_Squad_Loop66
	dc.b	nRst, $01, nEb2, $12, nRst, $01, nEb2, $08, nRst, $01, nEb2, $08
	dc.b	nRst, $02

Metal_Squad_Loop67:
	dc.b	nEb2, $08, nRst, $01
	smpsLoop            $00, $03, Metal_Squad_Loop67
	dc.b	nEb2, $08, nRst, $02, nF2, $11

Metal_Squad_Loop68:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop68
	dc.b	nRst, $02, nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $08
	dc.b	nRst, $02, nF2, $11

Metal_Squad_Loop69:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $05, Metal_Squad_Loop69
	dc.b	nRst, $02, nB1, $08, nRst, $01, nCs2, $11

Metal_Squad_Loop6A:
	dc.b	nRst, $02, nCs2, $08, nRst, $01, nCs2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop6A
	dc.b	nRst, $02, nCs2, $07, nRst, $02, nCs2, $08, nRst, $02, nEb2, $11

Metal_Squad_Loop6B:
	dc.b	nRst, $02, nEb2, $07, nRst, $02, nEb2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop6B
	dc.b	nRst, $01, nEb2, $08, nRst, $01, nEb2, $08, nRst, $01, nF2, $12
	dc.b	nRst, $01, nF2, $08, nRst, $01, nF2, $08

Metal_Squad_Loop6C:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop6C
	dc.b	nRst, $02, nF2, $10

Metal_Squad_Loop6D:
	dc.b	nRst, $02, nF2, $08, nRst, $01, nF2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop6D
	dc.b	nRst, $02, nF2, $07, nRst, $02, nF2, $08, nRst, $02, nF2, $11

Metal_Squad_Loop6E:
	dc.b	nRst, $01, nF2, $08
	smpsLoop            $00, $03, Metal_Squad_Loop6E

Metal_Squad_Loop6F:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop6F

Metal_Squad_Loop71:
	dc.b	nRst, $02, nF2, $11

Metal_Squad_Loop70:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop70
	dc.b	nRst, $02, nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $08
	smpsLoop            $01, $02, Metal_Squad_Loop71
	dc.b	nRst, $02, nF2, $11, nRst, $02, nF2, $07, nRst, $02

Metal_Squad_Loop72:
	dc.b	nF2, $08, nRst, $01
	smpsLoop            $00, $04, Metal_Squad_Loop72
	dc.b	nB1, $08, nRst, $02, nCs2, $11, nRst, $02, nCs2, $07

Metal_Squad_Loop73:
	dc.b	nRst, $02, nCs2, $08, nRst, $01, nCs2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop73
	dc.b	nRst, $02, nCs2, $08, nRst, $01, nEb2, $12, nRst, $01, nEb2, $08
	dc.b	nRst, $01, nEb2, $09, nRst, $01, nEb2, $08, nRst, $01, nEb2, $08
	dc.b	nRst, $02, nEb2, $07, nRst, $02, nEb2, $07, nRst, $02, nF2, $11

Metal_Squad_Loop74:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $03, Metal_Squad_Loop74
	dc.b	nRst, $02, nF2, $08, nRst, $02, nF2, $07, nRst, $02, nF2, $08
	dc.b	nRst, $02, nF2, $11

Metal_Squad_Loop75:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop75
	dc.b	nRst, $02, nF2, $08, nRst, $01, nB1, $08, nRst, $01, nCs2, $12

Metal_Squad_Loop76:
	dc.b	nRst, $01, nCs2, $08, nRst, $01, nCs2, $09
	smpsLoop            $00, $03, Metal_Squad_Loop76
	dc.b	nRst, $01, nEb2, $11

Metal_Squad_Loop77:
	dc.b	nRst, $02, nEb2, $08, nRst, $01, nEb2, $08
	smpsLoop            $00, $02, Metal_Squad_Loop77
	dc.b	nRst, $01, nEb2, $08, nRst, $01, nEb2, $08, nRst, $02, nF2, $11
	dc.b	nRst, $01, smpsNoAttack, nRst, smpsNoAttack

Metal_Squad_Loop78:
	dc.b	nF2, $07, nRst, $02
	smpsLoop            $00, $06, Metal_Squad_Loop78
	dc.b	nF2, $11

Metal_Squad_Loop79:
	dc.b	nRst, $01, nF2, $08, nRst, $01, nF2, $09
	smpsLoop            $00, $02, Metal_Squad_Loop79
	dc.b	nRst, $01, nF2, $08, nRst, $01, nF2, $08, nRst, $02, nF2, $11

Metal_Squad_Loop7A:
	dc.b	nRst, $01, nF2, $08, nRst, $01, nF2, $09
	smpsLoop            $00, $02, Metal_Squad_Loop7A
	dc.b	nRst, $01, nF2, $08, nRst, $02, nF2, $08, nRst, $01, nF2, $11
	dc.b	nRst, $01, nF2, $08

Metal_Squad_Loop7B:
	dc.b	nRst, $02, nF2, $07
	smpsLoop            $00, $04, Metal_Squad_Loop7B
	dc.b	nRst, $02, nEb2, $08, nRst, $02, nF2, $1B
	smpsPan             panCenter, $00
	smpsJump            Metal_Squad_Jump04

; FM3 Data
Metal_Squad_FM3:
	smpsSetvoice        $01
	smpsAlterVol        $7F
	smpsPan             panCenter, $00
	dc.b	nRst, $25

Metal_Squad_Jump03:
	dc.b	nRst, $6E, $48, smpsNoAttack, $49, smpsNoAttack, $49, $49, $49, $51
	smpsSetvoice        $07
	smpsAlterVol        $91
	dc.b	nF1, $02, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $22
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nB1, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E5
	dc.b	nC2, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $15
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nE2, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	nAb2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $22
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nB2, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E5
	dc.b	nC3, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	nAb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $22
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E5
	dc.b	nC4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nCs4, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $15
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $22
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E5
	dc.b	nC5, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nD5, $02, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $15
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	nEb5, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nE5, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nF5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$49, smpsNoAttack, $47, nRst, $01, nF4, $19, nRst, $02, nAb4, $07, nRst
	dc.b	$02, nF4, $11, nRst, $01, nAb4, $11, nRst, $02, nF4, $47, nRst
	dc.b	$01, nEb4, $2C, nRst, $02, nF4, $03, nRst, $01, nG4, $03, nRst
	dc.b	$02, nAb4, $03, nRst, $01, nG4, $03, nRst, $02, nAb4, $04, nRst
	dc.b	$01, nBb4, $03, nRst, $02, nAb4, $03, nRst, $01, nBb4, $03, nRst
	dc.b	$02, nC5, $07, nRst, $02, nBb4, $03, nRst, $02, nC5, $03, nRst
	dc.b	$01, nCs5, $08, nRst, $01, nC5, $03, nRst, $02, nCs5, $05, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $15
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb5, $14
	smpsModSet          $00, $02, $03, $03
	dc.b	nRst, $02
	smpsSetvoice        $0D
	smpsModOff
	dc.b	nC5, $3E, nRst, $02, nBb4, $08, nRst, $02, nAb4, $07, nRst, $02
	dc.b	nC5, $08, nRst, $01, nBb4, $08, nRst, $01, nAb4, $08, nRst, $02
	dc.b	nF4, $2B, nRst, $02
	smpsModOff
	dc.b	nC5, $2C, nRst, $02
	smpsModOff
	dc.b	nEb5, $07, nRst, $0B, nC5, $2B, nRst, $02, nC5, $1A, nRst, $02
	dc.b	nAb4, $34, nRst, $02, nG4, $07, nRst, $02, nF4, $08, nRst, $02
	dc.b	nAb4, $11, nRst, $01, nG4, $08, nRst, $01, nF4, $08, nRst, $02
	dc.b	nAb4, $07, nRst, $02, nG4, $08, nRst, $01, smpsNoAttack, nRst, nF4, $07
	dc.b	nRst, $02, nAb4, $08, nRst, $01, smpsNoAttack, nRst, nBb4, $34, nRst, $02
	smpsModOff
	dc.b	nAb4, $07, nRst, $02, nG4, $07, nRst, $02, nBb4, $11, nRst, $01
	dc.b	nAb4, $08, nRst, $02, nG4, $07, nRst, $02, nF4, $07, nRst, $02
	dc.b	nEb4, $07, nRst, $02, nBb4, $10, nRst, $02, nEb5, $0A, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nE5, $01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nF5, nRst, $03
	smpsAlterNote       $00

Metal_Squad_Loop1C:
	dc.b	nF5, $06, nRst, $03, nF5, $07, nRst, $03
	smpsLoop            $00, $03, Metal_Squad_Loop1C
	dc.b	nEb5, $07, nRst, $0B, nF5, $41, smpsNoAttack
	smpsAlterNote       $18
	dc.b	nE5, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	nEb5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $15
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nC5, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$1D, nRst, $02
	smpsModOff
	dc.b	nEb5, $07, nRst, $0B, nC5, $2B, nRst, $02, nC5, $08, nRst, $02
	dc.b	nBb4, $07, nRst, $02, nAb4, $08, nRst, $01, nF4, $36, nRst, $02
	smpsModOff
	dc.b	nCs4, $07, nRst, $02, nEb4, $08, nRst, $02, nG4, $2B, nRst, $02
	dc.b	nEb4, $07, nRst, $02, nF4, $0B, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$7F, nRst, $01
	smpsSetvoice        $19
	smpsAlterVol        $6F
	smpsModOff
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $1A
	smpsAlterVol        $91
	dc.b	nC4, $08, nRst, $01, nEb4, $08, nRst, $01, nG4, $7F, nRst, $01
	dc.b	smpsNoAttack, nRst
	smpsModOff
	dc.b	nCs4, $07, nRst, $02, nF4, $07, nRst, $02, nAb4, $4B, smpsNoAttack
	smpsAlterNote       $1E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $22
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E5
	dc.b	nC5, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$26, nRst, $02
	smpsModOff
	dc.b	nEb4, $07, nRst, $02, nG4, $07, nRst, $02, nC5, $7E, nRst, $02
	dc.b	nF4, $07, nRst, $02, nAb4, $08, nRst, $01, nCs5, $35, nRst, $02
	smpsModOff
	dc.b	nG4, $07, nRst, $02, nBb4, $07, nRst, $02, nEb5, $1A, nRst, $01
	dc.b	nG5, $23, nRst, $02
	smpsSetvoice        $0D
	smpsModOff
	dc.b	nC5, $2C, nRst, $02, nBb4, $11, nRst, $02, nAb4, $08, nRst, $02
	dc.b	nC5, $08, nRst, $0B, nF4, $35, nRst, $01, smpsNoAttack, nRst
	smpsModOff
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02, nBb4, $11, nRst, $01
	dc.b	nAb4, $09, nRst, $01, nG4, $1B, nRst, $01, nAb4, $1B, nRst, $01
	dc.b	nBb4, $11, nRst, $02, nC5, $2C, nRst, $02
	smpsModOff
	dc.b	nBb4, $11, nRst, $02, nAb4, $08, nRst, $02, nC5, $08, nRst, $0B
	dc.b	nF4, $34, nRst, $02, nC5, $11, nRst, $0B, nC5, $12, nRst, $01
	dc.b	nBb4, $11, nRst, $02, nAb4, $08, nRst, $02, nG4, $1A, nRst, $02
	dc.b	nAb4, $1A, nRst, $02, nBb4, $11, nRst, $01, smpsNoAttack, nRst, nAb4, $4A
	dc.b	smpsNoAttack
	smpsAlterNote       $1D
	dc.b	nG4, $01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$42, smpsNoAttack, $4B, smpsNoAttack, $3E, nRst, $02
	smpsAlterVol        $6F
	dc.b	$01
	smpsModOff
	dc.b	$49
	smpsModOff
	dc.b	$48
	smpsModOff
	dc.b	$49
	smpsModOff
	dc.b	$49
	smpsModOff
	dc.b	smpsNoAttack, $49
	smpsModOff
	dc.b	smpsNoAttack, $49
	smpsModOff
	dc.b	$49
	smpsModOff
	dc.b	$49
	smpsModOff
	dc.b	$08
	smpsSetvoice        $07
	smpsAlterVol        $91
	dc.b	nF6, $4A, smpsNoAttack, $49, smpsNoAttack, $48

Metal_Squad_Loop1D:
	dc.b	smpsNoAttack, $49
	smpsLoop            $00, $04, Metal_Squad_Loop1D
	dc.b	smpsNoAttack, $47, nRst, $01
	smpsSetvoice        $20
	smpsAlterVol        $6F
	smpsModOff
	dc.b	smpsNoAttack, nRst
	smpsSetvoice        $0D
	smpsAlterVol        $91
	dc.b	nC5, $3E, nRst, $02
	smpsModOff
	dc.b	nF5, $08, nRst, $02, nEb5, $07, nRst, $02, nC5, $07, nRst, $02
	dc.b	nBb4, $07, nRst, $02, nAb4, $07, nRst, $02, nF4, $2C, nRst, $01
	dc.b	nC5, $2C, nRst, $02
	smpsModOff
	dc.b	nEb5, $07, nRst, $0B, nC5, $2C, nRst, $02
	smpsModOff
	dc.b	nC5, $19, nRst, $02, nAb4, $35, nRst, $02
	smpsModOff
	dc.b	nG4, $07, nRst, $02, nF4, $08, nRst, $02, nBb4, $35, nRst, $01
	smpsModOff
	dc.b	nAb4, $08, nRst, $01, nG4, $09, nRst, $01, nF4, $52, smpsNoAttack, $47
	dc.b	nRst, $02
	smpsSetvoice        $1A
	smpsModOff
	dc.b	nF4, $04, nRst, $01, nCs4, $03, nRst, $02, nBb3, $03, nRst, $01
	dc.b	nC4, $03, nRst, $02, nF4, $03, nRst, $02, nCs4, $03, nRst, $02
	dc.b	nBb3, $03, nRst, $01, nC4, $03, nRst, $02, nF4, $03

Metal_Squad_Loop1E:
	dc.b	nRst, $01, nCs4, $03, nRst, $02, nBb3, $03, nRst, $01, nC4, $03
	dc.b	nRst, $02, nF4, $04
	smpsLoop            $00, $03, Metal_Squad_Loop1E
	dc.b	nRst, $01, nCs4, $03, nRst, $02, nBb3, $03, nRst, $01, nC4, $03
	dc.b	nRst, $02, nF4, $03, nRst, $01, nCs4, $03, nRst, $02, nBb3, $03
	dc.b	nRst, $01, nC4, $03, nRst, $02, nF4, $04

Metal_Squad_Loop1F:
	dc.b	nRst, $01, nCs4, $03, nRst, $02, nBb3, $03, nRst, $01, nC4, $03
	dc.b	nRst, $02, nFs4, $04
	smpsLoop            $00, $02, Metal_Squad_Loop1F
	dc.b	nRst, $01, nCs4, $03, nRst, $02, nBb3, $03, nRst, $01, nC4, $03
	dc.b	nRst, $02, nFs4, $03, nRst, $01, nCs4, $03, nRst, $02, nBb3, $03
	dc.b	nRst, $02, nC4, $03, nRst, $01, nFs4, $04, nRst, $01, nCs4, $03
	dc.b	nRst, $02, nBb3, $03, nRst, $01, smpsNoAttack, nRst, nC4, $02, nRst

Metal_Squad_Loop20:
	dc.b	nAb4, $04, nRst, $01, nCs4, $03, nRst, $02, nBb3, $03, nRst, $01
	dc.b	nC4, $03, nRst, $02
	smpsLoop            $00, $02, Metal_Squad_Loop20
	dc.b	nFs4, $03, nRst, $02, nCs4, nRst, nBb3, $03, nRst, $02, nC4, $03
	dc.b	nRst, $01, nFs4, $04, nRst, $01, nCs4, $03, nRst, $02, nBb3, $03
	dc.b	nRst, $02, nC4, $03, nRst, $01, nAb3, $04, nRst, $01, nC4, $03
	dc.b	nRst, $02, nF4, $03, nRst, $02, nAb4, $03, nRst, $01, nC5, $04
	dc.b	nRst, $01, nF5, $03, nRst, $02, nC5, $03, nRst, $01, smpsNoAttack, nRst
	dc.b	nAb4, $02, nRst, nF4, $05, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$18, nRst, $01, nFs3, $04, nRst, $02, nBb3, nRst, nEb4, $03, nRst
	dc.b	$02, nFs4, $03, nRst, $01, nBb4, $04, nRst, $01, smpsNoAttack, nRst, nEb5
	dc.b	$02, nRst, nFs5, $03, nRst, $02, nEb5, $03, nRst, $01, nCs5, $03
	dc.b	nRst, $02, nC5, $03, nRst, $01, nBb4, $03, nRst, $02, nAb4, $0A
	dc.b	smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$06, nRst, $02, nAb3, $03, nRst, $02, nFs3, $03, nRst, $01, nAb3
	dc.b	$08, nRst, $01, nBb3, $04, nRst, $02, nAb3, $03, nRst, $01, nBb3
	dc.b	$08, nRst, $01, nC4, $04, nRst, $02, nBb3, nRst, nC4, $08, nRst
	dc.b	$01, nEb4, $04, nRst, $01, smpsNoAttack, nRst, nCs4, $02, nRst, nEb4, $08
	dc.b	nRst, $01, nC4, $08, nRst, $02, nBb3, $03, nRst, $02, nC4, $03
	dc.b	nRst, $01, nCs4, $08, nRst, $01, nC4, $03, nRst, $02, nCs4, $03
	dc.b	nRst, $01, nEb4, $08, nRst, $01, smpsNoAttack, nRst, nCs4, $02, nRst, nEb4
	dc.b	$03, nRst, $02, nF4, $07, nRst, $02, nEb4, $03, nRst, $01, nF4
	dc.b	$03, nRst, $02, nFs4, $1A, nRst, $02, nF4, $13, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07
	smpsModSet          $00, $02, $01, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $E7
	dc.b	$01
	smpsModSet          $00, $02, $02, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4
	smpsModSet          $00, $02, $03, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$04, nRst, $02, nFs4, $1B, nRst, $01, nF4, $15, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07
	smpsModSet          $00, $02, $01, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $E7
	dc.b	$01
	smpsModSet          $00, $02, $02, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4
	smpsModSet          $00, $02, $03, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nRst, $01, nFs4, $1B, nRst, $01, nF4, $14, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07
	smpsModSet          $00, $02, $01, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01
	smpsModSet          $00, $02, $02, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4
	smpsModSet          $00, $02, $03, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nF4, $32, nRst, $02
	smpsSetvoice        $0D
	smpsModOff
	dc.b	nBb4, $08, nRst, $02, nC5, $2D, nRst, $01, nBb4, $12, nRst, $01
	dc.b	nAb4, $08, nRst, $02, nC5, $08, nRst, $0B, nF4, $36, nRst, $02
	smpsModOff
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02, nBb4, $11, nRst, $01
	dc.b	nAb4, $09, nRst, $01, nG4, $1B, nRst, $01, nAb4, $1B, nRst, $01
	dc.b	nBb4, $11, nRst, $02, nC5, $2C, nRst, $02
	smpsModOff
	dc.b	nBb4, $11, nRst, $02, nAb4, $08, nRst, $02, nC5, $08, nRst, $0B
	dc.b	nF4, $35, nRst, $01, nC5, $11, nRst, $0B, nC5, $12, nRst, $01
	dc.b	nBb4, $12, nRst, $01, nAb4, $08, nRst, $02, nG4, $1A, nRst, $02
	dc.b	nAb4, $1B, nRst, $01, nBb4, $11, nRst, $02, nAb4, $4A, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	nG4, $01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$42, smpsNoAttack, $47, nRst, $02
	smpsSetvoice        $07
	smpsModOff
	dc.b	nF5, $08, nRst, $02, nEb5, $07, nRst, $02, nF5, $07, nRst, $02
	dc.b	nG5, $10, nRst, $02, nAb5, $14, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	nG5, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	nFs5, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, nRst, $02
	smpsSetvoice        $0D
	smpsAlterNote       $00
	dc.b	nC5, $2C, nRst, $02, nBb4, $11, nRst, $02, nAb4, $08, nRst, $02
	dc.b	nC5, $08, nRst, $0B, nF4, $35, nRst, $02
	smpsModOff
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02, nBb4, $11, nRst, $02
	dc.b	nAb4, $08, nRst, $02, nG4, $1A, nRst, $02, nAb4, $1A, nRst, $02
	dc.b	nBb4, $10, nRst, $02, nC5, $2C, nRst, $02, nBb4, $11, nRst, $02
	dc.b	nAb4, $08, nRst, $02, nC5, $08, nRst, $0B, nF4, $35, nRst, $01
	dc.b	smpsNoAttack, nRst
	smpsModOff
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02, nBb4, $11, nRst, $01
	dc.b	nAb4, $09, nRst, $01, nG4, $1B, nRst, $01, nAb4, $1B, nRst, $01
	dc.b	nBb4, $11, nRst, $02, nAb4, $4A, smpsNoAttack
	smpsAlterNote       $1D
	dc.b	nG4, $01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$42, smpsNoAttack, $4B, smpsNoAttack, $3E, nRst, $02
	smpsAlterVol        $6F
	dc.b	$01
	smpsModOff
	dc.b	$24
	smpsSetvoice        $01
	smpsPan             panCenter, $00
	smpsModOff
	smpsAlterNote       $00
	smpsJump            Metal_Squad_Jump03

; FM4 Data
Metal_Squad_FM4:
	smpsSetvoice        $02
	smpsAlterVol        $0E
	smpsPan             panCenter, $00
	dc.b	nE3, $03, nRst, $07, nE3, $02, nRst, $19

Metal_Squad_Jump02:
	smpsAlterVol        $71
	dc.b	nRst, $24, $4A, $48, smpsNoAttack, $49
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $3D
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $48
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $07, smpsNoAttack, nE3, $02, nRst, $06
	smpsAlterVol        $71
	dc.b	$49
	smpsSetvoice        $04
	smpsAlterVol        $8F
	dc.b	nD4, $01, nRst, $04
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, nRst
	smpsSetvoice        $05
	smpsAlterVol        $71
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, nE3, $03, nRst, $01
	smpsSetvoice        $06
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $04
	smpsAlterVol        $8F
	dc.b	smpsNoAttack, $04
	smpsPan             panLeft, $00
	dc.b	nA3, $01, nRst, $04
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	dc.b	nE3, $02, nRst, nE3, $03, nRst, $02
	smpsSetvoice        $04
	dc.b	smpsNoAttack, $04
	smpsPan             panLeft, $00
	dc.b	nA3, $01, nRst, $04
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	dc.b	nE3, $03, nRst, $01, nE3, $03, nRst, $02
	smpsSetvoice        $04
	dc.b	nD4, $01, nRst, $03, nD4, $01, nRst, $04
	smpsSetvoice        $08
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $18
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0B
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $F0
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $07, nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0C
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $04
	smpsAlterVol        $04
	smpsPan             panRight, $00
	dc.b	smpsNoAttack, $04, nG4, $01, nRst, $04
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, nRst, nD4, $01, nRst, $04
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, nRst, nA3, $01, nRst, $04
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0E
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $10
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $07, nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10

Metal_Squad_Loop13:
	dc.b	nE3, $03, nRst, $06
	smpsLoop            $00, $03, Metal_Squad_Loop13
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $18
	smpsSetvoice        $11
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $12
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $14
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $15
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $04
	smpsAlterVol        $8F
	smpsPan             panRight, $00
	dc.b	nG4, nRst, $08
	smpsPan             panCenter, $00
	dc.b	nD4, $01, nRst, $08
	smpsPan             panLeft, $00
	dc.b	nA3, $01, nRst, $08
	smpsSetvoice        $16
	smpsAlterVol        $71
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE3, $02, nRst, $06
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE3, $02, nRst, $0F
	smpsSetvoice        $17
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $0F
	smpsSetvoice        $18
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10, nE3, $03, nRst, $09, nE3, $03, nRst, $09
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $02, nE3, $03, nRst, nE3, nRst, $02, nE3, $03
	smpsAlterVol        $02
	dc.b	nRst, $02, nE3, $03, nRst, $02, nE3, $03, nRst, $02
	smpsAlterVol        $FA
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $07, nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $06
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $07, nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC

Metal_Squad_Loop14:
	dc.b	nE3, $03, nRst, $06
	smpsLoop            $00, $03, Metal_Squad_Loop14
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $07, nE3, $02, nRst, $07, nE3, $03, nRst, $06
	smpsSetvoice        $12
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $07, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $07, nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $06
	smpsSetvoice        $17
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $07, nE3, $03, nRst, $06, nE3, $03, nRst, $06
	dc.b	nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $06, nE3, $03, nRst, $07, smpsNoAttack, nE3, $02, nRst
	dc.b	$06
	smpsSetvoice        $18
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $07, nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $07, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $18
	smpsSetvoice        $0B
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst

Metal_Squad_Loop15:
	dc.b	nE3, $03, nRst, $01

Metal_Squad_Loop16:
	dc.b	nE3, $03, nRst, $02
	smpsLoop            $00, $02, Metal_Squad_Loop15
	smpsLoop            $01, $02, Metal_Squad_Loop16
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $10
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $1B
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $06
	smpsSetvoice        $1C
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $07, nE3, $02, nRst, $07
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $18
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $06
	smpsSetvoice        $14
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $12
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $10
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $04, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE3, $02, nRst, $0F
	smpsSetvoice        $17
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06, nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $04
	dc.b	nD4, $02, nRst, $03, nD4, $01, nRst, $04
	smpsPan             panRight, $00
	dc.b	nG4, $01, nRst, $03, nG4, $01, nRst, $04, nG4, $01, nRst, $03
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $05, nD4, $01, nRst, $04
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, nRst, nA3, $01, nRst, $04, nA3, $01, nRst, $03
	smpsSetvoice        $1D
	smpsAlterVol        $71
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $95
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $F6
	dc.b	nE3, $03, nRst, $0E
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $07, nE3, $03, nRst, $3C
	smpsAlterVol        $71
	dc.b	$4A, $49, $48
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $3D
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $49
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $07, nE3, $02, nRst, $07
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $48
	smpsSetvoice        $04
	smpsAlterVol        $8F
	dc.b	smpsNoAttack, $05
	smpsPan             panLeft, $00
	dc.b	nA3, $01, nRst, $03
	smpsSetvoice        $1E
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	dc.b	nE3, $02, nRst

Metal_Squad_Loop17:
	dc.b	nE3, $03, nRst, $02
	smpsSetvoice        $04
	dc.b	smpsNoAttack, $04
	smpsPan             panLeft, $00
	dc.b	nA3, $01, nRst, $04
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	dc.b	nE3, $03, nRst, $01
	smpsLoop            $00, $02, Metal_Squad_Loop17
	dc.b	nE3, $03, nRst, $02
	smpsSetvoice        $04
	dc.b	nD4, $01, nRst, $03, nD4, $01, nRst, $05
	smpsSetvoice        $02
	dc.b	nE3, $03, nRst, $18
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $0F
	smpsSetvoice        $1C
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $0F
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $06
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $F6
	dc.b	nE3, $02, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $0F
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $06
	smpsSetvoice        $11
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $07, nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $0F
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $F0
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $0F, nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $18
	smpsSetvoice        $11
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE3, $02, nRst, $0F
	smpsSetvoice        $21
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE3, $02, nRst, $0F, nE3, $03, nRst, $06
	smpsSetvoice        $1C
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $0F
	smpsSetvoice        $22
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $09, nE3, $03, nRst, $09
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, nE3, nRst, $02, nE3, $03, nRst, $02, nE3, $03
	smpsAlterVol        $02
	dc.b	nRst, nE3, $02, nRst, nE3, $03, nRst, $02
	smpsAlterVol        $FA
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $18
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $11
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE3, $02, nRst, $0F
	smpsSetvoice        $21
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $1C
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02

Metal_Squad_Loop18:
	dc.b	nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03
	smpsLoop            $00, $02, Metal_Squad_Loop18
	dc.b	nRst, $0F
	smpsSetvoice        $11
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10, nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $04
	smpsAlterVol        $04
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, $0A, nA3, $01, nRst, $08, nA3, $01, nRst, $08
	smpsSetvoice        $23
	smpsAlterVol        $71
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $04
	smpsAlterVol        $75
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nA3, nRst, $08, nA3, $01, nRst, $08, nA3, $01, nRst, $08
	smpsSetvoice        $24
	smpsAlterVol        $71
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $1C
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $25
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $04
	smpsAlterVol        $8F
	smpsPan             panLeft, $00
	dc.b	smpsNoAttack, $12

Metal_Squad_Loop19:
	dc.b	smpsNoAttack, $09
	smpsLoop            $00, $05, Metal_Squad_Loop19
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	dc.b	nE3, $03, nRst, $10, nE3, $03, nRst, $06, nE3, $04, nRst, $18
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0B
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, smpsNoAttack, nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $07, nE3, $02, nRst, $07
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $26
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $06
	smpsSetvoice        $11
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $26
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $13
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06, nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0B
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $06
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $18
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $0A
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $04, nRst, $0F, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $27
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, smpsNoAttack, nE3, $02, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10

Metal_Squad_Loop1A:
	dc.b	nE3, $02, nRst, $07
	smpsLoop            $00, $03, Metal_Squad_Loop1A
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $04, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $04, nRst, $06
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $10
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $02, nRst, $07
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F, nE3, $03, nRst, $07
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $1B
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $06, nE3, $03, nRst, $06
	smpsSetvoice        $0F
	smpsAlterVol        $75
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $8F
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $8B

Metal_Squad_Loop1B:
	dc.b	nE3, $02, nRst, $07
	smpsLoop            $00, $03, Metal_Squad_Loop1B
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $19
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $02, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $F0
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $22
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $11
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $09
	smpsAlterVol        $8B
	dc.b	nE3, $03, nRst, $0F
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $09
	smpsAlterVol        $FC
	dc.b	nE3, $03, nRst, $10
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $06
	smpsSetvoice        $28
	smpsAlterVol        $71
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $04
	smpsAlterVol        $8F
	dc.b	nD4, nRst, $04, smpsNoAttack, nRst
	smpsPan             panRight, $00
	dc.b	nG4, $01, nRst, $0D
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $04, nD4, $01, nRst, $04
	smpsPan             panLeft, $00
	dc.b	nA3, $01, nRst, $04, smpsNoAttack, nRst, nA3, $01, nRst, $04
	smpsSetvoice        $09
	smpsAlterVol        $06
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $F6
	dc.b	nE3, $03, nRst, $0E
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE3, $03, nRst, $10, nE3, $03, nRst, $06, nE3, $03, nRst, $18
	smpsPan             panCenter, $00
	smpsJump            Metal_Squad_Jump02

; FM5 Data
Metal_Squad_FM5:
	smpsSetvoice        $03
	smpsAlterVol        $7F
	smpsPan             panLeft, $00
	dc.b	nRst, $0E
	smpsSetvoice        $01
	dc.b	$17

Metal_Squad_Jump01:
	dc.b	nRst, $7B, smpsNoAttack, $48, $4A, $49, $49, $48, smpsNoAttack, $52
	smpsSetvoice        $07
	dc.b	smpsNoAttack, $01
	smpsAlterVol        $95
	smpsAlterNote       $06
	dc.b	nF1, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $17
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nC2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	nCs2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nE2, $01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nAb2, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $17
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nB2, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nC3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	nCs3, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nAb3, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nC4, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nCs4, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $17
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nC5, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nEb5, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nE5, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nF5, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$7F, smpsNoAttack, $11, nRst, $01, nF4, $1A, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $10, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $11, nRst, $01
	smpsAlterNote       $06
	dc.b	nF4, $47, nRst, $02, nEb4, $2C, nRst, $02, nF4, nRst, $03
	smpsAlterNote       $07
	dc.b	nG4, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $03, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $03

Metal_Squad_Loop0D:
	dc.b	nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $08
	dc.b	nAb4, $02, nRst
	smpsAlterNote       $09
	dc.b	nBb4, $03
	smpsLoop            $00, $02, Metal_Squad_Loop0D
	dc.b	nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $07, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, nRst, nCs5, $07, nRst, $02, nC5, $03, nRst, $02, nCs5, $05
	dc.b	smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nD5, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nEb5, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$14, nRst, $02
	smpsSetvoice        $0D
	smpsAlterNote       $05
	dc.b	nC5, $3F, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $07, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $07, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $07, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $2C, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $2B, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb5, $08, nRst, $0A
	smpsAlterNote       $05
	dc.b	nC5, $2C, nRst, $02, nC5, $19, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $36, nRst, $01
	smpsAlterNote       $07
	dc.b	nG4, $08, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $06
	dc.b	nF4, $07, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $10, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $08, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $08, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $07, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $35, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $07, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $10, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $08, nRst, $01
	smpsAlterNote       $06
	dc.b	nF4, $08, nRst, $01, nEb4, $08, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $11, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb5, $09, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nE5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nF5, $01, nRst, $04
	smpsAlterNote       $06
	dc.b	nF5, $05

Metal_Squad_Loop0E:
	dc.b	nRst, $04, nF5, $06, nRst, $03, nF5, $06
	smpsLoop            $00, $02, Metal_Squad_Loop0E
	dc.b	nRst, $04, nF5, $05, nRst, $04, nEb5, $07, nRst, $0B, nF5, $40
	dc.b	smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	nE5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nEb5, $01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	nC5, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$1C, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb5, $08, nRst, $0A
	smpsAlterNote       $05
	dc.b	nC5, $2D, nRst, $01, smpsNoAttack, nRst, smpsNoAttack, nC5, $07, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $08, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $35, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb4, $08, nRst, $01
	smpsAlterNote       $07
	dc.b	nG4, $2C, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb4, $08, nRst, $02, nF4, $09, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nG4
	smpsModSet          $00, $02, $01, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01
	smpsModSet          $00, $02, $02, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $16
	dc.b	$01
	smpsModSet          $00, $02, $03, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $EA
	dc.b	nAb4
	smpsModSet          $00, $02, $04, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01
	smpsModSet          $00, $02, $07, $03
	dc.b	smpsNoAttack, $01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$7F, nRst, $02
	smpsSetvoice        $1A
	smpsAlterNote       $05
	dc.b	nC4, $08, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb4, $07, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $7D, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $08, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $07, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $4A, smpsNoAttack
	smpsAlterNote       $17
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	nC5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$26, nRst, $01
	smpsAlterNote       $06
	dc.b	nEb4, $08, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $08, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $7E, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $07, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs5, $35, nRst, $01
	smpsAlterNote       $07
	dc.b	nG4, $08, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $09
	dc.b	nBb4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb5, $19, nRst, $02
	smpsAlterNote       $07
	dc.b	nG5, $23, nRst, $02
	smpsSetvoice        $0D
	smpsAlterNote       $05
	dc.b	nC5, $2D, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $08, nRst, $0A
	smpsAlterNote       $06
	dc.b	nF4, $36, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $1A, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $19, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $11, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $2D, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $07, nRst, $0B
	smpsAlterNote       $06
	dc.b	nF4, $36, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $01
	smpsAlterNote       $07
	dc.b	nG4, $1A, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $1A, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $11, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $49, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$42, smpsNoAttack, $4B, smpsNoAttack, $3F, nRst, $01
	smpsAlterVol        $6B
	dc.b	nRst, nRst, $49, $48, smpsNoAttack, $49, smpsNoAttack, $49, $49, $49, $48, smpsNoAttack
	dc.b	nRst, $52
	smpsSetvoice        $1F
	dc.b	smpsNoAttack, $01
	smpsSetvoice        $07
	smpsAlterVol        $95
	dc.b	nF6, $48, smpsNoAttack, $49, smpsNoAttack, nF6, smpsNoAttack, nF6, smpsNoAttack, $48, smpsNoAttack, $7F
	dc.b	smpsNoAttack, $5B, nRst, $02
	smpsSetvoice        $0D
	smpsAlterNote       $05
	dc.b	nC5, $3F, nRst, $01
	smpsAlterNote       $06
	dc.b	nF5, $08, nRst, $01, nEb5, $08, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $08, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $08, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $2C, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $2C, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb5, $07, nRst, $0B
	smpsAlterNote       $05
	dc.b	nC5, $2C, nRst, $01, nC5, $1A, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $35, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $08, nRst, $01
	smpsAlterNote       $06
	dc.b	nF4, $08, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $36, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $52, smpsNoAttack, $48, nRst, $01
	smpsSetvoice        $1A
	smpsAlterVol        $6B
	dc.b	smpsNoAttack, nRst
	smpsAlterVol        $95
	dc.b	nF4, $02, nRst
	smpsAlterNote       $05
	dc.b	nCs4, $04, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $01
	smpsAlterNote       $06
	dc.b	nF4, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $03, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4

Metal_Squad_Loop0F:
	dc.b	nRst, $03
	smpsAlterNote       $05
	dc.b	nCs4, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $01
	smpsAlterNote       $06
	dc.b	nF4, $03
	smpsLoop            $00, $02, Metal_Squad_Loop0F
	dc.b	nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $04, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $01
	smpsAlterNote       $06
	dc.b	nF4, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $03, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $09
	dc.b	nBb3, $02, nRst

Metal_Squad_Loop10:
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, nRst, $03
	smpsAlterNote       $05
	dc.b	nCs4, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsLoop            $00, $02, Metal_Squad_Loop10
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $07
	dc.b	nFs4, nRst, $03
	smpsAlterNote       $05
	dc.b	nCs4, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $07
	dc.b	nFs4, $02, nRst

Metal_Squad_Loop11:
	smpsAlterNote       $05
	dc.b	nCs4, $03, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb3, nRst
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $07
	dc.b	nFs4, $03, nRst, $02
	smpsLoop            $00, $02, Metal_Squad_Loop11
	smpsAlterNote       $05
	dc.b	nCs4, $03, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $09
	dc.b	nBb3, $02, nRst
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, nRst, $03
	smpsAlterNote       $05
	dc.b	nCs4, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, nRst, $03
	smpsAlterNote       $05
	dc.b	nCs4, $02, nRst
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $01

Metal_Squad_Loop12:
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $07
	dc.b	nFs4, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $03, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb3, nRst
	smpsLoop            $00, $02, Metal_Squad_Loop12
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, nRst
	smpsAlterNote       $08
	dc.b	nAb4, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nF5, nRst
	smpsAlterNote       $05
	dc.b	nC5, $03, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $06, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$17, nRst, $02
	smpsAlterNote       $07
	dc.b	nFs3, $03, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb4, nRst
	smpsAlterNote       $07
	dc.b	nFs4, $03, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb5, nRst
	smpsAlterNote       $07
	dc.b	nFs5, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb5, nRst
	smpsAlterNote       $05
	dc.b	nCs5, $03, nRst, $02, nC5, $03, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $03, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $08
	dc.b	nAb4, $0A, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$06, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb3, $03, nRst, $02
	smpsAlterNote       $07
	dc.b	nFs3, $03, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb3, $03, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb3, $07, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $07, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb4, $03, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $03, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $06
	dc.b	nEb4, $07, nRst, $02
	smpsAlterNote       $05
	dc.b	nC4, $07, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb3, $03, nRst, $01
	smpsAlterNote       $05
	dc.b	nC4, $03, nRst, $02, nCs4, $07, nRst, $02, nC4, $03, nRst, $02
	dc.b	nCs4, nRst
	smpsAlterNote       $06
	dc.b	nEb4, $07, nRst, $02
	smpsAlterNote       $05
	dc.b	nCs4, $03, nRst, $02
	smpsAlterNote       $06
	dc.b	nEb4, $03, nRst, $01, nF4, $08, nRst, $02, nEb4, $03, nRst, $02
	dc.b	nF4, $03, nRst, $01
	smpsAlterNote       $07
	dc.b	nFs4, $1A, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $06
	dc.b	nF4, $12
	smpsModSet          $00, $02, $04, $03
	dc.b	smpsNoAttack, $01
	smpsModSet          $00, $02, $07, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01
	smpsModSet          $00, $02, $10, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$05, nRst, $02, smpsNoAttack, nFs4, $1A, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $12
	smpsModSet          $00, $02, $04, $03
	dc.b	smpsNoAttack, $01
	smpsModSet          $00, $02, $07, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01
	smpsModSet          $00, $02, $10, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $13
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$05, nRst, $02, nFs4, $1A, nRst, $02
	smpsAlterNote       $06
	dc.b	nF4, $12
	smpsModSet          $00, $02, $07, $03
	dc.b	smpsNoAttack, $01
	smpsModSet          $00, $02, $10, $03
	dc.b	smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$07, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$34, nRst, $01
	smpsSetvoice        $0D
	smpsAlterNote       $09
	dc.b	nBb4, $08, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $2D, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $08, nRst, $0B
	smpsAlterNote       $06
	dc.b	nF4, $36, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $1A, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $19, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $11, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $2D, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $07, nRst, $0B
	smpsAlterNote       $06
	dc.b	nF4, $36, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $01
	smpsAlterNote       $07
	dc.b	nG4, $1B, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $1A, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $11, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $49, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$42, smpsNoAttack, $48, nRst, $01
	smpsSetvoice        $07
	dc.b	nF5, $08, nRst, $01, nEb5, $08, nRst, $01, nF5, $08, nRst, $01
	dc.b	smpsNoAttack, nRst
	smpsAlterNote       $07
	dc.b	nG5, $11, nRst, $01, smpsNoAttack, nRst
	smpsAlterNote       $08
	dc.b	nAb5, $14, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	nG5, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nFs5, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01
	smpsSetvoice        $0D
	smpsAlterVol        $6B
	dc.b	nRst, smpsNoAttack, $01
	smpsAlterVol        $95
	smpsAlterNote       $05
	dc.b	nC5, $2C, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $08, nRst, $0B
	smpsAlterNote       $06
	dc.b	nF4, $35, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $07, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $1A, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $1A, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $11, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $2D, nRst, $01
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $01
	smpsAlterNote       $05
	dc.b	nC5, $08, nRst, $0A
	smpsAlterNote       $06
	dc.b	nF4, $36, nRst, $02
	smpsAlterNote       $05
	dc.b	nC5, $11, nRst, $0B, nC5, $11, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $12, nRst, $01
	smpsAlterNote       $08
	dc.b	nAb4, $08, nRst, $02
	smpsAlterNote       $07
	dc.b	nG4, $1A, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $19, nRst, $02
	smpsAlterNote       $09
	dc.b	nBb4, $11, nRst, $02
	smpsAlterNote       $08
	dc.b	nAb4, $49, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $16
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$42, smpsNoAttack, $4B, smpsNoAttack, $3F, nRst, $01
	smpsAlterVol        $6B
	dc.b	nRst, nRst, $16
	smpsSetvoice        $01
	smpsPan             panLeft, $00
	smpsModOff
	smpsAlterNote       $00
	smpsJump            Metal_Squad_Jump01

; FM6 Data
Metal_Squad_FM6:
	smpsSetvoice        $03
	smpsAlterVol        $7F
	smpsPan             panRight, $00
	dc.b	nRst, $01
	smpsSetvoice        $00
	smpsAlterVol        $93
	smpsAlterNote       $FD
	dc.b	nEb2, $08, nRst, $01, nF2, $11, nRst, $01, nF2, nRst, $08

Metal_Squad_Jump00:
	dc.b	nRst, $01
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $09, nG3, $07, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $08, nG3, nRst, $01, nF3, nRst, $08
	smpsAlterNote       $FC
	dc.b	nB2, $01, nRst, $08
	smpsAlterNote       $FE
	dc.b	nCs2, $11, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nF3, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, $11, nRst, $01, nCs2, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $0B, nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $01, nEb2, nRst, $08, nG3, nRst, $01, nEb2, nRst
	dc.b	$09, nF3, $07, nRst, $0B, nG3, $07, nRst, $02, nEb2, $10, nRst
	dc.b	$02, nEb2, $01, nRst, $08, nG3, nRst, $01, nEb2, nRst, $08, nF3
	dc.b	nRst, $01, nEb2, nRst, $13, nF2, $10, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $08, nG3, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $02, nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $08, nG3, nRst, $01, nF3, nRst, $08
	smpsAlterNote       $FC
	dc.b	nB2, $01, nRst, $08
	smpsAlterNote       $FE
	dc.b	nCs2, $11, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nF3, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, $11, nRst, $01, nCs2, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $0B, nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $01, nEb2, nRst, $08, nG3, nRst, $01, nEb2, nRst
	dc.b	$09, nF3, $07, nRst, $0C, nG3, $07, nRst, $02, nEb2, $10, nRst
	dc.b	$0B, nG3, $07, nRst, $02, nEb2, $01, nRst, $08, nF3, nRst, $01
	dc.b	nEb2, nRst, $08, nEb2, $01, nRst, $09, nF3, $11, nRst, $01, nF2
	dc.b	nRst, $37, nF3, $10, nRst, $02

Metal_Squad_Loop00:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $05, Metal_Squad_Loop00
	dc.b	nF2, $01, nRst, $09, nF3, $10, nRst, $0B

Metal_Squad_Loop01:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $05, Metal_Squad_Loop01
	dc.b	nF3, $11, nRst, $1D, nF3, $1A, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs3, $11, nRst, $01, nCs2, nRst, $08, nCs2, $01, nRst, $2E, nCs3
	dc.b	$10, nRst, $02, nCs2, $01, nRst, $08

Metal_Squad_Loop02:
	dc.b	nCs2, $01, nRst, $08, nCs2, $01, nRst, $09
	smpsLoop            $00, $02, Metal_Squad_Loop02
	dc.b	nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, $11, nRst, $01, nEb2, nRst, $08, nEb2, $01, nRst, $2D, nG3
	dc.b	$10, nRst, $02, nF3, $08, nRst, $01, nEb3, $08, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs3, $08, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb3, $08, nRst, $01, nG3, $11, nRst, $02, nF3, $10, nRst, $02
	dc.b	nF2, $01, nRst, $09, smpsNoAttack, nRst, nF2, $01, nRst, $25, nF3, $10
	dc.b	nRst, $02

Metal_Squad_Loop03:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $05, Metal_Squad_Loop03
	dc.b	nF2, $01, nRst, $09, nF3, $10, nRst, $02

Metal_Squad_Loop04:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $06, Metal_Squad_Loop04
	dc.b	nF3, $11, nRst, $1E, nF3, $19, nRst, $03
	smpsAlterNote       $FE
	dc.b	nCs3, $10, nRst, $02

Metal_Squad_Loop05:
	dc.b	nCs2, $01, nRst, $08
	smpsLoop            $00, $04, Metal_Squad_Loop05
	dc.b	nCs2, $01, nRst, $09, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, $11, nRst, $01, nEb2, nRst, $09, smpsNoAttack, nRst, smpsNoAttack, nRst, smpsNoAttack
	dc.b	nRst, nEb2, $01, nRst, $12, nF3, $10, nRst, $02

Metal_Squad_Loop06:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $04, Metal_Squad_Loop06
	dc.b	nF2, $01, nRst, $09, nF2, $01, nRst, $08
	smpsAlterNote       $FE
	dc.b	nCs3, $11, nRst, $14
	smpsAlterNote       $FD
	dc.b	nEb3, $10, nRst, $02, nEb2, $01, nRst, $09, smpsNoAttack, nRst, nEb2, $01
	dc.b	nRst, $09, nG3, $49, smpsNoAttack, $47, nRst, $02
	smpsAlterNote       $FC
	dc.b	nAb3, $4A, smpsNoAttack, $47, nRst, $02
	smpsAlterNote       $FD
	dc.b	nG3, $49, smpsNoAttack, $47, nRst, $02
	smpsAlterNote       $FC
	dc.b	nAb3, $47, nRst, $02, nBb3, $3E, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $08, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $08, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $02, nF3, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nB2, $01, nRst, $09
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $02, nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $13
	smpsAlterNote       $FD
	dc.b	nEb2, $10, nRst, $02, nEb2, $01, nRst, $09, nG3, $07, nRst, $02
	dc.b	nEb2, $01, nRst, $08, nF3, $07, nRst, $02, nEb2, $01, nRst, $08
	dc.b	nEb2, $01, nRst, $09, nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $09, nG3, $08, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $08, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $15
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $02, nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $0C, nEb3, $07, nRst, $16, nEb2, $10, nRst, $0B
	dc.b	nG3, $07, nRst, $02, nEb2, $01, nRst, $09, nF3, $07, nRst, $02
	dc.b	nEb2, $01, nRst, $08, nEb2, $01, nRst, $09, nF2, $10, nRst, $02
	dc.b	nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02, nBb3, $10, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0C
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $0C
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $09, nG3, $07, nRst, $0C
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF3, nRst, $09, nEb2, $08, nRst
	dc.b	$01, nF2, $11, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF3, nRst, $08
	smpsAlterNote       $FC
	dc.b	nB2, $01, nRst, $09
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, nRst, $08
	smpsAlterNote       $FD
	dc.b	nF3, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, $11, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $0B, nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $01, nEb2, nRst, $09, nG3, $07, nRst, $0B, nF3
	dc.b	$07, nRst, $0B, nG3, $07, nRst, $02, nEb2, $11, nRst, $01, nEb2
	dc.b	nRst, $08, nG3, nRst, $01, nEb2, nRst, $09, nF3, $07, nRst, $15
	dc.b	nF2, $10, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $08, nG3, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $09, nG3, $07, nRst, $14
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $02, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nF3, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, nRst, $08, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $0B, nG3, $07, nRst, $0B, nF3, $07, nRst, $02
	dc.b	nEb2, $01, nRst, $08, nG3, nRst, $01, nEb2, $11, nRst, $01, nEb2
	dc.b	nRst, $09, nG3, $07, nRst, $0B, nF3, $07, nRst, $0B, nEb2, $01
	dc.b	nRst, $09, nF3, $10, nRst, $02

Metal_Squad_Loop07:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $04, Metal_Squad_Loop07
	dc.b	nF2, $01, nRst, $09, nF2, $01, nRst, $08, nF3, $11, nRst, $1D

Metal_Squad_Loop08:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $03, Metal_Squad_Loop08
	dc.b	nF3, $11, nRst, $01, nF2, nRst, $08, nF2, $01, nRst, $24, nF2
	dc.b	$01, nRst, $08, nF3, $11, nRst, $01, nF2, nRst, $08, nF2, $01
	dc.b	nRst, $08, nF2, $01, nRst, $09, nF3, $19, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs3, $10, nRst, $02

Metal_Squad_Loop09:
	dc.b	nCs2, $01, nRst, $08
	smpsLoop            $00, $04, Metal_Squad_Loop09
	dc.b	nCs2, $01, nRst, $09, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, $11, nRst, $26, nEb2, $01, nRst, $09, smpsNoAttack, nRst, nF3, $11
	dc.b	nRst, $01, nF2

Metal_Squad_Loop0A:
	dc.b	nRst, $08, nF2, $01
	smpsLoop            $00, $03, Metal_Squad_Loop0A
	dc.b	nRst, $1B
	smpsAlterNote       $FE
	dc.b	nCs3, $10, nRst, $02, nCs2, $01, nRst, $08, nCs2, $01, nRst, $08
	smpsAlterNote       $FD
	dc.b	nEb3, $11, nRst, $01, nEb2, nRst, $08, nEb2, $01, nRst, $12
	smpsAlterNote       $FC
	dc.b	nBb3, $11, nRst, $02, nBb2, $01, nRst, $08, nBb3, $11, nRst, $1E
	dc.b	nBb3, $11, nRst, $02, nBb2, $01, nRst, $09, nBb3, $10, nRst, $1F
	smpsAlterNote       $FD
	dc.b	nFs3, $10, nRst, $0C, smpsNoAttack, nFs3, $10, nRst, $1F, nFs3, $10, nRst
	dc.b	$0C, nFs3, $10, nRst, $02, nFs2, $01, nRst, $09, smpsNoAttack, nRst, nFs2
	dc.b	$01, nRst, $09, nF3, $10, nRst, $0C, nF3, $10, nRst, $02, nF2
	dc.b	$01, nRst, $09, nF2, $01, nRst, $08, nF2, $01, nRst, $09, nEb3
	dc.b	$10, nRst, $0C, nEb3, $10, nRst, $02, nEb2, $01, nRst, $09, nEb2
	dc.b	$01, nRst, $08, nEb2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb2, $01, nRst, $08

Metal_Squad_Loop0B:
	dc.b	nAb2, $01, nRst, $12
	smpsLoop            $00, $03, Metal_Squad_Loop0B
	dc.b	nAb2, $01, nRst, $09
	smpsAlterNote       $FE
	dc.b	nCs3, $47, nRst, $02
	smpsAlterNote       $FD
	dc.b	nFs3, $1A, nRst, $02, nF3, $10, nRst, $1F, nFs3, $19, nRst, $03
	dc.b	nF3, $10, nRst, $15, nF2, $01, nRst, $09, nFs3, $19, nRst, $03
	dc.b	nF3, $10, nRst, $02

Metal_Squad_Loop0C:
	dc.b	nF2, $01, nRst, $08
	smpsLoop            $00, $04, Metal_Squad_Loop0C
	dc.b	nF2, $01, nRst, $1B, nF3, $07, nRst, $0C, nEb3, $07, nRst, $02
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $09, nG3, $07, nRst, $02, nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $03
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $0C
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $02, nF3, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nB2, $01, nRst, $09
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $02, nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $09, nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nEb2, $10, nRst, $02, nEb2, $01, nRst, $09, nG3, $07, nRst, $02
	dc.b	nEb2, $01, nRst, $08, nF3, $07, nRst, $02, nEb2, $01, nRst, $08
	dc.b	nEb2, $01, nRst, $09, nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $09, nG3, $08, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $08, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $15
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $02, nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nEb3, $07, nRst, $16, nEb2, $10, nRst, $0C, nG3, $07, nRst, $0B
	dc.b	nF3, $07, nRst, $02, nEb2, $01, nRst, $08, nEb2, $01, nRst, $09
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02, nBb3, $10, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0C
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $0C
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0C, nBb3, $07, nRst, $0C, nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0C
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $0C
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $08, nG3, $07, nRst, $02, nF3, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nB2, $01, nRst, $09
	smpsAlterNote       $FE
	dc.b	nCs2, $11, nRst, $01, nCs2, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $08, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, nRst, $09
	smpsAlterNote       $FD
	dc.b	nEb3, $08, nRst, $01
	smpsAlterNote       $FE
	dc.b	nCs2, nRst, $09, nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nEb2, $10, nRst, $02, nEb2, $01, nRst, $09, nG3, $07, nRst, $02
	dc.b	nEb2, $01, nRst, $08, nF3, nRst, $01, nEb2, nRst, $08, nEb2, $01
	dc.b	nRst, $09, nF2, $11, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $08, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $08, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nG3, $07, nRst, $02, nF3, $01, nRst, $08
	smpsAlterNote       $FC
	dc.b	nB2, $01, nRst, $09
	smpsAlterNote       $FE
	dc.b	nCs2, $10, nRst, $02, nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nF3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $09
	smpsAlterNote       $FD
	dc.b	nEb3, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nCs2, $01, nRst, $13
	smpsAlterNote       $FD
	dc.b	nEb2, $10, nRst, $02, nEb2, $01, nRst, $09, nG3, $07, nRst, $02
	dc.b	nEb2, $01, nRst, $08, nF3, $07, nRst, $02, nEb2, $01, nRst, $08
	dc.b	nEb2, $01, nRst, $09, nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $09, nG3, $07, nRst, $0B
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02, nBb3, $10, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $09, nG3, $07, nRst, $02, nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $10, nRst, $02, nF2, $01, nRst, $09
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $01, nRst, $09, nG3, $07, nRst, $0C
	smpsAlterNote       $FC
	dc.b	nAb3, $07, nRst, $02
	smpsAlterNote       $FD
	dc.b	nF2, $11, nRst, $01, nF2, nRst, $08
	smpsAlterNote       $FC
	dc.b	nAb3, nRst, $01
	smpsAlterNote       $FD
	dc.b	nF2, nRst, $08, nG3, nRst, $0C, nEb2, $07, nRst, $01, smpsNoAttack, nRst
	dc.b	nF2, $10, nRst, $0A
	smpsPan             panRight, $00
	smpsJump            Metal_Squad_Jump00

; PSG1 Data
Metal_Squad_PSG1:

Metal_Squad_Loop9B:
	dc.b	nRst, $7F
	smpsLoop            $00, $17, Metal_Squad_Loop9B
	dc.b	$12

Metal_Squad_Jump07:

Metal_Squad_Loop9C:
	dc.b	nRst, $7F
	smpsLoop            $00, $16, Metal_Squad_Loop9C
	dc.b	nRst, $6C
	smpsPSGAlterVol     $04
	dc.b	nF2, $22
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FF
	dc.b	nAb2, $10, nRst, $03, nG2, $10, nRst, $02, nEb2, $07, nRst, $02
	smpsAlterNote       $00
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $00
	dc.b	nF2, $11
	smpsAlterNote       $FF

Metal_Squad_Loop9D:
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	smpsLoop            $00, $02, Metal_Squad_Loop9D
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2, nRst, $02
	smpsAlterNote       $FF
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FF
	dc.b	nEb2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FE
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	$02, nRst, $01
	smpsAlterNote       $00
	dc.b	nF2, $23
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02

Metal_Squad_Loop9E:
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	smpsLoop            $00, $02, Metal_Squad_Loop9E
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FF
	dc.b	nAb2, $11, nRst, $01, nG2, $11, nRst, $02, nEb2, $07, nRst, $02
	smpsAlterNote       $00
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $00
	dc.b	nF2, $11
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2, nRst, $02
	smpsAlterNote       $FF
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FF
	dc.b	nEb2, $10
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FB
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2

Metal_Squad_Loop9F:
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsLoop            $00, $02, Metal_Squad_Loop9F
	smpsAlterNote       $FF
	dc.b	$02, nRst, $01
	smpsAlterNote       $00
	dc.b	nF2, $2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$1B
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01

Metal_Squad_LoopA0:
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_LoopA0
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsPSGAlterVol     $01

Metal_Squad_LoopA1:
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_LoopA1
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$0C
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$04

Metal_Squad_LoopA2:
	dc.b	nRst, $7F
	smpsLoop            $00, $12, Metal_Squad_LoopA2
	dc.b	nRst, $55
	smpsPSGAlterVol     $FA
	dc.b	nFs2, $1A, nRst, $02, nF2, $10
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$02

Metal_Squad_LoopA3:
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_LoopA3
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2, nRst, $02, nBb2, $1A, nRst, $02, nA2, $11
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nA2
	smpsAlterNote       $00
	dc.b	nA2
	smpsAlterNote       $01
	dc.b	nA2
	smpsAlterNote       $03
	dc.b	nA2
	smpsAlterNote       $02
	dc.b	nA2
	smpsAlterNote       $01
	dc.b	nA2
	smpsAlterNote       $FF
	dc.b	nA2
	smpsAlterNote       $FE
	dc.b	nA2
	smpsAlterNote       $FD
	dc.b	nA2
	smpsAlterNote       $FF
	dc.b	nA2
	smpsAlterNote       $00
	dc.b	nA2
	smpsAlterNote       $01
	dc.b	nA2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nA2
	smpsAlterNote       $FE
	dc.b	nA2
	smpsAlterNote       $FD
	dc.b	nA2
	smpsAlterNote       $FE
	dc.b	nA2
	smpsAlterNote       $00
	dc.b	nA2
	smpsAlterNote       $01
	dc.b	nA2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nA2, nRst, $02
	smpsAlterNote       $FF
	dc.b	nCs3, $1A, nRst, $02, nC3, $24
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3

Metal_Squad_LoopA4:
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	$02
	smpsLoop            $00, $02, Metal_Squad_LoopA4
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	smpsAlterNote       $00
	dc.b	nF2, $23
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00

Metal_Squad_LoopA5:
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	smpsLoop            $00, $02, Metal_Squad_LoopA5
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FF
	dc.b	nAb2, $11, nRst, $02, nG2, $10, nRst, $02, nEb2, $07, nRst, $02
	smpsAlterNote       $00
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $00
	dc.b	nF2, $11
	smpsAlterNote       $FF

Metal_Squad_LoopA6:
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	smpsLoop            $00, $02, Metal_Squad_LoopA6
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsAlterNote       $FF
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FF
	dc.b	nEb2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	$02

Metal_Squad_LoopA7:
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FE
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsLoop            $00, $02, Metal_Squad_LoopA7
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	$02, nRst, $01
	smpsAlterNote       $00
	dc.b	nF2, $23
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00

Metal_Squad_LoopA8:
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	smpsLoop            $00, $02, Metal_Squad_LoopA8
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FF
	dc.b	nAb2, $11, nRst, $01, nG2, $11, nRst, $02, nEb2, $07, nRst, $02
	smpsAlterNote       $00
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $00
	dc.b	nF2, $11
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsAlterNote       $FF
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FF
	dc.b	nEb2, $10
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $FE
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	$02, nRst, $01
	smpsAlterNote       $00
	dc.b	nF2, $2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$18
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsPSGAlterVol     $01

Metal_Squad_LoopA9:
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_LoopA9
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsPSGAlterVol     $FD
	smpsAlterNote       $FF
	dc.b	nAb2, $1A, nRst, $02, nC3, $1A, nRst, $01, nEb3, $14
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nE3
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nE3
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $01
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$11
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$06
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	$03
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	$03
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	nF3, nRst
	smpsPSGAlterVol     $FF
	dc.b	nF2, $23
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FF
	dc.b	nAb2, $10, nRst, $02, nG2, $10, nRst, $02, nEb2, $07, nRst, $02
	smpsAlterNote       $00
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $00
	dc.b	nF2, $11
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsAlterNote       $FF
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FF
	dc.b	nEb2, $11

Metal_Squad_LoopAA:
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsLoop            $00, $02, Metal_Squad_LoopAA
	smpsAlterNote       $FE
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	$02, nRst
	smpsAlterNote       $00
	dc.b	nF2, $22
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FF
	dc.b	nAb2, $11, nRst, $02, nG2, $10, nRst, $02, nEb2, $07, nRst, $02
	smpsAlterNote       $00
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $00
	dc.b	nF2, $11
	smpsAlterNote       $FF

Metal_Squad_LoopAB:
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	smpsLoop            $00, $02, Metal_Squad_LoopAB
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$02, nRst, $01
	smpsAlterNote       $FF
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FF
	dc.b	nEb2, $11
	smpsAlterNote       $FD
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FE
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $02
	dc.b	nEb2
	smpsAlterNote       $03
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	$02, nRst, $01
	smpsAlterNote       $00
	dc.b	nF2, $2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$1B

Metal_Squad_LoopAC:
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_LoopAC
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02

Metal_Squad_LoopAD:
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	smpsLoop            $00, $02, Metal_Squad_LoopAD
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsPSGAlterVol     $01

Metal_Squad_LoopAE:
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_LoopAE
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $02
	dc.b	nF2
	smpsAlterNote       $03
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	$02
	smpsAlterNote       $00
	dc.b	$0A
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $00
	dc.b	$05, nRst, $26
	smpsPSGAlterVol     $F6
	smpsJump            Metal_Squad_Jump07

; PSG2 Data
Metal_Squad_PSG2:

Metal_Squad_Loop8C:
	dc.b	nRst, $7F
	smpsLoop            $00, $17, Metal_Squad_Loop8C
	dc.b	$20

Metal_Squad_Jump06:

Metal_Squad_Loop8D:
	dc.b	nRst, $7F
	smpsLoop            $00, $16, Metal_Squad_Loop8D
	dc.b	nRst, $7A
	smpsPSGAlterVol     $05
	smpsAlterNote       $FE
	dc.b	nF2, $23
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	dc.b	nAb2, $10, nRst, $02, nG2, $11, nRst, $02
	smpsAlterNote       $FD
	dc.b	nEb2, $08, nRst, $01
	smpsAlterNote       $FE
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FE
	dc.b	nF2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nEb2, $10
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	nF2, $23
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00

Metal_Squad_Loop8E:
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	smpsLoop            $00, $02, Metal_Squad_Loop8E
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	dc.b	nAb2, $10, nRst, $02, nG2, $11, nRst, $02
	smpsAlterNote       $FD
	dc.b	nEb2, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FE
	dc.b	nF2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $10, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nEb2, $11
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02, nRst, $01
	smpsAlterNote       $FE
	dc.b	nF2, $2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$1A
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF

Metal_Squad_Loop8F:
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	smpsLoop            $00, $02, Metal_Squad_Loop8F
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01

Metal_Squad_Loop90:
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_Loop90
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01

Metal_Squad_Loop91:
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_Loop91
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$0C
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$04

Metal_Squad_Loop92:
	dc.b	nRst, $7F
	smpsLoop            $00, $12, Metal_Squad_Loop92
	dc.b	nRst, $56
	smpsPSGAlterVol     $FA
	dc.b	nFs2, $1A, nRst, $01, nF2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01, nBb2, $1B, nRst, $01, nA2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $03
	dc.b	nBb2, $02
	smpsAlterNote       $FD
	dc.b	nA2, $01
	smpsAlterNote       $FE
	dc.b	nA2
	smpsAlterNote       $00
	dc.b	nA2
	smpsAlterNote       $01
	dc.b	nA2
	smpsAlterNote       $00
	dc.b	nA2
	smpsAlterNote       $FE
	dc.b	nA2
	smpsAlterNote       $FD
	dc.b	nA2
	smpsAlterNote       $03
	dc.b	nBb2, $02
	smpsAlterNote       $FD
	dc.b	nA2, $01
	smpsAlterNote       $FE
	dc.b	nA2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nA2
	smpsAlterNote       $FE
	dc.b	nA2
	smpsAlterNote       $FD
	dc.b	nA2
	smpsAlterNote       $03
	dc.b	nBb2, $02
	smpsAlterNote       $FD
	dc.b	nA2, $01
	smpsAlterNote       $FF
	dc.b	nA2
	smpsAlterNote       $00
	dc.b	nA2
	smpsAlterNote       $01
	dc.b	nA2
	smpsAlterNote       $FF
	dc.b	nA2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01, nCs3, $1B, nRst, $01, nC3, $23
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nCs3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nCs3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3

Metal_Squad_Loop93:
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nCs3
	smpsAlterNote       $FD
	dc.b	nC3, $02
	smpsAlterNote       $FF
	dc.b	$01
	smpsLoop            $00, $02, Metal_Squad_Loop93
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nCs3
	smpsAlterNote       $FD
	dc.b	nC3, $02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	$04
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nCs3
	smpsAlterNote       $FD
	dc.b	nC3, $02
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $02
	dc.b	nCs3
	smpsAlterNote       $FD
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $00
	dc.b	nC3
	smpsAlterNote       $01
	dc.b	nC3
	smpsAlterNote       $FF
	dc.b	nC3
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	dc.b	nF2, $23
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2

Metal_Squad_Loop94:
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsLoop            $00, $02, Metal_Squad_Loop94
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	dc.b	nAb2, $10, nRst, $02, nG2, $12, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nF2, $11, nRst, $0B
	smpsAlterNote       $FE
	dc.b	nF2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nEb2, $10
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2, nRst
	smpsAlterNote       $FE
	dc.b	nF2, $24
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsPSGAlterVol     $01

Metal_Squad_Loop95:
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsLoop            $00, $02, Metal_Squad_Loop95
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	dc.b	nAb2, $10, nRst, $02, nG2, $12, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nF2, $12, nRst, $0A
	smpsAlterNote       $FE
	dc.b	nF2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE

Metal_Squad_Loop96:
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	smpsLoop            $00, $02, Metal_Squad_Loop96
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nEb2, $10
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	$02
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02, nRst, $01
	smpsAlterNote       $FE
	dc.b	nF2, $2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$18
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE

Metal_Squad_Loop97:
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	smpsLoop            $00, $02, Metal_Squad_Loop97
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FD
	dc.b	nAb2, $19, nRst, $02, nC3, $1A, nRst, $01, nEb3, $15
	smpsAlterNote       $02
	dc.b	nE3, $01
	smpsAlterNote       $01
	dc.b	nE3
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	nE3
	smpsAlterNote       $02
	dc.b	nF3, $01
	smpsAlterNote       $01
	dc.b	nF3
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$10
	smpsPSGAlterVol     $01
	smpsAlterNote       $FF
	dc.b	$08
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nFs3
	smpsAlterNote       $FE
	dc.b	nF3, $02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	nF3
	smpsAlterNote       $FE
	dc.b	$04
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nFs3
	smpsAlterNote       $FE
	dc.b	nF3, $02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $02
	dc.b	nFs3
	smpsAlterNote       $FE
	dc.b	nF3
	smpsAlterNote       $FF
	dc.b	$02
	smpsAlterNote       $00
	dc.b	nF3
	smpsAlterNote       $FF
	dc.b	$03, nRst, $01
	smpsPSGAlterVol     $FF
	smpsAlterNote       $FE
	dc.b	nF2, $23
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC

Metal_Squad_Loop98:
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	smpsLoop            $00, $03, Metal_Squad_Loop98
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $01
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsPSGAlterVol     $FE
	dc.b	nAb2, $11, nRst, $01, nG2, $12, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $07, nRst, $02
	smpsAlterNote       $FE
	dc.b	nF2, $12, nRst, $0A
	smpsAlterNote       $FE
	dc.b	nF2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $12, nRst, $0A
	smpsAlterNote       $FD
	dc.b	nEb2, $10
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2, nRst
	smpsAlterNote       $FE
	dc.b	nF2, $24
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$03
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02
	smpsPSGAlterVol     $FE
	dc.b	nAb2, $12, nRst, $01, nG2, $11, nRst, $02
	smpsAlterNote       $FD
	dc.b	nEb2, $08, nRst, $01
	smpsAlterNote       $FE
	dc.b	nF2, $12, nRst, $0A
	smpsAlterNote       $FE
	dc.b	nF2, $11
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $01
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	$02
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	$02, nRst, $01
	smpsAlterNote       $FD
	dc.b	nEb2, $11, nRst, $0B
	smpsAlterNote       $FD
	dc.b	nEb2, $10
	smpsAlterNote       $FC
	dc.b	$01
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FB
	dc.b	nEb2
	smpsAlterNote       $05
	dc.b	nE2
	smpsAlterNote       $FC
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nEb2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $FF
	dc.b	nEb2
	smpsAlterNote       $FD
	dc.b	$02
	smpsAlterNote       $FE
	dc.b	nF2, $2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$1A
	smpsAlterNote       $FD
	dc.b	$01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2

Metal_Squad_Loop99:
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsLoop            $00, $02, Metal_Squad_Loop99
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02

Metal_Squad_Loop9A:
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsLoop            $00, $02, Metal_Squad_Loop9A
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FE
	dc.b	$01
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FD
	dc.b	nF2, $02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $01
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $FD
	dc.b	nF2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $04
	dc.b	nFs2
	smpsAlterNote       $FC
	dc.b	nF2
	smpsAlterNote       $FE
	dc.b	nF2
	smpsAlterNote       $FF
	dc.b	nF2
	smpsAlterNote       $00
	dc.b	$02
	smpsAlterNote       $FF
	dc.b	$01
	smpsAlterNote       $FE
	dc.b	$0B
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$2F
	smpsPSGAlterVol     $01
	smpsAlterNote       $FE
	dc.b	$05, nRst, $18
	smpsPSGAlterVol     $F5
	smpsJump            Metal_Squad_Jump06

Metal_Squad_Voices:
;	Voice $00
;	$38
;	$02, $00, $00, $03, 	$1F, $1F, $1F, $1F, 	$04, $03, $02, $06
;	$02, $01, $01, $01, 	$14, $17, $16, $13, 	$12, $18, $19, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $03, $00, $00, $02
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $06, $02, $03, $04
	smpsVcDecayRate2    $01, $01, $01, $02
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $03, $06, $07, $04
	smpsVcTotalLevel    $00, $19, $18, $12

;	Voice $01
;	$20
;	$3F, $53, $00, $01, 	$5F, $5F, $5F, $5F, 	$0F, $10, $12, $07
;	$08, $08, $08, $08, 	$17, $17, $17, $17, 	$13, $3E, $0C, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $05, $03
	smpsVcCoarseFreq    $01, $00, $03, $0F
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $07, $12, $10, $0F
	smpsVcDecayRate2    $08, $08, $08, $08
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $0C, $3E, $13

;	Voice $02
;	$2C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $0C, $0D
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $0D, $0C, $00, $00

;	Voice $03
;	$20
;	$33, $50, $00, $00, 	$5F, $5F, $5F, $5F, 	$0F, $10, $12, $07
;	$08, $08, $08, $08, 	$17, $17, $17, $17, 	$7F, $7F, $7F, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $05, $03
	smpsVcCoarseFreq    $00, $00, $00, $03
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $07, $12, $10, $0F
	smpsVcDecayRate2    $08, $08, $08, $08
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $7F, $7F, $7F

;	Voice $04
;	$3C
;	$31, $30, $51, $50, 	$17, $1A, $17, $1A, 	$16, $00, $1C, $00
;	$1F, $00, $1F, $00, 	$FF, $03, $FF, $03, 	$0F, $00, $0F, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $00, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $16
	smpsVcDecayRate2    $00, $1F, $00, $1F
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $03, $0F, $03, $0F
	smpsVcTotalLevel    $00, $0F, $00, $0F

;	Voice $05
;	$2C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FF, $03, $FF, $03, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $03, $0F, $03, $0F
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $06
;	$3C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$0F, $00, $0F, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $0F, $00, $0F

;	Voice $07
;	$3A
;	$34, $53, $32, $52, 	$17, $13, $1B, $17, 	$03, $03, $00, $03
;	$00, $00, $00, $00, 	$17, $57, $57, $17, 	$19, $18, $0E, $00
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $03, $05, $03
	smpsVcCoarseFreq    $02, $02, $03, $04
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $17, $1B, $13, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $00, $03, $03
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $05, $05, $01
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $0E, $18, $19

;	Voice $08
;	$2C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $1C, $00
;	$1F, $00, $1F, $00, 	$FF, $03, $FF, $03, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $1A
	smpsVcDecayRate2    $00, $1F, $00, $1F
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $03, $0F, $03, $0F
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $09
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $0A, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $19, $0A, $00

;	Voice $0A
;	$2C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $0B
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $0C
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $0D
;	$20
;	$05, $1B, $01, $03, 	$0F, $13, $0F, $1B, 	$03, $02, $04, $04
;	$05, $02, $03, $03, 	$66, $66, $26, $26, 	$19, $19, $19, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $01, $00
	smpsVcCoarseFreq    $03, $01, $0B, $05
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1B, $0F, $13, $0F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $04, $02, $03
	smpsVcDecayRate2    $03, $03, $02, $05
	smpsVcDecayLevel    $02, $02, $06, $06
	smpsVcReleaseRate   $06, $06, $06, $06
	smpsVcTotalLevel    $00, $19, $19, $19

;	Voice $0E
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $07, $0C, $07, $05
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $0F
;	$2C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $10
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $07, $0F, $06, $05
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $11
;	$3C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $12
;	$2C
;	$00, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $13
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $14
;	$3C
;	$01, $00, $00, $01, 	$1F, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $15
;	$3C
;	$31, $30, $51, $50, 	$17, $1A, $17, $1A, 	$16, $00, $1C, $00
;	$1F, $00, $19, $00, 	$15, $06, $FF, $05, 	$0F, $00, $0F, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $00, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $16
	smpsVcDecayRate2    $00, $19, $00, $1F
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0F, $00, $0F

;	Voice $16
;	$3C
;	$01, $00, $00, $01, 	$17, $1A, $17, $1A, 	$16, $00, $1C, $00
;	$1F, $00, $1F, $00, 	$FF, $03, $FF, $03, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $16
	smpsVcDecayRate2    $00, $1F, $00, $1F
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $03, $0F, $03, $0F
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $17
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $18
;	$2C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $19
;	$28
;	$21, $01, $01, $01, 	$1B, $1F, $0F, $1B, 	$03, $02, $04, $04
;	$05, $02, $03, $03, 	$66, $66, $26, $26, 	$10, $1A, $0C, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $02
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1B, $0F, $1F, $1B
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $04, $02, $03
	smpsVcDecayRate2    $03, $03, $02, $05
	smpsVcDecayLevel    $02, $02, $06, $06
	smpsVcReleaseRate   $06, $06, $06, $06
	smpsVcTotalLevel    $00, $0C, $1A, $10

;	Voice $1A
;	$28
;	$21, $01, $01, $01, 	$1B, $1F, $1F, $1F, 	$00, $00, $08, $03
;	$01, $00, $01, $00, 	$10, $04, $50, $17, 	$10, $1A, $0C, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $02
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1B
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $08, $00, $00
	smpsVcDecayRate2    $00, $01, $00, $01
	smpsVcDecayLevel    $01, $05, $00, $01
	smpsVcReleaseRate   $07, $00, $04, $00
	smpsVcTotalLevel    $00, $0C, $1A, $10

;	Voice $1B
;	$2C
;	$00, $00, $00, $00, 	$17, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $1C
;	$3C
;	$01, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $1D
;	$3C
;	$31, $30, $51, $50, 	$17, $1A, $17, $1A, 	$16, $00, $1C, $00
;	$1F, $00, $1F, $00, 	$FF, $03, $FF, $03, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $00, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $16
	smpsVcDecayRate2    $00, $1F, $00, $1F
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $03, $0F, $03, $0F
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $1E
;	$3C
;	$31, $30, $51, $50, 	$17, $1A, $17, $1A, 	$16, $00, $1C, $00
;	$1F, $00, $1F, $00, 	$FF, $03, $FF, $03, 	$00, $7F, $0F, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $00, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $16
	smpsVcDecayRate2    $00, $1F, $00, $1F
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $03, $0F, $03, $0F
	smpsVcTotalLevel    $00, $0F, $7F, $00

;	Voice $1F
;	$3A
;	$34, $53, $32, $52, 	$17, $13, $1B, $17, 	$03, $02, $04, $04
;	$05, $02, $03, $03, 	$66, $66, $26, $26, 	$19, $18, $0E, $00
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $03, $05, $03
	smpsVcCoarseFreq    $02, $02, $03, $04
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $17, $1B, $13, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $04, $02, $03
	smpsVcDecayRate2    $03, $03, $02, $05
	smpsVcDecayLevel    $02, $02, $06, $06
	smpsVcReleaseRate   $06, $06, $06, $06
	smpsVcTotalLevel    $00, $0E, $18, $19

;	Voice $20
;	$20
;	$05, $1B, $01, $03, 	$0F, $13, $0F, $1B, 	$03, $03, $00, $03
;	$00, $00, $00, $00, 	$17, $57, $57, $17, 	$19, $19, $19, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $01, $00
	smpsVcCoarseFreq    $03, $01, $0B, $05
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1B, $0F, $13, $0F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $00, $03, $03
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $05, $05, $01
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $19, $19, $19

;	Voice $21
;	$3C
;	$01, $00, $00, $01, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $22
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $7F, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0C, $7F, $00

;	Voice $23
;	$3C
;	$01, $00, $00, $01, 	$1F, $1F, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $03, $FF, $03, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $03, $0F, $03, $05
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $24
;	$3C
;	$01, $00, $00, $50, 	$17, $1A, $17, $1A, 	$16, $00, $1C, $00
;	$1F, $00, $1F, $00, 	$FF, $03, $FF, $03, 	$00, $00, $19, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $16
	smpsVcDecayRate2    $00, $1F, $00, $1F
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $03, $0F, $03, $0F
	smpsVcTotalLevel    $00, $19, $00, $00

;	Voice $25
;	$3C
;	$31, $30, $51, $50, 	$17, $1A, $17, $1A, 	$16, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$0F, $00, $0F, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $00, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $16
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0F, $00, $0F

;	Voice $26
;	$2C
;	$00, $00, $00, $00, 	$17, $1A, $19, $19, 	$17, $00, $19, $00
;	$00, $00, $19, $00, 	$15, $06, $FF, $05, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $19, $19, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $19, $00, $17
	smpsVcDecayRate2    $00, $19, $00, $00
	smpsVcDecayLevel    $00, $0F, $00, $01
	smpsVcReleaseRate   $05, $0F, $06, $05
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $27
;	$2C
;	$00, $00, $00, $00, 	$17, $1A, $1A, $1A, 	$1A, $00, $17, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $05, 	$00, $00, $0C, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $1A, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $00, $1A
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $05, $0C, $07, $0C
	smpsVcTotalLevel    $00, $0C, $00, $00

;	Voice $28
;	$3C
;	$31, $30, $51, $50, 	$17, $1A, $17, $1A, 	$16, $00, $1C, $00
;	$19, $00, $19, $00, 	$FC, $07, $FC, $07, 	$0F, $00, $0F, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $05, $05, $03, $03
	smpsVcCoarseFreq    $00, $01, $00, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1A, $17, $1A, $17
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1C, $00, $16
	smpsVcDecayRate2    $00, $19, $00, $19
	smpsVcDecayLevel    $00, $0F, $00, $0F
	smpsVcReleaseRate   $07, $0C, $07, $0C
	smpsVcTotalLevel    $00, $0F, $00, $0F

