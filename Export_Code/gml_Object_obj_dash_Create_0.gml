if instance_exists(obj_player)
{
    if (obj_player.facing == 1)
        image_xscale = 1
    else
        image_xscale = -1
    image_speed = 0.5
}
else
    instance_destroy()
iindex = 0
image_speed = 0.4
