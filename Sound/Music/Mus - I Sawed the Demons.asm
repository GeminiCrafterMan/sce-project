SawedDemons_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     SawedDemons_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       SawedDemons_DAC,	$00, $F2
	smpsHeaderFM        SawedDemons_FM1,	$00, $00
	smpsHeaderFM        SawedDemons_FM2,	$00, $00
	smpsHeaderFM        SawedDemons_FM3,	$00, $00
	smpsHeaderFM        SawedDemons_FM4,	$00, $00
	smpsHeaderFM        SawedDemons_FM5,	$00, $00
	smpsHeaderFM        SawedDemons_FM6,	$00, $00
	smpsHeaderPSG       SawedDemons_PSG1,	$00, $00, $00, $00
	smpsHeaderPSG       SawedDemons_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       SawedDemons_PSG3,	$00, $00, $00, $00

; DAC Data
SawedDemons_DAC:
; PSG1 Data
SawedDemons_PSG1:
; PSG2 Data
SawedDemons_PSG2:
	smpsStop

; FM1 Data
SawedDemons_FM1:
	smpsSetvoice        $00
	smpsAlterVol        $13
	smpsPan             panCenter, $00

SawedDemons_Loop4B:
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $7F, $1D
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop4B
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $7F, $1D, nE3, $04, nRst, $01, nE3, $04, nRst
	dc.b	$02
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $23
	smpsSetvoice        $06
	smpsAlterVol        $F5
	dc.b	nE4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $05, nRst, $06
	smpsAlterNote       $08
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$04, smpsNoAttack, nA4, $0B, nG4, nE4, nG4, nE4, nD4, nE4
	smpsSetvoice        $07
	smpsAlterVol        $01
	smpsPan             panLeft, $00

SawedDemons_Loop4C:
	dc.b	nE3, nG3, nB3, nE3, nG3, nC4, nE3, nG3, nCs4, nE3, nG3, nC4
	dc.b	nE3, nG3, nB3, nG3, nE3, nG3, nB3, nE3, nG3, nC4, nE3, nG3
	dc.b	nCs4, nE3, nG3, nC4, $16, nG3, $0B, nA3, nG3
	smpsLoop            $00, $02, SawedDemons_Loop4C
	dc.b	nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3, nB3
	dc.b	nE3, nG3, nA3, nG3, nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3
	dc.b	nC4, nE3, nG3, nB3, $16, nG3, $0B, nFs3, nG3, nE3, nG3, nD4
	dc.b	nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3, nB3, nE3, nG3, nA3
	dc.b	nG3, nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3
	dc.b	nB3, smpsNoAttack, nBb3, nG3, nE3, nG3, nA3, nC4, nG4, nA3, nC4, nFs4
	dc.b	nA3, nC4, nF4, nA3, nC4, nE4, nA3, nC4, nD4, nC4, nA3, nC4
	dc.b	nG4, nA3, nC4, nFs4, nA3, nC4, nF4, nA3, nC4, nE4, $16, nC4
	dc.b	$0B, nB3, nC4, nE3, nG3, nB3, nE3, nG3, nC4, nE3, nG3, nCs4
	dc.b	nE3, nG3, nC4, nE3, nG3, nB3, nG3, nE3, nG3, nB3, nE3, nG3
	dc.b	nC4, nE3, nG3, nCs4, nE3, nG3, nC4, $16, nG3, $0B, nA3, nG3
	smpsSetvoice        $00
	smpsAlterVol        $FE
	smpsPan             panCenter, $00

SawedDemons_Loop4D:
	dc.b	nB2, $2C
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $05, nRst, $06
	smpsAlterVol        $0C
	dc.b	nB2, $05, nRst, $11
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop4D

SawedDemons_Loop4E:
	dc.b	nA2, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG2, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop4E
	dc.b	nA2, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nA2, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG2, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nG2, $0A, nRst, $01

SawedDemons_Loop4F:
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $7F, $1D
	smpsLoop            $00, $03, SawedDemons_Loop4F
	dc.b	nE3, $04, nRst, $01, nE3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $02
	smpsSetvoice        $06
	smpsAlterVol        $F5
	smpsAlterNote       $10
	dc.b	nF4, $01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$0D, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $17
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, nE4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $05, nRst
	dc.b	$06, nD5, $05, nB4, $06, nBb4, $05, nA4, $06, nG4, $05, nE4
	dc.b	$06, nD4, $05, nB3, $06, nA4, $05, nG4, $06, nE4, $05, nD4
	dc.b	$06, nB3, $05, nBb3, $06, nA3, $05, nG3, $06
	smpsSetvoice        $07
	smpsAlterVol        $01
	smpsPan             panLeft, $00

SawedDemons_Loop50:
	dc.b	nE3, $0B, nG3, nB3, nE3, nG3, nC4, nE3, nG3, nCs4, nE3, nG3
	dc.b	nC4, nE3, nG3, nB3, nG3, nE3, nG3, nB3, nE3, nG3, nC4, nE3
	dc.b	nG3, nCs4, nE3, nG3, nC4, $16, nG3, $0B, nA3, nG3
	smpsLoop            $00, $02, SawedDemons_Loop50
	dc.b	nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3, nB3
	dc.b	nE3, nG3, nA3, nG3, nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3
	dc.b	nC4, nE3, nG3, nB3, $16, nG3, $0B, nFs3, nG3, nE3, nG3, nD4
	dc.b	nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3, nB3, nE3, nG3, nA3
	dc.b	nG3, nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3
	dc.b	nB3, smpsNoAttack, nBb3, nG3, nE3, nG3, nA3, nC4, nG4, nA3, nC4, nFs4
	dc.b	nA3, nC4, nF4, nA3, nC4, nE4, nA3, nC4, nD4, nC4, nA3, nC4
	dc.b	nG4, nA3, nC4, nFs4, nA3, nC4, nF4, nA3, nC4, nE4, $16, nC4
	dc.b	$0B, nB3, nC4, nE3, nG3, nB3, nE3, nG3, nC4, nE3, nG3, nCs4
	dc.b	nE3, nG3, nC4, nE3, nG3, nB3, nG3, nE3, nG3, nB3, nE3, nG3
	dc.b	nC4, nE3, nG3, nCs4, nE3, nG3, nC4, $16, nG3, $0B, nA3, nG3
	smpsSetvoice        $00
	smpsAlterVol        $FE
	smpsPan             panCenter, $00

