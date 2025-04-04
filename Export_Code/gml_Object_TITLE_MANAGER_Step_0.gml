var buttons = get_input()
if (state == 0)
{
    sin_timer++
    if (j_down && buttons_last_frame == 0)
    {
        cursor_index++
        buttons_last_frame = 1
        sin_timer = 0
        var s = audio_play_sound(sfx_move_cursor, 5, false)
        audio_sound_pitch(s, 1)
        with (par_title_logos)
        {
            sample_w = sprite_width / 2
            sample_h = sprite_height / 2
        }
        cursor_index = clamp(cursor_index, 0, (entries - 1))
    }
    else if (j_up && buttons_last_frame == 0)
    {
        cursor_index--
        buttons_last_frame = 1
        sin_timer = 0
        s = audio_play_sound(sfx_move_cursor, 5, false)
        audio_sound_pitch(s, 1.2)
        with (par_title_logos)
        {
            sample_w = sprite_width / 2
            sample_h = sprite_height / 2
        }
        cursor_index = clamp(cursor_index, 0, (entries - 1))
    }
    if (cursor_index == 0)
    {
        with (obj_menu_cat)
        {
            target_x = (instance_nearest(x, y, pf_wp_select_start)).x
            target_y = (instance_nearest(x, y, pf_wp_select_start)).y
        }
    }
    else if (cursor_index == 1)
    {
        with (obj_menu_cat)
        {
            target_x = (instance_nearest(x, y, pf_wp_select_options)).x
            target_y = (instance_nearest(x, y, pf_wp_select_options)).y
        }
    }
    buttons_last_frame = buttons
    if j_a_pressed
    {
        script_execute(menu_functions[cursor_index])
        with (par_title_logos)
            target_x = xstart
    }
}
else if (state == 1)
{
    state = 2
    entries = array_length_1d(fselect_text)
    cursor_index = 0
}
else if (state == 2)
{
    sin_timer++
    if (j_right && buttons_last_frame == 0)
    {
        if (cursor_index == (entries - 1))
            cursor_index = -1
        cursor_index++
        buttons_last_frame = 1
        sin_timer = 0
        s = audio_play_sound(sfx_move_cursor, 5, false)
        audio_sound_pitch(s, 1)
        cursor_index = clamp(cursor_index, 0, (entries - 2))
    }
    else if (j_left && buttons_last_frame == 0)
    {
        if (cursor_index == (entries - 1))
            cursor_index = 0
        cursor_index--
        buttons_last_frame = 1
        sin_timer = 0
        s = audio_play_sound(sfx_move_cursor, 5, false)
        audio_sound_pitch(s, 1.2)
        cursor_index = clamp(cursor_index, -1, (entries - 2))
        if (cursor_index == -1)
            cursor_index = entries - 1
    }
    global.save_cur = "save" + string(cursor_index) + ".ini"
    buttons_last_frame = buttons
    if j_a_pressed
    {
        save_id = cursor_index
        script_execute(fselect_func[cursor_index])
    }
}
else if (state == 3)
{
    sin_timer++
    if (j_down && buttons_last_frame == 0)
    {
        sub_cursor_index++
        buttons_last_frame = 1
        sin_timer = 0
        s = audio_play_sound(sfx_move_cursor, 5, false)
        audio_sound_pitch(s, 1)
        sub_cursor_index = clamp(sub_cursor_index, 0, (sub_entries - 1))
    }
    else if (j_up && buttons_last_frame == 0)
    {
        sub_cursor_index--
        buttons_last_frame = 1
        sin_timer = 0
        s = audio_play_sound(sfx_move_cursor, 5, false)
        audio_sound_pitch(s, 1.2)
        sub_cursor_index = clamp(sub_cursor_index, 0, (sub_entries - 1))
    }
    buttons_last_frame = buttons
    if j_a_pressed
        script_execute(fselectoptions[sub_cursor_index])
}
else if (state == 6)
{
}
else if (state == 4)
{
    with (obj_menu_cat)
        inactive = 1
    with (all)
        y += other.camspeed
    camspeed += 0.2
}
