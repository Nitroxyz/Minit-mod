if (!obj_camera.reposition)
{
    state = 2
    with (obj_switch_room)
    {
        roomcenter_flag_prep = 1
        event_perform(ev_draw, ev_draw_begin)
    }
}
