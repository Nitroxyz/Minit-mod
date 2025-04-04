var ev_type = ds_map_find_value(async_load, "event_type")
if (ev_type == "gamepad discovered")
    process_get_controller_type()
else if (ev_type == "gamepad lost")
{
    force_pause = 1
    process_get_controller_type()
}
