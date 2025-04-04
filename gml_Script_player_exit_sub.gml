with (obj_shootdoor)
{
    if (state != 1)
    {
        state = 4
        timer = timer_max
    }
}
audio_play_sound(ExitSuit, 100, false)
audio_sound_pitch(ExitSuit, random_range(0.8, 0.9))
move_state = 81
UI_exitsub()
iindex = 0
shoot_state = 2
