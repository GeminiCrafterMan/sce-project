; ---------------------------------------------------------------------------
; Subroutine to initialise joypads
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Init_Controllers:
		stopZ80
		stopZ802
		move.b	#$40,(HW_Port_1_Control).l
		move.b	#$40,(HW_Port_2_Control).l
		lea	(HW_Port_1_Data).l,a0
		lea	(Six_button_flag).l,a1
;		bsr.s	.read
;		stopZ80
;		stopZ802
;		addq.w	#2,a0		; do the second	joypad
;		addq.w	#1,a1		; do the second	joypad
;		bsr.s	.read
;		rts
;	.read:
	; set counter to 1 + TH high
		move.b #$40,(a0)
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 2 + TH low
		move.b (a0),d0
		move.b #$00,(a0)
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 3 + TH high
		move.b #$40,(a0)
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 4 + TH low
		move.b #$00,(a0) ; set TH low
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 5 + TH high
		move.b #$40,(a0) ; set TH high
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 6 + TH low
	; 6 button id is in counter 6
		move.b #$00,(a0) ; set TH low
		nop ; bus synchronization
		nop ; bus synchronization
		move.b (a0),d0 ; copy controller data to d0
		cmpi.b #%00110011,d0 ; 00110011 = 3 button controller
		beq.s .not6btn
		move.b #%111111,(a1)
	.not6btn:
	; set counter to 7 + TH high
		move.b #$40,(a0)
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 8 + TH low
		move.b #$00,(a0) ; set TH low
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 9 + TH high
		move.b #$40,(a0) ; set TH high
		nop ; bus synchronization
		nop ; bus synchronization
		startZ802
		startZ80
		rts
; ---------------------------------------------------------------------------
; Subroutine to read joypad input, and send it to the RAM
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Poll_Controllers:
;		disable_ints
		lea	(Ctrl_1).w,a0 ; address where joypad states are written
		lea	(HW_Port_1_Data).l,a1
		lea	(Six_button_flag).l,a2
		bsr.s	.read
		addq.w	#4,a0		; do the second joypad
		addq.w	#2,a1		; do the second	joypad
		addq.w	#1,a2		; do the second	joypad
;		enable_ints
	.read:
	; set counter to 1 + TH high
		move.b #$40,(a1) ; set TH high
		nop ; bus synchronization
		nop ; bus synchronization
		move.b (a1),d0 ; get joypad data - C/B/Dpad
		andi.b #%00111111,d0 ; C/B/Dpad in low 6 bits
	; set counter to 2 + TH low
		move.b #$00,(a1) ; set TH low
		nop ; bus synchronization
		nop ; bus synchronization
		move.b (a1),d1 ; get joypad data - Start/A
		lsl.b #2,d1 ; shift them so they are at the 2 highest bits
		andi.b #%11000000,d1 ; Start/A in high 2 bits - clear others
		or.b d1,d0 ; merge values from both registers
		not.b d0 ; flip bits so 0 means not pressed, and 1 means pressed
		move.b d0,d1 ; copy current buttons to d1
		move.b 0(a0),d2 ; copy the last previously read buttons
		eor.b d2,d0 ; flip buttons being pressed now
		move.b d1,0(a0) ; store held buttons
		and.b d1,d0 ; AND with current buttons
		move.b d0,1(a0) ; store pressed buttons
		; if this is a 3 button controller skip the remaining steps
		move.b (a2),d0 ; save the value
		tst.b d0 ; is this zero?
		beq.w ExitReadJoypad ; zero means 3 button controller
	; set counter to 3 + TH high
		move.b #$40,(a1) ; set TH high
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 4 + TH low
		move.b #$00,(a1) ; set TH low
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 5 + TH high
		move.b #$40,(a1) ; set TH high
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 6 + TH low
		move.b #$00,(a1) ; set TH low
		nop ; bus synchronization
		nop ; bus synchronization
	; set counter to 7 + TH high
		move.b #$40,(a1) ; set TH high
		nop ; bus synchronization
		nop ; bus synchronization
		move.b (a1),d0 ; get joypad data - x/y/z/mode
		not.b d0  ; flip bits so 0 means not pressed, and 1 means pressed
		and.b #%00001111,d0 ; x/y/z/mode are in lowest 4 bits
		move.b d0,d1 ; copy current buttons to d1
		move.b 2(a0),d2 ; copy the last previously read buttons
		eor.b d2,d0 ; flip buttons being pressed now
		move.b d1,2(a0) ; store held buttons
		and.b d1,d0 ; AND with current buttons
		move.b d0,3(a0) ; store pressed buttons
		;---------------------------------
		; set counter to 8 + TH low
		; just for demo purposes - not needed
		;---------------------------------
		move.b #$00,(a1) ; set TH low
		nop ; bus synchronization
		nop ; bus synchronization
		;---------------------------------
		; set counter to 9 + TH high
		; just for demo purposes - not needed
		;---------------------------------
		move.b #$40,(a1) ; set TH high
		nop ; bus synchronization
		nop ; bus synchronization
		;---------------------------------
		; done reading controller
		;---------------------------------
ExitReadJoypad:
		rts
