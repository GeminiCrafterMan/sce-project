; ---------------------------------------------------------------------------
; Sonic Animation Script
; ---------------------------------------------------------------------------

Ani_Sonic:
AniSonic: 				offsetTable
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
SonAni_MGZHang_ptr:		offsetTableEntry.w SonAni_MGZHang
SonAni_Balance2_ptr:	offsetTableEntry.w SonAni_Balance2
SonAni_Stop_ptr:		offsetTableEntry.w SonAni_Stop
SonAni_Float1_ptr:		offsetTableEntry.w SonAni_Float1
SonAni_Float2_ptr:		offsetTableEntry.w SonAni_Float2
SonAni_Spring_ptr:		offsetTableEntry.w SonAni_Spring
SonAni_LZHang_ptr:		offsetTableEntry.w SonAni_LZHang
SonAni_Victory_ptr:		offsetTableEntry.w SonAni_Victory
SonAni_Hang_ptr:		offsetTableEntry.w SonAni_Hang
SonAni_GetAir_ptr:		offsetTableEntry.w SonAni_GetAir
SonAni_Squash_ptr:		offsetTableEntry.w SonAni_Squash
SonAni_Burnt_ptr:		offsetTableEntry.w SonAni_Burnt
SonAni_Drown_ptr:		offsetTableEntry.w SonAni_Drown
SonAni_Death_ptr:		offsetTableEntry.w SonAni_Death
SonAni_Slide_ptr:		offsetTableEntry.w SonAni_Slide
SonAni_Hurt_ptr:		offsetTableEntry.w SonAni_Hurt
SonAni_Spiked_ptr:		offsetTableEntry.w SonAni_Spiked
SonAni_Null_ptr:		offsetTableEntry.w SonAni_Null
SonAni_Mach_ptr:		offsetTableEntry.w SonAni_Mach
SonAni_Transform_ptr:	offsetTableEntry.w SonAni_Transform
SonAni_Fall_ptr:		offsetTableEntry.w SonAni_Fall
SonAni_Ability1_ptr:	offsetTableEntry.w SonAni_Fly
SonAni_Ability2_ptr:	offsetTableEntry.w SonAni_Null
SonAni_Ability3_ptr:	offsetTableEntry.w SonAni_Null
SonAni_Ability4_ptr:	offsetTableEntry.w SonAni_Null
SonAni_Ability5_ptr:	offsetTableEntry.w SonAni_Null
SonAni_Ability6_ptr:	offsetTableEntry.w SonAni_Null
SonAni_Ability7_ptr:	offsetTableEntry.w SonAni_Null
SonAni_Ability8_ptr:	offsetTableEntry.w SonAni_Null
SonAni_Ability9_ptr:	offsetTableEntry.w SonAni_Null
SonAni_MonkeyBars_ptr:	offsetTableEntry.w SonAni_MonkeyBars

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
SonAni_MGZHang:		dc.b   $F, frS_MGZHang, afEnd
SonAni_Balance2:	dc.b	5, frS_Balance11,	frS_Balance12, frS_Balance13, afEnd
SonAni_Stop:		dc.b	3, frS_Skid1,	frS_Skid2, frS_Skid3, frS_SkidT, afChange,   id_Walk
SonAni_Float1:		dc.b	7, frS_Float1, afEnd
SonAni_Float2:		dc.b	7, frS_Float1,	frS_Float2, frS_Float3, frS_Float4, frS_Float5, frS_Float6, frS_Float7, frS_Float8, afEnd
SonAni_Spring:		dc.b  	2, frS_Spring1,	frS_Spring2, afEnd
SonAni_LZHang:		dc.b	1, frS_LZHang1,	frS_LZHang2, afEnd
SonAni_Victory:		dc.b	7, frS_Victory1,	frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory3, frS_Victory2, frS_Victory3,	frS_Victory4, frS_Victory3, afBack,	 4
SonAni_Hang:		dc.b  $13, frS_Hang1,	frS_Hang2,	frS_Hang3,	frS_Hang2,	afEnd
SonAni_GetAir:		dc.b   $B, frS_GetAir,	frS_GetAir,   frS_Walk13,   frS_Walk14, afChange,   id_Walk
SonAni_Squash:		dc.b	7, frS_Squash2, frS_Squash2, frS_Squash3, frS_Squash3, frS_Squash2, frS_Squash1, frS_Squash1, afBack, 6
SonAni_Burnt:		dc.b  $20, frS_Burnt, afEnd
SonAni_Drown:		dc.b  $20, frS_Drown, afEnd
SonAni_Death:		dc.b    5, frS_Death3, frS_Death1, frS_Death2, frS_Death2, frS_Death2, frS_Death3, afBack, 1	; Originally 7, but Sonic falls way faster in these games.
SonAni_Slide:		dc.b	9, frS_Slide1, frS_Slide2, afBack, 1
SonAni_Hurt:		dc.b	9, frS_Hurt1, frS_Hurt2, afBack, 1
SonAni_Spiked:		dc.b	9, frS_Spiked1, frS_Spiked2, afEnd
SonAni_Null:		dc.b  $77,   frS_Null, afEnd
SonAni_Mach:		dc.b  $FF, frS_Mach11,	frS_Mach12,	frS_Mach13,	frS_Mach14, afEnd, afEnd, afEnd, afEnd, afEnd
SonAni_Transform:	dc.b	2, frS_Transform1, frS_Transform1, frS_Transform2, frS_Transform2, frS_Transform3, frS_Transform4, frS_Transform5, frS_Transform4, frS_Transform5, frS_Transform4, frS_Transform5, frS_Transform4, frS_Transform5, afChange,   id_Walk
SonAni_Fall:		dc.b	3, frS_Fall1, frS_Fall2, afBack, 1
SonAni_Fly:			dc.b	1, frS_Fly1, frS_Fly2, frS_Fly3, frS_Fly4, frS_Fly3, frS_Fly2, afEnd
SonAni_MonkeyBars:	dc.b  $7F, frS_MonkeyBars6, frS_MonkeyBars4, afEnd
	even

