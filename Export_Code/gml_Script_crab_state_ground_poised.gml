animate_custom()
if (c_anim_queue == -1 && c_anim_index == "anim_crab_ground_poised_idle" && (!instance_exists(obj_hotlava_flow_beam_v)))
{
    var t = instance_create(obj_boss3.right_claw.x, obj_boss3.right_claw.y, obj_hotlava_flow_beam_v)
    t.par = obj_boss3.right_claw
    with (t)
        event_perform(ev_other, ev_room_start)
    t = instance_create(obj_boss3.left_claw.x, obj_boss3.left_claw.y, obj_enemy_collider)
    t.par = obj_boss3.left_claw
}
if (state_timer > 0)
    state_timer--
else
{
    image_speed = 0.25
    c_anim_load_anim("anim_crab_ground_dash_prepare", "anim_crab_ground_dash")
    state_timer = state_timer_o / 3
    state = 606
}
