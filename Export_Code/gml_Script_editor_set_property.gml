with (obj_editor)
{
    switch grid_layer
    {
        case "player":
            t_layer = room_editor
            break
        case "foreground":
            t_layer = room_editor_f
            break
    }

    var t_method = "method" + string(argument0)
    var t_property = argument1
    var t_dsmap = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "properties")
    ds_map_replace(t_dsmap, t_method, t_property)
    if ds_map_exists(t_layer[grid_focus_i, grid_focus_j], t_method)
        ds_map_delete(t_layer[grid_focus_i, grid_focus_j], t_method)
    ds_map_add(t_layer[grid_focus_i, grid_focus_j], t_method, t_property)
}
