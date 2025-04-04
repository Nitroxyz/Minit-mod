animate_actor()
if (dir == 0)
    dir = dir_o
else if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (!(place_meeting((x + other.dir), y, obj_wall)))
            x += other.dir
        if (dashing > 2)
            dashing = 2
    }
    if (t_l != self)
        t_l.dir = 0
    if (t_r != self)
        t_r.dir = 0
}
