if (!(is_within_view(x, y, 0, 16)))
    return;
stepping = (!stepping)
if stepping
    return;
if place_meeting((x + hspd), (y + vspd), obj_wall)
{
    while (!(place_meeting((x + hspd), (y + vspd), obj_wall)))
    {
        x += hspd
        y += vspd
    }
    image_angle += (90 * dir)
    process_enemy_crawler_update_rotation()
}
else if (!(place_meeting((x + 8 * hspd - vspd * dir), (y + 8 * vspd + hspd * dir), obj_wall)))
{
    if (vspd == 0)
    {
        y += (9 * sign(hspd) * dir)
        while place_meeting(x, (y + hspd), obj_wall)
            x += hspd
    }
    if (hspd == 0)
    {
        x -= (9 * sign(vspd) * dir)
        while place_meeting((x - vspd), y, obj_wall)
            y += vspd
    }
    image_angle -= (90 * dir)
    process_enemy_crawler_update_rotation()
}
else
{
    x += hspd
    y += vspd
}
var iindex_old = floor(iindex)
animate_actor()
if (iindex_old == 0 && iindex_old != floor(iindex))
{
    if (!audio_is_playing(snd_crawler_walk))
    {
        var sfx = audio_play_sound(snd_crawler_walk, 100, false)
        audio_sound_pitch(sfx, random_range(0.9, 1.2))
    }
}
