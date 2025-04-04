if on
{
    if (sprite_index != spr_terminal_turning_on && sprite_index != spr_terminal_text)
    {
        sprite_index = spr_terminal_turning_on
        image_index = 0
        audio_play_sound(snd_monitor_on, 100, false)
    }
    if (image_index <= (image_number - 1))
        image_speed = 1
    else
        sprite_index = spr_terminal_text
}
else if (sprite_index != spr_terminal_idle)
{
    audio_play_sound(snd_savepoint_stepoff, 100, false)
    image_speed = 0
    image_index = 0
    sprite_index = spr_terminal_idle
}
