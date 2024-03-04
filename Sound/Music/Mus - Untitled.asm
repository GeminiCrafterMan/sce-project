Untitled_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     Untitled_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       Untitled_DAC,	$00, $F2
	smpsHeaderFM        Untitled_FM1,	$00, $00
	smpsHeaderFM        Untitled_FM2,	$00, $00
	smpsHeaderFM        Untitled_FM3,	$00, $00
	smpsHeaderFM        Untitled_FM4,	$00, $00
	smpsHeaderFM        Untitled_FM5,	$00, $00
	smpsHeaderFM        Untitled_FM6,	$00, $00
	smpsHeaderPSG       Untitled_PSG1,	$00, $00, $00, $00
	smpsHeaderPSG       Untitled_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       Untitled_PSG3,	$00, $00, $00, $00

; DAC Data
Untitled_DAC:
; PSG1 Data
Untitled_PSG1:
; PSG2 Data
Untitled_PSG2:
; PSG3 Data
Untitled_PSG3:
	smpsStop

; FM1 Data
Untitled_FM1:
	smpsSetvoice        $00
	smpsAlterVol        $13
	smpsPan             panCenter, $00
	dc.b	nE2, $16, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsSetvoice        $07
	smpsAlterVol        $FA

Untitled_Loop53:
	dc.b	nE4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop53
	smpsSetvoice        $00
	smpsAlterVol        $FA
	dc.b	nE2, $21, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsSetvoice        $07
	smpsAlterVol        $FA

Untitled_Loop54:
	dc.b	nE4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop54

Untitled_Loop56:
	smpsSetvoice        $00
	smpsAlterVol        $FA
	dc.b	nA2, $21, nE3, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nF3
	smpsAlterVol        $0C
	dc.b	nF3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nC3, nD3
	smpsAlterVol        $0C
	dc.b	nD3
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nE3, nF3
	smpsAlterVol        $0C
	dc.b	nF3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsSetvoice        $07
	smpsAlterVol        $FA

Untitled_Loop55:
	dc.b	nA4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop55
	smpsLoop            $01, $02, Untitled_Loop56

Untitled_Loop58:
	smpsSetvoice        $00
	smpsAlterVol        $FA
	dc.b	nE2, $21, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsSetvoice        $07
	smpsAlterVol        $FA

Untitled_Loop57:
	dc.b	nE4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop57
	smpsLoop            $01, $02, Untitled_Loop58
	smpsSetvoice        $00
	smpsAlterVol        $FA
	dc.b	nB2, $21, nFs3, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nG3
	smpsAlterVol        $0C
	dc.b	nG3
	smpsAlterVol        $F4
	dc.b	nE3, nFs3
	smpsAlterVol        $0C
	dc.b	nFs3
	smpsAlterVol        $F4
	dc.b	nD3
	smpsAlterVol        $0C
	dc.b	nD3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nCs3, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nE3, nF3
	smpsAlterVol        $0C
	dc.b	nF3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsSetvoice        $07
	smpsAlterVol        $FA

Untitled_Loop59:
	dc.b	nA4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop59
	smpsSetvoice        $00
	smpsAlterVol        $FA
	dc.b	nE2, $21, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, nRst, $06
	smpsSetvoice        $07
	smpsAlterVol        $06
	smpsAlterNote       $00

Untitled_Loop5A:
	dc.b	nE4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop5A
	smpsSetvoice        $0A
	smpsAlterVol        $FA
	dc.b	nE1, $1F, nRst, $02, nB1, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nA1, $09, nRst, $02, nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02, nA1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nA1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nFs1, $09, nRst, $02, nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nA1, $09, nRst, $02, nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsSetvoice        $0B
	smpsAlterVol        $FA
	smpsLoop            $01, $02, Untitled_Loop5A

Untitled_Loop5B:
	dc.b	nE4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop5B

Untitled_Loop5D:
	smpsSetvoice        $0A
	smpsAlterVol        $FA
	dc.b	nA1, $1F, nRst, $02, nE2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE2, $09, nRst, $02, nF2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nF2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nD2, $09, nRst, $02, nE2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nC2, $09, nRst, $02, nD2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nD2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE2, $09, nRst, $02, nF2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nF2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nD2, $09, nRst, $02, nE2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsSetvoice        $0B
	smpsAlterVol        $FA

Untitled_Loop5C:
	dc.b	nA4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop5C
	smpsLoop            $01, $02, Untitled_Loop5D

