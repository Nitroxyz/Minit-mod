sprite_index = spr_driller_alert
stun_state = 317
animate_actor()
if ((iindex + image_speed) >= image_number)
{
    state = 385
    sprite_index = spr_driller_chase
    iindex = 0
    drillsound = audio_play_sound(DrillerDrilling, 100, true)
}
else if (iindex == 2)
    audio_play_sound(DrillerAlerted, 100, false)
else if (iindex > 7.8 && (!audio_is_playing(snd_driller_runstep)))
{
    var stomp = audio_play_sound(snd_driller_runstep, 100, false)
    audio_sound_pitch(stomp, 0.7)
}
