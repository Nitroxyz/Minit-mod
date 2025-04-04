get_input()
var u = (j_up && (!buttons_previous))
var d = (j_down && (!buttons_previous))
var l = (j_left && (!buttons_previous))
var r = (j_right && (!buttons_previous))
var press = j_a_pressed
if inputting
{
    switch ds_grid_get(menu, 1, cursor_y)
    {
        case 1:
            var range = ds_grid_get(menu, 3, cursor_y)
            if j_right
            {
                ds_grid_set(menu, 2, cursor_y, ((ds_grid_get(menu, 2, cursor_y)) + 0.01))
                if (!audio_is_playing(snd_slider))
                {
                    var sfx = audio_play_sound(snd_slider, 5, false)
                    audio_sound_pitch(sfx, ((ds_grid_get(menu, 2, cursor_y)) / 1 + 0.5))
                }
            }
            else if j_left
            {
                ds_grid_set(menu, 2, cursor_y, ((ds_grid_get(menu, 2, cursor_y)) - 0.01))
                if (!audio_is_playing(snd_slider))
                {
                    sfx = audio_play_sound(snd_slider, 5, false)
                    audio_sound_pitch(sfx, ((ds_grid_get(menu, 2, cursor_y)) / 1 + 0.5))
                }
            }
            ds_grid_set(menu, 2, cursor_y, clamp(ds_grid_get(menu, 2, cursor_y), range[0], range[1]))
            if press
            {
                sfx = audio_play_sound(snd_intro_keyboard, 5, false)
                audio_sound_pitch(sfx, 0.8)
                inputting = 0
                page_control = 1
                process_save_userprefs()
            }
            break
        case 2:
            ds_grid_set(menu, 2, cursor_y, (!(ds_grid_get(menu, 2, cursor_y))))
            inputting = 0
            page_control = 1
            global.fullscreen = ds_grid_get(menu, 2, 0)
            window_set_fullscreen(global.fullscreen)
            process_save_userprefs()
            break
        case 3:
            if r
            {
                ds_grid_set_post(menu, 4, cursor_y, ((ds_grid_get(menu, 4, cursor_y)) + 1))
                var arr = ds_grid_get(menu, 3, cursor_y)
                if (ds_grid_get(menu, 4, cursor_y) > (array_length_1d(arr) - 1))
                    ds_grid_set(menu, 4, cursor_y, 0)
                ds_grid_set(menu, 2, cursor_y, arr[ds_grid_get(menu, 4, cursor_y)])
                sfx = audio_play_sound(snd_intro_keyboard, 5, false)
                audio_sound_pitch(sfx, 1.5)
            }
            else if l
            {
                ds_grid_set_post(menu, 4, cursor_y, ((ds_grid_get(menu, 4, cursor_y)) - 1))
                arr = ds_grid_get(menu, 3, cursor_y)
                if (ds_grid_get(menu, 4, cursor_y) < 0)
                    ds_grid_set(menu, 4, cursor_y, (array_length_1d(arr) - 1))
                ds_grid_set(menu, 2, cursor_y, arr[ds_grid_get(menu, 4, cursor_y)])
                sfx = audio_play_sound(snd_intro_keyboard, 5, false)
                audio_sound_pitch(sfx, 1.5)
            }
            else if press
            {
                page_control = 1
                inputting = 0
                sfx = audio_play_sound(snd_intro_keyboard, 5, false)
                audio_sound_pitch(sfx, 0.8)
                process_save_userprefs()
            }
            break
        case 0:
            script_execute(ds_grid_get(menu, 2, cursor_y))
            sfx = audio_play_sound(snd_intro_keyboard, 5, false)
            audio_sound_pitch(sfx, 0.8)
            if exiting
                return;
            break
    }

}
else if d
{
    cursor_y++
    cursor_y = min(cursor_y, (ds_grid_height(menu) - 1))
    sfx = audio_play_sound(snd_slider, 5, false)
    audio_sound_pitch(sfx, 1)
}
else if u
{
    cursor_y--
    cursor_y = max(cursor_y, 0)
    sfx = audio_play_sound(snd_slider, 5, false)
    audio_sound_pitch(sfx, 0.75)
}
else if press
{
    page_control = 0
    sfx = audio_play_sound(snd_intro_keyboard, 5, false)
    inputting = (!inputting)
}
if (window_get_fullscreen() != global.fullscreen)
    global.fullscreen = (!global.fullscreen)
global.AUDIO_MASTER_GAIN = ds_grid_get(menu, 2, (1 + fs_override))
global.MUSIC_MASTER_GAIN = ds_grid_get(menu, 2, (2 + fs_override))
global.SOUND_MASTER_GAIN = ds_grid_get(menu, 2, (3 + fs_override))
GAME_MANAGER.palette_index = palettes[ds_grid_get(menu, 4, (4 + fs_override))]
global.palette_default = GAME_MANAGER.palette_index
audio_master_gain(global.AUDIO_MASTER_GAIN)
process_set_audio_relative_gain()
draw_set_font(global.font[global.language])
draw_set_halign(fa_center)
draw_text(152, 2, var_options)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
var l_off_x = 30
var l_off_y = 32
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
            draw_sprite(spr_editor_checkbox, global.fullscreen, (l_off_x + 216), (l_off_y + j * 15))
            break
        case 1:
            draw_line_width((l_off_x + 124), (l_off_y + j * 15), (l_off_x + 220), (l_off_y + j * 15), 2)
            var _cur = ds_grid_get(menu, 2, j)
            var _max = ds_grid_get(menu, 3, j)
            draw_sprite(spr_cat_walk, (_cur * 20), (l_off_x + 124 + (ds_grid_get(menu, 2, j)) / _max[1] * 100), (l_off_y + j * 15))
            draw_text((l_off_x + 234), (l_off_y + j * 15), ((string(floor(_cur / _max[1] * 100))) + string("%")))
            break
        case 3:
            if (inputting && cursor_y == j)
                draw_text((l_off_x + 120), (l_off_y + j * 15), ((string("< ")) + (loc_read_line(palette_name[ds_grid_get(menu, 4, j)])) + (string(" >"))))
            else
                draw_text((l_off_x + 120), (l_off_y + j * 15), loc_read_line(palette_name[ds_grid_get(menu, 4, j)]))
            break
        default:

    }

}
draw_set_valign(fa_top)
