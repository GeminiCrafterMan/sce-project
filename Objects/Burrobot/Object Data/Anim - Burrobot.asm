; ---------------------------------------------------------------------------
; Animation script - Burrobot enemy
; ---------------------------------------------------------------------------
Ani_Burrobot:	dc.w .walk1-Ani_Burrobot
		dc.w .walk2-Ani_Burrobot
		dc.w .digging-Ani_Burrobot
		dc.w .fall-Ani_Burrobot
.walk1:		dc.b 3,	0, 6, afEnd
.walk2:		dc.b 3,	0, 1, afEnd
.digging:	dc.b 3,	2, 3, afEnd
.fall:		dc.b 3,	4, 5, afEnd
		even 
