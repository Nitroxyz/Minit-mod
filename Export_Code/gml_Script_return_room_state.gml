var room_num = global.current_room
var state = ds_map_find_value(global.room_states[MAP_MANAGER.map_current], room_num)
return state;
