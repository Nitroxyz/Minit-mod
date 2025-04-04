switch state_step
{
    case 0:
        qu_set_dialogmode()
        if instance_exists(obj_player)
        {
            obj_player.dashing = 0
            obj_player.hspd = max(obj_player.hspd, -1.5)
        }
        if (!instance_exists(obj_door_auto_U))
        {
            player_auto()
            state_step++
        }
        break
    case 1:
        player_auto()
        if obj_player.grounded
        {
            hud_text_set(210, 357, 0)
            qu_wait(1)
        }
        break
    case 2:
        if qu_trigger()
        {
            hud_text_set(211, 357, 1)
            qu_wait(1)
        }
        break
    case 3:
        if qu_trigger()
        {
            hud_text_set(212, 356, 2)
            qu_wait(1)
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(213, 358, 3)
            qu_wait(1)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set(214, 357, 0)
            qu_wait(1)
        }
        break
    case 6:
        if qu_trigger()
        {
            hud_text_set(215, 357, 1)
            qu_wait(1)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_set(216, 358, 3)
            qu_wait(1)
        }
        break
    case 8:
        if qu_trigger()
        {
            shake_screen(20)
            hud_text_set(217, 358, 4)
            qu_wait(1)
        }
        break
    case 9:
        if qu_trigger()
        {
            hud_text_set(218, 357, 1)
            qu_wait(1)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(219, 358, 1)
            qu_wait(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.5, 6)
            shake_screen(20)
        }
        break
    case 11:
        if qu_trigger()
        {
            qu_wait(10)
            hud_text_reset()
            scr_flash(0.2, 8)
            shake_screen(25)
        }
        break
    case 12:
        player_play()
        qu_reset()
        break
}

