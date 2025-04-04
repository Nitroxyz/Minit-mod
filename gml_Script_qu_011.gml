switch state_step
{
    case 0:
        state_step = 0.5
        break
    case 0.5:
        state_step = 1
        set_room_state(0)
        break
    case 1:
        if instance_exists(obj_demo_end_elevator)
        {
            if (obj_demo_end_elevator.state == 4)
            {
                qu_set_dialogmode()
                player_auto()
                qu_wait(1)
                music_duck(0.6, 1000)
            }
        }
        break
    case 2:
        hud_text_set(146, 358, 0)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(147, 358, 2)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(512, 356, 1)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(148, 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(149, 358, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(150, 358, 2)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            shake_screen(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            hud_text_set(151, 358, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(156, 358, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            music_duck(1, 1000)
            hud_text_reset()
            player_play()
            qu_reset()
            global.events_completed++
        }
        break
}

