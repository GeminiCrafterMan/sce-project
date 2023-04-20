Obj_SSEntryRing:
		move.b	subtype(a0),d0
		move.l	(Collected_special_ring_array).w,d1
		btst	d0,d1
		beq.s	loc_6167C				; only make the ring if it hasn't already been collected
		jmp	(Delete_Current_Sprite).l
; ---------------------------------------------------------------------------

loc_6167C:
		jsr	(Obj_WaitOffscreen).l			; Don't start anything until the ring is explicitly onscreen
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	SSEntryRing_Index(pc,d0.w),d1
		jsr	SSEntryRing_Index(pc,d1.w)
		bra.w	SSEntryRing_Display
; ---------------------------------------------------------------------------
SSEntryRing_Index:
		dc.w SSEntryRing_Init-SSEntryRing_Index
		dc.w SSEntryRing_Main-SSEntryRing_Index
		dc.w SSEntryRing_Animate-SSEntryRing_Index
; ---------------------------------------------------------------------------

SSEntryRing_Init:
		lea	ObjSlot_SSEntryRing(pc),a1
		jsr	(SetUp_ObjAttributesSlotted).l		; Only one special stage ring can be loaded at one time, period
		move.l	#AniRaw_SSEntryRing,aniraw(a0)
		tst.b	subtype(a0)
		bmi.s	loc_616C6			; If negative, then ALWAYS make this a super emerald ring
;		tst.w	(SK_alone_flag).w		; Probably only used in MHZ for the first rings
;		bne.s	SSEntryRing_Main			; If only Sonic and Knuckles, skip ahead
		bsr.w	SSEntry_CheckLevel
		beq.s	SSEntryRing_Main			; If in an S3 level, skip ahead since it's a normal ring
		cmpi.b	#7,(Chaos_emerald_count).w
		bne.s	SSEntryRing_Main			; Only make this a super emerald ring if you actually have 7 chaos emeralds

loc_616C6:
		bset	#6,$38(a0)				; Make this a super emerald ring
		lea	(PalSPtr_SSEntry).l,a1
		lea	(Palette_rotation_data).w,a2
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
;		lea	(PalSPtr_SSEntry2).l,a1
;		move.l	(a1)+,(a2)+
;		move.l	(a1)+,(a2)+
		clr.w	(a2)					; Set up the Palette script pointers

SSEntryRing_Main:
		jsr	(Animate_Raw).l
		tst.w	(Debug_placement_mode).w
		bne.s	locret_61708		; If in debug mode, don't allow collision
		cmpi.b	#8,mapping_frame(a0)
		blo.s	locret_61708		; If ring hasn't finished forming, don't allow collision
		lea	SSEntry_Range(pc),a1
		jsr	(Check_PlayerInRange).l
		tst.w	d0
		bne.s	loc_6170A

locret_61708:
		rts
; ---------------------------------------------------------------------------

loc_6170A:
		lea	(Player_1).w,a1			; If collision was made
		cmpi.b	#6,routine(a1)
		bhs.s	locret_61708		; If player has died for whatever reason, don't do anything
		sfx		sfx_BigRing		; Play the ring swish sound
		cmpi.b	#7,(Chaos_emerald_count).w
		bne.s	loc_6173A			; If chaos emeralds aren't collected, branch
;		tst.w	(SK_alone_flag).w
;		bne.s	loc_61794			; If only Sonic and Knuckles and the emeralds are collected, go claim 50 rings
		bsr.w	SSEntry_CheckLevel
		beq.s	loc_61794			; Otherwise, only do so if on an S3 level
		cmpi.b	#7,(Super_emerald_count).w
		beq.s	loc_61794			; Only collect rings in an SK level if the super emeralds are collected as well

loc_6173A:
		move.b	#4,routine(a0)
		lea	(Player_1).w,a1
		move.b	#-1,previous_frame(a1)	; Make the player disappear and lock input
		move.b	#0,mapping_frame(a1)
		move.b	#id_Null,anim(a1)
		move.b	#$53,wait(a1)
		tst.b	(Flying_carrying_Sonic_flag).w
		beq.s	loc_61778
		lea	(Player_2).w,a1
		move.b	#0,mapping_frame(a1)
		move.b	#id_Null,anim(a1)
		move.b	#$53,wait(a1)		; Lock both players, etc

loc_61778:
		jsr	(Create_New_Sprite).l
		bne.s	locret_6178A
		move.l	#Obj_SSEntryFlash,(a1)
		move.w	a0,parent3(a1)			; Set ring as parent

locret_6178A:
		rts
; ---------------------------------------------------------------------------
SSEntry_Range:	dc.w $FFE8
		dc.w $30
		dc.w $FFD8
		dc.w $50
; ---------------------------------------------------------------------------

loc_61794:
		sfx		sfx_BigRing
		move.b	subtype(a0),d0
		move.l	(Collected_special_ring_array).w,d1
		bset	d0,d1
		move.l	d1,(Collected_special_ring_array).w	; Set the special stage ring as collected
		bset	#5,$38(a0)
		moveq	#50,d0				; Add 50 rings
		jmp	(AddRings).l
