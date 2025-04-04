switch state_step
{
    case 0:
        player_auto()
        room_speed = 60
        music_duck(0.7, 500)
        obj_camera.center = 0
        obj_player.move_state = 2
        obj_player.x = 152
        obj_player.y = 90
        obj_player.visible = false
        qu_wait(2)
        break
    case 1:
        if (!instance_exists(obj_shake))
            shake_screen(10)
        if (obj_wreckage.y == obj_wreckage.ystart)
            qu_wait(1)
        break
    case 2:
        qu_wait(1)
        obj_player.visible = true
        obj_player.move_state = 70
        obj_player.key_jump_held = 1
        obj_player.hspd = 3
        obj_player.vspd = -1
        scr_flash(0.5, 8)
        shake_screen(20)
        audio_play_sound(GrenadeBlowup, 100, false)
        audio_play_sound(GrenadeBlowup_Layer2, 100, false)
        break
    case 3:
        if (obj_player.grounded == 1)
        {
            room_speed = 60
            qu_wait(20)
            audio_play_sound(CatMeow, 100, false)
            audio_sound_pitch(CatMeow, random_range(0.8, 1.2))
            obj_player.key_jump_held = 0
            obj_wreckage.mask_index = spr_wreckage
        }
        break
    case 4:
        hud_text_set(511, 356, 0)
        qu_wait(5)
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set_ext(16, 358, 1, "nervous")
            qu_wait(5)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set_ext(17, 358, 1, "nervous")
            qu_wait(5)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(18, 358, 0)
            qu_wait(5)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set(19, 358, 1)
            qu_wait(5)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
            qu_wait(7)
            qu_face(obj_player, 1)
            obj_player.key_left = 1
            obj_player.key_jump = 1
            obj_player.key_jump_held = 1
        }
        break
    case 9.5:
        obj_player.key_jump = 0
        break
    case 10:
        obj_player.key_left = 0
        obj_player.key_jump_held = 0
        if qu_trigger()
        {
            hud_text_set(20, 356, 0)
            qu_wait(5)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(21, 358, 1)
            qu_wait(5)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set_ext(22, 358, 2, "wavy")
            qu_wait(5)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(23, 358, 1)
            qu_wait(5)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(24, 358, 0)
            qu_wait(5)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(25, 358, 0)
            qu_wait(5)
        }
        break
    case 16:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(5)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(26, 356, 2)
            qu_wait(5)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
            qu_wait(5)
        }
        break
    case 19:
        if qu_trigger()
        {
            hud_text_set(27, 358, 3)
            scr_flash(0.3, 2)
            shake_screen(40)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            qu_wait(5)
        }
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set(28, 358, 0)
            qu_wait(5)
        }
        break
    case 21:
        if qu_trigger()
        {
            hud_text_set(29, 358, 0)
            qu_wait(5)
        }
        break
    case 22:
        if qu_trigger()
        {
            hud_text_set(30, 358, 0)
            qu_wait(5)
        }
        break
    case 23:
        if qu_trigger()
        {
            hud_text_set(31, 358, 0)
            qu_wait(5)
        }
        break
    case 24:
        if qu_trigger()
        {
            hud_text_set(32, 358, 0)
            qu_wait(5)
        }
        break
    case 25:
        if qu_trigger()
        {
            hud_text_set(33, 358, 0)
            qu_wait(5)
        }
        break
    case 26:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(5)
        }
        break
    case 27:
        if qu_trigger()
        {
            hud_text_set(34, 358, 0)
            qu_wait(5)
        }
        break
    case 28:
        if qu_trigger()
        {
            hud_text_set(512, 356, 2)
            qu_wait(5)
            qu_face(obj_player, -1)
        }
        break
    case 29:
        if qu_trigger()
        {
            hud_text_set(35, 358, 2)
            qu_wait(5)
        }
        break
    case 30:
        if qu_trigger()
        {
            obj_camera.center = 1
            music_duck(1, 1000)
            player_play()
            qu_reset()
            hud_text_reset()
            set_room_state(0)
            save_savefile()
            global.events_completed++
        }
        break
}

