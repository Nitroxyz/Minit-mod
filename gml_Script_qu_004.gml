switch state_step
{
    case 0:
        if (!instance_exists(obj_changeroom))
        {
            player_auto()
            if obj_player.grounded
            {
                qu_wait(1)
                music_duck(0.7, 1000)
                obj_player.hspd = (-obj_player.cat_movespd) / 2.5
            }
            else
                obj_player.hspd /= 1.5
        }
        break
    case 1:
        if (obj_player.x < 270)
        {
            if obj_player.grounded
            {
                obj_player.key_left = 1
                obj_player.key_right = 0
                obj_player.key_jump = 1
                obj_player.key_jump_held = 1
            }
            else
            {
                obj_player.key_right = 0
                obj_player.key_left = 0
            }
            if (obj_player.x < 260)
            {
                obj_player.key_jump = 0
                obj_player.key_left = 0
                obj_player.key_jump_held = 0
                if (obj_player.grounded || obj_player.x < 232)
                    qu_wait(1)
            }
        }
        else if obj_player.grounded
        {
            obj_player.key_left = 1
            obj_player.key_right = 0
        }
        break
    case 2:
        qu_wait(20)
        break
    case 3:
        obj_player.key_jump_held = 1
        obj_player.key_jump = 1
        audio_play_sound(CatMeow, 100, false)
        qu_wait(20)
        break
    case 3.5:
        obj_player.key_jump = 0
        break
    case 4:
        if obj_player.grounded
        {
            obj_player.move_state = 2
            obj_player.sprite_index = spr_cat_scared
            obj_player.image_index = 0
            obj_player.key_jump_held = 0
            obj_player.key_jump = 0
            qu_wait(60)
        }
        break
    case 5:
        hud_text_set(43, 358, 0)
        qu_wait(5)
        obj_player.move_state = 69
        break
    case 6:
        audio_play_sound(CatMeow, 100, false)
        obj_player.key_jump_held = 1
        obj_player.key_jump = 1
        obj_player.key_right = 1
        qu_wait(20)
        break
    case 6.5:
        obj_player.key_right = 0
        obj_player.key_jump = 0
        break
    case 7:
        if obj_player.grounded
        {
            obj_player.move_state = 2
            obj_player.sprite_index = spr_cat_scared
            obj_player.image_index = 0
            obj_player.key_jump_held = 0
            obj_player.key_jump = 0
            qu_wait(20)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(44, 358, 2)
            qu_wait(5)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(45, 356, 4)
            qu_wait(5)
            qu_face(obj_player, -1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(46, 358, 0)
            qu_wait(5)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(511, 356, 1)
            qu_wait(5)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(47, 358, 1)
            qu_wait(5)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(511, 356, 1)
            qu_wait(5)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(511, 358, 3)
            qu_wait(5)
        }
        break
    case 15:
        if qu_trigger()
        {
            obj_player.sprite_index = spr_cat_idle
            obj_player.move_state = 69
            obj_player.key_left = 1
            hud_text_set(511, 356, 0)
            qu_wait(5)
        }
        break
    case 15.5:
        obj_player.key_left = 0
        break
    case 16:
        if qu_trigger()
        {
            shake_screen(40)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            hud_text_set(48, 358, 4)
            qu_wait(30)
            obj_player.key_jump = 1
            obj_player.key_jump_held = 1
            obj_player.key_left = 1
            obj_player.hspd = -3
        }
        break
    case 16.5:
        obj_player.key_jump = 0
        if position_meeting(obj_player.x, obj_player.y, WATER)
        {
            obj_player.key_left = 0
            obj_player.key_right = 1
            obj_player.key_jump_held = 1
        }
        break
    case 17:
        if position_meeting(obj_player.x, obj_player.y, WATER)
        {
            if (obj_player.x < 120)
            {
                if (!obj_player.key_right)
                {
                    obj_player.key_left = 0
                    obj_player.key_right = 1
                    obj_player.key_jump = 1
                }
                else
                    obj_player.key_jump = 0
            }
            else if (obj_player.x > 180)
            {
                if (!obj_player.key_left)
                {
                    obj_player.key_left = 1
                    obj_player.key_right = 0
                    obj_player.key_jump = 1
                }
                else
                    obj_player.key_jump = 0
            }
            if (obj_player.y > 165 && obj_player.vspd >= 1)
                obj_player.key_jump = 1
            else
                obj_player.key_jump = 0
        }
        if qu_trigger()
        {
            obj_player.key_left = 0
            obj_player.key_right = 0
            obj_player.key_jump = 0
            obj_player.key_jump_held = 0
            hud_text_set(0, 358, 2)
            qu_wait(10)
        }
        break
    case 18:
        if qu_trigger()
        {
            obj_player.old_move_state = obj_player.move_state
            player_play()
            qu_reset()
            hud_text_reset()
            music_duck(1, 1000)
            set_room_state(0)
            global.events_completed++
        }
        break
}

