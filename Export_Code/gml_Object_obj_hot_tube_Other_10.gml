if (iindex == 0)
{
    if (instance_exists(sidewall_a) && instance_exists(sidewall_b))
    {
        if (sidewall_a.open_hp <= 0 || sidewall_b.open_hp <= 0)
        {
            with (sidewall_a)
                instance_destroy()
            with (sidewall_b)
                instance_destroy()
            for (var i = 0; i < 6; i++)
            {
                if instance_exists(water[i])
                {
                    with (water[i])
                    {
                        instance_create(approach(x, (other.x + 8), 3), approach(y, (other.y + 24), 6), obj_glass_particle)
                        instance_destroy()
                    }
                }
            }
            audio_play_sound(snd_glass_shatter, 100, false)
            iindex = 2
        }
        else if (sidewall_a.open_hp != sidewall_a.open_hp_old)
        {
            iindex = 1.5
            sidewall_a.open_hp_old = sidewall_a.open_hp
            sidewall_b.open_hp_old = sidewall_b.open_hp
        }
        else if (sidewall_b.open_hp != sidewall_b.open_hp_old)
        {
            iindex = 1.5
            sidewall_a.open_hp_old = sidewall_a.open_hp
            sidewall_b.open_hp_old = sidewall_b.open_hp
        }
        else if place_meeting(x, y, obj_bulimp_sm)
        {
            sidewall_a.open_hp--
            sidewall_b.open_hp--
        }
    }
    else
    {
        if instance_exists(sidewall_a)
        {
            with (sidewall_a)
                instance_destroy()
        }
        if instance_exists(sidewall_b)
        {
            with (sidewall_b)
                instance_destroy()
        }
        for (i = 0; i < 6; i++)
        {
            if instance_exists(water[i])
            {
                with (water[i])
                {
                    instance_create(approach(x, (other.x + 8), 3), approach(y, (other.y + 24), 6), obj_glass_particle)
                    instance_destroy()
                }
            }
        }
        audio_play_sound(snd_glass_shatter, 100, false)
        iindex = 2
    }
}
else if (iindex == 2)
{
    if (bubble_timer > 0)
    {
        bubble_timer--
        if ((bubble_timer % 5) == 0 && irandom(3) == 0)
        {
            var t = instance_create((x - 4 + irandom(24)), (y + 6), obj_drip)
            t.depth = depth + 1
        }
    }
    else
    {
        t = instance_create((x - 4 + irandom(24)), (y + 6), obj_drip)
        t.depth = depth + 1
        bubble_timer = bubble_timer_max - irandom(10)
    }
}
else
    iindex = approach(iindex, 0, 0.25)
