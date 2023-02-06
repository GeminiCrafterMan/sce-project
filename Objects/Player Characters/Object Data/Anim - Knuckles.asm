; ---------------------------------------------------------------------------
; Knuckles Animation Script
; ---------------------------------------------------------------------------

Ani_Knuckles:
AniKnuckles:	offsetTable
		offsetTableEntry.w KnuxAni_Walk
		offsetTableEntry.w KnuxAni_Run
		offsetTableEntry.w KnuxAni_Roll
		offsetTableEntry.w KnuxAni_Roll2
		offsetTableEntry.w KnuxAni_Push
		offsetTableEntry.w KnuxAni_Idle
		offsetTableEntry.w KnuxAni_Balance
		offsetTableEntry.w KnuxAni_LookUp
		offsetTableEntry.w KnuxAni_Duck
		offsetTableEntry.w KnuxAni_Spindash
		offsetTableEntry.w KnuxAni_MGZHang
		offsetTableEntry.w KnuxAni_Balance2
		offsetTableEntry.w KnuxAni_Stop
		offsetTableEntry.w KnuxAni_Float1
		offsetTableEntry.w KnuxAni_Float2
		offsetTableEntry.w KnuxAni_Spring
		offsetTableEntry.w KnuxAni_LZHang
		offsetTableEntry.w KnuxAni_Victory
		offsetTableEntry.w KnuxAni_Hang
		offsetTableEntry.w KnuxAni_GetAir
		offsetTableEntry.w KnuxAni_Burnt
		offsetTableEntry.w KnuxAni_Drown
		offsetTableEntry.w KnuxAni_Death
		offsetTableEntry.w KnuxAni_Slide
		offsetTableEntry.w KnuxAni_Hurt
		offsetTableEntry.w KnuxAni_Zapped
		offsetTableEntry.w KnuxAni_Null
		offsetTableEntry.w KnuxAni_Mach
		offsetTableEntry.w KnuxAni_Transform
		offsetTableEntry.w KnuxAni_Fall
		offsetTableEntry.w KnuxAni_Glide
		offsetTableEntry.w KnuxAni_GlideFall
		offsetTableEntry.w KnuxAni_GetUp
		offsetTableEntry.w KnuxAni_GlideLand
		offsetTableEntry.w KnuxAni_Null
		offsetTableEntry.w KnuxAni_Null
		offsetTableEntry.w KnuxAni_Null
		offsetTableEntry.w KnuxAni_Null
		offsetTableEntry.w KnuxAni_Null

KnuxAni_Walk:	dc.b  $FF,   frK_Walk17,	  frK_Walk18,   frK_Walk11,   frK_Walk12,	 frK_Walk13,   frK_Walk14,   frK_Walk15,	frK_Walk16, afEnd
KnuxAni_Run:	dc.b  $FF, frK_Run11,	frK_Run12, frK_Run13, frK_Run14, afEnd, afEnd, afEnd, afEnd, afEnd
KnuxAni_Roll:	dc.b  $FE, frK_Roll5,	frK_Roll1, frK_Roll5, frK_Roll2, frK_Roll5, frK_Roll3, frK_Roll5, frK_Roll4, afEnd
KnuxAni_Roll2:	dc.b  $FE, frK_Roll5,	frK_Roll1, frK_Roll5, frK_Roll2, frK_Roll5, frK_Roll3, frK_Roll5, frK_Roll4, afEnd
KnuxAni_Push:	dc.b  $FD, frK_Push1,	frK_Push2, frK_Push3, frK_Push4, afEnd, afEnd, afEnd, afEnd, afEnd
KnuxAni_Idle:	dc.b    5, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1
		dc.b  frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1
		dc.b  frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle1, frK_Idle2, frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle2, frK_Idle2, frK_Idle2
		dc.b  frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle2, frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle2, frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle2, frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3
		dc.b  frK_Idle3, frK_Idle2, frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle2, frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle2, frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle2
		dc.b  frK_Idle2, frK_Idle2, frK_Idle3, frK_Idle3, frK_Idle3, frK_Idle4, frK_Idle4, frK_Idle4, frK_Idle4, frK_Idle4, frK_Idle5, frK_Idle6, frK_Idle7, frK_Idle8, frK_Idle9, frK_Idle6, frK_Idle7, frK_Idle8, frK_Idle9, frK_Idle6
		dc.b  frK_Idle7, frK_Idle8, frK_Idle9, frK_Idle6, frK_Idle7, frK_Idle8, frK_Idle9, frK_Idle6, frK_Idle7, frK_Idle8, frK_Idle9, frK_Idle6, frK_Idle7, frK_Idle8, frK_Idle9, frK_Idle6, frK_Idle7, frK_Idle8, frK_Idle9, frK_Idle6
		dc.b  frK_Idle7, frK_Idle8, frK_Idle9, frK_IdleA, frK_IdleB, frK_IdleA, frK_IdleB, frK_IdleC, frK_IdleC, frK_Idle6, frK_Idle5, afEnd
