switch state_step
{
    case 0:
        if instance_exists(obj_player)
        {
            if (!instance_exists(obj_mouse))
                instance_create(obj_boss_vent.x, obj_boss_vent.y, obj_mouse)
            music_duck(0, 0)
            audio_play_sound(snd_mouse_deathcry, 100, false)
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
                obj_mouse.xtar = 72
            }
            else
            {
                qu_face(obj_player, 1)
                player_updategundir()
                qu_face(obj_mouse, -1)
                obj_mouse.xtar = (__view_get(2, 0)) - 72
            }
            scr_flash(0.6, 10)
            with (obj_boss_vent)
                instance_destroy()
            hud_text_set(250, 357, 2)
            shake_screen(40)
            qu_wait(20)
        }
        break
    case 0.5:
        player_auto()
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
            if (y < 100 || (!(place_meeting(x, (y + round(vspd)), obj_wall))))
            {
                y += round(vspd)
                vspd += 0.25
            }
            else
            {
                while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
                    y += sign(vspd)
                hud_text_set(251, 357, 3)
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
            hud_text_set(252, 357, 0)
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
            hud_text_set(253, 358, 4)
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
        if qu_trigger()
        {
            hud_text_set(254, 357, 0)
            qu_wait(20)
        }
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 4.5:
        if irandom(0)
        {
            if (!instance_exists(obj_hidecloud))
                instance_create(obj_mouse.x, obj_mouse.y, obj_hidecloud)
            shake_screen(4)
        }
        break
    case 5:
        if qu_trigger()
        {
            with (obj_mouse)
            {
                instance_destroy()
                hud_text_set(255, 357, 0)
                instance_create(x, y, obj_hidecloud)
                instance_create(x, (y + 4), obj_dustcloud)
                instance_create((x + 4), y, obj_bubble)
                instance_create((x - 4), y, obj_bubble)
                qu_wait(30)
                shake_screen(20)
            }
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(256, 358, 1)
            qu_wait(10)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(257, 358, 1)
            qu_wait(10)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(258, 358, 0)
            qu_wait(10)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_reset()
            qu_wait(10)
            global.center_player_position = 1
            global.cur_hp = global.max_hp
            save_savefile()
        }
        break
    case 10:
        qu_reset()
        player_play()
        global.events_completed++
        break
}

