current_tileset = wrap((current_tileset - 1), 0, array_length_1d(tileset_info))
var _map = tileset_info[current_tileset]
masks = ds_map_find_value(_map, "masks")