Ani_SuperSonic:
AniSuperSonic: offsetTable
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
		offsetTableEntry.w SonAni_MGZHang
		offsetTableEntry.w SonAni_Balance2
		offsetTableEntry.w SonAni_Stop
		offsetTableEntry.w SonAni_Float1
		offsetTableEntry.w SonAni_Float2
		offsetTableEntry.w SonAni_Spring
		offsetTableEntry.w SonAni_LZHang
		offsetTableEntry.w SonAni_Victory
		offsetTableEntry.w SonAni_Hang
		offsetTableEntry.w SonAni_GetAir
		offsetTableEntry.w SonAni_Squash
		offsetTableEntry.w SonAni_Burnt
		offsetTableEntry.w SonAni_Drown
		offsetTableEntry.w SonAni_Death
		offsetTableEntry.w SonAni_Slide
		offsetTableEntry.w SonAni_Hurt
		offsetTableEntry.w SonAni_Spiked
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Mach
		offsetTableEntry.w SonAni_Transform
		offsetTableEntry.w SonAni_Fall
		offsetTableEntry.w SonAni_Fly
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_Null
		offsetTableEntry.w SonAni_MonkeyBars

SupSonAni_Wait:		dc.b    7, frS_Idle1, frS_Idle2, frS_Idle3, frS_Idle2, afEnd
SupSonAni_Balance:	dc.b    9, frS_Balance11, frS_Balance12, frS_Balance13, frS_Balance12, afEnd
	even

