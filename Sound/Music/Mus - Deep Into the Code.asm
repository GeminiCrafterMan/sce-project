DeepCode_Header:
	smpsHeaderStartSong 1
	smpsHeaderVoice     DeepCode_Voices
	smpsHeaderChan      $07, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       DeepCode_DAC,	$00, $F2
	smpsHeaderFM        DeepCode_FM1,	$00, $00
	smpsHeaderFM        DeepCode_FM2,	$00, $00
	smpsHeaderFM        DeepCode_FM3,	$00, $00
	smpsHeaderFM        DeepCode_FM4,	$00, $00
	smpsHeaderFM        DeepCode_FM5,	$00, $00
	smpsHeaderFM        DeepCode_FM6,	$00, $00
	smpsHeaderPSG       DeepCode_PSG1,	$00, $00, $00, $00
	smpsHeaderPSG       DeepCode_PSG2,	$00, $00, $00, $00
	smpsHeaderPSG       DeepCode_PSG3,	$00, $00, $00, $00

; DAC Data
DeepCode_DAC:
; PSG2 Data
DeepCode_PSG2:
; PSG3 Data
DeepCode_PSG3:
	smpsStop

; FM1 Data
DeepCode_FM1:
	smpsSetvoice        $00
	smpsAlterVol        $19
	smpsPan             panLeft, $00

DeepCode_Loop45:
	dc.b	nF2, $04, nRst
	smpsLoop            $00, $FF, DeepCode_Loop45

DeepCode_Loop46:
	dc.b	nCs2, nRst
	smpsLoop            $00, $40, DeepCode_Loop46

DeepCode_Loop47:
	dc.b	nF2, nRst
	smpsLoop            $00, $40, DeepCode_Loop47

DeepCode_Loop48:
	dc.b	nCs2, nRst
	smpsLoop            $00, $08, DeepCode_Loop48

DeepCode_Loop49:
	dc.b	nC2, nRst
	smpsLoop            $00, $08, DeepCode_Loop49
	smpsLoop            $01, $03, DeepCode_Loop48

DeepCode_Loop4A:
	dc.b	nBb2, nRst
	smpsLoop            $00, $08, DeepCode_Loop4A
	dc.b	nC3, nRst, nB2, nRst, nBb2, nRst, nA2, nRst, nAb2, nRst, nG2, nRst
	dc.b	nFs2, nRst, nE2

DeepCode_Loop4B:
	dc.b	nRst, nF2
	smpsLoop            $00, $C0, DeepCode_Loop4B

DeepCode_Loop4C:
	dc.b	nRst, nCs2
	smpsLoop            $00, $40, DeepCode_Loop4C

DeepCode_Loop4D:
	dc.b	nRst, nF2
	smpsLoop            $00, $40, DeepCode_Loop4D

DeepCode_Loop4E:
	dc.b	nRst, nCs2
	smpsLoop            $00, $08, DeepCode_Loop4E

DeepCode_Loop4F:
	dc.b	nRst, nC2
	smpsLoop            $00, $08, DeepCode_Loop4F
	smpsLoop            $01, $03, DeepCode_Loop4E

DeepCode_Loop50:
	dc.b	nRst, nBb2
	smpsLoop            $00, $08, DeepCode_Loop50
	dc.b	nRst, nC3, nRst, nB2, nRst, nBb2, nRst, nA2, nRst, nAb2, nRst, nG2
	dc.b	nRst, nFs2, nRst, nE2

DeepCode_Loop51:
	dc.b	nRst, nF2
	smpsLoop            $00, $20, DeepCode_Loop51
	dc.b	nRst
	smpsAlterVol        $E7
	smpsPan             panCenter, $00
	smpsJump            DeepCode_FM1

; FM2 Data
DeepCode_FM2:
	smpsSetvoice        $00
	smpsAlterVol        $19
	smpsPan             panLeft, $00

DeepCode_Loop38:
	dc.b	nC3, $04, nRst
	smpsLoop            $00, $FF, DeepCode_Loop38

DeepCode_Loop39:
	dc.b	nAb2, nRst
	smpsLoop            $00, $40, DeepCode_Loop39

