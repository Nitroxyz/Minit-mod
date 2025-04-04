if (spin_speed < 30)
{
    spin_speed += 0.25
    if ((spin_speed % 7) == 0)
    {
        var i = 0
        while (i < 4)
        {
            if (shields[i] == self)
            {
                shake_screen(4)
                var d = 90 * i + spin_angle
                shields[i] = instance_create(x, y, obj_boss_vent_shield)
                shields[i].image_angle = d - 45
                shields[i].dad = id
                audio_play_sound(snd_ventboss_shield_create, 100, false)
                break
            }
            else
            {
                i++
                continue
            }
        }
    }
}
else
{
    for (i = 0; i < 4; i++)
    {
        if (shields[i] == self)
        {
            d = 90 * i + spin_angle
            shields[i] = instance_create(x, y, obj_boss_vent_shield)
            shields[i].image_angle = d - 45
            shields[i].dad = id
            audio_play_sound(snd_ventboss_shield_create, 100, false)
        }
    }
    invul = 0
    stopped_timer = stopped_timer_max
    state = 621
    hspd = 0
    vspd = 0
    spin_speed = 30
    chosen_stop_angle = choose(360, 90, 180, 270)
}
spin_angle += spin_speed
spin_angle = wrap(spin_angle, 0, 360)
spin_angle = round(spin_angle)
var shieldcount = 0
for (i = 0; i < 4; i++)
{
    d = 90 * i + spin_angle
    if instance_exists(shields[i])
    {
        shieldcount++
        shields[i].image_angle = d
        shields[i].x = x
        shields[i].y = y
    }
}
if (shieldcount > 0)
{
    if audio_is_playing(snd_ventboss_spin_state)
    {
        audio_sound_pitch(snd_ventboss_spin_state, (spin_speed / 60 + 0.5))
        audio_sound_gain(snd_ventboss_spin_state, (spin_speed / 40), 1)
    }
    else
        audio_play_sound(snd_ventboss_spin_state, 100, true)
}
else if audio_is_playing(snd_ventboss_spin_state)
    audio_stop_sound(snd_ventboss_spin_state)
