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
		offsetTableEntry.w	Obj_SilverSonic_Init			; case 0
		offsetTableEntry.w	Obj_SilverSonic_StartDown		; case 1
		offsetTableEntry.w	Obj_SilverSonic_FloatDown		; case 2
		offsetTableEntry.w	Obj_SilverSonic_SawHead			; case 3
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared	; case 4
		offsetTableEntry.w	Obj_SilverSonic_TurnAroundMaybe	; case 5
		offsetTableEntry.w	Obj_SilverSonic_MoveOrSomething	; case 6
		offsetTableEntry.w	Obj_SilverSonic_ChargeSpindash	; case 7 -- is this even right?
		offsetTableEntry.w	Obj_SilverSonic_ReleaseSpindash	; case 8 -- seems to be.
		offsetTableEntry.w	Obj_SilverSonic_SpindashMove	; case 9 -- might not be named right.
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared	; case 10
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared2; case 11
		offsetTableEntry.w	Obj_SilverSonic_MoveAndFall		; case 12
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared	; case 13
		offsetTableEntry.w	Obj_SilverSonic_SomethingShared2; case 14
		offsetTableEntry.w	Obj_SilverSonic_ShootSpikes		; case 15
		offsetTableEntry.w	Obj_SilverSonic_Return			; case 16 -- a single "break" lol
		offsetTableEntry.w	Obj_SilverSonic_Explode			; case 17 -- may not be correct
		offsetTableEntry.w	Obj_SilverSonic_Delete			; case 18 -- jumped to by the previous state
; ---------------------------------------------------------------------------
Obj_SilverSonic_Init:	; Case 0
		lea		ObjDat4_SilverSonic(pc),a1
		jsr		(SetUp_ObjAttributesSlotted).l
;		addq.b	#2,routine(a0)
		move.b	#8*3,x_radius(a0)
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
		addq.w	#1,wait(a0)
		cmpi.w	#60,wait(a0)
		beq.s	.playsnd
		cmpi.w	#120,wait(a0)
		beq.s	.playsnd
	.contsnd:
		; something about oscillation, probably related to the flame sprite
		move.w	#$100,y_pos(a0)
		jsr	SpeedToPos
;		addi.w	#$100,y_pos(a0)
		jsr	(ObjCheckFloorDist).l
		tst.w	d1
		bmi.s	.landed
		beq.s	.landed
		rts
	.landed:
		add.w	d1,y_pos(a0)
		addq.b	#2,routine(a0)
	; function100
		rts
	.playsnd:
		sfx		sfx_FireAttack
		bra.s	.contsnd

Obj_SilverSonic_SawHead:
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










Map_SilverSonicMisc:	binclude	"Objects/Silver Sonic/Object Data/Map - Silver Sonic Misc.bin"