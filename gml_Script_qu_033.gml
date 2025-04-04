switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        music_duck(0.5, 2000)
        qu_wait(1)
        GAME_MANAGER.csv_debug_num = 1
        GAME_MANAGER.csv_debug = 1
        break
    case 1:
        player_auto()
        hud_text_set(1, 358, 2)
        qu_wait(1)
        break
    case 2:
        if keyboard_check_pressed(vk_add)
        {
            if (GAME_MANAGER.csv_debug_num < (ds_grid_height(global.english_strings) - 1))
                GAME_MANAGER.csv_debug_num++
            hud_text_set(GAME_MANAGER.csv_debug_num, 358, 2)
        }
        else if keyboard_check_pressed(vk_subtract)
        {
            if (GAME_MANAGER.csv_debug_num > 1)
                GAME_MANAGER.csv_debug_num--
            hud_text_set(GAME_MANAGER.csv_debug_num, 358, 2)
        }
        break
}

