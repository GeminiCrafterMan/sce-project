; ----------------------------------------------------------------------------
; Silver Sonic from S2's DEZ
; Fucking hate Sonic 2's code so I'm just gonna rewrite him from scratch
; Suck my balls, Yuji Naka
; ----------------------------------------------------------------------------
; Sprite_3972C:
Obj_SilverSonic:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Obj_SilverSonic_Index(pc,d0.w),d1
		jsr	Obj_SilverSonic_Index(pc,d1.w)
;		lea	Obj_SilverSonic_Explode(pc),a4
;		bsr.w	Obj_SilverSonic_HandleDamage
;		bsr.w	Obj_SilverSonic_SetCollisionType
		lea	DPLCPtr_SilverSonic(pc),a2
		jsr	(Perform_DPLC).l
		jmp	(Draw_And_Touch_Sprite).l
; ---------------------------------------------------------------------------
Obj_SilverSonic_Index:	offsetTable	; ObjectMain
		offsetTableEntry.w	Obj_SilverSonic_Init			; $00 ; case 0
		offsetTableEntry.w	Obj_SilverSonic_StartDown		; $02 ; case 1
		offsetTableEntry.w	Obj_SilverSonic_FloatDown		; $04 ; case 2
		offsetTableEntry.w	Obj_SilverSonic_SawHead			; $06 ; case 3
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared	; $08 ; case 4
		offsetTableEntry.w	Obj_SilverSonic_TurnAroundMaybe	; $0A ; case 5
		offsetTableEntry.w	Obj_SilverSonic_MoveOrSomething	; $0C ; case 6
		offsetTableEntry.w	Obj_SilverSonic_ChargeSpindash	; $0E ; case 7 -- is this even right?
		offsetTableEntry.w	Obj_SilverSonic_ReleaseSpindash	; $10 ; case 8 -- seems to be.
		offsetTableEntry.w	Obj_SilverSonic_SpindashMove	; $12 ; case 9 -- might not be named right.
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared	; $14 ; case 10
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared2; $16 ; case 11
		offsetTableEntry.w	Obj_SilverSonic_MoveAndFall		; $18 ; case 12
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared	; $1A ; case 13
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared2; $1C ; case 14
		offsetTableEntry.w	Obj_SilverSonic_ShootSpikes		; $1E ; case 15
		offsetTableEntry.w	Obj_SilverSonic_Return			; $20 ; case 16 -- a single "break" lol
		offsetTableEntry.w	Obj_SilverSonic_Explode			; $22 ; case 17 -- may not be correct
		offsetTableEntry.w	Obj_SilverSonic_Delete			; $24 ; case 18 -- jumped to by the previous state
; ---------------------------------------------------------------------------
Obj_SilverSonic_Init:	; Case 0
		lea		ObjDat4_SilverSonic(pc),a1
		jsr		(SetUp_ObjAttributesSlotted).l
;		addq.b	#2,routine(a0)
		;move.b	#8*3,x_radius(a0)	; wrong!!
		move.b	#$1B,y_radius(a0)
		move.b	#$10,x_radius(a0)
	; this part's stolen from 3K Mecha
;		move.w	(Camera_X_pos).w,d0
;		addi.w	#$20,d0
;		move.w	d0,(_unkFAB4).w
;		addi.w	#$100,d0
;		move.w	d0,(_unkFAB6).w
;		addi.w	#$40,d0
;		move.w	d0,x_pos(a0)
;		move.w	(Camera_Y_pos).w,d0
;		addi.w	#$30,d0
;		move.w	d0,(_unkFAB0).w
;		addi.w	#$70,d0
;		move.w	d0,y_pos(a0)
	; load art and palette
		move.b	#8,boss_hitcount2(a0)
		lea	(ArtKosM_SilverSonicMisc).l,a1
		move.w	#-$7C80,d2
		jsr	(Queue_Kos_Module).l
		lea	(PLC_BossExplosion).l,a5
		jsr	(LoadPLC_Raw_KosM).l
		lea	(Pal_SilverSonic).l,a1
		lea	(Normal_palette_line_2).w,a2
		jsr	(PalLoad_Line16).l
		jsr	(Create_New_Sprite).l
		bne.s	.ret
		move.w	#$100,y_vel(a0)	; used to float down
		move.l	#Obj_Song_Fade_Transition,(a1)
		move.b	#bgm_MidBoss,subtype(a1)
;		music	bgm_MidBoss
	.ret:
		rts

Obj_SilverSonic_StartDown:	; Case 1
		addq.w	#1,wait(a0)
		cmpi.w	#45,wait(a0)
		blt.s	.ret
		clr.b	wait(a0)
		sfx		sfx_FireAttack
		addq.b	#2,routine(a0)
	.ret:
		rts

Obj_SilverSonic_FloatDown:	; Case 2
		move.b	(V_int_run_count+3).w,d0	; v_vbla_byte
		andi.b	#$1F,d0
		bne.s	.noSound
		sfx		sfx_FireAttack
	.noSound:
		; something about oscillation, probably related to the flame sprite
