BrokenMoon_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     BrokenMoon_Voices
	smpsHeaderChan      $05, $03
	smpsHeaderTempo     $02, $05

	smpsHeaderDAC       BrokenMoon_DAC
	smpsHeaderFM        BrokenMoon_FM1,	$00, $20
	smpsHeaderFM        BrokenMoon_FM2,	$00, $18
	smpsHeaderFM        BrokenMoon_FM3,	$00, $18
	smpsHeaderFM        BrokenMoon_FM4,	$00, $18
	smpsHeaderPSG       BrokenMoon_PSG1,	$00, $18, $00, fTone_01
	smpsHeaderPSG       BrokenMoon_PSG2,	$00, $18, $00, fTone_01
	smpsHeaderPSG       BrokenMoon_PSG3,	$00, $18, $00, fTone_01

; DAC Data
BrokenMoon_DAC:
	smpsPan             panCenter, $00
	smpsSetTempoMod     $07
	dc.b	dSnareS3, $06, dKickS3, $03, $03, dCrashCymbal, dKickS3

BrokenMoon_Loop00:
	dc.b	dKickS3, $06, $09

BrokenMoon_Loop01:
	dc.b	$03, dClapS3, $06, dQuickLooseSnare, $03, dKickS3, $06, $03, $06, dClapS3
	smpsLoop            $00, $08, BrokenMoon_Loop00
	dc.b	dKickS3, $03, dSnareS3, dKickS3, $09
	smpsLoop            $01, $02, BrokenMoon_Loop01

BrokenMoon_Loop02:
	dc.b	$03, dClapS3, $06, dQuickLooseSnare, $03, dKickS3, $06, $03, $06, dClapS3, dKickS3, dKickS3
	dc.b	$09
	smpsLoop            $00, $06, BrokenMoon_Loop02
	dc.b	$03, dClapS3, $06, dQuickLooseSnare, $03, dKickS3, $06, $03, $06, dClapS3, dKickS3, dKickS3
	dc.b	$03, dSnareS3, dSnareS3, dKickS3, dClapS3, dSnareS3, dSnareS3, dKickS3, $06, $02, dSnareS3, $01
	dc.b	dKickS3, $03, dSnareS3, dSnareS3, $02, $01, $02, $01

BrokenMoon_Loop04:
	dc.b	dKickS3, $03, dSnareS3, dKickS3

BrokenMoon_Loop03:
	dc.b	$09, $03, dClapS3, $06, dQuickLooseSnare, $03, dKickS3, $06, $03, $06, dClapS3, dKickS3
	smpsLoop            $00, $07, BrokenMoon_Loop03
	dc.b	$09, $03, dClapS3, $06, dQuickLooseSnare, $03, dKickS3, $06, $03, $06, dClapS3
	smpsLoop            $01, $02, BrokenMoon_Loop04
	dc.b	dKickS3, $03, dSnareS3, dKickS3

BrokenMoon_Loop05:
	dc.b	$09, $03, dClapS3, $06, dQuickLooseSnare, $03, dKickS3, $06, $03, $06, dClapS3, dKickS3
	smpsLoop            $00, $07, BrokenMoon_Loop05
	dc.b	$03, dSnareS3, dSnareS3, dKickS3, dClapS3, dSnareS3, dSnareS3, dKickS3, $06, $02, dSnareS3, $01
	dc.b	dKickS3, $03, dSnareS3, dSnareS3, $02, $01, $02, $01, dKickS3, $03, dSnareS3, $0F
	smpsStop

; FM3 Data
BrokenMoon_FM1:
	smpsSetvoice        $01
	dc.b	nC3, $06, nC4, $03, $03, nBb2, nBb2, nBb3, $06

