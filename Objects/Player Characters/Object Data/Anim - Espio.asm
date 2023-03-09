; ---------------------------------------------------------------------------
; Espio Animation Script
; ---------------------------------------------------------------------------

Ani_Espio:
AniEspio:				offsetTable
		offsetTableEntry.w EspAni_Walk
		offsetTableEntry.w EspAni_Run
		offsetTableEntry.w EspAni_Spin
		offsetTableEntry.w EspAni_Spin2
		offsetTableEntry.w EspAni_Push
		offsetTableEntry.w EspAni_Wait
		offsetTableEntry.w EspAni_Balance
		offsetTableEntry.w EspAni_LookUp
		offsetTableEntry.w EspAni_Duck
		offsetTableEntry.w EspAni_Spindash
		offsetTableEntry.w EspAni_MGZHang
		offsetTableEntry.w EspAni_Balance2
		offsetTableEntry.w EspAni_Stop
		offsetTableEntry.w EspAni_Float1
		offsetTableEntry.w EspAni_Float2
		offsetTableEntry.w EspAni_Spring
		offsetTableEntry.w EspAni_LZHang
		offsetTableEntry.w EspAni_Victory
		offsetTableEntry.w EspAni_Hang
		offsetTableEntry.w EspAni_GetAir
		offsetTableEntry.w EspAni_Burnt
		offsetTableEntry.w EspAni_Drown
		offsetTableEntry.w EspAni_Death
		offsetTableEntry.w EspAni_Slide
		offsetTableEntry.w EspAni_Hurt
		offsetTableEntry.w EspAni_Zapped
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Mach
		offsetTableEntry.w EspAni_Transform
		offsetTableEntry.w EspAni_Walk
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_Null
		offsetTableEntry.w EspAni_MonkeyBars

EspAni_Walk:		dc.b  $FF, frE_Walk17,	frE_Walk18,   frE_Walk11,   frE_Walk12,	 frE_Walk13,   frE_Walk14,   frE_Walk15,	frE_Walk16, afEnd
EspAni_Run:			dc.b  $FF, frE_Run11,	frE_Run12, frE_Run13, frE_Run14, afEnd, afEnd, afEnd, afEnd, afEnd
EspAni_Spin:		dc.b  $FE, frE_Spin11,	frE_Spin12, frE_Spin13, frE_Spin14, frE_Spin15, frE_Spin16, afEnd
EspAni_Spin2:		dc.b  $FE, frE_Spin11,	frE_Spin12, frE_Spin13, frE_Spin14, frE_Spin15, frE_Spin16, afEnd
EspAni_Push:		dc.b  $FD, frE_Push1,	frE_Push2, frE_Push3, frE_Push4, afEnd, afEnd, afEnd, afEnd, afEnd
	; quite possibly the shortest out of anyone
EspAni_Wait:		dc.b    5, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1
					dc.b  frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1
					dc.b  frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle1
					dc.b  frE_Idle1, frE_Idle1, frE_Idle1, frE_Idle2
					dc.b  frE_Idle3, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle6, frE_Idle3, frE_Idle4, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle5, frE_Idle4, afBack, 24
EspAni_Balance:		dc.b	7, frE_Balance21, frE_Balance21, frE_Balance21, frE_Balance22, frE_Balance23, frE_Balance23, frE_Balance23, frE_Balance22, afEnd
EspAni_LookUp:		dc.b	5, frE_LookUp1,	frE_LookUp2, afBack,   1
EspAni_Duck:		dc.b	5, frE_Duck1,	frE_Duck2, afBack,   1
EspAni_Spindash:	dc.b	0, frE_Spindash1,	frE_Spindash2, frE_Spindash3, frE_Spindash4, frE_Spindash5, frE_Spindash6, afEnd
EspAni_MGZHang:		dc.b   $F, frE_MGZHang, afEnd
EspAni_Balance2:	dc.b	5, frE_Balance11, frE_Balance11, frE_Balance11, frE_Balance12, frE_Balance13, frE_Balance13, frE_Balance13, frE_Balance12, afEnd
EspAni_Stop:		dc.b	3, frE_Skid1,	frE_Skid2, frE_Skid3, frE_SkidT, afChange,   id_Walk
EspAni_Float1:		dc.b	7, frE_Float1, afEnd
EspAni_Float2:		dc.b	7, frE_Float1,	frE_Float2, frE_Float3, frE_Float4, frE_Float5, frE_Float6, frE_Float7, frE_Float8, afEnd
EspAni_Spring:		dc.b	2, frE_Spring, afEnd
EspAni_LZHang:		dc.b	1, frE_LZHang1,	frE_LZHang2, afEnd
EspAni_Victory:		dc.b	7, frE_Victory1,frE_Victory2, afBack,	 1
EspAni_Hang:		dc.b  $13, frE_Hang1,	frE_Hang2,	frE_Hang3,	frE_Hang2,	afEnd
EspAni_GetAir:		dc.b   $B, frE_GetAir,	frE_GetAir,   frE_Walk13,   frE_Walk14, afChange,   id_Walk
EspAni_Burnt:		dc.b  $20, frE_Burnt, afEnd
EspAni_Drown:		dc.b  $20, frE_Drown, afEnd
EspAni_Death:		dc.b   $D, frE_Death1, frE_Death2, afBack, 1
EspAni_Slide:		dc.b	9, frE_Slide1, frE_Slide2, afBack, 1
EspAni_Hurt:		dc.b	9, frE_Hurt, afEnd
EspAni_Zapped:		dc.b	9, frE_Hurt, afEnd
EspAni_Null:		dc.b  $77,   frE_Null, afEnd
EspAni_Mach:		dc.b  $FF, frE_Mach11,	frE_Mach12,	frE_Mach13,	frE_Mach14, afEnd, afEnd, afEnd, afEnd, afEnd
EspAni_Transform:	dc.b	2, frE_Transform1, frE_Transform1, frE_Transform2, frE_Transform2, frE_Transform3, frE_Transform4, frE_Transform5, frE_Transform4, frE_Transform5, frE_Transform4, frE_Transform5, frE_Transform4, frE_Transform5, afChange,   id_Walk
EspAni_MonkeyBars:	dc.b  $7F, frE_MonkeyBars6, frE_MonkeyBars4, afEnd
	even

