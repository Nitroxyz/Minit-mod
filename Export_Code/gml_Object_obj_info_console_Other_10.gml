if (button_id != self)
{
    switch state
    {
        case 0:
            animate_actor()
            if (button_id.state == 2)
            {
                state = 1
                iindex = 0
                sprite_index = spr_terminal_turning_on
                image_speed = 0.2
                audio_play_sound(snd_monitor_on, 100, false)
                if (console_event != -1)
                    player_auto()
            }
            break
        case 1:
            var iindex_old = iindex
            animate_actor()
            if (iindex < iindex_old)
            {
                sprite_index = spr_terminal_text
                image_speed = 0.1
                iindex = 0
                state = 2
                if (console_event != -1)
                {
                    qu_set(console_event)
                    console_event = -1
                }
            }
            break
        case 2:
            animate_actor()
            if (button_id.state == 0)
            {
                sprite_index = spr_terminal_turning_on
                iindex = sprite_get_number(sprite_index) - 0.1
                state = 3
            }
            break
        case 3:
            iindex -= image_speed
            if (iindex <= 0)
            {
                iindex = 0
                state = 0
                sprite_index = spr_terminal_idle
            }
            break
    }

}
