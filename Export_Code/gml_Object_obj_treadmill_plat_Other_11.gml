if (tread != self)
{
    var s = instance_place(x, (y - 1), obj_vacant_suit)
    var xt = approach(x, (start_x + abs(tread.energy) / tread.max_energy * (end_x - start_x)), 1)
    var yt = approach(y, (start_y + abs(tread.energy) / tread.max_energy * (end_y - start_y)), 1)
    if ((!(place_meeting(xt, yt, obj_wall))) && ((!(place_meeting(xt, yt, obj_vacant_suit))) || s != noone))
    {
        xprev = x
        yprev = y
        x = xt
        y = yt
    }
    else
        tread.energy = tread.energy_previous
}
if (angle == 0 || angle == 180)
{
    var s_amt = x - xprev
    if (s_amt != 0)
    {
        if (s != noone)
        {
            with (s)
            {
                if (!(position_meeting((x + s_amt + 9 * sign(s_amt)), (y - 3), obj_wall)))
                {
                    if (gunplat != self)
                        gunplat.x += s_amt
                    x += s_amt
                }
                else
                    state = 1
            }
        }
    }
    xprev = x
}
else
{
    s_amt = y - yprev
    if (s_amt != 0)
    {
        if (s != noone)
        {
            with (s)
            {
                if (gunplat != self)
                    gunplat.y += s_amt
                y += s_amt
            }
        }
    }
    yprev = y
}
if (x != xprevious || y != yprevious)
{
    if (!audio_is_playing(Elevator))
        audio_play_sound(Elevator, 100, false)
    animate_actor()
}
else
{
    if audio_is_playing(Elevator)
        audio_stop_sound(Elevator)
    iindex = 0
}
