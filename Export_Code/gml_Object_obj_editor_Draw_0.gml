draw_frame(32, 3, 356, 212)
draw_frame(392, 0, room_width, 216)
draw_frame(32, 248, 324, room_height)
draw_frame(392, 220, room_width, room_height)
scr_draw_text_pos(("ROOM-" + global.current_room), (title_x + 5), (title_y - 22))
scr_draw_text_pos("EVENT-", (title_x + 100), (title_y - 22))
scr_draw_text_pos("  MAP-", (title_x + 100), (title_y - 35))
scr_draw_text_pos(("LAYER-" + grid_layer), (title_x + 5), (title_y - 12))
draw_sprite(sprite_index, 0, title_x, title_y)
draw_frame2(39, 9, 349, 207)
draw_sprite(spr_editor_grid, 0, 42, 12)
for (var i = 0; i < 19; i++)
{
    for (var j = 0; j < 12; j++)
    {
        if (!(ds_map_empty(room_editor[i, j])))
        {
            var obj = ds_map_find_value(room_editor[i, j], "obj")
            var xscale = ds_map_find_value(room_editor[i, j], "xscale")
            var yscale = ds_map_find_value(room_editor[i, j], "yscale")
            var rotation = ds_map_find_value(room_editor[i, j], "rotation")
            if (obj == 12)
                var spr = asset_get_index(process_convert_tile_sprite(ds_map_find_value(room_editor[i, j], "spr")))
            else
                spr = asset_get_index(ds_map_find_value(room_editor[i, j], "spr"))
            var t_sprwid = sprite_get_width(spr)
            var t_sprhei = sprite_get_height(spr)
            var xoff = sprite_get_xoffset(spr)
            var yoff = sprite_get_yoffset(spr)
            var xdiff = t_sprwid / 2 - xoff
            var ydiff = t_sprhei / 2 - yoff
            var t_ang0 = point_direction(xoff, yoff, (t_sprwid / 2), (t_sprhei / 2))
            var t_dist = point_distance(xoff, yoff, (t_sprwid / 2), (t_sprhei / 2))
            var x_shift = lengthdir_x(t_dist, (t_ang0 + rotation))
            var y_shift = lengthdir_y(t_dist, (t_ang0 + rotation))
            draw_sprite_ext(spr, 0, (50 + i * 16 + x_shift - xdiff), (20 + j * 16 + y_shift - ydiff), xscale, yscale, rotation, c_white, 1)
            if (sprite_get_name(spr) == "spr_lavadeep" || sprite_get_name(spr) == "spr_watertop")
                draw_sprite(tileset_manager_overlays, 1, (42 + i * 16), (12 + j * 16))
        }
        if (!(ds_map_empty(room_editor_f[i, j])))
        {
            obj = ds_map_find_value(room_editor_f[i, j], "obj")
            xscale = ds_map_find_value(room_editor_f[i, j], "xscale")
            yscale = ds_map_find_value(room_editor_f[i, j], "yscale")
            rotation = ds_map_find_value(room_editor_f[i, j], "rotation")
            if (obj == 12)
                spr = asset_get_index(process_convert_tile_sprite(ds_map_find_value(room_editor_f[i, j], "spr")))
            else
                spr = asset_get_index(ds_map_find_value(room_editor_f[i, j], "spr"))
            t_sprwid = sprite_get_width(spr)
            t_sprhei = sprite_get_height(spr)
            xoff = sprite_get_xoffset(spr)
            yoff = sprite_get_yoffset(spr)
            xdiff = t_sprwid / 2 - xoff
            ydiff = t_sprhei / 2 - yoff
            t_ang0 = point_direction(xoff, yoff, (t_sprwid / 2), (t_sprhei / 2))
            t_dist = point_distance(xoff, yoff, (t_sprwid / 2), (t_sprhei / 2))
            x_shift = lengthdir_x(t_dist, (t_ang0 + rotation))
            y_shift = lengthdir_y(t_dist, (t_ang0 + rotation))
            draw_sprite_ext(spr, 0, (50 + i * 16 + x_shift - xdiff), (20 + j * 16 + y_shift - ydiff), xscale, yscale, rotation, c_white, 1)
            if (sprite_get_name(spr) == "spr_lavadeep" || sprite_get_name(spr) == "spr_watertop")
                draw_sprite(tileset_manager_overlays, 1, (42 + i * 16), (12 + j * 16))
        }
    }
}
if (tile_tileset != -1)
{
    for (i = 0; i < 15; i++)
    {
        for (j = 0; j < 7; j++)
        {
            if palette[i, j]
            {
                var ob = palette[i, j]
                if (ob == obj_tile)
                {
                    for (var ttt = 0; ttt < ds_list_size(global.tileset_sprites[current_tileset]); ttt++)
                        tile_tileset[ttt] = 12
                    spr = asset_get_index(process_convert_tile_sprite(ds_list_find_value(global.tileset_sprites[current_tileset], (j * 15 + i))))
                    if is_undefined(spr)
                        spr = spr_none
                }
                else if (ob == obj_save_point)
                    spr = spr_editor_save
                else
                    spr = object_get_sprite(ob)
                t_sprwid = sprite_get_width(spr) / 2
                t_sprhei = sprite_get_height(spr) / 2
                xoff = sprite_get_xoffset(spr)
                yoff = sprite_get_yoffset(spr)
                xdiff = t_sprwid - xoff
                ydiff = t_sprhei - yoff
                draw_sprite(spr, 0, (30 + palette_x + i * 18 + t_sprwid - xdiff), (palette_y + j * 18 + t_sprhei - ydiff))
            }
        }
    }
}
if (palette_cur_x != -1)
{
    var xsc_tar = 1
    var ysc_tar = 1
    if (palette_obj_selected != self)
    {
        xsc_tar = sprite_get_width(object_get_sprite(palette_obj_selected)) / 16
        ysc_tar = sprite_get_height(object_get_sprite(palette_obj_selected)) / 16
    }
    palette_cur_sclx = lerp(palette_cur_sclx, xsc_tar, 0.2)
    palette_cur_scly = lerp(palette_cur_scly, ysc_tar, 0.2)
    draw_sprite_ext(spr_editor_grid_selector, 0, (30 + palette_cur_x), palette_cur_y, palette_cur_sclx, palette_cur_scly, 0, c_white, 1)
}
if (palette_hov_x != -1)
    draw_sprite_ext(spr_editor_grid_box, 0, (30 + palette_hov_x), palette_hov_y, 1, 1, 0, c_aqua, 0.6)
