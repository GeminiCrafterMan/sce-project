; ---------------------------------------------------------------------------
; Monitor (Object)
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Obj_Monitor:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	Monitor_Index(pc,d0.w),d1
		jmp	Monitor_Index(pc,d1.w)
; ---------------------------------------------------------------------------

Monitor_Index: offsetTable
		offsetTableEntry.w Obj_MonitorInit			; 0
		offsetTableEntry.w Obj_MonitorMain		; 2
		offsetTableEntry.w Obj_MonitorBreak		; 4
		offsetTableEntry.w Obj_MonitorAnimate		; 6
		offsetTableEntry.w loc_1D61A				; 8
; ---------------------------------------------------------------------------

Obj_MonitorInit:
		addq.b	#2,routine(a0)
		move.w	#bytes_to_word(30/2,30/2),y_radius(a0)	; set y_radius and x_radius
		move.l	#Map_Monitor,mappings(a0)
		move.w	#make_art_tile(ArtTile_Monitors,0,0),art_tile(a0)
		ori.b	#4,render_flags(a0)
		move.w	#$180,priority(a0)
		move.w	#bytes_to_word(32/2,28/2),height_pixels(a0)		; set height and width
		move.w	respawn_addr(a0),d0				; Get address in respawn table
		beq.s	.notbroken						; If it's zero, it isn't remembered
		movea.w	d0,a2							; Load address into a2
		btst	#0,(a2)								; Is this monitor broken?
		beq.s	.notbroken						; If not, branch
		move.b	#$C,mapping_frame(a0)			; Use 'broken monitor' frame
		move.l	#Sprite_OnScreen_Test,address(a0)
		rts
; ---------------------------------------------------------------------------

.notbroken:
		move.b	#6|$40,collision_flags(a0)
		move.b	subtype(a0),anim(a0)				; Subtype determines what powerup is inside

Obj_MonitorMain:
		bsr.s	Obj_MonitorFall

;SolidObject_Monitor:
		moveq	#$19,d1							; Monitor's width
		moveq	#$10,d2
		move.w	d2,d3
		addq.w	#1,d3
		move.w	x_pos(a0),d4
		lea	(Player_1).w,a1
		moveq	#p1_standing_bit,d6
		movem.l	d1-d4,-(sp)
		bsr.w	SolidObject_Monitor_SonicKnux
		movem.l	(sp)+,d1-d4
		lea	(Player_2).w,a1
		moveq	#p2_standing_bit,d6
		bsr.w	SolidObject_Monitor_Tails
		jsr	Add_SpriteToCollisionResponseList
		lea	Ani_Monitor(pc),a1
		jsr	(Animate_Sprite).w

loc_1D61A:
		jmp	(Sprite_OnScreen_Test).w
; ---------------------------------------------------------------------------

Obj_MonitorAnimate:
		cmpi.b	#$C,mapping_frame(a0)			; Is monitor broken?
		bne.s	.notbroken						; If not, branch
		move.l	#loc_1D61A,address(a0)

.notbroken:
		lea	Ani_Monitor(pc),a1
		jsr	(Animate_Sprite).w
		jmp	(Sprite_OnScreen_Test).w

; =============== S U B R O U T I N E =======================================

Obj_MonitorFall:
		move.b	routine_secondary(a0),d0
		beq.s	locret_1D694
		btst	#1,render_flags(a0)					; Is monitor upside down?
		bne.s	Obj_MonitorFallUpsideDown		; If so, branch

Obj_MonitorFallUpsideUp:
		jsr	(MoveSprite).w
		tst.w	y_vel(a0)						; Is monitor moving up?
		bmi.s	locret_1D694						; If so, return
		jsr	ObjCheckFloorDist
		tst.w	d1								; Is monitor in the ground?
		beq.s	.inground						; If so, branch
		bpl.s	locret_1D694						; if not, return

.inground:
		add.w	d1,y_pos(a0)						; Move monitor out of the ground
		clr.w	y_vel(a0)
		clr.b	routine_secondary(a0)					; Stop monitor from falling
		rts
; ---------------------------------------------------------------------------

Obj_MonitorFallUpsideDown:
		jsr	(MoveSprite_ReverseGravity).w
		tst.w	y_vel(a0)						; Is monitor moving down?
		bmi.s	locret_1D694						; If so, return
		jsr	ObjCheckCeilingDist
		tst.w	d1								; Is monitor in the ground (ceiling)?
		beq.s	.inground						; If so, branch
		bpl.s	locret_1D694						; if not, return

