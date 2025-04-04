switch state_step
{
    case 0:
        if (!instance_exists(obj_changeroom))
        {
            player_auto()
            qu_wait(1)
        }
        break
    case 1:
        if instance_exists(obj_player)
        {
            if (obj_player.x < 100)
                obj_player.key_right = 1
            else
            {
                player_auto()
                if obj_player.grounded
                    qu_wait(1)
            }
        }
        break
    case 2:
        music_duck(0.6, 1000)
        hud_text_set(272, 581, 6)
        set_room_state(0)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(273, 356, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(274, 581, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(275, 356, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(276, 581, 0)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(277, 581, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(278, 581, 4)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(279, 356, 0)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(280, 581, 0)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(281, 581, 2)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(282, 581, 2)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(283, 581, 0)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(284, 581, 2)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(285, 581, 1)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(286, 581, 0)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set(288, 581, 2)
            qu_wait(1)
        }
        break
    case 19:
        if qu_trigger()
        {
            hud_text_set(289, 581, 5)
            qu_wait(1)
        }
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set(290, 581, 0)
            qu_wait(1)
        }
        break
    case 21:
        if qu_trigger()
        {
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 22:
        if qu_trigger()
        {
            music_duck(1, 1000)
            qu_set_dialogmode()
            qu_reset()
            player_play()
            global.events_completed++
        }
        break
}