SawedDemons_Loop51:
	dc.b	nB2, $2C
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $05, nRst, $06
	smpsAlterVol        $0C
	dc.b	nB2, $05, nRst, $11
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop51

SawedDemons_Loop52:
	dc.b	nA2, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG2, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop52
	dc.b	nA2, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nA2, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG2, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nG2, $0A, nRst, $01

SawedDemons_Loop53:
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $7F, $1D
	smpsLoop            $00, $03, SawedDemons_Loop53
	dc.b	nE3, $04, nRst, $01, nE3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $04, nRst, $02
	smpsSetvoice        $06
	smpsAlterVol        $F5
	smpsAlterNote       $10
	dc.b	nF4, $01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$0D, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $17
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, nE4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $05, nRst
	dc.b	$06, nE5, $05, nD5, $06

SawedDemons_Loop54:
	dc.b	nB4, $05, nBb4, $06, nA4, $05, nG4, $06, nE4, $05, nD4, $06
	smpsLoop            $00, $02, SawedDemons_Loop54
	dc.b	nB3, $05, nG3, $06
	smpsSetvoice        $07
	smpsAlterVol        $01
	smpsPan             panLeft, $00

SawedDemons_Loop55:
	dc.b	nE3, $0B, nG3, nB3, nE3, nG3, nC4, nE3, nG3, nCs4, nE3, nG3
	dc.b	nC4, nE3, nG3, nB3, nG3, nE3, nG3, nB3, nE3, nG3, nC4, nE3
	dc.b	nG3, nCs4, nE3, nG3, nC4, $16, nG3, $0B, nA3, nG3
	smpsLoop            $00, $02, SawedDemons_Loop55
	dc.b	nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3, nB3
	dc.b	nE3, nG3, nA3, nG3, nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3
	dc.b	nC4, nE3, nG3, nB3, $16, nG3, $0B, nFs3, nG3, nE3, nG3, nD4
	dc.b	nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3, nB3, nE3, nG3, nA3
	dc.b	nG3, nE3, nG3, nD4, nE3, nG3, nCs4, nE3, nG3, nC4, nE3, nG3
	dc.b	nB3, smpsNoAttack, nBb3, nG3, nE3, nG3, nA3, nC4, nG4, nA3, nC4, nFs4
	dc.b	nA3, nC4, nF4, nA3, nC4, nE4, nA3, nC4, nD4, nC4, nA3, nC4
	dc.b	nG4, nA3, nC4, nFs4, nA3, nC4, nF4, nA3, nC4, nE4, $16, nC4
	dc.b	$0B, nB3, nC4, nE3, nG3, nB3, nE3, nG3, nC4, nE3, nG3, nCs4
	dc.b	nE3, nG3, nC4, nE3, nG3, nB3, nG3, nE3, nG3, nB3, nE3, nG3
	dc.b	nC4, nE3, nG3, nCs4, nE3, nG3, nC4, $16, nG3, $0B, nA3, nG3
	smpsSetvoice        $00
	smpsAlterVol        $FE
	smpsPan             panCenter, $00

SawedDemons_Loop56:
	dc.b	nB2, $2C
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $05, nRst, $06
	smpsAlterVol        $0C
	dc.b	nB2, $05, nRst, $11
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop56

SawedDemons_Loop57:
	dc.b	nA2, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG2, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop57
	dc.b	nA2, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nA2, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG2, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nG2, $0A, nRst, $01
	smpsStop

; FM2 Data
SawedDemons_FM2:
	smpsSetvoice        $00
	smpsAlterVol        $13
	smpsPan             panCenter, $00

SawedDemons_Loop42:
	dc.b	nB3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nB3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nB3, $04, nRst, $7F, $1D
	smpsAlterVol        $F4
	smpsLoop            $00, $04, SawedDemons_Loop42

SawedDemons_Loop47:
	smpsPan             panRight, $00

SawedDemons_Loop43:
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nB3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nC4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nCs4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nC4, $16, nG3, $05, nRst, $06, nA3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop43
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nD4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nA3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nD4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nCs4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nC4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nB3, $16, nG3, $05, nRst, $06, nFs3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nD4, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nG3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nD4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nCs4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nB3, $0B, smpsNoAttack, nBb3, nG3, $05, nRst, $06, nE3, $05
	dc.b	nRst, $06, nG3, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nG4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nFs4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nF4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nE4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nD4, $05, nRst, $06, nC4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nG4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nFs4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nF4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nE4, $16, nC4, $05, nRst, $06
	dc.b	nB3, $05, nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nB3, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nCs4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nB3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $16, nG3, $05
	dc.b	nRst, $06, nA3, $05, nRst, $06, nG3, $05, nRst, $06
	smpsPan             panCenter, $00

SawedDemons_Loop44:
	dc.b	nFs3, $2C
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $05, nRst, $06
	smpsAlterVol        $0C
	dc.b	nFs3, $05, nRst, $11
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop44

SawedDemons_Loop45:
	dc.b	nE3, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nD3, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop45
	dc.b	nE3, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nD3, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nD3, $0A, nRst, $01

SawedDemons_Loop46:
	smpsAlterVol        $F4
	dc.b	nB3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nB3, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB3, $04, nRst, $01
	smpsAlterVol        $0C
	dc.b	nB3, $04, nRst, $7F, $1D
	smpsLoop            $00, $04, SawedDemons_Loop46
	smpsAlterVol        $F4
	smpsLoop            $01, $02, SawedDemons_Loop47
	smpsPan             panRight, $00

SawedDemons_Loop48:
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nB3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nC4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nCs4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nC4, $16, nG3, $05, nRst, $06, nA3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop48
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nD4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nA3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nD4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nCs4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nC4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nB3, $16, nG3, $05, nRst, $06, nFs3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nD4, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05
	dc.b	nRst, $06, nE3, $05, nRst, $06, nG3, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nG3, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nD4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nCs4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06, nG3, $05
	dc.b	nRst, $06, nB3, $0B, smpsNoAttack, nBb3, nG3, $05, nRst, $06, nE3, $05
	dc.b	nRst, $06, nG3, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nG4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nFs4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nF4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nE4, $05, nRst, $06, nA3, $05, nRst, $06, nC4, $05
	dc.b	nRst, $06, nD4, $05, nRst, $06, nC4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nG4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nFs4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nF4, $05, nRst, $06, nA3, $05
	dc.b	nRst, $06, nC4, $05, nRst, $06, nE4, $16, nC4, $05, nRst, $06
	dc.b	nB3, $05, nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nB3, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nCs4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nC4, $05, nRst, $06, nE3, $05, nRst, $06
	dc.b	nG3, $05, nRst, $06, nB3, $05, nRst, $06, nG3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nB3, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nCs4, $05, nRst, $06
	dc.b	nE3, $05, nRst, $06, nG3, $05, nRst, $06, nC4, $16, nG3, $05
	dc.b	nRst, $06, nA3, $05, nRst, $06, nG3, $05, nRst, $06
	smpsPan             panCenter, $00

