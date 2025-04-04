animate_custom()
if (c_anim_queue == -1)
{
    if (state_timer > 0)
    {
        if (!(place_meeting((x - image_xscale * 16), y, obj_wall)))
        {
            x -= image_xscale
            state_timer++
            if ((state_timer % 10) == 0)
            {
                var ttt = instance_create((x + image_xscale * 16), y, obj_flamebot_flame)
                ttt.movedir = 90 - 90 * image_xscale
                ttt.spd = 0.125
                ttt.depth = 12
                audio_play_sound(snd_flamebot_flameloop, 100, false)
            }
        }
        else
        {
            image_xscale *= -1
            image_speed = 0.25
            c_anim_load_anim("anim_crab_ground_prepare_handsup", "anim_crab_ground_handsup_idle")
            state_timer = state_timer_o / 3
            state = 605
            if instance_exists(obj_hotlava_flow_beam_v)
            {
                with (obj_hotlava_flow_beam_v)
                    instance_destroy()
            }
            if instance_exists(obj_enemy_collider)
            {
                with (obj_enemy_collider)
                    instance_destroy()
            }
        }
    }
    else
    {
        c_anim_load_anim("anim_crab_ground_dash_prepare", "anim_crab_ground_dash")
        state_timer = state_timer_o / 4
    }
}