.inground:
		sub.w	d1,y_pos(a0)						; Move monitor out of the ground
		clr.w	y_vel(a0)
		clr.b	routine_secondary(a0)					; Stop monitor from falling

locret_1D694:
		rts

; =============== S U B R O U T I N E =======================================


SolidObject_Monitor_SonicKnux:
		btst	d6,status(a0)		; Is Sonic/Knux standing on the monitor?
		bne.s	Monitor_ChkOverEdge	; If so, branch
		cmpi.b	#id_Roll,anim(a1)		; Is Sonic/Knux in their rolling animation?
		beq.s	.ret		; If so, return
		cmpi.b	#c_Knuckles,character_id(a1)	; Is character Knuckles?
		jne		SolidObject_cont		; If not, branch
		cmpi.b	#1,double_jump_flag(a1)	; Is Knuckles gliding?
		beq.s	.ret		; If so, return
		cmpi.b	#3,double_jump_flag(a1)	; Is Knuckles sliding after gliding?
		jne		SolidObject_cont		; If not, branch

	.ret:
		rts
; End of function SolidObject_Monitor_SonicKnux


; =============== S U B R O U T I N E =======================================


SolidObject_Monitor_Tails:
		btst	d6,status(a0)		; Is Tails standing on the monitor?
		bne.s	Monitor_ChkOverEdge	; If so, branch
		jmp		SolidObject_cont
; ---------------------------------------------------------------------------

Monitor_ChkOverEdge:
		move.w	d1,d2
		add.w	d2,d2
		btst	#Status_InAir,status(a1)				; Is the character in the air?
		bne.s	.notonmonitor					; If so, branch
		; Check if character is standing on
		move.w	x_pos(a1),d0
		sub.w	x_pos(a0),d0
		add.w	d1,d0
		bmi.s	.notonmonitor					; Branch, if character is behind the left edge of the monitor
		cmp.w	d2,d0
		blo.s		Monitor_CharStandOn				; Branch, if character is not beyond the right edge of the monitor

.notonmonitor:
		; if the character isn't standing on the monitor
		bclr	#Status_OnObj,status(a1)				; Clear 'on object' bit
		bset	#Status_InAir,status(a1)				; Set 'in air' bit
		bclr	d6,status(a0)							; Clear 'standing on' bit for the current character
		moveq	#0,d4
		rts
; ---------------------------------------------------------------------------

Monitor_CharStandOn:
		move.w	d4,d2
		jsr	MvSonicOnPtfm
		moveq	#0,d4
		rts

; =============== S U B R O U T I N E =======================================

Obj_MonitorBreak:
		move.b	status(a0),d0
		andi.b	#standing_mask|pushing_mask,d0	; Is someone touching the monitor?
		beq.s	Obj_MonitorSpawnIcon			; If not, branch
		move.b	d0,d1
		andi.b	#p1_standing|p1_pushing,d1	; is it the main character?
		beq.s	+		; if not, branch
		andi.b	#$D7,(Player_1+status).w
		ori.b	#2,(Player_1+status).w	; prevent Sonic from walking in the air
+
		andi.b	#p2_standing|p2_pushing,d0	; is it the sidekick?
		beq.s	Obj_MonitorSpawnIcon	; if not, branch
		andi.b	#$D7,(Player_2+status).w
		ori.b	#2,(Player_2+status).w	; prevent Tails from walking in the air

Obj_MonitorSpawnIcon:
		andi.b	#3,status(a0)
		clr.b	collision_flags(a0)
		jsr	(Create_New_Sprite3).w
		bne.s	.skipiconcreation
		move.l	#Obj_MonitorContents,address(a1)
		move.w	x_pos(a0),x_pos(a1)				; Set icon's position
		move.w	y_pos(a0),y_pos(a1)
		move.b	anim(a0),anim(a1)
		move.b	render_flags(a0),render_flags(a1)
		move.b	status(a0),status(a1)

.skipiconcreation:
		jsr	(Create_New_Sprite3).w
		bne.s	.skipexplosioncreation
		move.l	#Obj_Explosion,address(a1)
		addq.b	#2,routine(a1)					; => loc_1E61A
		move.w	x_pos(a0),x_pos(a1)				; Set explosion's position
		move.w	y_pos(a0),y_pos(a1)

.skipexplosioncreation:
		move.w	respawn_addr(a0),d0				; Get address in respawn table
		beq.s	.notremembered					; If it's zero, it isn't remembered
		movea.w	d0,a2							; Load address into a2
		bset	#0,(a2)								; Mark monitor as destroyed

