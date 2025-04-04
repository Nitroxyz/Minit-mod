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
        if minit_music_inactive()
            music_play_main(1)
        player_auto_end()
    }
    instance_destroy()
    instance_create(0, 0, obj_shakesmall2)
}
