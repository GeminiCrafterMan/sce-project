; ---------------------------------------------------------------------------
; Animation script - Cabaret characters
; ---------------------------------------------------------------------------
Ani_CabaretSonic:	offsetTable
		offsetTableEntry.w .sonicWait
		offsetTableEntry.w .sonicSnap
		offsetTableEntry.w .tailsWait
		offsetTableEntry.w .tailsWave
.sonicWait:		dc.b 15, 1, 2, 3, 2, afEnd
.sonicSnap:		dc.b 10, 4, 5, 6, 5, afEnd
.tailsWait:		dc.b 15, 7, 8, afEnd
.tailsWave:		dc.b 21, 9, 10, afEnd
		even