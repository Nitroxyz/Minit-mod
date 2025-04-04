if (tick_timer == 0)
{
    for (var i = 0; i < 8; i++)
    {
        var d = 45 * i
        var bullet = instance_create((x + (lengthdir_x(24, d))), (y + (lengthdir_y(24, d))), obj_pufferfish_spike)
        bullet.dir = d
    }
    if audio_is_playing(snd_pufferfish_shoot)
        audio_stop_sound(snd_pufferfish_shoot)
    audio_play_sound(snd_pufferfish_shoot, 100, false)
    instance_destroy()
    repeat (4)
    {
        var t = instance_create((x - 4 + irandom(8)), (y - 4 + irandom(8)), obj_water_bubble_catbreath)
        t.hspd = random_range(-1, 1)
        t.vspd = random_range(0, 1.5)
    }
    return;
}
else
    tick_timer--
if (x > 144)
    hspd = approach(hspd, target_spd, accel)
else
    hspd = approach(hspd, 0, accel)
x += hspd
y += vspd
if (iindex > 0)
    iindex = approach(iindex, 0, 0.4)
if ((tick_timer % tick_timer_mod_value) == 0)
{
    iindex = 1.98
    t = instance_create((x - 4 + irandom(8)), (y - 4 + irandom(8)), obj_water_bubble_catbreath)
    t.hspd = random_range(-1, 1)
    t.vspd = random_range(0, 1.5)
    audio_play_sound(snd_boss2_TimerBeep, 5, false)
    tick_timer_mod_value = (tick_timer div 10) + 1
}
if (state == stun_state)
    enemy_state_stun_sprite_override()
