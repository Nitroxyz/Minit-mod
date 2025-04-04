if ((!view_enabled[1]) || (!surface_exists(global.hudsurf)) || instance_exists(PAUSE_MENU))
    return;
surface_set_target(global.hudsurf)
draw_frame3((dialogposition - 20), 24, (dialogposition + 250), 66)
draw_frame4((dialogposition - 12), 32, (dialogposition + 14), 58)
draw_sprite(sprite_index, image_index, (dialogposition + 2 - 13), 33)
scr_draw_text_pos(itemname, (20 + dialogposition), (28 + global.text_offset))
surface_reset_target()
