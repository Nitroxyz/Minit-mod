animate_custom()
if place_meeting(x, (y - 24), obj_hotlava)
{
    vspd = approach(vspd, ((-floatspeed) / 1.5), floatacc)
    y += (vspd / 1.5)
}
else
{
    vspd = approach(vspd, (fallspeed / 1.5), grav)
    y += (vspd / 1.5)
    if place_meeting(x, (y - 24), obj_hotlava)
        instance_create(x, y, obj_lavasplash)
}
if (state_timer > 0)
    state_timer--
else
{
    state_timer = state_timer_o / 2
    image_xscale *= -1
}
if ((!obj_hud.dialog_mode) && (!instance_exists(obj_door_auto_U)))
{
    image_xscale = -1
    music_duck(1, 0)
    music_xfade(mu_lavaboss, 0)
    state = 602
}
