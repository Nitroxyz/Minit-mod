draw_set_font(global.font[global.language])
draw_set_halign(fa_left)
if (!has_initialized)
    return;
draw_set_valign(fa_middle)
var l_off_x = 24
var l_off_y = 24
for (var j = 0; j < ds_grid_height(menu); j++)
{
    var x_off = 0
    if (cursor_y == j)
    {
        if (!inputting)
            x_off = abs(sin(current_time / 100))
        else
            x_off = 8
    }
    if (cursor_y == j)
    {
        if inputting
        {
            draw_set_font(fnt_nesultra)
            draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2), (l_off_x - 2), (l_off_y + j * 15))
            draw_set_color(c_black)
            draw_text((l_off_x - 5), (l_off_y + j * 15), global.controller_a_name)
            draw_set_font(global.font[global.language])
            draw_set_color(c_white)
        }
        else
        {
            draw_set_font(fnt_nesultra)
            draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2), (l_off_x - 12), (l_off_y + j * 15))
            draw_set_color(c_black)
            draw_text((l_off_x - 15), (l_off_y + j * 15), global.controller_a_name)
            draw_set_font(global.font[global.language])
            draw_set_color(c_white)
        }
    }
    draw_text((l_off_x + x_off * 2), (l_off_y + j * 15), ds_grid_get(menu, 0, j))
}
for (j = 0; j < ds_grid_height(menu); j++)
{
    switch ds_grid_get(menu, 1, j)
    {
        case 0:
            break
        case 2:
            draw_sprite(spr_editor_checkbox, ds_grid_get(menu, 2, j), (l_off_x + 300), (l_off_y + j * 15))
            break
        case 1:
            draw_line_width((l_off_x + 200), (l_off_y + j * 15), (l_off_x + 300), (l_off_y + j * 15), 2)
            var _cur = ds_grid_get(menu, 2, j)
            var _max = ds_grid_get(menu, 3, j)
            draw_sprite(spr_cat_walk, (_cur * 20), (l_off_x + 200 + (ds_grid_get(menu, 2, j)) / _max[1] * 100), (l_off_y + j * 15))
            draw_text((l_off_x + 350), (l_off_y + j * 15), ((string(floor(_cur / _max[1] * 100))) + "%"))
            break
        case 3:
            draw_set_font(global.font[ds_grid_get(menu, 2, j)])
            if (inputting && cursor_y == j)
                draw_text((l_off_x + 200), (l_off_y + j * 15), ("< " + (language_name[ds_grid_get(menu, 2, j)]) + " " + ">"))
            else
                draw_text((l_off_x + 200), (l_off_y + j * 15), language_name[ds_grid_get(menu, 2, j)])
            draw_set_font(global.font[global.language])
            break
        default:

    }

}
draw_set_valign(fa_top)
