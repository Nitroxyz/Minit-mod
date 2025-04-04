if active
{
    if (tick_timer == 0)
    {
        for (var i = 0; i < 8; i++)
        {
            var d = 45 * i
            var bullet = instance_create((x + (lengthdir_x(12, d))), (y + (lengthdir_y(12, d))), obj_pufferfish_spike)
            bullet.dir = d
        }
        instance_destroy()
        instance_create(x, y, obj_shakesmall2)
        return;
    }
    else
        tick_timer--
    if (iindex > 0)
        iindex = approach(iindex, 0, 0.4)
    if ((tick_timer % tick_timer_mod_value) == 0)
    {
        iindex = 1.98
        var t = instance_create((x - 4 + irandom(8)), (y - 4 + irandom(8)), obj_water_bubble_catbreath)
        t.hspd = random_range(-1, 1)
        t.vspd = random_range(0, 1.5)
        audio_play_sound(snd_boss2_TimerBeep, 5, false)
        tick_timer_mod_value = (tick_timer div 10) + 2
    }
}
else if (drift_delay > 0)
    drift_delay--
else if instance_exists(obj_player)
{
    d = point_distance(x, y, obj_player.x, obj_player.y)
    if (d < 64)
        active = 1
}
if (state == stun_state)
    enemy_state_stun_sprite_override()
