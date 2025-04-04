switch state
{
    case "game":
        break
    case "pause":
        break
    case "menu":
        get_input()
        if (!instance_exists(obj_map))
            instance_create((view_wport[0] / 2 - 43), 48, obj_map)
        if j_down_pressed
        {
            cur++
            var sfx = audio_play_sound(sfx_menu_move_down, 5, false)
            if (cur > cur_max)
                cur = 0
            audio_sound_pitch(sfx, ((cur + 1) / 3 * 0.25 + 1))
        }
        else if j_up_pressed
        {
            cur--
            sfx = audio_play_sound(sfx_menu_move_up, 5, false)
            if (cur < 0)
                cur = cur_max
            audio_sound_pitch(sfx, ((cur + 1) / 3 * 0.25 + 1))
        }
        if (j_a_pressed || j_start)
        {
            switch cur
            {
                case 0:
                    state = "unpause"
                    sfx = audio_play_sound(sfx_menu_select, 5, false)
                    break
                case 1:
                    game_restart()
                    break
                case 2:
                    game_end()
                    break
            }

            with (obj_map)
                instance_destroy()
        }
        break
    case "unpause":
        if (!instance_exists(obj_screen_freeze))
            state = "game"
        break
    default:
        script_execute(state)
        break
}

