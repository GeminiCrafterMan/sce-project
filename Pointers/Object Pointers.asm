; ===========================================================================
; Level object pointers
; ===========================================================================

Obj_Index:
		dc.l Obj_Ring							; $00
		dc.l Obj_Monitor						; $01
		dc.l Obj_PathSwap						; $02
		dc.l Obj_Coin							; $03
		dc.l Obj_MonkeyBars						; $04
		dc.l Obj_SideLog						; $05
		dc.l Obj_Spiral							; $06
		dc.l Obj_Spring							; $07
		dc.l Obj_Spikes							; $08
		dc.l Obj_CCZRotatingPlatform			; $09
		dc.l Obj_TTPZRideVine					; $0A
		dc.l DeleteObject						; $0B
		dc.l Obj_TensionBridge					; $0C
		dc.l Obj_Signpost						; $0D
		dc.l Obj_BadnikSlot1					; $0E
		dc.l Obj_BadnikSlot2					; $0F
		dc.l Obj_BadnikSlot3					; $10
		dc.l Obj_BadnikSlot4					; $11
		dc.l Obj_BadnikSlot5					; $12
		dc.l Obj_BadnikSlot6					; $13
		dc.l DeleteObject						; $14
		dc.l Obj_SwingingPlatform				; $15
		dc.l DeleteObject						; $16
		dc.l DeleteObject						; $17
		dc.l Obj_FloatingPlatform				; $18
		dc.l DeleteObject						; $19
		dc.l Obj_CollapsingPlatform				; $1A
		dc.l DeleteObject						; $1B
		dc.l Obj_Decoration						; $1C
		dc.l Obj_BackgroundCharacters			; $1D
		dc.l DeleteObject						; $1E
		dc.l DeleteObject						; $1F
		dc.l DeleteObject						; $20
		dc.l DeleteObject						; $21
		dc.l DeleteObject						; $22
		dc.l DeleteObject						; $23
		dc.l DeleteObject						; $24
		dc.l DeleteObject						; $25
		dc.l Obj_AutoSpin						; $26
		dc.l DeleteObject						; $27
		dc.l Obj_Invisible_SolidBlock			; $28
		dc.l DeleteObject						; $29
		dc.l DeleteObject						; $2A
		dc.l DeleteObject						; $2B
		dc.l DeleteObject						; $2C
		dc.l DeleteObject						; $2D
		dc.l DeleteObject						; $2E
		dc.l DeleteObject						; $2F
		dc.l DeleteObject						; $30
		dc.l DeleteObject						; $31
		dc.l DeleteObject						; $32
		dc.l Obj_Button							; $33
		dc.l Obj_StarPost						; $34
		dc.l DeleteObject						; $35
		dc.l DeleteObject						; $36
		dc.l DeleteObject						; $37
		dc.l DeleteObject						; $38
		dc.l DeleteObject						; $39
		dc.l DeleteObject						; $3A
		dc.l Obj_PurpleRock						; $3B
		dc.l Obj_SmashWall						; $3C
		dc.l DeleteObject						; $3D
		dc.l DeleteObject						; $3E
		dc.l DeleteObject						; $3F
		dc.l DeleteObject						; $40
		dc.l DeleteObject						; $41
		dc.l DeleteObject						; $42
		dc.l DeleteObject						; $43
		dc.l Obj_EdgeWalls						; $44
		dc.l DeleteObject						; $45
		dc.l DeleteObject						; $46
		dc.l DeleteObject						; $47
		dc.l DeleteObject						; $48
		dc.l Obj_Waterfall						; $49
		dc.l DeleteObject						; $4A
		dc.l DeleteObject						; $4B
		dc.l DeleteObject						; $4C
		dc.l DeleteObject						; $4D
		dc.l DeleteObject						; $4E
		dc.l DeleteObject						; $4F
		dc.l DeleteObject						; $50
		dc.l DeleteObject						; $51
		dc.l DeleteObject						; $52
		dc.l DeleteObject						; $53
		dc.l Obj_Bubbler						; $54
		dc.l DeleteObject						; $55
		dc.l DeleteObject						; $56
		dc.l DeleteObject						; $57
		dc.l DeleteObject						; $58
		dc.l DeleteObject						; $59
		dc.l DeleteObject						; $5A
		dc.l DeleteObject						; $5B
		dc.l DeleteObject						; $5C
		dc.l DeleteObject						; $5D
		dc.l DeleteObject						; $5E
		dc.l DeleteObject						; $5F
		dc.l DeleteObject						; $60
		dc.l DeleteObject						; $61
		dc.l DeleteObject						; $62
		dc.l DeleteObject						; $63
		dc.l DeleteObject						; $64
		dc.l DeleteObject						; $65
		dc.l DeleteObject						; $66
		dc.l DeleteObject						; $67
		dc.l DeleteObject						; $68
		dc.l DeleteObject						; $69
		dc.l Obj_Invisible_HurtBlock			; $6A
		dc.l Obj_Invisible_KillBlock			; $6B
		dc.l DeleteObject						; $6C
		dc.l Obj_Invisible_ShockBlock			; $6D
		dc.l Obj_Invisible_LavaBlock			; $6E
		dc.l DeleteObject						; $6F
		dc.l DeleteObject						; $70
		dc.l DeleteObject						; $71
		dc.l Obj_ConveyorBelt					; $72
		dc.l DeleteObject						; $73
		dc.l DeleteObject						; $74
		dc.l DeleteObject						; $75
		dc.l DeleteObject						; $76
		dc.l DeleteObject						; $77
		dc.l DeleteObject						; $78
		dc.l DeleteObject						; $79
		dc.l DeleteObject						; $7A
		dc.l DeleteObject						; $7B
		dc.l DeleteObject						; $7C
		dc.l DeleteObject						; $7D
		dc.l DeleteObject						; $7E
		dc.l DeleteObject						; $7F
		dc.l Obj_HiddenMonitor					; $80
		dc.l Obj_EggCapsule						; $81
		dc.l DeleteObject						; $82
		dc.l DeleteObject						; $83
		dc.l DeleteObject						; $84
		dc.l Obj_SSEntryRing					; $85	; same slot as S3K -- 133, or $85
		dc.l DeleteObject						; $86
		dc.l DeleteObject						; $87
		dc.l DeleteObject						; $88
		dc.l DeleteObject						; $89
		dc.l DeleteObject						; $8A
		dc.l DeleteObject						; $8B
		dc.l DeleteObject						; $8C
		dc.l DeleteObject						; $8D
		dc.l DeleteObject						; $8E
		dc.l DeleteObject						; $8F
		dc.l DeleteObject						; $90
		dc.l DeleteObject						; $91
		dc.l DeleteObject						; $92
		dc.l DeleteObject						; $93
		dc.l DeleteObject						; $94
		dc.l DeleteObject						; $95
		dc.l DeleteObject						; $96
		dc.l DeleteObject						; $97
		dc.l DeleteObject						; $98
		dc.l DeleteObject						; $99
		dc.l DeleteObject						; $9A
		dc.l DeleteObject						; $9B
		dc.l DeleteObject						; $9C
		dc.l DeleteObject						; $9D
		dc.l DeleteObject						; $9E
		dc.l DeleteObject						; $9F
		dc.l DeleteObject						; $A0
		dc.l DeleteObject						; $A1
		dc.l DeleteObject						; $A2
		dc.l DeleteObject						; $A3
		dc.l DeleteObject						; $A4
		dc.l DeleteObject						; $A5
		dc.l DeleteObject						; $A6
		dc.l DeleteObject						; $A7
		dc.l DeleteObject						; $A8
		dc.l DeleteObject						; $A9
		dc.l DeleteObject						; $AA
		dc.l DeleteObject						; $AB
		dc.l DeleteObject						; $AC
		dc.l DeleteObject						; $AD
		dc.l DeleteObject						; $AE
		dc.l DeleteObject						; $AF
		dc.l DeleteObject						; $B0
		dc.l DeleteObject						; $B1
		dc.l DeleteObject						; $B2
		dc.l DeleteObject						; $B3
		dc.l DeleteObject						; $B4
		dc.l DeleteObject						; $B5
		dc.l DeleteObject						; $B6
		dc.l DeleteObject						; $B7
		dc.l DeleteObject						; $B8
		dc.l DeleteObject						; $B9
		dc.l DeleteObject						; $BA
		dc.l DeleteObject						; $BB
		dc.l DeleteObject						; $BC
		dc.l DeleteObject						; $BD
		dc.l DeleteObject						; $BE
		dc.l DeleteObject						; $BF
		dc.l DeleteObject						; $C0
		dc.l DeleteObject						; $C1
		dc.l DeleteObject						; $C2
		dc.l DeleteObject						; $C3
		dc.l DeleteObject						; $C4
		dc.l DeleteObject						; $C5
		dc.l DeleteObject						; $C6
		dc.l DeleteObject						; $C7
		dc.l DeleteObject						; $C8
		dc.l DeleteObject						; $C9
		dc.l DeleteObject						; $CA
		dc.l DeleteObject						; $CB
		dc.l DeleteObject						; $CC
		dc.l DeleteObject						; $CD
		dc.l DeleteObject						; $CE
		dc.l DeleteObject						; $CF
		dc.l DeleteObject						; $D0
		dc.l DeleteObject						; $D1
		dc.l DeleteObject						; $D2
		dc.l DeleteObject						; $D3
		dc.l DeleteObject						; $D4
		dc.l DeleteObject						; $D5
		dc.l DeleteObject						; $D6
		dc.l DeleteObject						; $D7
		dc.l DeleteObject						; $D8
		dc.l DeleteObject						; $D9
		dc.l DeleteObject						; $DA
		dc.l DeleteObject						; $DB
		dc.l DeleteObject						; $DC
		dc.l DeleteObject						; $DD
		dc.l DeleteObject						; $DE
		dc.l DeleteObject						; $DF
		dc.l DeleteObject						; $E0
		dc.l DeleteObject						; $E1
		dc.l DeleteObject						; $E2
		dc.l DeleteObject						; $E3
		dc.l DeleteObject						; $E4
		dc.l DeleteObject						; $E5
		dc.l DeleteObject						; $E6
		dc.l DeleteObject						; $E7
		dc.l DeleteObject						; $E8
		dc.l DeleteObject						; $E9
		dc.l DeleteObject						; $EA
		dc.l DeleteObject						; $EB
		dc.l DeleteObject						; $EC
		dc.l DeleteObject						; $ED
		dc.l DeleteObject						; $EE
		dc.l DeleteObject						; $EF
		dc.l DeleteObject						; $F0
		dc.l DeleteObject						; $F1
		dc.l DeleteObject						; $F2
		dc.l DeleteObject						; $F3
		dc.l DeleteObject						; $F4
		dc.l DeleteObject						; $F5
		dc.l DeleteObject						; $F6
		dc.l DeleteObject						; $F7
		dc.l DeleteObject						; $F8
		dc.l DeleteObject						; $F9
		dc.l DeleteObject						; $FA
		dc.l DeleteObject						; $FB
		dc.l DeleteObject						; $FC
		dc.l DeleteObject						; $FD
		dc.l DeleteObject						; $FE
		dc.l DeleteObject						; $FF