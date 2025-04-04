if (!has_initialized)
    return;
var buttons = get_input()
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
                process_save_userprefs()
            }
            break
        case 2:
            ds_grid_set(menu, 2, cursor_y, (!(ds_grid_get(menu, 2, cursor_y))))
            inputting = 0
            if (cursor_y == 0)
            {
                global.fullscreen = ds_grid_get(menu, 2, 0)
                window_set_fullscreen(global.fullscreen)
            }
            else
                global.rumble = ds_grid_get(menu, 2, cursor_y)
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
                global.language = ds_grid_get(menu, 2, (4 + fs_override))
                event_perform(ev_other, ev_user0)
                inputting = 0
                sfx = audio_play_sound(snd_intro_keyboard, 5, false)
                audio_sound_pitch(sfx, 0.8)
                process_define_font_settings()
                process_save_userprefs()
            }
            break
        case 0:
            script_execute(ds_grid_get(menu, 2, cursor_y))
            sfx = audio_play_sound(snd_intro_keyboard, 5, false)
            audio_sound_pitch(sfx, 0.8)
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
    sfx = audio_play_sound(snd_intro_keyboard, 5, false)
    inputting = (!inputting)
}
if (window_get_fullscreen() != global.fullscreen)
    global.fullscreen = (!global.fullscreen)
global.AUDIO_MASTER_GAIN = ds_grid_get(menu, 2, (1 + fs_override))
global.MUSIC_MASTER_GAIN = ds_grid_get(menu, 2, (2 + fs_override))
global.SOUND_MASTER_GAIN = ds_grid_get(menu, 2, (3 + fs_override))
audio_master_gain(global.AUDIO_MASTER_GAIN)
process_set_audio_relative_gain()
buttons_previous = buttons
