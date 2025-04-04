draw_set_color(c_white)
switch state
{
    case 0:
        if (floor(cur_index) == 0)
            scr_draw_text_pos("Press Start", (0.5 * room_width - 40), 148)
        break
    case 2:
        var tpos_x = room_width * 0.5 - 30
        var tpos_y = 140
        draw_sprite(spr_cat_cur, cur_index, (tpos_x - 16), (tpos_y + 6 + 19 * cur))
        scr_draw_text_pos(save_0, tpos_x, tpos_y)
        scr_draw_text_pos(save_1, tpos_x, (tpos_y + 19))
        scr_draw_text_pos(save_2, tpos_x, (tpos_y + 38))
        scr_draw_text_pos("clear data", tpos_x, (tpos_y + 57))
        break
}

draw_self()
draw_sprite(spr_title_roboto, 0, (x + 176), (y + 2))