DeepCode_Loop3A:
	dc.b	nC3, nRst
	smpsLoop            $00, $40, DeepCode_Loop3A

DeepCode_Loop3B:
	dc.b	nAb2, nRst
	smpsLoop            $00, $08, DeepCode_Loop3B

DeepCode_Loop3C:
	dc.b	nG2, nRst
	smpsLoop            $00, $08, DeepCode_Loop3C
	smpsLoop            $01, $03, DeepCode_Loop3B

DeepCode_Loop3D:
	dc.b	nF3, nRst
	smpsLoop            $00, $08, DeepCode_Loop3D
	dc.b	nG3, nRst, nFs3, nRst, nF3, nRst, nE3, nRst, nEb3, nRst, nD3, nRst
	dc.b	nCs3, nRst, nB2

DeepCode_Loop3E:
	dc.b	nRst, nC3
	smpsLoop            $00, $C0, DeepCode_Loop3E

DeepCode_Loop3F:
	dc.b	nRst, nAb2
	smpsLoop            $00, $40, DeepCode_Loop3F

DeepCode_Loop40:
	dc.b	nRst, nC3
	smpsLoop            $00, $40, DeepCode_Loop40

DeepCode_Loop41:
	dc.b	nRst, nAb2
	smpsLoop            $00, $08, DeepCode_Loop41

DeepCode_Loop42:
	dc.b	nRst, nG2
	smpsLoop            $00, $08, DeepCode_Loop42
	smpsLoop            $01, $03, DeepCode_Loop41

DeepCode_Loop43:
	dc.b	nRst, nF3
	smpsLoop            $00, $08, DeepCode_Loop43
	dc.b	nRst, nG3, nRst, nFs3, nRst, nF3, nRst, nE3, nRst, nEb3, nRst, nD3
	dc.b	nRst, nCs3, nRst, nB2

DeepCode_Loop44:
	dc.b	nRst, nC3
	smpsLoop            $00, $20, DeepCode_Loop44
	dc.b	nRst
	smpsAlterVol        $E7
	smpsPan             panCenter, $00
	smpsJump            DeepCode_FM2

; FM3 Data
DeepCode_FM3:
	smpsPan             panCenter, $00
	dc.b	nRst, $7F, $7F, $02
	smpsSetvoice        $01
	smpsAlterVol        $19
	smpsPan             panRight, $00

DeepCode_Loop2B:
	dc.b	nF2, $04, nRst
	smpsLoop            $00, $FF, DeepCode_Loop2B

DeepCode_Loop2C:
	dc.b	nCs2, nRst
	smpsLoop            $00, $40, DeepCode_Loop2C

DeepCode_Loop2D:
	dc.b	nF2, nRst
	smpsLoop            $00, $40, DeepCode_Loop2D

DeepCode_Loop2E:
	dc.b	nCs2, nRst
	smpsLoop            $00, $08, DeepCode_Loop2E

DeepCode_Loop2F:
	dc.b	nC2, nRst
	smpsLoop            $00, $08, DeepCode_Loop2F
	smpsLoop            $01, $03, DeepCode_Loop2E

DeepCode_Loop30:
	dc.b	nBb2, nRst
	smpsLoop            $00, $08, DeepCode_Loop30
	dc.b	nC3, nRst, nB2, nRst, nBb2, nRst, nA2, nRst, nAb2, nRst, nG2, nRst
	dc.b	nFs2, nRst, nE2

DeepCode_Loop31:
	dc.b	nRst, nF2
	smpsLoop            $00, $C0, DeepCode_Loop31

DeepCode_Loop32:
	dc.b	nRst, nCs2
	smpsLoop            $00, $40, DeepCode_Loop32

DeepCode_Loop33:
	dc.b	nRst, nF2
	smpsLoop            $00, $40, DeepCode_Loop33

DeepCode_Loop34:
	dc.b	nRst, nCs2
	smpsLoop            $00, $08, DeepCode_Loop34

DeepCode_Loop35:
	dc.b	nRst, nC2
	smpsLoop            $00, $08, DeepCode_Loop35
	smpsLoop            $01, $03, DeepCode_Loop34

