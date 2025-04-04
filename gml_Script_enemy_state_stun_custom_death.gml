if enemy_tick_stun_timer()
{
    if instance_exists(master)
    {
        with (master)
        {
            if (c_anim_index != c_anim_stun)
            {
                c_anim_index_stun = c_anim_index
                c_anim_cur_stun = c_anim_cur
                c_anim_cur_real_stun = c_anim_cur_stun + 1 - image_speed
                c_anim_image_speed_stun = image_speed
                c_anim_queue_stun = c_anim_queue
                c_anim_queue_repeat_stun = c_anim_queue_repeat
            }
            c_anim_load_anim(c_anim_stun)
            image_speed = 0.8
        }
    }
    state = previous_state
    if (hp <= 0 && donotdestroy == 0)
        script_execute(death_event)
}
