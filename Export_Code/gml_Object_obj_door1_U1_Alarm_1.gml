if (image_index < (image_number - 1))
{
    image_index++
    shake_screen(8)
    alarm[1] = 6
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
        player_play()
        if audio_is_playing(CatroidEnemyLock)
            audio_stop_sound(CatroidEnemyLock)
        if audio_is_playing(snd_amb1)
            audio_sound_gain(snd_amb1, global.ambvol, 3000)
        else
        {
            audio_play_sound(snd_amb1, 100, true)
            audio_sound_gain(snd_amb1, global.ambvol, 3000)
        }
    }
    instance_destroy()
    instance_create(0, 0, obj_shakesmall2)
}
