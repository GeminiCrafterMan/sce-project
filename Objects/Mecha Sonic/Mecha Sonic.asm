Obj_MechaSonic:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Obj_MechaSonic_Index(pc,d0.w),d1
		jsr	Obj_MechaSonic_Index(pc,d1.w)
		lea	Obj_MechaSonic_Explode(pc),a4
		bsr.w	Obj_MechaSonic_AttemptBlock
		bsr.w	Obj_MechaSonic_HandleDamage
		bsr.w	Obj_MechaSonic_SetCollisionType
		lea	DPLCPtr_MechaSonic(pc),a2
		jsr	(Perform_DPLC).l
		jmp	(Draw_And_Touch_Sprite).l
; ---------------------------------------------------------------------------
; off_7B2B2
Obj_MechaSonic_Index:	offsetTable
		offsetTableEntry.w Obj_MechaSonic_Init	; 0
		offsetTableEntry.w loc_7B3AC			; 2
		offsetTableEntry.w loc_7B3E6			; 4
		offsetTableEntry.w Obj_MechaSonic_Wait			; 6
		offsetTableEntry.w Obj_MechaSonic_AnimateAndMove			; 8
		offsetTableEntry.w Obj_MechaSonic_MidAirDelay			; $A
		offsetTableEntry.w Obj_MechaSonic_FallFromUncurl			; $C
		offsetTableEntry.w Obj_MechaSonic_Animate_RawMultiDelay			; $E
		offsetTableEntry.w loc_7B5AC			; $10
		offsetTableEntry.w Obj_MechaSonic_Animate_RawMultiDelay			; $12
		offsetTableEntry.w Obj_MechaSonic_Animate_RawMultiDelay			; $14
		offsetTableEntry.w Obj_MechaSonic_TestAirDash			; $16
		offsetTableEntry.w loc_7B67C			; $18
		offsetTableEntry.w Obj_MechaSonic_TestBounce			; $1A
		offsetTableEntry.w Obj_MechaSonic_BounceMovement			; $1C
		offsetTableEntry.w Obj_MechaSonic_Fall			; $1E
		offsetTableEntry.w Obj_MechaSonic_AnimateAndWait			; $20
		offsetTableEntry.w loc_7B77E			; $22
		offsetTableEntry.w loc_7B7BA			; $24
		offsetTableEntry.w Obj_MechaSonic_AnimateAndWait			; $26
		offsetTableEntry.w Obj_MechaSonic_SpindashRise			; $28
; ---------------------------------------------------------------------------
; loc_7B2DC
Obj_MechaSonic_Init:
		lea	ObjDat4_7D3EA(pc),a1
		jsr	(SetUp_ObjAttributesSlotted).l
		move.b	#8,boss_hitcount2(a0)
		move.b	#8*3,x_radius(a0)
		move.l	(V_int_run_count).w,(RNG_seed).w
		sfx	bgm_Fade
		move.w	#3*60,wait(a0)
		move.l	#+,jump(a0)
		move.l	#Obj_Wait,address(a0)
		rts
+
		sample	dMechaThreat	; "I've let you live long enough...!", aka your cue to fuckin jump
		move.w	#2*60,wait(a0)
		move.l	#+,jump(a0)
		move.l	#Obj_Wait,address(a0)
		rts
+
		move.l	#Obj_MechaSonic,address(a0)	; this sucks but that voice clip is worth it
;		tst.b	(Current_act).w
;		beq.s	loc_7B308
;		move.w	#$220,x_pos(a0)
;		move.w	#$4A0,y_pos(a0)
;		bra.w	loc_7B35A
; ---------------------------------------------------------------------------

loc_7B308:
		move.b	#4,routine(a0)	; loc_7B3E6
		move.b	#2,mapping_frame(a0)	; crouched
		move.w	#-$800,x_vel(a0)
		bset	#2,objoff_38(a0)
		lea	ChildObjDat_7D47A(pc),a2
		jsr	(CreateChild6_Simple).l
		move.w	(Camera_X_pos).w,d0
		addi.w	#$20,d0
		move.w	d0,(_unkFAB4).w
		addi.w	#$100,d0
		move.w	d0,(_unkFAB6).w
		addi.w	#$40,d0
		move.w	d0,x_pos(a0)
		move.w	(Camera_Y_pos).w,d0
		addi.w	#$30,d0
		move.w	d0,(_unkFAB0).w
		addi.w	#$70,d0
		move.w	d0,y_pos(a0)

loc_7B35A:
		lea	(ArtKosM_MechaSonicExtra).l,a1
		move.w	#-$7C80,d2
		jsr	(Queue_Kos_Module).l
		lea	(PLC_BossExplosion).l,a5
		jsr	(LoadPLC_Raw_KosM).l
		lea	(Pal_MechaSonic).l,a1
		lea	(Normal_palette_line_2).w,a2
		jsr	(PalLoad_Line16).l
;		tst.b	(Current_act).w
;		bne.s	loc_7B39C
;		jsr	(Create_New_Sprite).l
;		bne.s	loc_7B39C
;		move.l	#Obj_Song_Fade_Transition,(a1)
;		move.b	#bgm_ZoneBoss,subtype(a1)
		music	bgm_MetalSquad

loc_7B39C:
		lea	ChildObjDat_7D474(pc),a2
		jsr	(CreateChild6_Simple).l
		jmp	(Create_New_Sprite).l
; ---------------------------------------------------------------------------

loc_7B3AC:
		btst	#4,(_unkFAB8).w
		beq.w	locret_7B448
		move.b	#$14,routine(a0)	; Obj_MechaSonic_Animate_RawMultiDelay
		move.b	#2,objoff_3B(a0)
		move.w	(Camera_X_pos).w,d0
		addi.w	#$20,d0
		move.w	d0,(_unkFAB4).w
		addi.w	#$100,d0
		move.w	d0,(_unkFAB6).w
		move.w	(Camera_Y_pos).w,d0
		addi.w	#$30,d0
		move.w	d0,(_unkFAB0).w
		bra.w	loc_7B57A
