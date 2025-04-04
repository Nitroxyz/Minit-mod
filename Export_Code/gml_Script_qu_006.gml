switch state_step
{
    case 0:
        if (global.water_level > 1)
            process_drain_water()
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

