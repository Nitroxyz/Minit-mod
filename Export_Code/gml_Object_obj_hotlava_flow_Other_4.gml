if (!fromsource)
{
    if (global.lava_cooled && MAP_MANAGER.map_current == "map3")
    {
        var ttt = instance_create(x, y, obj_wall2)
        ttt.uid = uid
        with (ttt)
            cut_this()
        instance_destroy()
    }
    else
    {
        if (!(position_meeting(x, (y + 16), obj_hotlava_flow)))
            sprite_index = spr_lavaflow_splashflow
        image_speed = 0.1
        iindex = y div 16
        iindex %= sprite_get_number(sprite_index)
        destroyontouch = 0
        water = 0
    }
}
