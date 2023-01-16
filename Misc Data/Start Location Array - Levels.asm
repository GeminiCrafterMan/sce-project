; ===========================================================================
; Sonic start location array
; ===========================================================================

StartLocArray:
		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 1
		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 2
		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 3
		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 4

		binclude "Levels/GHZ/Start Location/1.bin"	; GHZ 1
		binclude "Levels/GHZ/Start Location/2.bin"	; GHZ 2
		binclude "Levels/GHZ/Start Location/3.bin"	; GHZ 3
		binclude "Levels/GHZ/Start Location/1.bin"	; GHZ 4

		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 1
		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 2
		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 3
		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 4

		zonewarning StartLocArray,(4*4)