draw_frame2((30 + console_x - 6), (console_y - 6), 326, (console_y + 22))
if (palette_obj_selected == self)
    scr_draw_text_pos("empty tile. #give me some space.", (30 + console_x), console_y)
else
    scr_draw_text_pos(c_text, (30 + console_x), console_y)
if grid_selected
{
    draw_sprite_ext(spr_editor_grid_selector, 0, (30 + grid_select_x + 4), (grid_select_y + 4), 1, 1, 0, c_lime, 0.5)
    if (palette_obj_selected == obj_tile)
        spr = asset_get_index(process_convert_tile_sprite(ds_list_find_value(global.tileset_sprites[current_tileset], (palette_cur_j * 15 + palette_cur_i))))
    else
        spr = object_get_sprite(palette_obj_selected)
    if ((edit_tool == "brush" || edit_tool == "arrow") && palette_obj_selected != -1)
    {
        t_sprwid = sprite_get_width(spr)
        t_sprhei = sprite_get_height(spr)
        xoff = sprite_get_xoffset(spr)
        yoff = sprite_get_yoffset(spr)
        xdiff = t_sprwid / 2 - xoff
        ydiff = t_sprhei / 2 - yoff
        t_ang0 = point_direction(xoff, yoff, (t_sprwid / 2), (t_sprhei / 2))
        t_dist = point_distance(xoff, yoff, (t_sprwid / 2), (t_sprhei / 2))
        x_shift = lengthdir_x(t_dist, (t_ang0 + cursor_rotation))
        y_shift = lengthdir_y(t_dist, (t_ang0 + cursor_rotation))
        draw_sprite_ext(spr, 0, (30 + grid_select_x + 12 + x_shift - xdiff), (grid_select_y + 12 + y_shift - ydiff), cursor_xscale, cursor_yscale, cursor_rotation, c_white, 0.35)
    }
}
if (grid_focus_i != -1)
    draw_sprite_ext(spr_editor_grid_selector, 0, (30 + grid_focus_i * 16 + 12), (grid_focus_j * 16 + 12), 1, 1, 0, c_fuchsia, 0.4)
if set_spawn
    draw_sprite_ext(spr_spawn_pt_indicator, 0, (30 + global.spawn_x + 8), (global.spawn_y + 8), 1, 1, 0, c_maroon, 1)
else
    draw_sprite_ext(spr_spawn_pt_indicator, 0, (30 + global.spawn_x + 8), (global.spawn_y + 8), 1, 1, 0, c_yellow, 1)
