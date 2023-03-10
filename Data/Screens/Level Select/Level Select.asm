; ---------------------------------------------------------------------------
; Level Select
; ---------------------------------------------------------------------------

; Constants
LevelSelect_Offset:				= *
LevelSelect_VRAM:				= 480

; Variables
LevelSelect_ZoneCount:			= ZoneCount
LevelSelect_ActIntroCount:			= 4	; Intro Stages
LevelSelect_ActSSLZCount:			= 3	; Seaside Land Zone
LevelSelect_ActTTPZCount:			= 1	; Tree Top Zone
LevelSelect_ActMMZCount:			= 1 ; Mecha Mushroom Zone
LevelSelect_ActDEZCount:			= 4	; Death Egg Zone
LevelSelect_ActTTSZCount:			= 4	; Techno Test Zone
LevelSelect_MusicTestCount:		= 8
LevelSelect_SoundTestCount:		= LevelSelect_MusicTestCount+1
LevelSelect_SampleTestCount:		= LevelSelect_SoundTestCount+1
LevelSelect_MaxCount:			= 11
LevelSelect_MaxMusicNumber:		= (bgm__Last-bgm__First)
LevelSelect_MaxSoundNumber:		= (sfx__Last-sfx__First)
LevelSelect_MaxSampleNumber:	= (dac__Last-dac__First)

; RAM
	phase ramaddr(Object_load_addr_front)

vLevelSelect_MusicCount:			ds.w 1
vLevelSelect_SoundCount:			ds.w 1
vLevelSelect_SampleCount:			ds.w 1
vLevelSelect_CtrlTimer:			ds.w 1
vLevelSelect_VCount:				ds.w 1
vLevelSelect_HCount:				ds.w $10

	dephase
	!org	LevelSelect_Offset

; =============== S U B R O U T I N E =======================================

LevelSelect_Screen:
		sfx	bgm_Stop
		jsr	(Clear_Kos_Module_Queue).w
		jsr	(Pal_FadeToBlack).w
		disableInts
		move.l	#VInt,(V_int_addr).w
		move.l	#HInt,(H_int_addr).w
		disableScreen
		jsr	(Clear_DisplayData).w
		lea	Level_VDP(pc),a1
		jsr	(Load_VDP).w
		jsr	(Clear_Palette).w
		clr.b	(Water_full_screen_flag).w
		clr.b	(Water_flag).w
		clearRAM RAM_start, (RAM_start+$1000)
		clearRAM Object_RAM, Object_RAM_end
		clearRAM Lag_frame_count, Lag_frame_count_end
		clearRAM Camera_RAM, Camera_RAM_end
		clearRAM Oscillating_variables, Oscillating_variables_end
		moveq	#0,d0
		move.w	d0,(Current_zone_and_act).w
		move.w	d0,(Apparent_zone_and_act).w
		move.b	d0,(Last_star_post_hit).w
		move.b	d0,(Level_started_flag).w
		ResetDMAQueue
		lea	(ArtKosM_LevelSelectText).l,a1
		move.w	#tiles_to_bytes(LevelSelect_VRAM+8),d2
		jsr	(Queue_Kos_Module).w
		lea	(Pal_LevelSelect).l,a1
		lea	(Target_palette).w,a2
		jsr	(PalLoad_Line32).w
		jsr		LevelSelect_LoadLevel_CharacterSwitcher.update
		bsr.w	LevelSelect_LoadText
		move.w	#palette_line_1+LevelSelect_VRAM,d3
		bsr.w	LevelSelect_LoadMainText
		move.w	#palette_line_1,d3
		bsr.w	LevelSelect_MarkFields

.waitplc
		move.b	#VintID_Fade,(V_int_routine).w
		jsr	(Process_Kos_Queue).w
		jsr	(Wait_VSync).w
		jsr	(Process_Kos_Module_Queue).w
		tst.w	(Kos_modules_left).w
		bne.s	.waitplc
		move.b	#VintID_Main,(V_int_routine).w
		jsr	(Wait_VSync).w
		enableScreen
		jsr	(Pal_FadeFromBlack).w

