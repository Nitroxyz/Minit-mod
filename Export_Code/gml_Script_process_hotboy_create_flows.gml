flow = -1
if (image_xscale == 1)
{
    flow[0] = instance_create(120, 8, obj_lavaflow_source)
    flow[1] = instance_create(168, 8, obj_lavaflow_source)
    flow[2] = instance_create(216, 8, obj_lavaflow_source)
    flow[3] = instance_create(264, 8, obj_lavaflow_source)
    flow[0].inactive_timer = 99999
    flow[1].inactive_timer = 99999
    flow[2].inactive_timer = 99999
    flow[3].inactive_timer = 99999
    flow[0].inactive_timer_max = 99999
    flow[1].inactive_timer_max = 99999
    flow[2].inactive_timer_max = 99999
    flow[3].inactive_timer_max = 99999
    flow[0].inactive_timer_max_o = 10
    flow[1].inactive_timer_max_o = 10
    flow[2].inactive_timer_max_o = 10
    flow[3].inactive_timer_max_o = 10
    with (flow[0])
        event_perform(ev_other, ev_room_start)
    with (flow[1])
        event_perform(ev_other, ev_room_start)
    with (flow[2])
        event_perform(ev_other, ev_room_start)
    with (flow[3])
        event_perform(ev_other, ev_room_start)
}
else
{
    flow[0] = instance_create(40, 8, obj_lavaflow_source)
    flow[1] = instance_create(88, 8, obj_lavaflow_source)
    flow[2] = instance_create(136, 8, obj_lavaflow_source)
    flow[3] = instance_create(184, 8, obj_lavaflow_source)
    flow[0].inactive_timer = 99999
    flow[1].inactive_timer = 99999
    flow[2].inactive_timer = 99999
    flow[3].inactive_timer = 99999
    flow[0].inactive_timer_max = 99999
    flow[1].inactive_timer_max = 99999
    flow[2].inactive_timer_max = 99999
    flow[3].inactive_timer_max = 99999
    flow[0].inactive_timer_max_o = 10
    flow[1].inactive_timer_max_o = 10
    flow[2].inactive_timer_max_o = 10
    flow[3].inactive_timer_max_o = 10
    with (flow[0])
        event_perform(ev_other, ev_room_start)
    with (flow[1])
        event_perform(ev_other, ev_room_start)
    with (flow[2])
        event_perform(ev_other, ev_room_start)
    with (flow[3])
        event_perform(ev_other, ev_room_start)
}