BrokenMoon_Loop08:
	dc.b	nAb2, $09, nD3, $03, nEb3, nAb2, $06, nBb2, nF3, $03, $03, nBb2
	dc.b	nA3, nBb3, nBb2, nB2, nC3, $06, nBb2, $03, nC3, nEb3, nF3, nC3
	dc.b	nC4, $06, nBb3, nC4, $03, nEb3, nF3, nBb2, nA2, nAb2, $09, $03
	dc.b	nEb3, nAb3, nAb2, nBb2, $06, nBb3, $03, $03, nBb2, $06, nC3, $03
	dc.b	nD3, $06, nC3, $03, nC4, $06, nC3, $03, nG3, $06, nC3, $03
	dc.b	nBb3, $06, nC3, $03, nG3, nC3, nD3, nC3, nBb2, nA2, nAb2, $09
	dc.b	nD3, $03, nEb3, nAb2, $06, nBb2, nF3, $03, $03, nBb2, nA3, nBb3
	dc.b	nBb2, nB2, nC3, $06, nBb2, $03, nC3, nEb3, nF3, nC3, nC4, $06
	dc.b	nBb3, nC4, $03, nEb3, nF3, nBb2, nA2, nAb2, $09, $03, nEb3, nAb3
	dc.b	nAb2, nBb2, $06, nBb3, $03, $03, nBb2, $06, nC3, $03, nCs3, nD3
	dc.b	nC3, nC4, $06, nC3, $03, nG3, $06, nC3, $03, nBb3, $06, nC3
	dc.b	$03, nG3, nC3, nD3, nC3, nBb2, nA2
	smpsLoop            $00, $05, BrokenMoon_Loop08
	dc.b	nAb2, $09, nD3, $03, nEb3, nAb2, $06, nBb2, nF3, $03, $03, nBb2
	dc.b	nA3, nBb3, nBb2, nB2, nC3, $06, nBb2, $03, nC3, nEb3, nF3, nC3
	dc.b	nC4, $06, nBb3, nC4, $03, nEb3, nF3, nBb2, nA2, nAb2, $09, $03
	dc.b	nEb3, nAb3, nAb2, nBb2, $06, nBb3, $03, $03, nBb2, $06, nC3, $03
	dc.b	nD3, $06, nC3, $03, nC4, $06, nC3, $03, nG3, $06, nC3, $03
	dc.b	nBb3, $06, nC3, $03, nG3, nC3, nD3, nC3, nBb2, nA2, nAb2, $09
	dc.b	nD3, $03, nEb3, nAb2, $06, nBb2, nF3, $03, $03, nBb2, nA3, nBb3
	dc.b	nBb2, nB2, nC3, $06, nBb2, $03, nC3, nEb3, nF3, nC3, nC4, $06
	dc.b	nBb3, nC4, $03, nEb3, nF3, nBb2, nA2, nAb2, $09, $03, nEb3, nAb3
	dc.b	nAb2, nBb2, $06, nBb3, $03, $03, nBb2, $06, nC3, $03, nCs3, nD3
	dc.b	nC3, nC4, $06, nC3, $03, nG3, $06, nC3, $03, nBb3, $06, nC3
	dc.b	$03, nG3, nC3, nD3, nC3, nG3, $06, nRst, $0C
	smpsStop

