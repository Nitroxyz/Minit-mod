with (MAP_MANAGER)
{
    map_current = argument[0]
    map_num = real(string_copy(map_current, 4, 1))
    if ds_exists(map_loaded, 1)
        ds_map_destroy(map_loaded)
    map_loaded = data_manager_load_json(map_current)
    process_mapmanager_generate_minimap()
    process_mapmanager_findname()
}
if (argument_count > 1)
    global.current_room = argument[1]
