switch state_step
{
    case 0:
        scr_flash(0.3, 2)
        with (obj_enemy)
            x -= 1000
        if (!instance_exists(obj_mouse))
        {
            instance_create(((__view_get(2, 0)) / 2), ((__view_get(3, 0)) - 16), obj_mouse)
            with (obj_mouse)
            {
                image_speed = 0.1
                image_xscale = -1
                while place_meeting(x, y, obj_wall)
                    y--
            }
        }
        qu_wait(30)
        obj_mouse.sprite_index = spr_mouse_run
        obj_mouse.image_speed = 0.2
        break
    case 0.5:
        obj_mouse.x -= 0.5
        obj_mouse.x = max(72, obj_mouse.x)
        break
    case 1:
        obj_mouse.x -= 0.5
        obj_mouse.x = max(72, obj_mouse.x)
        obj_player.key_down = 1
        qu_wait(90)
        break
    case 1.5:
        if (obj_player.grounded && obj_player.y < 100)
            obj_player.key_jump = 1
        else
            player_auto()
        obj_player.key_down = 1
        obj_mouse.x--
        obj_mouse.x = max(72, obj_mouse.x)
        if (obj_mouse.x == 72 && image_xscale == -1)
        {
            obj_mouse.sprite_index = spr_mouse_idle
            obj_mouse.image_speed = 0.15
            obj_mouse.image_xscale = 1
        }
        break
    case 2:
        obj_mouse.sprite_index = spr_mouse_idle
        obj_mouse.image_speed = 0.15
        obj_mouse.image_xscale = 1
        hud_text_set("Meow?", 356, 0)
        hud_text_set("Meow?", 356, 0)
        qu_wait(45)
        break
    case 2.5:
        if (obj_player.image_xscale == 1)
            obj_player.key_left = 1
        else
            player_auto()
        break
    case 3:
        player_auto()
        if qu_trigger()
        {
            hud_text_set("It's been inspiring...#watching your progress.", 357, 0)
            qu_wait(20)
            shake_screen(20)
            scr_flash(0.4, 3)
            obj_mouse.image_speed = 0.2
        }
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set("Who is there?", 358, 1)
            qu_wait(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.25, 1)
            shake_screen(10)
        }
        break
    case 5:
        if qu_trigger()
        {
            hud_text_set("You haven't figured it#out yet? Gary?!", 357, 2)
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
            hud_text_set("Kiki! Crush that#little freak!", 358, 4)
            qu_wait(20)
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.5, 6)
            shake_screen(20)
        }
        break
    case 7:
        if qu_trigger()
        {
            hud_text_reset()
            obj_mouse.sprite_index = spr_mouse_run
            obj_mouse.image_index = 1
            obj_mouse.image_speed = 0
            qu_wait(5)
            audio_play_sound(bgm_boss_stab, 100, false)
            scr_flash(0.2, 8)
            shake_screen(25)
        }
        break
    case 8:
        if (abs(obj_mouse.x - (__view_get(2, 0)) / 2) > 1)
        {
            obj_mouse.x = lerp(obj_mouse.x, ((__view_get(2, 0)) / 2), 0.13)
            obj_mouse.y = lerp(obj_mouse.y, ((__view_get(3, 0)) / 2), 0.13)
        }
        else
        {
            scr_flash(0.5, 12)
            music_duck(1, 0)
            music_xfade(mu_ventboss, 0)
            qu_wait(20)
        }
        if (obj_player.x > 72)
            obj_player.key_left = 1
        else
            player_auto()
        break
    case 8.5:
        if (obj_player.x > 72)
            obj_player.key_left = 1
        else
        {
            player_auto()
            if (obj_player.image_xscale == -1)
                key_right = 1
        }
        break
    case 9:
        with (obj_enemy)
            x = xstart
        with (obj_mouse)
            instance_destroy()
        scr_unhide_enemies()
        player_play()
        qu_reset()
        break
}

