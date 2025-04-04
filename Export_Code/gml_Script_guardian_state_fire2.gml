if (floor(iindex) != 4)
    animate_actor()
if (timer > 0)
{
    timer--
    if (timer == 5 && bulletcount > 0)
        iindex = 5
    if instance_exists(obj_player)
    {
        if (obj_player.x > xstart)
        {
            if (x > (xstart - 80))
                hspd = approach(hspd, (-hspd_tar), 0.25)
            else if (x < (xstart - 95))
                hspd = approach(hspd, hspd_tar, 0.25)
        }
        else if (x > obj_player.x)
        {
            if (x < (xstart + 80))
                hspd = approach(hspd, hspd_tar, 0.25)
            else if (x > (xstart + 95))
                hspd = approach(hspd, (-hspd_tar), 0.25)
        }
    }
}
else if (bulletcount > 0)
{
    if (hp < 40)
        timer = 70
    else
        timer = 100
    var bullet = instance_create(x, (y + 24), obj_guardian_rocket)
    bulletcount--
}
else if (floor(iindex) == 4)
{
    if (hp < 40)
        timer = 150
    else
        timer = 200
    state = 457
    hp_lost_since_last_rocket = 0
}
if place_meeting((x + hspd + sign(hspd) * 2), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd) + sign(hspd) * 2), y, obj_wall)))
        x += sign(hspd)
    repeat abs(hspd)
        instance_create((x + sign(hspd) * 24), (y - 4 + irandom(24)), obj_dust_cloud_land)
    hspd = (-hspd) * 0.5
}
x += hspd
