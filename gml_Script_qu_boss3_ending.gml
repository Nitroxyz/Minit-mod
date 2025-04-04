switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        audio_play_sound(snd_mouse_deathcry, 100, false)
        break
    case 1:
        if (!instance_exists(obj_door1_U))
        {
            player_auto()
            if instance_exists(obj_player)
            {
                if obj_player.grounded
                {
                    hud_text_set(220, 358, 1)
                    qu_wait(1)
                }
            }
        }
        break
    case 2:
        if qu_trigger()
        {
            music_xfade(MUSIC_MANAGER.current_main_theme, 2000)
            music_reset_track_position()
            music_duck(0.5, 2000)
            hud_text_set(221, 358, 2)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            shake_screen(10)
            hud_text_set(511, 356, 8)
            state_step = 3.5
        }
        break
    case 3.5:
        if qu_trigger()
        {
            shake_screen(10)
            hud_text_set(512, 356, 8)
            state_step = 4
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(223, 358, 1)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(224, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(225, 358, 2)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            shake_screen(10)
            hud_text_set(512, 356, 1)
            qu_wait(1)
            global.center_player_position = 1
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_reset()
            music_duck(1, 2000)
            player_play()
            qu_reset()
            global.events_completed++
            save_savefile()
        }
        break
}