.loop
		move.b	#VintID_Main,(V_int_routine).w
		jsr	(Wait_VSync).w
		bsr.w	LevelSelect_Deform
		disableInts
		moveq	#palette_line_0,d3
		bsr.w	LevelSelect_MarkFields
		bsr.s	LevelSelect_Controls
		move.w	#palette_line_1,d3
		bsr.w	LevelSelect_MarkFields
		enableInts
		jsr	(Process_Sprites).w
		jsr	(Render_Sprites).w
		tst.b	(Ctrl_1_pressed).w
		bpl.s	.loop
		cmpi.w	#LevelSelect_ZoneCount,(vLevelSelect_VCount).w
		bhs.s	.loop
		move.b	#id_LevelScreen,(Game_mode).w	; set screen mode to level
		rts

; ---------------------------------------------------------------------------
; Check vertical line
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LevelSelect_Controls:

		; set vertical line
		move.w	#LevelSelect_MaxCount-1,d2
		move.w	(vLevelSelect_VCount).w,d3
		lea	(vLevelSelect_CtrlTimer).w,a3
		bsr.w	LevelSelect_FindUpDownControls
		move.w	d3,(vLevelSelect_VCount).w

		; check vertical line
		cmpi.w	#LevelSelect_SampleTestCount,d3
		beq.w	LevelSelect_LoadSampleNumber
		cmpi.w	#LevelSelect_SoundTestCount,d3
		beq.w	LevelSelect_LoadSoundNumber
		cmpi.w	#LevelSelect_MusicTestCount,d3
		beq.w	LevelSelect_LoadMusicNumber
		bsr.s	LevelSelect_LoadLevel_CharacterSwitcher
		cmpi.w	#LevelSelect_ZoneCount,d3
		bhs.s	LevelSelect_LoadLevel_Return

		; start new zone
		lea	(vLevelSelect_HCount).w,a0
		move.w	(vLevelSelect_VCount).w,d4
		add.w	d4,d4
		move.w	(a0,d4.w),d3
		move.w	LevelSelect_LoadMaxActs(pc,d4.w),d2
		lea	(vLevelSelect_CtrlTimer).w,a3
		bsr.w	LevelSelect_FindLeftRightControls
		move.w	d3,(a0,d4.w)
		move.w	(vLevelSelect_VCount).w,d2
		move.b	d2,(sp)
		move.w	(sp),d2
		clr.b	d2
		add.w	d2,d3
		move.w	d3,(Current_zone_and_act).w
		move.w	d3,(Apparent_zone_and_act).w

LevelSelect_LoadLevel_Return:
		rts
; ---------------------------------------------------------------------------

LevelSelect_LoadMaxActs:
		dc.w LevelSelect_ActIntroCount-1	; Intro Stages
		dc.w LevelSelect_ActSSLZCount-1	; SSLZ
		dc.w LevelSelect_ActTTPZCount-1	; TTPZ
		dc.w LevelSelect_ActMMZCount-1	; MMZ
		dc.w LevelSelect_ActDEZCount-1	; DEZ
		dc.w LevelSelect_ActTTSZCount-1	; TTSZ

		zonewarning LevelSelect_LoadMaxActs,2

; ---------------------------------------------------------------------------
; Load Characters
; ---------------------------------------------------------------------------