;		move.w	#$100,y_pos(a0)
;		jsr	SpeedToPos
;		addi.w	#$100,y_pos(a0)
		jsr	(ObjCheckFloorDist).l
		tst.w	d1
		bmi.s	.landed
;		beq.s	.landed
		jmp		SpeedToPos	; Uses the y-vel set during the init routine.
	.landed:
		add.w	d1,y_pos(a0)
		clr.w	y_vel(a0)
		move.b	#$1A,collision_flags(a0)
		bset	#1,status(a0)
		bra.w	SilverSonic_Function100

Obj_SilverSonic_SawHead:
		subq.w	#1,wait(a0)
		beq.s	.ret	; loc_39886 thing
		cmpi.w	#50,wait(a0)
		bne.s	.noSaw2
		sfx		sfx_MechaRoll
	.noSaw2:
	; testing S2 code...
		jsr		(ObjCheckFloorDist).l
		add.w	d1,y_pos(a0)
		jsr		Animate_RawMultiDelay
	;	bsr.w	loc_39D4A	; I think this handles flipping his sprite?
;		tst.w	wait(a0)
;		bne.s	.ret
;		nop	; filler
;	;								; GetTableValue(object.state, object.value1, MechaSonic_table41)
;	;								; object.value1++
;	;								; object.value1 &= 15
	.ret:						; end if
		rts						; break

Obj_SilverSonic_SomethingShared:
Obj_SilverSonic_TurnAroundMaybe:
Obj_SilverSonic_MoveOrSomething:
Obj_SilverSonic_ChargeSpindash:
Obj_SilverSonic_ReleaseSpindash:
Obj_SilverSonic_SpindashMove:
Obj_SilverSonic_SomethingShared2:
Obj_SilverSonic_MoveAndFall:
Obj_SilverSonic_ShootSpikes:
Obj_SilverSonic_Return:
Obj_SilverSonic_Explode:
		rts

Obj_SilverSonic_Delete:
		addi.w	#1,wait(a0)
		cmpi.w	#60,wait(a0) ; ...?
		jeq		DeleteObject
		rts

SilverSonic_Function100:						; function MechaSonic_Function100
		move.w	#100,wait(a0)						; object.value0 = 100
		sfx		sfx_MechaBuSawLift					; PlaySfx(SfxName[Saw],0)
		move.l	#AniRaw_SilverSonic_SawHead,aniraw(a0)	; object.animation = 1
		move.b	#6,routine(a0)						; object.state = 3
		rts										; end function

; ---------------------------------------------------------------------------
; object data
ObjDat4_SilverSonic:
		dc.w 2
		dc.w $A3F4
		dc.w $28
		dc.w 0
		dc.l Map_SilverSonic
		dc.w $200
		dc.b $10
		dc.b $10
		dc.b 0
		dc.b $23

DPLCPtr_SilverSonic:
		dc.l ArtUnc_SilverSonic>>1
		dc.l PLC_SilverSonic

Map_SilverSonic:	binclude	"Objects/Silver Sonic/Object Data/Map - Silver Sonic.bin"
PLC_SilverSonic:	binclude	"Objects/Silver Sonic/Object Data/PLC - Silver Sonic.bin"
; ---------------------------------------------------------------------------
; What was all this empty space for? I don't remember.
; Guess I'll use it for tables...
; Or animation data...
AniRaw_SilverSonic_SawHead:
		dc.b	0, 2
		dc.b	1, 2
		dc.b	2, 2
		dc.b	3, 2
		dc.b	arfEnd
AniRaw_SilverSonic_Dash:
		dc.b	4, $45	; holy crap
		dc.b	arfEnd
AniRaw_SilverSonic_DashTurn:
		dc.b	5, 3
		dc.b	6, 3
		dc.b	5, 3
		dc.b	4, 3
		dc.b	arfEnd
AniRaw_SilverSonic_Roll1:
		dc.b	4, 6
		dc.b	7, 9
		dc.b	8, 9
		dc.b	9, 9
		dc.b	7, 6
		dc.b	8, 6
		dc.b	9, 6
		dc.b	7, 3
		dc.b	8, 3
		dc.b	9, 3
		dc.b	arfEnd
AniRaw_SilverSonic_RollLoop:
		dc.b	7, 2
		dc.b	8, 2
		dc.b	9, 2
		dc.b	arfEnd
AniRaw_SilverSonic_Roll2:
		dc.b	9, 3
		dc.b	8, 3
		dc.b	7, 3
		dc.b	9, 6
		dc.b	8, 6
		dc.b	7, 6
		dc.b	9, 9
		dc.b	8, 9
		dc.b	7, 9
		dc.b	4, 6
		dc.b	arfEnd
	even

; Child object animations
AniRaw_SilverSonicMisc_FloatingDownFlame:
		dc.b	2, 3
		dc.b	3, 3
		dc.b	arfEnd
	even

Map_SilverSonicMisc:	binclude	"Objects/Silver Sonic/Object Data/Map - Silver Sonic Misc.bin"