Untitled_Loop5F:
	smpsSetvoice        $0A
	smpsAlterVol        $FA
	dc.b	nE1, $1F, nRst, $02, nB1, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nA1, $09, nRst, $02, nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02, nA1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nA1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nFs1, $09, nRst, $02, nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nA1, $09, nRst, $02, nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsSetvoice        $0B
	smpsAlterVol        $FA

Untitled_Loop5E:
	dc.b	nE4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop5E
	smpsLoop            $01, $02, Untitled_Loop5F
	smpsSetvoice        $0A
	smpsAlterVol        $FA
	dc.b	nB1, $1F, nRst, $02, nFs2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nFs2, $09, nRst, $02, nG2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE2, $09, nRst, $02, nFs2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nFs2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nD2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nD2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nD2, $09, nRst, $02, nE2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nCs2, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nE2, $09, nRst, $02, nF2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nF2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nD2, $09, nRst, $02, nE2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nE2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsSetvoice        $0B
	smpsAlterVol        $FA

Untitled_Loop60:
	dc.b	nA4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop60
	smpsSetvoice        $0A
	smpsAlterVol        $FA
	dc.b	nE1, $1F, nRst, $02, nB1, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $04, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nA1, $09, nRst, $02, nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02, nA1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nA1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nFs1, $09, nRst, $02, nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nB1, $09, nRst, $02, nC2, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nC2, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nA1, $09, nRst, $02, nB1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nB1, $09, nRst, $02
	smpsAlterVol        $F4
	dc.b	nG1, $09, nRst, $02
	smpsAlterVol        $0C
	dc.b	nG1, $09, nRst, $02
	smpsSetvoice        $0B
	smpsAlterVol        $FA

Untitled_Loop61:
	dc.b	nE4, $05, nRst, $06
	smpsLoop            $00, $04, Untitled_Loop61
	smpsStop

; FM2 Data
Untitled_FM2:
	smpsSetvoice        $01
	smpsAlterVol        $19
	smpsPan             panCenter, $00
	dc.b	nE2, $16, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsSetvoice        $07
	smpsAlterVol        $F4

Untitled_Loop47:
	dc.b	nG4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop47
	smpsSetvoice        $01
	dc.b	nE2, $21, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsSetvoice        $07
	smpsAlterVol        $F4

Untitled_Loop48:
	dc.b	nG4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop48

Untitled_Loop4A:
	smpsSetvoice        $01
	dc.b	nA2, $21, nE3, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nF3
	smpsAlterVol        $0C
	dc.b	nF3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nC3, nD3
	smpsAlterVol        $0C
	dc.b	nD3
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nE3, nF3
	smpsAlterVol        $0C
	dc.b	nF3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsSetvoice        $07
	smpsAlterVol        $F4

Untitled_Loop49:
	dc.b	nC5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop49
	smpsLoop            $01, $02, Untitled_Loop4A

Untitled_Loop4C:
	smpsSetvoice        $01
	dc.b	nE2, $21, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsSetvoice        $07
	smpsAlterVol        $F4

Untitled_Loop4B:
	dc.b	nG4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop4B
	smpsLoop            $01, $02, Untitled_Loop4C
	smpsSetvoice        $01
	dc.b	nB2, $21, nFs3, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nG3
	smpsAlterVol        $0C
	dc.b	nG3
	smpsAlterVol        $F4
	dc.b	nE3, nFs3
	smpsAlterVol        $0C
	dc.b	nFs3
	smpsAlterVol        $F4
	dc.b	nD3
	smpsAlterVol        $0C
	dc.b	nD3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nCs3, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nE3, nF3
	smpsAlterVol        $0C
	dc.b	nF3
	smpsAlterVol        $F4
	dc.b	nD3, nE3
	smpsAlterVol        $0C
	dc.b	nE3
	smpsAlterVol        $F4
	dc.b	nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsSetvoice        $07
	smpsAlterVol        $F4

Untitled_Loop4D:
	dc.b	nC5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop4D
	smpsSetvoice        $01
	dc.b	nE2, $21, nB2, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nG2, nA2
	smpsAlterVol        $0C
	dc.b	nA2
	smpsAlterVol        $F4
	dc.b	nFs2, nG2
	smpsAlterVol        $0C
	dc.b	nG2
	smpsAlterVol        $F4
	dc.b	nB2
	smpsAlterVol        $0C
	dc.b	nB2
	smpsAlterVol        $F4
	dc.b	nB2, nC3
	smpsAlterVol        $0C
	dc.b	nC3
	smpsAlterVol        $F4
	dc.b	nA2, nB2, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nBb2, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA2, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, nRst, $06
	smpsSetvoice        $07
	smpsAlterNote       $00

