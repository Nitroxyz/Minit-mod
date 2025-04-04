start_room = global.current_room
global.room_start = start_room
var map_wrapper = global.map_manager.map_loaded
if (!(ds_map_exists(map_wrapper, "default_room")))
    ds_map_add(map_wrapper, "default_room", "0808")
ds_map_replace(map_wrapper, "default_room", start_room)