DeepCode_Loop36:
	dc.b	nRst, nBb2
	smpsLoop            $00, $08, DeepCode_Loop36
	dc.b	nRst, nC3, nRst, nB2, nRst, nBb2, nRst, nA2, nRst, nAb2, nRst, nG2
	dc.b	nRst, nFs2, nRst, nE2

DeepCode_Loop37:
	dc.b	nRst, nF2
	smpsLoop            $00, $20, DeepCode_Loop37
	dc.b	nRst
	smpsSetvoice        $00
	smpsAlterVol        $E7
	smpsPan             panCenter, $00
	smpsJump            DeepCode_FM3

; FM4 Data
DeepCode_FM4:
	smpsPan             panCenter, $00
	dc.b	nRst, $7F, $7F, $02
	smpsSetvoice        $01
	smpsAlterVol        $19
	smpsPan             panRight, $00

DeepCode_Loop1E:
	dc.b	nC3, $04, nRst
	smpsLoop            $00, $FF, DeepCode_Loop1E

DeepCode_Loop1F:
	dc.b	nAb2, nRst
	smpsLoop            $00, $40, DeepCode_Loop1F

DeepCode_Loop20:
	dc.b	nC3, nRst
	smpsLoop            $00, $40, DeepCode_Loop20

DeepCode_Loop21:
	dc.b	nAb2, nRst
	smpsLoop            $00, $08, DeepCode_Loop21

DeepCode_Loop22:
	dc.b	nG2, nRst
	smpsLoop            $00, $08, DeepCode_Loop22
	smpsLoop            $01, $03, DeepCode_Loop21

DeepCode_Loop23:
	dc.b	nF3, nRst
	smpsLoop            $00, $08, DeepCode_Loop23
	dc.b	nG3, nRst, nFs3, nRst, nF3, nRst, nE3, nRst, nEb3, nRst, nD3, nRst
	dc.b	nCs3, nRst, nB2

DeepCode_Loop24:
	dc.b	nRst, nC3
	smpsLoop            $00, $C0, DeepCode_Loop24

DeepCode_Loop25:
	dc.b	nRst, nAb2
	smpsLoop            $00, $40, DeepCode_Loop25

DeepCode_Loop26:
	dc.b	nRst, nC3
	smpsLoop            $00, $40, DeepCode_Loop26

DeepCode_Loop27:
	dc.b	nRst, nAb2
	smpsLoop            $00, $08, DeepCode_Loop27

DeepCode_Loop28:
	dc.b	nRst, nG2
	smpsLoop            $00, $08, DeepCode_Loop28
	smpsLoop            $01, $03, DeepCode_Loop27

DeepCode_Loop29:
	dc.b	nRst, nF3
	smpsLoop            $00, $08, DeepCode_Loop29
	dc.b	nRst, nG3, nRst, nFs3, nRst, nF3, nRst, nE3, nRst, nEb3, nRst, nD3
	dc.b	nRst, nCs3, nRst, nB2

DeepCode_Loop2A:
	dc.b	nRst, nC3
	smpsLoop            $00, $20, DeepCode_Loop2A
	dc.b	nRst
	smpsSetvoice        $00
	smpsAlterVol        $E7
	smpsPan             panCenter, $00
	smpsJump            DeepCode_FM4

; FM5 Data
DeepCode_FM5:
	smpsPan             panCenter, $00
	dc.b	nRst, $7F, $7F, $7F, $7F, $04
	smpsSetvoice        $02
	smpsAlterVol        $2C
	smpsPan             panLeft, $00
	smpsAlterNote       $ED

DeepCode_Loop18:
	dc.b	nEb4, $01, nRst, $07
	smpsAlterVol        $FF
	smpsLoop            $00, $02, DeepCode_Loop18

DeepCode_Loop1A:
	dc.b	nEb4, $01, nRst, $07

DeepCode_Loop19:
	dc.b	nEb4, $01, nRst, $07
	smpsAlterVol        $FF
	smpsLoop            $00, $06, DeepCode_Loop19
	smpsLoop            $01, $04, DeepCode_Loop1A
	dc.b	nEb4, $01, nRst, $07, nEb4, $01, nRst, $07
	smpsSetvoice        $04
	smpsAlterVol        $F7
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	dc.b	nBb0

