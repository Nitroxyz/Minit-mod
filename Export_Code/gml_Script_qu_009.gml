switch state_step
{
    case 0:
        if (global.water_level > 2)
        {
            process_drain_water()
            qu_reset()
            player_play()
        }
        else
        {
            if instance_exists(obj_boss2_sub)
            {
                player_auto()
                with (obj_boss2_sub)
                {
                    state = 2
                    visible = false
                }
                with (obj_boss2_claw)
                    visible = false
                with (obj_boss2_arm_segment)
                    visible = false
                with (obj_boss2_body_seg)
                    visible = false
                with (obj_boss2_claw)
                    visible = false
            }
            if (!instance_exists(obj_changeroom))
                state_step = 0.5
        }
        break
    case 0.5:
        if instance_exists(obj_boss2_sub)
        {
            music_duck(0, 2000)
            player_auto()
            state_step = 1
        }
        else
        {
            qu_reset()
            player_play()
        }
        break
    case 1:
        with (obj_boss2_sub)
        {
            state = 2
            visible = false
        }
        player_auto()
        qu_wait(15)
        break
    case 2:
        if (obj_player.x < 64)
            obj_player.key_right = 1
        else
        {
            obj_player.key_right = 0
            qu_set_dialogmode()
            hud_text_set(161, 358, 0)
            state_step = 2.1
        }
        break
    case 2.1:
        if qu_trigger()
        {
            hud_text_set_ext(20, 356, 1, "nervous")
            state_step = 2.2
        }
        break
    case 2.2:
        if qu_trigger()
        {
            instance_create(obj_boss2_sub.x, obj_boss2_sub.y, obj_mouse)
            with (obj_mouse)
            {
                image_speed = 0.1
                instance_create(x, y, obj_hidecloud)
                state = 284
                sprite_index = spr_mouse_swim
                float_y = y
                angle = 0
                angle_speed = 0.05235987755982988
                y = float_y + 3 * sin(angle)
            }
            shake_screen(10)
            hud_text_set(162, 357, 0)
            state_step = 2.3
        }
        break
    case 2.3:
        if qu_trigger()
        {
            shake_screen(20)
            hud_text_set(163, 358, 3)
            state_step = 2.4
        }
        break
    case 2.4:
        if qu_trigger()
        {
            hud_text_set(164, 357, 1)
            state_step = 2.5
        }
        break
    case 2.5:
        if qu_trigger()
        {
            hud_text_set(165, 358, 1)
            state_step = 2.6
        }
        break
    case 2.6:
        if qu_trigger()
        {
            hud_text_set(20, 356, 0)
            state_step = 2.7
        }
        break
    case 2.7:
        if qu_trigger()
        {
            shake_screen(10)
            hud_text_set(166, 358, 4)
            state_step = 2.9
        }
        break
    case 2.9:
        if (!instance_exists(obj_shake))
            shake_screen(6)
        if qu_trigger()
        {
            hud_text_reset()
            instance_create(0, 0, work_boss2_remove_walls)
            state_step = 3
        }
        break
    case 3:
        if (work_boss2_remove_walls.state == 3)
        {
            qu_wait(30)
            with (obj_mouse)
                instance_destroy()
        }
        break
    case 4:
        player_play()
        music_duck(1, 0)
        music_xfade(mu_boss2, 0)
        obj_boss2_sub.state = obj_boss2_sub.init_state
        qu_reset()
        break
}

