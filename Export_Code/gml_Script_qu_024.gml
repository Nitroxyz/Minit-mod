switch state_step
{
    case 0:
        var flag = 0
        if (MAP_MANAGER.map_current == "map4")
        {
            if (global.spikewall_complete_0 == 1)
                flag = 1
        }
        else if (global.spikewall_complete_1 == 1)
            flag = 1
        if flag
        {
            if instance_exists(obj_spikewall)
            {
                obj_spikewall.x = obj_camera.xmax + 10
                obj_spikewall.spikes.x = obj_spikewall.x + 16
                obj_spikewall.active_timer = 0
            }
            player_play()
            qu_reset()
        }
        else
        {
            audio_play_sound(snd_spikewall_startup, 100, false)
            music_duck(0, 1000)
            qu_wait(1)
        }
        break
    case 1:
        if instance_exists(obj_spikewall)
        {
            if obj_spikewall.is_active
            {
                audio_play_sound(snd_spikewall_loop, 100, true)
                music_duck(1, 0)
                music_xfade(mu_vent_chase, 0)
                player_play()
                qu_reset()
            }
            else
                player_auto()
        }
        else
        {
            player_play()
            qu_reset()
        }
        break
}

