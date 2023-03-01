Obj_BadnikSlot1:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	Obj_Motobug		; GHZ
	endr
	rept 4
		dc.l	Obj_Motobug		; SSLZ
	endr
	rept 4
		dc.l	Obj_MechaBu		; TTPZ
	endr
	rept 4
		dc.l	Obj_Motobug		; MMZ
	endr
	rept 4
		dc.l	Obj_Spikebonker	; DEZ
	endr
	rept 4
		dc.l	Obj_Burrobot	; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_BadnikSlot2:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	Obj_BuzzBomber	; GHZ
	endr
	rept 4
		dc.l	Obj_BuzzBomber	; SSLZ
	endr
	rept 4
		dc.l	Obj_SpringShell	; TTPZ
	endr
	rept 4
		dc.l	Obj_BuzzBomber	; MMZ
	endr
	rept 4
		dc.l	Obj_BataPyon	; DEZ
	endr
	rept 4
		dc.l	Obj_BuzzBomber	; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_BadnikSlot3:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	Obj_Chopper	; GHZ
	endr
	rept 4
		dc.l	Obj_Chopper	; SSLZ
	endr
	rept 4
		dc.l	Obj_Chopper	; TTPZ
	endr
	rept 4
		dc.l	Obj_Chopper	; MMZ
	endr
	rept 4
		dc.l	Obj_Chopper	; DEZ
	endr
	rept 4
		dc.l	Obj_Chopper	; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_BadnikSlot4:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	Obj_Crabmeat	; GHZ
	endr
	rept 4
		dc.l	Obj_Crabmeat	; SSLZ
	endr
	rept 4
		dc.l	Obj_Crabmeat	; TTPZ
	endr
	rept 4
		dc.l	Obj_Crabmeat	; MMZ
	endr
	rept 4
		dc.l	Obj_Crabmeat	; DEZ
	endr
	rept 4
		dc.l	Obj_Crabmeat	; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_BadnikSlot5:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	DeleteObject	; GHZ
	endr
	rept 4
		dc.l	DeleteObject	; SSLZ
	endr
	rept 4
		dc.l	DeleteObject	; TTPZ
	endr
	rept 4
		dc.l	DeleteObject	; MMZ
	endr
	rept 4
		dc.l	DeleteObject	; DEZ
	endr
	rept 4
		dc.l	DeleteObject	; TTSZ
	endr
	zonewarning	.index,(4*4)

Obj_BadnikSlot6:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#4,d0
		movea.l	.index(pc,d0.w),a1
		jmp		(a1)
.index:
	rept 4
		dc.l	DeleteObject	; GHZ
	endr
	rept 4
		dc.l	DeleteObject	; SSLZ
	endr
	rept 4
		dc.l	DeleteObject	; TTPZ
	endr
	rept 4
		dc.l	DeleteObject	; MMZ
	endr
	rept 4
		dc.l	DeleteObject	; DEZ
	endr
	rept 4
		dc.l	DeleteObject	; TTSZ
	endr
	zonewarning	.index,(4*4)