; FM6 Data
BrokenMoon_FM2:
	smpsSetvoice        $00
	smpsModSet          $00, $01, $01, $04
	smpsPan             panCenter, $00
	dc.b	nG4, $06, nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C
	dc.b	nEb5, $06, nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5
	dc.b	$0C, nEb5, $06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6
	dc.b	$02, nD6, nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C
	dc.b	nG5, $06, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03
	dc.b	nEb5, nF5, nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02
	dc.b	nC5, $01, nEb5, $06, nF5, nG5, nF5, nBb4, $0C, nC5, $18, nG4
	dc.b	$06, nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C, nEb5
	dc.b	$06, nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5, $0C
	dc.b	nEb5, $06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6, $02
	dc.b	nD6, nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C, nG5
	dc.b	$06, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03, nEb5
	dc.b	nF5, nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02, nC5
	dc.b	$01, nEb5, $06, nF5, nG5, nF5, nBb5, $0C, nC6, $18, nG4, $06
	dc.b	nBb4, nC5, nF5, nBb5, nC6, nF5, $02, nG5, $04, nF5, $06, nG5
	dc.b	$09, nC5, $03, nEb5, $06, nF5, nD5, nEb5, nD5, $02, nEb5, nD5
	dc.b	nBb4, $06, nC5, $0C, nG4, $06, nBb4, nC5, nEb5, nF5, nEb5, nF5
	dc.b	$09, nC5, $03, nF5, nG5, nEb5, $06, nF5, $09, nEb5, $03, nF5
	dc.b	$06, nA5, $02, nBb5, $04, nG5, $0C, $06, nBb5, nC6, $0C, nBb5
	dc.b	$06, nC6, nG5, $12, nEb5, $06, nF5, nG5, nF5, $02, nG5, nF5
	dc.b	nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $03, nEb5, $06
	dc.b	nF5, nG5, nF5, nG5, $02, nAb5, nA5, nBb5, $06, nC6, $18, nG4
	dc.b	$06, nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C, nEb5
	dc.b	$06, nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5, $0C
	dc.b	nEb5, $06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6, $02
	dc.b	nD6, nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C, nG5
	dc.b	$06, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03, nEb5
	dc.b	nF5, nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02, nC5
	dc.b	$01, nEb5, $06, nF5, nG5, nF5, nBb4, $0C, nC5, $18, nG4, $06
	dc.b	nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C, nEb5, $06
	dc.b	nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5, $0C, nEb5
	dc.b	$06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6, $02, nD6
	dc.b	nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C, nG5, $06
	dc.b	nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03, nEb5, nF5
	dc.b	nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02, nC5, $01
	dc.b	nEb5, $06, nF5, nG5, nF5, nBb5, $0C, nC6, $18, nG4, $06, nBb4
	dc.b	nC5, nF5, nBb5, nC6, nF5, $02, nG5, $04, nF5, $06, nG5, $09
	dc.b	nC5, $03, nEb5, $06, nF5, nD5, nEb5, nD5, $02, nEb5, nD5, nBb4
	dc.b	$06, nC5, $0C, nG4, $06, nBb4, nC5, nEb5, nF5, nEb5, nF5, $09
	dc.b	nC5, $03, nF5, nG5, nEb5, $06, nF5, $09, nEb5, $03, nF5, $06
	dc.b	nA5, $02, nBb5, $04, nG5, $0C, $06, nBb5, nC6, $0C, nBb5, $06
	dc.b	nC6, nG5, $12, nEb5, $06, nF5, nG5, nF5, $02, nG5, nF5, nEb5
	dc.b	$06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $03, nEb5, $06, nF5
	dc.b	nG5, nF5, nG5, $02, nAb5, nA5, nBb5, $06, nC6, $26
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $07, nRst, $0C
	smpsStop

; FM5 Data
BrokenMoon_FM3:
	smpsSetvoice        $03
	smpsPan             panCenter, $00
	dc.b	nRst, $18

BrokenMoon_Loop06:
	dc.b	nAb3, $06, $06, $03, $06, $03, nRst, nBb3, $06, $03, $06, $06
	dc.b	nC4, nC4, nC4, $03, $06, $03, nRst, nC4, $06, $03, $06, nBb3
	smpsLoop            $00, $17, BrokenMoon_Loop06
	dc.b	nAb3, nAb3, nAb3, $03, $06, $03, nRst, nBb3, $06, $03, $06, $06
	dc.b	nC4, nC4, nC4, $03, $06, $03, nRst, nC4, $06, $03, $06, $06
	dc.b	nRst, $0C
	smpsSetvoice        $05
	smpsStop


; FM4 Data
BrokenMoon_FM4:
	smpsPan             panCenter, $00
	smpsSetvoice        $02
	dc.b	nG3, $0C

BrokenMoon_Loop07:
	dc.b	nC5, $06, nBb4, nEb3, $18, nF3, nG3, $24
	smpsLoop            $00, $17, BrokenMoon_Loop07
	dc.b	nC5, $06, nBb4, nEb3, $18, nF3, nG3, $30, nRst, $0C
	smpsSetvoice        $05
	smpsStop

