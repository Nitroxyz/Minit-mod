var soundflag = 0
if place_meeting((xtemp + hspd), ytemp, obj_wall)
{
    if (hspd != 0)
    {
        var limit = 20
        while (!(place_meeting((xtemp + sign(hspd)), ytemp, obj_wall)))
        {
            xtemp += sign(hspd)
            limit--
            if (limit <= 0)
                break
            else
                continue
        }
    }
    hspd *= -0.8
    if ((!soundflag) && abs(hspd) > 1)
    {
        var snd = audio_play_sound(choose(135, 139, 138, 134, 132, 137, 136, 130), 100, false)
        audio_sound_pitch(snd, random_range(0.8, 1.3))
        soundflag = 1
    }
}
else
    xtemp += hspd
if place_meeting(xtemp, (ytemp + vspd), obj_wall)
{
    if (vspd != 0)
    {
        limit = 20
        while (!(place_meeting(xtemp, (ytemp + sign(vspd)), obj_wall)))
        {
            ytemp += sign(vspd)
            limit--
            if (limit <= 0)
                break
            else
                continue
        }
    }
    vspd *= -0.5
    if ((!soundflag) && abs(vspd) > 1)
    {
        snd = audio_play_sound(choose(135, 139, 138, 134, 132, 137, 136, 130), 100, false)
        audio_sound_pitch(snd, random_range(0.8, 1.3))
        soundflag = 1
    }
}
else
    ytemp += vspd
x = round(xtemp)
y = round(ytemp)
hspd -= (0.001 * sign(hspd))
vspd += 0.35
if (alarm[0] > 0)
    alarm[0]--
else
{
    instance_create(x, y, obj_splosion)
    instance_create(x, y, obj_bubble)
    instance_create(x, y, obj_shakesmall2)
    instance_create(x, y, obj_bulimp)
    instance_destroy()
    var t0 = audio_play_sound(GrenadeExplode, 100, false)
    var t1 = audio_play_sound(GrenadeBlowup_Layer2, 100, false)
    audio_sound_pitch(t0, random_range(0.5, 0.6))
    audio_sound_pitch(t1, random_range(0.4, 0.6))
    audio_sound_gain(t1, random_range(0.5, 0.6), 3)
}
if (alarm[0] < 40 && (alarm[0] % 4) == 0)
{
    if visible
        visible = false
    else
    {
        audio_play_sound(snd_boss2_TimerBeep, 100, false)
        visible = true
    }
}
