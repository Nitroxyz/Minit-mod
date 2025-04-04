switch state
{
    case 0:
        if place_meeting(x, y, obj_player)
        {
            iindex = 1
            state = 1
        }
        break
    case 1:
        if place_meeting(x, y, obj_player)
        {
            if (obj_player.grounded == 1)
            {
                audio_play_sound(snd_savepoint_stepon, 100, false)
                iindex = 2
                state = 2
                pressed = 1
            }
        }
        else
        {
            iindex = 0
            state = 0
        }
        break
    case 2:
        if instance_exists(obj_player)
        {
            pressed = 0
            if (!obj_player.grounded)
            {
                audio_play_sound(snd_savepoint_stepoff, 100, false)
                state = 3
            }
        }
        break
    case 3:
        animate_actor()
        if (floor(iindex) == 0)
        {
            state = 0
            iindex = 0
        }
        if place_meeting(x, y, obj_wall)
        {
            iindex = 1
            state = 1
        }
        break
}

