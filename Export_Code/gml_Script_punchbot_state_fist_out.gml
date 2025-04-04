stun_state = 315
sprite_index = spr_punchbot_reload
iindex = 0
image_speed = 0
vspd = 0
hspd = approach(hspd, 0, 0.05)
if (!instance_exists(fist))
{
    state = 401
    hspd = (-image_xscale)
    vspd = 0
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
