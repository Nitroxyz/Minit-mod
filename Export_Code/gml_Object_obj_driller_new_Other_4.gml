if (!global.lava_cooled)
{
    if place_meeting(x, y, obj_hotlava)
        instance_destroy()
}
else
{
    for (var xcur = x - 10; xcur < (x + 11); xcur += 10)
    {
        for (var ycur = y - 10; ycur < (y + 1); ycur += 10)
        {
            var inst = instance_position(xcur, ycur, obj_hotlava)
            if (inst != noone)
            {
                inst.c_destroy = 1
                with (inst)
                    instance_destroy()
            }
            else
            {
                inst = instance_position(xcur, ycur, obj_wall2)
                if (inst != noone)
                {
                    inst.c_destroy = 1
                    with (inst)
                        instance_destroy()
                }
            }
        }
    }
}
if (place_meeting(x, y, obj_wall) && (!(place_meeting(x, (y - 3), obj_wall))))
{
    repeat (3)
    {
        if place_meeting(x, y, obj_wall)
            y--
    }
}
