iindex_old = iindex
animate_actor()
if (sprite_index == spr_carrybot_bomb_open)
{
    vspd += grav
    if ((iindex + image_speed) >= image_number)
    {
        sprite_index = spr_carrybot_bomb_fall
        iindex = 0
    }
}
else
{
    if (iindex_old > iindex)
        audio_play_sound(snd_carrybomb_spin, 100, false)
    vspd += grav
    image_speed = (abs(point_distance(0, 0, hspd, vspd))) * 0.1
}
x += hspd
y += vspd
if (y > 320)
{
    instance_destroy()
    var tsound = audio_play_sound(snd_rocket_explosion, 100, false)
    audio_sound_pitch(tsound, 0.6)
    audio_sound_gain(tsound, 0.8, 70)
    shake_screen(15)
}
