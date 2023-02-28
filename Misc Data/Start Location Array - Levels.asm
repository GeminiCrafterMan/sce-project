; ===========================================================================
; Sonic start location array
; ===========================================================================

StartLocArray:
		binclude "Levels/GHZ/Start Location/1.bin"	; GHZ 1
		binclude "Levels/GHZ/Start Location/2.bin"	; GHZ 2
		binclude "Levels/GHZ/Start Location/1.bin"	; GHZ 3
		binclude "Levels/GHZ/Start Location/1.bin"	; GHZ 4

		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 1
		binclude "Levels/SSLZ/Start Location/2.bin"	; SSLZ 2
		binclude "Levels/SSLZ/Start Location/3.bin"	; SSLZ 3
		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 4

		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 1
		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 2
		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 3
		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 4

		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 1
		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 2
		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 3
		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 4

		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 1
		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 2
		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 3
		binclude "Levels/DEZ/Start Location/1.bin"	; DEZ 4

		binclude "Levels/TTSZ/Start Location/1.bin"	; TTSZ 1
		binclude "Levels/TTSZ/Start Location/2.bin"	; TTSZ 2
		binclude "Levels/TTSZ/Start Location/3.bin"	; TTSZ 3
		binclude "Levels/TTSZ/Start Location/4.bin"	; TTSZ 4

		zonewarning StartLocArray,(4*4)
