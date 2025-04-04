animate_custom()
if (c_anim_queue == -1 && c_anim_index == "anim_crab_ground_handsup_idle" && instance_exists(obj_hotlava_flow_beam_v))
{
    with (obj_hotlava_flow_beam_v)
        instance_destroy()
}
if (state_timer > 0)
    state_timer--
else
{
    if (c_anim_index == "anim_crab_ground_handsup_idle")
    {
        image_xscale *= -1
        image_speed = 0.5
        c_anim_load_anim("anim_crab_ground_walk")
    }
    else if instance_exists(obj_player)
    {
        if (sign(x - obj_player.x) == image_xscale)
        {
            if ((!instance_exists(obj_grenade_grenadier)) && c_anim_cur == 0)
            {
                var t = instance_create(obj_boss3.left_claw.x, (obj_boss3.left_claw.y - 10), obj_grenade_grenadier)
                t.hspd *= (-image_xscale)
            }
        }
    }
    if (!(place_meeting((x + image_xscale * 16), y, obj_wall)))
        x += (image_xscale / 2)
    else
    {
        image_speed = 0.25
        c_anim_load_anim("anim_crab_ground_prepare_poised", "anim_crab_ground_poised_idle")
        state_timer = state_timer_o
        state = 607
    }
}
