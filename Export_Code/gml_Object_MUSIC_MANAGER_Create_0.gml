if (instance_number(MUSIC_MANAGER) > 1)
{
    current_song = undefined
    instance_destroy()
    show_debug_message("I EXIST.")
    return;
}
current_song = undefined
last_song = undefined
current_song_gain = 0
current_song_gain_target = 0
next_song_gain = 0
next_song_gain_target = 0
music_instance = undefined
music_gain_multiplier = 1
current_main_theme = 0
main_track_position = 0
current_song_index = undefined
current_minit_part = 0
var i = 1
repeat (4)
{
    mus_desert[i] = asset_get_index("musDesert" + string(i))
    mus_forest[i] = asset_get_index("musForest" + string(i))
    i++
}
