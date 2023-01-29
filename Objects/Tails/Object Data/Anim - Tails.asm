; ---------------------------------------------------------------------------
; Tails Animation Script
; ---------------------------------------------------------------------------

Ani_Tails:
AniTails:	offsetTable
		offsetTableEntry.w TailsAni_Walk
		offsetTableEntry.w TailsAni_Run
		offsetTableEntry.w TailsAni_Roll
		offsetTableEntry.w TailsAni_Roll2
		offsetTableEntry.w TailsAni_Push
		offsetTableEntry.w TailsAni_Wait
		offsetTableEntry.w TailsAni_Balance
		offsetTableEntry.w TailsAni_LookUp
		offsetTableEntry.w TailsAni_Duck
		offsetTableEntry.w TailsAni_Spindash
		offsetTableEntry.w TailsAni_MGZHang
		offsetTableEntry.w TailsAni_Balance2
		offsetTableEntry.w TailsAni_Stop
		offsetTableEntry.w TailsAni_Float1
		offsetTableEntry.w TailsAni_Float2
		offsetTableEntry.w TailsAni_Spring
		offsetTableEntry.w TailsAni_LZHang
		offsetTableEntry.w TailsAni_Victory
		offsetTableEntry.w TailsAni_Hang
		offsetTableEntry.w TailsAni_GetAir
		offsetTableEntry.w TailsAni_Burnt
		offsetTableEntry.w TailsAni_Drown
		offsetTableEntry.w TailsAni_Death
		offsetTableEntry.w TailsAni_Slide
		offsetTableEntry.w TailsAni_Hurt
		offsetTableEntry.w TailsAni_Null
		offsetTableEntry.w TailsAni_Mach
		offsetTableEntry.w TailsAni_Transform
		offsetTableEntry.w TailsAni_Fly
		offsetTableEntry.w TailsAni_FlyFast
		offsetTableEntry.w TailsAni_FlyHold
		offsetTableEntry.w TailsAni_FlyHoldUp
		offsetTableEntry.w TailsAni_FlyTired
		offsetTableEntry.w TailsAni_Swim
		offsetTableEntry.w TailsAni_SwimFast
		offsetTableEntry.w TailsAni_SwimHoldTired
		offsetTableEntry.w TailsAni_SwimTired

TailsAni_Walk:	dc.b  $FF,   frT_Walk17,   frT_Walk18,   frT_Walk11,   frT_Walk12,   frT_Walk13,   frT_Walk14,   frT_Walk15,   frT_Walk16, afEnd
TailsAni_Run:	dc.b  $FF, frT_Run11, frT_Run12, frT_Run13, frT_Run14, afEnd, afEnd, afEnd, afEnd, afEnd
TailsAni_Roll:	dc.b  $FE, frT_Roll1, frT_Roll2, frT_Roll3, afEnd
TailsAni_Roll2:	dc.b  $FE, frT_Roll1, frT_Roll2, frT_Roll3, afEnd
TailsAni_Push:	dc.b  $FD, frT_Push1, frT_Push2, frT_Push3, frT_Push4, afEnd, afEnd, afEnd, afEnd, afEnd
TailsAni_Wait:	dc.b    7, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle3, frT_Idle2, frT_Idle1, frT_Idle1, frT_Idle1
		dc.b  frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle3, frT_Idle2, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1, frT_Idle1
		dc.b  frT_Idle4, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5, frT_Idle5
		dc.b  frT_Idle6, frT_Idle7, frT_Idle8, frT_Idle7, frT_Idle8, frT_Idle7, frT_Idle8, frT_Idle7, frT_Idle8, frT_Idle7, frT_Idle8, frT_Idle6, afBack, $1C
TailsAni_Balance:	dc.b    9, frT_Balance1, frT_Balance1, frT_Balance2, frT_Balance2, frT_Balance1, frT_Balance1, frT_Balance2, frT_Balance2, frT_Balance1, frT_Balance1, frT_Balance2, frT_Balance2, frT_Balance1, frT_Balance1, frT_Balance2
		dc.b  frT_Balance2, frT_Balance1, frT_Balance1, frT_Balance2, frT_Balance2, frT_Balance1, frT_Balance2, afEnd
