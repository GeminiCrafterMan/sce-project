; ---------------------------------------------------------------------------
; Animation script - Chopper enemy
; ---------------------------------------------------------------------------
Ani_CabaretSonic:	offsetTable
		offsetTableEntry.w .wait
		offsetTableEntry.w .snap
.wait:		dc.b 15, 1, 2, 3, 2, afEnd
.snap:		dc.b 10, 4, 5, 6, 5, afEnd
		even