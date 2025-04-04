if (!sprites_loaded)
{
    var surf = surface_create(256, 256)
    surface_set_target(surf)
    var fname = ""
    global.alltiles = ds_list_create()
    global.tile_conversion_table = ds_map_create()
    while (asset_get_index("tileset" + string(set_number)) != -1)
    {
        global.tilesets[set_number] = asset_get_index("tileset" + string(set_number))
        draw_clear_alpha(c_black, 0)
        draw_sprite(global.tilesets[set_number], 0, 0, 0)
        fname = "tileset_info" + string(set_number)
        if file_exists(fname)
        {
            var tile_counter = 0
            global.tileset_info[set_number] = data_manager_load_json(fname)
            global.tileset_sprites[set_number] = ds_list_create()
            global.tileset_masks[set_number] = ds_list_create()
            var _map = global.tileset_info[set_number]
            var str = ds_map_find_value(_map, "masks")
            var masks_counter = 0
            var str_counter = 0
            while (str != "")
            {
                if (string_char_at(str, 1) != "0")
                {
                    var spr = sprite_create_from_surface(surf, (16 * (str_counter % 16)), (16 * (str_counter div 16)), 16, 16, false, false, 8, 8)
                    var tileid = "tileset" + string(set_number) + "_" + string(str_counter)
                    ds_map_add(global.tile_conversion_table, tileid, sprite_get_name(spr))
                    ds_list_add(global.tileset_sprites[set_number], tileid)
                    switch string_char_at(str, 1)
                    {
                        case "1":
                            ds_list_add(global.tileset_masks[set_number], 0)
                            break
                        case "2":
                            ds_list_add(global.tileset_masks[set_number], 1)
                            break
                        case "3":
                            ds_list_add(global.tileset_masks[set_number], 2)
                            break
                        case "4":
                            ds_list_add(global.tileset_masks[set_number], 3)
                            break
                        case "5":
                            ds_list_add(global.tileset_masks[set_number], 4)
                            break
                        case "6":
                            ds_list_add(global.tileset_masks[set_number], 5)
                            break
                    }

                    ds_list_add(global.alltiles, tileid)
                    masks_counter++
                }
                str_counter++
                if (string_length(str) > 1)
                    str = string_copy(str, 2, (string_length(str) - 1))
                else
                    str = ""
            }
        }
        set_number++
    }
    surface_reset_target()
    surface_free(surf)
    sprites_loaded = 1
}
if audio_group_is_loaded(1)
{
    process_generate_audio_default_volumes()
    process_set_audio_relative_gain()
    room_goto_next()
}
