switch state_step
{
    case 0:
        player_auto()
        global.palette_unlocked[global.palette_to_unlock] = 1
        global.palette_previous = GAME_MANAGER.palette_index
        notify_item_get(spr_vhs_icon, 490)
        qu_wait(20)
        break
    case 1:
        if qu_trigger()
        {
            with (obj_item_notification)
                instance_destroy()
        }
        if (!instance_exists(obj_item_notification))
        {
            if (process_tally_palettes() == 1)
            {
                qu_wait(1)
                if global.decoder_discovered
                    hud_text_set(491, 581, 1)
                else
                    hud_text_set(491, 358, 1)
            }
            else
            {
                state_step += 4
                dialog_variable = palette_desc
                if global.decoder_discovered
                    hud_text_set(493, 581, 2)
                else
                    hud_text_set(493, 358, 2)
            }
        }
        break
    case 2:
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(492, 581, 0)
            else
                hud_text_set(492, 358, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            dialog_variable = palette_desc
            if global.decoder_discovered
                hud_text_set(493, 581, 2)
            else
                hud_text_set(493, 358, 2)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(494, 581, 2)
            else
                hud_text_set(494, 358, 2)
            GAME_MANAGER.palette_index = global.palette_to_unlock
            shake_screen(30)
            audio_play_sound(bgm_boss_stab, 100, false)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(156, 581, 0)
            else
                hud_text_set(156, 358, 0)
            GAME_MANAGER.palette_index = global.palette_previous
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            player_play()
            hud_text_reset()
            qu_reset()
            music_duck(1, 1000)
            save_savefile()
        }
        break
}