TailsAni_LookUp:		dc.b	5, frT_LookUp1,	frT_LookUp2, afBack,   1
TailsAni_Duck:		dc.b	5, frT_Duck1,	frT_Duck2, afBack,   1
TailsAni_Spindash:	dc.b    0, frT_Spindash1, frT_Spindash2, frT_Spindash3, afEnd
TailsAni_MGZHang:	dc.b   $F, frT_MGZHang, afEnd
TailsAni_Balance2:	dc.b    9, frT_Balance1, frT_Balance2, afEnd
TailsAni_Stop:	dc.b	3, frT_Skid1,	frT_Skid2, frT_Skid3, frT_SkidT, afChange,   id_Walk
TailsAni_Float1:	dc.b    9, frT_Float1, afEnd
TailsAni_Float2:	dc.b    9, frT_Float1, frT_Float2, frT_Float3, frT_Float4, frT_Float5, frT_Float6, frT_Float7, frT_Float8, afEnd
TailsAni_Spring:	dc.b    3, frT_Spring1, frT_Spring2, frT_Spring1, frT_Spring2, frT_Spring1, frT_Spring2, frT_Spring1, frT_Spring2, frT_Spring1, frT_Spring2, frT_Spring1, frT_Spring2, afChange,   id_Walk
TailsAni_LZHang:	dc.b    1, frT_LZHang1, frT_LZHang2, afEnd
TailsAni_Victory:	dc.b   $F, frT_Victory1, frT_Victory2, afBack,   1
TailsAni_Hang:		dc.b  $13, frT_Hang1,	frT_Hang2,	frT_Hang3,	frT_Hang2,	afEnd
TailsAni_GetAir:	dc.b   $B, frT_GetAir, frT_GetAir,   frT_Walk13,   frT_Walk14, afChange,   id_Walk
TailsAni_Burnt:	dc.b  $20, frT_Burnt, afEnd
TailsAni_Drown:	dc.b  $2F, frT_Drown, afEnd
TailsAni_Death:	dc.b    3, frT_Death, afEnd
TailsAni_Slide:	dc.b    9, frT_Slide1, frT_Slide2, afEnd
TailsAni_Hurt:	dc.b  $40, frT_Hurt2, afEnd
TailsAni_Null:	dc.b  $77,   frT_Null, afEnd
TailsAni_Mach:	dc.b  $FF, frT_Mach11, frT_Mach12, frT_Mach13, frT_Mach14, afEnd, afEnd, afEnd, afEnd, afEnd
TailsAni_Transform:	dc.b	2, frT_Transform1, frT_Transform1, frT_Transform2, frT_Transform2, frT_Transform3, frT_Transform4, frT_Transform4, frT_Transform4, frT_Transform4, frT_Transform4, frT_Transform4, frT_Transform4, frT_Transform4, afChange,   id_Walk
TailsAni_Fly:	dc.b  $1F, frT_Fly, afEnd
TailsAni_FlyFast:	dc.b  $1F, frT_Fly, afEnd
TailsAni_FlyHold:	dc.b  $1F, frT_FlyHold, afEnd
TailsAni_FlyHoldUp:	dc.b  $1F, frT_FlyHoldUp, afEnd
TailsAni_FlyTired:	dc.b   $B, frT_FlyTired1, frT_FlyTired2, afEnd
TailsAni_Swim:	dc.b    7, frT_Swim1, frT_Swim2, frT_Swim3, frT_Swim4, frT_Swim5, afEnd
TailsAni_SwimFast:	dc.b    3, frT_Swim1, frT_Swim2, frT_Swim3, frT_Swim4, frT_Swim5, afEnd
TailsAni_SwimHoldTired:	dc.b    4, frT_SwimHoldTired1, frT_SwimHoldTired2, afEnd
TailsAni_SwimTired:	dc.b   $B, frT_SwimTired1, frT_SwimTired2, frT_SwimTired3, afEnd
		even

; Frame IDs
	phase 0 ; Reset ds.b value to 0
