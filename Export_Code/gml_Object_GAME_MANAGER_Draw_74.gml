if (room != r_editor)
{
    if surface_exists(surf)
    {
        view_set_surface_id(0, surf)
        surface_set_target(application_surface)
        with (UI_MANAGER)
        {
            surf = other.surf
            event_perform(ev_other, ev_user1)
            if global.boss_hud_active
            {
                draw_frame3(146, 2, 290, 20)
                draw_sprite(spr_mouse_hudpic, 0, 128, 2)
                var mhp = 0
                var mhp_cur = 0
                if (global.boss_hud_target != self)
                {
                    for (mhp = 0; mhp < global.boss_hud_target.hp; mhp += (global.boss_hud_target.hp_max / 68))
                    {
                        draw_sprite(spr_meter_tick, 0, (150 + 2 * mhp_cur), 7)
                        mhp_cur++
                    }
                }
            }
        }
        if csv_debug
            draw_text(4, 4, string(csv_debug_num))
        if instance_exists(obj_player)
        {
        }
        surface_reset_target()
    }
    else
    {
        surf = surface_create(308, 196)
        event_perform(ev_draw, ev_gui_begin)
    }
}