; Frame IDs
	phase 0 ; Reset ds.b value to 0
frE_Null:		ds.b 1
frE_Walk11:		ds.b 1
frE_Walk12:		ds.b 1
frE_Walk13:		ds.b 1
frE_Walk14:		ds.b 1
frE_Walk15:		ds.b 1
frE_Walk16:		ds.b 1
frE_Walk17:		ds.b 1
frE_Walk18:		ds.b 1
frE_Walk2X:		ds.b 8
frE_Walk3X:		ds.b 8
frE_Walk4X:		ds.b 8
frE_Run11:		ds.b 1
frE_Run12:		ds.b 1
frE_Run13:		ds.b 1
frE_Run14:		ds.b 1
frE_Run2X:		ds.b 4
frE_Run3X:		ds.b 4
frE_Run4X:		ds.b 4
frE_TumbleWalk1:	ds.b 1
frE_TumbleWalkX:	ds.b 11
frE_TumbleStand1:	ds.b 1
frE_TumbleStandX:	ds.b 11
frE_TumbleHCylinder1:	ds.b 1
frE_TumbleHCylinderX:	ds.b 11
frE_Turntable1:		ds.b 1
frE_TurntableX:		ds.b 6
frE_PoleSwingH1:		ds.b 1
frE_PoleSwingHX:	ds.b 6
frE_PoleSwingV1:	ds.b 1
frE_PoleSwingVX:	ds.b 5
frE_TumbleVCylinder1:	ds.b 1
frE_TumbleVCylinderX:	ds.b 14
frE_RopeSwing1:		ds.b 1
frE_RopeSwingX:		ds.b 7
frE_MonkeyBars1:	ds.b 1
frE_MonkeyBars2:	ds.b 1
frE_MonkeyBars3:	ds.b 1
frE_MonkeyBars4:	ds.b 1
frE_MonkeyBars5:	ds.b 1
frE_MonkeyBars6:	ds.b 1
frE_Spindash1:		ds.b 1
frE_Spindash2:		ds.b 1
frE_Spindash3:		ds.b 1
frE_Spindash4:		ds.b 1
frE_Spindash5:		ds.b 1
frE_Spindash6:		ds.b 1
frE_Hurt:			ds.b 1
frE_Spring:			ds.b 1
frE_MGZHang:		ds.b 1
frE_Hang1:			ds.b 1
frE_Hang2:			ds.b 1
frE_Hang3:			ds.b 1
frE_HangPush:		ds.b 1
frE_Shimmy1:		ds.b 1
frE_Shimmy2:		ds.b 1
frE_Spin11:			ds.b 1
frE_Spin12:			ds.b 1
frE_Spin13:			ds.b 1
frE_Spin14:			ds.b 1
frE_Spin15:			ds.b 1
frE_Spin16:			ds.b 1
frE_Spin2X:			ds.b 6
frE_Spin3X:			ds.b 6
frE_Spin4X:			ds.b 6
frE_Duck1:			ds.b 1
frE_Duck2:			ds.b 1
frE_Skid1:			ds.b 1
frE_Skid2:			ds.b 1
frE_Skid3:			ds.b 1
frE_SkidT:			ds.b 1
frE_Balance11:		ds.b 1
frE_Balance12:		ds.b 1
frE_Balance13:		ds.b 1
frE_Balance21:		ds.b 1
frE_Balance22:		ds.b 1
frE_Balance23:		ds.b 1
frE_Death1:			ds.b 1
frE_Death2:			ds.b 1
frE_Burnt:			ds.b 1
frE_Drown:			ds.b 1
frE_LZHang1:		ds.b 1
frE_LZHang2:		ds.b 1
frE_GetAir:			ds.b 1
frE_Victory1:		ds.b 1
frE_Victory2:		ds.b 1
frE_LZHangV1:		ds.b 1
frE_LZHangV2:		ds.b 1
frE_Push1:			ds.b 1
frE_Push2:			ds.b 1
frE_Push3:			ds.b 1
frE_Push4:			ds.b 1
frE_Idle1:			ds.b 1
frE_Idle2:			ds.b 1
frE_Idle3:			ds.b 1
frE_Idle4:			ds.b 1
frE_Idle5:			ds.b 1
frE_Idle6:			ds.b 1
frE_LookUp1:		ds.b 1
frE_LookUp2:		ds.b 1
frE_Float1:			ds.b 1
frE_Float2:			ds.b 1
frE_Float3:			ds.b 1
frE_Float4:			ds.b 1
frE_Float5:			ds.b 1
frE_Float6:			ds.b 1
frE_Float7:			ds.b 1
frE_Float8:			ds.b 1
frE_Slide1:			ds.b 1
frE_Slide2:			ds.b 1
frE_Transform1:		ds.b 1
frE_Transform2:		ds.b 1
frE_Transform3:		ds.b 1
frE_Transform4:		ds.b 1
frE_Transform5:		ds.b 1
frE_Mach11:			ds.b 1
frE_Mach12:			ds.b 1
frE_Mach13:			ds.b 1
frE_Mach14:			ds.b 1
frE_Mach2X:			ds.b 4
frE_Mach3X:			ds.b 4
frE_Mach4X:			ds.b 4
frE_Last:			ds.b 0
	even
	dephase