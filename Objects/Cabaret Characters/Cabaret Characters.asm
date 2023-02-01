; ---------------------------------------------------------------------------
; Object - Sonic on the menu
; ---------------------------------------------------------------------------

Obj_CabaretSonic:
		move.l	#Map_CabaretSonic,mappings(a0)
		move.w	#$100,priority(a0)
		tst.b	(Clone_Driver_RAM+SMPS_RAM.v_music_fm1_track).w
		beq.s	.noMusic
		move.b	#1,anim(a0)	; Snapping
		bra.s	.display
	.noMusic:
		move.b	#0,anim(a0)	; Waiting
	; run into .display
	.display:
		lea		(Ani_CabaretSonic).l,a1
		jsr		AnimateSprite
		bsr.s	CabaretSonic_Load_PLC
		jmp		DisplaySprite

CabaretSonic_Load_PLC:
		moveq	#0,d0
		move.b	mapping_frame(a0),d0
		cmp.b	previous_frame(a0),d0
		beq.s	+
		move.b	d0,previous_frame(a0)
		lea	(PLC_CabaretSonic).l,a2
		add.w	d0,d0
		adda.w	(a2,d0.w),a2
		move.w	(a2)+,d5
		subq.w	#1,d5
		bmi.s	+
		move.w	vram_art(a0),d4
		move.l	#ArtUnc_CabaretSonic>>1,d6

-		moveq	#0,d1
		move.w	(a2)+,d1
		move.w	d1,d3
		lsr.w	#8,d3
		andi.w	#$F0,d3
		addi.w	#$10,d3
		andi.w	#$FFF,d1
		lsl.l	#4,d1
		add.l	d6,d1
		move.w	d4,d2
		add.w	d3,d4
		add.w	d3,d4
		jsr	(Add_To_DMA_Queue).w
		dbf	d5,-
+		rts
; End of function CabaretSonic_Load_PLC

; ---------------------------------------------------------------------------
; Object - Tails and his tails on the menu
; ---------------------------------------------------------------------------

Obj_CabaretTails:
		cmpa.w	#Player_1,a0
		bne.s	.p2
	.p1:
		move.l	#Obj_CabaretTails_Tail,(v_FollowObject_P1).w
		move.w	a0,(v_FollowObject_P1+parent).w
		move.w	#make_art_tile(ArtTile_FollowObject_P1,2,0),(v_FollowObject_P1+art_tile).w
		bra.s	.cont
	.p2:
		move.l	#Obj_CabaretTails_Tail,(v_FollowObject_P2).w
		move.w	a0,(v_FollowObject_P2+parent).w
		move.w	#make_art_tile(ArtTile_FollowObject_P2,2,0),(v_FollowObject_P2+art_tile).w
	.cont:
		move.l	#Map_CabaretSonic,mappings(a0)
		move.w	#$100,priority(a0)
		move.b	#2,anim(a0)	; Sleeping
		bra.w	Obj_CabaretSonic.display

Obj_CabaretTails_Tail:
		move.l	#Map_TailsTails,mappings(a0)
		movea.w	parent(a0),a2	; Is Parent in S2
		cmpi.l	#Obj_CabaretTails,address(a2)
		jne		DeleteObject
		move.w	x_pos(a2),x_pos(a0)
		move.w	y_pos(a2),y_pos(a0)
		addq.w	#4,y_pos(a0)
		move.w	priority(a2),priority(a0)
		move.b	status(a2),status(a0)
		move.b	#1,anim(a0)
		lea		(AniTails_Tail).l,a1
		jsr		AnimateSprite
		jsr		Tails_Tail_Load_PLC
		jmp		DisplaySprite

; ---------------------------------------------------------------------------
; Object - Knuckles on the menu
; ---------------------------------------------------------------------------

Obj_CabaretKnuckles:
		move.l	#Map_CabaretSonic,mappings(a0)
		move.w	#$100,priority(a0)
		tst.b	(Clone_Driver_RAM+SMPS_RAM.v_music_fm1_track).w
		beq.s	.noMusic
		move.b	#4,anim(a0)	; Boxing
		bra.w	Obj_CabaretSonic.display
	.noMusic:
		move.b	#3,anim(a0)	; Waiting
		bra.w	Obj_CabaretSonic.display

; ---------------------------------------------------------------------------
; Object - Mighty on the menu
; ---------------------------------------------------------------------------

Obj_CabaretMighty:
		move.l	#Map_CabaretSonic,mappings(a0)
		move.w	#$100,priority(a0)
		tst.b	(Clone_Driver_RAM+SMPS_RAM.v_music_fm1_track).w
		beq.s	.noMusic
		move.b	#1,anim(a0)	; Snapping
		bra.w	Obj_CabaretSonic.display
	.noMusic:
		move.b	#0,anim(a0)	; Waiting
		bra.w	Obj_CabaretSonic.display

; ===========================================================================
; ---------------------------------------------------------------------------
; Cabaret character animation, mapping, and PLC data
; ---------------------------------------------------------------------------

		include "Objects/Cabaret Characters/Object Data/Anim - Cabaret Sonic.asm"
		include "Objects/Cabaret Characters/Object Data/Map - Cabaret Sonic.asm"
		include "Objects/Cabaret Characters/Object Data/DPLC - Cabaret Sonic.asm"