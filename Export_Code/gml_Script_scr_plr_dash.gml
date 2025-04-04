if (dashcool == 0)
{
    if (a_dash && key_dash)
    {
        if (facing == 1)
            hspd = 10
        else
            hspd = -10
        dashing = 8
        UI_MANAGER.dashindex = 0
        audio_play_sound(snd_dash, 100, false)
        dash_return_state = move_state
        move_state = 77
        return 1;
    }
}
else
{
    dashcool--
    return 0;
}
