if (edit_tool != "hand")
{
    if (cursor_rotation == 0 || cursor_rotation == 180)
        cursor_xscale *= -1
    else
        cursor_yscale *= -1
}
else if (grid_focus_i != -1)
{
    t_layer = room_editor
    switch grid_layer
    {
        case "player":
            t_layer = room_editor
            break
        case "foreground":
            t_layer = room_editor_f
            break
    }

    if (!(ds_map_empty(t_layer[grid_focus_i, grid_focus_j])))
    {
        var t_rot = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "rotation")
        if (t_rot == 0 || t_rot == 180)
        {
            var xscl = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "xscale")
            xscl *= -1
            ds_map_replace(t_layer[grid_focus_i, grid_focus_j], "xscale", xscl)
        }
        else
        {
            var yscl = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "yscale")
            yscl *= -1
            ds_map_replace(t_layer[grid_focus_i, grid_focus_j], "yscale", yscl)
        }
    }
}