; ---------------------------------------------------------------------------

loc_7B3E6:
		jsr	(MoveSprite2).l
		move.w	(Camera_X_pos).w,d0
		subi.w	#$20,d0
		cmp.w	x_pos(a0),d0
		blo.s	locret_7B414
		move.b	#6,routine(a0)	; Obj_MechaSonic_Wait
		bclr	#2,objoff_38(a0)
		move.w	#$3F,wait(a0)
		move.l	#Obj_MechaSonic_Intro,jump(a0)

locret_7B414:
		rts
; ---------------------------------------------------------------------------
; loc_7B416
Obj_MechaSonic_Wait:
		jmp	(Obj_Wait).l
; ---------------------------------------------------------------------------
; loc_7B41C
Obj_MechaSonic_Intro:
		move.b	#8,routine(a0)	; Obj_MechaSonic_AnimateAndMove
		bset	#0,render_flags(a0)
		move.w	(Camera_Y_pos).w,d0
		addi.w	#$40,d0
		move.w	d0,y_pos(a0)
		move.w	#$400,x_vel(a0)
		move.b	#3,mapping_frame(a0)	; slides across
		move.l	#AniRaw_MechaSonic_RollFast,aniraw(a0)	; rolls on his way back

locret_7B448:
		rts
; ---------------------------------------------------------------------------
; loc_7B44A
Obj_MechaSonic_AnimateAndMove:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite2).l
		move.w	x_pos(a0),d0
		cmp.w	(_unkFAB6).w,d0
		bhs.s	loc_7B462
		rts
; ---------------------------------------------------------------------------

loc_7B462:
		move.b	#$A,routine(a0)	; Obj_MechaSonic_MidAirDelay
		move.w	#$1F,wait(a0)
		move.l	#Obj_MechaSonic_Uncurl,jump(a0)
		rts
; ---------------------------------------------------------------------------
; loc_7B478
Obj_MechaSonic_MidAirDelay:
		jsr	(Animate_RawMultiDelay).l
		jmp	(Obj_Wait).l
; ---------------------------------------------------------------------------
; loc_7B484
Obj_MechaSonic_Uncurl:
		move.b	#$C,routine(a0)	; Obj_MechaSonic_FallFromUncurl
		move.b	#$1F,y_radius(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)
		clr.b	anim_frame(a0)
		clr.b	anim_frame_timer(a0)
		move.l	#loc_7B4EC,jump(a0)
		jsr	(Random_Number).l
		tst.w	d0
		bmi.s	Obj_MechaSonic_UncurlAndTurn
		bclr	#4,(_unkFAB8).w
		bne.s	Obj_MechaSonic_UncurlAndTurn
		move.l	#AniRaw_MechaSonic_Uncurl,aniraw(a0)
		bclr	#3,objoff_38(a0)
		rts
; ---------------------------------------------------------------------------
; loc_7B4CA
Obj_MechaSonic_UncurlAndTurn:
		move.l	#AniRaw_MechaSonic_UncurlAndTurn,aniraw(a0)
		bset	#3,objoff_38(a0)
		rts
; ---------------------------------------------------------------------------
; loc_7B4DA
Obj_MechaSonic_FallFromUncurl:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite_LightGravity).l
		jmp	(ObjHitFloor_DoRoutine).l
; ---------------------------------------------------------------------------

loc_7B4EC:
		move.b	#$E,routine(a0)	; Obj_MechaSonic_Animate_RawMultiDelay
		clr.w	y_sub(a0)
		clr.b	anim_frame(a0)
		clr.b	anim_frame_timer(a0)
		sfx		sfx_MechaLand
		btst	#3,objoff_38(a0)
		bne.s	loc_7B520
		move.l	#AniRaw_MechaSonic_Crouch,aniraw(a0)
		move.l	#Obj_MechaSonic_Dash,jump(a0)
		rts
; ---------------------------------------------------------------------------

loc_7B520:
		bchg	#0,render_flags(a0)
		move.b	#1,mapping_frame(a0)
		move.l	#AniRaw_MechaSonic_CrouchUncrouch,aniraw(a0)
		move.l	#loc_7B57A,jump(a0)
		rts
; ---------------------------------------------------------------------------
; loc_7B53E
Obj_MechaSonic_Animate_RawMultiDelay:
		jmp	(Animate_RawMultiDelay).l
; ---------------------------------------------------------------------------
; loc_7B544
Obj_MechaSonic_Dash:
		move.b	#$10,routine(a0)	; loc_7B5AC
		move.w	#$820,d0
		move.w	#-$20,d1
		btst	#0,render_flags(a0)
		beq.s	loc_7B55E	; he faces the opposite direction while dashing
		neg.w	d0
		neg.w	d1

loc_7B55E:
		move.w	d0,x_vel(a0)
		move.w	d1,vram_art(a0)
		clr.w	y_vel(a0)
		bset	#2,objoff_38(a0)
		lea	ChildObjDat_7D486(pc),a2
		jmp	(CreateChild6_Simple).l
; ---------------------------------------------------------------------------

loc_7B57A:
		move.b	#$14,routine(a0)	; Obj_MechaSonic_Animate_RawMultiDelay
		move.l	#byte_7D541,aniraw(a0)
		move.l	#loc_7B5E8,jump(a0)
		move.w	(Camera_X_pos).w,d0
		addi.w	#$A0,d0
		bset	#0,render_flags(a0)
		cmp.w	x_pos(a0),d0
		bhs.s	locret_7B5AA
		bclr	#0,render_flags(a0)

locret_7B5AA:
		rts
; ---------------------------------------------------------------------------

loc_7B5AC:
		move.w	vram_art(a0),d0
		add.w	d0,x_vel(a0)
		jsr	(MoveSprite2).l
		lea	loc_7B5C2(pc),a1
		bra.w	loc_7D216
