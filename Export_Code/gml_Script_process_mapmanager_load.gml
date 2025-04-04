if (argument_count == 1)
{
    MAP_MANAGER.map_current = argument[0]
    MAP_MANAGER.map_num = real(string_copy(MAP_MANAGER.map_current, 4, 1))
}
with (MAP_MANAGER)
{
    map_loaded = data_manager_load_json(map_current)
    map_num = real(string_copy(map_current, 4, 1))
    process_mapmanager_generate_minimap()
    process_mapmanager_findname()
}
return MAP_MANAGER.map_loaded;
