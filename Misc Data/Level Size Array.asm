; ===========================================================================
; Level Size Array
; ===========================================================================

;		xstart, xend, ystart, yend			; Level
LevelSizes:
		dc.w 0, $6D60, 0, $300				; GHZ 1
		dc.w 0, $3FFF, 0, $300				; GHZ 2
		dc.w 0, $3FFF, 0, $300				; GHZ 3
		dc.w 0, $3FFF, 0, $300				; GHZ 4

		dc.w 0, $29A0, 0, $320				; SSLZ 1
		dc.w 0, $29A0, 0, $C00				; SSLZ 2
		dc.w 0, $29A0, 0, $320				; SSLZ 3
		dc.w 0, $29A0, 0, $320				; SSLZ 4

		dc.w 0, $3FFF, 0, $800				; TTPZ 1
		dc.w 0, $3FFF, 0, $800				; TTPZ 2
		dc.w 0, $3FFF, 0, $800				; TTPZ 3
		dc.w 0, $3FFF, 0, $800				; TTPZ 4

		dc.w 0, $4300, 0, $AA0				; MMZ 1
		dc.w 0, $4300, 0, $AA0				; MMZ 2
		dc.w 0, $4300, 0, $AA0				; MMZ 3
		dc.w 0, $4300, 0, $AA0				; MMZ 4

		dc.w 0, $A20, 0, $4A0				; DEZ 1
		dc.w 0, $A20, 0, $4A0				; DEZ 2
		dc.w 0, $A20, 0, $4A0				; DEZ 3
		dc.w 0, $A20, 0, $4A0				; DEZ 4

		dc.w 0, $3FFF, 0, $800				; TTSZ 1
		dc.w 0, $19BF, 0, $530				; TTSZ 2
		dc.w 0, $10AF, 0, $720				; TTSZ 3
		dc.w 0, $202F, -$100, $800			; TTSZ 4

		zonewarning LevelSizes,(8*4)