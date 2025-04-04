c_anim_loopflag = 0
var c_anim_cur_old = c_anim_cur
c_anim_cur_real = wrap((c_anim_cur_real + image_speed), 0, c_anim_length)
c_anim_cur = floor(c_anim_cur_real)
if (c_anim_cur_old != c_anim_cur)
{
    if (c_anim_cur_old > c_anim_cur)
    {
        c_anim_loopflag = 1
        if (c_anim_index_stun != -1)
        {
            image_speed = c_anim_image_speed_stun
            c_anim_load_anim(c_anim_index_stun, c_anim_queue_stun, c_anim_queue_repeat_stun)
            c_anim_cur = c_anim_cur_stun
            c_anim_cur_real = c_anim_cur_real_stun
            c_anim_index_stun = -1
            c_anim_cur_stun = -1
            c_anim_cur_real_stun = -1
            c_anim_image_speed_stun = -1
            c_anim_queue_stun = -1
            c_anim_queue_repeat_stun = -1
            animate_custom()
        }
        else if (c_anim_queue != -1)
        {
            if (c_anim_queue_repeat > 0)
                c_anim_queue_repeat--
            else
            {
                c_anim_load_anim(c_anim_queue)
                image_speed = c_anim_queue_speed
                return;
            }
        }
    }
    if (c_anim_sound[c_anim_cur] != -1)
        audio_play_sound(asset_get_index("snd" + string(c_anim_sound[c_anim_cur])), 100, false)
    if (c_anim_effect[c_anim_cur] != -1)
    {
        if (asset_get_index("obj_fx" + string(c_anim_effect[c_anim_cur])) != -1)
            instance_create(x, y, asset_get_index("obj_fx" + string(c_anim_effect[c_anim_cur])))
    }
    c_anim_reposition_all()
}