; ---------------------------------------------------------------------------

SSEntryRing_Animate:
		jmp	(Animate_Raw).l
; ---------------------------------------------------------------------------

Obj_SSEntryFlash:
		moveq	#0,d0
		move.b	routine(a0),d0
		move.w	SSEntryFlash_Index(pc,d0.w),d1
		jsr	SSEntryFlash_Index(pc,d1.w)
		lea	DPLCPtr_SSEntryFlash(pc),a2
		jsr	(Perform_DPLC).l
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------
SSEntryFlash_Index:
		dc.w SSEntryFlash_Init-SSEntryFlash_Index
		dc.w SSEntryFlash_Main-SSEntryFlash_Index
; ---------------------------------------------------------------------------

SSEntryFlash_Init:
		lea	ObjSlot_SSEntryFlash(pc),a1
		jsr	(SetUp_ObjAttributesSlotted).l
		move.l	#AniRaw_SSEntryFlash,aniraw(a0)
		move.l	#SSEntryFlash_Finished,jump(a0)
		movea.w	parent3(a0),a1
		move.w	x_pos(a1),x_pos(a0)
		move.w	y_pos(a1),y_pos(a0)
		move.b	subtype(a1),subtype(a0)		; Copy positional data from parent ring
		move.w	(Player_1+x_pos).w,d0
		cmp.w	x_pos(a0),d0
		blo.s	locret_61820
		bset	#0,4(a1)			; Set direction based on where player approached

locret_61820:
		rts
; ---------------------------------------------------------------------------

SSEntryFlash_Main:
		move.b	mapping_frame(a0),d6
		jsr	(Animate_RawAdjustFlipX).l
		cmp.b	mapping_frame(a0),d6
		beq.s	locret_61844
		cmpi.b	#3,$23(a0)
		bne.s	locret_61844
		movea.w	parent3(a0),a1			; Set parent to be deleted in the middle of the animation
		bset	#5,$38(a1)

locret_61844:
		rts
; ---------------------------------------------------------------------------

SSEntryFlash_Finished:
		move.l	#Obj_Wait,(a0)		; This is performed when animation is finished
		move.w	#$20,wait(a0)
		move.l	#SSEntryFlash_GoSS,jump(a0)
		rts
; ---------------------------------------------------------------------------

SSEntryFlash_GoSS:
		sfx		sfx_EnterSS		; Play the special stage entry sound (you know the one)
		jsr	(Clear_SpriteRingMem).l
;		jsr	(Save_Level_Data2).l	; Not sure what this does yet
		tst.b	subtype(a0)
		bmi.s	loc_618AC			; If negative, always go to HPZ
		moveq	#0,d0
;		tst.w	(SK_alone_flag).w
;		bne.s	loc_61892			; If SK alone, go directly to special stage
		bsr.w	SSEntry_CheckLevel
		beq.s	loc_61892			; Otherwise, do so if S3 levels
		cmpi.b	#7,(Chaos_emerald_count).w
		bne.s	loc_61892			; or if chaos emeralds aren't collected
		bra.w	loc_618AC			; When conditions are met, go to HPZ
; ---------------------------------------------------------------------------
		moveq	#1,d0

loc_61892:
		move.b	d0,(SK_special_stage_flag).w			; Regular ring takes you directly to special stage
		move.b	#1,(Special_bonus_entry_flag).w
		move.b	#$34,(Game_mode).w
		move.b	#1,(Respawn_table_keep).w
		bra.w	loc_618D0
; ---------------------------------------------------------------------------

loc_618AC:
		move.b	#2,(Special_bonus_entry_flag).w			; Super emerald takes you to HPZ
		move.w	#$1701,(Current_zone_and_act).w
		move.w	#$1701,(Apparent_zone_and_act).w
		move.b	#0,(Last_star_post_hit).w
		move.b	#1,(Restart_level_flag).w
		move.b	#1,(Respawn_table_keep).w

loc_618D0:
		move.b	subtype(a0),d0
		move.l	(Collected_special_ring_array).w,d1
		bset	d0,d1
		move.l	d1,(Collected_special_ring_array).w		; Set SS ring as collected
		jmp	(Go_Delete_SpriteSlotted2).l

; =============== S U B R O U T I N E =======================================


SSEntry_CheckLevel:
		cmpi.b	#7,(Current_zone).w
		bhs.s	loc_618F8
		cmpi.b	#4,(Current_zone).w
		beq.s	loc_618F8
		moveq	#0,d1				; 0 is S3 levels
		rts
; ---------------------------------------------------------------------------

loc_618F8:
		moveq	#1,d1				; 1 is SK levels
		rts
; End of function SSEntry_CheckLevel

; ---------------------------------------------------------------------------

SSEntryRing_Display:
		btst	#5,$38(a0)
		bne.s	loc_6196A
		tst.b	4(a0)
		bpl.s	loc_61928
		btst	#6,$38(a0)
		beq.s	loc_61918
		jsr	(Run_PalRotationScript).l			; Only run the rotation script if this is a super emerald ring

