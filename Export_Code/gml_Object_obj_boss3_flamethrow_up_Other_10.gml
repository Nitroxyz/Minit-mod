animate_actor()
if instance_exists(par)
{
    x = par.x + (lengthdir_x(xoff, par.image_angle))
    y = par.y + (lengthdir_y(yoff, par.image_angle))
}
else
    instance_destroy()
if (timer > 0)
    timer--
else
    instance_destroy()
if ((timer % 5) == 0)
{
    if ((timer % 10) == 0)
        audio_play_sound(snd_flamebot_flameloop, 100, false)
    else
    {
        var tt = instance_create((x - 6 + irandom(12)), (y - 4), obj_steam_cloud)
        tt.hspd *= (image_xscale / 3)
        tt.vspd = 0.6
    }
    var flame = instance_create(x, y, obj_flamebot_flame)
    flame.movedir = 90 + (dsin(timer * 8)) * mag
    flame.image_speed = 0.2 + (dsin(timer * 8)) * 0.05
    flame.image_xscale = image_xscale
}