Untitled_Loop4E:
	dc.b	nG4, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop4E
	smpsSetvoice        $0B

Untitled_Loop4F:
	dc.b	nE4, $21, nB4, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nA4, nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	nG4, nA4
	smpsAlterVol        $0C
	dc.b	nA4
	smpsAlterVol        $F4
	dc.b	nFs4, nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nB4, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nA4, nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	$05, nRst, $06, nG4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, Untitled_Loop4F

Untitled_Loop50:
	dc.b	nA4, $21, nE5, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nF5
	smpsAlterVol        $0C
	dc.b	nF5
	smpsAlterVol        $F4
	dc.b	nD5, nE5
	smpsAlterVol        $0C
	dc.b	nE5
	smpsAlterVol        $F4
	dc.b	nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nC5, nD5
	smpsAlterVol        $0C
	dc.b	nD5
	smpsAlterVol        $F4
	dc.b	nB4, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nE5
	smpsAlterVol        $0C
	dc.b	nE5
	smpsAlterVol        $F4
	dc.b	nE5, nF5
	smpsAlterVol        $0C
	dc.b	nF5
	smpsAlterVol        $F4
	dc.b	nD5, nE5
	smpsAlterVol        $0C
	dc.b	nE5
	smpsAlterVol        $F4
	dc.b	nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	$05, nRst, $06, nC5, $05, nRst, $06, nC5, $05, nRst, $06
	smpsLoop            $00, $02, Untitled_Loop50

Untitled_Loop51:
	dc.b	nE4, $21, nB4, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nA4, nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	nG4, nA4
	smpsAlterVol        $0C
	dc.b	nA4
	smpsAlterVol        $F4
	dc.b	nFs4, nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nB4, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nA4, nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	$05, nRst, $06, nG4, $05, nRst, $06, nG4, $05, nRst, $06
	smpsLoop            $00, $02, Untitled_Loop51
	dc.b	nB4, $21, nFs5, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nG5
	smpsAlterVol        $0C
	dc.b	nG5
	smpsAlterVol        $F4
	dc.b	nE5, nFs5
	smpsAlterVol        $0C
	dc.b	nFs5
	smpsAlterVol        $F4
	dc.b	nD5
	smpsAlterVol        $0C
	dc.b	nD5
	smpsAlterVol        $F4
	dc.b	nD5, nE5
	smpsAlterVol        $0C
	dc.b	nE5
	smpsAlterVol        $F4
	dc.b	nCs5, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nE5
	smpsAlterVol        $0C
	dc.b	nE5
	smpsAlterVol        $F4
	dc.b	nE5, nF5
	smpsAlterVol        $0C
	dc.b	nF5
	smpsAlterVol        $F4
	dc.b	nD5, nE5
	smpsAlterVol        $0C
	dc.b	nE5
	smpsAlterVol        $F4
	dc.b	nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	$05, nRst, $06, nC5, $05, nRst, $06, nC5, $05, nRst, $06, nE4
	dc.b	$21, nB4, $10
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $06
	smpsAlterVol        $F4
	dc.b	$0B, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nA4, nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	nG4, nA4
	smpsAlterVol        $0C
	dc.b	nA4
	smpsAlterVol        $F4
	dc.b	nFs4, nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nB4, nC5
	smpsAlterVol        $0C
	dc.b	nC5
	smpsAlterVol        $F4
	dc.b	nA4, nB4
	smpsAlterVol        $0C
	dc.b	nB4
	smpsAlterVol        $F4
	dc.b	nG4
	smpsAlterVol        $0C
	dc.b	nG4
	smpsAlterVol        $F4
	dc.b	$05

Untitled_Loop52:
	dc.b	nRst, $06, nG4, $05
	smpsLoop            $00, $03, Untitled_Loop52
	dc.b	nRst, $06
	smpsStop

; FM3 Data
Untitled_FM3:
	smpsSetvoice        $02
	smpsAlterVol        $1D
	smpsPan             panCenter, $00

Untitled_Loop2B:
	dc.b	nE1, $05, nRst, $06
	smpsLoop            $00, $1C, Untitled_Loop2B
	smpsSetvoice        $07
	smpsAlterVol        $FC

