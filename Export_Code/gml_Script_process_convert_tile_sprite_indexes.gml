if (string_copy(argument0, 1, 2) == "__")
    return ds_map_find_value(global.tile_conversion_table, argument0);
else
    return argument0;
