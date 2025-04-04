animate_actor()
if place_meeting((xtemp + hspd), ytemp, obj_wall)
{
    while (!(place_meeting((xtemp + sign(hspd)), ytemp, obj_wall)))
        xtemp += sign(hspd)
    hspd *= -1
    var tt = audio_play_sound(GrenadeBounce35, 100, false)
    audio_sound_pitch(tt, random_range(0.7, 1.2))
}
else
    xtemp += hspd
if place_meeting(xtemp, (ytemp + vspd), obj_wall)
{
    while (!(place_meeting(xtemp, (ytemp + sign(vspd)), obj_wall)))
        ytemp += sign(vspd)
    vspd = (-sign(vspd)) * bouncespeed
    hspd *= 0.8
    tt = audio_play_sound(GrenadeBounce35, 100, false)
    audio_sound_pitch(tt, random_range(0.7, 1.2))
}
else
    ytemp += vspd
x = xtemp
y = ytemp
vspd += 0.075
if (alarm[0] > 0)
    alarm[0]--
else
    instance_destroy()
