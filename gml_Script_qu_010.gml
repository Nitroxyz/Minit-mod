switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        break
    case 1:
        if instance_exists(obj_player)
        {
            player_auto()
            with (obj_player)
                key_right = 1
            if (obj_player.x > 48)
            {
                obj_player.key_right = 0
                qu_wait(20)
            }
        }
        break
    case 2:
        music_duck(0.6, 1000)
        hud_text_set(152, 358, 0)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(153, 358, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(154, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            music_duck(1, 1000)
            set_room_state(0)
            hud_text_reset()
            player_play()
            qu_reset()
            global.events_completed++
        }
        break
}