; ---------------------------------------------------------------------------

loc_7B5C2:
		move.b	#$12,routine(a0)	; Obj_MechaSonic_Animate_RawMultiDelay
		move.w	d0,x_pos(a0)
		clr.w	x_sub(a0)
		bclr	#2,objoff_38(a0)
		move.l	#AniRaw_MechaSonic_Uncrouch,aniraw(a0)
		move.l	#loc_7B57A,jump(a0)
		rts
; ---------------------------------------------------------------------------

loc_7B5E8:
		move.b	#$F,y_radius(a0)
		lea	byte_7D54A(pc),a1
		jsr	(Set_Raw_Animation).l
		move.w	#$200,d0
		btst	#0,render_flags(a0)
		bne.s	loc_7B606
		neg.w	d0

loc_7B606:
		move.w	d0,x_vel(a0)
		move.w	#-$600,y_vel(a0)
		move.b	objoff_3B(a0),d0
		addq.b	#1,objoff_3B(a0)
		andi.w	#7,d0
		moveq	#0,d1
		move.b	byte_7B62E(pc,d0.w),d1
		move.b	d1,objoff_3A(a0)
		move.b	byte_7B636(pc,d1.w),routine(a0)
		rts
; ---------------------------------------------------------------------------
byte_7B62E:
		dc.b 0
		dc.b 1
		dc.b 2
		dc.b 0
		dc.b 1
		dc.b 2
		dc.b 0
		dc.b 1
byte_7B636:
		dc.b $16	; Obj_MechaSonic_TestAirDash
		dc.b $1A	; Obj_MechaSonic_TestBounce
		dc.b $1E	; Obj_MechaSonic_Fall
		dc.b 0	; Obj_MechaSonic_Init
; ---------------------------------------------------------------------------
; loc_7B63A
Obj_MechaSonic_TestAirDash:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite).l
		tst.w	y_vel(a0)
		bpl.s	Obj_MechaSonic_AirDash	; he dashes when he starts falling
		rts
; ---------------------------------------------------------------------------
; loc_7B64E
Obj_MechaSonic_AirDash:
		move.b	#$18,routine(a0)	; loc_7B67C
		move.w	#$780,d0
		moveq	#-$20,d1
		btst	#0,render_flags(a0)
		bne.s	.noFlip
		neg.w	d0
		neg.w	d1
; loc_7B666
.noFlip:
		move.w	d0,x_vel(a0)
		move.w	d1,vram_art(a0)
		clr.w	y_vel(a0)
		sfx		sfx_MechaDash
		rts
; ---------------------------------------------------------------------------

loc_7B67C:
		jsr	(Animate_RawMultiDelay).l
		move.w	vram_art(a0),d0
		add.w	d0,x_vel(a0)
		jsr	(MoveSprite2).l
		lea	loc_7B698(pc),a1
		bra.w	loc_7D216
; ---------------------------------------------------------------------------

loc_7B698:
		move.w	d0,x_pos(a0)
		bra.w	loc_7B462
; ---------------------------------------------------------------------------
; loc_7B6A0
Obj_MechaSonic_TestBounce:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite).l
		tst.w	y_vel(a0)
		bmi.s	locret_7B6BE
		jsr	(ObjCheckFloorDist).l
		tst.w	d1
		bmi.s	Obj_MechaSonic_Bounce
		beq.s	Obj_MechaSonic_Bounce

locret_7B6BE:
		rts
; ---------------------------------------------------------------------------
; loc_7B6C0
Obj_MechaSonic_Bounce:
		add.w	d1,y_pos(a0)
		move.b	#$1C,routine(a0)	; Obj_MechaSonic_BounceMovement
		move.w	#-$900,y_vel(a0)
		sfx		sfx_Thump
		rts
; ---------------------------------------------------------------------------
; loc_7B6DA
Obj_MechaSonic_BounceMovement:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite).l
		lea	loc_7B462(pc),a1
		bra.w	loc_7D216
; ---------------------------------------------------------------------------
; loc_7B6EE
Obj_MechaSonic_Fall:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite).l
		tst.w	y_vel(a0)
		bmi.s	locret_7B70C
		jsr	(ObjCheckFloorDist).l
		tst.w	d1
		bmi.s	Obj_MechaSonic_Spindash
		beq.s	Obj_MechaSonic_Spindash

locret_7B70C:
		rts
; ---------------------------------------------------------------------------
; loc_7B70E
Obj_MechaSonic_Spindash:
		add.w	d1,y_pos(a0)
		move.b	#$20,routine(a0)	; Obj_MechaSonic_AnimateAndWait
		move.w	#$F,wait(a0)
		move.l	#loc_7B754,jump(a0)
		bset	#2,objoff_38(a0)
		sfx		sfx_MechaLand
		move.l	#AniRaw_MechaSonic_Spindash,aniraw(a0)
		lea	ChildObjDat_7D480(pc),a2
		jsr	(CreateChild6_Simple).l
		bne.s	locret_7B70C
		move.b	#8,subtype(a1)
		rts
; ---------------------------------------------------------------------------
; loc_7B748
Obj_MechaSonic_AnimateAndWait:
		jsr	(Animate_RawMultiDelay).l
		jmp	(Obj_Wait).l
; ---------------------------------------------------------------------------

loc_7B754:
		move.b	#$22,routine(a0)	; loc_7B77E
		move.w	#$100,d0
		tst.w	x_vel(a0)
		bmi.s	loc_7B766
		neg.w	d0

loc_7B766:
		move.w	d0,x_vel(a0)
		clr.w	y_vel(a0)
		move.w	#7,wait(a0)
		move.l	#loc_7B790,jump(a0)
		rts
; ---------------------------------------------------------------------------

loc_7B77E:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite2).l
		jmp	(Obj_Wait).l
