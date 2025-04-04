var filltile = argument0
if (filltile == -1)
{
    if (palette_obj_selected == self)
        ds_map_clear(t_layer[argument1, argument2])
    else
    {
        ds_map_clear(t_layer[argument1, argument2])
        ds_map_add(t_layer[argument1, argument2], "obj", palette_obj_selected)
        if (palette_obj_selected == obj_tile)
            var spr = ds_list_find_value(global.tileset_sprites[current_tileset], (palette_cur_j * 15 + palette_cur_i))
        else
            spr = sprite_get_name(object_get_sprite(palette_obj_selected))
        ds_map_add(t_layer[argument1, argument2], "spr", spr)
        ds_map_add(t_layer[argument1, argument2], "xscale", cursor_xscale)
        ds_map_add(t_layer[argument1, argument2], "yscale", cursor_yscale)
        ds_map_add(t_layer[argument1, argument2], "uid", uid_current)
        ds_map_add(t_layer[argument1, argument2], "rotation", cursor_rotation)
        uid_current++
    }
    if ((argument1 + 1) < array_height_2d(t_layer))
    {
        if is_undefined(ds_map_find_value(t_layer[(argument1 + 1), argument2], "obj"))
            editor_fill_tile(filltile, (argument1 + 1), argument2)
    }
    if ((argument1 - 1) >= 0)
    {
        if is_undefined(ds_map_find_value(t_layer[(argument1 - 1), argument2], "obj"))
            editor_fill_tile(filltile, (argument1 - 1), argument2)
    }
    if ((argument2 + 1) < array_length_2d(t_layer, 0))
    {
        if is_undefined(ds_map_find_value(t_layer[argument1, (argument2 + 1)], "obj"))
            editor_fill_tile(filltile, argument1, (argument2 + 1))
    }
    if ((argument2 - 1) >= 0)
    {
        if is_undefined(ds_map_find_value(t_layer[argument1, (argument2 - 1)], "obj"))
            editor_fill_tile(filltile, argument1, (argument2 - 1))
    }
}
else
{
    if (palette_obj_selected == self)
        ds_map_clear(t_layer[argument1, argument2])
    else
    {
        ds_map_clear(t_layer[argument1, argument2])
        ds_map_add(t_layer[argument1, argument2], "obj", palette_obj_selected)
        if (palette_obj_selected == obj_tile)
            spr = ds_list_find_value(global.tileset_sprites[current_tileset], (palette_cur_j * 15 + palette_cur_i))
        else
            spr = sprite_get_name(object_get_sprite(palette_obj_selected))
        ds_map_add(t_layer[argument1, argument2], "spr", spr)
        ds_map_add(t_layer[argument1, argument2], "xscale", cursor_xscale)
        ds_map_add(t_layer[argument1, argument2], "yscale", cursor_yscale)
        ds_map_add(t_layer[argument1, argument2], "uid", uid_current)
        ds_map_add(t_layer[argument1, argument2], "rotation", cursor_rotation)
        uid_current++
    }
    if ((argument1 + 1) < array_height_2d(t_layer))
    {
        if (ds_map_find_value(t_layer[(argument1 + 1), argument2], "obj") == filltile)
            editor_fill_tile(filltile, (argument1 + 1), argument2)
    }
    if ((argument1 - 1) >= 0)
    {
        if (ds_map_find_value(t_layer[(argument1 - 1), argument2], "obj") == filltile)
            editor_fill_tile(filltile, (argument1 - 1), argument2)
    }
    if ((argument2 + 1) < array_length_2d(t_layer, 0))
    {
        if (ds_map_find_value(t_layer[argument1, (argument2 + 1)], "obj") == filltile)
            editor_fill_tile(filltile, argument1, (argument2 + 1))
    }
    if ((argument2 - 1) >= 0)
    {
        if (ds_map_find_value(t_layer[argument1, (argument2 - 1)], "obj") == filltile)
            editor_fill_tile(filltile, argument1, (argument2 - 1))
    }
}
