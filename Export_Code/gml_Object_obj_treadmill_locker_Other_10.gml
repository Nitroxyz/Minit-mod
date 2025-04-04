if nonLockable
{
    energy = clamp(energy, (-max_energy), max_energy)
    image_speed = (-((energy - energy_last))) * 0.5
    energy_last = energy
    animate_actor()
    if ((!audio_is_playing(snd_treadmill)) && image_speed != 0)
        audio_play_sound(snd_treadmill, 5, false)
}
else if (!locked)
{
    energy = clamp(energy, (-max_energy), max_energy)
    if (energy == (-max_energy) || energy == max_energy)
    {
        locked = 1
        iindex = 0
        shake_screen(10)
        audio_play_sound(snd_treadmill_stop, 5, false)
        if audio_is_playing(snd_treadmill)
            audio_stop_sound(snd_treadmill)
    }
    else if (energy == 0)
    {
        if audio_is_playing(snd_treadmill)
            audio_stop_sound(snd_treadmill)
    }
    image_speed = (-((energy - energy_last))) * 0.5
    energy_last = energy
    animate_actor()
    if ((!audio_is_playing(snd_treadmill)) && image_speed != 0)
        audio_play_sound(snd_treadmill, 5, false)
}
else
    iindex = 0
if (energy_previous != energy && plat != self)
{
    with (plat)
        event_perform(ev_other, ev_user1)
    energy_previous = energy
}
