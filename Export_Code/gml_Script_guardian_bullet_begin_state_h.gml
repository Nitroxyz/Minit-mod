if (!audio_is_playing(snd_shot))
{
    var sfx = audio_play_sound(snd_shot, 5, false)
    audio_sound_pitch(sfx, random_range(0.9, 1.1))
}
state = 467
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
    instance_destroy()
    return;
}
x += hspd
