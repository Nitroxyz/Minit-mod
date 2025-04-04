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
        set_room_state(0)
        break
    case 2:
        process_loop_heatercore_elevator()
        hud_text_set(231, 358, 0)
        qu_wait(1)
        break
    case 3:
        process_loop_heatercore_elevator()
        if qu_trigger()
        {
            hud_text_set(511, 356, 1)
            qu_wait(1)
        }
        break
    case 4:
        process_loop_heatercore_elevator()
        if qu_trigger()
        {
            hud_text_set(232, 358, 2)
            qu_wait(1)
        }
        break
    case 5:
        process_loop_heatercore_elevator()
        if qu_trigger()
        {
            hud_text_set(233, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        process_loop_heatercore_elevator()
        if qu_trigger()
        {
            hud_text_set(234, 358, 0)
            qu_wait(1)
        }
        break
    case 7:
        process_loop_heatercore_elevator()
        if qu_trigger()
        {
            hud_text_set(235, 358, 0)
            qu_wait(1)
        }
        break
    case 8:
        process_loop_heatercore_elevator()
        if qu_trigger()
        {
            hud_text_set(512, 356, 0)
            qu_wait(1)
        }
        break
    case 9:
        process_loop_heatercore_elevator()
        if qu_trigger()
        {
            hud_text_set(236, 358, 0)
            qu_wait(1)
        }
        break
    case 10:
        player_auto()
        if qu_trigger()
        {
            hud_text_set(512, 356, 0)
            qu_wait(1)
        }
        break
    case 11:
        player_auto()
        if qu_trigger()
        {
            hud_text_set(156, 358, 0)
            qu_set_dialogmode()
            qu_wait(1)
        }
        break
    case 12:
        player_auto()
        if qu_trigger()
        {
            qu_set_dialogmode()
            qu_wait(1)
        }
        break
    case 13:
        player_auto()
        if instance_exists(obj_demo_end_elevator)
        {
            if (obj_demo_end_elevator.state == 4)
            {
                music_duck(1, 1000)
                hud_text_reset()
                player_play()
                qu_reset()
                global.events_completed++
            }
        }
        break
}