SawedDemons_Loop49:
	dc.b	nFs3, $2C
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $05, nRst, $06
	smpsAlterVol        $0C
	dc.b	nFs3, $05, nRst, $11
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop49

SawedDemons_Loop4A:
	dc.b	nE3, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nD3, $16
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $0A, nRst, $01
	smpsAlterVol        $F4
	smpsLoop            $00, $02, SawedDemons_Loop4A
	dc.b	nE3, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $0A, nRst, $01
	smpsAlterVol        $F4
	dc.b	nD3, $0A, nRst, $01
	smpsAlterVol        $0C
	dc.b	nD3, $0A, nRst, $01
	smpsStop

; FM3 Data
SawedDemons_FM3:
	smpsPan             panCenter, $00
	dc.b	nRst

SawedDemons_Loop33:
	dc.b	$7F
	smpsLoop            $00, $1E, SawedDemons_Loop33
	dc.b	$54
	smpsSetvoice        $08
	smpsAlterVol        $14
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop34:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop34
	dc.b	nE4, $05, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $16, nG4, $0B
	dc.b	nE4, $08, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$06, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$14
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop35:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop35
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nRst, $0E
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $10
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07, nG4, $0B, nA4, nG4, nE4, $16
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop36:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop36
	dc.b	nE4, $05, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $16, nG4, $05
	dc.b	nRst, $06, nA4, $0B, nG4, nE4, $16
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop37:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop37
	dc.b	nA4, $05, nRst, $06
	smpsAlterNote       $1C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nBb4, smpsNoAttack, nA4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$04, nG4, $05, nE4, $06, nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05
	smpsSetvoice        $08
	dc.b	nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nB3, $06, nD4, $05, nB3, $06, nA3, $05, nG3, $06
	dc.b	nA3, $05, nG3, $06, nRst, $16
	smpsAlterNote       $0C
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00
	dc.b	nA3, $05, nRst, $06, nG3, $05, nRst, $06, nA3, $05, nRst, $06
	smpsAlterNote       $10
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $03
	smpsAlterNote       $00
	dc.b	nD4, $05, nRst, $06
	smpsAlterNote       $F0
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, nRst, $03
	smpsAlterNote       $00
	dc.b	nG3, $05, nRst, $06
	smpsAlterNote       $10
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nD4, $0B
	smpsAlterNote       $F0
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nG3, $0B, nA3, nG3, nE3, $16
	smpsSetvoice        $08
	dc.b	nG4, $0B, nE4, nFs4
	smpsSetvoice        $06
	dc.b	nD4
	smpsSetvoice        $08
	dc.b	nE4
	smpsSetvoice        $06
	dc.b	nD4, nB3, nBb3, nA3, nG3, $08, nRst, $03
	smpsAlterNote       $10
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02, nRst, $06, nA3, $0B, nG3, nD3, nE3, nRst
	smpsSetvoice        $08
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$0C, nD5, $0B, nB4, $08, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$06, nG4, $0B
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nD5, $0B
	smpsAlterNote       $EC
	dc.b	nB4, $01, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nG4, $0B, nA4, $05, nG4, $06, nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nB3, $06
	smpsSetvoice        $08
	dc.b	nE5, $03, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF5, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs5, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF5, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nE5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nD5, $05, nB4, $06, nD5, $05, nB4, $06, nBb4, $05, nA4
	dc.b	$06, nBb4, $03, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$08, nG4, $06, nA4, $05, nG4, $06, nE4, $05, nG4, $06, nFs4
	dc.b	$03, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nG4, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $17
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nE4, nFs4, $06, nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06, nC4, $01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	nCs4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nD4, $03, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nC4, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nB3, nC4, $06, nB3, $05, nA3, $06, nB3, $05, nA3, $06
	dc.b	nRst, $16
	smpsSetvoice        $08
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $05, nRst, $11
	dc.b	nG4, $05, nRst, $06
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nE4, $05, nRst, $11
	dc.b	nG4, $0B, nE4, nG4, $05, nRst, $11
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $05, nRst, $11
	dc.b	nG4, $05, nRst, $06
	smpsAlterNote       $20
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nA4, $04, nG4, $05, nE4, $06, nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05
	smpsSetvoice        $08
	dc.b	nE4, $06, nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nB3, $06, nBb3, $05, nA3, $06, nG3, $05, nD3, $06
	dc.b	nE3, $10, nRst, $06
	smpsSetvoice        $08
	dc.b	nG4, $05, nRst, $06, nFs4, $05, nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nRst, $06
	smpsSetvoice        $08
	dc.b	nE4, $05, nRst, $11, nG4, $05, nRst, $06, nFs4, $05, nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nRst, $06
	smpsSetvoice        $08
	dc.b	nE4, $05, nRst, $06, nFs4, $05, nRst, $11, nE4, $05, nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $08, nRst, $19
	smpsSetvoice        $08
	dc.b	nFs4, $05

SawedDemons_Loop38:
	dc.b	nRst, $06, nG4, $05, nRst, $06, nFs4, $05, nRst, $06, nE4, $05
	smpsLoop            $00, $02, SawedDemons_Loop38
	dc.b	nRst, $06, nA4, $05

SawedDemons_Loop39:
	dc.b	nRst, $06, nG4, $05, nRst, $06, nFs4, $05
	smpsLoop            $00, $02, SawedDemons_Loop39
	dc.b	nRst, $06, nE4, $05, nRst, $06, nFs4, $05, nRst, $06, nE4, $05
	dc.b	nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nRst, $06
	smpsSetvoice        $08
	dc.b	nE4, $05, nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $0B, nB3, $05, nRst, $06, nD4, $0B, nB3, nBb3, nA3, nG3
	dc.b	nA3, nG3, nE3, nG3, nE3, nD3, nE3, nRst

