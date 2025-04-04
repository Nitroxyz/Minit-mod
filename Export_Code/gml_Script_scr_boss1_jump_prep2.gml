var old_height = height
if (height < 38)
{
    height += jumpspeed
    if (jumpspeed < 4)
        jumpspeed++
    leg_l.image_xscale = height / 9
    leg_r.image_xscale = height / 9
}
else
{
    height = 38
    state = 420
    head.image_index = 2
    if (x < (0.33 * (__view_get(2, 0))))
    {
        xtar = xstart
        scr_boss1_leg_height_sep(height, (height - 12))
    }
    else if (x > (0.33 * (__view_get(2, 0))) && x < (0.66 * (__view_get(2, 0))))
    {
        if (cur1 == 0)
        {
            scr_boss1_leg_height_sep(height, (height - 12))
            xtar = xstart + 80
            cur1 = 1
        }
        else
        {
            scr_boss1_leg_height_sep((height - 12), height)
            xtar = xstart - 80
            cur1 = 0
        }
    }
    else
    {
        xtar = xstart
        scr_boss1_leg_height_sep((height - 12), height)
    }
    hspd = 3 * (sign(xtar - x))
    xtar = x
    ytar = y
    vspd = -4.5
    var snd = audio_play_sound(snd_jump, 100, false)
    audio_sound_pitch(snd, random_range(0.6, 0.7))
}
new_y = y + (old_height - height)
scr_boss1_arms_retract(0.33, 0.33)
scr_boss1_body_move(x, new_y)
