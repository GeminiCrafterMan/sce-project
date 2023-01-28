AniKnuckles:	offsetTable
		offsetTableEntry.w KnuxAni_Walk
		offsetTableEntry.w KnuxAni_Run
		offsetTableEntry.w KnuxAni_Roll
		offsetTableEntry.w KnuxAni_Roll2
		offsetTableEntry.w KnuxAni_Push
		offsetTableEntry.w KnuxAni_Idle
		offsetTableEntry.w byte_18008
		offsetTableEntry.w byte_18032
		offsetTableEntry.w byte_18037
		offsetTableEntry.w byte_1803C
		offsetTableEntry.w byte_18048
		offsetTableEntry.w byte_1805F
		offsetTableEntry.w byte_18062
		offsetTableEntry.w byte_18088
		offsetTableEntry.w byte_1808F
		offsetTableEntry.w byte_18092
		offsetTableEntry.w byte_1809E
		offsetTableEntry.w byte_180A2
		offsetTableEntry.w byte_180A6
		offsetTableEntry.w byte_180AC
		offsetTableEntry.w byte_180B5
		offsetTableEntry.w byte_180B8
		offsetTableEntry.w byte_180BF
		offsetTableEntry.w byte_180C2
		offsetTableEntry.w byte_180C5
		offsetTableEntry.w byte_180C8
		offsetTableEntry.w byte_180CB
		offsetTableEntry.w byte_180CE
		offsetTableEntry.w byte_180D1
		offsetTableEntry.w byte_180D4
		offsetTableEntry.w byte_180D8
		offsetTableEntry.w byte_180FE
		offsetTableEntry.w byte_180E0
		offsetTableEntry.w byte_180E3
		offsetTableEntry.w byte_180E8
		offsetTableEntry.w byte_180EC
		offsetTableEntry.w byte_180F0
		offsetTableEntry.w KnuxAni_Mach

KnuxAni_Walk:	dc.b  $FF,   7,	  8,   1,   2,	 3,   4,   5,	6, afEnd
KnuxAni_Run:	dc.b  $FF, $21,	$22, $23, $24, afEnd, afEnd, afEnd, afEnd, afEnd
KnuxAni_Roll:	dc.b  $FE, $9A,	$96, $9A, $97, $9A, $98, $9A, $99, afEnd
KnuxAni_Roll2:	dc.b  $FE, $9A,	$96, $9A, $97, $9A, $98, $9A, $99, afEnd
KnuxAni_Push:	dc.b  $FD, $CE,	$CF, $D0, $D1, afEnd, afEnd, afEnd, afEnd, afEnd
KnuxAni_Idle:	dc.b    5, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56
		dc.b  $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56
		dc.b  $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $D2, $D2, $D2, $D3, $D3, $D3, $D2, $D2, $D2
		dc.b  $D3, $D3, $D3, $D2, $D2, $D2, $D3, $D3, $D3, $D2, $D2, $D2, $D3, $D3, $D3, $D2, $D2, $D2, $D3, $D3
		dc.b  $D3, $D2, $D2, $D2, $D3, $D3, $D3, $D2, $D2, $D2, $D3, $D3, $D3, $D2, $D2, $D2, $D3, $D3, $D3, $D2
		dc.b  $D2, $D2, $D3, $D3, $D3, $D4, $D4, $D4, $D4, $D4, $D7, $D8, $D9, $DA, $DB, $D8, $D9, $DA, $DB, $D8
		dc.b  $D9, $DA, $DB, $D8, $D9, $DA, $DB, $D8, $D9, $DA, $DB, $D8, $D9, $DA, $DB, $D8, $D9, $DA, $DB, $D8
		dc.b  $D9, $DA, $DB, $DC, 221, 220, 221, 222, 222, 216, 215, 255
byte_18008:	dc.b    3, $9F, $9F, $A0, $A0, $A1, $A1, $A2, $A2, $A3, $A3, $A4, $A4, $A5, $A5, $A5, $A5, $A5, $A5, $A5
		dc.b  $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A6, $A6, $A6, $A7, $A7, $A7, $A8, $A8, $A9, $A9, $AA, $AA
		dc.b  afBack,   6
