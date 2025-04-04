switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        hud_text_set(511, 356, 0)
        qu_wait(1)
        break
    case 1:
        if qu_trigger()
        {
            hud_text_set(115, 581, 6)
            qu_wait(1)
        }
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(116, 356, 0)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_force(choose(117, 118, 119, 120), 581, choose(0, 1, 2, 3))
            qu_wait(1)
        }
        break
    case 4:
        hud_text_force(choose(117, 118, 119, 120), 581, choose(0, 1, 2, 3))
        if qu_trigger()
        {
            hud_text_set(121, 581, 2)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(122, 581, 7)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(123, 581, 0)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(116, 356, 2)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(124, 581, 2)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_reset()
            qu_wait(20)
            shake_screen(12)
        }
        break
    case 10:
        with (instance_position(obj_demo_end_elevator.x, (obj_demo_end_elevator.y - 16), obj_wall))
        {
            instance_destroy()
            instance_create(x, y, obj_hidecloud)
        }
        shake_screen(12)
        qu_wait(20)
        break
    case 11:
        with (instance_position((obj_demo_end_elevator.x + 16), (obj_demo_end_elevator.y - 16), obj_wall))
        {
            instance_destroy()
            instance_create(x, y, obj_hidecloud)
        }
        shake_screen(12)
        qu_wait(20)
        break
    case 12:
        with (instance_position((obj_demo_end_elevator.x + 32), (obj_demo_end_elevator.y - 16), obj_wall))
        {
            instance_destroy()
            instance_create(x, y, obj_hidecloud)
        }
        shake_screen(12)
        qu_wait(20)
        break
    case 13:
        with (instance_position((obj_demo_end_elevator.x + 48), (obj_demo_end_elevator.y - 16), obj_wall))
        {
            instance_destroy()
            instance_create(x, y, obj_hidecloud)
        }
        shake_screen(12)
        qu_wait(20)
        break
    case 14:
        with (instance_position((obj_demo_end_elevator.x + 64), (obj_demo_end_elevator.y - 16), obj_wall))
        {
            instance_destroy()
            instance_create(x, y, obj_hidecloud)
        }
        shake_screen(12)
        qu_wait(20)
        break
    case 15:
        qu_set_dialogmode()
        hud_text_set(125, 581, 2)
        qu_wait(10)
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(126, 581, 0)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(512, 356, 2)
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            global.lab_unlocked = 1
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