SawedDemons_Loop3A:
	dc.b	$7F
	smpsLoop            $00, $07, SawedDemons_Loop3A
	dc.b	$0D
	smpsSetvoice        $08
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop3B:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop3B
	dc.b	nE4, $05, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $16, nG4, $0B
	dc.b	nE4, $08, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$06, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$14
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop3C:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop3C
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nRst, $0E
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $10
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$07, nG4, $0B, nA4, nG4, nE4, $16
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop3D:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop3D
	dc.b	nE4, $05, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $16, nG4, $05
	dc.b	nRst, $06, nA4, $0B, nG4, nE4, $16
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00

SawedDemons_Loop3E:
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop3E
	dc.b	nA4, $05, nRst, $06
	smpsAlterNote       $1C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nBb4, smpsNoAttack, nA4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$04, nG4, $05, nE4, $06, nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05
	smpsSetvoice        $08
	dc.b	nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nB3, $06, nD4, $05, nB3, $06, nA3, $05, nG3, $06
	dc.b	nA3, $05, nG3, $06, nRst, $16
	smpsAlterNote       $0C
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00
	dc.b	nA3, $05, nRst, $06, nG3, $05, nRst, $06, nA3, $05, nRst, $06
	smpsAlterNote       $10
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $03
	smpsAlterNote       $00
	dc.b	nD4, $05, nRst, $06
	smpsAlterNote       $F0
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, nRst, $03
	smpsAlterNote       $00
	dc.b	nG3, $05, nRst, $06
	smpsAlterNote       $10
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nD4, $0B
	smpsAlterNote       $F0
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nG3, $0B, nA3, nG3, nE3, $16
	smpsSetvoice        $08
	dc.b	nG4, $0B, nE4, nFs4
	smpsSetvoice        $06
	dc.b	nD4
	smpsSetvoice        $08
	dc.b	nE4
	smpsSetvoice        $06
	dc.b	nD4, nB3, nBb3, nA3, nG3, $08, nRst, $03
	smpsAlterNote       $10
	dc.b	nA3, $01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02, nRst, $06, nA3, $0B, nG3, nD3, nE3, nRst
	smpsSetvoice        $08
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$0C, nD5, $0B, nB4, $08, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$06, nG4, $0B
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nD5, $0B
	smpsAlterNote       $EC
	dc.b	nB4, $01, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nG4, $0B, nA4, $05, nG4, $06, nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nB3, $06
	smpsSetvoice        $08
	dc.b	nE5, $03, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nF5, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nFs5, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nF5, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nE5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, nD5, $05, nB4, $06, nD5, $05, nB4, $06, nBb4, $05, nA4
	dc.b	$06, nBb4, $03, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$08, nG4, $06, nA4, $05, nG4, $06, nE4, $05, nG4, $06, nFs4
	dc.b	$03, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nG4, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $17
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nE4, nFs4, $06, nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06, nC4, $01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	nCs4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nD4, $03, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nC4, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nB3, nC4, $06, nB3, $05, nA3, $06, nB3, $05, nA3, $06
	dc.b	nRst, $16
	smpsSetvoice        $08
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $05, nRst, $11
	dc.b	nG4, $05, nRst, $06
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nE4, $05, nRst, $11
	dc.b	nG4, $0B, nE4, nG4, $05, nRst, $11
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, nRst, $06
	smpsAlterNote       $14
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	nB4, nRst, $06
	smpsAlterNote       $00
	dc.b	nA4, $05, nRst, $06, nG4, $05, nRst, $06, nA4, $05, nRst, $11
	dc.b	nG4, $05, nRst, $06
	smpsAlterNote       $20
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $20
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nA4, $04, nG4, $05, nE4, $06, nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05
	smpsSetvoice        $08
	dc.b	nE4, $06, nG4, $05, nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nB3, $06, nBb3, $05, nA3, $06, nG3, $05, nD3, $06
	dc.b	nE3, $10, nRst, $06
	smpsSetvoice        $08
	dc.b	nG4, $05, nRst, $06, nFs4, $05, nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nRst, $06
	smpsSetvoice        $08
	dc.b	nE4, $05, nRst, $11, nG4, $05, nRst, $06, nFs4, $05, nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nRst, $06
	smpsSetvoice        $08
	dc.b	nE4, $05, nRst, $06, nFs4, $05, nRst, $11, nE4, $05, nRst, $06
	smpsSetvoice        $06
	dc.b	nD4, $08, nRst, $19
	smpsSetvoice        $08
	dc.b	nFs4, $05

SawedDemons_Loop3F:
	dc.b	nRst, $06, nG4, $05, nRst, $06, nFs4, $05, nRst, $06, nE4, $05
	smpsLoop            $00, $02, SawedDemons_Loop3F
	dc.b	nRst, $06, nA4, $05

SawedDemons_Loop40:
	dc.b	nRst, $06, nG4, $05, nRst, $06, nFs4, $05
	smpsLoop            $00, $02, SawedDemons_Loop40
	dc.b	nRst, $06, nE4, $05, nRst, $06, nFs4, $05, nRst, $06, nE4, $05
	dc.b	nRst, $06, nG4, $05, nE4, $06, nG4, $05, nA4, $06, nBb4, $05
	dc.b	nA4, $06, nG4, $05, nE4, $06
	smpsSetvoice        $06

SawedDemons_Loop41:
	dc.b	nD4, $05
	smpsSetvoice        $08
	dc.b	nE4, $06
	smpsSetvoice        $06
	dc.b	nD4, $05, nB3, $06
	smpsLoop            $00, $02, SawedDemons_Loop41
	smpsSetvoice        $08
	dc.b	nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nE4, $05, nFs4, $06, nG4, $05, nFs4, $06, nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nE4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06, nB3, $05, nBb3, $06, nA3, $05, nG3, $06, nE3, $05
	dc.b	nD3, $06, nRst, $7F, $31
	smpsStop

; FM4 Data
SawedDemons_FM4:
	smpsPan             panCenter, $00
	dc.b	nRst

SawedDemons_Loop2B:
	dc.b	$7F
	smpsLoop            $00, $37, SawedDemons_Loop2B
	dc.b	$4D
	smpsSetvoice        $08
	smpsAlterVol        $16
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02