; ---------------------------------------------------------------------------

loc_7B790:
		move.b	#$24,routine(a0)	; loc_7B7BA
		move.w	#$640,d0
		move.w	#-$20,d1
		tst.w	x_vel(a0)
		bmi.s	loc_7B7A8
		neg.w	d0
		neg.w	d1

loc_7B7A8:
		move.w	d0,x_vel(a0)
		move.w	d1,vram_art(a0)
		move.l	#AniRaw_MechaSonic_RollFast,aniraw(a0)
		sfx		sfx_MechaDash
		rts
; ---------------------------------------------------------------------------

loc_7B7BA:
		jsr	(Animate_RawMultiDelay).l
		move.w	vram_art(a0),d0
		add.w	d0,x_vel(a0)
		jsr	(MoveSprite2).l
		lea	loc_7B7D6(pc),a1
		bra.w	loc_7D216
; ---------------------------------------------------------------------------

loc_7B7D6:
		move.b	#$26,routine(a0)	; Obj_MechaSonic_AnimateAndWait
		move.w	#$F,wait(a0)
		move.l	#loc_7B7EC,jump(a0)
		rts
; ---------------------------------------------------------------------------
Obj_MechaSonic_AttemptBlock:
;		move.b	#$20,routine(a0)
		tst.b	mapping_frame(a0)	; standing still?
		beq.s	.cont
		cmpi.b	#$16,mapping_frame(a0)
		beq.s	.cont
		cmpi.b	#$17,mapping_frame(a0)
		beq.s	.cont
		rts
	.cont:
		jsr	(Find_SonicTails).l
;		tst.w	d1	; check if player is above
;		jeq		.ret	; if so, get outta here
		cmpi.b	#id_Roll,anim(a1)
		bne.s	.ret
		cmpi.w	#$2C,d3	; Y distance	; to be fair mecha's pretty damn tall
		bhi.s	.ret	; if he's above you, return
		cmpi.w	#$1E,d2	; X distance
		bhi.s	.justAnimate
	.block:
		move.w	x_vel(a1),d0
		move.w	#$100,d1
		move.w	#-$100,d2
		cmp.w	d2,d0
		blt.s	.keepBlocking
		cmp.w	d1,d0
		bge.s	.keepBlocking
		tst.w	d0
		bpl.s	.flip
		move.w	d2,d1

.flip:
		move.w	d1,d0

.keepBlocking:
		neg.w	d0
		move.w	d0,x_vel(a1)
		neg.w	y_vel(a1)
		neg.w	ground_vel(a1)
		sfx		sfx_Thump
	.justAnimate:
		lea	AniRaw_MechaSonic_Block(pc),a1
		jmp	(Set_Raw_Animation).l
;		tst.b	boss_invulnerable_time(a0)
;		beq.s	.ret
;		jmp		loc_7D338
	.ret:
		rts
; ---------------------------------------------------------------------------

loc_7B7EC:
		move.b	#$28,routine(a0)	; Obj_MechaSonic_SpindashRise
		bclr	#2,objoff_38(a0)
		clr.w	x_vel(a0)
		move.w	#-$640,y_vel(a0)
		rts
; ---------------------------------------------------------------------------
; loc_7B804
Obj_MechaSonic_SpindashRise:
		jsr	(Animate_RawMultiDelay).l
		jsr	(MoveSprite).l
		tst.w	y_vel(a0)
		bpl.w	loc_7B462
		rts

; =============== S U B R O U T I N E =======================================


sub_7D3BE:
		lea	Obj_MechaSonic_FlashPalSlots(pc),a1
		lea	Obj_MechaSonic_FlashPalColors(pc,d0.w),a2
		jmp	(CopyWordData_5).l
; End of function sub_7D3BE

; ---------------------------------------------------------------------------
Obj_MechaSonic_FlashPalSlots:
	dc.w Normal_palette_line_2+$14
	dc.w Normal_palette_line_2+$18
	dc.w Normal_palette_line_2+$1A
	dc.w Normal_palette_line_2+$1C
	dc.w Normal_palette_line_2+$1E
Obj_MechaSonic_FlashPalColors:
		dc.w   $228,  $E24,  $A24,  $622,  $422	; regular
		dc.w   $888,  $666,  $888,  $AAA,  $EEE	; flashing
ObjDat4_7D3EA:	dc.w 2
		dc.w $A3F4
		dc.w $28
		dc.w 0
		dc.l Map_MechaSonic
		dc.w $280
		dc.b $20
		dc.b $20
		dc.b 0
		dc.b $23
word_7D3FC:	dc.w $80
		dc.b $10
		dc.b $10
		dc.b 0
		dc.b 0
ObjDat3_7D402:	dc.l Map_MechaSonicExtra
		dc.w $841C
		dc.w $200
		dc.b $C
		dc.b 4
		dc.b 0
		dc.b 0
ObjDat3_7D40E:	dc.l Map_MechaSonicExtra
		dc.w $A41C
		dc.w $200
		dc.b $14
		dc.b $10
		dc.b 4
		dc.b 0
ChildObjDat_7D474:
		dc.w 0
		dc.l loc_7C9BA
ChildObjDat_7D47A:
		dc.w 1
		dc.l loc_7C902
ChildObjDat_7D480:
		dc.b 0
		dc.b 0
		dc.l loc_7C902
ChildObjDat_7D486:
		dc.w 1
		dc.l Obj_MechaSonic_SpindashSparks
ChildObjDat_7D48C:
		dc.w 0
		dc.l Obj_MechaSonic_Sparks
DPLCPtr_MechaSonic:
		dc.l ArtUnc_MechaSonic>>1
		dc.l PLC_MechaSonic
; byte_7D4DE
AniRaw_MechaSonic_Uncurl:	dc.b    3,   0
		dc.b    4,   1
		dc.b    5,   2
		dc.b    6,   3
		dc.b    7,   4
		dc.b    8,   5
		dc.b  arfBack,  $E
		dc.b    8, $7F
		dc.b  arfEnd
