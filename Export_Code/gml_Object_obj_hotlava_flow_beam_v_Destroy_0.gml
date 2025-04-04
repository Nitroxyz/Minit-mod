if (flowsound != -1)
{
    if audio_is_playing(flowsound)
        audio_stop_sound(flowsound)
    if audio_is_playing(snd_lavaflow_hi)
        audio_stop_sound(snd_lavaflow_hi)
}
