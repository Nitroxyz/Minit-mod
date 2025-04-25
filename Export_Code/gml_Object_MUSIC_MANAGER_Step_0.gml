music_state_crossfade()
if audio_is_playing(sndMinitSing)
{
    if (current_song_index != mus_forest[1])
        audio_sound_gain(sndMinitSing, 0, 0)
    else
        audio_sound_gain(sndMinitSing, audio_sound_get_gain(current_song), 0)
}
else if (current_song_index == mus_forest[1] && abs(audio_sound_get_track_position(current_song) - 4) <= 0.016666666666666666 && irandom(1) == 0)
{
    audio_play_sound(sndMinitSing, 1000, false)
    audio_sound_gain(sndMinitSing, audio_sound_get_gain(current_song), 0)
}
