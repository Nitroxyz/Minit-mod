if mouse_inside_region(42, 12, 303, 191)
{
    grid_selected = 1
    grid_select_i = (mouse_x - 42) div 16
    grid_select_j = (mouse_y - 12) div 16
    grid_select_x = 16 * grid_select_i + 8
    grid_select_y = 16 * grid_select_j + 8
    if mouse_check_button(mb_left)
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

        if (set_spawn == 0)
        {
            grid_focus_i = grid_select_i
            grid_focus_j = grid_select_j
            editor_clear_properties_pane()
            if (palette_obj_selected != -1)
            {
                switch edit_tool
                {
                    case "arrow":
                        editor_draw_tile(grid_select_i, grid_select_j)
                        var t_obj = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj")
                        editor_get_tile_properties(grid_focus_i, grid_focus_j, t_obj)
                        break
                    case "brush":
                        if is_undefined(ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj"))
                            var fill_tar = -1
                        else
                            fill_tar = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj")
                        if (fill_tar != palette_obj_selected)
                            editor_fill_tile(fill_tar, grid_select_i, grid_select_j)
                        break
                    case "dropper":
                        drop = -1
                        if (!(is_undefined(ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "obj"))))
                        {
                            drop = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "obj")
                            cursor_xscale = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "xscale")
                            cursor_yscale = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "yscale")
                            cursor_rotation = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "rotation")
                        }
                        else if (!(is_undefined(ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "obj"))))
                        {
                            drop = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "obj")
                            cursor_xscale = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "xscale")
                            cursor_yscale = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "yscale")
                            cursor_rotation = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "rotation")
                        }
                        else
                            drop = -1
                        dropperflag = 1
                        break
                    case "hand":
                        if mouse_check_button_pressed(mb_left)
                        {
                            if (grid_layer == "foreground" && (!(is_undefined(ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "obj")))))
                                grid_layer = "player"
                            else if (grid_layer == "player" && (!(is_undefined(ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "obj")))))
                                grid_layer = "foreground"
                            switch grid_layer
                            {
                                case "player":
                                    t_layer = room_editor
                                    break
                                case "foreground":
                                    t_layer = room_editor_f
                                    break
                            }

                        }
                        if (!(is_undefined(ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj"))))
                        {
                            t_obj = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj")
                            editor_get_tile_properties(grid_focus_i, grid_focus_j, t_obj)
                        }
                        break
                }

            }
            else if (edit_tool == "brush")
            {
                if (!(is_undefined(ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj"))))
                {
                    fill_tar = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj")
                    editor_fill_tile(fill_tar, grid_select_i, grid_select_j)
                }
            }
            else if (edit_tool == "dropper")
            {
                drop = -1
                if (!(is_undefined(ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "obj"))))
                {
                    drop = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "obj")
                    cursor_xscale = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "xscale")
                    cursor_yscale = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "yscale")
                    cursor_rotation = ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "rotation")
                    grid_layer = "player"
                }
                else if (!(is_undefined(ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "obj"))))
                {
                    drop = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "obj")
                    cursor_xscale = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "xscale")
                    cursor_yscale = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "yscale")
                    cursor_rotation = ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "rotation")
                    grid_layer = "foreground"
                }
                else
                {
                    drop = -1
                    grid_layer = "player"
                }
                dropperflag = 1
            }
            else if (edit_tool == "hand")
            {
                if mouse_check_button_pressed(mb_left)
                {
                    if (grid_layer == "foreground" && (!(is_undefined(ds_map_find_value(room_editor[grid_focus_i, grid_focus_j], "obj")))))
                        grid_layer = "player"
                    else if (grid_layer == "player" && (!(is_undefined(ds_map_find_value(room_editor_f[grid_focus_i, grid_focus_j], "obj")))))
                        grid_layer = "foreground"
                    switch grid_layer
                    {
                        case "player":
                            t_layer = room_editor
                            break
                        case "foreground":
                            t_layer = room_editor_f
                            break
                    }

                }
                if (!(is_undefined(ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj"))))
                {
                    t_obj = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], "obj")
                    editor_get_tile_properties(grid_focus_i, grid_focus_j, t_obj)
                }
            }
        }
        else
            spawn_flag = 1
    }
    else if mouse_check_button_pressed(mb_right)
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

        if ((!(ds_exists(t_layer[grid_select_i, grid_select_j], 1))) || ds_map_empty(t_layer[grid_select_i, grid_select_j]))
        {
            if (t_layer == room_editor)
            {
                grid_layer = "foreground"
                t_layer = room_editor_f
            }
            else
            {
                grid_layer = "player"
                t_layer = room_editor
            }
        }
    }
    else if mouse_check_button(mb_right)
    {
        if ds_exists(t_layer[grid_select_i, grid_select_j], 1)
            ds_map_clear(t_layer[grid_select_i, grid_select_j])
        editor_clear_properties_pane()
    }
    else
    {
        if dropperflag
        {
            dropperflag = 0
            palette_obj_selected = drop
            cursor_change(last_tool)
            scr_cout(object_get_description(palette_obj_selected))
        }
        if spawn_flag
        {
            global.spawn_x = grid_select_x
            global.spawn_y = grid_select_y
            global.editor_spawn_x = global.spawn_x
            global.editor_spawn_y = global.spawn_y
            set_spawn = 0
            spawn_flag = 0
            cursor_change(edit_tool)
        }
    }
}
else
    grid_selected = 0
if mouse_inside_region((palette_x + 30), palette_y, 264, 112)
    palette_hover()
else
{
    palette_hov_x = -1
    palette_hov_y = -1
}
