switch state_step
{
    case 0:
        player_auto()
        qu_wait(1)
        with (obj_lavaflow_source)
            instance_destroy()
        break
    case 1:
        if instance_exists(obj_player)
        {
            if obj_player.grounded
            {
                player_auto()
                qu_set_dialogmode()
                qu_wait(1)
            }
        }
        break
    case 2:
        music_duck(0, 0)
        hud_text_set(188, 599, 2)
        qu_wait(1)
        with (obj_hotboy1)
            c_anim_load_anim(anim_stun)
        break
    case 3:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, anim_idle, 4)
                image_speed = 0.4
            }
            hud_text_set(189, 599, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, anim_idle, 1)
                image_speed = 0.4
            }
            hud_text_set(190, 599, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, anim_idle, 4)
                image_speed = 0.4
            }
            hud_text_set(191, 599, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, anim_idle)
                image_speed = 0.4
            }
            hud_text_set(192, 599, 4)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, anim_idle)
                image_speed = 0.4
            }
            hud_text_set(193, 599, 4)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, anim_idle)
                image_speed = 0.4
            }
            hud_text_set(194, 599, 4)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                c_anim_load_anim(anim_talk, anim_idle)
                image_speed = 0.4
            }
            hud_text_set(195, 599, 4)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            with (obj_hotboy1)
            {
                hotboy_shatter_glass()
                global.flows_cleared = 1
                visible = true
                sprite_index = spr_hotboy_destroyed
                bottom.visible = true
                shake_screen(30)
            }
            with (obj_custom7)
                instance_destroy()
            with (obj_custom8)
                instance_destroy()
            with (obj_custom9)
                instance_destroy()
            set_room_state(4)
            qu_wait(1)
        }
        break
    case 11:
        if (!instance_exists(obj_door1_U))
        {
            player_auto()
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 12:
        player_auto()
        if qu_trigger()
        {
            hud_text_reset()
            qu_wait(1)
            global.center_player_position = 1
        }
        break
    case 13:
        music_duck(1, 0)
        music_xfade(MUSIC_MANAGER.current_main_theme, 1000)
        player_play()
        qu_reset()
        global.events_completed++
        save_savefile()
        break
}

