get_input()
var u = (j_up && (!buttons_previous))
var d = (j_down && (!buttons_previous))
var l = (j_left && (!buttons_previous))
var r = (j_right && (!buttons_previous))
var press = j_a_pressed
draw_set_font(fnt_nesultra)
if debug_inputting
{
    script_execute(ds_grid_get(debug_menu, 2, debug_cursor_y))
    var sfx = audio_play_sound(snd_intro_keyboard, 5, false)
    audio_sound_pitch(sfx, 0.8)
    debug_inputting = 0
}
else if d
{
    debug_cursor_y++
    debug_cursor_y = min(debug_cursor_y, (ds_grid_height(debug_menu) - 1))
    sfx = audio_play_sound(snd_slider, 5, false)
    audio_sound_pitch(sfx, 1)
}
else if u
{
    debug_cursor_y--
    debug_cursor_y = max(debug_cursor_y, 0)
    sfx = audio_play_sound(snd_slider, 5, false)
    audio_sound_pitch(sfx, 0.75)
}
else if press
{
    sfx = audio_play_sound(snd_intro_keyboard, 5, false)
    debug_inputting = (!debug_inputting)
}
draw_set_halign(fa_center)
draw_text(152, 2, "DEBUG")
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
var l_off_x = 30
var l_off_y = 24
for (var j = 0; j < ds_grid_height(debug_menu); j++)
{
    var x_off = 0
    if (debug_cursor_y == j)
    {
        if (!debug_inputting)
            x_off = abs(sin(current_time / 100))
        else
            x_off = 8
    }
    if (debug_cursor_y == j)
    {
        if debug_inputting
        {
            draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2), (l_off_x - 2), (l_off_y + j * 15))
            draw_set_color(c_black)
            draw_text((l_off_x - 5), (l_off_y + j * 15), global.controller_a_name)
            draw_set_color(c_white)
        }
        else
        {
            draw_sprite(spr_rocketmeter_button, (global.controller_a_frame * 2), (l_off_x - 12), (l_off_y + j * 15))
            draw_set_color(c_black)
            draw_text((l_off_x - 15), (l_off_y + j * 15), global.controller_a_name)
            draw_set_color(c_white)
        }
    }
    draw_text((l_off_x + x_off * 2), (l_off_y + j * 15), ds_grid_get(debug_menu, 0, j))
}
for (j = 0; j < ds_grid_height(debug_menu); j++)
{
    switch j
    {
        case 0:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(global.max_hp))
            break
        case 1:
            draw_text((l_off_x + 120), (l_off_y + j * 15), ((string(get_bitwise_flag(global.abilities, 1))) + ", cool: " + string(global.rocket_cost)))
            break
        case 2:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(get_bitwise_flag(global.abilities, 2)))
            break
        case 3:
            draw_text((l_off_x + 120), (l_off_y + j * 15), ((string(get_bitwise_flag(global.abilities, 4))) + ", Hopper: " + (string(get_bitwise_flag(global.abilities, 16)))))
            break
        case 4:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(get_bitwise_flag(global.gunEquip, 1)))
            break
        case 5:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(get_bitwise_flag(global.gunEquip, 8)))
            break
        case 6:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(palettes_collected))
            break
        case 7:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(global.water_level))
            break
        case 8:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(global.flows_cleared + global.lava_cooled))
            break
        case 9:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(global.vents_cleared))
            break
        case 10:
            draw_text((l_off_x + 120), (l_off_y + j * 15), string(global.decoder_discovered + global.decoder_complete))
            break
    }

}
draw_set_valign(fa_top)
