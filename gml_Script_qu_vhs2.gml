switch state_step
{
    case 0:
        player_auto()
        global.palette_unlocked[global.palette_to_unlock] = 1
        notify_item_get(spr_vhs_icon, "VHS MODULE")
        qu_wait(60)
        break
    case 1:
        if qu_trigger()
        {
            with (obj_item_notification)
                instance_destroy()
        }
        if (!instance_exists(obj_item_notification))
            qu_wait(1)
        break
    case 2:
        hud_text_set((global.name + "!#You got a VHS!!"), 358, 1)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set("Get some color in #your life, Kiki!", 358, 2)
            GAME_MANAGER.palette_index = 2
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set("...", 356, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set("Press the number 0 to#try different palettes.", 358, 4)
            GAME_MANAGER.palette_index = 0
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set("...", 356, 5)
            GAME_MANAGER.palette_index = 6
            shake_screen(30)
            audio_play_sound(bgm_boss_stab, 100, false)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            GAME_MANAGER.palette_index = 1
            hud_text_set_ext("*THAT'S*MY*KITTY*", 358, 2, "wavy")
            shake_screen(3)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            GAME_MANAGER.palette_index = 0
            hud_text_set("OVER AND OUT", 358, 0)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            player_play()
            hud_text_reset()
            qu_reset()
            music_duck(1, 1000)
        }
        break
}