LevelSelect_LoadLevel_CharacterSwitcher:
		btst	#button_C,(Ctrl_1_pressed).w
		beq.s	.b
		addq.b	#1,(Player_mode).w
		sfx		sfx_Switch
		cmpi.b	#po_Last,(Player_mode).w
		ble.s	.update
		clr.b	(Player_mode).w
		bra.s	.update
	.b:
		btst	#button_B,(Ctrl_1_pressed).w
		beq.w	.ret
		subq.b	#1,(Player_mode).w
		sfx		sfx_Switch
		tst.b	(Player_mode).w
		bge.s	.update
		move.b	#po_Last,(Player_mode).w
	.update:	; this part sucks a lot
		moveq	#0,d0
		move.b	(Player_mode).w,d0
		lsl.w	#2,d0	; if 1, should equal... 4, 8, 12?
		move.w	d0,d1
		add.w	d0,d0
		add.w	d1,d0
		move.w	#make_art_tile(ArtTile_Sonic,2,0),(Player_1+art_tile).w
		move.w	#tiles_to_bytes(ArtTile_Sonic),(Player_1+vram_art).w
		move.l	.plrIDs(pc,d0.w),(Player_1).w
		move.w	#$1A7,(Player_1+x_pos).w
		move.w	#$F0,(Player_1+y_pos).w
		bset	#0,(Player_1+status).w
		add.w	#4,d0
		move.l	.plrIDs(pc,d0.w),d1
		cmpi.l	#DeleteObject,d1
		bne.s	.2p
		move.w	#$194,(Player_1+x_pos).w
	.2p:
		move.w	#make_art_tile(ArtTile_Tails,2,0),(Player_2+art_tile).w
		move.w	#tiles_to_bytes(ArtTile_Tails),(Player_2+vram_art).w
		move.l	.plrIDs(pc,d0.w),(Player_2).w
		move.w	#$181,(Player_2+x_pos).w
		move.w	#$F0,(Player_2+y_pos).w
		add.w	#4,d0
		move.l	.plrIDs(pc,d0.w),a1
		lea	(Target_palette_line_3).w,a2
		jsr	(PalLoad_Line16).w
		move.l	.plrIDs(pc,d0.w),a1
		lea	(Normal_palette_line_3).w,a2
		jmp	(PalLoad_Line16).w
.plrIDs:
		dc.l	Obj_CabaretSonic,	Obj_CabaretTails,	Pal_Sonic	; S&T	; 0, 4, 8
		dc.l	Obj_CabaretSonic,	DeleteObject,		Pal_Sonic	; SA	; 12, 16, 20
		dc.l	Obj_CabaretTails,	DeleteObject,		Pal_Sonic	; TA	; 24, 28, 32
		dc.l	Obj_CabaretKnuckles,DeleteObject,		Pal_Knuckles; KA	; 36, 40, 44
		dc.l	Obj_CabaretKnuckles,Obj_CabaretTails,	Pal_Knuckles; K&T	; 48, 52, 56
		dc.l	Obj_CabaretMighty,	DeleteObject,		Pal_Mighty	; MA	; 60, 64, 68
		dc.l	Obj_CabaretMighty,	Obj_CabaretTails,	Pal_Mighty	; M&T	; 72, 76, 80
		dc.l	Obj_CabaretTails,	Obj_CabaretTails,	Pal_Sonic	; T&T
		dc.l	Obj_CabaretSonic,	Obj_CabaretSonic,	Pal_Sonic	; S&S
		dc.l	Obj_CabaretEspio,	DeleteObject,		Pal_Espio	; EA
	.ret:
		rts

; ---------------------------------------------------------------------------
; Load Music
; ---------------------------------------------------------------------------

LevelSelect_LoadMusicNumber:
		move.w	#LevelSelect_MaxMusicNumber,d2
		move.w	(vLevelSelect_MusicCount).w,d3
		lea	(vLevelSelect_CtrlTimer).w,a3
		bsr.w	LevelSelect_FindLeftRightControls
		move.w	d3,(vLevelSelect_MusicCount).w
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#btnABC,d1
		beq.w	LevelSelect_LoadLevel_Return
		move.w	d3,d0
		addq.w	#bgm__First,d0		; $00 is reserved for silence
		jmp	(SMPS_QueueSound1).w	; play music

; ---------------------------------------------------------------------------
; Load Sound
; ---------------------------------------------------------------------------

