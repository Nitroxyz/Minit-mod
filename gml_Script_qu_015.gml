switch state_step
{
    case 0:
        if (global.flows_cleared > 1)
        {
            with (obj_hotlava_flow)
                instance_destroy()
        }
        qu_wait(1)
        break
    case 1:
        if (!instance_exists(obj_changeroom))
        {
            qu_reset()
            player_play()
        }
        break
}

