switch state_step
{
    case 0:
        player_auto()
        notify_item_get(spr_cooler_icon, 473)
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
            qu_wait(1)
            if global.decoder_discovered
                hud_text_set(474, 581, 1)
            else
                hud_text_set(474, 358, 1)
        }
        break
    case 2:
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(475, 581, 2)
            else
                hud_text_set(475, 358, 2)
            qu_wait(1)
        }
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
            if global.decoder_discovered
                hud_text_set(476, 581, 1)
            else
                hud_text_set(476, 358, 1)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(511, 356, 2)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(156, 581, 1)
            else
                hud_text_set(156, 358, 1)
            shake_screen(20)
            qu_wait(1)
        }
        break
    case 8:
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

