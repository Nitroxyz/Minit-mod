if (!(ds_exists(global.map_manager.map_loaded, 1)))
    process_mapmanager_load()
var map_wrapper = global.map_manager.map_loaded
if (!(ds_map_exists(map_wrapper, "default_room")))
    ds_map_add(map_wrapper, "default_room", "0808")
if (argument_count > 0)
    var roomnumber = argument[0]
else
    roomnumber = global.current_room
if ds_map_exists(map_wrapper, roomnumber)
    ds_map_delete(map_wrapper, roomnumber)
str = json_encode(map_wrapper)
ds_map_destroy(map_wrapper)
save_file(global.map_manager.map_current, str)
