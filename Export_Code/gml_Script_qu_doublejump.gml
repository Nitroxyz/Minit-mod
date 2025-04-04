switch state_step
{
    case 0:
        player_auto()
        notify_item_get(spr_booster_icon, 460)
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
            hud_text_set(461, 358, 1)
        }
        break
    case 2:
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            choose_dialog_button("A")
            hud_text_set(462, 358, 2)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(463, 358, 2)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
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
            hud_text_set(464, 358, 1)
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

