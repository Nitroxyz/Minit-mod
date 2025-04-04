if mouse_inside_region(8, 8, 263, 263)
{
    if mouse_check_button_pressed(mb_left)
    {
        var i = clamp(floor((mouse_x - 8) / 16), 0, 15)
        var j = clamp(floor((mouse_y - 8) / 16), 0, 15)
        var chardel = string_copy(masks, (i + 16 * j + 1), 1)
        var charnew = string(wrap((real(chardel) + 1), 0, 7))
        masks = string_delete(masks, (i + 16 * j + 1), 1)
        masks = string_insert(charnew, masks, (i + 16 * j + 1))
        var _map = tileset_info[current_tileset]
        ds_map_set(_map, "masks", masks)
        var fname = "tileset_info" + string(current_tileset)
        var str = json_encode(_map)
        save_file(fname, str)
    }
}
