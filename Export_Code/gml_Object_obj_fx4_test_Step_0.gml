iindex_old = iindex
animate_actor()
x += hspd
y += vspd
vspd += 0.2
if (y > 320)
{
    instance_destroy()
    var tsound = audio_play_sound(snd_rocket_explosion, 100, false)
    audio_sound_pitch(tsound, 0.6)
    audio_sound_gain(tsound, 0.8, 70)
    shake_screen(15)
}
