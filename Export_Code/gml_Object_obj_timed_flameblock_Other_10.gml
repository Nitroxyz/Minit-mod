if (!active)
    return;
if (tick_timer == 0)
{
    if (flameobj == self)
    {
        flameobj = instance_create(x, y, obj_boss3_flamegenerator)
        flaming = 1
        tick_timer = tick_timer_max
    }
    else
    {
        if instance_exists(flameobj)
        {
            with (flameobj)
                instance_destroy()
        }
        tick_timer = tick_timer_max * 2
        flameobj = self
    }
    animate_actor()
}
else
{
    if (!flaming)
        tick_timer--
    if (iindex > 0)
        iindex = approach(iindex, 0, 0.4)
}
if (flameobj == -1 && (tick_timer % tick_timer_mod_value) == 0)
{
    iindex = 1.98
    if makesound
        audio_play_sound(snd_flameblock_warning, 5, false)
    tick_timer_mod_value = (tick_timer div 10) + 1
}
