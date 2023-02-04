; ---------------------------------------------------------------------------
; Mighty Animation Script
; ---------------------------------------------------------------------------

Ani_Mighty:
AniMighty:				offsetTable
		offsetTableEntry.w MtyAni_Walk
		offsetTableEntry.w MtyAni_Run
		offsetTableEntry.w MtyAni_Roll
		offsetTableEntry.w MtyAni_Roll2
		offsetTableEntry.w MtyAni_Push
		offsetTableEntry.w MtyAni_Wait
		offsetTableEntry.w MtyAni_Balance
		offsetTableEntry.w MtyAni_LookUp
		offsetTableEntry.w MtyAni_Duck
		offsetTableEntry.w MtyAni_Spindash
		offsetTableEntry.w MtyAni_MGZHang
		offsetTableEntry.w MtyAni_Balance2
		offsetTableEntry.w MtyAni_Stop
		offsetTableEntry.w MtyAni_Float1
		offsetTableEntry.w MtyAni_Float2
		offsetTableEntry.w MtyAni_Spring
		offsetTableEntry.w MtyAni_LZHang
		offsetTableEntry.w MtyAni_Victory
		offsetTableEntry.w MtyAni_Hang
		offsetTableEntry.w MtyAni_GetAir
		offsetTableEntry.w MtyAni_Burnt
		offsetTableEntry.w MtyAni_Drown
		offsetTableEntry.w MtyAni_Death
		offsetTableEntry.w MtyAni_Slide
		offsetTableEntry.w MtyAni_Hurt
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Mach
		offsetTableEntry.w MtyAni_Transform
		offsetTableEntry.w MtyAni_Fall
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null
		offsetTableEntry.w MtyAni_Null

MtyAni_Walk:		dc.b  $FF, frM_Walk17, frM_Walk18, frM_Walk11, frM_Walk12, frM_Walk13, frM_Walk14, frM_Walk15, frM_Walk16, afEnd
MtyAni_Run:			dc.b  $FF, frM_Run11, frM_Run12, frM_Run13, frM_Run14, afEnd, afEnd, afEnd, afEnd, afEnd
MtyAni_Roll:		dc.b  $FE, frM_Roll1, frM_Roll2, frM_Roll1, frM_Roll3, frM_Roll1, frM_Roll4, frM_Roll1, frM_Roll5, afEnd
MtyAni_Roll2:		dc.b  $FE, frM_Roll1, frM_Roll2, frM_Roll1, frM_Roll3, frM_Roll1, frM_Roll4, frM_Roll1, frM_Roll5, afEnd
MtyAni_Push:		dc.b  $FD, frM_Push1, frM_Push2, frM_Push3, frM_Push4, afEnd, afEnd, afEnd, afEnd, afEnd
MtyAni_Wait:		dc.b	5, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1
		dc.b frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1
		dc.b frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle1
		dc.b frM_Idle1, frM_Idle1, frM_Idle1, frM_Idle2, frM_Idle3, frM_Idle3, frM_Idle3, frM_Idle3, frM_Idle4, frM_Idle4, frM_Idle4, frM_Idle4, frM_Idle3, frM_Idle3, frM_Idle3, frM_Idle3
		dc.b frM_Idle4, frM_Idle4, frM_Idle4, frM_Idle4, frM_Idle3, frM_Idle3, frM_Idle3, frM_Idle3, frM_Idle4, frM_Idle4, frM_Idle4, frM_Idle4, frM_Idle3, frM_Idle3, frM_Idle3, frM_Idle3
		dc.b frM_Idle5, frM_Idle6, frM_Idle6, frM_Idle6, frM_Idle6, frM_Idle7, frM_Idle7, frM_Idle7, frM_Idle7, frM_Idle6, frM_Idle6, frM_Idle6, frM_Idle6, frM_Idle7, frM_Idle7, frM_Idle7
		dc.b frM_Idle7, frM_Idle6, frM_Idle6, frM_Idle6, frM_Idle6, frM_Idle6, frM_Idle5, frM_Idle8, frM_Idle9, frM_IdleA, frM_IdleA, frM_IdleA, frM_IdleA, frM_IdleA, frM_IdleB, afEnd
