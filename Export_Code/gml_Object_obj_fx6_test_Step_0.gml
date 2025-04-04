animate_actor()
x = xstart + 8 * sin(angle)
angle += angle_speed
if (place_meeting(x, (y + vspd), obj_wall) && y < 32)
{
    vspd = 0
    instance_destroy()
    return;
}
y += vspd
if (y < 32)
{
    instance_destroy()
    var tsound = audio_play_sound(snd_rocket_explosion, 100, false)
    audio_sound_pitch(tsound, 0.6)
    audio_sound_gain(tsound, 0.8, 70)
    shake_screen(15)
}