; byte_7D4EF
AniRaw_MechaSonic_UncurlAndTurn:	dc.b    3,   0
		dc.b    4,   1
		dc.b    5,   2
		dc.b    6,   3
		dc.b    7,   4
		dc.b    8,   4
		dc.b    9,   4
		dc.b   $A,   4
		dc.b   $B,   4
		dc.b   $C,   4
		dc.b  arfBack, $16
		dc.b   $C, $7F
		dc.b  arfEnd
byte_7D508:	dc.b  $13,   5
		dc.b  $13,   5
		dc.b    8, $7F
		dc.b  arfBack, $E4
byte_7D510:	dc.b    1,   5
		dc.b    1,   5
		dc.b    2,   9
		dc.b    1,   5
		dc.b  arfJump
; byte_7D519
AniRaw_MechaSonic_Roll:	dc.b    3,   1
		dc.b    3,   1
		dc.b    4,   1
		dc.b    5,   1
		dc.b  arfBack,  $A
; byte_7D523
AniRaw_MechaSonic_RollFast:	dc.b    3,   0
		dc.b    4,   0
		dc.b    5,   0
		dc.b  arfEnd
; byte_7D52A
AniRaw_MechaSonic_AirCurl:	dc.b    8,   0
		dc.b    7,   3
		dc.b    6,   3
		dc.b    3,   1
		dc.b    4,   1
		dc.b    5,   1
		dc.b  arfBack, $F9
; byte_7D538
AniRaw_MechaSonic_AirUncurl:	dc.b    6,   3
		dc.b    6,   3
		dc.b    7,   3
		dc.b    8, $1F
		dc.b  arfJump
byte_7D541:	dc.b    0,   0
		dc.b    1,   5
		dc.b    2,   9
		dc.b    1,   0
		dc.b  arfJump
byte_7D54A:	dc.b    1,   0
		dc.b    1,   1
		dc.b    3,   1
		dc.b    4,   1
		dc.b    5,   1
		dc.b  arfBack, $D9
byte_7D556:	dc.b  $12,   0
		dc.b  $12,   5
		dc.b   $D,   3
		dc.b    8,   5
		dc.b    1,   1
		dc.b  arfJump
; byte_7D561
AniRaw_MechaSonic_Jump:	dc.b    1,   3
		dc.b    1,   7
		dc.b    2,   7
		dc.b    1,   3
		dc.b    8,   0
		dc.b  arfJump
; byte_7D56C
AniRaw_MechaSonic_Turn:	dc.b    8,   5
		dc.b    8,   5
		dc.b    9,   3
		dc.b   $A,   3
		dc.b   $B,   3
		dc.b   $C,   3
		dc.b  $48, $7F
		dc.b  arfBack, $80
byte_7D57C:	dc.b    8,   5
		dc.b  $13,   5
		dc.b  $14, $7F
		dc.b  arfBack,   8
		dc.b  $15, $7F
		dc.b  arfEnd
byte_7D587:	dc.b    1,   5
		dc.b    1,   5
		dc.b  $10,  $F
		dc.b    1,   5
		dc.b  $11, $17
		dc.b    0,   5
		dc.b    8,   3
		dc.b  arfJump
AniRaw_MechaSonic_Crouch:	dc.b    1,   5
		dc.b    2, $1F
		dc.b  arfJump
AniRaw_MechaSonic_Uncrouch:	dc.b    2,   0
		dc.b    1,   5
		dc.b    0, $3F
		dc.b  arfJump
AniRaw_MechaSonic_CrouchUncrouch:	dc.b    1,   5
		dc.b    2,   9
		dc.b    1,   5
		dc.b    0, $3F
		dc.b  arfJump
byte_7D5AB:	dc.b    1,   5
		dc.b    1,   5
		dc.b    2,   9
		dc.b  $13,   5
		dc.b  $15,   3
		dc.b  arfJump
byte_7D5B6:	dc.b    1,   5
		dc.b    1,   5
		dc.b    2,   9
		dc.b  $13,   5
		dc.b  $15, $7F
		dc.b  arfJump
byte_7D5C1:	dc.b    3,   1
		dc.b    3,   1
		dc.b    4,   1
		dc.b    5,   1
		dc.b    6,   3
		dc.b    7,   4
		dc.b    8,   3
		dc.b    1,   5
		dc.b    2,   9
		dc.b    1,   5
		dc.b    0,   3
		dc.b  arfJump
byte_7D5D8:	dc.b   $C,   3
		dc.b   $C,   3
		dc.b   $A,   3
		dc.b    9,   3
		dc.b    8,   3
		dc.b  arfBack, $42
byte_7D5E4:	dc.b   $E,   5
		dc.b   $E,   5
		dc.b   $F,   3
		dc.b  arfBack,   8
		dc.b   $F, $7F
		dc.b  arfEnd
byte_7D5EF:	dc.b   $F,   5
		dc.b   $E,   5
		dc.b    2,   1
		dc.b  arfJump
byte_7D5F6:	dc.b    2,   5
		dc.b    2,  $F
		dc.b    1,   5
		dc.b    8,   0
		dc.b  arfJump
byte_7D5FF:	dc.b    1,   3
		dc.b    1,   3
		dc.b    2,  $F
		dc.b    1,   3
		dc.b    8,   0
		dc.b  arfJump
byte_7D60A:	dc.b    8,   7
		dc.b    8,   7
		dc.b    9,   5
		dc.b   $A,   5
		dc.b   $B,   5
		dc.b   $C,   5
		dc.b  $48, $7F
		dc.b  arfBack, $10
byte_7D61A:	dc.b    8, $7F
		dc.b  $FC,   2
		dc.b    5,   2
		dc.b    5,   1
		dc.b    5,   8
		dc.b    0, arfJump
