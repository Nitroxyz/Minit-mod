while (image_angle < 0)
    image_angle += 360
while (image_angle >= 360)
    image_angle -= 360
tp.angle = image_angle
if (cos(degtorad(image_angle)) == -1)
    tp.rodoffset_x = 64
if instance_exists(obj_tplat_end)
{
    with (obj_tplat_end)
    {
        if (point_direction(other.x, other.y, x, y) == other.image_angle)
        {
            if (other.master == self)
                other.master = id
            else if (point_distance(other.x, other.y, x, y) < point_distance(other.x, other.y, other.master.x, other.master.y))
                other.master = id
        }
    }
    if (master != self)
    {
        tp.master = master
        tp.end_x = master.x
        tp.end_y = master.y
    }
    else
    {
        tp.end_x = x
        tp.end_y = y
    }
}
else
{
    tp.end_x = x
    tp.end_y = y
}
if (tp.x == tp.end_x)
    tp.rodcount = 1 + (abs(tp.end_y - tp.start_y)) / 16
else
    tp.rodcount = 5 + (abs(tp.end_x - tp.start_x)) / 16
with (tp)
{
    if (master != self && instance_exists(obj_treadmill_locker))
    {
        tread = instance_nearest(master.x, master.y, obj_treadmill_locker)
        tread.plat = id
        tread.max_energy = max(abs(x - end_x), abs(y - end_y))
    }
}