DeepCode_Loop1B:
	dc.b	$7F, smpsNoAttack
	smpsLoop            $00, $04, DeepCode_Loop1B
	dc.b	$14
	smpsSetvoice        $07
	smpsAlterVol        $0C
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, nRst
	smpsAlterVol        $F4
	dc.b	nB2, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nF2, $1F, nRst, $01

DeepCode_Loop1C:
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, nRst
	smpsAlterVol        $F4
	smpsLoop            $00, $02, DeepCode_Loop1C
	dc.b	nG3, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nCs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $07, nRst, $01, nAb3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01, nAb3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nCs3, $20
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $10, nRst, $08
	smpsAlterVol        $F4
	dc.b	nG3, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb3, $07, nRst, $01, nA3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nAb3, $07, nRst, $01, nA3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, nRst
	smpsAlterVol        $F4
	dc.b	nB2, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, nRst
	smpsAlterVol        $F4
	dc.b	nB2, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nF2, $08, nRst
	smpsSetvoice        $08
	dc.b	nCs4
	smpsSetvoice        $09
	dc.b	nF4, nAb4, nB4, nEb5, nB4, nAb4, nF4, nE4, nG4, nF4, nE4
	smpsSetvoice        $08
	dc.b	nC4
	smpsSetvoice        $09
	dc.b	nE4, nG4, nE4, nCs5, nAb4, nEb5, nB4, nF5, nCs5, nAb4, nF4, nG4
	dc.b	nAb4, nG4, nF4, nE4
	smpsSetvoice        $08
	dc.b	nCs4, nC4
	smpsSetvoice        $09
	dc.b	nE4, nF5, nCs5, nAb4, nF4, nE4, nG4, nC5, nE5, nF5, nAb5, nG5
	dc.b	nF5, nC5, nE5, nCs5, nC5
	smpsSetvoice        $08
	dc.b	nBb3, nC4, nCs4, nEb4
	smpsSetvoice        $09
	dc.b	nE4, nF4, nFs4, nF4, nG4, $04, nAb4, nA4, nBb4, nB4, nC5, nCs5
	dc.b	nD5, nEb5, nE5, nF5, nFs5, nG5, nAb5, nA5, nBb5, nC6, $21, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, nRst, $7F, $11
	smpsSetvoice        $07
	smpsAlterNote       $00
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, nRst
	smpsAlterVol        $F4
	dc.b	nB2, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nF2, $1F, nRst, $01

