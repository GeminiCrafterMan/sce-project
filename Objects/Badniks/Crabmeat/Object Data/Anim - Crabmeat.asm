; ---------------------------------------------------------------------------
; Animation script - Crabmeat enemy
; ---------------------------------------------------------------------------
Ani_Crab:	dc.w CrabTemp_stand-Ani_Crab, CrabTemp_standslope-Ani_Crab, CrabTemp_standsloperev-Ani_Crab
		dc.w CrabTemp_walk-Ani_Crab, CrabTemp_walkslope-Ani_Crab, CrabTemp_walksloperev-Ani_Crab
		dc.w CrabTemp_firing-Ani_Crab, CrabTemp_ball-Ani_Crab
CrabTemp_stand:		dc.b $F, 0, afEnd
		even
CrabTemp_standslope:	dc.b $F, 3, afEnd
		even
CrabTemp_standsloperev:	dc.b $F, 4, afEnd
		even
CrabTemp_walk:		dc.b $F, 1, 2, 0, afEnd
		even
CrabTemp_walkslope:	dc.b $F, 2, 5, 3, afEnd
		even
CrabTemp_walksloperev:	dc.b $F, 1, 6, 4, afEnd
		even
CrabTemp_firing:	dc.b $F, 7, afEnd
		even
CrabTemp_ball:		dc.b 1,	8, 9, afEnd
		even