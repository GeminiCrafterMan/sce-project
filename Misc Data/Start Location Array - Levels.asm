; ===========================================================================
; Sonic start location array
; ===========================================================================

StartLocArray:
	; Intro Stages
		binclude "Levels/Intro Stages/Green Hill/Start Location/1.bin"	; Green Hill
		binclude "Levels/Intro Stages/Techno Tower/Start Location/1.bin"; Techno Tower
		binclude "Levels/Intro Stages/Green Hill/Start Location/1.bin"	; ?
		binclude "Levels/Intro Stages/Green Hill/Start Location/EX.bin"	; Green Hill

		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 1
		binclude "Levels/SSLZ/Start Location/2.bin"	; SSLZ 2
		binclude "Levels/SSLZ/Start Location/3.bin"	; SSLZ 3
		binclude "Levels/SSLZ/Start Location/1.bin"	; SSLZ 4

		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 1
		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 2
		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 3
		binclude "Levels/TTPZ/Start Location/1.bin"	; TTPZ 4

		binclude "Levels/CCZ/Start Location/1.bin"	; CCZ 1
		binclude "Levels/CCZ/Start Location/1.bin"	; CCZ 2
		binclude "Levels/CCZ/Start Location/1.bin"	; CCZ 3
		binclude "Levels/CCZ/Start Location/1.bin"	; CCZ 4

		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 1
		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 2
		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 3
		binclude "Levels/MMZ/Start Location/1.bin"	; MMZ 4

		binclude "Levels/Secret Stages/Start Location/1.bin"	; SS 1
		binclude "Levels/Secret Stages/Start Location/2.bin"	; SS 2
		binclude "Levels/Secret Stages/Start Location/3.bin"	; SS 3
		binclude "Levels/Secret Stages/Start Location/4.bin"	; SS 4

		binclude "Levels/TTSZ/Start Location/1.bin"	; TTSZ 1
		binclude "Levels/TTSZ/Start Location/2.bin"	; TTSZ 2
		binclude "Levels/TTSZ/Start Location/3.bin"	; TTSZ 3
		binclude "Levels/TTSZ/Start Location/4.bin"	; TTSZ 4

		zonewarning StartLocArray,(4*4)
