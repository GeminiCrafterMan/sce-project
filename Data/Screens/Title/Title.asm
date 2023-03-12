Title_Screen:
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
		move.w	#3,(Current_zone_and_act).w	; GHZ EX
		move.w	#3,(Apparent_zone_and_act).w; GHZ EX
		move.b	d0,(Last_star_post_hit).w
		move.b	d0,(Level_started_flag).w
		ResetDMAQueue
		jsr	(LoadLevelPointer).w
		jsr	(Get_LevelSizeStart).l
		jsr	(LoadLevelLoadBlock).w
		jsr	(LoadLevelLoadBlock2).w
		disableInts
		jsr	(LevelSetup_BG_Only).l
		enableInts
		lea	(ArtKosM_TitleScreenFG).l,a1
		move.w	#$4000,d2
		jsr	(Queue_Kos_Module).w
		lea	(Pal_TitleScreen).l,a1
		lea	(Target_palette).w,a2
		jsr	(PalLoad_Line64).w

		lea	(Eni_Title).l,a0	; load title screen mappings
		lea	($FF0000).l,a1	; load buffer
		moveq	#0,d0
		jsr	(EniDec).w

		copyTilemap	$C208,278,148

		music	bgm_Title

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
		move.l	#Obj_TitleSonic,(Player_1).w

.loop
		move.b	#VintID_Main,(V_int_routine).w
		jsr	(Wait_VSync).w
		jsr	(DeformBgLayer).w
		jsr	(Animate_Palette).l
		jsr	(Process_Sprites).w
		jsr	(Render_Sprites).w
;		addq.w	#2,(Player_1+x_pos).w
		btst	#bitStart,(Ctrl_1_pressed).w
		beq.s	.loop
		btst	#bitA,(Ctrl_1_held).w
		bne.s	.levsel
		moveq	#0,d0
		move.b	(Player_mode).w,d0
		lsl.w	#1,d0
		move.w	.startZoneLUT(pc,d0.w),(Current_zone_and_act).w
		move.w	.startZoneLUT(pc,d0.w),(Apparent_zone_and_act).w
		move.b	#id_LevelScreen,(Game_mode).w	; set screen mode to level
		rts
	.levsel:
		move.b	#id_LevelSelectScreen,(Game_mode).w	; set game mode
		rts

	.startZoneLUT:
		dc.w	(z_Intro<<8)+0	; S&T
		dc.w	(z_Intro<<8)+0	; SA
		dc.w	(z_Intro<<8)+0	; TA
		dc.w	(z_Intro<<8)+0	; KA
		dc.w	(z_Intro<<8)+0	; K&T
		dc.w	(z_Intro<<8)+1	; MA
		dc.w	(z_Intro<<8)+1	; M&T
		dc.w	(z_Intro<<8)+0	; T&T
		dc.w	(z_Intro<<8)+0	; S&S
		dc.w	(z_Intro<<8)+1	; EA
	even