LevelSelect_LoadSoundNumber:
		move.w	#LevelSelect_MaxSoundNumber,d2
		move.w	(vLevelSelect_SoundCount).w,d3
		lea	(vLevelSelect_CtrlTimer).w,a3
		bsr.s	LevelSelect_FindLeftRightControls
		move.w	d3,(vLevelSelect_SoundCount).w
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#btnABC,d1
		beq.w	LevelSelect_LoadLevel_Return
		move.w	d3,d0
		addi.w	#sfx__First,d0
		jmp	(SMPS_QueueSound2).w	; play sfx

; ---------------------------------------------------------------------------
; Load Sample
; ---------------------------------------------------------------------------

LevelSelect_LoadSampleNumber:
		move.w	#LevelSelect_MaxSampleNumber,d2
		move.w	(vLevelSelect_SampleCount).w,d3
		lea	(vLevelSelect_CtrlTimer).w,a3
		bsr.s	LevelSelect_FindLeftRightControls
		move.w	d3,(vLevelSelect_SampleCount).w
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#btnABC,d1
		beq.w	LevelSelect_LoadLevel_Return
		move.w	d3,d0
		addi.w	#dac__First,d0
		jmp	(SMPS_PlayDACSample).w	; play sample

; ---------------------------------------------------------------------------
; Control (Up/Down)
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LevelSelect_FindUpDownControls:
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#btnUD,d1
		beq.s	.notpressed
		move.w	#16,(a3)
		bra.s	.pressed
; --------------------------------------------------------------------------

.notpressed
		move.b	(Ctrl_1_held).w,d1
		andi.b	#btnUD,d1
		beq.s	.returnup
		subq.w	#1,(a3)
		bpl.s	.returnup
		addq.w	#4,(a3)

.pressed
		btst	#button_up,d1
		beq.s	.notdown
		subq.w	#1,d3
		bpl.s	.returnup
		move.w	d2,d3

.returnup
		rts
; ---------------------------------------------------------------------------

.notdown
		addq.w	#1,d3
		cmp.w	d2,d3
		bls.s		.returndown
		moveq	#0,d3

.returndown
		rts

; ---------------------------------------------------------------------------
; Control (Left/Right)
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LevelSelect_FindLeftRightControls:
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#btnLR,d1
		beq.s	.notpressed
		move.w	#16,(a3)
		bra.s	.pressed
; --------------------------------------------------------------------------

.notpressed
		move.b	(Ctrl_1_held).w,d1
		andi.b	#btnLR,d1
		beq.s	.returnleft
		subq.w	#1,(a3)
		bpl.s	.returnleft
		addq.w	#4,(a3)

.pressed
		btst	#button_left,d1
		beq.s	.notright
		subq.w	#1,d3
		bpl.s	.returnleft
		move.w	d2,d3

.returnleft
		rts
; ---------------------------------------------------------------------------

.notright
		addq.w	#1,d3
		cmp.w	d2,d3
		bls.s		.returnright
		moveq	#0,d3

.returnright
		rts

; ---------------------------------------------------------------------------
; Draw act
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LevelSelect_LoadAct:
		locVRAM	$C2AC,d2
		lea	(vLevelSelect_HCount).w,a0
		move.w	(vLevelSelect_VCount).w,d0
		move.w	d0,d1
		beq.s	.zero
		subq.w	#1,d0

.loop
		addi.l	#vdpCommDelta(planeLocH40(0,2)),d2
		dbf	d0,.loop

.zero
		move.l	d2,VDP_control_port-VDP_control_port(a5)
		add.w	d1,d1
		move.w	(a0,d1.w),d0
		add.w	d1,d1
		add.w	d1,d1
		add.w	d0,d0
		add.w	d1,d0
		move.w	LevelSelect_ActTextIndex(pc,d0.w),d0
		lea	LevelSelect_ActTextIndex(pc,d0.w),a0
		bra.s	LevelSelect_LoadMainText.loadtext

