if (paused == 0)
{
    with (obj_player)
    {
        other.x = x
        other.y = y
    }
    get_input()
    if (ready == 1 && j_a_up && GAME_MANAGER.state != 19)
    {
        scrBlackFade()
        instance_destroy()
        if (type == 0 && item == 1)
        {
        }
        audio_play_sound(sndConfirmItem, 10, false)
    }
}
