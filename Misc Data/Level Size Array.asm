; ===========================================================================
; Level Size Array
; ===========================================================================

;		xstart, xend, ystart, yend			; Level
LevelSizes:
		dc.w 0, $4F60, 0, $680-$E0			; Green Hill
		dc.w 0, $0A00, 0, $F00				; Techno Tower
		dc.w 0, $6D60, 0, $300				; GHZ EX
		dc.w 0, $3CC0, 0, $F00				; Techno Tower EX

		dc.w 0, $2200-$240, 0, $320				; SSLZ 1
		dc.w 0, $29A0, 0, $C00				; SSLZ 2
		dc.w 0, $29A0, 0, $320				; SSLZ 3
		dc.w 0, $29A0, 0, $320				; SSLZ 4

		dc.w 0, $3FFF, 0, $800				; TTPZ 1
		dc.w 0, $3FFF, 0, $800				; TTPZ 2
		dc.w 0, $3FFF, 0, $800				; TTPZ 3
		dc.w 0, $3FFF, 0, $800				; TTPZ 4

		dc.w 0, $3FFF, 0, $800				; CCZ 1
		dc.w 0, $3FFF, 0, $800				; CCZ 2
		dc.w 0, $3FFF, 0, $800				; CCZ 3
		dc.w 0, $3FFF, 0, $800				; CCZ 4

		dc.w 0, $4300, 0, $AA0				; MMZ 1
		dc.w $98,$3C90,0, $9A0				; MMZ 2
		dc.w 0, $4300, 0, $AA0				; MMZ 3
		dc.w 0, $4300, 0, $AA0				; MMZ 4

		dc.w 0, $0DA8, 0, $800				; SS 1
		dc.w 0, $3FFF, 0, $800				; SS 2
		dc.w 0, $3FFF, 0, $800				; SS 3
		dc.w 0, $3FFF, 0, $800				; SS 4

		dc.w 0, $3FFF, 0, $800				; TTSZ 1
		dc.w 0, $19BF, 0, $530				; TTSZ 2
		dc.w 0, $10AF, 0, $720				; TTSZ 3
		dc.w 0, $202F, -$100, $800			; TTSZ 4

		zonewarning LevelSizes,(8*4)
