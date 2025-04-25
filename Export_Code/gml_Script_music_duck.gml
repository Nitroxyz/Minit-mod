with (MUSIC_MANAGER)
{
    if minit_music_inactive()
        music_gain_multiplier = argument0
    else
        music_gain_multiplier = 1
    if (current_song != undefined)
        audio_sound_gain(current_song, (music_gain_multiplier * global.audio_default_volumes[current_song_index]), argument1)
}
