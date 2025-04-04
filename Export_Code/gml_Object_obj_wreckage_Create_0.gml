event_inherited()
depth = -10
inst = self
ytar = y
ytemp = y
state = 0
playertarget_x = x + 168
if (get_room_state() != 0)
{
    var instcur = 0
    for (instcur = 0; instcur < 19; instcur++)
    {
        inst[instcur] = instance_create((x + instcur * 16), y, obj_wreckage_rubble)
        inst[instcur].depth = depth - 1
    }
    momentum = 2
    y -= sprite_height
    ytemp = y
}
else if global.decoder_discovered
{
    sprite_index = spr_wreckage_broken
    if obj_player.grounded
        state = 1
    else
        state = 2
}
