; ---------------------------------------------------------------------------
; Animation script - Cabaret characters
; ---------------------------------------------------------------------------
Ani_CabaretSonic:	offsetTable
		offsetTableEntry.w .sonicWait
		offsetTableEntry.w .sonicSnap
		offsetTableEntry.w .tailsSleep
.sonicWait:		dc.b 15, 1, 2, 3, 2, afEnd
.sonicSnap:		dc.b 10, 4, 5, 6, 5, afEnd
.tailsSleep:	dc.b 31, 7, 8, afEnd
		even