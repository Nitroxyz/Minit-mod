sprite_index = spr_carrybot_regen
if (iindex > 1)
    image_speed = 0.2
hspd = approach(hspd, 0, 0.1)
if (flying_audio == undefined)
    flying_audio = audio_play_sound(snd_drone_fly, 10, true)
else if (instance_exists(obj_player) && audio_is_playing(flying_audio))
{
    audio_sound_pitch(flying_audio, ((point_distance(0, 0, hspd, 0)) / flyspeed[0] + 0.3))
    audio_sound_gain(flying_audio, (0.6 - (point_distance(x, y, obj_player.x, obj_player.y)) / 300), 0)
}
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
if (hasObject == 0 && iindex >= 2)
{
    hasObject = 1
    audio_play_sound(snd_carrybot_regen, 100, false)
}
if ((iindex + image_speed) >= image_number)
{
    if (regen_timer > 0)
        regen_timer--
    else
    {
        regen_timer = regen_timer_max
        state = 382
    }
}
else
    animate_actor()
