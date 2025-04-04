if (instance_exists(obj_rail_guardian) || instance_exists(obj_boss_gary_pod) || (!audio_is_playing(snd_shot)))
{
    var sfx = audio_play_sound(snd_shot, 5, false)
    audio_sound_pitch(sfx, random_range(0.9, 1.1))
}
state = 466
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
    instance_destroy()
    return;
}
y += vspd