DeepCode_Loop1D:
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, nRst
	smpsAlterVol        $F4
	smpsLoop            $00, $02, DeepCode_Loop1D
	dc.b	nG3, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nCs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $07, nRst, $01, nAb3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01, nAb3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nCs3, $20
	smpsAlterVol        $0C
	dc.b	smpsNoAttack, $10, nRst, $08
	smpsAlterVol        $F4
	dc.b	nG3, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb3, $07, nRst, $01, nA3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nAb3, $07, nRst, $01, nA3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nG3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nG3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nFs3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nFs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nE3, $08, nRst
	smpsAlterVol        $0C
	dc.b	nE3, nRst
	smpsAlterVol        $F4
	dc.b	nB2, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, nRst
	smpsAlterVol        $F4
	dc.b	nB2, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $0C
	dc.b	nC3, $07, nRst, $01, nCs3, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nB2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nB2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nAb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nAb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nBb2, $08, nRst
	smpsAlterVol        $0C
	dc.b	nBb2, $07, nRst, $01
	smpsAlterVol        $F4
	dc.b	nF2, $08, nRst
	smpsSetvoice        $09
	dc.b	nCs5, nAb4, nF4, nB4, nEb5, nB4, nAb4, nF4, nE4, nG4, nF4, nE4
	smpsSetvoice        $08
	dc.b	nC4
	smpsSetvoice        $09
	dc.b	nE4, nG4, nE4
	smpsSetvoice        $08
	dc.b	nCs4
	smpsSetvoice        $09
	dc.b	nAb4, nB4, nAb4, nEb5, nB4, nAb4, nF4, nG4, nAb4, nG4, nF4, nE4
	smpsSetvoice        $08
	dc.b	nCs4, nC4
	smpsSetvoice        $09
	dc.b	nE4, nF5, $04, smpsNoAttack, nFs5, smpsNoAttack, nF5, smpsNoAttack, nEb5, nCs5, smpsNoAttack, nEb5
	dc.b	smpsNoAttack, nCs5, $05, smpsNoAttack, nB4, $03, nE5, $04, smpsNoAttack, nF5, smpsNoAttack, nE5
	dc.b	$05, smpsNoAttack, nC5, $03, nBb4, $04, smpsNoAttack, nC5, $05, smpsNoAttack, nBb4, $03
	dc.b	smpsNoAttack, nG4, $04, nF4, smpsNoAttack, nFs4, smpsNoAttack, nF4
	smpsSetvoice        $08
	dc.b	smpsNoAttack, nEb4, nCs4, smpsNoAttack, nEb4, smpsNoAttack, nCs4, $05, smpsNoAttack, nB3, $03, nC4
	dc.b	$04
	smpsSetvoice        $09
	dc.b	smpsNoAttack, $01, smpsNoAttack, nE4, $03
	smpsSetvoice        $08
	dc.b	smpsNoAttack, nCs4, $05, smpsNoAttack, nC4, $03, nBb3, $04, smpsNoAttack, nAb3, smpsNoAttack, nBb3
	dc.b	smpsNoAttack, nC4
	smpsSetvoice        $09
	dc.b	nFs4, $08, nF4
	smpsSetvoice        $08
	dc.b	nEb4, nCs4, nC4, nCs4, nC4
	smpsSetvoice        $09
	dc.b	nG4, nC5, $04, nB4, nBb4, nA4, nAb4, nG4, nFs4, nF4, nE4
	smpsSetvoice        $08
	dc.b	nEb4, nD4, nCs4, nC4, nB3, nBb3, nA3, nC4, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$04, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$08, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $06
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $0D
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $05
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FC
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F4
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F0
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F7
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $00
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $09
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $10
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0A
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $01
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F8
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FD
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$02, smpsNoAttack
	smpsAlterNote       $F2
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FA
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $03
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0B
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0F
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $08
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F6
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EF
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F5
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $07
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0E
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $12
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $11
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $0C
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $04
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $FB
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F3
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $EE
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $ED
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F1
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $F9
	dc.b	$01, smpsNoAttack
	smpsAlterNote       $02
	dc.b	$01
	smpsSetvoice        $00
	smpsAlterVol        $EB
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	smpsJump            DeepCode_FM5

; FM6 Data
DeepCode_FM6:
	smpsPan             panCenter, $00
	dc.b	nRst, $7F, $7F, $7F, $7F, $04
	smpsSetvoice        $03
	smpsAlterVol        $2B
	smpsAlterNote       $F7

DeepCode_Loop00:
	dc.b	nFs3, $01, nRst, $07
	smpsAlterVol        $FF
	smpsLoop            $00, $07, DeepCode_Loop00
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $03, DeepCode_Loop00

DeepCode_Loop01:
	dc.b	nFs3, $01, nRst, $07
	smpsAlterVol        $FF
	smpsLoop            $00, $06, DeepCode_Loop01
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08

DeepCode_Loop04:
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop02:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop02
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02

DeepCode_Loop03:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop03
	smpsSetvoice        $05
	smpsAlterVol        $06
	smpsLoop            $01, $03, DeepCode_Loop04
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop05:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop05
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop07:
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop06:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop06
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $03, DeepCode_Loop07
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $12
	dc.b	nFs3, $01, nRst, $07
	smpsAlterVol        $F4

DeepCode_Loop0C:
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop09:
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop08:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop08
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $05, DeepCode_Loop09
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop0B:
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop0A:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop0A
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $03, DeepCode_Loop0B
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	smpsLoop            $02, $02, DeepCode_Loop0C

