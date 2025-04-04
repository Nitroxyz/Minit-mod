sprite_index = spr_mech_dash
hspd = approach(hspd, 0, 1)
vspd = 0
if (dashing > 0)
{
    dashing--
    instance_create(x, y, obj_dash)
}
else
{
    if (dash_return_state == 67 && hopper)
        move_state = 66
    else
        move_state = dash_return_state
    dashcool = 20
    return;
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
    dashing = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