; =============== S U B R O U T I N E =======================================

LevelSelect_LoadMainText:
		lea	(VDP_data_port).l,a6
		lea	VDP_control_port-VDP_data_port(a6),a5
		locVRAM	$C080,VDP_control_port-VDP_control_port(a5)
		lea	LevelSelect_MainText(pc),a0

.loadtext
		moveq	#0,d6
		move.b	(a0)+,d6

.copy
		moveq	#0,d0
		move.b	(a0)+,d0
		add.w	d3,d0
		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d6,.copy
		rts
; --------------------------------------------------------------------------

LevelSelect_ActTextIndex: offsetTable
		offsetTableEntry.w LevelSelect_LoadGreenHill
		offsetTableEntry.w LevelSelect_LoadTechnoTower
		offsetTableEntry.w LevelSelect_LoadAct3
		offsetTableEntry.w LevelSelect_LoadGreenHillEX
	rept ZoneCount-1
		offsetTableEntry.w LevelSelect_LoadAct1
		offsetTableEntry.w LevelSelect_LoadAct2
		offsetTableEntry.w LevelSelect_LoadAct3
		offsetTableEntry.w LevelSelect_LoadAct4
	endr

		zonewarning LevelSelect_ActTextIndex,(2*4)
; --------------------------------------------------------------------------

LevelSelect_LoadAct1:
		levselstr "ACT 1"
LevelSelect_LoadAct2:
		levselstr "ACT 2"
LevelSelect_LoadAct3:
		levselstr "ACT 3"
LevelSelect_LoadAct4:
		levselstr "ACT 4"
LevelSelect_MainText:
		levselstr "SONIC TEST GAME - *** DEBUG MODE ***                            "
LevelSelect_LoadGreenHill:
		levselstr "GREEN HILL"
LevelSelect_LoadTechnoTower:
		levselstr "TECHNO TOWER"
LevelSelect_LoadGreenHillEX:
		levselstr "GREEN HILL EX"
	even

; ---------------------------------------------------------------------------
; Draw line and numbers
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LevelSelect_MarkFields:
		lea	(VDP_data_port).l,a6
		lea	VDP_control_port-VDP_data_port(a6),a5
		lea	(RAM_start).l,a4
		lea	LevelSelect_MarkTable(pc),a3
		move.w	(vLevelSelect_VCount).w,d0
		add.w	d0,d0
		lea	(a3,d0.w),a3
		moveq	#0,d0
		move.b	(a3),d0
		mulu.w	#80,d0
		moveq	#0,d1
		move.b	1(a3),d1
		add.w	d1,d0
		lea	(a4,d0.w),a1
		moveq	#0,d1
		move.b	(a3),d1
		lsl.w	#7,d1
		add.b	1(a3),d1
		addi.w	#VRAM_Plane_A_Name_Table,d1
		lsl.l	#2,d1
		lsr.w	#2,d1
		ori.w	#vdpComm($0000,VRAM,WRITE)>>16,d1
		swap	d1
		move.l	d1,VDP_control_port-VDP_control_port(a5)
		moveq	#40-1,d2	; load line

.copy
		move.w	(a1)+,d0
		add.w	d3,d0	; VRAM shift
		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d2,.copy

	if LevelSelect_VRAM<>0
		ori.w	#LevelSelect_VRAM,d3
	endif

		; check vertical line
		move.w	(vLevelSelect_VCount).w,d0
		cmpi.w	#LevelSelect_ZoneCount,d0
		blo.w	LevelSelect_LoadAct
		cmpi.w	#LevelSelect_SoundTestCount,d0
		beq.s	.drawsound
		cmpi.w	#LevelSelect_SampleTestCount,d0
		beq.s	.drawsample
		cmpi.w	#LevelSelect_MusicTestCount,d0
		bne.s	.return

		; draw music
		locVRAM	$CB2C,VDP_control_port-VDP_control_port(a5)
		move.w	(vLevelSelect_MusicCount).w,d0
		bra.s	.drawnumbers
