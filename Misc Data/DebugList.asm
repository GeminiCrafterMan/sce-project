; ===========================================================================
; Debug mode item lists
; ===========================================================================

DebugList: offsetTable
		offsetTableEntry.w .DEZ1
		offsetTableEntry.w .DEZ1
		offsetTableEntry.w .DEZ1
		offsetTableEntry.w .DEZ1

		offsetTableEntry.w .GHZ1
		offsetTableEntry.w .GHZ1
		offsetTableEntry.w .GHZ1
		offsetTableEntry.w .GHZ1

		zonewarning DebugList,(2*4)
; ---------------------------------------------------------------------------

				; Object Mappings Subtype Frame VRAM
.DEZ1: dbglistheader
	dbglistobj Obj_Ring, Map_Ring, 0, 0, make_art_tile(ArtTile_Ring,1,1)
	dbglistobj Obj_Monitor, Map_Monitor, 2, 3, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 3, 4, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 4, 5, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 5, 6, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 6, 7, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 7, 8, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 8, 9, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 9, 10, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_PathSwap, Map_PathSwap, 9, 1, make_art_tile(ArtTile_Ring,1,0)
	dbglistobj Obj_PathSwap, Map_PathSwap, $D, 5, make_art_tile(ArtTile_Ring,1,0)
	dbglistobj Obj_Spring, Map_Spring, $81, 0, make_art_tile($494,0,0)
	dbglistobj Obj_Spring, Map_Spring2, $82, 0, make_art_tile($494,0,0)
	dbglistobj Obj_Spring, Map_Spring, $90, 3, make_art_tile($4A0,0,0)
	dbglistobj Obj_Spring, Map_Spring2, $92, 3, make_art_tile($4A0,0,0)
	dbglistobj Obj_Spring, Map_Spring, $A0, 6, make_art_tile($494,0,0)
	dbglistobj Obj_Spring, Map_Spring2, $A2, 6, make_art_tile($494,0,0)
	dbglistobj Obj_Spikes, Map_Spikes, 0, 0, make_art_tile(ArtTile_SpikesSprings+8,0,0)
	dbglistobj Obj_Spikes, Map_Spikes, $40, 4, make_art_tile(ArtTile_SpikesSprings,0,0)
	dbglistobj Obj_Spikebonker, Map_Spikebonker, $40, 0, make_art_tile($100,0,1)
	dbglistobj Obj_Button,	Map_Button, 0, 2, make_art_tile($47E,0,0)
	dbglistobj Obj_StarPost, Map_StarPost, 1, 0, make_art_tile(ArtTile_StarPost+8,0,0)
	dbglistobj Obj_EggCapsule, Map_EggCapsule, 1, 0, make_art_tile($43E,0,0)
.DEZ1_End

.GHZ1: dbglistheader
	dbglistobj Obj_Ring, Map_Ring, 0, 0, make_art_tile(ArtTile_Ring,1,1)
	dbglistobj Obj_Monitor, Map_Monitor, 2, 3, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 3, 4, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 4, 5, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 5, 6, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 6, 7, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 7, 8, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 8, 9, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_Monitor, Map_Monitor, 9, 10, make_art_tile(ArtTile_Monitors,0,0)
	dbglistobj Obj_PathSwap, Map_PathSwap, 9, 1, make_art_tile(ArtTile_Ring,1,0)
	dbglistobj Obj_PathSwap, Map_PathSwap, $D, 5, make_art_tile(ArtTile_Ring,1,0)
	dbglistobj Obj_Spring, Map_Spring, $81, 0, make_art_tile($494,0,0)
	dbglistobj Obj_Spring, Map_Spring2, $82, 0, make_art_tile($494,0,0)
	dbglistobj Obj_Spring, Map_Spring, $90, 3, make_art_tile($4A0,0,0)
	dbglistobj Obj_Spring, Map_Spring2, $92, 3, make_art_tile($4A0,0,0)
	dbglistobj Obj_Spring, Map_Spring, $A0, 6, make_art_tile($494,0,0)
	dbglistobj Obj_Spring, Map_Spring2, $A2, 6, make_art_tile($494,0,0)
	dbglistobj Obj_Spikes, Map_Spikes, 0, 0, make_art_tile(ArtTile_SpikesSprings+8,0,0)
	dbglistobj Obj_Spikes, Map_Spikes, $40, 4, make_art_tile(ArtTile_SpikesSprings,0,0)
	dbglistobj Obj_Crabmeat, Map_Crabmeat, 0, 0, make_art_tile($400,0,0)
	dbglistobj Obj_BuzzBomber, Map_BuzzBomber, 0, 0, make_art_tile($444,0,0)
	dbglistobj Obj_Chopper, Map_Chopper, 0, 0, make_art_tile($4E8,0,0)
	dbglistobj Obj_Motobug, Map_Motobug, 0, 0, make_art_tile($508,0,0)
	dbglistobj Obj_Button,	Map_Button, 0, 2, make_art_tile($47E,0,0)
	dbglistobj Obj_StarPost, Map_StarPost, 1, 0, make_art_tile(ArtTile_StarPost+8,0,0)
	dbglistobj Obj_EggCapsule, Map_EggCapsule, 1, 0, make_art_tile($43E,0,0)
.GHZ1_End