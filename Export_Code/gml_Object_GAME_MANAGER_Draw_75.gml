if (room != r_editor)
{
    surface_set_target(application_surface)
    draw_set_color(c_gray)
    var sw = 308
    var sh = 196
    var sx = w / 2 - draw_surf_w / 2
    var sy = h / 2 - draw_surf_h / 2
    var str_w = sw / w
    var str_h = sh / h
    if global.hot_room
    {
        shader_set(shader_heatwave)
        shader_time++
        shader_set_uniform_f(shader_get_uniform(shader_heatwave, "u_time"), shader_time)
    }
    if surface_exists(surf)
        draw_surface_stretched(surf, sx, sy, sw, sh)
    else
        surf = surface_create(sw, sh)
    shader_reset()
    if surface_exists(global.hudsurf)
        draw_surface(global.hudsurf, (sx + 2), (sy + 2))
    else
        global.hudsurf = surface_create((sw - 4), (sh - 4))
    draw_frame4_blackinner(sx, sy, (sx + sw), (sy + sh))
    if (state != 19)
    {
        with (minit_ItemGot)
        {
            if instance_exists(obj_player)
            {
                x = sx + obj_player.x
                y = sy + obj_player.y
            }
            event_perform(ev_draw, 0)
            draw_surface_stretched(global.playersurf, sx, sy, sw, sh)
        }
    }
    var the_width = obj_camera.xmax - obj_camera.xmin + 304
    var the_height = obj_camera.ymax - obj_camera.ymin + 192
    var room_center = global.current_room
    var xmin = obj_camera.xmin
    var ymin = obj_camera.ymin
    while (xmin < -3)
    {
        room_center = get_room_id(180, 1, room_center)
        xmin += 304
    }
    while (ymin < -3)
    {
        room_center = get_room_id(90, 1, room_center)
        ymin += 192
    }
    with (GAME_MANAGER)
    {
        scr_get_room_ids()
        var drawing_list = [global.current_room, room_center]
        for (var i = 0; i < array_length_1d(drawing_list); i++)
            draw_text_outline(33, (30 + 20 * i + global.ui_text_offset), drawing_list[i])
    }
    var filename = "Pictures\\" + string(MAP_MANAGER.name) + " " + (string_copy(room_center, 1, 2)) + " " + (string_copy(room_center, 3, 2)) + ".png"
    if (!file_exists(filename))
    {
        if surface_exists(global.testsurf)
        {
            surface_save(global.testsurf, filename)
            surface_free(global.testsurf)
            view_visible[2] = false
        }
        else
        {
            global.testsurf = surface_create(the_width, the_height)
            surface_resize(global.testsurf, the_width, the_height)
            camera_set_view_size(view_camera[2], the_width, the_height)
            camera_set_view_pos(view_camera[2], (obj_camera.xmin + 2), (obj_camera.ymin + 2))
            view_set_surface_id(2, global.testsurf)
            view_visible[2] = true
        }
    }
    surface_reset_target()
    if t_visible
    {
        shader_set(shader_palswap)
        palette_normal = palette_index / palette_entries
        shader_set_uniform_f(shader_get_uniform(shader_palswap, "paletteIndex"), palette_normal)
        texture_set_stage(pal_sampler, tex)
        draw_surface(application_surface, 0, 0)
        shader_reset()
    }
}
