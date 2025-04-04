switch state_step
{
    case 0:
        player_auto()
        notify_item_get(spr_bigshot_icon, 483)
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
                hud_text_set(484, 581, 1)
            else
                hud_text_set(484, 358, 1)
        }
        break
    case 2:
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(485, 581, 2)
            else
                hud_text_set(485, 358, 2)
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
                hud_text_set(486, 581, 0)
            else
                hud_text_set(486, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(487, 356, 2)
            qu_wait(1)
        }
        break
    case 7:
        obj_player.key_left = 1
        obj_player.key_jump = 1
        qu_wait(15)
        break
    case 7.5:
        player_auto()
        break
    case 8:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 8.5:
        player_auto()
        break
    case 9:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 9.5:
        player_auto()
        break
    case 10:
        obj_player.key_shoot2 = 1
        qu_wait(30)
        break
    case 10.5:
        player_auto()
        break
    case 11:
        obj_player.key_right = 1
        obj_player.key_jump = 1
        qu_wait(15)
        break
    case 11.5:
        player_auto()
        break
    case 12:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 12.5:
        player_auto()
        break
    case 13:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 13.5:
        player_auto()
        break
    case 14:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 14.5:
        player_auto()
        break
    case 15:
        obj_player.key_left = 1
        obj_player.key_up = 1
        obj_player.key_jump = 1
        qu_wait(30)
        break
    case 15.5:
        player_auto()
        obj_player.key_up = 1
        break
    case 16:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 16.5:
        player_auto()
        obj_player.key_up = 1
        break
    case 17:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 17.5:
        player_auto()
        obj_player.key_up = 1
        break
    case 18:
        obj_player.key_shoot2 = 1
        qu_wait(15)
        break
    case 18.5:
        player_auto()
        obj_player.key_up = 1
        break
    case 19:
        player_auto()
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(488, 581, 2)
            else
                hud_text_set(488, 358, 2)
            qu_wait(1)
        }
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set_ext(26, 356, 2, "wavy")
            shake_screen(20)
            qu_wait(1)
        }
        break
    case 21:
        if qu_trigger()
        {
            if global.decoder_discovered
                hud_text_set(156, 581, 0)
            else
                hud_text_set(156, 358, 0)
            qu_wait(1)
        }
        break
    case 22:
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

