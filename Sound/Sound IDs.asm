; ---------------------------------------------------------------------------
; Sound IDs
; ---------------------------------------------------------------------------
; Background music
offset :=	MusicIndex
ptrsize :=	4
idstart :=	1
; $00 is reserved for silence

bgm__First = idstart
; Levels
bgm_GHZ =			SMPS_id(ptr_mus_ghz)
bgm_Elec =			SMPS_id(ptr_mus_elec)
bgm_DiS =			SMPS_id(ptr_mus_dis)
bgm_MCZ2P =			SMPS_id(ptr_mus_mcz2p)
bgm_MHZ1 =			SMPS_id(ptr_mus_mhz1)
bgm_MHZ2 =			SMPS_id(ptr_mus_mhz2)
bgm_DEZ1 =			SMPS_id(ptr_mus_dez1)
bgm_TFFZ =			SMPS_id(ptr_mus_tffz)
bgm_LZ =			SMPS_id(ptr_mus_lz)

; Bosses
bgm_MidBoss =		SMPS_id(ptr_mus_boss)
bgm_ZoneBoss =		SMPS_id(ptr_mus_boss2)
bgm_MetalSquad =	SMPS_id(ptr_mus_metalsquad)

; Misc
bgm_Invincible =	SMPS_id(ptr_mus_invin)
bgm_S3Invincible =	SMPS_id(ptr_mus_s3invin)
bgm_SKInvincible =	SMPS_id(ptr_mus_skinvin)
bgm_GotThrough =	SMPS_id(ptr_mus_through)
bgm_Drowning =		SMPS_id(ptr_mus_drowning)
bgm_Title =			SMPS_id(ptr_mus_title)

bgm__Last =			SMPS_id(ptr_musend)-1

; Sound effects
offset :=	SoundIndex
ptrsize :=	4
idstart :=	$40

sfx__First = idstart
sfx_RingRight =			SMPS_id(ptr_snd40)
sfx_RingLeft =			SMPS_id(ptr_snd41)
sfx_RingLoss =			SMPS_id(ptr_snd42)
sfx_Jump =				SMPS_id(ptr_snd43)
sfx_Roll =				SMPS_id(ptr_snd44)
sfx_Skid =				SMPS_id(ptr_snd45)
sfx_Death =				SMPS_id(ptr_snd46)
sfx_SpinDash =			SMPS_id(ptr_snd47)
sfx_Splash =			SMPS_id(ptr_snd48)
sfx_InstaAttack =		SMPS_id(ptr_snd49)
sfx_FireShield =		SMPS_id(ptr_snd4A)
sfx_BubbleShield =		SMPS_id(ptr_snd4B)
sfx_LightningShield =	SMPS_id(ptr_snd4C)
sfx_FireAttack =		SMPS_id(ptr_snd4D)
sfx_BubbleAttack =		SMPS_id(ptr_snd4E)
sfx_ElectricAttack =	SMPS_id(ptr_snd4F)
sfx_SpikeHit =			SMPS_id(ptr_snd50)
sfx_SpikeMove =			SMPS_id(ptr_snd51)
sfx_Drown =				SMPS_id(ptr_snd52)
sfx_Starpost =			SMPS_id(ptr_snd53)
sfx_Spring =			SMPS_id(ptr_snd54)
sfx_Dash =				SMPS_id(ptr_snd55)
sfx_Break =				SMPS_id(ptr_snd56)
sfx_BossHit =			SMPS_id(ptr_snd57)
sfx_AirDing =			SMPS_id(ptr_snd58)
sfx_Bubble =			SMPS_id(ptr_snd59)
sfx_Explode =			SMPS_id(ptr_snd5A)
sfx_SignpostFall =		SMPS_id(ptr_snd5B)
sfx_Switch =			SMPS_id(ptr_snd5C)
sfx_Register =			SMPS_id(ptr_snd5D)
sfx_SuperTransform =	SMPS_id(ptr_snd5E)
sfx_BatapyonSpring =	SMPS_id(ptr_snd5F)
sfx_WallSmash =			SMPS_id(ptr_snd60)
sfx_BridgeCollapse =	SMPS_id(ptr_snd61)
sfx_Fly =				SMPS_id(ptr_snd62)
sfx_FlyTired =			SMPS_id(ptr_snd63)
sfx_Grab =				SMPS_id(ptr_snd64)
sfx_Land =				SMPS_id(ptr_snd65)
sfx_Slide =				SMPS_id(ptr_snd66)
sfx_Thump =				SMPS_id(ptr_snd67)
sfx_MechaLand =			SMPS_id(ptr_snd68)
sfx_MechaSpark =		SMPS_id(ptr_snd69)
sfx_MechaRoll =			SMPS_id(ptr_snd6A)
sfx_MechaDash =			SMPS_id(ptr_snd6B)
sfx_ScoreTally =		SMPS_id(ptr_snd6C)
sfx_Signpost =			SMPS_id(ptr_snd6D)
sfx_MechaBuSawLift =	SMPS_id(ptr_snd6E)
sfx_DoubleShield =		SMPS_id(ptr_snd6F)
sfx_BigRing =			SMPS_id(ptr_snd70)
sfx_EnterSS =			SMPS_id(ptr_snd71)

sfx__Last =			SMPS_id(ptr_sndend)-1

; Sound commands
offset :=	Sound_ExIndex
ptrsize :=	2
idstart :=	$FA

flg__First = idstart
sfx_Fade =			SMPS_id(ptr_flgFA)
bgm_Fade =			SMPS_id(ptr_flgFB)
sfx_Sega =			SMPS_id(ptr_flgFC)
bgm_Speedup =		SMPS_id(ptr_flgFD)
bgm_Slowdown =		SMPS_id(ptr_flgFE)
bgm_Stop =			SMPS_id(ptr_flgFF)
flg__Last =			SMPS_id(ptr_flgend)-1
