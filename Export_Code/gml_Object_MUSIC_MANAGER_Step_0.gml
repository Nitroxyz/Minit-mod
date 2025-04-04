music_state_crossfade()
if audio_is_playing(sndMinitSing)
{
    if (current_song != undefined)
        audio_sound_gain(current_song, (0.5 * global.audio_default_volumes[current_song_index]), 0)
    if (MUSIC_MANAGER.current_song_index != mus_forest[1])
        audio_sound_gain(sndMinitSing, 0, 300)
}
else if (MUSIC_MANAGER.current_song_index == mus_forest[1] && abs(audio_sound_get_track_position(current_song) - 4) <= 0.016666666666666666 && irandom(5) == 0)
    audio_play_sound(sndMinitSing, 1000, false)
