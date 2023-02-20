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
		move.w	d0,(Current_zone_and_act).w
		move.w	d0,(Apparent_zone_and_act).w
		move.b	d0,(Last_star_post_hit).w
		move.b	d0,(Level_started_flag).w
		ResetDMAQueue
		jsr	(LoadLevelPointer).w
		jsr	(Get_LevelSizeStart).l
		jsr	(LoadLevelLoadBlock).w
		jsr	(LoadLevelLoadBlock2).w
		disableInts
		jsr	(LevelSetup).l
		enableInts
		lea		(ArtKosM_TitleScreenFG).l,a1
		move.w	#tiles_to_bytes(ArtTile_LevelArt),d2
		jsr		(Queue_Kos_Module).w
		lea		(Pal_GHZ).l,a1
		lea		(Target_palette_line_2).w,a2
		jsr	(PalLoad_Line48).w
		lea		(Pal_TitleScreen).l,a1
		lea		(Target_palette).w,a2
		jsr	(PalLoad_Line32).w

		lea	(Eni_Title).l,a0 ; load	title screen mappings
		move.w	#0,d0
		jsr		EniDec

		copyTilemap	$C208,$21,$15

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
		move.b	#id_LevelScreen,(Game_mode).w	; set screen mode to level
		rts