SawedDemons_Loop2C:
	dc.b	nRst, $06, nCs5, $05, nRst, $06, nB4, $05
	smpsLoop            $00, $02, SawedDemons_Loop2C
	dc.b	nRst, $06, nG4, $05, nRst, $06
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02, nRst, $06, nCs5, $05, nRst, $06, nB4, $05, nRst, $06, nCs5
	dc.b	$16, nB4, $0B, nRst, $2C
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02

SawedDemons_Loop2D:
	dc.b	nRst, $06, nCs5, $05, nRst, $06, nB4, $05
	smpsLoop            $00, $02, SawedDemons_Loop2D
	dc.b	nRst, $06
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$05, nRst, $0E

SawedDemons_Loop2E:
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop2E
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$08, smpsNoAttack
	smpsAlterNote       $09
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$0A, nB4, $0B, nCs5, nB4, nG4, $16
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02

SawedDemons_Loop2F:
	dc.b	nRst, $06, nCs5, $05, nRst, $06, nB4, $05
	smpsLoop            $00, $02, SawedDemons_Loop2F
	dc.b	nRst, $06, nG4, $05, nRst, $06
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02, nRst, $06, nCs5, $05, nRst, $06, nB4, $05, nRst, $06, nCs5
	dc.b	$16, nB4, $05, nRst, $06, nCs5, $0B, nB4, nG4, $16
	smpsAlterNote       $0C
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$02

SawedDemons_Loop30:
	dc.b	nRst, $06, nCs5, $05, nRst, $06, nB4, $05
	smpsLoop            $00, $02, SawedDemons_Loop30
	dc.b	nRst, $06, nCs5, $05, nRst, $06
	smpsAlterNote       $10
	dc.b	nCs5, $01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	nD5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, smpsNoAttack, nCs5, $06, nB4, $05, nG4, $06, nB4, $05, nG4, $06
	dc.b	nFs4, $05, nG4, $06, nFs4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nFs4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06, nCs4, $05, nB3, $06, nCs4, $05, nB3, $06, nRst, $7F
	dc.b	$7F, $7F, $7F, $7F, $5B
	smpsSetvoice        $08
	dc.b	nC5, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, nRst, $06, nC5, $05, nRst, $06, nB4, $05, nRst, $06, nC5
	dc.b	$05, nRst, $11, nB4, $05, nRst, $06, nC5, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, nRst, $06, nC5, $05, nRst, $06, nB4, $05, nRst, $06, nG4
	dc.b	$05, nRst, $11, nB4, $0B, nG4, nB4, $05, nRst, $11

SawedDemons_Loop31:
	dc.b	nC5, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, nRst, $06
	smpsLoop            $00, $02, SawedDemons_Loop31
	dc.b	nC5, $05, nRst, $06, nB4, $05, nRst, $06, nC5, $05, nRst, $11
	dc.b	nB4, $05, nRst, $06, nC5, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nCs5, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$03, smpsNoAttack, nC5, $06, nB4, $05

SawedDemons_Loop32:
	dc.b	nG4, $06, nB4, $05, nG4, $06, nFs4, $05
	smpsLoop            $00, $02, SawedDemons_Loop32
	smpsSetvoice        $06
	dc.b	nD4, $06, $05, nC4, $06, nB3, $05, nFs3, $06, nRst, $58
	smpsSetvoice        $08
	dc.b	nA4, $05, nRst, $06, nFs4, $05, nRst, $06, nG4, $05, nRst, $06
	dc.b	nA4, $05, nRst, $11, nG4, $05, nRst, $06, nFs4, $08, nRst, $7F
	dc.b	$3F, nB4, $05, nG4, $06, nB4, $05, nCs5, $06, nD5, $05, nCs5
	dc.b	$06, nB4, $05, nG4, $06, nFs4, $05, nG4, $06, nFs4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06
	smpsSetvoice        $08
	dc.b	nFs4, $05, nG4, $06, nFs4, $05
	smpsSetvoice        $06
	dc.b	nD4, $06, nRst, $7F, $7F, $0A
	smpsStop

; FM5 Data
SawedDemons_FM5:
	smpsSetvoice        $01
	smpsAlterVol        $0A
	smpsPan             panCenter, $00

SawedDemons_Loop22:
	dc.b	nE2, $05, nRst, $06, nE2, $05, nRst, $7F, $21
	smpsLoop            $00, $02, SawedDemons_Loop22
	dc.b	nE2, $05, nRst, $06, nE2, $05, nRst, $48
	smpsSetvoice        $03
	smpsAlterVol        $02

SawedDemons_Loop23:
	dc.b	nAb0, $01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	smpsLoop            $00, $03, SawedDemons_Loop23
	dc.b	nAb0, $01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $01
	smpsAlterVol        $FE
	smpsAlterNote       $00
	dc.b	nE2, $05, nRst, $06, nE2, $05, nRst, $48
	smpsSetvoice        $02
	smpsAlterVol        $0F

SawedDemons_Loop24:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsAlterVol        $FE
	smpsLoop            $00, $02, SawedDemons_Loop24
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsAlterVol        $FF

SawedDemons_Loop25:
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsAlterVol        $FE
	smpsLoop            $00, $04, SawedDemons_Loop25
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsSetvoice        $01
	smpsAlterVol        $FE
	smpsAlterNote       $00
	dc.b	$08

SawedDemons_Loop26:
	dc.b	nRst, $03, nE2, $08
	smpsLoop            $00, $7F, SawedDemons_Loop26

SawedDemons_Loop27:
	dc.b	nRst, $03, nA2, $08
	smpsLoop            $00, $20, SawedDemons_Loop27

SawedDemons_Loop28:
	dc.b	nRst, $03, nE2, $08
	smpsLoop            $00, $20, SawedDemons_Loop28

SawedDemons_Loop29:
	dc.b	nRst, $03, nB2, $08
	smpsLoop            $00, $10, SawedDemons_Loop29
	dc.b	nRst, $03

SawedDemons_Loop2A:
	dc.b	nA2, $16, nRst, $0B, nG2, $16, nRst, $0B
	smpsLoop            $00, $02, SawedDemons_Loop2A
	dc.b	nA2, nRst, nG2, nRst
	smpsLoop            $01, $03, SawedDemons_Loop22
	smpsStop

