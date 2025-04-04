switch state
{
    case 1:
        if place_meeting(x, y, obj_player)
        {
            if (!instance_exists(obj_changeroom))
            {
                if (obj_player.cat == 0)
                {
                    if (audio_sound_get_gain(snd_amb1) > 0.3)
                        audio_sound_gain(snd_amb1, 0, 1000)
                    obj_player.control_state = 74
                    with (obj_door_auto_U)
                        state = 2
                }
            }
        }
        break
    case 2:
        break
}

