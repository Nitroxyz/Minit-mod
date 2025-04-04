animate_actor()
if (vspd > 0 && place_meeting((x + hspd), y, obj_wall))
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
    instance_destroy()
    shake_screen(6)
    instance_create(x, (y + 8), obj_grenade_explosion)
    return;
}
x += hspd
if (vspd > 0 && place_meeting(x, (y + vspd), obj_wall))
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
    instance_destroy()
    shake_screen(6)
    instance_create(x, (y + 8), obj_grenade_explosion)
    return;
}
y += vspd
vspd += grav
