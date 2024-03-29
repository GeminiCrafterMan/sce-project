Map_TitleCard:
		dc.w 0							; Null
		dc.w TCard_Banner-Map_TitleCard	; Red SONIC 3 banner
		dc.w TCard_ACT-Map_TitleCard	; ACT
		dc.w TCard_ZONE-Map_TitleCard	; ZONE
Map_TitleCard_Zones:
	; ISZ
		dc.w TCard_GHZ-Map_TitleCard	; GREEN HILL
		dc.w TCard_NHZ-Map_TitleCard	; NEWTROGIC HIGH
		dc.w TCard_GHZ-Map_TitleCard	; GREEN HILL
		dc.w TCard_NHZ-Map_TitleCard	; NEWTROGIC HIGH
	; SSLZ
	rept 4
		dc.w TCard_SSLZ-Map_TitleCard	; SEASIDE LAND
	endr
	; TTPZ
	rept 4
		dc.w TCard_TTPZ-Map_TitleCard	; TREE TOP
	endr
	; CCZ
	rept 4
		dc.w TCard_CCZ-Map_TitleCard	; CLOCKWORK CASTLE
	endr
	; MMZ
	rept 4
		dc.w TCard_MMZ-Map_TitleCard	; MECHA MUSHROOM (currently MUSHROOM HILL)
	endr
	; DEZ
	rept 4
		dc.w TCard_DEZ-Map_TitleCard	; DEATH EGG (to be removed when Silver Sonic works)
	endr
	; TTSZ
	rept 4
		dc.w TCard_TTSZ-Map_TitleCard	; TECHNO TEST
	endr
	zonewarning	Map_TitleCard_Zones,(2*4)
; Some instructions for title card letters.
;
; First value: Always zero.
;
; Second value: Letter size. 2 for short letters like I and L, 6 for medium letters like A, B, C, D, $A for long letters like W, O. $E for two medium letters like ST.
;
; Third value: Always $84.
;
; Fourth value: Tile. Start at $CD for the first letter, unless E, N, O, or Z,
; add tile counts for the next, i.e. if letter 1 is A, letter 2 would be $CD + 6.

TCard_Banner:
		dc.w $10
		dc.b  $58, 9, $84, $90, $FF, $E8
		dc.b  $58, 9, $84, $96, 0, 0
		dc.b  $90,  $F, $84, $80, $FF, $E0
		dc.b  $90,  $F, $84, $80, 0, 0
		dc.b  $B0,  $F, $84, $80, $FF, $E0
		dc.b  $B0,  $F, $84, $80, 0, 0
		dc.b  $D0,  $F, $84, $80, $FF, $E0
		dc.b  $D0,  $F, $84, $80, 0, 0
		dc.b  $F0,  $F, $84, $80, $FF, $E0
		dc.b  $F0,  $F, $84, $80, 0, 0
		dc.b  $10,  $F, $84, $80, $FF, $E0
		dc.b  $10,  $F, $84, $80, 0, 0
		dc.b  $30,  $F, $84, $80, $FF, $E0
		dc.b  $30,  $F, $84, $80, 0, 0
		dc.b  $50,  $F, $84, $80, $FF, $E0
		dc.b  $50,  $F, $84, $80, 0, 0
TCard_ACT:
		dc.w 2
		dc.b  $10, 9, $84, $B7, $FF, $E4
		dc.b	0,  $F, $84, $BD, $FF, $F5
TCard_ZONE:
		dc.w 4
		dc.b	0, 6, $84, $B1, $FF, $DC		; Z
		dc.b	0,  $A, $84, $A8, $FF, $EC		; O
		dc.b	0, 6, $84, $A2, 0, 4			; N
		dc.b	0, 6, $84, $9C, 0, $14			; E
TCard_GHZ:
		dc.w 9	; nine letters
		dc.b $0, $6, $84, $CD, $FF, $F8			; G
		dc.b $0, $6, $84, $D3, $0, $8			; R
		dc.b $0, $6, $84, $9C, $0, $18			; E
		dc.b $0, $6, $84, $9C, $0, $28			; E
		dc.b $0, $6, $84, $A2, $0, $38			; N
	
		dc.b $0, $6, $84, $D9, $0, $50			; H
		dc.b $0, $2, $84, $DF, $0, $60			; I
		dc.b $0, $2, $84, $E2, $0, $68			; L
		dc.b $0, $2, $84, $E2, $0, $70			; L
TCard_NHZ:
		dc.w 11
		dc.b	0,$6, $84, $A2, $FF, $B0		; N
		dc.b	0,$6, $84, $9C, $FF, $C0		; E
		dc.b	0,$A, $84, $CD, $FF, $D0		; W
		dc.b	0,$E, $84, $D6, $FF, $E8		; TR
		dc.b    0,$A, $84, $A8,   0,   8		; O
		dc.b	0,$A, $84, $E2,   0, $20		; GI
		dc.b	0,$6, $84, $EB,   0, $38		; C

		dc.b	0, 6, $84, $F1,   0, $58		; H
		dc.b	0, 2, $84, $E8,   0, $68		; I
		dc.b	0, 6, $84, $E2,   0, $70		; G
		dc.b	0, 6, $84, $F1,   0, $80		; H
