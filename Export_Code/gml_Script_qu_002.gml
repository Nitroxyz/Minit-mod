switch state_step
{
    case 0:
        if (!instance_exists(obj_changeroom))
            qu_wait(1)
        break
    case 1:
        if (obj_player.x > 48)
        {
            qu_wait(1)
            player_auto()
        }
        if instance_exists(obj_changeroom)
            qu_reset()
        break
    case 2:
        obj_player.key_jump_held = 1
        obj_player.key_left = 1
        if (obj_player.grounded == 1)
        {
            qu_wait(20)
            obj_player.key_jump_held = 0
            obj_player.key_left = 0
        }
        break
    case 3:
        state_step = 5
        break
    case 5:
        hud_text_set("Kiki. Hey. #Just checking in.", 358, 2)
        qu_wait(1)
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set("See that platform over there?", 358, 0)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set("Stand on top of it #to SAVE progress.", 358, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set("You can also use it #to summon the Armor.", 358, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set("PRETTY COOL, HUH?", 358, 2)
            scr_flash(2, 2)
            shake_screen(20)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set("...", 356, 0)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set("...meow", 356, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set("...#just letting you know...", 358, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            player_play()
            hud_text_reset()
            qu_reset()
            set_room_state(0)
        }
        break
}