; PSG3 Data
BrokenMoon_PSG3:
	smpsPSGform         $E7
	dc.b	nRst, $F, nMaxPSG, $03
	smpsPSGvoice        fTone_02

BrokenMoon_Loop09:
	dc.b	$03, $03
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	dc.b	$03
	smpsLoop            $00, $02, BrokenMoon_Loop09
	dc.b	$03
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02

BrokenMoon_Loop0A:
	dc.b	$03
	smpsLoop            $00, $08, BrokenMoon_Loop0A
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	dc.b	$03

BrokenMoon_Loop0B:
	dc.b	$03, $03
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	smpsLoop            $00, $02, BrokenMoon_Loop0B
	dc.b	$03, $03, $03, $03, $03

BrokenMoon_Loop0C:
	dc.b	$03
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	smpsLoop            $00, $02, BrokenMoon_Loop0C
	dc.b	$03

BrokenMoon_Loop0D:
	dc.b	$03, $03
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	smpsLoop            $00, $02, BrokenMoon_Loop0D
	smpsLoop            $01, $17, BrokenMoon_Loop0A

BrokenMoon_Loop0E:
	dc.b	$03
	smpsLoop            $00, $08, BrokenMoon_Loop0E
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	dc.b	$03

BrokenMoon_Loop0F:
	dc.b	$03, $03
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	smpsLoop            $00, $02, BrokenMoon_Loop0F
	dc.b	$03, $03, $03, $03, $03, $03
	smpsPSGvoice        fTone_01
	dc.b	$03
	smpsPSGvoice        fTone_02
	dc.b	$0F
	smpsStop

; PSG1 Data
BrokenMoon_PSG1:
	smpsPan             panCenter, $00
	smpsModSet          $00, $01, $01, $04
	dc.b	nG4, $06, nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C
	dc.b	nEb5, $06, nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5
	dc.b	$0C, nEb5, $06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6
	dc.b	$02, nD6, nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C
	dc.b	nG5, $06, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03
	dc.b	nEb5, nF5, nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02
	dc.b	nC5, $01, nEb5, $06, nF5, nG5, nF5, nBb4, $0C, nC5, $18, nG4
	dc.b	$06, nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C, nEb5
	dc.b	$06, nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5, $0C
	dc.b	nEb5, $06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6, $02
	dc.b	nD6, nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C, nG5
	dc.b	$06, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03, nEb5
	dc.b	nF5, nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02, nC5
	dc.b	$01, nEb5, $06, nF5, nG5, nF5, nBb5, $0C, nC6, $18, nG4, $06
	dc.b	nBb4, nC5, nF5, nBb5, nC6, nF5, $02, nG5, $04, nF5, $06, nG5
	dc.b	$09, nC5, $03, nEb5, $06, nF5, nD5, nEb5, nD5, $02, nEb5, nD5
	dc.b	nBb4, $06, nC5, $0C, nG4, $06, nBb4, nC5, nEb5, nF5, nEb5, nF5
	dc.b	$09, nC5, $03, nF5, nG5, nEb5, $06, nF5, $09, nEb5, $03, nF5
	dc.b	$06, nA5, $02, nBb5, $04, nG5, $0C, $06, nBb5, nC6, $0C, nBb5
	dc.b	$06, nC6, nG5, $12, nEb5, $06, nF5, nG5, nF5, $02, nG5, nF5
	dc.b	nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $03, nEb5, $06
	dc.b	nF5, nG5, nF5, nG5, $02, nAb5, nA5, nBb5, $06, nC6, $18, nG4
	dc.b	$06, nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C, nEb5
	dc.b	$06, nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5, $0C
	dc.b	nEb5, $06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6, $02
	dc.b	nD6, nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C, nG5
	dc.b	$06, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03, nEb5
	dc.b	nF5, nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02, nC5
	dc.b	$01, nEb5, $06, nF5, nG5, nF5, nBb4, $0C, nC5, $18, nG4, $06
	dc.b	nBb4, nC5, nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $0C, nEb5, $06
	dc.b	nC5, nBb4, nG4, nEb5, nF5, nC5, $0C, $06, nEb5, nF5, $0C, nEb5
	dc.b	$06, nF5, nG5, $0C, nBb5, $06, nC6, nEb6, nD6, nC6, $02, nD6
	dc.b	nC6, nBb5, $06, nC6, $0C, nBb5, $06, nG5, nF5, $0C, nG5, $06
	dc.b	nEb5, nF5, $0C, nEb5, $06, nF5, nG5, $09, nC5, $03, nEb5, nF5
	dc.b	nEb5, $06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $02, nC5, $01
	dc.b	nEb5, $06, nF5, nG5, nF5, nBb5, $0C, nC6, $18, nG4, $06, nBb4
	dc.b	nC5, nF5, nBb5, nC6, nF5, $02, nG5, $04, nF5, $06, nG5, $09
	dc.b	nC5, $03, nEb5, $06, nF5, nD5, nEb5, nD5, $02, nEb5, nD5, nBb4
	dc.b	$06, nC5, $0C, nG4, $06, nBb4, nC5, nEb5, nF5, nEb5, nF5, $09
	dc.b	nC5, $03, nF5, nG5, nEb5, $06, nF5, $09, nEb5, $03, nF5, $06
	dc.b	nA5, $02, nBb5, $04, nG5, $0C, $06, nBb5, nC6, $0C, nBb5, $06
	dc.b	nC6, nG5, $12, nEb5, $06, nF5, nG5, nF5, $02, nG5, nF5, nEb5
	dc.b	$06, nC5, $0C, $06, nBb4, nC5, $09, nBb4, $03, nEb5, $06, nF5
	dc.b	nG5, nF5, nG5, $02, nAb5, nA5, nBb5, $06, nC6, $26
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $07, nRst, $0C
	smpsStop