byte_7D626:	dc.b    8,   1
		dc.b    8,   1
		dc.b    9,   1
		dc.b   $A,   1
		dc.b   $B,   1
		dc.b   $C,   0
		dc.b  $48, $7F
		dc.b  arfBack, $24
byte_7D636:	dc.b    8,   3
		dc.b    8,   3
		dc.b    9,   3
		dc.b   $A,   3
		dc.b   $B,   3
		dc.b   $C,   3
		dc.b  $48,   3
		dc.b  arfJump
byte_7D645:	dc.b    8,   3
		dc.b    8,  $F
		dc.b    1,   5
		dc.b  $10,  $F
		dc.b    1,   5
		dc.b  $11,   0
		dc.b  arfJump
byte_7D652:	dc.b    8,   1
		dc.b    8,   1
		dc.b   $D,   5
		dc.b  $12, $7F
		dc.b  arfBack,  $A
		dc.b  $12, $7F
		dc.b  arfEnd
; byte_7D65F
AniRaw_MechaSonic_SpindashSparks:	dc.b    1,   1	; I think this is the spark for his spindash.
		dc.b    2,   1
		dc.b    3,   1
		dc.b    0,   0
		dc.b  arfEnd
byte_7D668:	dc.b  $11,   3
		dc.b  $11,   3
		dc.b    0,   3
		dc.b  $11,   3
		dc.b    0,   3
		dc.b  $11,   3
		dc.b  $12, $1B
		dc.b  $13,   5
		dc.b  $14, $3F
		dc.b  arfJump
byte_7D67B:	dc.b    0,   0,   8,   9
		dc.b    0, $17, $18, arfEnd
byte_7D683:	dc.b   $E,   1
		dc.b   $E,   1
		dc.b   $F,   2
		dc.b  $10,   3
		dc.b  arfJump
byte_7D68C:	dc.b    0,  $A,  $A,   0
		dc.b   $A,  $B,   0,  $A
		dc.b   $C,   0,  $A,  $B
		dc.b    0,  $A,  $D,   0
		dc.b  $19,  $D,   0,  $B
		dc.b   $D,   0, arfJump
byte_7D6A3:	dc.b    0,   0,  $D, $16
		dc.b    0,  $D,  $C, $16
		dc.b    0,  $D, $16,   0
		dc.b   $D, $19, $16, arfEnd
byte_7D6B3:	dc.b    0,  $B,  $B,  $D
		dc.b    0,  $B,  $D,   0
		dc.b   $B,  $D,   0,  $A
		dc.b   $B,   0,  $A,  $B
		dc.b    0,  $A,  $B,   0
		dc.b   $A,   0,  $A,   0
		dc.b   $A,   0,  $A,   0
		dc.b   $A,   0,  $A,   0
		dc.b   $A,   0,  $A,   0
		dc.b  arfJump
; this is new.
AniRaw_MechaSonic_Block:
		dc.b $16, 2
		dc.b $17, 5
		dc.b $16, 2
		dc.b 0,   5
;		dc.b $FF, arfJump
		dc.b arfJump	; all of his other animations do this instead...
AniRaw_MechaSonic_Spindash:
		dc.b  $18,   0
		dc.b  $19,   0
		dc.b  $1A,   0
		dc.b  arfEnd
	even

; ---------------------------------------------------------------------------

loc_7D216:
		tst.w	x_vel(a0)
		bmi.s	loc_7D228
		move.w	(_unkFAB6).w,d0
		cmp.w	x_pos(a0),d0
		bls.s	loc_7D234
		rts
; ---------------------------------------------------------------------------

loc_7D228:
		move.w	(_unkFAB4).w,d0
		cmp.w	x_pos(a0),d0
		bhs.s	loc_7D234
		rts
; ---------------------------------------------------------------------------

loc_7D234:
		jmp	(a1)

; =============== S U B R O U T I N E =======================================

; sub_7D2D8
Obj_MechaSonic_SetCollisionType:
		btst	#6,status(a0)
		bne.s	locret_7D2FA
		moveq	#0,d0
		move.b	mapping_frame(a0),d0
		move.b	Obj_MechaSonic_CollisionTypes(pc,d0.w),d0
		btst	#7,objoff_38(a0)
		beq.s	loc_7D2F6
		ori.b	#-$80,d0

loc_7D2F6:
		move.b	d0,collision_flags(a0)

locret_7D2FA:
		rts
; End of function Obj_MechaSonic_SetCollisionType

; ---------------------------------------------------------------------------
; byte_7D2FC
Obj_MechaSonic_CollisionTypes:
	; Idle/Crouching
		dc.b $23
		dc.b $23
		dc.b 9
	; Ball
		dc.b $86
		dc.b $86
		dc.b $86
		dc.b $86	; uncurl
	; Falling/Turning
		dc.b $1A	; uncurl 2
		dc.b $23
		dc.b $23
		dc.b $23
		dc.b $23
		dc.b $23
		dc.b $23
	; defeated
		dc.b 9
		dc.b 0	; on the ground, hella dead
	; transform
		dc.b 9
		dc.b $23
	; fly
		dc.b 6
	; power-up on emerald
		dc.b $23
		dc.b $23
		dc.b $23
	; block
		dc.b 6
		dc.b 6
	; Spindash
		dc.b $86
		dc.b $86
		dc.b $86
	even

; =============== S U B R O U T I N E =======================================

; sub_7D312
Obj_MechaSonic_HandleDamage:
		tst.b	collision_flags(a0)
		bne.s	locret_7D356
		move.b	boss_hitcount2(a0),d0
		beq.s	loc_7D358
		tst.b	boss_invulnerable_time(a0)
		bne.s	loc_7D338
		move.b	#$20,boss_invulnerable_time(a0)
		sfx		sfx_BossHit
		bset	#6,status(a0)

