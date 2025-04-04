var i = floor((mouse_x - 30 - palette_x) / 18)
var j = floor((mouse_y - palette_y) / 18)
if (palette_hov_x != -1)
{
    palette_hov_x = lerp(palette_hov_x, (palette_x + i * 18), 0.4)
    palette_hov_y = lerp(palette_hov_y, (palette_y + j * 18), 0.4)
}
else
{
    palette_hov_x = palette_x + i * 18
    palette_hov_y = palette_y + j * 18
}
if mouse_check_button_pressed(mb_left)
{
    cursor_rotation = 0
    cursor_xscale = 1
    cursor_yscale = 1
    palette_cur_x = palette_x + i * 18
    palette_cur_y = palette_y + j * 18
    palette_cur_i = i
    palette_cur_j = j
    palette_obj_selected = palette[i, j]
    if (palette_obj_selected == 155 || palette_obj_selected == 156 || palette_obj_selected == 237 || palette_obj_selected == 75 || palette_obj_selected == 245)
        grid_layer = "foreground"
    else
        grid_layer = "player"
    if (palette_obj_selected == -2)
    {
        palette_obj_selected = palette[(i - 1), j]
        palette_cur_x = palette_x + (i - 1) * 18
        palette_cur_y = palette_y + j * 18
    }
    else if (palette_obj_selected == -3)
    {
        palette_obj_selected = palette[i, (j - 1)]
        palette_cur_x = palette_x + i * 18
        palette_cur_y = palette_y + (j - 1) * 18
    }
    else if (palette_obj_selected == -4)
    {
        palette_obj_selected = palette[(i - 1), (j - 1)]
        palette_cur_x = palette_x + (i - 1) * 18
        palette_cur_y = palette_y + (j - 1) * 18
    }
    else if (palette_obj_selected != -1 && edit_tool == "hand")
        cursor_change("arrow")
    scr_cout(object_get_description(palette_obj_selected))
}