DeepCode_Loop0F:
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop0E:
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop0D:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop0D
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $03, DeepCode_Loop0E
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	smpsLoop            $02, $07, DeepCode_Loop0F

DeepCode_Loop14:
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop11:
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop10:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop10
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $05, DeepCode_Loop11
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop13:
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop12:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop12
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $03, DeepCode_Loop13
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	smpsLoop            $02, $02, DeepCode_Loop14

DeepCode_Loop17:
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop16:
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA

DeepCode_Loop15:
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $00, $03, DeepCode_Loop15
	smpsSetvoice        $03
	smpsAlterVol        $FE
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $02
	dc.b	nFs3, $01, nRst, $07
	smpsLoop            $01, $03, DeepCode_Loop16
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $06
	smpsLoop            $02, $05, DeepCode_Loop17
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $03
	smpsAlterVol        $F8
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $05
	smpsAlterVol        $08
	dc.b	nFs3, $01, nRst, $07
	smpsSetvoice        $06
	smpsAlterVol        $FA
	dc.b	nFs3, $01, nRst, $07, nFs3, $01, nRst, $7F, $7F, $09
	smpsSetvoice        $00
	smpsAlterVol        $EE
	smpsPan             panCenter, $00
	smpsAlterNote       $00
	smpsJump            DeepCode_FM6

; PSG1 Data
DeepCode_PSG1:
	dc.b	nRst

DeepCode_Loop52:
	dc.b	$7F
	smpsLoop            $00, $1A, DeepCode_Loop52
	dc.b	$1E
	smpsPSGAlterVol     $09
	smpsAlterNote       $01
	dc.b	nCs1, $08
	smpsAlterNote       $00
	dc.b	nF1, nAb1
	smpsAlterNote       $01
	dc.b	nB1
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nB1
	smpsAlterNote       $00
	dc.b	nAb1, nF1, nE1, nG1, nF1, nE1
	smpsAlterNote       $01
	dc.b	nC1
	smpsAlterNote       $00
	dc.b	nE1, nG1, nE1
	smpsAlterNote       $01
	dc.b	nCs2
	smpsAlterNote       $00
	dc.b	nAb1, nEb2
	smpsAlterNote       $01
	dc.b	nB1
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nCs2
	smpsAlterNote       $00
	dc.b	nAb1, nF1, nG1, nAb1, nG1, nF1, nE1
	smpsAlterNote       $01
	dc.b	nCs1, nC1
	smpsAlterNote       $00
	dc.b	nE1, nF2
	smpsAlterNote       $01
	dc.b	nCs2
	smpsAlterNote       $00
	dc.b	nAb1, nF1, nE1, nG1, nC2
	smpsAlterNote       $01
	dc.b	nE2
	smpsAlterNote       $00
	dc.b	nF2, nAb2, nG2, nF2, nC2
	smpsAlterNote       $01
	dc.b	nE2, nCs2
	smpsAlterNote       $00
	dc.b	nC2
	smpsAlterNote       $01
	dc.b	nBb0, nC1, nCs1, nEb1
	smpsAlterNote       $00
	dc.b	nE1, nF1, nFs1, nF1, nG1, $04, nAb1, nA1
	smpsAlterNote       $01
	dc.b	nBb1, nB1
	smpsAlterNote       $00
	dc.b	nC2
	smpsAlterNote       $01
	dc.b	nCs2
	smpsAlterNote       $00
	dc.b	nD2, nEb2
	smpsAlterNote       $01
	dc.b	nE2
	smpsAlterNote       $00
	dc.b	nF2, nFs2, nG2, nAb2, nA2, nBb2, nC3, $7F, $7F, $7E, nRst

