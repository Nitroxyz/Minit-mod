switch state_step
{
    case 0:
        scr_flash(0.3, 2)
        music_duck(0, 1000)
        if (!instance_exists(obj_mouse))
        {
            instance_create(((__view_get(2, 0)) - 64), ((__view_get(3, 0)) - 16), obj_mouse)
            with (obj_mouse)
            {
                image_speed = 0.1
                image_xscale = -1
                while place_meeting(x, y, obj_wall)
                    y--
            }
        }
        player_auto()
        qu_wait(1)
        var x_tube = 1000
        obj_mouse.tubeleft = self
        with (obj_lab_tube)
        {
            depth = 10
            water[0].depth = 11
            water[1].depth = 11
            water[2].depth = 11
            water[3].depth = 11
            water[4].depth = 11
            water[5].depth = 11
            if (x < x_tube)
            {
                obj_mouse.tubeleft = id
                x_tube = x
            }
        }
        with (obj_lab_tube)
        {
            if (x != x_tube)
                obj_mouse.tuberight = id
        }
        with (obj_tube_chain)
            depth = 11
        obj_mouse.sprite_index = spr_mouse_run
        obj_mouse.image_speed = 0.2
        break
    case 1:
        obj_mouse.x -= 0.5
        obj_mouse.x = max(152, obj_mouse.x)
        if (obj_mouse.x == 152)
        {
            obj_mouse.sprite_index = spr_mouse_idle
            obj_mouse.image_speed = 0.15
        }
        if (obj_player.grounded && obj_player.x < 80)
            obj_player.key_right = 1
        else
        {
            player_auto()
            if (obj_mouse.x == 152)
            {
                music_xfade(mu_suspense, 0)
                music_duck(1, 500)
                qu_wait(30)
            }
        }
        break
    case 2:
        if global.finalboss_dialogskip
            state_step = 44
        else
        {
            hud_text_set(291, 357, 1)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(20, 356, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(292, 357, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(293, 357, 1)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(294, 357, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(295, 357, 1)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(296, 357, 0)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(297, 357, 0)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(298, 357, 0)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(299, 357, 4)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(300, 357, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(301, 357, 0)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(302, 357, 0)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(303, 357, 4)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.25, 1)
            shake_screen(10)
            hud_text_set(304, 357, 3)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(305, 357, 0)
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set(306, 357, 0)
            qu_wait(1)
        }
        break
    case 19:
        if qu_trigger()
        {
            hud_text_set(307, 357, 1)
            qu_wait(1)
        }
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set(308, 357, 0)
            qu_wait(1)
        }
        break
    case 21:
        if qu_trigger()
        {
            hud_text_set(309, 357, 0)
            qu_wait(1)
        }
        break
    case 22:
        if qu_trigger()
        {
            hud_text_set(310, 357, 4)
            qu_wait(1)
        }
        break
    case 23:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 24:
        if qu_trigger()
        {
            hud_text_set(311, 357, 0)
            qu_wait(1)
        }
        break
    case 25:
        if qu_trigger()
        {
            hud_text_set(312, 357, 1)
            qu_wait(1)
        }
        break
    case 26:
        if qu_trigger()
        {
            hud_text_set(313, 357, 0)
            qu_wait(1)
        }
        break
    case 27:
        if qu_trigger()
        {
            hud_text_set(314, 357, 0)
            qu_wait(1)
        }
        break
    case 28:
        if qu_trigger()
        {
            hud_text_set(315, 357, 0)
            qu_wait(1)
        }
        break
    case 29:
        if qu_trigger()
        {
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.25, 1)
            shake_screen(10)
            hud_text_set(316, 357, 3)
            qu_wait(1)
        }
        break
    case 30:
        if qu_trigger()
        {
            hud_text_set(287, 356, 0)
            qu_wait(1)
        }
        break
    case 31:
        if qu_trigger()
        {
            hud_text_set(317, 357, 0)
            qu_wait(1)
        }
        break
    case 32:
        if qu_trigger()
        {
            hud_text_set(318, 357, 0)
            qu_wait(1)
        }
        break
    case 33:
        if qu_trigger()
        {
            hud_text_set(319, 357, 0)
            qu_wait(1)
        }
        break
    case 34:
        if qu_trigger()
        {
            hud_text_set(320, 357, 0)
            qu_wait(1)
        }
        break
    case 35:
        if qu_trigger()
        {
            hud_text_set(321, 357, 1)
            qu_wait(1)
        }
        break
    case 36:
        if qu_trigger()
        {
            hud_text_set(322, 357, 4)
            qu_wait(1)
        }
        break
    case 37:
        if qu_trigger()
        {
            hud_text_set(323, 357, 0)
            qu_wait(1)
        }
        break
    case 38:
        if qu_trigger()
        {
            hud_text_set(20, 356, 0)
            qu_wait(1)
        }
        break
    case 39:
        if qu_trigger()
        {
            hud_text_set(325, 357, 1)
            qu_wait(1)
        }
        break
    case 40:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 41:
        if qu_trigger()
        {
            hud_text_set(511, 357, 0)
            qu_wait(1)
        }
        break
    case 42:
        if qu_trigger()
        {
            hud_text_set(327, 357, 0)
            music_duck(0, 400)
            qu_wait(1)
        }
        break
    case 43:
        if qu_trigger()
        {
            hud_text_reset()
            obj_mouse.sprite_index = spr_mouse_run
            obj_mouse.image_index = 1
            obj_mouse.image_speed = 0.2
            qu_wait(1)
            audio_play_sound(bgm_boss_stab, 100, false)
            shake_screen(25)
        }
        break
    case 44:
        if (abs((obj_mouse.x - (obj_mouse.tubeleft.x + 8)) > 1) || abs((obj_mouse.y - (obj_mouse.tubeleft.y + 30)) > 2))
        {
            obj_mouse.x = lerp(obj_mouse.x, (obj_mouse.tubeleft.x + 8), 0.08)
            obj_mouse.y = lerp(obj_mouse.y, (obj_mouse.tubeleft.y + 30), 0.08)
        }
        else
        {
            obj_mouse.x = obj_mouse.tubeleft.x + 8
            obj_mouse.y = obj_mouse.tubeleft.y + 30
            obj_mouse.float_y = obj_mouse.y
            obj_mouse.state = 284
            obj_mouse.sprite_index = spr_mouse_float
            obj_mouse.image_speed = 0.025
            scr_flash(0.5, 12)
            shake_screen(20)
            qu_wait(60)
        }
        break
    case 45:
        shake_screen(20)
        qu_wait(60)
        scr_flash(0.5, 1)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 46:
        shake_screen(20)
        qu_wait(40)
        scr_flash(0.5, 1)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 47:
        shake_screen(20)
        qu_wait(40)
        scr_flash(0.5, 1)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 48:
        shake_screen(20)
        qu_wait(20)
        scr_flash(0.25, 2)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 49:
        shake_screen(20)
        qu_wait(20)
        scr_flash(0.25, 2)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 50:
        shake_screen(10)
        qu_wait(10)
        scr_flash(0.25, 1)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 51:
        shake_screen(10)
        qu_wait(10)
        scr_flash(0.25, 1)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 52:
        shake_screen(10)
        qu_wait(10)
        scr_flash(0.25, 1)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 53:
        shake_screen(10)
        qu_wait(30)
        scr_flash(0.25, 1)
        audio_play_sound(bgm_boss_stab, 100, false)
        break
    case 54:
        qu_wait(1)
        with (obj_mouse.tuberight)
            process_break_lab_tube()
        with (obj_gary_in_tube)
            vspd = -1
        break
    case 55:
        var flag = 0
        with (obj_gary_in_tube)
        {
            y += vspd
            vspd += 0.05
            x = approach(x, 152, 0.25)
            if (place_meeting(x, y, obj_wall) && y > 150)
            {
                flag = 1
                sprite_index = spr_gary_hurt_panting
                y += 16
                while place_meeting(x, y, obj_wall)
                    y--
                image_xscale = -1
            }
        }
        if flag
            qu_wait(30)
        break
    case 56:
        flag = 0
        if (!audio_is_playing(snd_retract_tube))
            audio_play_sound(snd_retract_tube, 100, false)
        if (!instance_exists(obj_shake))
            shake_screen(5)
        with (obj_lab_tube)
        {
            y--
            if (y == -48)
                flag = 1
            if instance_exists(sidewall_a)
                sidewall_a.y--
            else
                inactive = 1
            if instance_exists(sidewall_b)
                sidewall_b.y--
            bottom.y--
            top.y--
        }
        with (obj_tube_chain)
            y--
        with (obj_mouse)
            float_y--
        with (obj_water_bubble)
            y--
        with (WATER)
            y--
        with (obj_drip_splash)
            y--
        if flag
            qu_wait(30)
        break
    case 57:
        flag = 0
        with (obj_gary_in_tube)
        {
            if (sprite_index != spr_gary_standup)
            {
                iindex = 0
                sprite_index = spr_gary_standup
                image_speed = 0.1
            }
            else if ((iindex + image_speed * 2) >= sprite_get_number(spr_gary_standup))
            {
                sprite_index = spr_gary_front_idle
                iindex = 0
                flag = 1
            }
        }
        if flag
        {
            shake_screen(30)
            qu_wait(60)
            scr_flash(0.25, 4)
            audio_play_sound(bgm_boss_stab, 100, false)
        }
        break
    case 58:
        with (obj_gary_in_tube)
        {
            sprite_index = spr_gary_levitate
            image_speed = 0
            iindex = 0
            other.state_step = 58.4
        }
        break
    case 58.4:
        with (obj_gary_in_tube)
        {
            if (iindex < 1)
                iindex += 0.025
            else
            {
                iindex = 1
                obj_boss_gary_pod_weak.state = 666
                vspd = -4
                other.state_step = 58.5
            }
        }
        break
    case 58.5:
        with (obj_gary_in_tube)
        {
            if (vspd > 1)
            {
                iindex = 2
                y = min((y + vspd), 100)
            }
            else
            {
                vspd += 0.08
                y += vspd
            }
        }
        break
    case 59:
        with (obj_mouse)
            instance_destroy()
        global.finalboss_dialogskip = 1
        set_room_state(1)
        qu_reset()
        break
}

