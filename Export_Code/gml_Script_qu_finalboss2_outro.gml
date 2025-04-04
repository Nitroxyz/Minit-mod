switch state_step
{
    case 0:
        if (obj_boss_gary.state == 658)
            state_step = 0.5
        break
    case 0.5:
        var flag = 1
        player_auto()
        if instance_exists(obj_player)
        {
            if (!instance_exists(obj_rocketboom_no_damage))
            {
                GAME_MANAGER.pause_frames = 8
                audio_play_sound(snd_cat_deathcry, 100, false)
                instance_create((obj_player.x - 12 + irandom(24)), (obj_player.y - 12 + irandom(24)), obj_rocketboom_no_damage)
            }
            if (!instance_exists(obj_shake))
                shake_screen(10)
            obj_player.alarm[3] = 60
            if obj_player.grounded
            {
            }
            else
                flag = 0
        }
        with (obj_boss_gary)
        {
            if (state == 2)
            {
                if (x != obj_gary_on_ground.x)
                {
                    x = approach(x, obj_gary_on_ground.x, 1)
                    sprite_index = spr_gary_run
                    if (abs(x - obj_gary_on_ground.x) < 1)
                    {
                        x = obj_gary_on_ground.x
                        sprite_index = spr_gary_idle
                    }
                    flag = 0
                }
                else
                {
                    instance_destroy()
                    obj_gary_on_ground.y = obj_gary_on_ground.ystart + 8
                }
            }
            else
                flag = 0
        }
        if flag
        {
            global.gary_defeated = 1
            state_step = 1
        }
        break
    case 1:
        if obj_player.grounded
        {
            obj_player.alarm[3] = -1
            obj_player.visible = false
            if instance_exists(obj_gun)
            {
                with (obj_gun)
                    visible = false
            }
            instance_create((obj_player.x - 12 + irandom(24)), (obj_player.y - 12 + irandom(24)), obj_rocketboom_no_damage)
            inst_suit = instance_create(obj_player.x, obj_player.y, obj_mouse)
            inst_suit.sprite_index = spr_plr_vacant_suit_enter
            inst_suit.image_speed = 0
            inst_suit.state = 83
            inst_suit.smoke_timer = 15
            inst_suit.smoke_timer_max = 15
            inst_suit.iindex = 0
            inst_cat = instance_create(obj_player.x, obj_player.y, obj_mouse)
            inst_cat.sprite_index = spr_cat_jump_loop
            inst_cat.iindex = 0
            inst_cat.image_speed = 0.1
            inst_cat.vspd = -2
            inst_cat.xtar = obj_player.x + 24
            audio_play_sound(snd_cat_deathcry, 100, false)
            UI_exitmech()
            player_auto()
            shake_screen(30)
            scr_flash(0.35, 6)
            qu_wait(30)
        }
        break
    case 2:
        player_auto()
        flag = 0
        with (inst_cat)
        {
            y += vspd
            vspd += 0.05
            x = approach(x, xtar, 0.5)
            if place_meeting(x, y, obj_wall)
            {
                y = round(y)
                flag = 1
                sprite_index = spr_cat_exhausted
                while place_meeting(x, y, obj_wall)
                    y--
            }
        }
        if flag
        {
            hud_text_set(338, 358, 7)
            qu_wait(1)
            music_xfade(mu_suspense, 0)
            music_duck(1, 1000)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(339, 358, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(340, 358, 1)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(511, 356, 9)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(341, 581, 3)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(342, 581, 6)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(343, 358, 9)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(344, 581, 0)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(345, 358, 8)
            shake_screen(20)
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(346, 581, 6)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(347, 581, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(511, 356, 9)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(348, 356, 10)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(349, 581, 1)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(350, 581, 0)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_reset()
            qu_wait(30)
        }
        break
    case 18:
        flag = 0
        if (!audio_is_playing(snd_retract_tube))
            audio_play_sound(snd_retract_tube, 100, false)
        if (!instance_exists(obj_shake))
            shake_screen(5)
        with (obj_lab_tube)
        {
            y++
            if (y == (ystart - 16))
            {
                shake_screen(40)
                audio_play_sound(snd_treadmill_stop, 100, false)
                flag = 1
            }
            if instance_exists(sidewall_a)
                sidewall_a.y++
            else
                inactive = 1
            if instance_exists(sidewall_b)
                sidewall_b.y++
            bottom.y++
            top.y++
        }
        with (obj_tube_chain)
            y++
        with (obj_water_bubble)
            y++
        with (WATER)
            y++
        with (obj_barkley_in_tube)
            y_float++
        with (obj_drip_splash)
            y++
        if flag
            qu_wait(60)
        break
    case 19:
        qu_wait(1)
        with (tuberight)
            process_break_lab_tube()
        with (obj_barkley_in_tube)
        {
            state = 1
            image_xscale = -1
            image_speed = 0
            sprite_index = spr_barkley_jump
            vspd = -1.5
            x += 8
        }
        break
    case 20:
        flag = 0
        with (obj_barkley_in_tube)
        {
            y += vspd
            vspd += 0.05
            x = approach(x, 100, 1)
            if (vspd > 1)
                iindex = 2
            else if (vspd > -0.5)
                iindex = 1
            if (place_meeting(x, y, obj_wall) && vspd > 0 && y > 150)
            {
                music_duck(0, 1000)
                audio_play_sound(CatLand, 100, false)
                image_speed = 0.2
                flag = 1
                sprite_index = spr_barkley_idle
                y += 16
                while place_meeting(x, y, obj_wall)
                    y--
                image_xscale = 1
            }
        }
        if flag
            qu_wait(30)
        break
    case 21:
        hud_text_set(351, 358, 1)
        qu_wait(1)
        break
    case 22:
        if qu_trigger()
        {
            hud_text_set(352, 358, 0)
            qu_wait(1)
        }
        break
    case 23:
        if qu_trigger()
        {
            hud_text_set(353, 361, 4)
            qu_wait(1)
        }
        break
    case 24:
        if qu_trigger()
        {
            hud_text_set(354, 358, 1)
            qu_wait(1)
        }
        break
    case 25:
        if qu_trigger()
        {
            hud_text_set(355, 358, 0)
            qu_wait(1)
        }
        break
    case 26:
        if qu_trigger()
        {
            hud_text_set(356, 361, 0)
            qu_wait(1)
        }
        break
    case 27:
        if qu_trigger()
        {
            hud_text_set(357, 358, 2)
            qu_wait(1)
        }
        break
    case 28:
        if qu_trigger()
        {
            hud_text_set(358, 361, 2)
            qu_wait(1)
        }
        break
    case 29:
        if qu_trigger()
        {
            shake_screen(10)
            scr_flash(0.2, 3)
            hud_text_set(359, 358, 4)
            qu_wait(1)
        }
        break
    case 30:
        if qu_trigger()
        {
            music_duck(0, 500)
            hud_text_set(360, 361, 5)
            qu_wait(1)
        }
        break
    case 31:
        if qu_trigger()
        {
            hud_text_reset()
            qu_wait(30)
            audio_play_sound(barkley_growl, 100, false)
            with (obj_barkley_in_tube)
                sprite_index = spr_barkley_charge
        }
        break
    case 32:
        qu_wait(1)
        with (obj_barkley_in_tube)
        {
            audio_play_sound(CatJump, 100, false)
            sprite_index = spr_barkley_jump
            iindex = 0
            image_speed = 0
            vspd = -1.5
        }
        break
    case 33:
        flag = 0
        with (obj_barkley_in_tube)
        {
            y += vspd
            vspd += 0.05
            x = approach(x, 439, 1)
            if (vspd > 1)
                iindex = 2
            else if (vspd > -0.5)
                iindex = 1
            if place_meeting(x, y, obj_gary_on_ground)
            {
                if (!instance_exists(obj_shake))
                {
                    shake_screen(20)
                    scr_flash(0.2, 6)
                    audio_play_sound(snd_crusher_crush, 100, false)
                }
                obj_gary_on_ground.sprite_index = spr_gary_gun_hurt
                if (!(position_meeting(obj_gary_on_ground.x, (obj_gary_on_ground.bbox_bottom + vspd), obj_wall)))
                    obj_gary_on_ground.y += vspd
                obj_gary_on_ground.x += 0.5
                x -= 0.5
            }
            if (place_meeting(x, y, obj_wall) && vspd > 0 && y > 150)
            {
                audio_play_sound(CatLand, 100, false)
                image_speed = 0.2
                flag = 1
                sprite_index = spr_barkley_idle
                y += 16
                while place_meeting(x, y, obj_wall)
                    y--
                image_xscale = 1
            }
        }
        if flag
        {
            scr_flash(0.3, 4)
            shake_screen(30)
            qu_wait(60)
            scr_flash(0.3, 2)
            with (obj_gary_on_ground)
            {
                audio_play_sound(snd_gary_deahcry, 100, false)
                x += 8
                sprite_index = spr_gary_tremble
                while place_meeting(x, y, obj_wall)
                    y--
                iindex = 0
                image_speed = 0.2
            }
        }
        break
    case 34:
        obj_gary_on_ground.iindex = 0
        obj_gary_on_ground.sprite_index = spr_gary_collapse
        obj_gary_on_ground.image_speed = 0.1
        hud_text_set(361, 358, 0)
        qu_wait(1)
        break
    case 35:
        flag = 0
        with (obj_gary_on_ground)
        {
            if ((image_speed + iindex) >= sprite_get_number(sprite_index))
            {
                image_speed = 0
                flag = 1
            }
            else if (image_speed == 0)
                flag = 1
        }
        if (flag && qu_trigger())
        {
            obj_barkley_in_tube.image_xscale = -1
            hud_text_set(362, 361, 0)
            qu_wait(1)
        }
        break
    case 36:
        if qu_trigger()
        {
            hud_text_reset()
            qu_wait(1)
            obj_barkley_in_tube.sprite_index = spr_barkley_run
            obj_barkley_in_tube.image_speed = 0.2
        }
        break
    case 37:
        if (point_distance(obj_barkley_in_tube.x, obj_barkley_in_tube.y, inst_cat.x, inst_cat.y) > 20)
            obj_barkley_in_tube.x -= 0.5
        else
        {
            obj_barkley_in_tube.sprite_index = spr_barkley_idle
            qu_wait(30)
        }
        break
    case 38:
        hud_text_set(511, 361, 0)
        qu_wait(1)
        break
    case 39:
        if qu_trigger()
        {
            hud_text_set(511, 361, 2)
            qu_wait(1)
        }
        break
    case 40:
        if qu_trigger()
        {
            hud_text_set(511, 361, 6)
            qu_wait(1)
        }
        break
    case 41:
        if qu_trigger()
        {
            hud_text_set(511, 361, 0)
            qu_wait(1)
        }
        break
    case 42:
        if qu_trigger()
        {
            hud_text_set(511, 356, 10)
            qu_wait(1)
        }
        break
    case 43:
        if qu_trigger()
        {
            hud_text_set(511, 361, 6)
            qu_wait(1)
        }
        break
    case 44:
        if qu_trigger()
        {
            hud_text_set(511, 361, 0)
            qu_wait(1)
        }
        break
    case 45:
        if qu_trigger()
        {
            hud_text_set(511, 356, 10)
            qu_wait(1)
        }
        break
    case 46:
        if qu_trigger()
        {
            hud_text_set(511, 356, 1)
            qu_wait(1)
        }
        break
    case 47:
        if qu_trigger()
        {
            hud_text_set(512, 356, 11)
            qu_wait(1)
        }
        break
    case 48:
        if qu_trigger()
        {
            inst_cat.image_xscale = 1
            inst_cat.sprite_index = spr_cat_idle
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 49:
        if qu_trigger()
        {
            hud_text_set(362, 361, 1)
            qu_wait(1)
            with (obj_gary_on_ground)
            {
                var mmm = instance_create(x, y, obj_mouse)
                mmm.sprite_index = sprite_index
                mmm.image_index = image_index
                mmm.image_xscale = image_xscale
                mmm.image_speed = image_speed
                mmm.iindex = iindex
                instance_destroy()
            }
            player_auto()
        }
        break
    case 50:
        player_auto()
        if qu_trigger()
        {
            hud_text_reset()
            obj_barkley_in_tube.image_xscale = 1
            obj_barkley_in_tube.sprite_index = spr_barkley_charge
            qu_wait(30)
        }
        break
    case 51:
        player_auto()
        if (obj_barkley_in_tube.x > 336)
        {
            with (obj_player)
            {
                player_cat_only()
                while (!(place_meeting(x, (y + 1), obj_wall)))
                    y++
                x = other.inst_cat.x
                y = other.inst_cat.y
                move_state = 69
                visible = true
                player_auto()
                key_right = 1
                image_xscale = 1
            }
            with (inst_cat)
                instance_destroy()
            qu_wait(1)
        }
        else
        {
            with (obj_barkley_in_tube)
            {
                x++
                sprite_index = spr_barkley_run
            }
        }
        break
    case 52:
        if (obj_player.x > 140)
        {
            player_auto()
            qu_wait(1)
            global.center_player_position = 1
            save_savefile()
        }
        break
    case 53:
        player_play()
        qu_reset()
        break
}

