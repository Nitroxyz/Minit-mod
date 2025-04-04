switch state_step
{
    case 0:
        player_play()
        qu_wait(1)
        with (obj_carrybot_fan)
        {
            override_carryobj = 424
            pause_creation = 1
        }
        break
    case 1:
        if instance_exists(obj_info_console_button)
        {
            if obj_info_console_button.pressed
            {
                activate_xmas_stuff()
                player_auto()
                qu_wait(20)
            }
        }
        break
    case 2:
        qu_set_dialogmode()
        player_auto()
        hud_text_set_ext("Merry Christmas, Kiki!", 358, 2, "wavy")
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set("Meow!", 356, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set_ext("Kiki, look out above!#INCOMING!", 358, 1, "nervous")
            qu_wait(30)
        }
        break
    case 5:
        with (obj_carrybot_fan)
            pause_creation = 0
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_wait(1)
        }
        break
    case 6:
        if (!instance_exists(obj_enemy))
        {
            hud_text_set("That's my kitty!!", 358, 2)
            player_auto()
            obj_player.key_dismount = 1
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            player_auto()
            obj_player.key_jump = 1
            hud_text_set("Meow!", 356, 2)
            qu_wait(1)
        }
        break
    case 7.5:
        player_auto()
        break
    case 8:
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_wait(1)
        }
        break
}

