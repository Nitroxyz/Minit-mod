if (image_angle == 0 || image_angle == 180)
{
    var low_temp = instance_position(x, (y + 10), obj_door1_U)
    if (low_temp != -4)
        lower = low_temp
    else
    {
        lower = -1
        master = 1
    }
    var hi_temp = instance_position(x, (y - 10), obj_door1_U)
    if (hi_temp != -4)
        upper = hi_temp
    else
        upper = -1
}
else
{
    image_angle = 90
    image_xscale = 1
    image_yscale = 1
    low_temp = instance_position((x + 10), y, obj_door1_U)
    if (low_temp != -4)
        lower = low_temp
    else
    {
        lower = -1
        master = 1
    }
    hi_temp = instance_position((x - 10), y, obj_door1_U)
    if (hi_temp != -4)
        upper = hi_temp
    else
        upper = -1
}
