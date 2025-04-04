draw_frame4((x - 12), (y - 28), (x + 29), (y - 16))
scr_draw_text_pos(name, (x - 7), (y - 24))
anim0 += 0.125
draw_frame4((x - 12), (y - 12), (x - 4 + 216), (y - 4 + 72))
switch state
{
    case 0:
        scr_draw_text_pos1()
        draw_sprite(spr_naming_cur, (2 * (anim0 % 2)), (x - 1 + curh * 24), (y - 1 + curv * 24))
        break
    case 1:
        scr_draw_text_pos((name + "? is that correct? ##  yes ##  no"), x, y)
        draw_frame4((x + 8), (y + 15 + 20 * endcur), (x + 36), (y + 29 + 20 * endcur))
        break
}

draw_sprite_ext(spr_cat_idle, (anim0 % 4), (x + 40), (y - 24), -1, 1, 0, c_white, 1)
scr_draw_text_pos("press SELECT to change case", x, (y + 72))
