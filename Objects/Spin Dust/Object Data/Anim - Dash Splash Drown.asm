Ani_DashSplashDrown: offsetTable
		offsetTableEntry.w .nothing
		offsetTableEntry.w .splash
		offsetTableEntry.w .spindash
		offsetTableEntry.w .skid
		offsetTableEntry.w .drown
		offsetTableEntry.w .skip
.nothing:	dc.b  $1F,   0,	afEnd
.splash:	dc.b	3,   1,	  2,   3,   4,	 5,   6,   7,	8,   9,	afChange,   0
.spindash:	dc.b	1,  $A,	 $B,  $C,  $D,	$E,  $F, $10, afEnd
.skid:	dc.b	3, $11,	$12, $13, $14, afRoutine
.drown:	dc.b	5, $16,	$17, $18, $19, $1A, $1B, $1C, $1D, afChange,	  0
.skip:	dc.b	3, $1E, $1F, $20, afChange, 0
	even