if ((!view_enabled[1]) || (!surface_exists(global.hudsurf)) || instance_exists(PAUSE_MENU))
    return;
surface_set_target(global.hudsurf)
draw_frame3(dialogposition, 70, (dialogposition + 120), 100)
draw_frame3(dialogposition, 70, (dialogposition + 30), 100)
draw_sprite(sprite_index, image_index, (dialogposition + 3), 73)
scr_draw_text_pos("Game Saved!", (dialogposition + 36), 79)
surface_reset_target()
