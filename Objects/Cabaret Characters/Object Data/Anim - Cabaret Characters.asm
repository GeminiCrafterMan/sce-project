; ---------------------------------------------------------------------------
; Animation script - Cabaret characters
; ---------------------------------------------------------------------------
Ani_CabaretChars:	offsetTable
		offsetTableEntry.w .sonicWait
		offsetTableEntry.w .sonicSnap
		offsetTableEntry.w .tailsSleep
		offsetTableEntry.w .knuxWait
		offsetTableEntry.w .knuxBoxing
		offsetTableEntry.w .mightyWait
		offsetTableEntry.w .mightyTapping
.sonicWait:		dc.b 15, 1, 2, 3, 2, afEnd
.sonicSnap:		dc.b 10, 4, 5, 6, 5, afEnd
.tailsSleep:	dc.b 31, 7, 8, afEnd
.knuxWait:		dc.b 23, 9, 10, afEnd
.knuxBoxing:	dc.b 5, 11, 12, 13, 14, 15, afBack, 4
.mightyWait:	dc.b 8, 16, 17, 18, 17, afEnd
.mightyTapping:	dc.b 5, 19, 20, 21, 20, afEnd
		even