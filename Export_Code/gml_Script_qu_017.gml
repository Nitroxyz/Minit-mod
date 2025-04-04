switch state_step
{
    case 0:
        if (!instance_exists(obj_changeroom))
        {
            music_xfade(mu_workshop, 100)
            state_step = 0.5
        }
        break
    case 0.5:
        if (obj_player.y > 100 && obj_player.grounded && obj_player.vehicle == 1)
        {
            palette_count = process_tally_palettes()
            state_step = 1
            player_auto()
            obj_player.key_left = 1
            qu_set_dialogmode()
        }
        break
    case 1:
        player_auto()
        music_duck(0.8, 1000)
        if (global.rebba_quest_complete_2 == 1)
            state_step = 49
        else if (global.rebba_quest_discovered_2 == 1)
            state_step = 34
        else if (global.rebba_quest_complete_1 == 1)
            state_step = 34
        else if (global.rebba_quest_discovered_1 == 1)
            state_step = 19
        else
            qu_wait(1)
        break
    case 2:
        hud_text_set(127, 518, 2)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(511, 518, 3)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(128, 518, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(129, 518, 1)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            shake_screen(14)
            hud_text_set(130, 518, 3)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(20, 356, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(131, 518, 4)
            qu_wait(1)
        }
        break
    case 9:
        qu_wait(1)
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(132, 518, 2)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(133, 518, 1)
            qu_wait(1)
        }
        break
    case 12:
        if (palette_count >= 7)
        {
            global.rebba_quest_discovered_1 = 1
            state_step = 22
        }
        else if qu_trigger()
        {
            shake_screen(14)
            hud_text_set(130, 518, 3)
            qu_wait(1)
        }
        break
    case 13:
        if global.decoder_discovered
            qu_wait(1)
        else if qu_trigger()
        {
            hud_text_set(511, 358, 1)
            qu_wait(1)
        }
        break
    case 14:
        if global.decoder_discovered
            qu_wait(1)
        else if qu_trigger()
        {
            hud_text_set(134, 358, 1)
            qu_wait(1)
        }
        break
    case 15:
        if global.decoder_discovered
            qu_wait(1)
        else if qu_trigger()
        {
            hud_text_set(135, 358, 3)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(26, 356, 1)
            qu_wait(1)
        }
        break
    case 17:
        qu_wait(1)
        break
    case 18:
        if qu_trigger()
        {
            music_duck(1, 1000)
            global.rebba_quest_discovered_1 = 1
            global.events_completed++
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
    case 19:
        shake_screen(14)
        hud_text_set(130, 518, 3)
        qu_wait(1)
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set(20, 356, 0)
            qu_wait(1)
        }
        break
    case 21:
        if qu_trigger()
        {
            hud_text_set(136, 518, 4)
            qu_wait(1)
        }
        break
    case 22:
        if qu_trigger()
        {
            if (palette_count >= 7)
            {
                dialog_variable = string(palette_count)
                dialog_controller_frame = -1
                dialog_controller_sprite = -1
                hud_text_set(140, 518, 3)
                state_step = 29
            }
            else
            {
                dialog_variable = string(palette_count)
                dialog_controller_frame = -1
                dialog_controller_sprite = -1
                hud_text_set(137, 518, 3)
                qu_wait(1)
            }
        }
        break
    case 23:
        if qu_trigger()
        {
            dialog_variable = string(7 - palette_count)
            dialog_controller_frame = -1
            dialog_controller_sprite = -1
            hud_text_set(138, 518, 2)
            qu_wait(1)
        }
        break
    case 24:
        if qu_trigger()
        {
            shake_screen(14)
            hud_text_set(130, 518, 3)
            qu_wait(1)
        }
        break
    case 25:
        if global.decoder_discovered
            qu_wait(1)
        else if qu_trigger()
        {
            hud_text_set(511, 358, 1)
            qu_wait(1)
        }
        break
    case 26:
        if qu_trigger()
        {
            hud_text_set(26, 356, 1)
            qu_wait(1)
        }
        break
    case 27:
        if qu_trigger()
        {
            hud_text_set(139, 518, 0)
            qu_wait(1)
        }
        break
    case 28:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
    case 29:
        if qu_trigger()
        {
            hud_text_set(26, 356, 1)
            qu_wait(1)
        }
        break
    case 30:
        if qu_trigger()
        {
            hud_text_set(141, 518, 2)
            state_step = 30.4
        }
        break
    case 30.4:
        if qu_trigger()
        {
            hud_text_reset()
            state_step = 30.5
            instance_create(0, 0, obj_rebbafade)
        }
        break
    case 30.5:
        if (obj_rebbafade.state == 1 && (!audio_is_playing(snd_rebbamod)))
        {
            qu_set(213)
            obj_rebbafade.state = 2
        }
        break
    case 31:
        if (!instance_exists(obj_rebbafade))
        {
            shake_screen(14)
            hud_text_set(130, 518, 3)
            state_step = 31.5
        }
        break
    case 31.5:
        if qu_trigger()
        {
            hud_text_set(142, 518, 2)
            state_step = 32
        }
        break
    case 32:
        if (palette_count >= 14)
        {
            state_step = 37
            global.rebba_quest_complete_1 = 1
        }
        else if qu_trigger()
        {
            hud_text_set(143, 518, 1)
            state_step = 32.5
        }
        break
    case 32.5:
        if qu_trigger()
        {
            hud_text_set(139, 518, 0)
            state_step = 33
        }
        break
    case 33:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
            global.events_completed++
        }
        break
    case 34:
        shake_screen(14)
        hud_text_set(130, 518, 3)
        qu_wait(1)
        break
    case 35:
        if qu_trigger()
        {
            hud_text_set(20, 356, 0)
            qu_wait(1)
        }
        break
    case 36:
        if qu_trigger()
        {
            hud_text_set(136, 518, 4)
            qu_wait(1)
        }
        break
    case 37:
        if qu_trigger()
        {
            if (palette_count >= 14)
            {
                hud_text_set(144, 518, 3)
                state_step = 44
            }
            else
            {
                dialog_variable = string(palette_count)
                dialog_controller_frame = -1
                dialog_controller_sprite = -1
                hud_text_set(137, 518, 3)
                qu_wait(1)
            }
        }
        break
    case 38:
        if qu_trigger()
        {
            dialog_variable = string(14 - palette_count)
            dialog_controller_frame = -1
            dialog_controller_sprite = -1
            hud_text_set(138, 518, 2)
            qu_wait(1)
        }
        break
    case 39:
        if qu_trigger()
        {
            shake_screen(14)
            hud_text_set(130, 518, 3)
            qu_wait(1)
        }
        break
    case 40:
        if global.decoder_discovered
            qu_wait(1)
        else if qu_trigger()
        {
            hud_text_set(511, 358, 1)
            qu_wait(1)
        }
        break
    case 41:
        if qu_trigger()
        {
            hud_text_set(26, 356, 1)
            qu_wait(1)
        }
        break
    case 42:
        if qu_trigger()
        {
            hud_text_set(139, 518, 0)
            qu_wait(1)
        }
        break
    case 43:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
    case 44:
        if qu_trigger()
        {
            hud_text_set(26, 356, 1)
            qu_wait(1)
        }
        break
    case 45:
        if qu_trigger()
        {
            hud_text_set(141, 518, 2)
            state_step = 45.4
        }
        break
    case 45.4:
        if qu_trigger()
        {
            hud_text_reset()
            state_step = 45.5
            instance_create(0, 0, obj_rebbafade)
        }
        break
    case 45.5:
        if (obj_rebbafade.state == 1 && (!audio_is_playing(snd_rebbamod)))
        {
            qu_set(214)
            obj_rebbafade.state = 2
        }
        break
    case 46:
        if qu_trigger()
        {
            hud_text_set(145, 518, 0)
            qu_wait(1)
        }
        break
    case 47:
        if qu_trigger()
        {
            shake_screen(14)
            hud_text_set(130, 518, 3)
            qu_wait(1)
        }
        break
    case 48:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
    case 49:
        hud_text_set(26, 356, 1)
        qu_wait(1)
        break
    case 50:
        if qu_trigger()
        {
            hud_text_set(145, 518, 2)
            qu_wait(1)
        }
        break
    case 51:
        if qu_trigger()
        {
            shake_screen(14)
            hud_text_set(130, 518, 3)
            qu_wait(1)
        }
        break
    case 52:
        if qu_trigger()
        {
            hud_text_set(139, 518, 0)
            qu_wait(1)
        }
        break
    case 53:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

