; ---------------------------------------------------------------------------
; Music metadata (pointers, speed shoes tempos, flags)
; ---------------------------------------------------------------------------
MusicIndex:
; Levels
ptr_mus_ghz:		SMPS_MUSIC_METADATA	Music_GHZ, 8, 0						; GHZ
ptr_mus_elec:		SMPS_MUSIC_METADATA Music_Elec, 8, 0					; NTHZ
ptr_mus_dis:		SMPS_MUSIC_METADATA Music_DiS, 8, 0						; SSLZ
ptr_mus_mcz2p:		SMPS_MUSIC_METADATA Music_MCZ2P, 8, 0					; TTPZ
ptr_mus_mhz1:		SMPS_MUSIC_METADATA Music_MHZ1, s3tempotoS1($FF), 0		; MMZ1
ptr_mus_mhz2:		SMPS_MUSIC_METADATA Music_MHZ2, s3tempotoS1($FF), 0		; MMZ2
ptr_mus_dez1:		SMPS_MUSIC_METADATA	Music_DEZ1, s3TempotoS1($FF), 0		; DEZ 1
ptr_mus_tffz:		SMPS_MUSIC_METADATA Music_TFFZ, s3TempotoS1($FF), 0		; TTZ
ptr_mus_lz:			SMPS_MUSIC_METADATA	Music_LZ, 8, 0						; TTZ2-4?

; Boss
ptr_mus_boss:		SMPS_MUSIC_METADATA	Music_Boss, s3TempotoS1($FF), 0		; Boss
ptr_mus_boss2:		SMPS_MUSIC_METADATA	Music_Boss2, s3TempotoS1($FF), 0	; Boss 2
ptr_mus_metalsquad:	SMPS_MUSIC_METADATA Music_MetalSquad, 8, 0

; Misc
ptr_mus_invin:		SMPS_MUSIC_METADATA	Music_Invin, 8, 0					; Invincible
ptr_mus_s3invin:	SMPS_MUSIC_METADATA Music_S3Invin, s3TempotoS1($FF), 0	; Super Sonic
ptr_mus_skinvin:	SMPS_MUSIC_METADATA Music_SKInvin, s3TempotoS1($FF), 0	; Hyper Sonic
ptr_mus_through:	SMPS_MUSIC_METADATA	Music_Through, s3TempotoS1($FF), 0	; End of Act
ptr_mus_drowning:	SMPS_MUSIC_METADATA	Music_Drowning, s3TempotoS1($02), SMPS_MUSIC_METADATA_FORCE_PAL_SPEED	; Drowning
ptr_mus_title:		SMPS_MUSIC_METADATA Music_Title, 8, 0					; Title Screen

; Songs I grabbed from sce-minihack
ptr_mus_brokenmoon:	SMPS_MUSIC_METADATA Music_BrokenMoon, 8, 0				; Broken Moon
ptr_mus_deepcode:	SMPS_MUSIC_METADATA	Music_DeepCode, 8, 0				; Deep Into the Code
ptr_mus_saweddemon:	SMPS_MUSIC_METADATA	Music_SawedDemon, 8, 0				; I Sawed the Demons
ptr_mus_interdoom:	SMPS_MUSIC_METADATA	Music_InterDoom, 8, 0				; Intermission from Doom
ptr_mus_untitled:	SMPS_MUSIC_METADATA	Music_Untitled, 8, 0				; Untitled

ptr_musend

; ---------------------------------------------------------------------------
; Music data ($01-$3F)
; ---------------------------------------------------------------------------

Music_GHZ:			include "Sound/Music/Mus - GHZ.asm"
	even
Music_Elec:			include "Sound/Music/Mus - Electoria.asm"
	even
Music_DiS:			include	"Sound/Music/Mus - Door Into Summer.asm"
	even
Music_MCZ2P:		include	"Sound/Music/Mus - MCZ2P.asm"
	even
Music_MHZ1:			include	"Sound/Music/Mus - MHZ1.asm"
	even
Music_MHZ2:			include	"Sound/Music/Mus - MHZ2.asm"
	even
Music_DEZ1:			include "Sound/Music/Mus - DEZ1.asm"
	even
Music_TFFZ:			include "Sound/Music/Mus - The Final Fight.asm"
	even
Music_LZ:			include "Sound/Music/Mus - LZ.asm"
	even
Music_Boss:			include "Sound/Music/Mus - Miniboss.asm"
	even
Music_Boss2:		include "Sound/Music/Mus - Zone Boss.asm"
	even
Music_MetalSquad:	include	"Sound/Music/Mus - Metal Squad.asm"
	even
Music_Invin:		include "Sound/Music/Mus - Invincibility.asm"
	even
Music_S3Invin:		include	"Sound/Music/Mus - S3 Invincibility.asm"
	even
Music_SKInvin:		include	"Sound/Music/Mus - SK Invincibility.asm"
	even
Music_Through: 		include "Sound/Music/Mus - Sonic Got Through.asm"
	even
Music_Drowning:		include "Sound/Music/Mus - Drowning.asm"
	even
Music_Title:		include	"Sound/Music/Mus - Title Screen.asm"
	even

Music_BrokenMoon:	include "Sound/Music/Mus - Broken Moon.asm"
	even
Music_DeepCode:	include "Sound/Music/Mus - Deep Into the Code.asm"
	even
Music_SawedDemon:	include "Sound/Music/Mus - I Sawed the Demons.asm"
	even
Music_InterDoom:	include "Sound/Music/Mus - Intermission from Doom.asm"
	even
Music_Untitled:	include "Sound/Music/Mus - Untitled.asm"
	even