loc_7D338:
		moveq	#0,d0
		btst	#0,boss_invulnerable_time(a0)
		bne.s	loc_7D346
		addi.w	#10,d0	; skip first 5 colors of set

loc_7D346:
		bsr.w	sub_7D3BE
		subq.b	#1,boss_invulnerable_time(a0)
		bne.s	locret_7D356
		bclr	#6,status(a0)

locret_7D356:
		rts
; ---------------------------------------------------------------------------

loc_7D358:
		jmp	(a4)
; End of function Obj_MechaSonic_HandleDamage


; =============== S U B R O U T I N E =======================================

; sub_7D35A
Obj_MechaSonic_Explode:
		move.l	#loc_7B81A,(a0)
		clr.b	routine(a0)	; Obj_MechaSonic_Init, except we're just clearing the routine so Lol
		move.l	#loc_7B858,jump(a0)
		bset	#6,status(a0)
		clr.b	(Update_HUD_timer).w
		move.w	#$7F,wait(a0)
		moveq	#$64,d0
		jsr	(HUD_AddToScore).l
		bclr	#7,render_flags(a0)
		lea	(Child6_CreateBossExplosion).l,a2
		jsr	CreateChild1_Normal
		bne.s	locret_7D39C
		move.b	#4,subtype(a1)

locret_7D39C:
		rts
; End of function Obj_MechaSonic_Explode

loc_7C9BA:
		lea	word_7D3FC(pc),a1
		jsr	SetUp_ObjAttributes3
		move.l	#loc_7C9C8,(a0)

loc_7C9C8:
		bsr.w	Obj_MechaSonic_Spines_SetCollision
		jsr	Refresh_ChildPositionAdjusted
		movea.w	parent3(a0),a1
		btst	#7,status(a1)
		jne		Go_Delete_Sprite
		jmp	(Add_SpriteToCollisionResponseList).l
; ---------------------------------------------------------------------------

Obj_MechaSonic_SpindashSparks:
		addq.b	#4,subtype(a0)

loc_7C902:
		lea	ObjDat3_7D402(pc),a1
		jsr	SetUp_ObjAttributes
		move.l	#loc_7C91C,(a0)
		bsr.w	sub_7D236
		sfx		sfx_MechaRoll

loc_7C91C:
		lea	AniRaw_MechaSonic_SpindashSparks(pc),a1
		jsr	Animate_RawNoSSTMultiDelay
		jsr	Refresh_ChildPositionAdjusted
		movea.w	parent3(a0),a1
		btst	#7,status(a1)
		jne		Go_Delete_Sprite
		btst	#2,objoff_38(a1)
		jeq		Go_Delete_Sprite
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

Obj_MechaSonic_Sparks:
		lea	ObjDat3_7D40E(pc),a1
		jsr	SetUp_ObjAttributes
		move.l	#loc_7C964,(a0)
		bclr	#7,subtype(a0)
		beq.s	loc_7C964
		bclr	#2,render_flags(a0)

loc_7C964:
		movea.w	parent3(a0),a1
		btst	#6,objoff_38(a1)
		jne		Delete_Current_Sprite
		cmpi.w	#$E66,(Normal_palette_line_2+$8).w	; yes, it does check for a color. yes, it's dumb. no, i don't care.
		bne.w	locret_7B448
		sfx		sfx_MechaSpark
		moveq	#0,d0
		bchg	#0,count(a0)
		bne.s	loc_7C990
		moveq	#4,d0

loc_7C990:
		add.b	subtype(a0),d0
		lea	word_7C9AA(pc,d0.w),a2
		move.w	(a2)+,parent(a0)
		move.b	(a2)+,mapping_frame(a0)
		jsr	Refresh_ChildPositionAdjusted
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------
word_7C9AA:
		dc.w $FC0C
		dc.b 4
		dc.w 0
		dc.b 8
		dc.w $500
		dc.b 8
		dc.w $406
		dc.b 0
		dc.w $804
		dc.b 7
		dc.b 0

; =============== S U B R O U T I N E =======================================


sub_7D236:
		moveq	#0,d0
		move.b	subtype(a0),d0
		add.w	d0,d0
		lea	word_7D24C(pc,d0.w),a1
		move.w	(a1)+,parent(a0)
		move.w	(a1)+,priority(a0)
		rts
; End of function sub_7D236

; ---------------------------------------------------------------------------
word_7D24C:	dc.w  $FC1C,  $300
		dc.w   $81C,  $200
		dc.w  $F81C,  $200
		dc.w   $41C,  $300
		dc.w   $C0C,  $200

; =============== S U B R O U T I N E =======================================

; sub_7D260
Obj_MechaSonic_Spines_SetCollision:
		lea	word_7D280(pc),a1
		movea.w	parent3(a0),a2
		moveq	#0,d0
		move.b	mapping_frame(a2),d0
		lsl.w	#2,d0
		adda.w	d0,a1
		move.w	(a1)+,parent(a0)
		move.b	(a1)+,collision_flags(a0)
		move.b	(a1)+,mapping_frame(a0)
		rts
; End of function Obj_MechaSonic_Spines_SetCollision

