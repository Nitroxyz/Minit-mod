with (obj_menu_cat)
{
    var wp = instance_nearest(x, y, pf_wp_select_start)
    target_x = room_width / 2
    target_y = room_height / 2 + 56
}
with (par_title_logos)
    target_x = target_x_centered
entries = array_length_1d(menu_text)
state = 0
audio_play_sound(snd_menu_deselect, 5, false)
cursor_index = 0
