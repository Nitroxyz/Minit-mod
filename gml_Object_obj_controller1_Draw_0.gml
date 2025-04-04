if (state == "menu")
{
    draw_frame((view_wport[0] / 2 - 57), 119, (view_wport[0] / 2 + 57), 154)
    scr_draw_text_pos("resume game", 96, 128)
    scr_draw_text_pos("exit to menu", 96, 140)
    draw_sprite(spr_tri_cur, 0, 92, (126 + cur * 12))
}
