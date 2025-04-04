switch state
{
    case 0:
        if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd))
        {
            curv++
            curv %= 3
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu))
        {
            curv--
            if (curv < 0)
                curv += 3
            curv %= 3
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl))
        {
            curh--
            if (curh < 0)
                curh += 9
            curh %= 9
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr))
        {
            curh++
            curh %= 9
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_face2))
        {
            if (string_length(name) < 5)
                name += glyphs[(curv * 9 + curh + 27 * (case_offset / 33))]
            if (string_length(name) == 5)
            {
                state = 1
                audio_play_sound(UIconfirm, 100, false)
                audio_sound_pitch(UIconfirm, 0.75)
            }
            else
            {
                audio_play_sound(UIconfirm, 100, false)
                audio_sound_pitch(UIconfirm, (0.6 + string_length(name) / 10))
            }
            shake_screen(15)
        }
        else if (keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_face4) || gamepad_button_check_pressed(0, gp_face3))
        {
            if (string_length(name) > 0)
            {
                name = string_copy(name, 0, (string_length(name) - 1))
                audio_play_sound(UIback, 100, false)
                audio_sound_pitch(UIback, (0.8 + string_length(name) / 10))
            }
            else
            {
                backtotitle = 1
                instance_destroy()
            }
            shake_screen(8)
        }
        else if (keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(0, gp_start))
        {
            if (name != "")
                state = 1
            shake_screen(20)
            audio_play_sound(UIconfirm, 100, false)
            audio_sound_pitch(UIconfirm, 0.75)
        }
        else if (keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0, gp_select))
        {
            shake_screen(20)
            audio_play_sound(UIback, 100, false)
            audio_sound_pitch(UIback, 0.75)
            if (case_offset != 0)
                case_offset = 0
            else
                case_offset = 33
        }
        break
    case 1:
        if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd))
        {
            endcur++
            endcur %= 2
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu))
        {
            endcur++
            endcur %= 2
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl))
        {
            endcur++
            endcur %= 2
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr))
        {
            endcur++
            endcur %= 2
            shake_screen(2)
            audio_play_sound(UImove, 100, false)
            audio_sound_pitch(UImove, random_range(0.85, 0.99))
        }
        else if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_face2))
        {
            if (endcur == 0)
            {
                global.name = name
                state = 2
                audio_play_sound(UIconfirm, 100, false)
                audio_sound_pitch(UIconfirm, random_range(0.85, 0.99))
            }
            else
            {
                endcur = 0
                state = 0
                audio_play_sound(UIback, 100, false)
                audio_sound_pitch(UIback, random_range(0.85, 0.99))
            }
            shake_screen(15)
        }
        else if (keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_face4) || gamepad_button_check_pressed(0, gp_face3))
        {
            state = 0
            audio_play_sound(UIback, 100, false)
            audio_sound_pitch(UIback, 0.75)
            shake_screen(15)
        }
        else if (keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(0, gp_start))
        {
            global.name = name
            state = 2
            audio_play_sound(UIconfirm, 100, false)
            audio_sound_pitch(UIconfirm, 0.75)
            shake_screen(25)
        }
        break
    case 2:
        state = 3
        alarm[0] = 25
        music_duck(0, 1000)
        break
}

