if (active == 1)
{
    if (keyboard_check_released(vk_left) || gamepad_button_check_released(0, gp_padl))
        macro_cur = wrap((macro_cur - 1), 0, 7)
    else if (keyboard_check_released(vk_right) || gamepad_button_check_released(0, gp_padr))
        macro_cur = wrap((macro_cur + 1), 0, 7)
    if (keyboard_check_released(vk_return) || gamepad_button_check_released(0, gp_start) || gamepad_button_check_released(0, gp_face1))
    {
        active = 0
        audio_play_sound(UIconfirm, 100, false)
        music_duck(0, 1000)
        if file_exists(macro_savefile[macro_cur])
        {
            global.save_cur = macro_savefile[macro_cur]
            roomto = macro_roomto[macro_cur]
        }
        else
            global.save_cur = "save0.ini"
        alarm[0] = 30
        cur_index = 99
    }
    else if keyboard_check_pressed(vk_f12)
    {
        active = 0
        room_goto(r_editor)
    }
    else if keyboard_check_pressed(vk_f8)
    {
        active = 0
        room_goto(r_anim_editor)
    }
}