frT_Null:		ds.b 1
frT_Walk11:		ds.b 1
frT_Walk12:		ds.b 1
frT_Walk13:		ds.b 1
frT_Walk14:		ds.b 1
frT_Walk15:		ds.b 1
frT_Walk16:		ds.b 1
frT_Walk17:		ds.b 1
frT_Walk18:		ds.b 1
frT_Walk2X:		ds.b 8
frT_Walk3X:		ds.b 8
frT_Walk4X:		ds.b 8
frT_Run11:		ds.b 1
frT_Run12:		ds.b 1
frT_Run13:		ds.b 1
frT_Run14:		ds.b 1
frT_Run2X:		ds.b 4
frT_Run3X:		ds.b 4
frT_Run4X:		ds.b 4
frT_TumbleWalk1:	ds.b 1
frT_TumbleWalkX:	ds.b 11
frT_TumbleStand1:	ds.b 1
frT_TumbleStandX:	ds.b 11
frT_TumbleHCylinder1:	ds.b 1
frT_TumbleHCylinderX:	ds.b 11
frT_Turntable1:		ds.b 1
frT_TurntableX:		ds.b 6
frT_PoleSwingH1:		ds.b 1
frT_PoleSwingHX:	ds.b 6
frT_PoleSwingV1:	ds.b 1
frT_PoleSwingVX:	ds.b 5
frT_TumbleVCylinder1:	ds.b 1
frT_TumbleVCylinderX:	ds.b 14
frT_RopeSwing1:		ds.b 1
frT_RopeSwingX:		ds.b 7
frT_MonkeyBars1:	ds.b 1
frT_MonkeyBarsX:	ds.b 5
frT_Spindash1:		ds.b 1
frT_Spindash2:		ds.b 1
frT_Spindash3:		ds.b 1
frT_Hurt1:			ds.b 1
frT_Hurt2:			ds.b 1
frT_Spring1:		ds.b 1
frT_Spring2:		ds.b 1
frT_MGZHang:		ds.b 1
frT_Skid1:			ds.b 1
frT_Skid2:			ds.b 1
frT_Skid3:			ds.b 1
frT_SkidT:			ds.b 1
frT_Hang1:			ds.b 1
frT_Hang2:			ds.b 1
frT_Hang3:			ds.b 1
frT_HangPush:		ds.b 1
frT_Shimmy1:		ds.b 1
frT_Shimmy2:		ds.b 1
frT_Roll1:			ds.b 1
frT_Roll2:			ds.b 1
frT_Roll3:			ds.b 1
frT_Duck1:			ds.b 1
frT_Duck2:			ds.b 1
frT_Balance1:		ds.b 1
frT_Balance2:		ds.b 1
frT_Burnt:			ds.b 1
frT_Drown:			ds.b 1
frT_Death:			ds.b 1
frT_LZHang1:		ds.b 1
frT_LZHang2:		ds.b 1
frT_GetAir:			ds.b 1
frT_Fly:			ds.b 1
frT_FlyHoldUp:		ds.b 1
frT_FlyHold:		ds.b 1
frT_FlyTired1:		ds.b 1
frT_FlyTired2:		ds.b 1
frT_Swim1:			ds.b 1
frT_Swim2:			ds.b 1
frT_Swim3:			ds.b 1
frT_Swim4:			ds.b 1
frT_Swim5:			ds.b 1
frT_SwimTired1:		ds.b 1
frT_SwimTired2:		ds.b 1
frT_SwimTired3:		ds.b 1
frT_SwimHoldTired1:	ds.b 1
frT_SwimHoldTired2:	ds.b 1
frT_Victory1:		ds.b 1
frT_Victory2:		ds.b 1
frT_LZHangV1:		ds.b 1
frT_LZHangV2:		ds.b 1
frT_Push1:			ds.b 1
frT_Push2:			ds.b 1
frT_Push3:			ds.b 1
frT_Push4:			ds.b 1
frT_Idle1:			ds.b 1
frT_Idle2:			ds.b 1
frT_Idle3:			ds.b 1
frT_Idle4:			ds.b 1
frT_Idle5:			ds.b 1
frT_Idle6:			ds.b 1
frT_Idle7:			ds.b 1
frT_Idle8:			ds.b 1
frT_LookUp1:		ds.b 1
frT_LookUp2:		ds.b 1
frT_Float1:			ds.b 1
frT_Float2:			ds.b 1
frT_Float3:			ds.b 1
frT_Float4:			ds.b 1
frT_Float5:			ds.b 1
frT_Float6:			ds.b 1
frT_Float7:			ds.b 1
frT_Float8:			ds.b 1
frT_Mach11:			ds.b 1
frT_Mach12:			ds.b 1
frT_Mach13:			ds.b 1
frT_Mach14:			ds.b 1
frT_Mach2X:			ds.b 4
frT_Mach3X:			ds.b 4
frT_Mach4X:			ds.b 4
frT_Slide1:			ds.b 1
frT_Slide2:			ds.b 1
frT_Transform1:		ds.b 1
frT_Transform2:		ds.b 1
frT_Transform3:		ds.b 1
frT_Transform4:		ds.b 1
frT_Last:			ds.b 0
	even
	dephase

AniTails_Tail:	offsetTable
		offsetTableEntry.w AniTails_Tail00
		offsetTableEntry.w AniTails_Tail01
		offsetTableEntry.w AniTails_Tail02
		offsetTableEntry.w AniTails_Tail03
		offsetTableEntry.w AniTails_Tail04
		offsetTableEntry.w AniTails_Tail05
		offsetTableEntry.w AniTails_Tail06
		offsetTableEntry.w AniTails_Tail07
		offsetTableEntry.w AniTails_Tail08
		offsetTableEntry.w AniTails_Tail09
		offsetTableEntry.w AniTails_Tail0A
		offsetTableEntry.w AniTails_Tail0B
		offsetTableEntry.w AniTails_Tail0C
AniTails_Tail00:dc.b  $20,   0, afEnd
AniTails_Tail01:dc.b    7, $22, $23, $24, $25, $26, afEnd
AniTails_Tail02:dc.b    3, $22, $23, $24, $25, $26, afChange,   1
AniTails_Tail03:dc.b  $FC,   5,   6,   7,   8, afEnd
AniTails_Tail04:dc.b    3,   9,  $A,  $B,  $C, afEnd
AniTails_Tail05:dc.b    3,  $D,  $E,  $F, $10, afEnd
AniTails_Tail06:dc.b    3, $11, $12, $13, $14, afEnd
AniTails_Tail07:dc.b    2,   1,   2,   3,   4, afEnd
AniTails_Tail08:dc.b    2, $1A, $1B, $1C, $1D, afEnd
AniTails_Tail09:dc.b    9, $1E, $1F, $20, $21, afEnd
AniTails_Tail0A:dc.b    9, $29, $2A, $2B, $2C, afEnd
AniTails_Tail0B:dc.b    1, $27, $28, afEnd
AniTails_Tail0C:dc.b    0, $27, $28, afEnd
		even
