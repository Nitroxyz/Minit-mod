sprite_index = spr_dilla_into_ball
image_speed = 0.2
var iindex_old = floor(iindex)
animate_actor()
if (iindex_old != floor(iindex))
{
    if (iindex_old == 0)
        audio_play_sound(snd_dilla_alerted, 100, false)
    else if (iindex_old == 6)
        audio_play_sound(snd_dilla_transform, 100, false)
}
if ((iindex + image_speed) >= image_number)
{
    state = 369
    vspd = -3
    hspd = sign(image_xscale) * 3
    start_slowing = 0
}
