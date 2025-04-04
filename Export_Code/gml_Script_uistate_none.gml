if (!ui_is_initialized)
{
    text_talk_index = 0
    text_talk_timer = 30
    tar_x[0] = pos_x[0]
    tar_y[0] = -64
    pos_x[0] = approach(pos_x[0], tar_x[0], 0)
    pos_y[0] = approach(pos_y[0], tar_y[0], 3)
    tar_x[1] = display_get_gui_width() + 32
    pos_x[1] = approach(pos_x[1], tar_x[1], 3)
    tar_x[2] = display_get_gui_width() + 32
    pos_x[2] = approach(pos_x[2], tar_x[2], 2)
    tar_x[3] = -32
    tar_y[3] = 204
    pos_x[3] = approach(pos_x[3], tar_x[3], 2)
    pos_y[3] = 204
    tar_x[4] = -32
    tar_y[4] = 166
    pos_x[4] = approach(pos_x[3], tar_x[3], 2)
    pos_y[4] = 166
    if (pos_x[0] == tar_x[0] && pos_y[0] == tar_y[0] && pos_x[1] == tar_x[1])
        ui_is_initialized = 1
    var pct_actual = global.cur_hp / global.max_hp
    pct_slowed = approach(pct_slowed, pct_actual, 0.01)
    draw_lifebar(pos_x[1], pos_y[1], random_range((-hp_jiggle), hp_jiggle))
    hp_jiggle = approach(hp_jiggle, 0, 0.5)
    if get_bitwise_flag(global.abilities, 1)
    {
        var _wiggle = 0
        if (!global.rocket_is_ready)
            _wiggle = global.rocket_heat
        draw_rocketbar((pos_x[0] + (choose((-_wiggle), _wiggle))), (pos_y[0] + (choose((-_wiggle), _wiggle))), choose(((-_wiggle) * 2), (_wiggle * 2)))
    }
    draw_sprite(spr_eject_button, global.hot_room, (pos_x[2] - 1), pos_y[2])
    get_input()
    draw_sprite(spr_rocketmeter_button, (global.controller_y_frame * 2 + j_y), (pos_x[2] + 18), (pos_y[2] - 3))
    var c = c_white
    if ((!global.hot_room) && (!j_y))
        c = c_black
    draw_set_color(c)
    draw_set_halign(fa_center)
    draw_text((pos_x[2] + 19), (pos_y[2] - 3 - 7 + global.ui_text_offset), global.controller_y_name)
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if (!global.hot_room)
        draw_text((pos_x[2] - 9), (pos_y[2] + 6 + global.ui_text_offset), loc_read_line(515))
    if get_bitwise_flag(global.abilities, 2)
    {
        draw_sprite(spr_hud_spin_frame, 0, pos_x[3], pos_y[3])
        draw_sprite(spr_hud_spin_icon, spinindex, pos_x[3], pos_y[3])
        var a_press = 0
        var b_press = 0
        if instance_exists(obj_player)
        {
            if (obj_player.move_state == 67)
            {
                spinindex += spinspeed
                a_press = 1
            }
            else
                spinindex = 0
        }
        draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2 + a_press), (pos_x[3] - 14), (pos_y[3] - 13))
        draw_set_halign(fa_center)
        c = c_black
        if a_press
            c = c_white
        draw_set_color(c)
        draw_text((pos_x[3] - 13), (pos_y[3] - 13 - 7 + global.ui_text_offset), global.controller_a_name)
        draw_set_halign(fa_left)
        draw_set_color(c_white)
    }
    if get_bitwise_flag(global.abilities, 4)
    {
        draw_sprite(spr_O2_icon, dashindex, pos_x[4], pos_y[4])
        b_press = 0
        if instance_exists(obj_player)
        {
            if obj_player.dashing
            {
                dashindex = min((dashindex + 0.5), (sprite_get_number(spr_O2_icon) - 1))
                b_press = 1
            }
            else
                dashindex = sprite_get_number(spr_O2_icon) - 1
        }
        draw_sprite(spr_rocketmeter_button, (global.controller_r_frame * 2 + b_press), (pos_x[4] - 1), (pos_y[4] - 2))
        draw_set_halign(fa_center)
        c = c_black
        if b_press
            c = 16777215
        draw_set_color(c)
        draw_text(pos_x[4], (pos_y[4] - 9 + global.ui_text_offset), global.controller_r_name)
        draw_set_halign(fa_left)
        draw_set_color(c_white)
    }
}
draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_font(global.font[global.language])
draw_minit_time()