Untitled_Loop2C:
	dc.b	nD5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop2C
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE1, $10

Untitled_Loop2D:
	dc.b	nRst, $06, nE1, $05
	smpsLoop            $00, $1B, Untitled_Loop2D
	dc.b	nRst, $06
	smpsSetvoice        $07
	smpsAlterVol        $FC

Untitled_Loop2E:
	dc.b	nD5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop2E

Untitled_Loop31:
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nA1, $10

Untitled_Loop2F:
	dc.b	nRst, $06, nA1, $05
	smpsLoop            $00, $1B, Untitled_Loop2F
	dc.b	nRst, $06
	smpsSetvoice        $07
	smpsAlterVol        $FC

Untitled_Loop30:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop30
	smpsLoop            $01, $02, Untitled_Loop31

Untitled_Loop34:
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE1, $10

Untitled_Loop32:
	dc.b	nRst, $06, nE1, $05
	smpsLoop            $00, $1B, Untitled_Loop32
	dc.b	nRst, $06
	smpsSetvoice        $07
	smpsAlterVol        $FC

Untitled_Loop33:
	dc.b	nD5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop33
	smpsLoop            $01, $02, Untitled_Loop34
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nB1, $10

Untitled_Loop35:
	dc.b	nRst, $06, nB1, $05
	smpsLoop            $00, $0F, Untitled_Loop35

Untitled_Loop36:
	dc.b	nRst, $06, nA1, $05
	smpsLoop            $00, $0C, Untitled_Loop36
	dc.b	nRst, $06
	smpsSetvoice        $07
	smpsAlterVol        $FC

Untitled_Loop37:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop37
	smpsSetvoice        $02
	smpsAlterVol        $04
	dc.b	nE1, $10

Untitled_Loop38:
	dc.b	nRst, $06, nE1, $05
	smpsLoop            $00, $17, Untitled_Loop38
	dc.b	nRst, $06
	smpsSetvoice        $07
	smpsAlterVol        $FC
	dc.b	nB4, $0B, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, nRst, $06
	smpsAlterNote       $00

Untitled_Loop39:
	dc.b	nD5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop39
	smpsSetvoice        $0C
	smpsAlterVol        $04
	dc.b	nE2, $10

Untitled_Loop3A:
	dc.b	nRst, $06, nE2, $05
	smpsLoop            $00, $1B, Untitled_Loop3A
	dc.b	nRst, $06
	smpsSetvoice        $0B
	smpsAlterVol        $FC
	smpsLoop            $01, $02, Untitled_Loop39

Untitled_Loop3B:
	dc.b	nD5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop3B

Untitled_Loop3E:
	smpsSetvoice        $0C
	smpsAlterVol        $04
	dc.b	nA2, $10

Untitled_Loop3C:
	dc.b	nRst, $06, nA2, $05
	smpsLoop            $00, $1B, Untitled_Loop3C
	dc.b	nRst, $06
	smpsSetvoice        $0B
	smpsAlterVol        $FC

Untitled_Loop3D:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop3D
	smpsLoop            $01, $02, Untitled_Loop3E

Untitled_Loop41:
	smpsSetvoice        $0C
	smpsAlterVol        $04
	dc.b	nE2, $10

Untitled_Loop3F:
	dc.b	nRst, $06, nE2, $05
	smpsLoop            $00, $1B, Untitled_Loop3F
	dc.b	nRst, $06
	smpsSetvoice        $0B
	smpsAlterVol        $FC

Untitled_Loop40:
	dc.b	nD5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop40
	smpsLoop            $01, $02, Untitled_Loop41
	smpsSetvoice        $0C
	smpsAlterVol        $04
	dc.b	nB2, $10

Untitled_Loop42:
	dc.b	nRst, $06, nB2, $05
	smpsLoop            $00, $0F, Untitled_Loop42

Untitled_Loop43:
	dc.b	nRst, $06, nA2, $05
	smpsLoop            $00, $0C, Untitled_Loop43
	dc.b	nRst, $06
	smpsSetvoice        $0B
	smpsAlterVol        $FC

Untitled_Loop44:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop44
	smpsSetvoice        $0C
	smpsAlterVol        $04
	dc.b	nE2, $10

