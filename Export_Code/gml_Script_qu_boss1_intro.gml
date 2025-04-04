switch state_step
{
    case 0:
        player_auto()
        qu_face(obj_player, 1)
        player_updategundir()
        instance_create(((__view_get(2, 0)) - 60), ((__view_get(3, 0)) - 16), obj_mouse)
        with (obj_mouse)
        {
            image_speed = 0.1
            while place_meeting(x, y, obj_wall)
                y--
        }
        hud_text_set(20, 356, 0)
        qu_wait(30)
        break
    case 1:
        if qu_trigger()
        {
            hud_text_set(50, 357, 0)
            qu_wait(40)
            obj_mouse.sprite_index = spr_mouse_run
            obj_mouse.image_speed = 0.2
        }
        break
    case 1.5:
        obj_mouse.x -= 0.5
        break
    case 2:
        obj_mouse.sprite_index = spr_mouse_idle
        obj_mouse.image_speed = 0.15
        if qu_trigger()
        {
            hud_text_set(51, 356, 0)
            qu_wait(45)
            obj_player.key_right = 1
        }
        break
    case 3:
        obj_player.key_right = 0
        if qu_trigger()
        {
            hud_text_set(52, 357, 3)
            qu_wait(20)
            shake_screen(20)
            scr_flash(0.4, 3)
            obj_mouse.image_speed = 0.2
            obj_player.key_right = 1
        }
        break
    case 3.5:
        obj_mouse.x += 1
        break
    case 4:
        obj_player.key_right = 0
        if qu_trigger()
        {
            hud_text_set(53, 358, 3)
            qu_wait(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.25, 1)
            shake_screen(10)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(52, 357, 2)
            qu_wait(20)
            obj_mouse.image_speed = 0.25
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.3, 2)
            shake_screen(15)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(54, 358, 1)
            qu_wait(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.5, 6)
            shake_screen(20)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(55, 357, 3)
            obj_mouse.sprite_index = spr_mouse_run
            obj_mouse.image_index = 1
            obj_mouse.image_speed = 0
            qu_wait(10)
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.2, 8)
            shake_screen(25)
            obj_player.key_right = 1
        }
        break
    case 8:
        if (abs(obj_mouse.x - (__view_get(2, 0)) / 2 - 4) > 1)
        {
            obj_mouse.x = lerp(obj_mouse.x, ((__view_get(2, 0)) / 2 - 4), 0.13)
            obj_mouse.y = lerp(obj_mouse.y, ((__view_get(3, 0)) / 2 - 4), 0.13)
        }
        else
        {
            obj_player.key_right = 0
            scr_flash(0.5, 12)
            music_duck(1, 0)
            music_play(mu_boss)
            qu_wait(20)
            hud_text_reset()
        }
        break
    case 9:
        qu_face(obj_player, -1)
        player_updategundir()
        with (obj_mouse)
            instance_destroy()
        with (obj_boss1)
        {
            alarm[11] = 300
            xtar = x
            hspd = 0
            ytar = y
            vspd = -4
            state = 420
            init = 1
            visible = true
            head.visible = true
            head.ant.visible = true
            instance_activate_object(arm_l)
            instance_activate_object(arm_r)
            instance_activate_object(leg_l)
            instance_activate_object(leg_r)
            instance_activate_object(leg_l.foot)
            instance_activate_object(leg_r.foot)
            leg_l.visible = true
            leg_r.visible = true
            arm_l.visible = true
            arm_r.visible = true
        }
        player_play()
        qu_reset()
        break
}

