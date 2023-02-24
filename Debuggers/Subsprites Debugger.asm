SubspritesDebugger:

    lea id(a0),a1
    Console.Write "Id: %<.l (a1) sym> "
    Console.BreakLine

    Console.WriteLine "Subsprite Data:"

    lea mainspr_childsprites(a0),a1
    Console.WriteLine "Subsprite Amount: %<.b (a1) dec>"

    lea sub2_x_pos(a0),a1
    move.w  mainspr_childsprites(a0),d0
.subsprloop:
    Console.Write "X: $%<.w (a1) hex> "
    lea 2(a1),a1
    Console.Write "Y: $%<.w (a1) hex> "
    lea 2(a1),a1
    Console.Write "Frame: $%<.w (a1) hex> "
    lea 2(a1),a1
    Console.BreakLine
    dbf d0,.subsprloop
    rts