; PSG2 Data
BrokenMoon_PSG2:
	smpsPan             panCenter, $00
	smpsModSet          $00, $01, $01, $04
	smpsPan             panCenter, $00
	dc.b	nC4, $06, nD4, nEb4, nG4, nAb4, $0C, nG4, $06, nAb4, nBb4, $0C
	dc.b	nG4, $06, nEb4, nD4, nEb4, nG4, nAb4, nG4, $0C, nEb4, $06, nG4
	dc.b	nAb4, $0C, nG4, $06, nAb4, nBb4, $0C, nD5, $06, nEb5, nEb5, nD5
	dc.b	nC5, $02, nD5, nC5, nBb4, $06, nC5, $0C, nD5, $06, nBb4, nAb4
	dc.b	$0C, nBb4, $06, nG4, nBb4, $0C, nG4, $06, nBb4, nG4, $09, $03
	dc.b	$03, nAb4, nG4, $06, $0C, nEb4, $06, nF4, nEb4, $09, nC4, $02
	dc.b	nEb4, $01, nG4, $06, nAb4, nBb4, nAb4, nF4, $0C, nC4, $18, $06
	dc.b	nD4, nEb4, nG4, nAb4, $0C, nG4, $06, nAb4, nBb4, $0C, nG4, $06
	dc.b	nEb4, nD4, nEb4, nG4, nAb4, nG4, $0C, nEb4, $06, nG4, nAb4, $0C
	dc.b	nG4, $06, nAb4, nBb4, $0C, nD5, $06, nEb5, nEb5, nD5, nC5, $02
	dc.b	nD5, nC5, nBb4, $06, nC5, $0C, nD5, $06, nBb4, nAb4, $0C, nBb4
	dc.b	$06, nG4, nBb4, $0C, nG4, $06, nBb4, nG4, $09, $03, $03, nAb4
	dc.b	nG4, $06, $0C, nEb4, $06, nF4, nEb4, $09, nC4, $02, nEb4, $01
	dc.b	nG4, $06, nAb4, nBb4, nAb4, nBb4, $0C, nC5, $18, nC4, $06, nD4
	dc.b	nEb4, nF4, nD5, nEb5, nBb4, nAb4, nBb4, $09, nF4, $03, nG4, $06
	dc.b	nAb4, nG4, nG4, nG4, nF4, nEb4, $0C, nC4, $06, nD4, nEb4, nEb4
	dc.b	nF4, nG4, nAb4, $09, nF4, $03, nAb4, nBb4, nG4, $06, nAb4, $09
	dc.b	nG4, $03, nAb4, $06, nG4, nG4, $0C, nEb4, $06, nF4, nEb4, $0C
	dc.b	nF4, $06, nG4, nBb4, $12, nG4, $06, nAb4, nBb4, nAb4, nG4, nEb4
	dc.b	$0C, $06, $06, $09, nD4, $03, nEb4, $06, nF4, nG4, nAb4, nBb4
	dc.b	$0C, nC5, $18, nC4, $06, nD4, nEb4, nG4, nAb4, $0C, nG4, $06
	dc.b	nAb4, nBb4, $0C, nG4, $06, nEb4, nD4, nEb4, nG4, nAb4, nG4, $0C
	dc.b	nEb4, $06, nG4, nAb4, $0C, nG4, $06, nAb4, nBb4, $0C, nD5, $06
	dc.b	nEb5, nEb5, nD5, nC5, $02, nD5, nC5, nBb4, $06, nC5, $0C, nD5
	dc.b	$06, nBb4, nAb4, $0C, nBb4, $06, nG4, nBb4, $0C, nG4, $06, nBb4
	dc.b	nG4, $09, $03, $03, nAb4, nG4, $06, $0C, nEb4, $06, nF4, nEb4
	dc.b	$09, nC4, $02, nEb4, $01, nG4, $06, nAb4, nBb4, nAb4, nF4, $0C
	dc.b	nC4, $18, $06, nD4, nEb4, nG4, nAb4, $0C, nG4, $06, nAb4, nBb4
	dc.b	$0C, nG4, $06, nEb4, nD4, nEb4, nG4, nAb4, nG4, $0C, nEb4, $06
	dc.b	nG4, nAb4, $0C, nG4, $06, nAb4, nBb4, $0C, nD5, $06, nEb5, nEb5
	dc.b	nD5, nC5, $02, nD5, nC5, nBb4, $06, nC5, $0C, nD5, $06, nBb4
	dc.b	nAb4, $0C, nBb4, $06, nG4, nBb4, $0C, nG4, $06, nBb4, nG4, $09
	dc.b	$03, $03, nAb4, nG4, $06, $0C, nEb4, $06, nF4, nEb4, $09, nC4
	dc.b	$02, nEb4, $01, nG4, $06, nAb4, nBb4, nAb4, nBb4, $0C, nC5, $18
	dc.b	nC4, $06, nD4, nEb4, nF4, nD5, nEb5, nBb4, nAb4, nBb4, $09, nF4
	dc.b	$03, nG4, $06, nAb4, nG4, nG4, nG4, nF4, nEb4, $0C, nC4, $06
	dc.b	nD4, nEb4, nEb4, nF4, nG4, nAb4, $09, nF4, $03, nAb4, nBb4, nG4
	dc.b	$06, nAb4, $09, nG4, $03, nAb4, $06, nG4, nG4, $0C, nEb4, $06
	dc.b	nF4, nEb4, $0C, nF4, $06, nG4, nBb4, $12, nG4, $06, nAb4, nBb4
	dc.b	nAb4, nG4, nEb4, $0C, $06, $06, $09, nD4, $03, nEb4, $06, nF4
	dc.b	nG4, nAb4, nBb4, $0C, nC5, $26
	smpsPan             panCenter, $00
	dc.b	smpsNoAttack, $07, nRst, $0C
	smpsStop

