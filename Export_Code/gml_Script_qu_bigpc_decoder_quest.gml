switch state_step
{
    case 0:
        qu_set_dialogmode()
        player_auto()
        if (global.decoder_discovered == 0)
        {
            hud_text_set(92, 358, 0)
            state_step = 0.5
        }
        else
        {
            hud_text_set(111, 581, 0)
            state_step = 27
        }
        break
    case 0.5:
        if qu_trigger()
        {
            hud_text_set(93, 581, 2)
            state_step = 1
        }
        break
    case 1:
        if qu_trigger()
        {
            hud_text_set(94, 581, 0)
            qu_wait(1)
        }
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(95, 358, 2)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(96, 581, 0)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(97, 581, 0)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(98, 581, 2)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set_ext(99, 358, 2, "wavy")
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(100, 581, 1)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            hud_text_set_ext(511, 358, 0, "nervous")
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(101, 358, 3)
            scr_flash(0.3, 2)
            shake_screen(40)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set_ext(51, 356, 1, "nervous")
            qu_wait(1)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(102, 358, 0)
            qu_wait(1)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(103, 358, 0)
            qu_wait(1)
        }
        break
    case 13:
        if qu_trigger()
        {
            hud_text_set(104, 358, 1)
            qu_wait(1)
        }
        break
    case 14:
        if qu_trigger()
        {
            hud_text_set(105, 358, 0)
            qu_wait(1)
        }
        break
    case 15:
        if qu_trigger()
        {
            hud_text_set(511, 356, 1)
            qu_wait(1)
        }
        break
    case 16:
        if qu_trigger()
        {
            music_duck(0, 500)
            shake_screen(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            hud_text_set(106, 358, 1)
            qu_wait(1)
        }
        break
    case 17:
        if qu_trigger()
        {
            hud_text_set(107, 358, 1)
            shake_screen(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            qu_wait(1)
        }
        break
    case 18:
        if qu_trigger()
        {
            hud_text_set(20, 356, 2)
            qu_wait(1)
        }
        break
    case 19:
        qu_wait(1)
        break
    case 20:
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
            shake_screen(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            qu_wait(1)
        }
        break
    case 21:
        hud_portrait_set(359, irandom(3))
        if qu_trigger()
        {
            hud_text_set(108, 358, 1)
            qu_wait(1)
        }
        break
    case 22:
        hud_portrait_set(359, irandom(3))
        if qu_trigger()
        {
            hud_text_set(109, 358, 1)
            scr_flash(0.3, 2)
            shake_screen(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            qu_wait(1)
        }
        break
    case 23:
        hud_portrait_set(359, irandom(3))
        if (!instance_exists(obj_shake))
            shake_screen(5)
        if qu_trigger()
        {
            hud_text_set(110, 358, 1)
            scr_flash(0.3, 2)
            shake_screen(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            qu_wait(1)
        }
        break
    case 24:
        hud_portrait_set(359, irandom(3))
        if qu_trigger()
        {
            hud_text_set(511, 358, 0)
            qu_wait(1)
        }
        break
    case 25:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 26:
        if qu_trigger()
        {
            hud_text_set(111, 581, 0)
            qu_wait(1)
        }
        break
    case 27:
        if qu_trigger()
        {
            hud_text_set(511, 356, 0)
            qu_wait(1)
        }
        break
    case 28:
        if qu_trigger()
        {
            hud_text_set(511, 581, 0)
            qu_wait(1)
        }
        break
    case 29:
        if qu_trigger()
        {
            hud_text_set(112, 581, 4)
            qu_wait(1)
        }
        break
    case 30:
        if qu_trigger()
        {
            hud_text_set(113, 581, 0)
            qu_wait(1)
        }
        break
    case 31:
        if qu_trigger()
        {
            hud_text_set(511, 356, 2)
            scr_flash(0.3, 2)
            shake_screen(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            audio_sound_pitch(bgm_boss_stab, random_range(0.5, 0.6))
            qu_wait(1)
            global.decoder_discovered = 1
        }
        break
    case 32:
        if qu_trigger()
        {
            hud_text_reset()
            player_play()
            qu_reset()
        }
        break
}

