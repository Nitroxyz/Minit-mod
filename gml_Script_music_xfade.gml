var arg0 = argument0
var arg1 = argument1
with (MUSIC_MANAGER)
{
    if (current_song != undefined)
    {
        last_song = current_song
        audio_sound_gain(last_song, 0, arg1)
    }
    current_song = audio_play_sound(arg0, 1000, true)
    current_song_index = arg0
    audio_sound_gain(current_song, 0, 0)
    audio_sound_gain(current_song, (music_gain_multiplier * global.MUSIC_MASTER_GAIN * global.audio_default_volumes[arg0]), arg1)
}
