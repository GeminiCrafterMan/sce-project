; ---------------------------------------------------------------------------
; Load animals
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LoadPLC_Animals:
		moveq	#0,d0
		move.w	(Current_zone_and_act).w,d0
		ror.b	#2,d0
		lsr.w	#5,d0
		move.w	Offs_PLCAnimals(pc,d0.w),d0
		lea	Offs_PLCAnimals(pc,d0.w),a5
		jmp	(LoadPLC_Raw_KosM).w
; ---------------------------------------------------------------------------

Offs_PLCAnimals: offsetTable
		offsetTableEntry.w PLCAnimals_GHZ	; GHZ1
		offsetTableEntry.w PLCAnimals_GHZ	; GHZ2
		offsetTableEntry.w PLCAnimals_GHZ	; GHZ3
		offsetTableEntry.w PLCAnimals_GHZ	; GHZ4

		offsetTableEntry.w PLCAnimals_SSLZ	; SSLZ1
		offsetTableEntry.w PLCAnimals_SSLZ	; SSLZ2
		offsetTableEntry.w PLCAnimals_SSLZ	; SSLZ3
		offsetTableEntry.w PLCAnimals_SSLZ	; SSLZ4

		offsetTableEntry.w PLCAnimals_WZ	; WZ1
		offsetTableEntry.w PLCAnimals_WZ	; WZ2
		offsetTableEntry.w PLCAnimals_WZ	; WZ3
		offsetTableEntry.w PLCAnimals_WZ	; WZ4

		offsetTableEntry.w PLCAnimals_DEZ1	; DEZ1
		offsetTableEntry.w PLCAnimals_DEZ1	; DEZ2
		offsetTableEntry.w PLCAnimals_DEZ1	; DEZ3
		offsetTableEntry.w PLCAnimals_DEZ1	; DEZ4

		offsetTableEntry.w PLCAnimals_TTZ1	; TTZ1
		offsetTableEntry.w PLCAnimals_TTZ1	; TTZ2
		offsetTableEntry.w PLCAnimals_TTZ1	; TTZ3
		offsetTableEntry.w PLCAnimals_TTZ1	; TTZ4

		zonewarning Offs_PLCAnimals,(2*4)
; ---------------------------------------------------------------------------

PLCAnimals_GHZ: plrlistheader
		plreq $580, ArtKosM_BlueFlicky
		plreq $592, ArtKosM_Chicken
PLCAnimals_GHZ_End

PLCAnimals_SSLZ: plrlistheader
		plreq $580, ArtKosM_BlueFlicky
		plreq $592, ArtKosM_Chicken
PLCAnimals_SSLZ_End

PLCAnimals_WZ: plrlistheader
		plreq $580, ArtKosM_Squirrel
		plreq $592, ArtKosM_BlueFlicky
PLCAnimals_WZ_End

PLCAnimals_DEZ1: plrlistheader
		plreq $580, ArtKosM_BlueFlicky
		plreq $592, ArtKosM_Chicken
PLCAnimals_DEZ1_End

PLCAnimals_TTZ1: plrlistheader
		plreq $580, ArtKosM_BlueFlicky
		plreq $592, ArtKosM_Chicken
PLCAnimals_TTZ1_End