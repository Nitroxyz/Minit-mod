switch state_step
{
    case 0:
        qu_wait(1)
        break
    case 1:
        global.spikewall_complete_0 = 1
        global.events_completed++
        player_play()
        set_room_state(0)
        qu_reset()
        break
}

