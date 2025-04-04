image_speed = 0.1
sprite_index = spr_fly
animate_actor()
if instance_exists(obj_player)
{
    image_xscale = sign(obj_player.x - x)
    if (try_to_align_timer > 0)
    {
        try_to_align_timer--
        y = approach(y, obj_player.y, 1)
        x = xstart + (sin((ystart - y) / 8)) * 4
        if (abs(obj_player.y - y) < 8)
            try_to_align_timer = 0
    }
    else
    {
        ychargestart = y
        hspd = (-image_xscale)
        state = 332
    }
}
