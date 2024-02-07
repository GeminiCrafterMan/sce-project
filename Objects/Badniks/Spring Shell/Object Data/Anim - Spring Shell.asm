; ---------------------------------------------------------------------------
; Animation script - Spring Shell enemy
; ---------------------------------------------------------------------------
Ani_SpringShell:
		dc.w .stand-Ani_SpringShell
		dc.w .walk-Ani_SpringShell

.stand:		dc.b $F, 0, afEnd
		even
.walk:		dc.b 7,	0, 1, afEnd
		even
