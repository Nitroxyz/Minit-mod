switch state_step
{
    case 0:
        player_auto()
        notify_item_get(spr_decoder_icon, 489)
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
            hud_text_set(287, 356, 2)
        }
        break
    case 2:
        qu_wait(30)
        break
    case 3:
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