TCard_SSLZ:
		dc.w 11	; eleven letters
		dc.b $0, $6, $84, $CD, $FF, $E8			; S
		dc.b $0, $6, $84, $9C, $FF, $F8			; E
		dc.b $0, $6, $84, $D3, $0, $8			; A
		dc.b $0, $6, $84, $CD, $0, $18			; S
		dc.b $0, $2, $84, $D9, $0, $28			; I
		dc.b $0, $6, $84, $DC, $0, $30			; D
		dc.b $0, $6, $84, $9C, $0, $40			; E

		dc.b $0, $2, $84, $E2, $0, $58			; L
		dc.b $0, $6, $84, $D3, $0, $60			; A
		dc.b $0, $6, $84, $A2, $0, $70			; N
		dc.b $0, $6, $84, $DC, $0, $80			; D
TCard_TTPZ:
		dc.w 7 ; seven letters
		dc.b $0, $6, $84, $CD, $FF,$F0			; T
		dc.b $0, $6, $84, $D3, $0, $0			; R
		dc.b $0, $6, $84, $9C, $0, $10			; E
		dc.b $0, $6, $84, $9C, $0, $20			; E

		dc.b $0, $6, $84, $CD, 0,  $38			; T
		dc.b $0, $A, $84, $A8, 0,  $48			; O
		dc.b $0, $6, $84, $D9, $0, $60			; P

TCard_CCZ:
		dc.w 14
		dc.b	$0, $A, $84, $CD, $FF, $90		; CL
		dc.b	$0, $A, $84, $A8, $FF, $A8		; O
		dc.b	$0, $6, $84, $CD, $FF, $C0		; C
		dc.b	$0, $6, $84, $D6, $FF, $D0		; K
		dc.b	$0, $A, $84, $DC, $FF, $E0		; W
		dc.b    $0, $A, $84, $A8, $FF, $F8		; O
		dc.b	$0, $6, $84, $E5, 0,   $10		; R
		dc.b	$0, $6, $84, $D6, 0,   $20		; K

		dc.b	$0, $6, $84, $CD, 0,   $38		; C
		dc.b	$0, $6, $84, $EB, 0,   $48		; A
		dc.b	$0, $E, $84, $F1, 0,   $58		; ST
		dc.b	$0, $2, $84, $D3, 0,   $78		; L
		dc.b	$0, $6, $84, $9C, 0,   $80		; E

TCard_MMZ:
		dc.w 10
		dc.b	0,  $A,	$84, $59+$80, $FF, $B0
		dc.b	0,   6,	$84, $6E+$80, $FF, $C8
		dc.b	0,   6,	$84, $68+$80, $FF, $D8
		dc.b	0,   6,	$84, $4D+$80, $FF, $E8
		dc.b	0,   6,	$84, $62+$80, $FF, $F8
		dc.b	0,  $A,	$84, $28+$80,   0,	 8
		dc.b	0,  $A,	$84, $28+$80,   0, $20
		dc.b	0,  $A,	$84, $59+$80,   0, $38
		dc.b	0,  $E,	$84, $4D+$80,   0, $58
		dc.b	0,   2,	$84, $56+$80,   0, $78
TCard_DEZ:
		dc.w 8
		dc.b	0, 6, $84, $D3, $FF, $F8		; D
		dc.b	0, 6, $84, $9C, 0, 8			; E
		dc.b	0, 6, $84, $CD, 0, $18			; A
		dc.b	0, 6, $84, $E5, 0, $28			; T
		dc.b	0, 6, $84, $DF, 0, $38			; H

		dc.b	0, 6, $84, $9C, 0, $50			; E
		dc.b	0, 6, $84, $D9, 0, $60			; G
		dc.b	0, 6, $84, $D9, 0, $70			; G
TCard_TTSZ:
		dc.w 10
		dc.b	0, 6, $84, $CD, $FF, $E0		; T
		dc.b	0, 6, $84, $9C, $FF, $F0		; E
		dc.b	0, 6, $84, $D3,   0,   0		; C
		dc.b	0, 6, $84, $D9,   0, $10		; H
		dc.b	0, 6, $84, $A2,   0, $20		; N
		dc.b    0,$A, $84, $A8,   0, $30		; O

		dc.b	0, 6, $84, $CD,   0, $50		; T
		dc.b	0, 6, $84, $9C,   0, $60		; E
		dc.b	0, 6, $84, $DF,   0, $70		; S
		dc.b	0, 6, $84, $CD,   0, $80		; T
		even