KnuxAni_Balance:	dc.b    3, frK_Balance1, frK_Balance1, frK_Balance2, frK_Balance2, frK_Balance3, frK_Balance3, frK_Balance4, frK_Balance4, frK_Balance5, frK_Balance5, frK_Balance6, frK_Balance6, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7
		dc.b  frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance8, frK_Balance8, frK_Balance8, frK_Balance9, frK_Balance9, frK_Balance9, frK_Balance10, frK_Balance10, frK_Balance11, frK_Balance11, frK_Balance12, frK_Balance12
		dc.b  afBack,   6
KnuxAni_LookUp:	dc.b	5, frK_LookUp1,	frK_LookUp2, afBack,   1
KnuxAni_Duck:	dc.b	5, frK_Duck1,	frK_Duck2, afBack,   1
KnuxAni_Spindash:	dc.b	0, frK_Spindash1,	frK_Spindash2, frK_Spindash1, frK_Spindash3, frK_Spindash1, frK_Spindash4, frK_Spindash1, frK_Spindash5, frK_Spindash1,	frK_Spindash6, afEnd
KnuxAni_MGZHang:	dc.b   $F, frK_MGZHang,	afEnd
KnuxAni_Balance2:	dc.b    3, frK_Balance3, frK_Balance3, frK_Balance4, frK_Balance4, frK_Balance5, frK_Balance5, frK_Balance6, frK_Balance6, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7
		dc.b  frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance7, frK_Balance8, frK_Balance8, frK_Balance8, frK_Balance9, frK_Balance9, frK_Balance9, frK_Balance10, frK_Balance10, frK_Balance11, frK_Balance11, frK_Balance12, frK_Balance12, afBack,   6
KnuxAni_Stop:	dc.b	3, frK_Skid1,	frK_Skid2, frK_Balance1, frK_Balance2, afChange,   id_Walk
KnuxAni_Float1:	dc.b	7, frK_Float1,	afEnd
KnuxAni_Float2:	dc.b	5, frK_Float1,	frK_Float2, frK_Float3, frK_Float4, frK_Float5, frK_Float6, frK_Float7, frK_Float8, frK_Float9,	frK_FloatA, afEnd
KnuxAni_Spring:	dc.b  $2F, frK_Spring,	afChange,   id_Walk
KnuxAni_LZHang:	dc.b	1, frK_LZHang1,	frK_LZHang2, afEnd
KnuxAni_Victory:	dc.b	5, frK_Victory1,	frK_Victory2, frK_Victory2, frK_Victory2, frK_Victory3, frK_Victory4, afBack,	1
KnuxAni_Hang:		dc.b  $13, frK_Hang1,	frK_Hang2,	frK_Hang3,	frK_Hang2,	afEnd
KnuxAni_GetAir:	dc.b   $B, frK_GetAir,	frK_GetAir,   frK_Walk13,   frK_Walk14, afChange,   id_Walk
KnuxAni_Burnt:	dc.b  $20, frK_Burnt,	afEnd
KnuxAni_Drown:	dc.b  $20, frK_Drown,	afEnd
KnuxAni_Death:	dc.b  $20, frK_Death,	afEnd
KnuxAni_Slide:	dc.b	9, frK_Slide,	afEnd
KnuxAni_Hurt:	dc.b  $40, frK_Hurt,	afEnd
KnuxAni_Zapped:	dc.b  $40, frK_Hurt,	afEnd
KnuxAni_Null:	dc.b  $77,   frK_Null,	afEnd
KnuxAni_Mach:	dc.b  $FF, frK_Run11,	frK_Run12, frK_Run13, frK_Run14, afEnd, afEnd, afEnd, afEnd, afEnd
KnuxAni_Transform:	dc.b	2, frK_Transform1,	frK_Transform1, frK_Transform2, frK_Transform3, frK_Transform2, frK_Transform3, frK_Transform2, frK_Transform3, frK_Transform2,	frK_Transform3, frK_Transform2, frK_Transform3, afChange,   id_Walk
KnuxAni_Fall:	dc.b	7, frK_GlideFall2, afEnd
KnuxAni_Glide:	dc.b  $1F, frK_Float1,	afEnd
KnuxAni_GlideFall:	dc.b	7, frK_GlideFall1,	frK_GlideFall2, afBack,   1
KnuxAni_GetUp:	dc.b   $F, frK_GlideSlide2,	afChange,   id_Walk
KnuxAni_GlideLand:	dc.b   $F, frK_Duck2,	afChange,   id_Walk
	even

; Frame IDs
	phase 0 ; Reset ds.b value to 0
