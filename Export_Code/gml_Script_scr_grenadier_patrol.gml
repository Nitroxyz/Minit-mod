image_xscale = sign(dir)
image_speed = 0.1
var iindex_old = floor(iindex)
animate_actor()
hspd = dir * 0.2
if (iindex_old != floor(iindex))
{
    if ((iindex_old % 4) == 0)
    {
        var ttt = audio_play_sound(snd_flamebot_footstep, 100, false)
        audio_sound_pitch(ttt, random_range(0.65, 0.8))
    }
}
if (patrol_timer > 0)
    patrol_timer--
else
{
    patrol_timer = patrol_timer_max
    iindex = 0
    state = 359
    sprite_index = spr_grenadier_shoot
    image_speed = 0.2
}
if place_meeting((xtemp + hspd), ytemp, obj_wall)
{
    while (!(place_meeting((xtemp + sign(hspd)), ytemp, obj_wall)))
        xtemp += sign(hspd)
    dir *= -1
    image_xscale = dir
    iindex = 0
    hspd = 0
}
else
    xtemp += hspd
if (!(place_meeting((xtemp + 16 * dir), (ytemp + 1), obj_wall)))
{
    dir *= -1
    image_xscale = dir
    hspd = 0
    iindex = 0
    image_speed = 0
}
x = round(xtemp)
y = round(ytemp)
