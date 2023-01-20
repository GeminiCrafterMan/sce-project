; ---------------------------------------------------------------------------
; Sonic Animation Script
; ---------------------------------------------------------------------------

AniSonic:
Ani_Sonic: 				offsetTable
SonAni_Walk_ptr:		offsetTableEntry.w SonAni_Walk
SonAni_Run_ptr:			offsetTableEntry.w SonAni_Run
SonAni_Roll_ptr:		offsetTableEntry.w SonAni_Roll
SonAni_Roll2_ptr:		offsetTableEntry.w SonAni_Roll2
SonAni_Push_ptr:		offsetTableEntry.w SonAni_Push
SonAni_Wait_ptr:		offsetTableEntry.w SonAni_Wait
SonAni_Balance_ptr:		offsetTableEntry.w SonAni_Balance
SonAni_LookUp_ptr:		offsetTableEntry.w SonAni_LookUp
SonAni_Duck_ptr:		offsetTableEntry.w SonAni_Duck
SonAni_Spindash_ptr:	offsetTableEntry.w SonAni_Spindash
SonAni_Whistle_ptr:		offsetTableEntry.w SonAni_Whistle
SonAni_MGZHang_ptr:		offsetTableEntry.w SonAni_MGZHang
SonAni_Balance2_ptr:	offsetTableEntry.w SonAni_Balance2
SonAni_Stop_ptr:		offsetTableEntry.w SonAni_Stop
SonAni_Float1_ptr:		offsetTableEntry.w SonAni_Float1
SonAni_Float2_ptr:		offsetTableEntry.w SonAni_Float2
SonAni_Spring_ptr:		offsetTableEntry.w SonAni_Spring
SonAni_LZHang_ptr:		offsetTableEntry.w SonAni_LZHang
SonAni_Victory_ptr:		offsetTableEntry.w SonAni_Victory
SonAni_GetAir_ptr:		offsetTableEntry.w SonAni_GetAir
SonAni_Burnt_ptr:		offsetTableEntry.w SonAni_Burnt
SonAni_Drown_ptr:		offsetTableEntry.w SonAni_Drown
SonAni_Death_ptr:		offsetTableEntry.w SonAni_Death
SonAni_Hurt_ptr:		offsetTableEntry.w SonAni_Hurt
SonAni_Null_ptr:		offsetTableEntry.w SonAni_Null
SonAni_Run2_ptr:		offsetTableEntry.w SonAni_Run2
SonAni_Transform_ptr:	offsetTableEntry.w SonAni_Transform
SonAni_Mach_ptr:		offsetTableEntry.w SonAni_Mach

SonAni_Walk:		dc.b  $FF, frS_Walk17,	frS_Walk18,   frS_Walk11,   frS_Walk12,	 frS_Walk13,   frS_Walk14,   frS_Walk15,	frS_Walk16, afEnd
SonAni_Run:			dc.b  $FF, frS_Run11,	frS_Run12, frS_Run13, frS_Run14, afEnd, afEnd, afEnd, afEnd, afEnd
SonAni_Roll:		dc.b  $FE, frS_Roll1,	frS_Roll2, frS_Roll1, frS_Roll3, frS_Roll1, frS_Roll4, frS_Roll1, frS_Roll5, afEnd
SonAni_Roll2:		dc.b  $FE, frS_Roll1,	frS_Roll2, frS_Roll1, frS_Roll3, frS_Roll1, frS_Roll4, frS_Roll1, frS_Roll5, afEnd
SonAni_Push:		dc.b  $FD, frS_Push1,	frS_Push2, frS_Push3, frS_Push4, afEnd, afEnd, afEnd, afEnd, afEnd
SonAni_Wait:		dc.b    5, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1
					dc.b  frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1
					dc.b  frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle1, frS_Idle2, frS_Idle3, frS_Idle3, frS_Idle4, frS_Idle4, frS_Idle5, frS_Idle5, frS_Idle4, frS_Idle4
					dc.b  frS_Idle5, frS_Idle5, frS_Idle4, frS_Idle4, frS_Idle5, frS_Idle5, frS_Idle4, frS_Idle4, frS_Idle5, frS_Idle5, frS_Idle4, frS_Idle4, frS_Idle5, frS_Idle5, frS_Idle4, frS_Idle4, frS_Idle5, frS_Idle5, frS_Idle4, frS_Idle4
					dc.b  frS_Idle5, frS_Idle5, frS_Idle4, frS_Idle4, frS_Idle5, frS_Idle5, frS_Idle6, frS_Idle6, frS_Idle6, frS_Idle6, frS_Idle6, frS_Idle6, frS_Idle7, frS_Idle7, frS_Idle7, frS_Idle7, frS_Idle7, frS_Idle7, frS_Idle8, frS_Idle9
					dc.b  frS_Idle9, frS_Idle9, frS_Idle9, frS_Idle9, frS_Idle9, frS_Idle8, frS_Idle8, afBack, $35
