switch state_step
{
    case 0:
        if (global.vents_cleared > 1)
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
        player_play()
        qu_reset()
        break
}

