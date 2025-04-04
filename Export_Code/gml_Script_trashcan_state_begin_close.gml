sprite_index = spr_trashcan_close
if (timer > 0)
{
    iindex = 0
    image_speed = 0
    timer--
    if (timer == 0 && is_within_view(x, y, 0, 16))
        audio_play_sound(snd_trashcan_close, 5, false)
}
else
    image_speed = 0.2
animate_actor()
if (iindex >= 3)
    stun_state = 317
if ((iindex + image_speed) >= image_number)
{
    timer = hidden_time
    iindex = 0
    sprite_index = spr_trashcan_open
    image_speed = 0
    state = 393
}