Untitled_Loop45:
	dc.b	nRst, $06, nE2, $05
	smpsLoop            $00, $1B, Untitled_Loop45
	dc.b	nRst, $06
	smpsSetvoice        $0B
	smpsAlterVol        $FC

Untitled_Loop46:
	dc.b	nD5, $05, nRst, $06
	smpsLoop            $00, $04, Untitled_Loop46
	smpsStop

; FM4 Data
Untitled_FM4:
	smpsSetvoice        $01
	smpsAlterVol        $19
	smpsPan             panCenter, $00

Untitled_Loop19:
	dc.b	nE1, $05, nRst, $06
	smpsLoop            $00, $1C, Untitled_Loop19
	smpsSetvoice        $07

Untitled_Loop1A:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop1A
	smpsSetvoice        $01
	dc.b	nE1, $10

Untitled_Loop1B:
	dc.b	nRst, $06, nE1, $05
	smpsLoop            $00, $1B, Untitled_Loop1B
	dc.b	nRst, $06
	smpsSetvoice        $07

Untitled_Loop1C:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop1C

Untitled_Loop1F:
	smpsSetvoice        $01
	dc.b	nA1, $10

Untitled_Loop1D:
	dc.b	nRst, $06, nA1, $05
	smpsLoop            $00, $1B, Untitled_Loop1D
	dc.b	nRst, $06
	smpsSetvoice        $07

Untitled_Loop1E:
	dc.b	nC6, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop1E
	smpsLoop            $01, $02, Untitled_Loop1F

Untitled_Loop22:
	smpsSetvoice        $01
	dc.b	nE1, $10

Untitled_Loop20:
	dc.b	nRst, $06, nE1, $05
	smpsLoop            $00, $1B, Untitled_Loop20
	dc.b	nRst, $06
	smpsSetvoice        $07

Untitled_Loop21:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop21
	smpsLoop            $01, $02, Untitled_Loop22
	smpsSetvoice        $01
	dc.b	nB1, $10

Untitled_Loop23:
	dc.b	nRst, $06, nB1, $05
	smpsLoop            $00, $0F, Untitled_Loop23

Untitled_Loop24:
	dc.b	nRst, $06, nA1, $05
	smpsLoop            $00, $0C, Untitled_Loop24
	dc.b	nRst, $06
	smpsSetvoice        $07

Untitled_Loop25:
	dc.b	nC6, $05, nRst, $06
	smpsLoop            $00, $03, Untitled_Loop25
	smpsSetvoice        $01
	dc.b	nE1, $10

Untitled_Loop26:
	dc.b	nRst, $06, nE1, $05
	smpsLoop            $00, $17, Untitled_Loop26
	dc.b	nRst, $06
	smpsSetvoice        $07
	smpsAlterNote       $0C
	dc.b	nA4, $01, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	nB4, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$03, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nBb4, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $E4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $20
	dc.b	nA4, smpsNoAttack
	smpsAlterNote       $1C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $18
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $14
	dc.b	$01, nRst, $06
	smpsAlterNote       $00
	dc.b	nG5, $05, nRst, $06, nG5, $05, nRst, $06, nG5, $05, nRst, $7F
	dc.b	$7F, $47
	smpsSetvoice        $0B

Untitled_Loop27:
	dc.b	nG5, $05, nRst, $06, nG5, $05, nRst, $06, nG5, $05, nRst, $7F
	dc.b	$7F, $47
	smpsLoop            $00, $02, Untitled_Loop27

Untitled_Loop28:
	dc.b	nC6, $05, nRst, $06, nC6, $05, nRst, $06, nC6, $05, nRst, $7F
	dc.b	$7F, $47
	smpsLoop            $00, $02, Untitled_Loop28

Untitled_Loop29:
	dc.b	nG5, $05, nRst, $06, nG5, $05, nRst, $06, nG5, $05, nRst, $7F
	dc.b	$7F, $47
	smpsLoop            $00, $02, Untitled_Loop29
	dc.b	nC6, $05, nRst, $06, nC6, $05, nRst, $06, nC6, $05, nRst, $7F
	dc.b	$7F, $47

Untitled_Loop2A:
	dc.b	nG5, $05, nRst, $06
	smpsLoop            $00, $04, Untitled_Loop2A
	smpsStop

; FM5 Data
Untitled_FM5:
	smpsSetvoice        $03
	smpsAlterVol        $16
	smpsPan             panCenter, $00

