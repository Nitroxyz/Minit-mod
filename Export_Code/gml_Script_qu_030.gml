switch state_step
{
    case 0:
        qu_wait(1)
        break
    case 1:
        qu_set_dialogmode()
        player_auto()
        music_duck(0.7, 1000)
        qu_wait(1)
        break
    case 2:
        process_loop_incubator_elevator()
        hud_text_set(265, 581, 0)
        qu_wait(1)
        break
    case 3:
        process_loop_incubator_elevator()
        if qu_trigger()
        {
            hud_text_set(266, 581, 1)
            qu_wait(1)
        }
        break
    case 4:
        process_loop_incubator_elevator()
        if qu_trigger()
        {
            hud_text_set(267, 581, 2)
            qu_wait(1)
        }
        break
    case 5:
        process_loop_incubator_elevator()
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 6:
        process_loop_incubator_elevator()
        if qu_trigger()
        {
            hud_text_set(268, 581, 0)
            qu_wait(1)
        }
        break
    case 7:
        process_loop_incubator_elevator()
        if qu_trigger()
        {
            hud_text_set(269, 581, 0)
            qu_wait(1)
        }
        break
    case 8:
        process_loop_incubator_elevator()
        if qu_trigger()
        {
            hud_text_set(270, 581, 0)
            qu_wait(1)
        }
        break
    case 9:
        process_loop_incubator_elevator()
        if qu_trigger()
        {
            set_room_state(0)
            hud_text_set(512, 356, 1)
            qu_wait(1)
        }
        break
    case 10:
        player_auto()
        if qu_trigger()
        {
            hud_text_set(271, 581, 0)
            qu_wait(1)
        }
        break
    case 11:
        player_auto()
        if qu_trigger()
        {
            qu_set_dialogmode()
            qu_wait(1)
        }
        break
    case 12:
        player_auto()
        if instance_exists(obj_demo_end_elevator)
        {
            if (obj_demo_end_elevator.state == 4)
            {
                global.events_completed++
                hud_text_reset()
                player_play()
                music_duck(1, 1000)
                qu_reset()
            }
        }
        break
}

