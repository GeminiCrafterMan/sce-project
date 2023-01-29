; ---------------------------------------------------------------------------
; Water Wave (Object)
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================
; no longer uses child sprites since those were being hella annoying, and now just gets loaded twice
Obj_WaterWave:
		move.l	#.main,address(a0)
		move.l	#Map_WaterWave,mappings(a0)
		move.w	#make_art_tile(ArtTile_WaterWave,0,1),art_tile(a0)
		move.b	#4,render_flags(a0)		; set screen coordinates and multi-draw flag
		move.w	#bytes_to_word(24/2,256/2),height_pixels(a0)	; set height and width
		move.w	x_pos(a0),objoff_30(a0)

.main
		move.w	(Camera_X_pos).w,d1
		andi.w	#$FFE0,d1
		add.w	objoff_30(a0),d1
		btst	#button_start,(Ctrl_1_pressed).w	; is Start pressed?
		bne.s	.skip	; if so, brnach
		btst	#0,(Level_frame_counter+1).w
		beq.s	.skip
		addi.w	#32,d1

.skip
		move.w	d1,x_pos(a0)
		move.w	(Water_level).w,d1
		move.w	d1,y_pos(a0)
		tst.b	objoff_32(a0)					; is pause flag set?
		bne.s	.checkpause				; if yes, branch
		btst	#button_start,(Ctrl_1_pressed).w		; is Start pressed?
		beq.s	.anim					; if not, branch
		addq.b	#3,mapping_frame(a0)
		st	objoff_32(a0)					; set pause flag
		bra.s	.setframe
; ---------------------------------------------------------------------------

.checkpause
		tst.b	(Game_paused).w				; still pause?
		bne.s	.setframe					; if yes, branch
		clr.b	objoff_32(a0)					; clear pause flag
		subq.b	#3,mapping_frame(a0)

.anim
		subq.b	#1,anim_frame_timer(a0)
		bpl.s	.setframe
		move.b	#7,anim_frame_timer(a0)
		addq.b	#1,mapping_frame(a0)
		cmpi.b	#3,mapping_frame(a0)
		blo.s		.setframe
		clr.b	mapping_frame(a0)

.setframe
;		move.b	mapping_frame(a0),1(a2)
		lea	PLCPtr_WaterWave(pc),a2
		jsr	(Perform_DPLC).w
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

PLCPtr_WaterWave:
		dc.l ArtUnc_WaterWave>>1, DPLC_WaterWave

		include "Objects/Water Wave/Object Data/Map - Water Wave.asm"
		include "Objects/Water Wave/Object Data/DPLC - Water Wave.asm"