id_Walk:			equ	(SonAni_Walk_ptr-AniSonic)/2
id_Run:				equ	(SonAni_Run_ptr-AniSonic)/2
id_Roll:			equ	(SonAni_Roll_ptr-AniSonic)/2
id_Roll2:			equ	(SonAni_Roll2_ptr-AniSonic)/2
id_Push:			equ	(SonAni_Push_ptr-AniSonic)/2
id_Wait:			equ	(SonAni_Wait_ptr-AniSonic)/2
id_Balance:			equ	(SonAni_Balance_ptr-AniSonic)/2
id_LookUp:			equ	(SonAni_LookUp_ptr-AniSonic)/2
id_Duck:			equ	(SonAni_Duck_ptr-AniSonic)/2
id_Spindash:		equ	(SonAni_Spindash_ptr-AniSonic)/2
id_MGZHang:			equ	(SonAni_MGZHang_ptr-AniSonic)/2
id_Balance2:		equ	(SonAni_Balance2_ptr-AniSonic)/2
id_Stop:			equ	(SonAni_Stop_ptr-AniSonic)/2
id_Float1:			equ	(SonAni_Float1_ptr-AniSonic)/2
id_Float2:			equ	(SonAni_Float2_ptr-AniSonic)/2
id_Spring:			equ	(SonAni_Spring_ptr-AniSonic)/2
id_LZHang:			equ	(SonAni_LZHang_ptr-AniSonic)/2
id_Victory:			equ	(SonAni_Victory_ptr-AniSonic)/2
id_Hang:			equ	(SonAni_Hang_ptr-AniSonic)/2
id_GetAir:			equ	(SonAni_GetAir_ptr-AniSonic)/2
id_Squash:			equ	(SonAni_Squash_ptr-AniSonic)/2
id_Burnt:			equ	(SonAni_Burnt_ptr-AniSonic)/2
id_Drown:			equ	(SonAni_Drown_ptr-AniSonic)/2
id_Death:			equ	(SonAni_Death_ptr-AniSonic)/2
id_Slide:			equ	(SonAni_Slide_ptr-AniSonic)/2
id_Hurt:			equ	(SonAni_Hurt_ptr-AniSonic)/2
id_Spiked:			equ	(SonAni_Spiked_ptr-AniSonic)/2
id_Null:			equ	(SonAni_Null_ptr-AniSonic)/2
id_Mach:			equ	(SonAni_Mach_ptr-AniSonic)/2
id_Transform:		equ	(SonAni_Transform_ptr-AniSonic)/2
id_Fall:			equ	(SonAni_Fall_ptr-AniSonic)/2
id_Ability1:		equ	(SonAni_Ability1_ptr-AniSonic)/2
id_Ability2:		equ	(SonAni_Ability2_ptr-AniSonic)/2
id_Ability3:		equ	(SonAni_Ability3_ptr-AniSonic)/2
id_Ability4:		equ	(SonAni_Ability4_ptr-AniSonic)/2
id_Ability5:		equ	(SonAni_Ability5_ptr-AniSonic)/2
id_Ability6:		equ	(SonAni_Ability6_ptr-AniSonic)/2
id_Ability7:		equ	(SonAni_Ability7_ptr-AniSonic)/2
id_Ability8:		equ	(SonAni_Ability8_ptr-AniSonic)/2
id_Ability9:		equ	(SonAni_Ability9_ptr-AniSonic)/2
id_MonkeyBars:		equ	(SonAni_MonkeyBars_ptr-AniSonic)/2

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
frS_Turntable2:		ds.b 1
frS_Turntable3:		ds.b 1
frS_Turntable4:		ds.b 1
frS_Turntable5:		ds.b 1
frS_Turntable6:		ds.b 1
frS_Turntable7:		ds.b 1
frS_PoleSwingH1:		ds.b 1
frS_PoleSwingHX:	ds.b 6
frS_PoleSwingV1:	ds.b 1
frS_PoleSwingVX:	ds.b 5
frS_TumbleVCylinder1:	ds.b 1
frS_TumbleVCylinderX:	ds.b 14
frS_RopeSwing1:		ds.b 1
frS_RopeSwing2:		ds.b 1
frS_RopeSwing3:		ds.b 1
frS_RopeSwing4:		ds.b 1
frS_RopeSwing5:		ds.b 1
frS_RopeSwing6:		ds.b 1
frS_RopeSwing7:		ds.b 1
frS_RopeSwing8:		ds.b 1
frS_MonkeyBars1:	ds.b 1
frS_MonkeyBars2:	ds.b 1
frS_MonkeyBars3:	ds.b 1
frS_MonkeyBars4:	ds.b 1
frS_MonkeyBars5:	ds.b 1
frS_MonkeyBars6:	ds.b 1
frS_MGZHang:		ds.b 1
frS_Hang1:			ds.b 1
frS_Hang2:			ds.b 1
frS_Hang3:			ds.b 1
frS_HangPush:		ds.b 1
frS_Shimmy1:		ds.b 1
frS_Shimmy2:		ds.b 1
frS_Spindash1:		ds.b 1
frS_Spindash2:		ds.b 1
frS_Spindash3:		ds.b 1
frS_Spindash4:		ds.b 1
frS_Spindash5:		ds.b 1
frS_Spindash6:		ds.b 1
frS_Hurt1:			ds.b 1
frS_Hurt2:			ds.b 1
frS_Spiked1:		ds.b 1
frS_Spiked2:		ds.b 1
frS_Spring1:		ds.b 1
frS_Spring2:		ds.b 1
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
frS_Death1:			ds.b 1
frS_Death2:			ds.b 1
frS_Death3:			ds.b 1
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
frS_LookUp1:		ds.b 1
frS_LookUp2:		ds.b 1
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
frS_Fly1:			ds.b 1
frS_Fly2:			ds.b 1
frS_Fly3:			ds.b 1
frS_Fly4:			ds.b 1
frS_Squash1:		ds.b 1
frS_Squash2:		ds.b 1
frS_Squash3:		ds.b 1
frS_Last:			ds.b 0
	even
	dephase