SonAni_Balance:		dc.b	7, frS_Balance21,	frS_Balance22, frS_Balance23, afEnd
SonAni_LookUp:		dc.b	5, frS_LookUp1,	frS_LookUp2, afBack,   1
SonAni_Duck:		dc.b	5, frS_Duck1,	frS_Duck2, afBack,   1
SonAni_Spindash:	dc.b	0, frS_Spindash1,	frS_Spindash2, frS_Spindash1, frS_Spindash3, frS_Spindash1, frS_Spindash4, frS_Spindash1, frS_Spindash5, frS_Spindash1,	frS_Spindash6, afEnd

SonAni_Whistle:		dc.b	9, frS_Idle1,	frS_Whistle1, frS_Whistle2, frS_Whistle2, frS_Whistle2, frS_Whistle2, frS_Whistle2, frS_Whistle2, frS_Whistle3,	frS_Whistle3, frS_Whistle3, frS_Whistle3, frS_Whistle3, frS_Whistle3, frS_Whistle3, frS_Whistle3, frS_Whistle3,	frS_Whistle3, frS_Whistle3
					dc.b  frS_Whistle3, afChange,   id_Walk
SonAni_MGZHang:		dc.b   $F, frS_MGZHang, afEnd
SonAni_Balance2:	dc.b	5, frS_Balance11,	frS_Balance12, frS_Balance13, afEnd

SonAni_Stop:		dc.b	3, frS_Skid1,	frS_Skid2, frS_Skid3, frS_SkidT, afChange,   id_Walk
SonAni_Float1:		dc.b	7, frS_Float1, afEnd
SonAni_Float2:		dc.b	7, frS_Float1,	frS_Float2, frS_Float3, frS_Float4, frS_Float5, frS_Float6, frS_Float7, frS_Float8, afEnd
SonAni_Spring:		dc.b  	2, frS_Spring1,	frS_Spring2, afEnd
SonAni_LZHang:		dc.b	1, frS_LZHang1,	frS_LZHang2, afEnd
SonAni_Victory:		dc.b	7, frS_Victory1,	frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory2, frS_Victory3,	frS_Victory4, frS_Victory3, afBack,	 4
SonAni_GetAir:		dc.b   $B, frS_GetAir,	frS_GetAir,   frS_Walk13,   frS_Walk14, afChange,   id_Walk
SonAni_Burnt:		dc.b  $20, frS_Burnt, afEnd
SonAni_Drown:		dc.b  $20, frS_Drown, afEnd
SonAni_Death:		dc.b  $20, frS_Death, afEnd
SonAni_Hurt:		dc.b	9, frS_Hurt1, frS_Hurt2, afBack, 1
SonAni_Null:		dc.b  $77,   frS_Null, afEnd
SonAni_Run2:		dc.b	2, frS_Run11,	frS_Run12, frS_Run13, frS_Run14, afEnd
SonAni_Transform:	dc.b	2, frS_Transform1, frS_Transform1, frS_Transform2, frS_Transform2, frS_Transform3, frS_Transform4, frS_Transform5, frS_Transform4, frS_Transform5, frS_Transform4, frS_Transform5, frS_Transform4, frS_Transform5, afChange,   id_Walk
SonAni_Mach:		dc.b  $FF, frS_Mach11,	frS_Mach12,	frS_Mach13,	frS_Mach14, afEnd, afEnd, afEnd, afEnd, afEnd
	even

AniSuperSonic:
Ani_SuperSonic: offsetTable
		offsetTableEntry.w SonAni_Walk
		offsetTableEntry.w SonAni_Run
		offsetTableEntry.w SonAni_Roll
		offsetTableEntry.w SonAni_Roll2
		offsetTableEntry.w SonAni_Push
		offsetTableEntry.w SupSonAni_Wait
		offsetTableEntry.w SupSonAni_Balance
		offsetTableEntry.w SonAni_LookUp
		offsetTableEntry.w SonAni_Duck
		offsetTableEntry.w SonAni_Spindash
		offsetTableEntry.w SonAni_Whistle
		offsetTableEntry.w SonAni_MGZHang
		offsetTableEntry.w SonAni_Balance2
		offsetTableEntry.w SonAni_Stop
		offsetTableEntry.w SonAni_Float1
		offsetTableEntry.w SonAni_Float2
		offsetTableEntry.w SonAni_Spring
		offsetTableEntry.w SonAni_LZHang
		offsetTableEntry.w SonAni_Victory
		offsetTableEntry.w SonAni_GetAir
		offsetTableEntry.w SonAni_Burnt
		offsetTableEntry.w SonAni_Drown
		offsetTableEntry.w SonAni_Death
		offsetTableEntry.w SonAni_Hurt
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Run2
		offsetTableEntry.w SonAni_Transform
		offsetTableEntry.w SonAni_Mach

