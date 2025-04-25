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
