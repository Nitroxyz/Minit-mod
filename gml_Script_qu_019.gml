switch state_step
{
    case 0:
        if (global.flows_cleared > 0)
        {
            with (obj_hotlava_flow)
                instance_destroy()
            if (!instance_exists(obj_changeroom))
            {
                qu_reset()
                player_play()
            }
        }
        else if (!instance_exists(obj_changeroom))
        {
            player_play()
            qu_wait(1)
            with (obj_door1_U)
                override_enemy_destroy = 1
        }
        break
    case 1:
        if (get_room_state() == 2)
        {
            if (!instance_exists(obj_door1_U))
            {
                if instance_exists(obj_player)
                {
                    if obj_player.grounded
                    {
                        player_auto()
                        obj_player.key_right = 1
                        qu_wait(1)
                    }
                }
            }
        }
        else
            qu_reset()
        break
    case 2:
        player_auto()
        qu_wait(1)
        music_duck(0.6, 1000)
        break
    case 3:
        hud_text_set(179, 358, 1)
        qu_wait(1)
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(180, 358, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(181, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(182, 358, 2)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            qu_set_dialogmode()
            set_room_state(3)
            music_duck(1, 1000)
            qu_reset()
            player_play()
            global.events_completed++
        }
        break
}

