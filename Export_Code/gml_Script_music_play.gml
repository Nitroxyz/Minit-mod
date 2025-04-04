with (MUSIC_MANAGER)
{
    if (current_song != undefined)
    {
        if audio_is_playing(current_song)
            audio_stop_sound(current_song)
        last_song = current_song
    }
    current_song = audio_play_sound(argument0, 100, true)
    audio_sound_gain(current_song, (music_gain_multiplier * global.MUSIC_MASTER_GAIN * global.audio_default_volumes[argument0]), 0)
    current_song_gain_target = 1
    current_song_gain = 1
    current_song_index = argument0
}