; ---------------------------------------------------------------------------
word_7D280:
		dc.w $10F4
		dc.b $B4
		dc.b 2
		dc.w $10FC
		dc.b $B4
		dc.b 2
		dc.w $1000
		dc.b $B4
		dc.b 2
		dc.w 0
		dc.b 0
		dc.b 0
		dc.w 0
		dc.b 0
		dc.b 0
		dc.w 0
		dc.b 0
		dc.b 0
		dc.w 0
		dc.b 0
		dc.b 0
		dc.w $14F8
		dc.b $9E
		dc.b 1
		dc.w $10F4
		dc.b $9E
		dc.b 1
		dc.w $CEC
		dc.b $98
		dc.b 0
		dc.w $EC
		dc.b $B3
		dc.b 8
		dc.w $F4EC
		dc.b $98
		dc.b 0
		dc.w $F0F4
		dc.b $B4
		dc.b 2
		dc.w $10F4
		dc.b $B4
		dc.b 2
		dc.w $1004
		dc.b $B4
		dc.b 2
		dc.w $140C
		dc.b $B4
		dc.b 2
		dc.w $1705
		dc.b $B4
		dc.b 2
		dc.w $10F4
		dc.b $B4
		dc.b 2
		dc.w $CF4
		dc.b $9E
		dc.b 1
		dc.w $10F4
		dc.b $B4
		dc.b 2
		dc.w $10F4
		dc.b $B4
		dc.b 2
		dc.w $10F4
		dc.b $B4
		dc.b 2
	; blocking frames
		dc.w $10F5
		dc.b $B4
		dc.b 2
		dc.w $10F6
		dc.b $B4
		dc.b 2
	; spindash frames
		dc.w 0
		dc.b 0
		dc.b 0
		dc.w 0
		dc.b 0
		dc.b 0
		dc.w 0
		dc.b 0
		dc.b 0

loc_7B81A:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	off_7B838(pc,d0.w),d1
		jsr	off_7B838(pc,d1.w)
		lea	DPLCPtr_MechaSonic(pc),a2
		jsr	(Perform_DPLC).l
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------
off_7B838:	offsetTable
		offsetTableEntry.w loc_7B852
		offsetTableEntry.w loc_7B87C
		offsetTableEntry.w loc_7B93E
; ---------------------------------------------------------------------------

loc_7B852:
		jmp	(Obj_Wait).l
; ---------------------------------------------------------------------------

loc_7B858:
		move.b	#2,routine(a0)	; loc_7B87C
		move.b	#$E,mapping_frame(a0)
		move.b	#$1F,y_radius(a0)
		clr.w	x_vel(a0)
		clr.w	y_vel(a0)
		move.l	#loc_7B888,jump(a0)
		rts
; ---------------------------------------------------------------------------

loc_7B87C:
		jsr	(MoveSprite_LightGravity).l
		jmp	(ObjHitFloor_DoRoutine).l
; ---------------------------------------------------------------------------

loc_7B888:
		move.b	#$23,y_radius(a0)
		lea	byte_7D5E4(pc),a1
		jsr	(Set_Raw_Animation).l
		lea	(word_7D842).l,a1
		bsr.w	sub_7C678
		lea	ChildObjDat_7D48C(pc),a2
		jsr	(CreateChild6_Simple).l
		sfx		sfx_MechaLand
		move.b	#4,routine(a0)
		st	(Level_end_flag).w
		bset	#5,objoff_38(a0)
		bclr	#3,objoff_38(a0)
		move.w	#$77,wait(a0)
		jsr	(Create_New_Sprite).l
		bne.s	locret_7B8E4
		move.l	#Obj_EggCapsule,(a1)
		bset	#1,render_flags(a1)

locret_7B8E4:
		rts
; ---------------------------------------------------------------------------

loc_7B93E:
		jsr	(Run_PalRotationScript).l
		jmp	(Animate_RawMultiDelay).l

; =============== S U B R O U T I N E =======================================


sub_7C678:
		lea	(Palette_rotation_data).w,a2
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		clr.w	(a2)
		rts
; End of function sub_7C678
; ---------------------------------------------------------------------------

loc_7D056:
		move.l	#loc_7D062,(a0)
		move.w	#$77,wait(a0)

loc_7D062:
		moveq	#2,d0
		jsr	(sub_868F8).l
		tst.b	routine(a0)
		beq.s	locret_7D076
		move.l	#loc_7D078,(a0)

locret_7D076:
		rts
; ---------------------------------------------------------------------------

loc_7D078:
;		jsr	(Check_TailsEndPose).l
		tst.b	(Level_end_flag).w
		bne.s	locret_7D076
		jsr	(Restore_PlayerControl).l
		lea	(Player_2).w,a1
		jsr	(Restore_PlayerControl2).l
		jmp	(Delete_Current_Sprite).l

word_7D842:	palscriptptr .header, .data
		dc.w 0
.header	palscripthdr	Normal_palette_line_2+$00, 16, 0
.data	palscriptfile	50,"Objects/Mecha Sonic/Palettes/Main.bin"
	palscriptfile	2, "Objects/Mecha Sonic/Palettes/Flash 2.bin"
	palscriptfile	1, "Objects/Mecha Sonic/Palettes/Flash 1.bin"
	palscriptfile	5, "Objects/Mecha Sonic/Palettes/Main.bin"
	palscriptfile	2, "Objects/Mecha Sonic/Palettes/Flash 2.bin"
	palscriptfile	1, "Objects/Mecha Sonic/Palettes/Flash 1.bin"
	palscriptfile	50,"Objects/Mecha Sonic/Palettes/Main.bin"
	palscriptfile	2, "Objects/Mecha Sonic/Palettes/Flash 2.bin"
	palscriptfile	1, "Objects/Mecha Sonic/Palettes/Flash 1.bin"
	palscriptfile	20,"Objects/Mecha Sonic/Palettes/Main.bin"
	palscriptfile	2, "Objects/Mecha Sonic/Palettes/Flash 2.bin"
	palscriptfile	1, "Objects/Mecha Sonic/Palettes/Flash 1.bin"
	palscriptrept

PLC_BossExplosion:
		dc.w 0
		dc.l ArtKosM_BossExplosion
		dc.w $A000

; ===========================================================================
; Maps/PLCs
; ===========================================================================
Map_MechaSonic:			binclude	"Objects/Mecha Sonic/Object Data/Map - Mecha Sonic.bin"
Map_MechaSonicExtra:	binclude	"Objects/Mecha Sonic/Object Data/Map - Mecha Sonic Extra.bin"
PLC_MechaSonic:			binclude	"Objects/Mecha Sonic/Object Data/PLC - Mecha Sonic.bin"