; FM6 Data
SawedDemons_FM6:
	smpsSetvoice        $02
	smpsAlterVol        $0C
	smpsPan             panCenter, $00

SawedDemons_Loop00:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop00
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop01:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop01
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsSetvoice        $04
	smpsAlterNote       $E7
	dc.b	nFs3, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsAlterNote       $E7
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC3, $02
	smpsAlterNote       $E7
	dc.b	nFs3, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsSetvoice        $05
	smpsPan             panRight, $00
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsAlterNote       $F8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE4

SawedDemons_Loop02:
	smpsAlterNote       $F8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsLoop            $00, $02, SawedDemons_Loop02
	dc.b	smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE4
	smpsSetvoice        $03
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $07
	smpsAlterNote       $00
	dc.b	nAb0, $01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $1D
	smpsSetvoice        $02

SawedDemons_Loop03:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop03
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop04:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop04
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $05

SawedDemons_Loop06:
	smpsPan             panRight, $00
	smpsAlterNote       $F8
	dc.b	nB4, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs4, $02
	smpsPan             panLeft, $00
	smpsAlterNote       $08
	dc.b	nD4, $01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nC4, $02, smpsNoAttack

SawedDemons_Loop05:
	smpsAlterNote       $F8
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3
	smpsLoop            $00, $02, SawedDemons_Loop05
	dc.b	smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3
	smpsLoop            $01, $02, SawedDemons_Loop06
	smpsSetvoice        $02
	smpsPan             panCenter, $00

SawedDemons_Loop07:
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop07
	dc.b	smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb0, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE0, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $03

SawedDemons_Loop08:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop08
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop09:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop09
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02

SawedDemons_Loop0A:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsLoop            $00, $02, SawedDemons_Loop0A
	dc.b	smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsSetvoice        $05
	smpsPan             panRight, $00
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsAlterNote       $F8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE4
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsSetvoice        $05
	smpsAlterNote       $E7
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC4, $02
	smpsAlterNote       $E7
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC4, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB3, $01
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsSetvoice        $05
	smpsPan             panRight, $00
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsAlterNote       $F8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE4
	smpsPan             panCenter, $00
	smpsAlterNote       $E7
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC4, $02
	smpsAlterNote       $E7
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC4, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB3, $01
	smpsPan             panLeft, $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3

SawedDemons_Loop1B:
	smpsSetvoice        $02
	smpsPan             panCenter, $00

SawedDemons_Loop0B:
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop0B
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop0C:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop0C
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $05
	smpsAlterVol        $0D

SawedDemons_Loop0D:
	smpsAlterNote       $F8
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2
	smpsAlterVol        $FE
	smpsLoop            $00, $02, SawedDemons_Loop0D
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2
	smpsAlterVol        $FF

SawedDemons_Loop0E:
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2
	smpsAlterVol        $FE
	smpsLoop            $00, $04, SawedDemons_Loop0E
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2

SawedDemons_Loop0F:
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $07
	smpsAlterNote       $00
	dc.b	nAb0, $01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $07
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1
	smpsLoop            $00, $1A, SawedDemons_Loop0F

SawedDemons_Loop10:
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $05, SawedDemons_Loop10
	dc.b	smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1

SawedDemons_Loop11:
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop11
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop12:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop12
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsSetvoice        $05
	smpsPan             panRight, $00
	smpsAlterNote       $F8
	dc.b	nB4, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE4
	smpsSetvoice        $04
	smpsPan             panCenter, $00
	smpsAlterNote       $E7
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC3, $02
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4, $01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs4, $02
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsSetvoice        $05
	smpsPan             panLeft, $00
	smpsAlterNote       $08
	dc.b	nD4, $01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nC4, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3
	smpsSetvoice        $04
	smpsPan             panCenter, $00
	smpsAlterNote       $E7
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC3, $02
	smpsSetvoice        $05
	smpsPan             panLeft, $00
	smpsAlterNote       $F8
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3
	smpsSetvoice        $03
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $07
	smpsAlterNote       $00
	dc.b	nAb0, $01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $1D
	smpsSetvoice        $02

SawedDemons_Loop13:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop13
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop14:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop14
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $05

SawedDemons_Loop16:
	smpsPan             panRight, $00
	smpsAlterNote       $F8
	dc.b	nB4, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs4, $02
	smpsPan             panLeft, $00
	smpsAlterNote       $08
	dc.b	nD4, $01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	nC4, $02, smpsNoAttack

SawedDemons_Loop15:
	smpsAlterNote       $F8
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3
	smpsLoop            $00, $02, SawedDemons_Loop15
	dc.b	smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3
	smpsLoop            $01, $02, SawedDemons_Loop16
	smpsSetvoice        $02
	smpsPan             panCenter, $00

SawedDemons_Loop17:
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop17
	dc.b	smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb0, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE0, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $03

SawedDemons_Loop18:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop18
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop19:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop19
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02

SawedDemons_Loop1A:
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsLoop            $00, $02, SawedDemons_Loop1A
	dc.b	smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsSetvoice        $05
	smpsPan             panLeft, $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsSetvoice        $05
	smpsPan             panRight, $00
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsAlterNote       $F8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE4
	smpsSetvoice        $02
	smpsPan             panCenter, $00
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01
	smpsSetvoice        $05
	smpsPan             panLeft, $00
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3
	smpsPan             panCenter, $00
	smpsAlterNote       $E7
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC4, $02
	smpsAlterNote       $E7
	dc.b	nFs4, $01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nD4, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nC4, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB3, $01
	smpsPan             panRight, $00
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4
	smpsAlterNote       $F8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE4
	smpsLoop            $02, $02, SawedDemons_Loop1B
	smpsSetvoice        $02
	smpsPan             panCenter, $00

SawedDemons_Loop1C:
	smpsAlterNote       $E9
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $02, SawedDemons_Loop1C
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0

SawedDemons_Loop1D:
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsAlterNote       $00
	dc.b	nAb0, $01
	smpsLoop            $00, $02, SawedDemons_Loop1D
	dc.b	smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $05
	smpsAlterVol        $0D

SawedDemons_Loop1E:
	smpsAlterNote       $F8
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2
	smpsAlterVol        $FE
	smpsLoop            $00, $02, SawedDemons_Loop1E
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2
	smpsAlterVol        $FF

