if enemy_tick_stun_timer()
{
    if audio_is_playing(snd_ventboss_lazer_loop)
        audio_stop_sound(snd_ventboss_lazer_loop)
    if (previous_state == 626)
    {
        state = 622
        stopped_timer = 180
    }
    else
    {
        state = 626
        stopped_timer = stopped_timer_max
    }
    var sndflag = 0
    for (var i = 0; i < 4; i++)
    {
        if (!instance_exists(shields[i]))
        {
            sndflag = 1
            var d = 90 * i + 45
            shields[i] = instance_create(x, y, obj_boss_vent_shield)
            shields[i].image_angle = d - 45
            shields[i].dad = id
        }
    }
    if sndflag
        audio_play_sound(snd_ventboss_shield_create, 100, false)
    if (hp <= 0 && donotdestroy == 0)
    {
        script_execute(death_event)
        dontdestroy = 1
    }
}
if (!(place_meeting(x, (y + 16 * sign(vspd)), obj_wall)))
    y += vspd
else
{
    vspd *= -0.8
    shake_screen(10)
}
vspd -= 0.2
if (!(place_meeting((x + 16 * sign(hspd)), y, obj_wall)))
    x += hspd
else
{
    hspd *= -0.8
    shake_screen(10)
}
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
