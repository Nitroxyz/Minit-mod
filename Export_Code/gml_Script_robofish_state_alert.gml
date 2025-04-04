sprite_index = spr_robofish_alert
image_speed = 0.2
animate_actor()
if ((iindex + image_speed) >= image_number)
{
    state = 335
    charge_spd = 0
    audio_play_sound(snd_robofish_dash, 100, false)
    chargesound = audio_play_sound(snd_robofish_dashing, 100, false)
}