frK_Null:				ds.b 1
frK_Walk11:				ds.b 1
frK_Walk12:				ds.b 1
frK_Walk13:				ds.b 1
frK_Walk14:				ds.b 1
frK_Walk15:				ds.b 1
frK_Walk16:				ds.b 1
frK_Walk17:				ds.b 1
frK_Walk18:				ds.b 1
frK_Walk2X:				ds.b 8
frK_Walk3X:				ds.b 8
frK_Walk4X:				ds.b 8
frK_Run11:				ds.b 1
frK_Run12:				ds.b 1
frK_Run13:				ds.b 1
frK_Run14:				ds.b 1
frK_Run2X:				ds.b 4
frK_Run3X:				ds.b 4
frK_Run4X:				ds.b 4
frK_TumbleWalk1:		ds.b 1
frK_TumbleWalkX:		ds.b 11
frK_TumbleStand1:		ds.b 1
frK_TumbleStandX:		ds.b 11
frK_TumbleHCylinder1:	ds.b 1
frK_TumbleHCylinderX:	ds.b 11
frK_Turntable1:			ds.b 1
frK_TurntableX:			ds.b 6
frK_PoleSwingH1:		ds.b 1
frK_PoleSwingHX:		ds.b 6
frK_PoleSwingV1:		ds.b 1
frK_PoleSwingVX:		ds.b 5
frK_TumbleVCylinder1:	ds.b 1
frK_TumbleVCylinderX:	ds.b 14
frK_RopeSwing1:			ds.b 1
frK_RopeSwingX:			ds.b 7
frK_MonkeyBars1:		ds.b 1
frK_MonkeyBarsX:		ds.b 5
frK_Spindash1:			ds.b 1
frK_Spindash2:			ds.b 1
frK_Spindash3:			ds.b 1
frK_Spindash4:			ds.b 1
frK_Spindash5:			ds.b 1
frK_Spindash6:			ds.b 1
frK_Slide:				ds.b 1
frK_Hurt:				ds.b 1
frK_Spring:				ds.b 1
frK_MGZHang:			ds.b 1
frK_Hang1:				ds.b 1
frK_Hang2:				ds.b 1
frK_Hang3:				ds.b 1
frK_HangPush:			ds.b 1
frK_Shimmy1:			ds.b 1
frK_Shimmy2:			ds.b 1
frK_Roll1:				ds.b 1
frK_Roll2:				ds.b 1
frK_Roll3:				ds.b 1
frK_Roll4:				ds.b 1
frK_Roll5:				ds.b 1
frK_Duck1:				ds.b 1
frK_Duck2:				ds.b 1
frK_Skid1:				ds.b 1
frK_Skid2:				ds.b 1
frK_Balance1:			ds.b 1
frK_Balance2:			ds.b 1
frK_Balance3:			ds.b 1
frK_Balance4:			ds.b 1
frK_Balance5:			ds.b 1
frK_Balance6:			ds.b 1
frK_Balance7:			ds.b 1
frK_Balance8:			ds.b 1
frK_Balance9:			ds.b 1
frK_Balance10:			ds.b 1
frK_Balance11:			ds.b 1
frK_Balance12:			ds.b 1
frK_Death:				ds.b 1
frK_Burnt:				ds.b 1
frK_Drown:				ds.b 1
frK_LZHang1:			ds.b 1
frK_LZHang2:			ds.b 1
frK_GetAir:				ds.b 1
frK_Victory1:			ds.b 1
frK_Victory2:			ds.b 1
frK_Victory3:			ds.b 1
frK_Victory4:			ds.b 1
frK_LZHangV1:			ds.b 1
frK_LZHangV2:			ds.b 1
frK_Climb1:				ds.b 1
frK_Climb2:				ds.b 1
frK_Climb3:				ds.b 1
frK_Climb4:				ds.b 1
frK_Climb5:				ds.b 1
frK_Climb6:				ds.b 1
frK_ClimbUp1:			ds.b 1
frK_ClimbUp2:			ds.b 1
frK_ClimbUp3:			ds.b 1
frK_Float1:				ds.b 1
frK_Float2:				ds.b 1
frK_Float3:				ds.b 1
frK_Float4:				ds.b 1
frK_Float5:				ds.b 1
frK_Float6:				ds.b 1
frK_Float7:				ds.b 1
frK_Float8:				ds.b 1
frK_Float9:				ds.b 1
frK_FloatA:				ds.b 1
frK_GlideFall1:			ds.b 1
frK_GlideFall2:			ds.b 1
frK_GlideSlide1:		ds.b 1
frK_GlideSlide2:		ds.b 1
frK_Push1:				ds.b 1
frK_Push2:				ds.b 1
frK_Push3:				ds.b 1
frK_Push4:				ds.b 1
frK_Idle1:				ds.b 1
frK_Idle2:				ds.b 1
frK_Idle3:				ds.b 1
frK_Idle4:				ds.b 1
frK_LookUp1:			ds.b 1
frK_LookUp2:			ds.b 1
frK_Idle5:				ds.b 1
frK_Idle6:				ds.b 1
frK_Idle7:				ds.b 1
frK_Idle8:				ds.b 1
frK_Idle9:				ds.b 1
frK_IdleA:				ds.b 1
frK_IdleB:				ds.b 1
frK_IdleC:				ds.b 1
frK_Transform1:			ds.b 1
frK_Transform2:			ds.b 1
frK_Transform3:			ds.b 1
frK_Transform4:			ds.b 1
frK_ClimbD1:			ds.b 1
frK_ClimbD2:			ds.b 1
frK_Last:				ds.b 0
	even
	dephase