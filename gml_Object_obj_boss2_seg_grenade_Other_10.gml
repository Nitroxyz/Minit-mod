hspd = lengthdir_x(spd, dir)
vspd = lengthdir_y(spd, dir)
spd = approach(spd, target_spd, accel)
dir = approach(dir, 180, 0.15)
if soundflag
{
    if ((tick_timer % ((tick_timer div 10) + 1)) == 0)
        audio_play_sound(snd_boss2_TimerBeep, 5, false)
}
if (spd == 0)
{
    if (tick_timer > 0)
        tick_timer--
    else
    {
        instance_destroy()
        repeat (4)
        {
            var t = instance_create((x - 4 + irandom(8)), (y - 4 + irandom(8)), obj_water_bubble)
            t.hspd = random_range(-1, 1)
            t.vspd = random_range(0, 1.5)
        }
        return;
    }
}
else
{
    x += hspd
    y += vspd
}
if place_meeting(x, y, obj_wall)
{
    instance_destroy()
    instance_create(x, y, obj_water_bubble)
    return;
}
if (alarm[0] >= 0)
{
    alarm[0]--
    if (alarm[0] == -1)
    {
        instance_create(x, y, obj_splosion)
        instance_create(x, y, obj_water_bubble)
        instance_create(x, y, obj_shakesmall2)
        instance_destroy()
        var t0 = audio_play_sound(snd_guardian_hitsound, 100, false)
        audio_sound_pitch(t0, random_range(1, 1.6))
    }
}
