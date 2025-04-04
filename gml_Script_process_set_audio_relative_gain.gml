audio_group_set_gain(0, global.SOUND_MASTER_GAIN, 0)
audio_group_set_gain(1, global.MUSIC_MASTER_GAIN, 0)
for (var i = mu_cat_exploration; i < array_length_1d(global.audio_default_volumes); i++)
    audio_sound_gain(i, (global.audio_default_volumes[i] * audio_sound_get_gain(i)), 0)