SupSonAni_Wait:		dc.b    7, frS_Idle1, frS_Idle2, frS_Idle3, frS_Idle2, afEnd
SupSonAni_Balance:	dc.b    9, frS_Balance11, frS_Balance12, frS_Balance13, frS_Balance12, afEnd
	even

id_Walk:			equ	(SonAni_Walk_ptr-Ani_Sonic)/2
id_Run:				equ	(SonAni_Run_ptr-Ani_Sonic)/2
id_Roll:			equ	(SonAni_Roll_ptr-Ani_Sonic)/2
id_Roll2:			equ	(SonAni_Roll2_ptr-Ani_Sonic)/2
id_Push:			equ	(SonAni_Push_ptr-Ani_Sonic)/2
id_Wait:			equ	(SonAni_Wait_ptr-Ani_Sonic)/2
id_Balance:			equ	(SonAni_Balance_ptr-Ani_Sonic)/2
id_LookUp:			equ	(SonAni_LookUp_ptr-Ani_Sonic)/2
id_Duck:			equ	(SonAni_Duck_ptr-Ani_Sonic)/2
id_Spindash:		equ	(SonAni_Spindash_ptr-Ani_Sonic)/2
id_Whistle:			equ	(SonAni_Whistle_ptr-Ani_Sonic)/2
id_MGZHang:			equ	(SonAni_MGZHang_ptr-Ani_Sonic)/2
id_Balance2:		equ	(SonAni_Balance2_ptr-Ani_Sonic)/2
id_Stop:			equ	(SonAni_Stop_ptr-Ani_Sonic)/2
id_Float1:			equ	(SonAni_Float1_ptr-Ani_Sonic)/2
id_Float2:			equ	(SonAni_Float2_ptr-Ani_Sonic)/2
id_Spring:			equ	(SonAni_Spring_ptr-Ani_Sonic)/2
id_LZHang:			equ	(SonAni_LZHang_ptr-Ani_Sonic)/2
id_Victory:			equ	(SonAni_Victory_ptr-Ani_Sonic)/2
id_GetAir:			equ	(SonAni_GetAir_ptr-Ani_Sonic)/2
id_Burnt:			equ	(SonAni_Burnt_ptr-Ani_Sonic)/2
id_Drown:			equ	(SonAni_Drown_ptr-Ani_Sonic)/2
id_Death:			equ	(SonAni_Death_ptr-Ani_Sonic)/2
id_Hurt:			equ	(SonAni_Hurt_ptr-Ani_Sonic)/2
id_Null:			equ	(SonAni_Null_ptr-Ani_Sonic)/2
id_Run2:			equ	(SonAni_Run2_ptr-Ani_Sonic)/2
id_Transform:		equ	(SonAni_Transform_ptr-Ani_Sonic)/2
id_Mach:			equ	(SonAni_Mach_ptr-Ani_Sonic)/2

; Frame IDs
	phase 0 ; Reset ds.b value to 0
