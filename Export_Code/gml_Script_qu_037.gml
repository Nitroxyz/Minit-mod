switch state_step
{
    case 0:
        player_play()
        if (MAP_MANAGER.map_current == "map2")
            qu_wait(1)
        else
            state_step = 5
        break
    case 1:
        var flag = 0
        with (obj_info_console_button)
        {
            if pressed
                flag = 1
        }
        if flag
        {
            with (obj_wall12)
            {
                if default_state
                {
                    default_state = 0
                    image_speed = 0.2
                }
                else
                {
                    default_state = 1
                    image_speed = 1
                }
            }
            with (obj_wall12_nocollider)
            {
                if default_state
                {
                    default_state = 0
                    image_speed = 0.2
                }
                else
                {
                    default_state = 1
                    image_speed = 1
                }
            }
            qu_set_dialogmode()
            player_auto()
            hud_text_set(259, 359, irandom(3))
            qu_wait(1)
        }
        break
    case 2:
        hud_portrait_set(359, irandom(3))
        if qu_trigger()
        {
            hud_text_set(591, 681, irandom(3))
            qu_wait(1)
        }
        break
    case 3:
        hud_portrait_set(681, irandom(3))
        if qu_trigger()
        {
            hud_text_set(287, 356, 10)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_wait(1)
        }
        break
    case 5:
        flag = 0
        with (obj_info_console_button)
        {
            if pressed
                flag = 1
        }
        if flag
        {
            with (obj_wall12)
            {
                if default_state
                {
                    default_state = 0
                    image_speed = 0.2
                }
                else
                {
                    default_state = 1
                    image_speed = 1
                }
            }
            with (obj_wall12_nocollider)
            {
                if default_state
                {
                    default_state = 0
                    image_speed = 0.2
                }
                else
                {
                    default_state = 1
                    image_speed = 1
                }
            }
        }
        break
}

