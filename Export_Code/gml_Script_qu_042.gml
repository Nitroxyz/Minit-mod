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
                global.vents_cleared = 3
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
                qu_set(262)
            }
        }
        break
}