Untitled_Loop10:
	dc.b	nAb3, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2
	smpsAlterNote       $00
	smpsLoop            $00, $1A, Untitled_Loop10
	dc.b	nAb3, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1, smpsNoAttack, nAb1
	smpsSetvoice        $08
	smpsAlterVol        $03
	smpsPan             panLeft, $00

Untitled_Loop11:
	smpsAlterNote       $F3
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2
	smpsLoop            $00, $03, Untitled_Loop11
	smpsSetvoice        $09
	smpsAlterVol        $FD
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nC5, $0B
	smpsSetvoice        $03
	smpsLoop            $01, $07, Untitled_Loop10

Untitled_Loop12:
	dc.b	nAb3, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2
	smpsAlterNote       $00
	smpsLoop            $00, $17, Untitled_Loop12
	dc.b	nAb3, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $1C
	smpsSetvoice        $08
	smpsAlterVol        $03
	smpsPan             panLeft, $00

Untitled_Loop13:
	smpsAlterNote       $F3
	dc.b	nF3, $01, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2
	smpsLoop            $00, $03, Untitled_Loop13

Untitled_Loop16:
	smpsSetvoice        $09
	smpsAlterVol        $FD
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nC5, $0B
	smpsSetvoice        $03

Untitled_Loop14:
	dc.b	nAb3, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2
	smpsAlterNote       $00
	smpsLoop            $00, $1A, Untitled_Loop14
	dc.b	nAb3, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1, smpsNoAttack, nAb1
	smpsSetvoice        $08
	smpsAlterVol        $03
	smpsPan             panLeft, $00

Untitled_Loop15:
	smpsAlterNote       $F3
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2
	smpsLoop            $00, $03, Untitled_Loop15
	smpsLoop            $01, $07, Untitled_Loop16
	smpsSetvoice        $09
	smpsAlterVol        $FD
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nC5, $0B
	smpsSetvoice        $03

Untitled_Loop17:
	dc.b	nAb3, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2
	smpsAlterNote       $00
	smpsLoop            $00, $1A, Untitled_Loop17
	dc.b	nAb3, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE3, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1, smpsNoAttack, nAb1
	smpsSetvoice        $08
	smpsAlterVol        $03
	smpsPan             panLeft, $00

Untitled_Loop18:
	smpsAlterNote       $F3
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $13
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2
	smpsLoop            $00, $04, Untitled_Loop18
	smpsStop

; FM6 Data
Untitled_FM6:
	smpsSetvoice        $04
	smpsAlterVol        $16
	smpsPan             panCenter, $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $06

Untitled_Loop00:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $02, Untitled_Loop00

Untitled_Loop02:
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3, smpsNoAttack, nAb3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $06

Untitled_Loop01:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $03, Untitled_Loop01
	smpsLoop            $01, $02, Untitled_Loop02
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3, smpsNoAttack, nAb3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $06

Untitled_Loop03:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $02, Untitled_Loop03

Untitled_Loop04:
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1
	smpsLoop            $00, $02, Untitled_Loop04
	dc.b	smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1

Untitled_Loop05:
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3
	smpsLoop            $00, $03, Untitled_Loop05
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $11
	smpsLoop            $02, $07, Untitled_Loop00

Untitled_Loop06:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $02, Untitled_Loop06

Untitled_Loop08:
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3, smpsNoAttack, nAb3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $06

Untitled_Loop07:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $03, Untitled_Loop07
	smpsLoop            $01, $02, Untitled_Loop08
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3, smpsNoAttack, nAb3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3, smpsNoAttack, nAb3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1, smpsNoAttack, nAb1, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF1, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD1, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0

Untitled_Loop09:
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3
	smpsLoop            $00, $03, Untitled_Loop09
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $11

Untitled_Loop0A:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $02, Untitled_Loop0A

Untitled_Loop0C:
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3, smpsNoAttack, nAb3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $06

Untitled_Loop0B:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $03, Untitled_Loop0B
	smpsLoop            $01, $02, Untitled_Loop0C
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3, smpsNoAttack, nAb3, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG3, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs3, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF3, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb3, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD3, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC3, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB2, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb2, smpsNoAttack, nA2, smpsNoAttack, nAb2, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG2, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs2, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF2, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb2, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD2, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC2, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB1, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb1, smpsNoAttack, nA1
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0, smpsNoAttack
	smpsAlterNote       $02
	dc.b	nG0, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	nFs0, smpsNoAttack
	smpsAlterNote       $EC
	dc.b	nF0, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nEb0, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	nD0, smpsNoAttack
	smpsAlterNote       $03
	dc.b	nC0, $06

