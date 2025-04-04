script_execute(state)
if (state == enemy_state_stun)
{
    if (flying_sfx != undefined)
    {
        if audio_is_playing(flying_sfx)
            audio_stop_sound(flying_sfx)
    }
}
