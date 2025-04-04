event_inherited()
for (var i = 0; i < 4; i++)
{
    if instance_exists(shields[i])
    {
        with (shields[i])
            instance_destroy()
    }
}
global.boss_hud_active = 0
global.boss_hud_target = -1
if audio_is_playing(snd_ventboss_lazer_loop)
    audio_stop_sound(snd_ventboss_lazer_loop)
if audio_is_playing(snd_ventboss_spin_state)
    audio_stop_sound(snd_ventboss_spin_state)