Untitled_Loop0D:
	smpsAlterNote       $00
	dc.b	nAb1, $01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsLoop            $00, $02, Untitled_Loop0D

Untitled_Loop0E:
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1
	smpsLoop            $00, $02, Untitled_Loop0E
	dc.b	smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1
	smpsLoop            $02, $08, Untitled_Loop09

Untitled_Loop0F:
	smpsSetvoice        $05
	smpsAlterNote       $00
	dc.b	nAb4
	smpsSetvoice        $06
	dc.b	nAb4, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG4, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs4, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE4, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb4, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs4, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB3, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb3, smpsNoAttack, nA3
	smpsLoop            $00, $03, Untitled_Loop0F
	smpsSetvoice        $04
	smpsAlterNote       $00
	dc.b	nAb1, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	nG1, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	nFs1, smpsNoAttack
	smpsAlterNote       $10
	dc.b	nE1, smpsNoAttack
	smpsAlterNote       $00
	dc.b	nEb1, smpsNoAttack
	smpsAlterNote       $11
	dc.b	nCs1, $02, smpsNoAttack
	smpsAlterNote       $08
	dc.b	nB0, $01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	nBb0, smpsNoAttack, nA0, smpsNoAttack, nAb0
	smpsStop

Untitled_Voices:
;	Voice $00
;	$39
;	$30, $31, $71, $31, 	$9F, $95, $9F, $1F, 	$1C, $10, $00, $00
;	$00, $00, $00, $00, 	$5C, $5B, $5B, $5B, 	$0C, $10, $24, $00
	smpsVcAlgorithm     $01
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $07, $03, $03
	smpsVcCoarseFreq    $01, $01, $01, $00
	smpsVcRateScale     $00, $02, $02, $02
	smpsVcAttackRate    $1F, $1F, $15, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $10, $1C
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $05, $05, $05, $05
	smpsVcReleaseRate   $0B, $0B, $0B, $0C
	smpsVcTotalLevel    $00, $24, $10, $0C

;	Voice $01
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

;	Voice $02
;	$3B
;	$36, $62, $33, $06, 	$10, $11, $1F, $11, 	$00, $0F, $0F, $00
;	$00, $00, $00, $00, 	$00, $18, $40, $08, 	$13, $12, $19, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $06, $03
	smpsVcCoarseFreq    $06, $03, $02, $06
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $11, $1F, $11, $10
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $0F, $0F, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $04, $01, $00
	smpsVcReleaseRate   $08, $00, $08, $00
	smpsVcTotalLevel    $00, $19, $12, $13

;	Voice $03
;	$3B
;	$7F, $0F, $09, $0F, 	$5F, $1F, $1F, $53, 	$00, $0F, $0F, $13
;	$0F, $0F, $0F, $0A, 	$DF, $DF, $DF, $AF, 	$00, $00, $00, $00
	smpsVcAlgorithm     $03
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $07
	smpsVcCoarseFreq    $0F, $09, $0F, $0F
	smpsVcRateScale     $01, $00, $00, $01
	smpsVcAttackRate    $13, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $13, $0F, $0F, $00
	smpsVcDecayRate2    $0A, $0F, $0F, $0F
	smpsVcDecayLevel    $0A, $0D, $0D, $0D
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $04
;	$3E
;	$02, $02, $32, $62, 	$D8, $1F, $1F, $1F, 	$17, $0E, $0E, $0E
;	$08, $0F, $0A, $0F, 	$AF, $FF, $AF, $FF, 	$00, $00, $00, $00
	smpsVcAlgorithm     $06
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $03, $00, $00
	smpsVcCoarseFreq    $02, $02, $02, $02
	smpsVcRateScale     $00, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $18
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0E, $0E, $0E, $17
	smpsVcDecayRate2    $0F, $0A, $0F, $08
	smpsVcDecayLevel    $0F, $0A, $0F, $0A
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $05
;	$3C
;	$50, $00, $10, $60, 	$5F, $5F, $5F, $5F, 	$1F, $0D, $14, $13
;	$0B, $0A, $14, $10, 	$F8, $0C, $0A, $0C, 	$00, $00, $00, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $06, $01, $00, $05
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $13, $14, $0D, $1F
	smpsVcDecayRate2    $10, $14, $0A, $0B
	smpsVcDecayLevel    $00, $00, $00, $0F
	smpsVcReleaseRate   $0C, $0A, $0C, $08
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $06
;	$3E
;	$0F, $00, $10, $70, 	$9F, $1F, $1F, $1F, 	$05, $0F, $0A, $00
;	$01, $1F, $1F, $1F, 	$1F, $BF, $BF, $1F, 	$0B, $00, $00, $00
	smpsVcAlgorithm     $06
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $01, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $0F
	smpsVcRateScale     $00, $00, $00, $02
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $0A, $0F, $05
	smpsVcDecayRate2    $1F, $1F, $1F, $01
	smpsVcDecayLevel    $01, $0B, $0B, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $0B

