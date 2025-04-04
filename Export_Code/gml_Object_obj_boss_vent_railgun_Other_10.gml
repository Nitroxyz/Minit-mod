if (!active)
{
    sprite_index = spr_warning
    iindex = 0
    if (timer > 0)
        timer--
    else
    {
        timer = 20
        active = 1
    }
}
else
{
    for (var i = 0; i < tile_dist; i++)
    {
        var ldx = lengthdir_x((i * 16), direction)
        var ldy = lengthdir_y((i * 16), direction)
        var _o = instance_create((x + ldx), (y + ldy), obj_railgun_bullet)
    }
    instance_destroy()
}
