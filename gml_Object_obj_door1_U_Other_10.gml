if master
{
    script_execute(trigger)
    if (flag == 1)
    {
        GAME_MANAGER.state = 17
        master = 0
        player_auto()
        alarm[1] = 6
        with (obj_door1_U)
        {
            if (master && id != other.id)
            {
                master = 0
                alarm[1] = 6
            }
        }
    }
}
if (fr_last != image_index)
{
    if audio_is_playing(SideDoorSegment)
        audio_stop_sound(SideDoorSegment)
    audio_play_sound(SideDoorSegment, 100, false)
    fr_last = image_index
}
