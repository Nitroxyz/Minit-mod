var finish_flag = 1
if (shoot_repeat > 0)
{
    shoot_repeat--
    finish_flag = 0
}
else
{
    shoot_repeat = shoot_repeat_max
    shake_screen(5)
    with (arm1)
    {
        if (armlength < 5)
        {
            var ttt = instance_create((x - 6 - armlength * 12), y, obj_boss2_seg_wall)
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
        else if (armlength < 8)
        {
            ttt = instance_create((x - 6 - 60), (y + (armlength - 5) * 12 + (armlength - 4)), obj_boss2_seg_wall)
            ttt.iindex = 1
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
    }
    with (arm2)
    {
        audio_play_sound(snd_boss2_ShieldNodeCreate, 5, false)
        if (armlength < 5)
        {
            ttt = instance_create((x - 6 - armlength * 12), y, obj_boss2_seg_wall)
            ttt.endsound_to_pass = 1
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
        else if (armlength < 8)
        {
            ttt = instance_create((x - 6 - 60), (y - (armlength - 5) * 12 - (armlength - 4)), obj_boss2_seg_wall)
            ttt.endsound_to_pass = 1
            ttt.iindex = 1
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
        if finish_flag
        {
            ttt = instance_create((x - 6 - 60), (y - (armlength - 5) * 12 - 4), obj_boss2_seg_wall)
            ttt.endsound_to_pass = 1
            ttt.iindex = 1
            ttt.soundflag_to_pass = 1
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
        }
    }
}
if (finish_flag == 1)
    process_boss2_begin_shield_barrage()
