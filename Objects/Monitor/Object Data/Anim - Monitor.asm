Ani_Monitor: offsetTable
		offsetTableEntry.w .static
		offsetTableEntry.w .1up
		offsetTableEntry.w .eggman
		offsetTableEntry.w .rings
		offsetTableEntry.w .shoes
		offsetTableEntry.w .fireshield
		offsetTableEntry.w .lightningshield
		offsetTableEntry.w .bubbleshield
		offsetTableEntry.w .invincibility
		offsetTableEntry.w .super
		offsetTableEntry.w .hyper
		offsetTableEntry.w .broken
.static:	dc.b	1,   0,	  1, afEnd
.1up:	dc.b	1,   0,	  2,   2,   1,	 2,   2, afEnd
.eggman:	dc.b	1,   0,	  3,   3,   1,	 3,   3, afEnd
.rings:	dc.b	1,   0,	  4,   4,   1,	 4,   4, afEnd
.shoes:	dc.b	1,   0,	  5,   5,   1,	 5,   5, afEnd
.fireshield:	dc.b	1,   0,	  6,   6,   1,	 6,   6, afEnd
.lightningshield:	dc.b	1,   0,	  7,   7,   1,	 7,   7, afEnd
.bubbleshield:	dc.b	1,   0,	  8,   8,   1,	 8,   8, afEnd
.invincibility:	dc.b	1,   0,	  9,   9,   1,	 9,   9, afEnd
.super:	dc.b	1,   0,	 $A,  $A,   1,	$A,  $A, afEnd
.hyper:	dc.b	1,   0,	 $B,  $B,   1,	$B,  $B, afEnd
.broken:	dc.b	2,   0,	  1,  $C, afBack,	 1
	even