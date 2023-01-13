; ---------------------------------------------------------------------------
; Animation script - Buzz Bomber enemy
; ---------------------------------------------------------------------------
Ani_Buzz:	dc.w .fly1-Ani_Buzz
		dc.w .fly2-Ani_Buzz
		dc.w .fires-Ani_Buzz
		dc.w .flare-Ani_Buzz ; missile
		dc.w .missile-Ani_Buzz ; missile
.fly1:		dc.b 1,	0, 1, afEnd
.fly2:		dc.b 1,	2, 3, afEnd
.fires:		dc.b 1,	4, 5, afEnd
.flare:		dc.b 7,	6, 7, afRoutine
.missile:	dc.b 1,	8, 9, afEnd
		even