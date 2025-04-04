sprite_index = spr_dilla_outof_ball
image_speed = 0.5
animate_actor()
hspd = approach(hspd, 0, 0.05)
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
}
x += hspd
if ((iindex + image_speed) >= image_number)
{
    state = 367
    vspd = 0
    hspd = 0
    if (!start_slowing)
        image_xscale = (-image_xscale)
    start_slowing = 0
}