DeepCode_Loop53:
	dc.b	$7F
	smpsLoop            $00, $11, DeepCode_Loop53
	dc.b	$15
	smpsAlterNote       $01
	dc.b	nCs2, $08
	smpsAlterNote       $00
	dc.b	nAb1, nF1
	smpsAlterNote       $01
	dc.b	nB1
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nB1
	smpsAlterNote       $00
	dc.b	nAb1, nF1, nE1, nG1, nF1, nE1
	smpsAlterNote       $01
	dc.b	nC1
	smpsAlterNote       $00
	dc.b	nE1, nG1, nE1
	smpsAlterNote       $01
	dc.b	nCs1
	smpsAlterNote       $00
	dc.b	nAb1
	smpsAlterNote       $01
	dc.b	nB1
	smpsAlterNote       $00
	dc.b	nAb1, nEb2
	smpsAlterNote       $01
	dc.b	nB1
	smpsAlterNote       $00
	dc.b	nAb1, nF1, nG1, nAb1, nG1, nF1, nE1
	smpsAlterNote       $01
	dc.b	nCs1, nC1
	smpsAlterNote       $00
	dc.b	nE1, nF2, $04, nFs2, nF2, nEb2
	smpsAlterNote       $01
	dc.b	nCs2
	smpsAlterNote       $00
	dc.b	nEb2
	smpsAlterNote       $01
	dc.b	nCs2, nB1, nE2
	smpsAlterNote       $00
	dc.b	nF2
	smpsAlterNote       $01
	dc.b	nE2

DeepCode_Loop54:
	smpsAlterNote       $00
	dc.b	nC2
	smpsAlterNote       $01
	dc.b	nBb1
	smpsLoop            $00, $02, DeepCode_Loop54
	smpsAlterNote       $00
	dc.b	nG1, nF1, nFs1, nF1
	smpsAlterNote       $01
	dc.b	nEb1, nCs1, nEb1, nCs1, nB0, nC1
	smpsAlterNote       $00
	dc.b	nE1
	smpsAlterNote       $01
	dc.b	nCs1, nC1, nBb0, nAb0, nBb0, nC1
	smpsAlterNote       $00
	dc.b	nFs1, $08, nF1
	smpsAlterNote       $01
	dc.b	nEb1, nCs1, nC1, nCs1, nC1
	smpsAlterNote       $00
	dc.b	nG1, nC2, $04
	smpsAlterNote       $01
	dc.b	nB1, nBb1
	smpsAlterNote       $00
	dc.b	nA1, nAb1, nG1, nFs1, nF1, nE1
	smpsAlterNote       $01
	dc.b	nEb1
	smpsAlterNote       $00
	dc.b	nD1
	smpsAlterNote       $01
	dc.b	nCs1, nC1, nB0, nBb0, nA0, nC1, $7F, $79, nRst, $04
	smpsPSGAlterVol     $F7
	smpsJump            DeepCode_PSG1

DeepCode_Voices:
;	Voice $00
;	$28
;	$03, $0F, $77, $71, 	$1F, $12, $1F, $1F, 	$04, $01, $04, $0C
;	$01, $01, $01, $00, 	$10, $18, $10, $18, 	$0A, $16, $17, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $00, $00
	smpsVcCoarseFreq    $01, $07, $0F, $03
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $12, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0C, $04, $01, $04
	smpsVcDecayRate2    $00, $01, $01, $01
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $08, $00, $08, $00
	smpsVcTotalLevel    $00, $17, $16, $0A

;	Voice $01
;	$28
;	$03, $0F, $77, $71, 	$1F, $12, $1F, $1F, 	$04, $01, $04, $0C
;	$01, $01, $01, $02, 	$10, $18, $10, $18, 	$0A, $1C, $17, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $07, $07, $00, $00
	smpsVcCoarseFreq    $01, $07, $0F, $03
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $12, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0C, $04, $01, $04
	smpsVcDecayRate2    $02, $01, $01, $01
	smpsVcDecayLevel    $01, $01, $01, $01
	smpsVcReleaseRate   $08, $00, $08, $00
	smpsVcTotalLevel    $00, $17, $1C, $0A

