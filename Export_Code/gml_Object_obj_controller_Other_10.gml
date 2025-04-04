switch state
{
    case "game":
        break
    default:
        if (!instance_exists(obj_player))
        {
            if ((!instance_exists(obj_particle1)) && (!instance_exists(obj_rocketboom)))
            {
                if (!instance_exists(obj_respawn_fade))
                    instance_create(0, 0, obj_respawn_fade)
                return;
            }
        }
        else
        {
            script_execute(state)
            if (alarm[1] >= 0)
            {
                alarm[1]--
                if (alarm[1] == -1)
                    state_step += 0.5
            }
        }
        break
}

