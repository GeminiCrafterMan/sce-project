; ---------------------------------------------------------------------------
; Level order array
; ---------------------------------------------------------------------------
LevelOrder:
; Regular Levels
	; Intro Stages
		dc.b z_SSLZ, 0	; Green Hill
		dc.b z_SSLZ, 0	; Techno Tower
		dc.b 0, 0		; Act 3
		dc.b 0, 0		; Green Hill EX

	; Seaside Land Zone
		dc.b z_SSLZ, 1	; Act 1
		dc.b z_SSLZ, 2	; Act 2
		dc.b z_TTPZ, 0	; Act 3
		dc.b 0, 0		; Act 4

	; Tree Top Zone
		dc.b z_TTPZ, 1	; Act 1
		dc.b z_CCZ,  0	; Act 2
		dc.b 0, 0		; Act 3
		dc.b 0, 0		; Act 4

	; Clockwork Castle Zone
		dc.b 0, 0		; Act 1
		dc.b 0, 0		; Act 2
		dc.b 0, 0		; Act 3
		dc.b 0, 0		; Act 4

	; Mecha Mushroom Zone
		dc.b 0, 0		; Act 1
		dc.b 0, 0		; Act 2
		dc.b 0, 0		; Act 3
		dc.b 0, 0		; Act 4

; Test Levels
	; Death Egg Zone
		dc.b z_DEZ, 1	; Act 1
		dc.b z_DEZ, 2	; Act 2
		dc.b z_DEZ, 3	; Act 3
		dc.b z_TTSZ, 0	; Act 4

	; Techno Test Zone
		dc.b z_TTSZ, 1	; Act 1
		dc.b z_TTSZ, 2	; Act 2
		dc.b z_TTSZ, 3	; Act 3
		dc.b 0, 0		; Act 4
	zonewarning	LevelOrder,(4*2)