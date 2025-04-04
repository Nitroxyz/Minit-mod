if (shoot_repeat > 0)
    shoot_repeat--
else if instance_exists(obj_boss2_seg_wall)
{
    var ttt = self
    with (obj_boss2_seg_wall)
    {
        ttt = instance_create(x, y, obj_boss2_seg_grenade)
        ttt.soundflag = soundflag_to_pass
        ttt.endsound = endsound_to_pass
        ttt.tick_timer = tick_timer_to_pass
        ttt.dir = point_direction(400, 96, x, y)
        instance_destroy()
    }
    audio_play_sound(snd_boss2_ShieldNodeDestroy, 5, false)
}
else if (!instance_exists(obj_boss2_seg_grenade))
{
    if (shoot_repeat > -60)
    {
        shoot_repeat--
        if (shoot_repeat == -30)
            process_boss2_shoot_2_mines_inner()
    }
    else
        process_boss2_begin_circle_barrage()
}