loc_61918:
		lea	DPLCPtr_SSEntryRing(pc),a2
		jsr	(Perform_DPLC).l
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_61928:
		move.w	x_pos(a0),d0					; If off-screen
		andi.w	#-$80,d0
		sub.w	(Camera_X_pos_coarse_back).w,d0
		cmpi.w	#$280,d0
		bhi.s	loc_6196A
		move.w	y_pos(a0),d0
		move.w	(Camera_Y_pos).w,d1
		move.w	y_pos(a0),d0
		sub.w	(Camera_Y_pos).w,d0
		addi.w	#$80,d0
		cmpi.w	#$200,d0
		bhi.w	loc_6196A					; Jump below when far enough off-screen
		move.l	#words_to_long($646,$48A),(Normal_palette_line_2+$A).w
		move.w	#$2CE,(Normal_palette_line_2+$E).w
		jmp	(Draw_Sprite).l
; ---------------------------------------------------------------------------

loc_6196A:
		move.l	#words_to_long($646,$48A),(Normal_palette_line_2+$A).w
		move.w	#$2CE,(Normal_palette_line_2+$E).w			; Restore the part of the palette that was changed
		lea	(ArtKosM_Explosion).l,a1
		move.w	#-$4C00,d2
		jsr	(Queue_Kos_Module).l			; Restore the overwritten badnik explosion art
		jmp	(Go_Delete_SpriteSlotted).l
; ---------------------------------------------------------------------------
ObjSlot_SSEntryRing:
		dc.w 0
		dc.w make_art_tile(ArtTile_Explosion,1,0)
		dc.w $40
		dc.w 4
		dc.l Map_SSEntryRing
		dc.b 2
		dc.b $80
		dc.b $20
		dc.b $20
		dc.b 0
		dc.b 0
ObjSlot_SSEntryFlash:
		dc.w 0
		dc.w make_art_tile(ArtTile_Sonic,1,0)
		dc.w $18
		dc.w 6
		dc.l Map_SSEntryFlash
		dc.b 2
		dc.b 0
		dc.b $20
		dc.b $20
		dc.b 0
		dc.b 0
DPLCPtr_SSEntryRing:
		dc.l ArtUnc_SSEntryRing>>1
		dc.l DPLC_SSEntryRing
DPLCPtr_SSEntryFlash:
		dc.l ArtUnc_SSEntryFlash>>1
		dc.l DPLC_SSEntryFlash
AniRaw_SSEntryRing:
		dc.b    3,   0,   0,   1,   2,   3,   4,   5,   6,   7,   8,   9, $A, arfBack,  $10,   $D	; idk what these last two values actually do
		dc.b	4,  $B,  $C,  $D,  $E,  $F, $10, $11, $12, $13, $14, arfEnd
AniRaw_SSEntryFlash:
		dc.b    0,   0,   0,   1,   2, $43,   3,   2,   1,   0, arfJump
		even
Map_SSEntryRing:
		binclude "Objects/Giant Ring/Object Data/Map - Entry Ring.bin"
DPLC_SSEntryRing:
		binclude "Objects/Giant Ring/Object Data/DPLC - Special Stage Entry Ring.bin"
Map_SSEntryFlash:
		binclude "Objects/Giant Ring/Object Data/Map - Entry Flash.bin"
DPLC_SSEntryFlash:
		binclude "Objects/Giant Ring/Object Data/DPLC - Special Stage Entry Flash.bin"

PalSPtr_SSEntry:
		palscriptptr .header, .data
.header
	palscripthdr	Normal_palette_line_2+$A, 3, 0
.data
	palscriptdata	3, $868, $A8A, $ECE
	palscriptdata	3, $0AA, $6EE, $AEE
	palscriptdata	3, $864, $A86, $ECA
	palscriptdata	3, $0AA, $6EE, $AEE
	palscriptdata	3, $2A2, $4C4, $8E8
	palscriptdata	3, $0AA, $6EE, $AEE
	palscriptdata	3, $4A8, $4CA, $6EC
	palscriptdata	3, $0AA, $6EE, $AEE
	palscriptdata	3, $28A, $2AC, $6CE
	palscriptdata	3, $0AA, $6EE, $AEE
	palscriptrept	; S&K ring...?
	palscriptdata	2, $066, $0AA, $6EE
	palscriptdata	2, $088, $0CC, $8EE
	palscriptdata	2, $0AA, $6EE, $AEE
	palscriptdata	2, $0CC, $AEE, $CEE
	palscriptdata	2, $EEE, $EEE, $EEE
	palscriptdata	2, $0CC, $AEE, $CEE
	palscriptdata	2, $0AA, $6EE, $AEE
	palscriptdata	2, $088, $0CC, $8EE
	palscriptrept	; same as last one
	palscriptdata	2, $066, $0AA, $6EE
	palscriptdata	2, $088, $0CC, $8EE
	palscriptdata	2, $0AA, $6EE, $AEE
	palscriptdata	2, $0CC, $AEE, $CEE
	palscriptdata	2, $EEE, $EEE, $EEE
	palscriptdata	2, $0CC, $AEE, $CEE
	palscriptdata	2, $0AA, $6EE, $AEE
	palscriptdata	2, $088, $0CC, $8EE