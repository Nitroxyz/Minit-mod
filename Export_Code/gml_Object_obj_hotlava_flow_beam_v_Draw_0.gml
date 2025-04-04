var i = 0
for (i = 0; i < floor(image_yscale); i++)
    draw_sprite(sprite_index, (iindex + i), x, (y + 16 * i))
i++
draw_sprite_part(sprite_index, iindex, 0, 0, 16, ((image_yscale % 1) * 16), (x - 8), (y + 16 * i))