MtyAni_Balance:		dc.b	7, frM_Balance21, frM_Balance22, frM_Balance23, afEnd
MtyAni_LookUp:		dc.b	5, frM_LookUp1, frM_LookUp2, afBack, 1
MtyAni_Duck:		dc.b	5, frM_Duck1, frM_Duck2, afBack, 1
MtyAni_Spindash:	dc.b	0, frM_Spindash1, frM_Spindash2, frM_Spindash1, frM_Spindash3, frM_Spindash1, frM_Spindash4, frM_Spindash1, frM_Spindash5, frM_Spindash1,	frM_Spindash6, afEnd
MtyAni_MGZHang:		dc.b   $F, frM_MGZHang, afEnd
MtyAni_Balance2:	dc.b	5, frM_Balance11, frM_Balance12, frM_Balance13, afEnd
MtyAni_Stop:		dc.b	3, frM_Skid1, frM_Skid2, frM_Skid3, frM_SkidT, afChange, id_Walk
MtyAni_Float1:		dc.b	7, frM_Float1, afEnd
MtyAni_Float2:		dc.b	7, frM_Float1, frM_Float2, frM_Float3, frM_Float4, frM_Float5, frM_Float6, frM_Float7, frM_Float8, afEnd
MtyAni_Spring:		dc.b	2, frM_Spring, afEnd
MtyAni_LZHang:		dc.b	1, frM_LZHang1, frM_LZHang2, afEnd
MtyAni_Victory:		dc.b	5, frM_Victory1, frM_Victory2, frM_Victory3, frM_Victory4, afBack, 2
MtyAni_Hang:		dc.b  $13, frM_Hang1, frM_Hang2, frM_Hang3, frM_Hang2, afEnd
MtyAni_GetAir:		dc.b   $B, frM_GetAir, frM_GetAir, frM_Walk13, frM_Walk14, afChange, id_Walk
MtyAni_Burnt:		dc.b  $20, frM_Burnt, afEnd
MtyAni_Drown:		dc.b  $20, frM_Drown, afEnd
MtyAni_Death:		dc.b  $20, frM_Death, afEnd
MtyAni_Slide:		dc.b	9, frM_Slide1, frM_Slide2, afEnd
MtyAni_Hurt:		dc.b	9, frM_Hurt1, frM_Hurt2, afEnd
MtyAni_Null:		dc.b  $77, frM_Null, afEnd
MtyAni_Mach:		dc.b  $FF, frM_Mach11, frM_Mach12, frM_Mach13, frM_Mach14, afEnd, afEnd, afEnd, afEnd, afEnd
MtyAni_Transform:	dc.b	2, frM_Transform1, frM_Transform1, frM_Transform2, frM_Transform2, frM_Transform3, frM_Transform4, frM_Transform5, frM_Transform4, frM_Transform5, frM_Transform4, frM_Transform5, frM_Transform4, frM_Transform5, afChange,   id_Walk
MtyAni_Fall:		dc.b	3, frM_Fall1, frM_Fall2, afEnd
MtyAni_Uncurl:		dc.b	3, frM_Uncurl1, frM_Uncurl2, afChange, id_Fall
	even

; Frame IDs
	phase 0 ; Reset ds.b value to 0
