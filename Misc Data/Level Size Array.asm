; ===========================================================================
; Level Size Array
; ===========================================================================

;		xstart, xend, ystart, yend			; Level
LevelSizes:
		dc.w 0, $A20, 0, $4A0				; DEZ 1
		dc.w 0, $A20, 0, $4A0				; DEZ 2
		dc.w 0, $A20, 0, $4A0				; DEZ 3
		dc.w 0, $A20, 0, $4A0				; DEZ 4

		dc.w 0, $6D60, 0, $300				; GHZ 1	; acts 1 and 2 combined directly
		dc.w 0, $3FFF, 0, $300				; GHZ 2	; old act 3
		dc.w 0, $3FFF, 0, $300				; GHZ 3
		dc.w 0, $3FFF, 0, $300				; GHZ 4

		dc.w 0, $29A0, 0, $320				; SSLZ 1
		dc.w 0, $29A0, 0, $320				; SSLZ 2
		dc.w 0, $29A0, 0, $320				; SSLZ 3
		dc.w 0, $29A0, 0, $320				; SSLZ 4

		dc.w 0, $3FFF, 0, $800				; WZ 1
		dc.w 0, $3FFF, 0, $800				; WZ 2
		dc.w 0, $3FFF, 0, $800				; WZ 3
		dc.w 0, $3FFF, 0, $800				; WZ 4

		zonewarning LevelSizes,(8*4)