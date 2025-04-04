with (MUSIC_MANAGER)
{
    music_gain_multiplier = argument0
    if (current_song != undefined)
        audio_sound_gain(current_song, (music_gain_multiplier * global.audio_default_volumes[current_song_index]), argument1)
}
