if (x != (room_width / 2) || y != (room_height / 2))
{
    sprite_index = spr_gary_levitate
    iindex = 1
    x = approach(x, (room_width / 2), walk_spd)
    y = approach(y, (room_height / 2), jump_height)
}
else if (!instance_exists(obj_gary_lazer_fx))
    instance_create(x, y, obj_gary_lazer_fx)
