switch state_step
{
    case 0:
        player_auto()
        qu_wait(1)
        break
    case 1:
        if (!instance_exists(obj_door1_U))
        {
            player_play()
            global.center_player_position = 1
            global.cur_hp = global.max_hp
            save_savefile()
            qu_reset()
        }
        break
}

