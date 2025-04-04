switch state_step
{
    case 0:
        if (!instance_exists(obj_changeroom))
        {
            qu_wait(1)
            music_duck(0.7, 500)
            player_auto()
            qu_set_dialogmode()
            obj_player.key_left = 1
        }
        break
    case 1:
        if (obj_player.x < 270)
        {
            if obj_player.grounded
                qu_wait(30)
            obj_player.key_left = 0
        }
        break
    case 2:
        hud_text_set("Hey Kiki...", 358, 1)
        qu_wait(10)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set("Meow?", 356, 2)
            qu_wait(10)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set("You see that elevator #over there?", 358, 1)
            qu_wait(10)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set("Judging from these maps... #the main complex is below us.", 358, 0)
            qu_wait(30)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set("You know what that #means, right?", 358, 1)
            qu_wait(30)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set("I hope you enjoyed the DEMO!", 358, 2)
            qu_wait(30)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set("...", 356, 3)
            qu_wait(30)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set("...", 358, 3)
            qu_wait(30)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set("Anyway...", 358, 0)
            qu_wait(20)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set("OVER AND OUT.", 358, 2)
            shake_screen(20)
            qu_wait(30)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set("MEOW!", 356, 2)
            obj_player.key_jump = 1
            obj_player.key_jump_held = 1
            qu_wait(10)
        }
        break
    case 12.5:
        obj_player.key_jump = 0
        break
    case 13:
        obj_player.key_jump_held = 0
        if obj_player.grounded
        {
            obj_hud.dialog_off = 1
            qu_wait(5)
        }
        break
    case 14:
        if (obj_demo_end_elevator.state == 0)
        {
            if (obj_player.x > (obj_demo_end_elevator.x + 40))
            {
                obj_player.key_right = 0
                obj_player.key_left = 1
            }
            else
            {
                obj_player.key_left = 0
                obj_player.key_right = 1
            }
        }
        else
        {
            obj_player.key_left = 0
            obj_player.key_right = 0
            qu_reset()
            hud_text_reset()
        }
        break
}