;	Voice $02
;	$3D
;	$06, $00, $00, $00, 	$1F, $1F, $1F, $1F, 	$1F, $00, $00, $00
;	$1F, $00, $00, $00, 	$FF, $05, $05, $05, 	$00, $00, $00, $00
	smpsVcAlgorithm     $05
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $06
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $1F
	smpsVcDecayRate2    $00, $00, $00, $1F
	smpsVcDecayLevel    $00, $00, $00, $0F
	smpsVcReleaseRate   $05, $05, $05, $0F
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $03
;	$3C
;	$5F, $51, $32, $31, 	$1B, $1B, $0F, $1F, 	$1F, $1F, $17, $00
;	$00, $00, $00, $00, 	$05, $07, $0C, $05, 	$00, $00, $00, $00
	smpsVcAlgorithm     $04
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $03, $03, $05, $05
	smpsVcCoarseFreq    $01, $02, $01, $0F
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $0F, $1B, $1B
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $17, $1F, $1F
	smpsVcDecayRate2    $00, $00, $00, $00
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $05, $0C, $07, $05
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $04
;	$38
;	$01, $0E, $0C, $00, 	$1F, $DF, $1F, $DF, 	$1F, $00, $00, $1C
;	$01, $01, $02, $0C, 	$00, $00, $08, $05, 	$00, $00, $00, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $0C, $0E, $01
	smpsVcRateScale     $03, $00, $03, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $1C, $00, $00, $1F
	smpsVcDecayRate2    $0C, $02, $01, $01
	smpsVcDecayLevel    $00, $00, $00, $00
	smpsVcReleaseRate   $05, $08, $00, $00
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $05
;	$2D
;	$00, $00, $00, $00, 	$1B, $1F, $1F, $1F, 	$0F, $00, $00, $00
;	$1F, $00, $00, $00, 	$FB, $05, $05, $05, 	$00, $00, $00, $00
	smpsVcAlgorithm     $05
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $00, $00, $00, $00
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1B
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $00, $00, $00, $0F
	smpsVcDecayRate2    $00, $00, $00, $1F
	smpsVcDecayLevel    $00, $00, $00, $0F
	smpsVcReleaseRate   $05, $05, $05, $0B
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $06
;	$38
;	$0F, $0F, $0F, $0F, 	$1F, $1F, $1F, $1F, 	$00, $00, $00, $0F
;	$00, $00, $00, $14, 	$00, $00, $00, $2B, 	$00, $00, $00, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $07
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $00, $00, $00
	smpsVcCoarseFreq    $0F, $0F, $0F, $0F
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1F, $1F, $1F, $1F
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $0F, $00, $00, $00
	smpsVcDecayRate2    $14, $00, $00, $00
	smpsVcDecayLevel    $02, $00, $00, $00
	smpsVcReleaseRate   $0B, $00, $00, $00
	smpsVcTotalLevel    $00, $00, $00, $00

;	Voice $07
;	$28
;	$33, $3F, $57, $01, 	$15, $1F, $14, $1E, 	$00, $04, $04, $04
;	$04, $04, $04, $03, 	$04, $24, $34, $1D, 	$0C, $16, $19, $00
	smpsVcAlgorithm     $00
	smpsVcFeedback      $05
	smpsVcUnusedBits    $00
	smpsVcDetune        $00, $05, $03, $03
	smpsVcCoarseFreq    $01, $07, $0F, $03
	smpsVcRateScale     $00, $00, $00, $00
	smpsVcAttackRate    $1E, $14, $1F, $15
	smpsVcAmpMod        $00, $00, $00, $00
	smpsVcDecayRate1    $04, $04, $04, $00
	smpsVcDecayRate2    $03, $04, $04, $04
	smpsVcDecayLevel    $01, $03, $02, $00
	smpsVcReleaseRate   $0D, $04, $04, $04
	smpsVcTotalLevel    $00, $19, $16, $0C

;	Voice $08
;	$38
;	$01, $03, $01, $01, 	$DF, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$04, $00, $08, $00, 	$0F, $0F, $0F, $0F, 	$14, $17, $1B, $00
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
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $1B, $17, $14

;	Voice $09
;	$38
;	$01, $03, $01, $01, 	$DF, $1F, $1F, $1F, 	$00, $00, $00, $00
;	$04, $00, $08, $00, 	$0F, $0F, $0F, $0F, 	$14, $1B, $1B, $00
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
	smpsVcReleaseRate   $0F, $0F, $0F, $0F
	smpsVcTotalLevel    $00, $1B, $1B, $14

