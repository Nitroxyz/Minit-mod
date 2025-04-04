if ((!save_loaded[0]) || (!save_loaded[1]) || (!save_loaded[2]))
    return;
switch state
{
    case 0:
        if (keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(global.controller_slot, gp_start) || gamepad_button_check_pressed(global.controller_slot, gp_face1))
        {
            state = 1
            vspd = -10
            audio_play_sound(UIconfirm, 100, false)
        }
        cur_index += 0.05
        if (cur_index >= 2)
            cur_index = 0
        break
    case 1:
        if (y > (ystart - 32) && vspd > 0)
        {
            if (x != xstart)
            {
                x = lerp(x, xstart, 0.5)
                if (abs(x - xstart) < 3)
                    x = xstart
            }
            else
            {
                y = ystart - 32
                shake_screen(30)
                state = 1.5
                alarm[0] = 6
            }
        }
        else
        {
            y += vspd
            vspd += 0.75
        }
        break
    case 2:
        cur_index += 0.1
        if (cur_index >= 4)
            cur_index = 0
        if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(global.controller_slot, gp_padd))
        {
            cur++
            if (cur >= max_selection)
                cur = 0
            audio_play_sound(UImove, 100, false)
        }
        if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.controller_slot, gp_padu))
        {
            cur--
            if (cur == -1)
                cur = max_selection
            audio_play_sound(UImove, 100, false)
        }
        if (keyboard_check_released(vk_return) || gamepad_button_check_released(global.controller_slot, gp_start) || gamepad_button_check_released(global.controller_slot, gp_face1))
        {
            if (cur < 3)
            {
                global.save_cur = "save" + string(cur) + ".ini"
                if (save_choice[cur] == 0)
                {
                    init_file = 1
                    state = 3
                    alarm[0] = 30
                    roomto = 11
                    music_duck(0, 1000)
                }
                else
                {
                    init_file = 0
                    state = 3
                    alarm[0] = 30
                    roomto = 14
                    music_duck(0, 1000)
                }
                audio_play_sound(UIconfirm, 100, false)
            }
            else if (cur == 3)
            {
                audio_play_sound(UIback, 100, false)
                global.save_cur = "save0.ini"
                init_savefile()
                global.save_cur = "save1.ini"
                init_savefile()
                global.save_cur = "save2.ini"
                init_savefile()
                scr_flash(0.5, 6)
                save_0 = "Save File 1"
                save_choice[0] = 0
                save_1 = "Save File 2"
                save_choice[1] = 0
                save_2 = "Save File 3"
                save_choice[2] = 0
                shake_screen(30)
            }
        }
        break
    case 3:
        __view_set(0, 0, lerp(__view_get(0, 0), (room_width + 24), 0.2))
        break
    case 4:
        __view_set(0, 0, lerp(__view_get(0, 0), (-room_width), 0.2))
        break
    case 5:
        if (abs(__view_get(0, 0)) < 5)
        {
            __view_set(0, 0, 0)
            state = 2
        }
        else
            __view_set(0, 0, lerp(__view_get(0, 0), 0, 0.2))
        break
}

