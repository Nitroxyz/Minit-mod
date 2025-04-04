if (!(is_within_view(x, y, 0, 32)))
    return;
if (flowtimer > 0)
{
    flowtimer--
    if (flowtimer == 0)
    {
        var s = audio_play_sound(snd_steampuff, 5, false)
        audio_sound_pitch(s, random_range(0.85, 1.1))
    }
}
else if (timer > 0)
{
    timer--
    if ((timer % 15) == 0 && irandom(3) == 0)
    {
        var t = instance_create(x, y, obj_steam_cloud)
        t.hspd = hspd * (random_range(0.4, 0.8))
        t.vspd = vspd * (random_range(0.4, 0.8))
    }
    else if (irandom(20) == 0)
    {
        t = instance_create(x, y, obj_steam_cloud)
        t.hspd = hspd * (random_range(0.6, 0.8))
        t.vspd = vspd * (random_range(0.6, 0.8))
    }
}
else
{
    flowtimer = irandom(8) + 180
    timer = timermax
    t = instance_create(x, y, obj_steam_cloud)
    t.hspd = hspd
    t.vspd = vspd
}
