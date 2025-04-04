if (vspd > 0)
    iindex = 1
else
    iindex = 0
vspd = min((vspd + 0.12), 4)
var hspd_r = round(hspd)
var vspd_r = round(vspd)
if place_meeting((x + hspd_r), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd_r)), y, obj_wall)))
        x += sign(hspd_r)
    hspd *= -1
}
else
    x += hspd_r
if place_meeting(x, (y + vspd_r), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd_r)), obj_wall)))
        y += sign(vspd_r)
    if (vspd > 0)
    {
        vspd = 0
        grounded = 1
        state = 350
        sprite_index = spr_froggo
        jump_timer = 60
        image_speed = 0.1
    }
    else
        vspd *= -1
}
else
    y += vspd_r
