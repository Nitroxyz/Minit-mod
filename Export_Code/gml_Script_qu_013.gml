switch state_step
{
    case 0:
        if (!instance_exists(obj_door_auto_U))
        {
            player_auto()
            qu_wait(1)
            obj_player.key_left = 1
            with (obj_door1_U)
                override_room_state_change = 1
        }
        break
    case 1:
        if (obj_player.x < 240)
        {
            player_auto()
            qu_set_dialogmode()
            qu_wait(1)
        }
        else
        {
            player_auto()
            obj_player.key_left = 1
        }
        break
    case 2:
        music_duck(0, 500)
        hud_text_set(183, 598, 3)
        qu_wait(1)
        with (obj_hotboy1)
            c_anim_load_anim(anim_idle)
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(184, 598, 0)
            qu_wait(1)
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, c_anim_index, 4)
                image_speed = 0.4
            }
        }
        break
    case 5:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_idle)
                image_speed = 0.2
            }
            hud_text_set(20, 356, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, c_anim_index)
                image_speed = 0.4
            }
            hud_text_set(185, 598, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_idle)
                image_speed = 0.2
            }
            hud_text_set(287, 356, 2)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_stun)
                image_speed = 0.4
            }
            hud_text_set(186, 598, 1)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk)
                image_speed = 0.4
            }
            hud_text_set(187, 598, 4)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_idle)
                image_speed = 0.2
            }
            hud_text_set(287, 356, 3)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            music_duck(1, 0)
            music_xfade(mu_hotboys, 0)
            hud_text_reset()
            player_play()
            qu_reset()
            with (obj_hotboy1)
            {
                process_hotboy_create_flows()
                state = 597
            }
        }
        break
}

