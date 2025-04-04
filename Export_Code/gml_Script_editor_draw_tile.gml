if (!(ds_exists(t_layer[argument0, argument1], 1)))
{
    t_layer[argument0, argument1] = ds_map_create()
    ds_map_add(t_layer[argument0, argument1], "obj", palette_obj_selected)
    if (palette_obj_selected == obj_tile)
        var spr = ds_list_find_value(global.tileset_sprites[current_tileset], (palette_cur_j * 15 + palette_cur_i))
    else
        spr = sprite_get_name(object_get_sprite(palette_obj_selected))
    ds_map_add(t_layer[argument0, argument1], "spr", spr)
    ds_map_add(t_layer[argument0, argument1], "xscale", cursor_xscale)
    ds_map_add(t_layer[argument0, argument1], "yscale", cursor_yscale)
    ds_map_add(t_layer[argument0, argument1], "uid", uid_current)
    ds_map_add(t_layer[argument0, argument1], "rotation", cursor_rotation)
    uid_current++
}
else if (palette_obj_selected == obj_tile || palette_obj_selected != ds_map_find_value(t_layer[argument0, argument1], "obj"))
{
    ds_map_clear(t_layer[argument0, argument1])
    ds_map_add(t_layer[argument0, argument1], "obj", palette_obj_selected)
    if (palette_obj_selected == obj_tile)
        spr = ds_list_find_value(global.tileset_sprites[current_tileset], (palette_cur_j * 15 + palette_cur_i))
    else
        spr = sprite_get_name(object_get_sprite(palette_obj_selected))
    ds_map_add(t_layer[argument0, argument1], "spr", spr)
    ds_map_add(t_layer[argument0, argument1], "xscale", cursor_xscale)
    ds_map_add(t_layer[argument0, argument1], "yscale", cursor_yscale)
    ds_map_add(t_layer[argument0, argument1], "uid", uid_current)
    ds_map_add(t_layer[argument0, argument1], "rotation", cursor_rotation)
    uid_current++
}
