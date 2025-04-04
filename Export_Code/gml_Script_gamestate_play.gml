get_input()
if steam_initialised()
{
    if steam_is_overlay_enabled()
    {
        if steam_is_overlay_activated()
            force_pause = 1
    }
}
if (j_start || force_pause || keyboard_check_pressed(vk_escape))
{
    force_pause = 0
    if (instance_exists(obj_controller) && (!obj_hud.dialog_mode) && instance_exists(obj_player))
        game_changestate_pause()
}
if (global.rocket_cooldown_wait > 0)
    global.rocket_cooldown_wait -= 1
else if (global.rocket_heat > 0)
    global.rocket_heat -= rocket_cooldown_speed
else if (!global.rocket_is_ready)
{
    global.rocket_is_ready = 1
    audio_play_sound(snd_hud_cooled, 10, false)
}
if pause_frames
{
    pause_frames--
    with (obj_hitpow)
        event_perform(ev_other, ev_user0)
}
else
    update_actors()
update_ui()