;	Voice $07
;	$00
;	$70, $70, $74, $72, 	$0E, $11, $14, $1F, 	$17, $15, $16, $00
;	$00, $00, $00, $00, 	$B1, $A1, $51, $09, 	$00, $08, $0B, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $07, $07
	smpsVcCoarseFreq    $02, $04, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $14, $11, $0E
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $16, $15, $17
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $05, $0A, $0B
	smpsVcReleaseRate   $09, $01, $01, $01
	smpsVcTotalLevel    $00, $0B, $08, $00

;	Voice $08
;	$06
;	$32, $71, $71, $71, 	$DF, $1F, $1F, $1F, 	$0B, $0B, $0B, $0B
;	$1F, $1F, $1F, $1F, 	$1F, $FF, $FF, $5F, 	$0E, $00, $00, $00
	smpsVcAlgorithm     $06
	smpsVcFeedback      $00
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $07, $03
	smpsVcCoarseFreq    $01, $01, $01, $02
	smpsVcRateScale     $00, $00, $00, $03
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0B, $0B, $0B, $0B
	smpsVcDecayRate2    $1F, $1F, $1F, $1F
	smpsVcDecayLevel    $05, $0F, $0F, $01
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $00, $00, $0E

;	Voice $09
;	$3C
;	$7F, $7F, $0D, $7F, 	$9F, $9F, $5F, $9F, 	$00, $11, $12, $14
;	$00, $07, $07, $07, 	$09, $39, $39, $39, 	$00, $00, $00, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $00, $07, $07
	smpsVcCoarseFreq    $0F, $0D, $0F, $0F
	smpsVcRateScale     $02, $01, $02, $02
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $14, $12, $11, $00
	smpsVcDecayRate2    $07, $07, $07, $00
	smpsVcDecayLevel    $03, $03, $03, $00
	smpsVcReleaseRate   $09, $09, $09, $09
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $0A
;	$38
;	$13, $73, $32, $01, 	$1F, $1F, $1F, $0E, 	$00, $0B, $0A, $08
;	$00, $00, $00, $00, 	$01, $11, $11, $18, 	$2D, $18, $1F, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $03, $07, $01
	smpsVcCoarseFreq    $01, $02, $03, $03
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0E, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $08, $0A, $0B, $00
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $01, $01, $01, $00
	smpsVcReleaseRate   $08, $01, $01, $01
	smpsVcTotalLevel    $00, $1F, $18, $2D

;	Voice $0B
;	$24
;	$71, $71, $30, $30, 	$5F, $5F, $5F, $5F, 	$1C, $12, $0B, $12
;	$0B, $0A, $0A, $0C, 	$15, $16, $15, $16, 	$17, $00, $10, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $07, $07
	smpsVcCoarseFreq    $00, $00, $01, $01
	smpsVcRateScale     $01, $01, $01, $01
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $12, $0B, $12, $1C
	smpsVcDecayRate2    $0C, $0A, $0A, $0B
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $06, $05, $06, $05
	smpsVcTotalLevel    $00, $10, $00, $17

;	Voice $0C
;	$24
;	$72, $72, $33, $33, 	$1F, $0F, $1F, $0B, 	$00, $0F, $00, $0F
;	$00, $01, $00, $01, 	$00, $36, $00, $36, 	$16, $00, $17, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $04
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $07, $07
	smpsVcCoarseFreq    $03, $03, $02, $02
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $0B, $1F, $0F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0F, $00, $0F, $00
	smpsVcDecayRate2    $01, $00, $01, $00
	smpsVcDecayLevel    $03, $00, $03, $00
	smpsVcReleaseRate   $06, $00, $06, $00
	smpsVcTotalLevel    $00, $17, $00, $16

