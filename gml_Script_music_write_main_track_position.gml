with (MUSIC_MANAGER)
{
    if (current_song != undefined)
        main_track_position = audio_sound_get_track_position(current_song)
    else
        main_track_position = 0
}