BrokenMoon_Voices:
;	Voice $00
;	$3A
;	$01, $01, $01, $02, 	$8D, $07, $07, $52, 	$09, $00, $00, $03
;	$01, $02, $02, $00, 	$52, $02, $02, $28, 	$18, $22, $18, $00
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $02, $01, $01, $01
	smpsVcRateScale     $01, $00, $00, $02
	smpsVcAttackRate    $12, $07, $07, $0D
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $03, $00, $00, $09
	smpsVcDecayRate2    $00, $02, $02, $01
	smpsVcDecayLevel    $02, $00, $00, $05
	smpsVcReleaseRate   $08, $02, $02, $02
	smpsVcTotalLevel    $00, $18, $22, $18

;	Voice $01
;	$2A
;	$30, $70, $08, $01, 	$1F, $1F, $1F, $1F, 	$08, $10, $0E, $0C
;	$00, $03, $06, $05, 	$30, $20, $29, $28, 	$22, $14, $2A, $00
	smpsVcAlgorithm     $02
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $07, $03
	smpsVcCoarseFreq    $01, $08, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0C, $0E, $10, $08
	smpsVcDecayRate2    $05, $06, $03, $00
	smpsVcDecayLevel    $02, $02, $02, $03
	smpsVcReleaseRate   $08, $09, $00, $00
	smpsVcTotalLevel    $00, $2A, $14, $22

