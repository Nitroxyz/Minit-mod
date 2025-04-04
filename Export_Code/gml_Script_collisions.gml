var hspd_r = abs(round(hspd))
var vspd_r = abs(round(vspd))
if place_meeting((x + hspd), y, obj_wall)
{
    repeat hspd_r
    {
        if (!(place_meeting((x + sign(hspd)), y, obj_wall)))
            x += sign(hspd)
        else if (!(place_meeting((x + sign(hspd)), (y - 1), obj_wall)))
        {
            x += sign(hspd)
            y--
            hspd -= (sign(hspd) * 0.01)
        }
        else if (!(place_meeting((x + sign(hspd)), (y - 2), obj_wall)))
        {
            x += sign(hspd)
            y -= 2
            hspd = lerp(hspd, 0, 0.05)
        }
        else
            hspd = 0
    }
}
else
    x += hspd
if (vspd != 0 && place_meeting(x, (y + vspd), obj_wall))
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
    {
        y += sign(vspd)
        grounded = 0
    }
    if (vspd >= 0)
    {
        vspd = 0
        grounded = 1
    }
}
else
    y += vspd
