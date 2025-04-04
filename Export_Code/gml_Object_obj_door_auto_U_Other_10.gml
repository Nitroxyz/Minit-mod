switch state
{
    case 1:
        if place_meeting(x, y, obj_player)
        {
            if (!instance_exists(obj_changeroom))
            {
                if (global.allow_cat_doors || obj_player.cat == 0)
                {
                    if (dont_play_lockmusic == 0)
                        music_duck(0, 500)
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

