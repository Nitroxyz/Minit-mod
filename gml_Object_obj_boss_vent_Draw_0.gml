if (state == 624)
{
    draw_line_width(x, y, laser_x_1, laser_y_1, (5 + (sin(bullet_hell_angle / 1.5))))
    draw_line_width(x, y, laser_x_2, laser_y_2, (5 + (sin(bullet_hell_angle / 1.5 + 180))))
}
var flash = state == stun_state
draw_sprite_ext(sprite_index, iindex, x, (y + 12), image_xscale, 1, 0, c_white, 1)
draw_sprite_ext(dome_sprite, flash, x, (y - 8), (-image_xscale), 1, 0, c_white, 1)