byte_18032:	dc.b	5, $D5,	$D6, afBack,   1
byte_18037:	dc.b	5, $9B,	$9C, afBack,   1
byte_1803C:	dc.b	0, $86,	$87, $86, $88, $86, $89, $86, $8A, $86,	$8B, afEnd
byte_18048:	dc.b    9, $BA, $C5, $C6, $C6, $C6, $C6, $C6, $C6, $C7, $C7, $C7, $C7, $C7, $C7, $C7, $C7, $C7, $C7, $C7
		dc.b  $C7, afChange,   id_Walk
byte_1805F:	dc.b   $F, $8F,	afEnd
byte_18062:	dc.b    3, $A1, $A1, $A2, $A2, $A3, $A3, $A4, $A4, $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A5
		dc.b  $A5, $A5, $A5, $A5, $A6, $A6, $A6, $A7, $A7, $A7, $A8, $A8, $A9, $A9, $AA, $AA, afBack,   6
byte_18088:	dc.b	3, $9D,	$9E, $9F, $A0, afChange,   id_Walk
byte_1808F:	dc.b	7, $C0,	afEnd
byte_18092:	dc.b	5, $C0,	$C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8,	$C9, afEnd
byte_1809E:	dc.b  $2F, $8E,	afChange,   id_Walk
byte_180A2:	dc.b	1, $AE,	$AF, afEnd
byte_180A6:	dc.b   $F, $43,	$43, $43, afBack,	 1
byte_180AC:	dc.b	5, $B1,	$B2, $B2, $B2, $B3, $B4, afBack,	1
byte_180B5:	dc.b  $13, $91,	afEnd
byte_180B8:	dc.b   $B, $B0,	$B0,   3,   4, afChange,   id_Walk
byte_180BF:	dc.b  $20, $AC,	afEnd
byte_180C2:	dc.b  $20, $AD,	afEnd
byte_180C5:	dc.b  $20, $AB,	afEnd
byte_180C8:	dc.b	9, $8C,	afEnd
byte_180CB:	dc.b  $40, $8D,	afEnd
byte_180CE:	dc.b	9, $8C,	afEnd
byte_180D1:	dc.b  $77,   0,	afEnd
byte_180D4:	dc.b  $13, $D0,	$D1, afEnd
byte_180D8:	dc.b	3, $CF,	$C8, $C9, $CA, $CB, afBack,   4
byte_180E0:	dc.b  $1F, $C0,	afEnd
byte_180E3:	dc.b	7, $CA,	$CB, afBack,   1
byte_180E8:	dc.b   $F, $CD,	afChange,   id_Walk
byte_180EC:	dc.b   $F, $9C,	afChange,   id_Walk
byte_180F0:	dc.b	7, $B1,	$B3, $B3, $B3, $B3, $B3, $B3, $B2, $B3,	$B4, $B3, afBack,	 4
byte_180FE:	dc.b	2, $EB,	$EB, $EC, $ED, $EC, $ED, $EC, $ED, $EC,	$ED, $EC, $ED, afChange,   id_Walk
KnuxAni_Mach:	dc.b  $FF, $21,	$22, $23, $24, afEnd, afEnd, afEnd, afEnd, afEnd
	even

; Frame IDs
	phase 0 ; Reset ds.b value to 0
