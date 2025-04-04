draw_set_font(global.font[global.language])
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
if (state == 0)
{
    draw_set_valign(fa_middle)
    for (var i = 0; i < entries; i++)
    {
        var offset_x = 0
        if (cursor_index == i)
            offset_x = 3
        var bump = abs((dsin(sin_timer * 5)) * offset_x)
        if (cursor_index == i)
        {
            var menu_string_w = string_width(menu_text[i])
            draw_set_font(fnt_nesultra)
            draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2), (room_width / 2 - menu_string_w / 2 - 20), (room_height / 2 + 16 * i + 4))
            draw_set_color(c_black)
            draw_set_valign(fa_top)
            draw_text((room_width / 2 - menu_string_w / 2 - 19), (room_height / 2 + 16 * i - 3), global.controller_a_name)
            draw_set_font(global.font[global.language])
            draw_set_color(c_white)
            draw_set_valign(fa_middle)
            draw_line_width((room_width / 2 - menu_string_w / 2 - 6), (room_height / 2 + 16 * i + 4), (room_width / 2 - menu_string_w / 2 - 9 - bump), (room_height / 2 + 16 * i + 4), 2)
            draw_line_width((room_width / 2 + menu_string_w / 2 + 3), (room_height / 2 + 16 * i + 4), (room_width / 2 + menu_string_w / 2 + 6 + bump), (room_height / 2 + 16 * i + 4), 2)
        }
        draw_text((room_width / 2), (room_height / 2 + 5 + 16 * i - bump), menu_text[i])
    }
    draw_set_valign(fa_top)
}
else if (state == 2)
{
    var start_y = 32
    var center_x = room_width / 2
    var x_offset = 84
    var x_size = 72
    var start_x = center_x - x_offset - x_size * 0.5
    for (i = 0; i < entries; i++)
    {
        if (i == (entries - 1))
        {
            bump = 0
            if (cursor_index == i)
            {
                menu_string_w = string_width(fselect_text[i])
                bump = (abs(dsin(sin_timer * 5))) * 3
                draw_line_width((start_x - menu_string_w - 8 + bump), (start_y + 128), (start_x - 8 - bump - 2), (start_y + 128), 2)
                draw_set_font(fnt_nesultra)
                draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2), (start_x - menu_string_w - 20), (start_y + 118))
                draw_set_color(c_black)
                draw_text((start_x - menu_string_w - 19), (start_y + 111), global.controller_a_name)
                draw_set_font(global.font[global.language])
                draw_set_color(c_white)
            }
            draw_text((start_x - string_width(fselect_text[i]) / 2 - 8), (start_y + 128 - 13 - bump), fselect_text[i])
        }
        else
        {
            var y_offset = 0
            if (cursor_index == i)
            {
                y_offset = (abs(dsin(sin_timer * 5))) * 3
                draw_frame((start_x + x_offset * i), (start_y - y_offset - 16), (start_x + x_offset * i + x_size), (start_y + 148 - y_offset))
            }
            else
                draw_frame2((start_x + x_offset * i), (start_y - 16), (start_x + x_offset * i + x_size), (start_y + 148))
            draw_text_ext((start_x + x_offset * i + x_size * 0.5), (start_y + 3 - y_offset - 16), fselect_text[i], 12, 64)
            draw_set_halign(fa_left)
            draw_sprite(spr_health_orb, 0, (start_x + x_offset * i + 8), (start_y + 148 - y_offset - 8))
            draw_text((start_x + x_offset * i + 30), (start_y + 148 - y_offset - 23), string(fselect_hp[i]))
            draw_sprite(spr_vhs_orb, 0, (start_x + x_offset * i + 8), (start_y + 148 - y_offset - 24))
            draw_text((start_x + x_offset * i + 30), (start_y + 148 - y_offset - 39), string(fselect_carts[i]))
            draw_set_halign(fa_center)
            if fselect_rocket[i]
                draw_sprite(spr_rocket_orb, 0, (start_x + x_offset * i + 8), (start_y + 128 - y_offset - 82))
            if fselect_spinjump[i]
                draw_sprite(spr_orb, 0, (start_x + x_offset * i + 28), (start_y + 128 - y_offset - 82))
            if fselect_dash[i]
                draw_sprite(spr_dash_orb, 0, (start_x + x_offset * i + 48), (start_y + 128 - y_offset - 82))
            if fselect_cooler[i]
                draw_sprite(spr_cooler_orb, 0, (start_x + x_offset * i + 8), (start_y + 128 - y_offset - 62))
            if fselect_bigshot[i]
                draw_sprite(spr_bigshot_orb, 0, (start_x + x_offset * i + 28), (start_y + 128 - y_offset - 62))
            if fselect_decoder[i]
                draw_sprite(spr_decoder_orb, 0, (start_x + x_offset * i + 48), (start_y + 128 - y_offset - 62))
            if fselect_repeater[i]
                draw_sprite(spr_repeater_orb, 0, (start_x + x_offset * i + 8), (start_y + 128 - y_offset - 42))
            if fselect_hopper[i]
                draw_sprite(spr_hopper_orb, 0, (start_x + x_offset * i + 28), (start_y + 128 - y_offset - 42))
            if fselect_success[i]
                draw_sprite(spr_success_orb, 0, (start_x + x_offset * i + 8), (start_y + 128 - y_offset - 22))
            if fselect_complete[i]
                draw_sprite(spr_completion_orb, 0, (start_x + x_offset * i + 28), (start_y + 128 - y_offset - 22))
        }
    }
}
else if (state == 3)
{
    start_y = 32
    center_x = room_width / 2
    x_offset = 84
    x_size = 72
    start_x = center_x - x_offset - x_size * 0.5
    var widmax = string_width(fselectoptions_header)
    bump = abs(dsin(sin_timer * 5))
    for (i = 0; i < array_length_1d(fselectoptions_text); i++)
    {
        menu_string_w = string_width(fselectoptions_text[i])
        widmax = max(widmax, menu_string_w)
        if (sub_cursor_index == i)
        {
            draw_set_font(fnt_nesultra)
            draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2), (center_x - menu_string_w / 2 - 11), (start_y + 66 + 14 * i))
            draw_set_color(c_black)
            draw_text((center_x - menu_string_w / 2 - 10), (start_y + 59 + 14 * i), global.controller_a_name)
            draw_set_font(global.font[global.language])
            draw_set_color(c_white)
            draw_text(center_x, (start_y + 60 + 14 * i - bump), fselectoptions_text[i])
        }
        else
            draw_text(center_x, (start_y + 60 + 14 * i), fselectoptions_text[i])
    }
    if (fselectoptions_header == "")
        draw_frame4_blackinner((center_x - widmax / 2 - 24 + bump), (start_y + 36 + bump), (center_x + widmax / 2 + 24 - bump), (start_y + 60 + sub_entries * 14 + 24 - bump))
    else
    {
        draw_text(center_x, (start_y + 40), fselectoptions_header)
        draw_frame4_blackinner((center_x - widmax / 2 - 24 + bump), (start_y + 16 + bump), (center_x + widmax / 2 + 24 - bump), (start_y + 60 + sub_entries * 14 + 24 - bump))
    }
}
