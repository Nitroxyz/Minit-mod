if wait_timer
{
    wait_timer--
    if (!wait_timer)
    {
        if (key_cursor < 8)
            key_cursor++
        else
        {
            keybinding_menu_save_keys()
            instance_destroy()
            with (TITLE_OPTIONS)
            {
                has_initialized = 1
                inputting = 0
            }
        }
    }
}
else if keyboard_key
{
    if keyboard_check_pressed(keyboard_key)
    {
        var t_ukey = keyboard_key
        if (t_ukey == 160 || t_ukey == 161)
            t_ukey = 16
        if (t_ukey == 162 || t_ukey == 163)
            t_ukey = 17
        if (t_ukey == 164 || t_ukey == 165)
            t_ukey = 18
        var flag = 1
        for (var i = 0; i < array_length_1d(keys_selected); i++)
        {
            if (t_ukey == keys_selected[i])
                flag = 0
        }
        if (t_ukey == 38 || t_ukey == 40 || t_ukey == 37 || t_ukey == 39)
        {
            if (key_cursor >= 4 || (key_cursor == 0 && t_ukey != 38) || (key_cursor == 1 && t_ukey != 40) || (key_cursor == 2 && t_ukey != 37) || (key_cursor == 3 && t_ukey != 39))
                flag = 0
        }
        if (flag && (!invalid_keybind(t_ukey)))
        {
            keys_selected[array_length_1d(keys_selected)] = t_ukey
            wait_timer = 20
            audio_play_sound(snd_menu_select, 5, false)
        }
        else
            audio_play_sound(snd_suit_exit_cancel, 1, false)
    }
}
