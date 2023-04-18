Ani_DoubleShield: offsetTable
		offsetTableEntry.w .shield
		offsetTableEntry.w .ring1
		offsetTableEntry.w .ring2
.shield:
		dc.b    0
		dc.b	1,  2, 1,  3, 1,  4, 1,  5, 1,  6, 1,  7, 1,  8, 1,  9, 1, 10, 1, 11
		dc.b	1, 12, 1, 13, 1, 14, 1, 15, 1, 16, 1, 17, 1, 18, 1, 19, 1, 20, 1, 21
		dc.b	afEnd
	even
.ring1:
		dc.b	1
		dc.b	22, 23, 24, 25, 26, 27, 28
		dc.b	29, 30, 31, 32, 33, 34, 35
		dc.b	afEnd
	even
.ring2:
		dc.b	1
		dc.b	29, 30, 31, 32, 33, 34, 35
		dc.b	22, 23, 24, 25, 26, 27, 28
		dc.b	afEnd
	even