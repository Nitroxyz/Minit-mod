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
        if (armlength < 7)
        {
            var ttt = instance_create((x - 4 - armlength * 8), y, obj_boss2_seg_wall)
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
        else if (armlength < 12)
        {
            ttt = instance_create((x - 4 - 56), (y + (armlength - 7) * 8), obj_boss2_seg_wall)
            ttt.iindex = 1
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
    }
    with (arm2)
    {
        audio_play_sound(snd_boss2_ShieldNodeCreate, 5, false)
        if (armlength < 7)
        {
            ttt = instance_create((x - 4 - armlength * 8), y, obj_boss2_seg_wall)
            ttt.endsound_to_pass = 1
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
        else if (armlength < 12)
        {
            ttt = instance_create((x - 4 - 56), (y - (armlength - 7) * 8), obj_boss2_seg_wall)
            ttt.endsound_to_pass = 1
            ttt.iindex = 1
            ttt.tick_timer_to_pass += (4 * armlength)
            armlength++
            finish_flag = 0
        }
        if finish_flag
        {
            ttt = instance_create((x - 4 - 56), (y - (armlength - 7) * 8), obj_boss2_seg_wall)
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
