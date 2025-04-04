if instance_exists(UI_MANAGER)
{
    UI_MANAGER.ui_is_initialized = 0
    UI_MANAGER.state = 24
    audio_play_sound(snd_hud_enter_mech, 10, false)
}
