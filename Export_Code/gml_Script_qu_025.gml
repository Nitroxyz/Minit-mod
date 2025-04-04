switch state_step
{
    case 0:
        player_play()
        qu_wait(1)
        break
    case 1:
        if instance_exists(obj_info_console_button)
        {
            if obj_info_console_button.pressed
            {
                audio_play_sound(snd_crusher_detach, 100, false)
                shake_screen(15)
                global.vents_cleared++
                global.events_completed++
                scr_flash(0.2, 2)
                music_duck(0.6, 1000)
                set_room_state(0)
                with (obj_wall12)
                {
                    if default_state
                    {
                        default_state = 0
                        image_speed = 0.2
                    }
                    else
                    {
                        default_state = 1
                        image_speed = 1
                    }
                }
                with (obj_wall12_nocollider)
                {
                    if default_state
                    {
                        default_state = 0
                        image_speed = 0.2
                    }
                    else
                    {
                        default_state = 1
                        image_speed = 1
                    }
                }
                if (global.vents_cleared == 1)
                    qu_wait(1)
                else if (global.vents_cleared == 3)
                    qu_set(262)
                else
                    qu_reset()
            }
        }
        break
    case 2:
        player_auto()
        hud_text_set(238, 358, 2)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(511, 356, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(239, 358, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(240, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(241, 358, 3)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(242, 358, 2)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(243, 358, 0)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

