if master
{
    script_execute(trigger)
    if (flag == 1)
    {
        master = 0
        player_stop()
        alarm[1] = 6
        if audio_is_playing(CatroidEnemyLock)
        {
            if (audio_sound_get_gain(CatroidEnemyLock) > 0.1)
                audio_sound_gain(CatroidEnemyLock, 0, 1000)
        }
    }
}
if (fr_last != image_index)
{
    audio_play_sound(SideDoorSegment, 100, false)
    fr_last = image_index
}
