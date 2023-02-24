ObjectDebugger:
    Console.WriteLine "Object Data:"
    lea id(a0),a1
    Console.Write "Id: %<.l (a1) sym> "
    lea routine(a0),a1
    Console.Write "Routine: $%<.b (a1) hex> "
    Console.BreakLine

    lea mappings(a0),a1
    Console.Write "Mappings: %<.l (a1) sym> "
    Console.BreakLine
    
    lea mapping_frame(a0),a1
    Console.Write "MapFrame: $%<.b (a1) hex>"

    rts