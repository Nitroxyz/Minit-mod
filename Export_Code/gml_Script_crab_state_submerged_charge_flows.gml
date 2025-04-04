animate_custom()
x = approach(x, target_x, 1)
y = approach(y, target_y, 1)
if (y == target_y && c_anim_index == "anim_crab_shoot_flows")
{
    state_timer = state_timer_o
    image_speed = 0.8
    state = 614
    var t = instance_create(left_claw.x, left_claw.y, obj_hotlava_flow_beam_h)
    t.par = left_claw
    t.dir = -1
    with (t)
        event_perform(ev_other, ev_room_start)
    t = instance_create(right_claw.x, right_claw.y, obj_hotlava_flow_beam_h)
    t.par = right_claw
    with (t)
        event_perform(ev_other, ev_room_start)
}
