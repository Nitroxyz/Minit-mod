c_destroy = 0
name = ""
if (instance_number(MAP_MANAGER) > 1)
{
    c_destroy = 1
    instance_destroy()
    return;
}
else
    global.map_manager = id
map_current = "map0"
map_loaded = -1
map_num = 0
process_mapmanager_load()
