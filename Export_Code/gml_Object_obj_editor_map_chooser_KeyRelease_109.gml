if mouse_inside_region(x, y, (2 * sprite_width), sprite_height)
{
    prop_cur--
    if (prop_cur < 0)
        prop_cur = 6
    var maptarget = property[prop_cur]
    with (obj_editor)
    {
        editor_save_room()
        process_editor_reset_room_extensions()
        process_mapmanager_changemap(maptarget)
        if (!(ds_map_exists(MAP_MANAGER.map_loaded, "default_room")))
            var roomtarget = "0808"
        else
            roomtarget = ds_map_find_value(MAP_MANAGER.map_loaded, "default_room")
        global.room_start = roomtarget
        editor_load_room(roomtarget)
    }
}