SawedDemons_Loop1F:
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2
	smpsAlterVol        $FE
	smpsLoop            $00, $04, SawedDemons_Loop1F
	smpsAlterNote       $F8
	dc.b	nB3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb3, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2

SawedDemons_Loop20:
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $07
	smpsAlterNote       $00
	dc.b	nAb0, $01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $07
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1
	smpsLoop            $00, $1A, SawedDemons_Loop20

SawedDemons_Loop21:
	smpsSetvoice        $03
	smpsAlterNote       $00
	dc.b	nAb0, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $01
	dc.b	nCs0, $12
	smpsSetvoice        $02
	smpsAlterNote       $E9
	dc.b	nG3, $01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $14
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE2
	smpsLoop            $00, $05, SawedDemons_Loop21
	dc.b	smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb1, smpsNoAttack
	smpsAlterNote       $DC
	dc.b	nA1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $E9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $04
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1
	smpsStop

; PSG3 Data
SawedDemons_PSG3:
	dc.b	nRst, $16
	smpsPSGAlterVol     $03
	smpsPSGform         $E7

SawedDemons_Loop58:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F5
	smpsLoop            $00, $02, SawedDemons_Loop58
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $2B
	smpsPSGAlterVol     $F2

SawedDemons_Loop59:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop59
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC

SawedDemons_Loop5A:
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop5A
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01, nRst, $2C
	smpsPSGAlterVol     $FF
	smpsLoop            $01, $02, SawedDemons_Loop58

SawedDemons_Loop5B:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F5
	smpsLoop            $00, $02, SawedDemons_Loop5B
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9

SawedDemons_Loop72:
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $6D

SawedDemons_Loop5C:
	smpsPSGAlterVol     $F5
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsLoop            $00, $02, SawedDemons_Loop5C
	smpsPSGAlterVol     $F5
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $57

SawedDemons_Loop5F:
	smpsPSGAlterVol     $F4

SawedDemons_Loop5D:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop5D
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $FD

SawedDemons_Loop5E:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsPSGAlterVol     $F7
	smpsLoop            $00, $0E, SawedDemons_Loop5E
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsLoop            $01, $04, SawedDemons_Loop5F
	smpsPSGAlterVol     $F4

SawedDemons_Loop60:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop60
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $FD

SawedDemons_Loop62:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01

SawedDemons_Loop61:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $09, SawedDemons_Loop61
	dc.b	nRst, $03
	smpsPSGAlterVol     $F7
	smpsLoop            $01, $0E, SawedDemons_Loop62
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01

SawedDemons_Loop63:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $09, SawedDemons_Loop63
	dc.b	nRst, $03
	smpsPSGAlterVol     $F4

SawedDemons_Loop64:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop64
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $FD

SawedDemons_Loop65:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsPSGAlterVol     $F7
	smpsLoop            $00, $0E, SawedDemons_Loop65
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsPSGAlterVol     $F4

SawedDemons_Loop66:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop66
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FC
	dc.b	$07

SawedDemons_Loop67:
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$08
	smpsLoop            $00, $06, SawedDemons_Loop67
	dc.b	nRst, $54
	smpsPSGAlterVol     $F4

SawedDemons_Loop68:
	smpsAlterNote       $FA
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop68

SawedDemons_Loop6B:
	smpsAlterNote       $FA
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$02
	smpsPSGAlterVol     $F8

SawedDemons_Loop69:
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop69
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $F8

SawedDemons_Loop6A:
	smpsAlterNote       $FA
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop6A
	smpsLoop            $01, $02, SawedDemons_Loop6B
	smpsAlterNote       $FA
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$02
	smpsPSGAlterVol     $FA

SawedDemons_Loop6C:
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop6C
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FC
	dc.b	$07
	smpsPSGAlterVol     $FD
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7

SawedDemons_Loop6D:
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F5
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsLoop            $00, $02, SawedDemons_Loop6D

SawedDemons_Loop71:
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $2B
	smpsPSGAlterVol     $F2

SawedDemons_Loop6E:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop6E
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01
	smpsPSGAlterVol     $FC

SawedDemons_Loop6F:
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop6F
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$01, nRst, $2C
	smpsPSGAlterVol     $FF

SawedDemons_Loop70:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F5
	smpsLoop            $00, $02, SawedDemons_Loop70
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsLoop            $01, $02, SawedDemons_Loop71
	smpsLoop            $02, $02, SawedDemons_Loop72
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $6D

SawedDemons_Loop73:
	smpsPSGAlterVol     $F5
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsLoop            $00, $02, SawedDemons_Loop73
	smpsPSGAlterVol     $F5
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F9
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$03
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$02
	smpsPSGAlterVol     $F7
	smpsAlterNote       $01
	dc.b	$01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $57

SawedDemons_Loop76:
	smpsPSGAlterVol     $F4

SawedDemons_Loop74:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop74
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $FD

SawedDemons_Loop75:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsPSGAlterVol     $F7
	smpsLoop            $00, $0E, SawedDemons_Loop75
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsLoop            $01, $04, SawedDemons_Loop76
	smpsPSGAlterVol     $F4

SawedDemons_Loop77:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop77
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $FD

SawedDemons_Loop79:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01

SawedDemons_Loop78:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $09, SawedDemons_Loop78
	dc.b	nRst, $03
	smpsPSGAlterVol     $F7
	smpsLoop            $01, $0E, SawedDemons_Loop79
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01

SawedDemons_Loop7A:
	smpsPSGAlterVol     $01
	smpsAlterNote       $01
	dc.b	$02
	smpsLoop            $00, $09, SawedDemons_Loop7A
	dc.b	nRst, $03
	smpsPSGAlterVol     $F4

SawedDemons_Loop7B:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop7B
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $FD

SawedDemons_Loop7C:
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsPSGAlterVol     $F7
	smpsLoop            $00, $0E, SawedDemons_Loop7C
	smpsAlterNote       $01
	dc.b	nMaxPSG, $01
	smpsPSGAlterVol     $04
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $03
	smpsAlterNote       $01
	dc.b	nMaxPSG
	smpsPSGAlterVol     $02
	smpsAlterNote       $01
	dc.b	$04, nRst, $0F
	smpsPSGAlterVol     $F4

SawedDemons_Loop7D:
	smpsAlterNote       $FC
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop7D
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $FE
	smpsAlterNote       $FC
	dc.b	$07

