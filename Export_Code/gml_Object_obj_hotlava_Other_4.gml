if (global.lava_cooled && MAP_MANAGER.map_current == "map3")
{
    var ttt = instance_create(x, y, obj_wall2)
    ttt.uid = uid
    with (ttt)
    {
        if place_meeting(x, y, obj_player)
        {
            c_destroy = 1
            instance_destroy()
        }
        else
            cut_this()
    }
    instance_destroy()
}
else
{
    if (!(place_meeting(x, (y - 1), obj_hotlava)))
        sprite_index = spr_hotlava_top
    else
        sprite_index = spr_hotlava_fill
    image_speed = 0.1
    iindex = x div 16
    iindex %= sprite_get_number(sprite_index)
    destroyontouch = 0
    water = 0
}
