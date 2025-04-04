var buttons = get_input()
if surface_exists(global.hudsurf)
{
    surface_set_target(global.hudsurf)
    draw_clear_alpha(c_black, 1)
    t += 10
    t = wrap(t, 0, 360)
    if (page_control && t > 180)
    {
        draw_sprite(spr_buttons, 7, 10, 10)
        draw_sprite(spr_buttons, 8, 294, 10)
    }
    if (buttons_previous == 0 && page_control && (j_right || j_left))
    {
        var sfx = audio_play_sound(snd_slider, 5, false)
        audio_sound_pitch(sfx, 1)
        state_index = wrap((state_index + (j_right - j_left)), 0, array_length_1d(states))
        current_state = states[state_index]
    }
    script_execute(current_state)
    surface_reset_target()
}
buttons_previous = buttons
