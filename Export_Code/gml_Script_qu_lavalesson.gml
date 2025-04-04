switch state_step
{
    case 0:
        qu_wait(1)
        break
    case 1:
        if instance_exists(obj_demo_end_elevator)
        {
            if (obj_demo_end_elevator.state == 4)
            {
                qu_set_dialogmode()
                player_auto()
                qu_wait(1)
            }
        }
        break
    case 2:
        hud_text_set("Hey Kiki... looks like#you found the Heater Core.", 358, 0)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set("This area is.. umm...", 358, 1)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set("Really hot!", 358, 2)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set("You're going to want to stay#inside the mech for now.", 358, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set("...", 356, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set("It's not safe for you#out there, ok?", 358, 0)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set("meow...", 356, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set("Kiki, once it cools down,#you can play all you want.", 358, 0)
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
            hud_text_set("Be safe, kitty...", 358, 2)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set("Over and out.", 358, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            set_room_state(0)
            save_savefile()
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

