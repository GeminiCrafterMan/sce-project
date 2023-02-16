; ---------------------------------------------------------------------------
; Level order array
; ---------------------------------------------------------------------------
LevelOrder:
; Regular Levels
	; Green Hill Zone
		dc.b z_SSLZ, 0	; Act 1
		dc.b 0, 0		; Act 2
		dc.b 0, 0		; Act 3
		dc.b 0, 0		; Act 4

	; Seaside Land Zone
		dc.b z_SSLZ, 1	; Act 1
		dc.b z_SSLZ, 2	; Act 2
		dc.b z_WZ, 0	; Act 3
		dc.b 0, 0		; Act 4

	; Wood Zone
		dc.b 0, 0		; Act 1
		dc.b 0, 0		; Act 2
		dc.b 0, 0		; Act 3
		dc.b 0, 0		; Act 4

; Test Levels
	; Death Egg Zone
		dc.b z_DEZ, 1	; Act 1
		dc.b z_DEZ, 2	; Act 2
		dc.b z_DEZ, 3	; Act 3
		dc.b z_TTZ, 0	; Act 4

	; Techno Test Zone
		dc.b z_TTZ, 1	; Act 1
		dc.b z_TTZ, 2	; Act 2
		dc.b z_TTZ, 3	; Act 3
		dc.b 0, 0		; Act 4
	zonewarning	LevelOrder,(4*2)