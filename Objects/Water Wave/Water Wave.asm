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
		blo.s	.setframe
		clr.b	mapping_frame(a0)

.setframe
;		move.b	mapping_frame(a0),1(a2)
		lea	PLCPtr_WaterWave(pc),a2
		jsr	(Perform_DPLC).w
		jsr	(Draw_Sprite).w
		jsr	(Find_SonicTails).w
	; water running tests
		tst.b	d1	; is player above the water?
		bne.s	.ret	; if not, get outta here
		cmpi.w	#$10,d3	; more than $10 above the water?
		bgt.s	.ret
		moveq	#0,d0
		mvabs.w	x_vel(a1),d0
		cmpi.w	#$608,d0
		blt.s	.getOff
		btst	#Status_Roll,status(a1)
		bne.s	.getOff
		clr.w	y_vel(a1)
		move.w	y_pos(a0),d0
		move.b	default_y_radius(a1),d1
		subq.b	#4,d1
		sub.w	d1,d0
		move.w	d0,y_pos(a1)
		jsr		RideObject_SetRide
		cmpa.w	#Player_1,a1
		bne.s	.p2
		lea		(v_Dust_P1).w,a1
		bra.s	.setSplash
	.p2:
		lea		(v_Dust_P2).w,a1
	.setSplash:
		tst.b	mapping_frame(a1)
		bne.s	.ret
		move.w	#bytes_to_word(5,0),anim(a1)	; skip animation, write 5 to anim and clear prev_anim
		sfx	sfx_Splash,1				; splash sound
	.getOff:
		bclr	#Status_OnObj,status(a1)
	.ret:
		rts

; ---------------------------------------------------------------------------

PLCPtr_WaterWave:
		dc.l ArtUnc_WaterWave>>1, DPLC_WaterWave

		include "Objects/Water Wave/Object Data/Map - Water Wave.asm"
		include "Objects/Water Wave/Object Data/DPLC - Water Wave.asm"
