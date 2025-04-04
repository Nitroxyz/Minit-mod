if (image_index < (image_number - 1))
{
    image_index++
    shake_screen(3)
    alarm[1] = 6
    if audio_is_playing(SideDoorsUnlock)
        audio_stop_sound(SideDoorsUnlock)
    audio_play_sound(SideDoorsUnlock, 100, false)
    audio_sound_pitch(SideDoorsUnlock, random_range(0.88, 0.99))
}
else
{
    if (upper != self)
    {
        with (upper)
        {
            image_index++
            alarm[2] = 1
        }
    }
    else if (instance_exists(obj_player) && instance_number(obj_door1_U) == 1)
    {
        music_xfade(MUSIC_MANAGER.current_main_theme, 2000)
        music_reset_track_position()
        music_duck(1, 2000)
        player_auto_end()
    }
    instance_destroy()
    instance_create(0, 0, obj_shakesmall2)
}
