sprite_index = spr_flamebot_idle
image_speed = 0.2
animate_actor()
if grounded
    vspd = 0
else
    vspd += 0.2
hspd = 0
if (timer > 0)
    timer--
else
{
    state = 373
    iindex = 0
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    image_xscale = (-image_xscale)
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
