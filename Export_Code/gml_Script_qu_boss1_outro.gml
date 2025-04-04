switch state_step
{
    case 0:
        if instance_exists(obj_player)
        {
            if (!instance_exists(obj_mouse))
                instance_create(obj_boss1.head.x, obj_boss1.head.y, obj_mouse)
            if audio_is_playing(RailBossRailmovement)
                audio_stop_sound(RailBossRailmovement)
            if audio_is_playing(RailBossExtened)
                audio_stop_sound(RailBossExtened)
            music_duck(0, 0)
            player_auto()
            audio_play_sound(snd_mouse_deathcry, 100, false)
            global.boss_hud_active = 0
            global.boss_hud_target = -1
            with (obj_mouse)
            {
                sprite_index = spr_mouse_run
                image_speed = 0
                image_index = 2
                vspd = -1
            }
            if (obj_player.x > ((__view_get(2, 0)) / 2))
            {
                qu_face(obj_player, -1)
                player_updategundir()
                qu_face(obj_mouse, 1)
                obj_mouse.xtar = 40
            }
            else
            {
                qu_face(obj_player, 1)
                player_updategundir()
                qu_face(obj_mouse, -1)
                obj_mouse.xtar = (__view_get(2, 0)) - 40
            }
            scr_flash(0.6, 10)
            with (obj_boss1)
                instance_destroy()
            hud_text_set(56, 357, 2)
            shake_screen(40)
            qu_wait(20)
        }
        break
    case 0.5:
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 1:
        with (obj_mouse)
        {
            x = lerp(x, xtar, 0.1)
            if (!(place_meeting(x, (y + round(vspd)), obj_wall)))
            {
                y += round(vspd)
                vspd += 0.25
            }
            else
            {
                while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
                    y += sign(vspd)
                hud_text_set(57, 357, 3)
                shake_screen(10)
                sprite_index = spr_mouse_idle
                image_speed = 0.1
                qu_wait(10)
                room_speed = 60
                if irandom(0)
                {
                    if (!instance_exists(obj_hidecloud))
                        instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
                    shake_screen(4)
                }
            }
        }
        break
    case 1.5:
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(58, 357, 0)
            qu_wait(10)
        }
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 2.5:
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(59, 356, 0)
            qu_wait(20)
        }
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 3.5:
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 4:
        with (obj_mouse)
        {
            instance_destroy()
            instance_create(x, y, obj_hidecloud)
            instance_create(x, (y + 4), obj_dustcloud)
            instance_create((x + 4), y, obj_bubble)
            instance_create((x - 4), y, obj_bubble)
            qu_wait(30)
            shake_screen(20)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(60, 358, 1)
            qu_wait(10)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(61, 358, 1)
            qu_wait(10)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(62, 358, 0)
            qu_wait(10)
        }
        break
    case 8:
        if qu_trigger()
        {
            set_room_state(1)
            global.center_player_position = 1
            achievement_set("ACH_RATS")
            save_savefile()
            with (obj_boss1_head)
                instance_destroy()
            hud_text_reset()
            qu_wait(10)
        }
        break
    case 9:
        qu_reset()
        global.events_completed++
        break
}

