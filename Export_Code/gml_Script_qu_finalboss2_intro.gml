switch state_step
{
    case 0:
        music_duck(0, 1000)
        player_auto()
        qu_wait(30)
        var x_tube = 1000
        tubeleft = -1
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
                other.tubeleft = id
                x_tube = x
            }
        }
        with (obj_lab_tube)
        {
            if (x != x_tube)
                other.tuberight = id
        }
        with (obj_tube_chain)
            depth = 11
        with (obj_barkley_in_tube)
            depth = 12
        break
    case 1:
        if obj_player.grounded
        {
            if (obj_player.x < 80)
                obj_player.key_right = 1
            else
            {
                player_auto()
                music_xfade(mu_suspense, 0)
                music_duck(1, 1000)
                qu_wait(60)
            }
        }
        break
    case 2:
        hud_text_set(328, 358, 6)
        qu_wait(1)
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
            hud_text_set(329, 358, 6)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(330, 358, 7)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(331, 358, 8)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(512, 356, 4)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(332, 358, 9)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(333, 358, 8)
            state_step = 9.5
        }
        break
    case 9.5:
        if qu_trigger()
        {
            hud_text_reset()
            state_step = 10
        }
        break
    case 10:
        var flag = 0
        if (!audio_is_playing(snd_retract_tube))
            audio_play_sound(snd_retract_tube, 100, false)
        if (!instance_exists(obj_shake))
            shake_screen(5)
        with (obj_lab_tube)
        {
            y--
            if (y == -48)
            {
                flag = 1
                shake_screen(40)
                audio_play_sound(snd_treadmill_stop, 100, false)
            }
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
        with (obj_water_bubble)
            y--
        with (WATER)
            y--
        with (obj_barkley_in_tube)
            y_float--
        with (obj_drip_splash)
            y--
        if flag
            qu_wait(30)
        break
    case 11:
        hud_text_set(334, 358, 7)
        qu_wait(1)
        break
    case 12:
        flag = 0
        with (obj_gary_on_ground)
        {
            if (sprite_index != spr_gary_standup)
            {
                iindex = 0
                sprite_index = spr_gary_standup
                image_speed = 0.1
            }
            else if ((iindex + image_speed * 2) >= sprite_get_number(spr_gary_standup))
            {
                image_speed = 0
                image_xscale = -1
            }
            if (image_speed == 0)
                flag = 1
        }
        if (flag && qu_trigger())
        {
            hud_text_set(335, 358, 8)
            qu_wait(1)
        }
        break
    case 13:
        flag = 0
        with (obj_gary_on_ground)
        {
            if (sprite_index != spr_gary_gun_pull && sprite_index != spr_gary_gun_idle)
            {
                x -= 2
                iindex = 0
                sprite_index = spr_gary_gun_pull
                image_speed = 0.1
            }
            else if ((iindex + image_speed * 2) >= sprite_get_number(spr_gary_gun_pull))
            {
                if (sprite_index != spr_gary_gun_idle)
                {
                    sprite_index = spr_gary_gun_idle
                    y += 8
                    image_xscale = -1
                }
            }
            if (sprite_index == spr_gary_gun_idle)
                flag = 1
        }
        if (flag && qu_trigger())
        {
            hud_text_set(336, 358, 8)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(26, 356, 3)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(337, 358, 7)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_reset()
            qu_wait(30)
        }
        break
    case 17:
        instance_create(obj_gary_on_ground.x, obj_gary_on_ground.y, obj_boss_gary)
        with (obj_gary_on_ground)
            y -= 1000
        player_play()
        music_duck(1, 0)
        music_xfade(mu_gary_boss, 0)
        set_room_state(1)
        qu_reset()
        break
}

