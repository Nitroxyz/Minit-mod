var new_x = lerp(x, xbegin, 0.07)
arm_l.image_xscale += ((new_x - x) / 9)
arm_r.image_xscale -= ((new_x - x) / 9)
scr_boss1_body_move(new_x, y)
turretc_vis = 0
if (!audio_is_playing(RailBossRailmovement))
{
    railsound = audio_play_sound(RailBossRailmovement, 100, true)
    var ptc = (abs(x - xprevious)) / 3
    audio_sound_pitch(railsound, hspd)
}
else
    audio_sound_pitch(railsound, hspd)
if (abs(x - xbegin) < 1.5)
{
    if (x != xbegin)
        scr_boss1_body_move(xbegin, y)
    else
    {
        if audio_is_playing(railsound)
            audio_stop_sound(railsound)
        head.image_index = 2
        if (arm_l.image_xscale != 0.5)
            scr_boss1_arms_retract(0.5, 0.5)
        else
        {
            head.image_index = 0
            if (height < 12)
                height += (height / 10 + 0.2)
            else
                boss1_jump_mode()
        }
    }
}
