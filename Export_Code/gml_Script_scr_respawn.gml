with (all)
{
    event_perform(ev_other, ev_room_end)
    if (!persistent)
    {
        c_destroy = 1
        instance_destroy()
    }
}
load_savefile()