.notremembered:
		move.b	#$B,anim(a0)					; Display 'broken' animation
		move.l	#Obj_MonitorAnimate,address(a0)
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------
; Monitor contents (Object)
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Obj_MonitorContents:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	off_1D7C8(pc,d0.w),d1
		jmp	off_1D7C8(pc,d1.w)
; ---------------------------------------------------------------------------

off_1D7C8: offsetTable
		offsetTableEntry.w Obj_MonitorContents_Init	; 0
		offsetTableEntry.w Obj_MonitorContents_Raise	; 2
		offsetTableEntry.w Obj_MonitorContents_Wait	; 4
; ---------------------------------------------------------------------------

Obj_MonitorContents_Init:
		addq.b	#2,routine(a0)
		move.l	#Map_MonitorContents,mappings(a0)
		move.w	#make_art_tile(ArtTile_Monitors,0,1),art_tile(a0)
		ori.b	#4,render_flags(a0)
		move.w	#$180,priority(a0)
		move.b	#16/2,width_pixels(a0)
		move.w	#-$300,y_vel(a0)
		btst	#1,render_flags(a0)
		beq.s	loc_1D7FC
		neg.w	y_vel(a0)

loc_1D7FC:
		moveq	#0,d0
		move.b	anim(a0),d0
		addq.b	#1,d0
		move.b	d0,mapping_frame(a0)

Obj_MonitorContents_Raise:
		bsr.s	sub_1D820
		jmp	(Draw_Sprite).w

; =============== S U B R O U T I N E =======================================

sub_1D820:
		btst	#1,render_flags(a0)
		bne.s	loc_1D83C
		tst.w	y_vel(a0)
		bpl.s	loc_1D850
		jsr	(MoveSprite2).w
		addi.w	#$18,y_vel(a0)
		rts
; ---------------------------------------------------------------------------

loc_1D83C:
		tst.w	y_vel(a0)
		bmi.s	loc_1D850
		jsr	(MoveSprite2).w
		subi.w	#$18,y_vel(a0)
		rts
; ---------------------------------------------------------------------------

loc_1D850:
		addq.b	#2,routine(a0)
		move.w	#$1D,anim_frame_timer(a0)
		lea	(Player_1).w,a1
		moveq	#0,d0
		move.b	anim(a0),d0
		add.w	d0,d0
		move.w	Obj_MonitorContents_Types(pc,d0.w),d0
		jmp	Obj_MonitorContents_Types(pc,d0.w)
; ---------------------------------------------------------------------------

Obj_MonitorContents_Types: offsetTable
		offsetTableEntry.w Monitor_Give_Eggman			; 0
		offsetTableEntry.w Monitor_Give_Double_Shield	; 2
		offsetTableEntry.w Monitor_Give_Eggman			; 4
		offsetTableEntry.w Monitor_Give_Rings				; 6
		offsetTableEntry.w Monitor_Give_Super_Sneakers		; 8
		offsetTableEntry.w Monitor_Give_Fire_Shield			; A
		offsetTableEntry.w Monitor_Give_Lightning_Shield	; C
		offsetTableEntry.w Monitor_Give_Bubble_Shield		; E
		offsetTableEntry.w Monitor_Give_Invincibility			; 10
		offsetTableEntry.w Monitor_Give_SuperSonic			; 12
		offsetTableEntry.w Monitor_Give_HyperSonic			; 14
; ---------------------------------------------------------------------------

Monitor_Give_Eggman:
		jmp	sub_24280(pc)
; ---------------------------------------------------------------------------

Monitor_Give_Double_Shield:
		andi.b	#$8E,status_secondary(a1)
		bset	#Status_Shield,status_secondary(a1)
		move.l	#Obj_Double_Shield,(v_Shield).w
		sfx	sfx_DoubleShield,1
; ---------------------------------------------------------------------------

Monitor_Give_Rings:
		addi.w	#10,(Ring_count).w				; add 10 rings to the number of rings you have
		ori.b	#1,(Update_HUD_ring_count).w	; update the ring counter
		sfx	sfx_RingRight,1						; play ring sound
; ---------------------------------------------------------------------------

Monitor_Give_Super_Sneakers:
		tst.b	(Super_Sonic_Knux_flag).w
		bne.s	Monitor_Give_Rings
		bset	#Status_SpeedShoes,status_secondary(a1)
		move.l	#Obj_HyperSonicKnux_Trail,(v_Super_stars).w
		move.w	#Player_1,(v_Super_stars+parent).w
		move.b	#150,speed_shoes_timer(a1)
		move.w	#$C00,(Top_speed_P1).w
		move.w	#$18,(Acceleration_P1).w
		move.w	#$80,(Deceleration_P1).w
		move.b	#emotion_happy,(Current_emotion).w
		jsr		UpdateEmotionWindow
		music	bgm_Speedup,1						; speed up the music