SawedDemons_Loop7E:
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$08
	smpsLoop            $00, $06, SawedDemons_Loop7E
	dc.b	nRst, $54
	smpsPSGAlterVol     $F4

SawedDemons_Loop7F:
	smpsAlterNote       $FA
	dc.b	nAb5, $02
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop7F

SawedDemons_Loop82:
	smpsAlterNote       $FA
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$02
	smpsPSGAlterVol     $F8

SawedDemons_Loop80:
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop80
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$05
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsPSGAlterVol     $F8

SawedDemons_Loop81:
	smpsAlterNote       $FA
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop81
	smpsLoop            $01, $02, SawedDemons_Loop82
	smpsAlterNote       $FA
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FA
	dc.b	$02
	smpsPSGAlterVol     $FA

SawedDemons_Loop83:
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsLoop            $00, $03, SawedDemons_Loop83
	smpsAlterNote       $FC
	dc.b	$04
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	nAb5
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$06
	smpsPSGAlterVol     $01
	smpsAlterNote       $FC
	dc.b	$02
	smpsStop

SawedDemons_Voices:
;	Voice $00
;	$38
;	$63, $31, $31, $31, 	$10, $13, $1A, $1B, 	$0E, $01, $01, $08
;	$00, $01, $01, $06, 	$33, $15, $13, $4B, 	$1A, $19, $1A, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $03, $06
	smpsVcCoarseFreq    $01, $01, $01, $03
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1B, $1A, $13, $10
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $01, $01, $0E
	smpsVcDecayRate2    $06, $01, $01, $00
	smpsVcDecayLevel    $04, $01, $01, $03
	smpsVcReleaseRate   $0B, $03, $05, $03
	smpsVcTotalLevel    $00, $1A, $19, $1A

;	Voice $01
;	$13
;	$57, $2A, $70, $11, 	$1F, $1F, $1D, $1F, 	$1A, $13, $00, $0B
;	$00, $04, $04, $0C, 	$17, $37, $49, $09, 	$20, $2C, $23, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $02
	smpsVcUnusedBits    $00
	smpsVcDetune        $01, $07, $02, $05
	smpsVcCoarseFreq    $01, $00, $0A, $07
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1D, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0B, $00, $13, $1A
	smpsVcDecayRate2    $0C, $04, $04, $00
	smpsVcDecayLevel    $00, $04, $03, $01
	smpsVcReleaseRate   $09, $09, $07, $07
	smpsVcTotalLevel    $00, $23, $2C, $20

;	Voice $02
;	$3C
;	$7F, $70, $70, $71, 	$1F, $5F, $1F, $1F, 	$00, $0F, $17, $0F
;	$00, $0E, $0F, $0F, 	$06, $2F, $C6, $0F, 	$07, $00, $00, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $07, $07
	smpsVcCoarseFreq    $01, $00, $00, $0F
	smpsVcRateScale     $00, $00, $01, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0F, $17, $0F, $00
	smpsVcDecayRate2    $0F, $0F, $0E, $00
	smpsVcDecayLevel    $00, $0C, $02, $00
	smpsVcReleaseRate   $0F, $06, $0F, $06
	smpsVcTotalLevel    $00, $00, $00, $07

;	Voice $03
;	$35
;	$78, $7A, $74, $74, 	$1F, $1F, $1F, $1F, 	$1B, $1B, $10, $10
;	$00, $00, $00, $00, 	$F0, $F8, $F8, $F8, 	$14, $00, $00, $00
	smpsVcAlgorithm     $05
	smpsVcFeedback      $06
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $07, $07
	smpsVcCoarseFreq    $04, $04, $0A, $08
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $10, $10, $1B, $1B
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $0F, $0F, $0F, $0F
	smpsVcReleaseRate   $08, $08, $08, $00
	smpsVcTotalLevel    $00, $00, $00, $14

;	Voice $04
;	$3C
;	$7F, $70, $72, $71, 	$1F, $5F, $1F, $9F, 	$00, $10, $1F, $0F
;	$00, $0F, $0F, $0F, 	$06, $3F, $F6, $7F, 	$07, $02, $09, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $07, $07
	smpsVcCoarseFreq    $01, $02, $00, $0F
	smpsVcRateScale     $02, $00, $01, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0F, $1F, $10, $00
	smpsVcDecayRate2    $0F, $0F, $0F, $00
	smpsVcDecayLevel    $07, $0F, $03, $00
	smpsVcReleaseRate   $0F, $06, $0F, $06
	smpsVcTotalLevel    $00, $09, $02, $07

;	Voice $05
;	$3B
;	$7F, $01, $70, $70, 	$1F, $5F, $1F, $1F, 	$04, $15, $1A, $00
;	$00, $04, $00, $0C, 	$01, $61, $DF, $0F, 	$00, $18, $00, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $00, $07
	smpsVcCoarseFreq    $00, $00, $01, $0F
	smpsVcRateScale     $00, $00, $01, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $1A, $15, $04
	smpsVcDecayRate2    $0C, $00, $04, $00
	smpsVcDecayLevel    $00, $0D, $06, $00
	smpsVcReleaseRate   $0F, $0F, $01, $01
	smpsVcTotalLevel    $00, $00, $18, $00

;	Voice $06
;	$38
;	$01, $03, $01, $01, 	$DF, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$04, $00, $08, $00, 	$03, $08, $05, $09, 	$14, $17, $1B, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $03, $01
	smpsVcRateScale     $00, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $00, $08, $00, $04
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $09, $05, $08, $03
	smpsVcTotalLevel    $00, $1B, $17, $14

;	Voice $07
;	$38
;	$01, $03, $01, $01, 	$DF, $1F, $1F, $DF, 	$00, $00, $00, $00
;	$04, $04, $0E, $04, 	$0F, $0F, $0F, $0F, 	$14, $1B, $1B, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $03, $01
	smpsVcRateScale     $03, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $04, $0E, $04, $04
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $1B, $1B, $14

;	Voice $08
;	$38
;	$01, $03, $01, $01, 	$DF, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$04, $00, $08, $00, 	$03, $08, $05, $09, 	$14, $1B, $1B, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $01, $01, $03, $01
	smpsVcRateScale     $00, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $00
	smpsVcDecayRate2    $00, $08, $00, $04
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $09, $05, $08, $03
	smpsVcTotalLevel    $00, $1B, $1B, $14