frK_Null:		ds.b 1
frK_Walk11:		ds.b 1
frK_Walk12:		ds.b 1
frK_Walk13:		ds.b 1
frK_Walk14:		ds.b 1
frK_Walk15:		ds.b 1
frK_Walk16:		ds.b 1
frK_Walk17:		ds.b 1
frK_Walk18:		ds.b 1
frK_Walk2X:		ds.b 8
frK_Walk3X:		ds.b 8
frK_Walk4X:		ds.b 8
frK_Run11:		ds.b 1
frK_Run12:		ds.b 1
frK_Run13:		ds.b 1
frK_Run14:		ds.b 1
frK_Run2X:		ds.b 4
frK_Run3X:		ds.b 4
frK_Run4X:		ds.b 4
frK_TumbleWalk1:	ds.b 1
frK_TumbleWalkX:	ds.b 11
frK_TumbleStand1:	ds.b 1
frK_TumbleStandX:	ds.b 11
frK_TumbleHCylinder1:	ds.b 1
frK_TumbleHCylinderX:	ds.b 11
frK_Turntable1:		ds.b 1
frK_TurntableX:		ds.b 6
frK_PoleSwingH1:		ds.b 1
frK_PoleSwingHX:	ds.b 6
frK_PoleSwingV1:	ds.b 1
frK_PoleSwingVX:	ds.b 5
frK_TumbleVCylinder1:	ds.b 1
frK_TumbleVCylinderX:	ds.b 14
frK_RopeSwing1:		ds.b 1
frK_RopeSwingX:		ds.b 7
frK_MonkeyBars1:	ds.b 1
frK_MonkeyBarsX:	ds.b 5
frK_Spindash1:		ds.b 1
frK_Spindash2:		ds.b 1
frK_Spindash3:		ds.b 1
frK_Spindash4:		ds.b 1
frK_Spindash5:		ds.b 1
frK_Spindash6:		ds.b 1
frK_Hurt1:			ds.b 1
frK_Hurt2:			ds.b 1
frK_Spring:		ds.b 1
frK_MGZHang:		ds.b 1
frK_Hang1:			ds.b 1
frK_Hang2:			ds.b 1
frK_Hang3:			ds.b 1
frK_HangPush:		ds.b 1
frK_Shimmy1:		ds.b 1
frK_Shimmy2:		ds.b 1
frK_Roll1:			ds.b 1
frK_Roll2:			ds.b 1
frK_Roll3:			ds.b 1
frK_Roll4:			ds.b 1
frK_Roll5:			ds.b 1
frK_Duck1:			ds.b 1
frK_Duck2:			ds.b 1
frK_Skid1:			ds.b 1
frK_Skid2:			ds.b 1
frK_Balance1:		ds.b 1
frK_Balance2:		ds.b 1
frK_Balance3:		ds.b 1
frK_Balance4:		ds.b 1
frK_Balance5:		ds.b 1
frK_Balance6:		ds.b 1
frK_Balance7:		ds.b 1
frK_Balance8:		ds.b 1
frK_Balance9:		ds.b 1
frK_Balance10:		ds.b 1
frK_Balance11:		ds.b 1
frK_Balance12:		ds.b 1
frK_Death:			ds.b 1
frK_Burnt:			ds.b 1
frK_Drown:			ds.b 1
frK_LZHang1:		ds.b 1
frK_LZHang2:		ds.b 1
frK_GetAir:			ds.b 1
frK_Victory1:		ds.b 1
frK_Victory2:		ds.b 1
frK_Victory3:		ds.b 1
frK_Victory4:		ds.b 1
frK_LZHangV1:		ds.b 1
frK_LZHangV2:		ds.b 1
frK_Climb1:			ds.b 1
frK_Climb2:			ds.b 1
frK_Climb3:			ds.b 1
frK_Climb4:			ds.b 1
frK_Climb5:			ds.b 1
frK_Climb6:			ds.b 1
frK_ClimbUp1:		ds.b 1
frK_ClimbUp2:		ds.b 1
frK_ClimbUp3:		ds.b 1
frK_Float1:			ds.b 1
frK_Float2:			ds.b 1
frK_Float3:			ds.b 1
frK_Float4:			ds.b 1
frK_Float5:			ds.b 1
frK_Float6:			ds.b 1
frK_Float7:			ds.b 1
frK_Float8:			ds.b 1
frK_GlideFall1:		ds.b 1
frK_GlideFall2:		ds.b 1
frK_GlideSlide1:	ds.b 1
frK_GlideSlide2:	ds.b 1
frK_Push1:			ds.b 1
frK_Push2:			ds.b 1
frK_Push3:			ds.b 1
frK_Push4:			ds.b 1
frK_Idle2:			ds.b 1
frK_Idle3:			ds.b 1
frK_LookUp1:		ds.b 1
frK_LookUp2:		ds.b 1
frK_Idle4:			ds.b 1
frK_Idle5:			ds.b 1
frK_Idle6:			ds.b 1
frK_Idle7:			ds.b 1
frK_Idle8:			ds.b 1
frK_Idle9:			ds.b 1
frK_IdleA:			ds.b 1
frK_IdleB:			ds.b 1
frK_Fuck:			ds.b 12
frK_Transform1:		ds.b 1
frK_Transform2:		ds.b 1
frK_Transform3:		ds.b 1
frK_Transform4:		ds.b 1
frK_Fuck2:			ds.b 12
frK_Last:			ds.b 0
	even
	dephase