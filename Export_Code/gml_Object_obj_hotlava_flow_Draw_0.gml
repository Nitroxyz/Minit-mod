if (image_yscale != 1)
    draw_sprite_part(sprite_index, iindex, 0, 0, 16, (image_yscale * 16), (x - 8), (y - 8))
else
    draw_sprite_ext(sprite_index, iindex, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
