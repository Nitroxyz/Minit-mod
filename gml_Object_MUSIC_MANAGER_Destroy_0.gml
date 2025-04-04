if ((!is_undefined(current_song)) && audio_is_playing(current_song))
    audio_sound_gain(current_song, 0, 1000)