;	Voice $02
;	$3B
;	$51, $71, $61, $41, 	$51, $16, $18, $1A, 	$05, $01, $01, $00
;	$09, $01, $01, $01, 	$17, $97, $27, $47, 	$1C, $22, $15, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $04, $06, $07, $05
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $01
	smpsVcAttackRate    $1A, $18, $16, $11
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $01, $01, $05
	smpsVcDecayRate2    $01, $01, $01, $09
	smpsVcDecayLevel    $04, $02, $09, $01
	smpsVcReleaseRate   $07, $07, $07, $07
	smpsVcTotalLevel    $00, $15, $22, $1C

;	Voice $03
;	$3D
;	$01, $01, $01, $01, 	$94, $19, $19, $19, 	$0F, $0D, $0D, $0D
;	$07, $04, $04, $04, 	$25, $1A, $1A, $1A, 	$15, $00, $00, $00
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $01, $01
	smpsVcRateScale     $00, $00, $00, $02
	smpsVcAttackRate    $19, $19, $19, $14
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0D, $0D, $0D, $0F
	smpsVcDecayRate2    $04, $04, $04, $07
	smpsVcDecayLevel    $01, $01, $01, $02
	smpsVcReleaseRate   $0A, $0A, $0A, $05
	smpsVcTotalLevel    $00, $00, $00, $15

;	Voice $04
;	$1C
;	$21, $3D, $02, $00, 	$9C, $1C, $00, $9D, 	$02, $00, $1C, $1C
;	$00, $1D, $02, $00, 	$BC, $1C, $AC, $06, 	$00, $02, $2C, $06
	smpsVcAlgorithm     $04
	smpsVcFeedback      $03
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $03, $02
	smpsVcCoarseFreq    $00, $02, $0D, $01
	smpsVcRateScale     $02, $00, $00, $02
	smpsVcAttackRate    $1D, $00, $1C, $1C
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1C, $1C, $00, $02
	smpsVcDecayRate2    $00, $02, $1D, $00
	smpsVcDecayLevel    $00, $0A, $01, $0B
	smpsVcReleaseRate   $06, $0C, $0C, $0C
	smpsVcTotalLevel    $06, $2C, $02, $00

;	Voice $05
;	$3A
;	$71, $0C, $33, $01, 	$1C, $16, $1D, $1F, 	$04, $06, $04, $08
;	$00, $01, $03, $00, 	$16, $17, $16, $A6, 	$25, $2F, $25, $00
	smpsVcAlgorithm     $02
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $00, $07
	smpsVcCoarseFreq    $01, $03, $0C, $01
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1D, $16, $1C
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $04, $06, $04
	smpsVcDecayRate2    $00, $03, $01, $00
	smpsVcDecayLevel    $0A, $01, $01, $01
	smpsVcReleaseRate   $06, $06, $07, $06
	smpsVcTotalLevel    $00, $25, $2F, $25

