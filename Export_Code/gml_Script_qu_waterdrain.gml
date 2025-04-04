switch state_step
{
    case 0:
        player_auto()
        instance_create(x, y, obj_shake)
        qu_set_dialogmode()
        music_duck(0.5, 1200)
        qu_wait(1)
        break
    case 1:
        audio_play_sound(snd_watergushing, 5, false)
        global.water_level++
        qu_wait(1)
        break
    case 2:
        if (!audio_is_playing(snd_watergushing))
        {
            if (global.water_level == 1)
                state_step = 3
            else if (global.water_level == 2)
                state_step = 11
            else if (global.water_level == 3)
            {
                state_step = 21
                MUSIC_MANAGER.current_main_theme = 16
                music_play_main(0.5)
            }
        }
        else if (!instance_exists(obj_shake))
            shake_screen(5)
        break
    case 3:
        hud_text_set(155, 358, 2)
        qu_wait(1)
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(156, 358, 0)
            state_step = 99
        }
        break
    case 11:
        hud_text_set(157, 358, 0)
        qu_wait(1)
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(511, 356, 1)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(158, 358, 2)
            state_step = 99
        }
        break
    case 21:
        achievement_set("ACH_WATER")
        hud_text_set(159, 358, 2)
        qu_wait(1)
        break
    case 22:
        if qu_trigger()
        {
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 23:
        if qu_trigger()
        {
            hud_text_set(160, 358, 0)
            state_step = 99
        }
        break
    case 99:
        if qu_trigger()
        {
            music_duck(1, 1000)
            player_play()
            hud_text_reset()
            qu_reset()
        }
        break
}

