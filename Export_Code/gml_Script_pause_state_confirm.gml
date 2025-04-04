get_input()
var u = (j_up && (!buttons_previous))
var d = (j_down && (!buttons_previous))
var l = (j_left && (!buttons_previous))
var r = (j_right && (!buttons_previous))
var press = j_a_pressed
if inputting
{
    switch ds_grid_get(confirm_menu, 1, pause_cursor_y)
    {
        case 0:
            script_execute(ds_grid_get(confirm_menu, 2, pause_cursor_y))
            var sfx = audio_play_sound(snd_intro_keyboard, 5, false)
            audio_sound_pitch(sfx, 0.8)
            if exiting
                return;
            break
    }

}
else if d
{
    pause_cursor_y++
    pause_cursor_y = min(pause_cursor_y, (ds_grid_height(confirm_menu) - 1))
    sfx = audio_play_sound(snd_slider, 5, false)
    audio_sound_pitch(sfx, 1)
}
else if u
{
    pause_cursor_y--
    pause_cursor_y = max(pause_cursor_y, 0)
    sfx = audio_play_sound(snd_slider, 5, false)
    audio_sound_pitch(sfx, 0.75)
}
else if press
{
    page_control = 0
    sfx = audio_play_sound(snd_intro_keyboard, 5, false)
    inputting = (!inputting)
}
draw_set_font(global.font[global.language])
draw_set_halign(fa_center)
draw_text(152, 2, var_confirm)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
var l_off_x = 30
var l_off_y = 32
for (var j = 0; j < ds_grid_height(confirm_menu); j++)
{
    var x_off = 0
    if (pause_cursor_y == j)
    {
        if (!inputting)
            x_off = abs(sin(current_time / 100))
        else
            x_off = 8
    }
    if (pause_cursor_y == j)
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
    draw_text((l_off_x + x_off * 2), (l_off_y + j * 15), ds_grid_get(confirm_menu, 0, j))
}
draw_set_valign(fa_top)
