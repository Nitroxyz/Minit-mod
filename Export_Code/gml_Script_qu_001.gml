switch state_step
{
    case 0:
        if (!instance_exists(obj_changeroom))
        {
            qu_wait(1)
            music_duck(0.7, 500)
        }
        break
    case 1:
        if (obj_player.x > 64)
        {
            qu_wait(1)
            player_auto()
        }
        if instance_exists(obj_changeroom)
            qu_reset()
        break
    case 2:
        if (obj_player.grounded == 1)
            qu_wait(2)
        break
    case 3:
        hud_text_set(36, 358, 0)
        qu_wait(5)
        break
    case 4:
        if qu_trigger()
        {
            hud_text_set(37, 358, 0)
            qu_wait(5)
        }
        break
    case 5:
        if qu_trigger()
        {
            player_play()
            hud_text_reset()
            qu_wait(10)
        }
        break
    case 6:
        if (global.hassuit == "yes")
        {
            set_room_state(0)
            player_auto()
            if (global.minit_mode > 0)
                instance_create_depth(0, 0, -10000, minit_ItemGot)
            qu_wait(30)
        }
        else if instance_exists(obj_changeroom)
            qu_reset()
        break
    case 7:
        if (obj_player.x < 190)
        {
            obj_player.key_jump = 1
            obj_player.key_jump_held = 1
            if (obj_player.x < 180)
            {
                obj_player.key_jump = 0
                obj_player.key_left = 0
                if obj_player.grounded
                {
                    qu_wait(1)
                    obj_player.key_jump_held = 0
                }
            }
        }
        else
            obj_player.key_left = 1
        break
    case 8:
        if (global.minit_mode > 0)
        {
            if (!instance_exists(minit_ItemGot))
            {
                player_play()
                qu_reset()
                hud_text_reset()
                music_duck(1, 1000)
                set_room_state(0)
                save_savefile()
                global.events_completed++
            }
        }
        else
        {
            hud_text_set(38, 358, 2)
            qu_wait(5)
        }
        break
    case 9:
        if qu_trigger()
        {
            choose_dialog_button("Y")
            hud_text_set(39, 358, 1)
            qu_wait(5)
        }
        break
    case 10:
        if qu_trigger()
        {
            hud_text_set(40, 358, 0)
            qu_wait(5)
        }
        break
    case 11:
        if qu_trigger()
        {
            hud_text_set(41, 358, 0)
            qu_wait(5)
        }
        break
    case 12:
        if qu_trigger()
        {
            hud_text_set(512, 356, 2)
            audio_play_sound(CatMeow, 100, false)
            qu_wait(64)
            obj_player.facing *= -1
            qu_face(obj_player, obj_player.facing)
            player_updategundir()
        }
        break
    case 12.5:
        obj_player.shoot_state = 84
        if (alarm[1] < 44 && alarm[1] != 0 && (alarm[1] % 14) == 0)
            obj_player.key_shoot2 = 1
        else
            obj_player.key_shoot2 = 0
        break
    case 13:
        qu_wait(64)
        obj_player.facing *= -1
        qu_face(obj_player, obj_player.facing)
        obj_player.key_up = 1
        player_updategundir()
        break
    case 13.5:
        obj_player.key_up = 1
        obj_player.shoot_state = 84
        if (alarm[1] < 44 && alarm[1] != 0 && (alarm[1] % 14) == 0)
            obj_player.key_shoot2 = 1
        else
            obj_player.key_shoot2 = 0
        break
    case 14:
        obj_player.key_up = 0
        obj_player.key_shoot2 = 0
        if qu_trigger()
        {
            hud_text_set(42, 358, 2)
            qu_wait(5)
        }
        break
    case 15:
        if qu_trigger()
        {
            player_play()
            qu_reset()
            hud_text_reset()
            music_duck(1, 1000)
            set_room_state(0)
            if (global.minit_mode > 0)
                global.minit_active = 1
            save_savefile()
            global.events_completed++
        }
        break
}

