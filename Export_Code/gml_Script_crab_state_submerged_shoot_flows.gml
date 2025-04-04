animate_custom()
if (state_timer > 0)
    state_timer--
else
{
    state_timer = state_timer_o
    state = 613
    with (obj_hotlava_flow_beam_h)
        instance_destroy()
    image_speed = 0.4
    target_y = ystart
    c_anim_load_anim("anim_crab_retract_flows", "anim_crab_submerged_idle")
}