; ---------------------------------------------------------------------------

.drawsound
		locVRAM	$CC2C,VDP_control_port-VDP_control_port(a5)
		move.w	(vLevelSelect_SoundCount).w,d0
		bra.s	.drawnumbers
; ---------------------------------------------------------------------------

.drawsample
		locVRAM	$CD2C,VDP_control_port-VDP_control_port(a5)
		move.w	(vLevelSelect_SampleCount).w,d0

.drawnumbers
		move.b	d0,d2
		lsr.w #8,d0
		bsr.s	.drawnumber
		move.b	d2,d0
		lsr.b	#4,d0
		bsr.s	.drawnumber
		move.b	d2,d0

.drawnumber
		andi.w	#$F,d0
		cmpi.b	#10,d0
		blo.s		.skipsymbols
		addq.b	#7,d0

.skipsymbols
		addq.b	#8,d0
		add.w	d3,d0
		move.w	d0,VDP_data_port-VDP_data_port(a6)

.return
		rts

; ---------------------------------------------------------------------------
; Deform
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LevelSelect_Deform:
		lea	(RAM_start).l,a3
		lea	LevelSelectScroll_Data(pc),a2
		jmp	(HScroll_Deform).w
; ---------------------------------------------------------------------------

LevelSelectScroll_Data: dScroll_Header
		dScroll_Data 0, 8, -$100, 8
LevelSelectScroll_Data_end

; ---------------------------------------------------------------------------
; Load text
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

LevelSelect_LoadText:
		lea	LevelSelect_MappingOffsets(pc),a0
		lea	(RAM_start).l,a1
		lea	LevelSelect_Text(pc),a2
		move.w	#LevelSelect_VRAM,d3
		moveq	#LevelSelect_MaxCount-1,d1

.load
		moveq	#0,d2
		move.b	(a2)+,d2	; text size
		move.w	(a0)+,d0	; offset
		lea	(a1,d0.w),a3	; RAM shift

.copy
		moveq	#0,d0
		move.b	(a2)+,d0	; load letter
		add.w	d3,d0
		move.w	d0,(a3)+
		dbf	d2,.copy
		dbf	d1,.load
		copyTilemap	vram_fg, 320, 224, 1
; ---------------------------------------------------------------------------

LevelSelect_MarkTable:

		; 2 bytes per level select entry (ypos, xpos)
		dc.b 5, 0
		dc.b 7, 0
		dc.b 9, 0
		dc.b 11, 0
		dc.b 13, 0
		dc.b 15, 0
		dc.b 17, 0
		dc.b 19, 0
		dc.b 22, 0
		dc.b 24, 0
		dc.b 26, 0
LevelSelect_MappingOffsets:
		dc.w planeLocH28(0,5)
		dc.w planeLocH28(0,7)
		dc.w planeLocH28(0,9)
		dc.w planeLocH28(0,11)
		dc.w planeLocH28(0,13)
		dc.w planeLocH28(0,15)
		dc.w planeLocH28(0,17)
		dc.w planeLocH28(0,19)
		dc.w planeLocH28(0,22)
		dc.w planeLocH28(0,24)
		dc.w planeLocH28(0,26)
LevelSelect_Text:
		levselstr " INTRO STAGES       - ACT 1             "
		levselstr " SEASIDE LAND       - ACT 1             "
		levselstr " TREE TOP           - ACT 1             "
		levselstr " MECHA MUSHROOM     - ACT 1             "
		levselstr " DEATH EGG          - ACT 1             "
		levselstr " TECHNO TEST        - ACT 1             "
		levselstr " UNKNOWN LEVEL      - UNKNOWN           "
		levselstr " UNKNOWN LEVEL      - UNKNOWN           "
		levselstr " MUSIC TEST:        - 000               "
		levselstr " SOUND TEST:        - 000               "
		levselstr " SAMPLE TEST:       - 000               "
	even
