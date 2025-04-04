var temp_map = ds_map_create()
var tile_number = 0
var _map = tileset_info[current_tileset]
for (var j = 0; j < 16; j++)
{
    for (var i = 0; i < 16; i++)
    {
        var flag = 0
        for (var tx = 0; tx < 16; tx++)
        {
            if (!flag)
            {
                for (var ty = 0; ty < 16; ty++)
                {
                    if (draw_getpixel((i * 16 + tx), (j * 16 + ty)) != 0)
                        flag = 1
                }
            }
        }
        if flag
        {
            ds_map_add_map(temp_map, ("tile" + string(tile_number)), ds_map_create())
            var t_tilemap = ds_map_find_value(temp_map, ("tile" + string(tile_number)))
            ds_map_add(t_tilemap, "i", i)
            ds_map_add(t_tilemap, "j", j)
            var ii = 0
            var tmask = "normal"
            while ds_map_exists(_map, ("tile" + string(ii)))
            {
                var tt_tilemap = ds_map_find_value(_map, ("tile" + string(ii)))
                if (ds_map_find_value(tt_tilemap, "i") == i && ds_map_find_value(tt_tilemap, "j") == j)
                {
                    tmask = ds_map_find_value(tt_tilemap, "mask")
                    break
                }
                else
                {
                    ii++
                    continue
                }
            }
            ds_map_add(t_tilemap, "mask", tmask)
            var masks_index = 0
            switch tmask
            {
                case "normal":
                    masks_index = 1
                    break
                case "angle0":
                    masks_index = 2
                    break
                case "angle1":
                    masks_index = 3
                    break
                case "angle2":
                    masks_index = 4
                    break
                case "angle3":
                    masks_index = 5
                    break
            }

            masks[i, j] = masks_index
        }
    }
}
if ds_map_exists(temp_map, "masks")
    ds_map_set(temp_map, "masks", masks)
else
    ds_map_add(temp_map, "masks", masks)
tileset_info[current_tileset] = temp_map
ds_map_destroy(temp_map)
var str = json_encode(tileset_info[current_tileset])
save_file(("tileset_info" + string(current_tileset)), str)
