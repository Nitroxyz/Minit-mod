if (last_song != undefined)
{
    if (audio_sound_get_gain(last_song) == 0)
    {
        if audio_is_playing(last_song)
            audio_stop_sound(last_song)
    }
}
