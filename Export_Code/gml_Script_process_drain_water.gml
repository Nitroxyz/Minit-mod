with (obj_lavatop)
    instance_destroy()
with (obj_vacant_sub)
{
    if (!(place_meeting(x, y, obj_lavatop)))
        instance_destroy()
}
with (obj_water_enemy)
    event_perform(ev_other, ev_room_start)
