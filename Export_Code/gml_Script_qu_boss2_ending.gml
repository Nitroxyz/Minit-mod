switch state_step
{
    case 0:
        if (!instance_exists(obj_boss2_sub))
        {
            music_duck(0, 400)
            qu_set_dialogmode()
            player_auto()
            qu_wait(1)
        }
        break
    case 1:
        player_auto()
        if (obj_player.x < 48)
        {
            obj_player.key_right = 1
            obj_player.key_left = 0
            obj_player.key_up = 0
            obj_player.key_down = 0
        }
        else if (obj_player.x > 256)
        {
            obj_player.key_right = 0
            obj_player.key_left = 1
            obj_player.key_up = 0
            obj_player.key_down = 0
        }
        else if (obj_player.y < 48)
        {
            obj_player.key_right = 0
            obj_player.key_left = 0
            obj_player.key_up = 0
            obj_player.key_down = 1
        }
        else if (obj_player.y > 144)
        {
            obj_player.key_right = 0
            obj_player.key_left = 0
            obj_player.key_up = 1
            obj_player.key_down = 0
        }
        else
        {
            obj_player.key_right = 0
            obj_player.key_left = 0
            obj_player.key_up = 0
            obj_player.key_down = 0
            if (abs(obj_player.vspd) < 0.5 && abs(obj_player.hspd) < 0.5)
            {
                with (obj_boss2_arm_socket)
                    state = 2
                work_boss2_remove_walls.state = 4
                qu_wait(2)
            }
        }
        break
    case 2:
        if (!instance_exists(work_boss2_remove_walls))
        {
            hud_text_set(167, 358, 1)
            music_xfade(MUSIC_MANAGER.current_main_theme, 2000)
            music_reset_track_position()
            music_duck(0.5, 2000)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set_ext(168, 358, 2, "wavy")
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(169, 358, 4)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(170, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            global.center_player_position = 1
            save_savefile()
            hud_text_reset()
            music_duck(1, 2000)
            player_play()
            qu_reset()
            global.events_completed++
        }
        break
}

