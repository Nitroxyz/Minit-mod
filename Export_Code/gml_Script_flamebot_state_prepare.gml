sprite_index = spr_flamebot_prepare_flame
image_speed = 0.2
animate_actor()
if grounded
    vspd = 0
else
    vspd += 0.2
hspd = 0
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    image_xscale = (-image_xscale)
    hspd = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if ((iindex + image_speed) >= image_number)
{
    state = 374
    timer = 180
}
else if (iindex > 7 && (!audio_is_playing(snd_flamebot_prepare)))
    audio_play_sound(snd_flamebot_prepare, 100, false)
