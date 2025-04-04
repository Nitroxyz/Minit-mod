switch state_step
{
    case 0:
        qu_wait(1)
        break
    case 1:
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        music_duck(0.6, 1000)
        break
    case 2:
        process_loop_hub_elevator()
        hud_text_set(63, 358, 1)
        qu_wait(1)
        break
    case 3:
        process_loop_hub_elevator()
        if qu_trigger()
        {
            hud_text_set(64, 358, 1)
            qu_wait(1)
        }
        break
    case 4:
        process_loop_hub_elevator()
        if qu_trigger()
        {
            hud_text_set(65, 358, 0)
            qu_wait(1)
        }
        break
    case 5:
        process_loop_hub_elevator()
        if qu_trigger()
        {
            hud_text_set(511, 356, 2)
            qu_wait(1)
        }
        break
    case 6:
        process_loop_hub_elevator()
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
            qu_wait(1)
        }
        break
    case 7:
        process_loop_hub_elevator()
        if qu_trigger()
        {
            hud_text_set(66, 358, 1)
            qu_wait(1)
        }
        break
    case 8:
        process_loop_hub_elevator()
        if qu_trigger()
        {
            set_room_state(0)
            hud_text_set(67, 358, 0)
            qu_wait(1)
        }
        break
    case 9:
        player_auto()
        if qu_trigger()
        {
            hud_text_set_ext(68, 358, 2, "wavy")
            qu_wait(1)
        }
        break
    case 10:
        player_auto()
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 11:
        player_auto()
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
            qu_wait(1)
        }
        break
    case 12:
        player_auto()
        if qu_trigger()
        {
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 13:
        player_auto()
        if qu_trigger()
        {
            hud_text_set(511, 358, 3)
            qu_wait(1)
        }
        break
    case 14:
        player_auto()
        if qu_trigger()
        {
            qu_set_dialogmode()
            qu_wait(1)
        }
        break
    case 15:
        player_auto()
        if instance_exists(obj_demo_end_elevator)
        {
            if (obj_demo_end_elevator.state == 4)
            {
                hud_text_set(156, 358, 0)
                player_auto()
                qu_wait(1)
            }
        }
        break
    case 16:
        player_auto()
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

