var t = ds_map_find_value(global.tile_conversion_table, argument0)
if is_undefined(t)
    return "spr_none";
else
    return t;