frS_Null:		ds.b 1
frS_Walk11:		ds.b 1
frS_Walk12:		ds.b 1
frS_Walk13:		ds.b 1
frS_Walk14:		ds.b 1
frS_Walk15:		ds.b 1
frS_Walk16:		ds.b 1
frS_Walk17:		ds.b 1
frS_Walk18:		ds.b 1
frS_Walk2X:		ds.b 8
frS_Walk3X:		ds.b 8
frS_Walk4X:		ds.b 8
frS_Run11:		ds.b 1
frS_Run12:		ds.b 1
frS_Run13:		ds.b 1
frS_Run14:		ds.b 1
frS_Run2X:		ds.b 4
frS_Run3X:		ds.b 4
frS_Run4X:		ds.b 4
frS_TumbleWalk1:	ds.b 1
frS_TumbleWalkX:	ds.b 11
frS_TumbleStand1:	ds.b 1
frS_TumbleStandX:	ds.b 11
frS_TumbleHCylinder1:	ds.b 1
frS_TumbleHCylinderX:	ds.b 11
frS_Turntable1:		ds.b 1
frS_TurntableX:		ds.b 6
frS_PoleSwingH1:		ds.b 1
frS_PoleSwingHX:	ds.b 6
frS_PoleSwingV1:	ds.b 1
frS_PoleSwingVX:	ds.b 5
frS_TumbleVCylinder1:	ds.b 1
frS_TumbleVCylinderX:	ds.b 14
frS_RopeSwing1:		ds.b 1
frS_RopeSwingX:		ds.b 7
frS_MonkeyBars1:	ds.b 1
frS_MonkeyBarsX:	ds.b 5
frS_Spindash1:		ds.b 1
frS_Spindash2:		ds.b 1
frS_Spindash3:		ds.b 1
frS_Spindash4:		ds.b 1
frS_Spindash5:		ds.b 1
frS_Spindash6:		ds.b 1
frS_Hurt1:			ds.b 1
frS_Hurt2:			ds.b 1
frS_Spring1:		ds.b 1
frS_Spring2:		ds.b 1
frS_MGZHang:		ds.b 1
frS_Hang1:			ds.b 1
frS_Hang2:			ds.b 1
frS_Hang3:			ds.b 1
frS_HangPush:		ds.b 1
frS_Shimmy1:		ds.b 1
frS_Shimmy2:		ds.b 1
frS_Roll1:			ds.b 1
frS_Roll2:			ds.b 1
frS_Roll3:			ds.b 1
frs_Roll4:			ds.b 1
frS_Roll5:			ds.b 1
frS_Duck1:			ds.b 1
frS_Duck2:			ds.b 1
frS_Skid1:			ds.b 1
frS_Skid2:			ds.b 1
frS_Skid3:			ds.b 1
frS_SkidT:			ds.b 1
frS_Balance11:		ds.b 1
frS_Balance12:		ds.b 1
frS_Balance13:		ds.b 1
frS_Balance21:		ds.b 1
frS_Balance22:		ds.b 1
frS_Balance23:		ds.b 1
frS_Death:			ds.b 1
frS_Burnt:			ds.b 1
frS_Drown:			ds.b 1
frS_LZHang1:		ds.b 1
frS_LZHang2:		ds.b 1
frS_GetAir:			ds.b 1
frS_Idle6:			ds.b 1
frS_Idle7:			ds.b 1
frS_Idle8:			ds.b 1
frS_Victory1:		ds.b 1
frS_Victory2:		ds.b 1
frS_Victory3:		ds.b 1
frS_Victory4:		ds.b 1
frS_LZHangV1:		ds.b 1
frS_LZHangV2:		ds.b 1
frS_Push1:			ds.b 1
frS_Push2:			ds.b 1
frS_Push3:			ds.b 1
frS_Push4:			ds.b 1
frS_Idle1:			ds.b 1
frS_Idle2:			ds.b 1
frS_Idle3:			ds.b 1
frS_Idle4:			ds.b 1
frS_Idle5:			ds.b 1
frS_IdleSleep1:		ds.b 1
frS_IdleSleep2:		ds.b 1
frS_IdleSleep3:		ds.b 1
frS_IdleSleep4:		ds.b 1
frS_LookUp1:		ds.b 1
frS_LookUp2:		ds.b 1
frS_Whistle1:		ds.b 1
frS_Whistle2:		ds.b 1
frS_Whistle3:		ds.b 1
frS_Float1:			ds.b 1
frS_Float2:			ds.b 1
frS_Float3:			ds.b 1
frS_Float4:			ds.b 1
frS_Float5:			ds.b 1
frS_Float6:			ds.b 1
frS_Float7:			ds.b 1
frS_Float8:			ds.b 1
frS_Slide1:			ds.b 1
frS_Slide2:			ds.b 1
frS_Transform1:		ds.b 1
frS_Transform2:		ds.b 1
frS_Transform3:		ds.b 1
frS_Transform4:		ds.b 1
frS_Transform5:		ds.b 1
frS_Fall1:			ds.b 1
frS_Fall2:			ds.b 1
frS_Idle9:			ds.b 1
frS_Mach11:			ds.b 1
frS_Mach12:			ds.b 1
frS_Mach13:			ds.b 1
frS_Mach14:			ds.b 1
frS_Mach2X:			ds.b 4
frS_Mach3X:			ds.b 4
frS_Mach4X:			ds.b 4
frS_Last:			ds.b 0
	even
	dephase