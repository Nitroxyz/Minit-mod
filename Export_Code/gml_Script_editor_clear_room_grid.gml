for (var i = 0; i < 19; i++)
{
    for (var j = 0; j < 12; j++)
    {
        if ds_map_exists(room_editor[i, j], "properties")
            ds_map_destroy(ds_map_find_value(room_editor[i, j], "properties"))
        ds_map_clear(room_editor[i, j])
    }
}
for (i = 0; i < 19; i++)
{
    for (j = 0; j < 12; j++)
    {
        if ds_map_exists(room_editor_f[i, j], "properties")
            ds_map_destroy(ds_map_find_value(room_editor_f[i, j], "properties"))
        ds_map_clear(room_editor_f[i, j])
    }
}
