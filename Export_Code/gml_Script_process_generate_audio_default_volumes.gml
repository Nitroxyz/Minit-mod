global.audio_default_volumes[0] = 0
for (var i = mu_cat_exploration; i < 1000; i++)
{
    if (audio_get_type(i) != -1)
        global.audio_default_volumes[i] = audio_sound_get_gain(i)
}
