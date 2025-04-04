if instance_exists(obj_door1_U)
{
    with (obj_door1_U)
        event_perform(ev_other, ev_user0)
}
else
    state = 15
