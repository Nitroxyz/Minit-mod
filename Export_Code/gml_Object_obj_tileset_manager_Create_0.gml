tilesets[0] = -1
tileset_info[0] = -1
current_tileset = 0
masks = ""
repeat (256)
    masks += "0"
var set_number = 0
var fname = ""
while (asset_get_index("tileset" + string(set_number)) != -1)
{
    tilesets[set_number] = asset_get_index("tileset" + string(set_number))
    fname = "tileset_info" + string(set_number)
    if file_exists(fname)
    {
        tileset_info[set_number] = data_manager_load_json(fname)
        var _map = tileset_info[set_number]
        if (!(ds_map_exists(_map, "masks")))
        {
            ds_map_add(_map, "masks", masks)
            var str = json_encode(_map)
            save_file(fname, str)
        }
    }
    else
    {
        tileset_info[set_number] = ds_map_create()
        _map = tileset_info[set_number]
        ds_map_add(_map, "title", "default")
        ds_map_add(_map, "masks", masks)
        str = json_encode(_map)
        save_file(fname, str)
    }
    set_number++
}
current_tileset = 0
_map = tileset_info[current_tileset]
masks = ds_map_find_value(_map, "masks")
