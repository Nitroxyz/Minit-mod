sprite_index = spr_carrybot_drop
image_speed = 0.2
hspd = approach(hspd, 0, 0.01)
animate_actor()
if place_meeting((x + hspd), y, obj_wall)
{
    if place_meeting((x + 8 * sign(hspd)), y, obj_wall)
    {
        while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
            x += sign(hspd)
        hspd *= -1
        image_xscale *= -1
    }
    else if (hspd != 0)
        image_xscale = sign(hspd)
    while place_meeting(x, y, obj_wall)
        x += sign(hspd)
    hspd = 0
}
x += hspd
if ((iindex + image_speed) >= image_number)
{
    if (flying_audio == undefined)
        flying_audio = audio_play_sound(snd_drone_fly, 10, true)
    state = 382
}