frM_Null:				ds.b 1
frM_Walk11:				ds.b 1
frM_Walk12:				ds.b 1
frM_Walk13:				ds.b 1
frM_Walk14:				ds.b 1
frM_Walk15:				ds.b 1
frM_Walk16:				ds.b 1
frM_Walk17:				ds.b 1
frM_Walk18:				ds.b 1
frM_Walk2X:				ds.b 8
frM_Walk3X:				ds.b 8
frM_Walk4X:				ds.b 8
frM_Run11:				ds.b 1
frM_Run12:				ds.b 1
frM_Run13:				ds.b 1
frM_Run14:				ds.b 1
frM_Run2X:				ds.b 4
frM_Run3X:				ds.b 4
frM_Run4X:				ds.b 4
frM_TumbleWalk1:		ds.b 1
frM_TumbleWalkX:		ds.b 11
frM_TumbleStand1:		ds.b 1
frM_TumbleStandX:		ds.b 11
frM_TumbleHCylinder1:	ds.b 1
frM_TumbleHCylinderX:	ds.b 11
frM_Turntable1:			ds.b 1
frM_TurntableX:			ds.b 6
frM_PoleSwingH1:		ds.b 1
frM_PoleSwingHX:		ds.b 6
frM_PoleSwingV1:		ds.b 1
frM_PoleSwingVX:		ds.b 5
frM_TumbleVCylinder1:	ds.b 1
frM_TumbleVCylinderX:	ds.b 14
frM_RopeSwing1:			ds.b 1
frM_RopeSwingX:			ds.b 7
frM_MonkeyBars1:		ds.b 1
frM_MonkeyBarsX:		ds.b 5
frM_Spindash1:			ds.b 1
frM_Spindash2:			ds.b 1
frM_Spindash3:			ds.b 1
frM_Spindash4:			ds.b 1
frM_Spindash5:			ds.b 1
frM_Spindash6:			ds.b 1
frM_Hurt1:				ds.b 1
frM_Hurt2:				ds.b 1
frM_Spring:				ds.b 1
frM_MGZHang:			ds.b 1
frM_Hang1:				ds.b 1
frM_Hang2:				ds.b 1
frM_Hang3:				ds.b 1
frM_HangPush:			ds.b 1
frM_Shimmy1:			ds.b 1
frM_Shimmy2:			ds.b 1
frM_Roll1:				ds.b 1
frM_Roll2:				ds.b 1
frM_Roll3:				ds.b 1
frM_Roll4:				ds.b 1
frM_Roll5:				ds.b 1
frM_Duck1:				ds.b 1
frM_Duck2:				ds.b 1
frM_Skid1:				ds.b 1
frM_Skid2:				ds.b 1
frM_Skid3:				ds.b 1
frM_SkidT:				ds.b 1
frM_Balance11:			ds.b 1
frM_Balance12:			ds.b 1
frM_Balance13:			ds.b 1
frM_Balance21:			ds.b 1
frM_Balance22:			ds.b 1
frM_Balance23:			ds.b 1
frM_Death:				ds.b 1
frM_Burnt:				ds.b 1
frM_Drown:				ds.b 1
frM_LZHang1:			ds.b 1
frM_LZHang2:			ds.b 1
frM_GetAir:				ds.b 1
frM_Victory1:			ds.b 1
frM_Victory2:			ds.b 1
frM_Victory3:			ds.b 1
frM_Victory4:			ds.b 1
frM_LZHangV1:			ds.b 1
frM_LZHangV2:			ds.b 1
frM_Push1:				ds.b 1
frM_Push2:				ds.b 1
frM_Push3:				ds.b 1
frM_Push4:				ds.b 1
frM_Idle1:				ds.b 1
frM_Idle2:				ds.b 1
frM_Idle3:				ds.b 1
frM_Idle4:				ds.b 1
frM_Idle5:				ds.b 1
frM_Idle6:				ds.b 1
frM_Idle7:				ds.b 1
frM_Idle8:				ds.b 1
frM_Idle9:				ds.b 1
frM_IdleA:				ds.b 1
frM_IdleB:				ds.b 1
frM_LookUp1:			ds.b 1
frM_LookUp2:			ds.b 1
frM_Float1:				ds.b 1
frM_Float2:				ds.b 1
frM_Float3:				ds.b 1
frM_Float4:				ds.b 1
frM_Float5:				ds.b 1
frM_Float6:				ds.b 1
frM_Float7:				ds.b 1
frM_Float8:				ds.b 1
frM_Slide1:				ds.b 1
frM_Slide2:				ds.b 1
frM_Transform1:			ds.b 1
frM_Transform2:			ds.b 1
frM_Transform3:			ds.b 1
frM_Transform4:			ds.b 1
frM_Transform5:			ds.b 1
frM_Mach11:				ds.b 1
frM_Mach12:				ds.b 1
frM_Mach13:				ds.b 1
frM_Mach14:				ds.b 1
frM_Mach2X:				ds.b 4
frM_Mach3X:				ds.b 4
frM_Mach4X:				ds.b 4
frM_Uncurl1:			ds.b 1
frM_Uncurl2:			ds.b 1
frM_Fall1:				ds.b 1
frM_Fall2:				ds.b 1
frM_Last:				ds.b 0
	even
	dephase