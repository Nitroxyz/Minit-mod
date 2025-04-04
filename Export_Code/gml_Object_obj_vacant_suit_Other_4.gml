with (obj_crate)
{
    if (point_distance(x, y, other.x, other.y) < 64)
    {
        if (y < other.bbox_bottom)
        {
            c_destroy = 1
            instance_destroy()
        }
    }
    else
        state = 1
}
while place_meeting(x, y, obj_wall2)
{
    with (instance_place(x, y, obj_wall2))
    {
        if (y < other.bbox_bottom)
        {
            c_destroy = 1
            instance_destroy()
        }
        else
            other.y--
    }
}