; ---------------------------------------------------------------------------

Monitor_Give_Fire_Shield:
		andi.b	#$8E,status_secondary(a1)
		bset	#Status_Shield,status_secondary(a1)
		bset	#Status_FireShield,status_secondary(a1)
		move.l	#Obj_Fire_Shield,(v_Shield).w
		sfx	sfx_FireShield,1
; ---------------------------------------------------------------------------

Monitor_Give_Lightning_Shield:
		andi.b	#$8E,status_secondary(a1)
		bset	#Status_Shield,status_secondary(a1)
		bset	#Status_LtngShield,status_secondary(a1)
		move.l	#Obj_Lightning_Shield,(v_Shield).w
		sfx	sfx_LightningShield,1
; ---------------------------------------------------------------------------

Monitor_Give_Bubble_Shield:
		andi.b	#$8E,status_secondary(a1)
		bset	#Status_Shield,status_secondary(a1)
		bset	#Status_BublShield,status_secondary(a1)
		move.l	#Obj_Bubble_Shield,(v_Shield).w
		sfx	sfx_BubbleShield,1
; ---------------------------------------------------------------------------

Monitor_Give_Invincibility:
		tst.b	(Super_Sonic_Knux_flag).w
		bne.w	Monitor_Give_Rings
		bset	#Status_Invincible,status_secondary(a1)
		move.b	#150,invincibility_timer(a1)
		cmpi.b	#12,air_left(a1)
		bls.s	.skipmusic
		move.b	#emotion_happy,(Current_emotion).w
		jsr		UpdateEmotionWindow
		tst.b	(Level_end_flag).w
		bne.s	.skipmusic
		tst.b	(Boss_flag).w
		bne.s	.skipmusic
		cmpi.l	#Obj_Invincibility.main,(v_Invincibility_stars).w
		beq.s	.skipmusic	; player is already invincible, don't restart music
		music	bgm_Invincible					; if invincible, play invincibility music

.skipmusic:
		move.l	#Obj_Invincibility,(v_Invincibility_stars).w
		rts
; ---------------------------------------------------------------------------

Obj_MonitorContents_Wait:
		subq.w	#1,anim_frame_timer(a0)
		bmi.w	loc_1EBB6
		jmp	(Draw_Sprite).w
; ---------------------------------------------------------------------------

Monitor_Give_SuperSonic:
		move.b	#1,(Super_Sonic_Knux_flag).w		; Super
		music	bgm_S3Invincible
		move.l	#Obj_SuperSonicKnux_Stars,(v_Super_stars).w
		move.b	#1,(v_Super_stars+anim).w
		bra.s	Monitor_Give_SuperHyper
; ---------------------------------------------------------------------------

Monitor_Give_HyperSonic:
		move.b	#-1,(Super_Sonic_Knux_flag).w		; Hyper
		music	bgm_SKInvincible
		move.l	#Obj_HyperSonicKnux_Trail,(v_Super_stars).w
		move.w	#Player_1,(v_Super_stars+parent).w
		move.l	#Obj_HyperSonic_Stars,(v_Invincibility_stars).w
		move.b	#1,(v_Invincibility_stars+anim).w
;		bra.s	Monitor_Give_SuperHyper				; runs right into it
; ---------------------------------------------------------------------------

Monitor_Give_SuperHyper:
		addi.w	#50,(Ring_count).w
		move.b	#1,(Super_palette_status).w
		move.b	#$F,(Palette_timer).w
		move.w	#60,(Super_frame_count).w
		move.b	#$81,(Player_1+object_control).w
		move.b	#id_Transform,(Player_1+anim).w

	.continued:
		move.w	#$A00,(Top_speed_P1).w
		move.w	#$30,(Acceleration_P1).w
		move.w	#$100,(Deceleration_P1).w
		move.b	#0,(Player_1+invincibility_timer).w
		bset	#Status_Invincible,status_secondary(a1)
		jsr		ResetEmotion.super
		sfx	sfx_SuperTransform, 1

		include "Objects/Monitor/Object Data/Anim - Monitor.asm"
Map_Monitor:		binclude "Objects/Monitor/Object Data/Map - Monitor.bin"
Map_MonitorContents:		binclude "Objects/Monitor/Object Data/Map - Monitor Contents.bin"
