draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_font(fnt_nesultra)
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
    {
        ui_is_initialized = 1
        state = 21
    }
}
var pct_actual = global.sub_hp / global.sub_hp_max
pct_slowed = approach(pct_slowed, pct_actual, 0.01)
draw_lifebar_sub(pos_x[1], pos_y[1], random_range((-hp_jiggle), hp_jiggle))
hp_jiggle = approach(hp_jiggle, 0, 0.5)
if (radar_angle != 90)
{
    radar_angle += 10
    radar_angle = wrap(radar_angle, 0, 360)
}
else if (radar_pause > 0)
{
    radar_pause--
    radar_blink = 0
}
else
{
    radar_angle += 10
    radar_pause = 10
    radar_blink = 1
}
draw_sub_radar(pos_x[0], pos_y[0], radar_angle, radar_blink)
draw_set_font(global.font[global.language])
draw_sprite(spr_eject_button, (!((ui_is_initialized && (!global.hot_room)))), (pos_x[2] - 1), pos_y[2])
get_input()
draw_sprite(spr_rocketmeter_button, (global.controller_y_frame * 2 + (j_y || (!ui_is_initialized))), (pos_x[2] + 18), (pos_y[2] - 3))
draw_set_halign(fa_left)
draw_set_color(c_white)
if (!global.hot_room)
    draw_text((pos_x[2] - 9), (pos_y[2] + 6 + global.ui_text_offset), loc_read_line(515))
var c = c_white
if ((!global.hot_room) && ((!j_y) || ui_is_initialized))
    c = 0
draw_set_color(c)
draw_set_halign(fa_center)
draw_set_font(fnt_nesultra)
draw_text((pos_x[2] + 19), (pos_y[2] - 3 - 7), global.controller_y_name)
