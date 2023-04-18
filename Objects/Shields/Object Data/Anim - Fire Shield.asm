Ani_FireShield: offsetTable
		offsetTableEntry.w .normal
		offsetTableEntry.w .airdash
		offsetTableEntry.w .dropdash
.normal:	dc.b	1,   0,	 $F,   1, $10,	 2, $11,   3, $12,   4,	$13,   5, $14,	 6, $15,   7, $16,   8,	$17, afEnd
.airdash:	dc.b	1,   9,	 $A,  $B,  $C,	$D,  $E,   9,  $A,  $B,	 $C,  $D,  $E, afChange, 0
.dropdash:	dc.b	1
		rept 2
			dc.b	$19, $19, $1A, $1A
		endr
			dc.b	$19, $1A, afBack, 2
	even
