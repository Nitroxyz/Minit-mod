if (edit_tool != "hand")
    cursor_rotation = (cursor_rotation - 90) % 360
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
        t_rot -= 90
        if (t_rot < 0)
            t_rot += 360
        ds_map_replace(t_layer[grid_focus_i, grid_focus_j], "rotation", t_rot)
    }
}
