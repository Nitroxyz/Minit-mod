switch state_step
{
    case 0:
        player_auto()
        notify_item_get(spr_health_icon, 465)
        qu_wait(20)
        break
    case 1:
        if qu_trigger()
        {
            with (obj_item_notification)
                instance_destroy()
            if (global.max_hp < 8 && (!global.decoder_discovered))
            {
                qu_wait(1)
                hud_text_set(466, 358, 1)
            }
            else
            {
                player_play()
                hud_text_reset()
                qu_reset()
                music_duck(1, 1000)
                save_savefile()
            }
        }
        break
    case 2:
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(467, 358, 2)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 5:
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

