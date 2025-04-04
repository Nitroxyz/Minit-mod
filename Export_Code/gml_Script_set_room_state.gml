with (GAME_MANAGER)
{
    scr_get_room_ids()
    for (var i = 0; i < array_length_1d(rooms); i++)
    {
        var room_num = rooms[i]
        ds_map_set(global.room_states[MAP_MANAGER.map_num], room_num, argument0)
    }
}
