switch state_step
{
    case 0:
        qu_wait(1)
        player_play()
        with (obj_door_auto_U)
        {
            trigger = 128
            dont_play_lockmusic = 1
        }
        break
    case 1:
        var flag = 1
        with (obj_hot_tube)
        {
            if (iindex != 2)
                flag = 0
        }
        if instance_exists(obj_door1_U)
            flag = 0
        if flag
        {
            if instance_exists(obj_player)
            {
                if obj_player.grounded
                {
                    qu_set_dialogmode()
                    player_auto()
                    qu_wait(1)
                    global.hot_room = 0
                    global.lava_cooled = 1
                    with (obj_hotlava)
                        event_perform(ev_other, ev_room_start)
                    with (obj_lavaflow_source)
                        instance_destroy()
                }
            }
        }
        break
    case 2:
        music_duck(0, 1000)
        hud_text_set(226, 358, 0)
        qu_wait(1)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(227, 358, 2)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(228, 356, 2)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(229, 358, 2)
            qu_wait(1)
            MUSIC_MANAGER.current_main_theme = 18
            music_xfade(mu_lava_cool, 0)
            music_duck(1, 3000)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(230, 358, 0)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            set_room_state(1)
            hud_text_reset()
            player_play()
            qu_reset()
            global.events_completed++
            if (!(get_bitwise_flag(global.abilities, 2)))
                achievement_set("ACH_SEQUENCE")
            achievement_set("ACH_LAVA")
        }
        break
}

