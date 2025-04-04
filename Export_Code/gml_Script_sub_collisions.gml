var hspd_r = abs(round(hspd))
var vspd_r = abs(round(vspd))
if place_meeting((x + hspd), y, obj_wall)
{
    var flag = 0
    repeat hspd_r
    {
        if (!(place_meeting((x + sign(hspd)), y, obj_wall)))
            x += sign(hspd)
        else if (!(place_meeting((x + sign(hspd)), (y - 1), obj_wall)))
        {
            x += sign(hspd)
            y--
        }
        else if (!(place_meeting((x + sign(hspd)), (y + 1), obj_wall)))
        {
            x += sign(hspd)
            y++
        }
        else
            flag = 1
    }
    if flag
        hspd *= -0.6
}
else
    x += hspd
if (vspd != 0 && place_meeting(x, (y + vspd), obj_wall))
{
    repeat hspd_r
    {
        if (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        {
            y += sign(vspd)
            grounded = 0
        }
    }
    vspd *= -0.6
}
else
    y += vspd
