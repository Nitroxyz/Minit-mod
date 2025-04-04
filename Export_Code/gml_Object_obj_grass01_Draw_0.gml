ang += 10
draw_sprite_part_ext(sprite_index, image_index, 0, 0, 16, 9, (x + 2 * cos(ang) + xoffset), (y + sin(ang) / 2), 1, image_yscale, image_blend, 1)
draw_sprite_part(sprite_index, image_index, 0, 9, 16, 9, (x + 2 * (cos(ang + 0.5235987755982988)) + xoffset * 0.75), (y + image_yscale * (9 + (sin(ang + 0.5235987755982988)) / 2)))
draw_sprite_part(sprite_index, image_index, 0, 15, 16, 9, (x + 2 * (cos(ang + 1.0471975511965976)) + xoffset * 0.5), (y + image_yscale * (15 + (sin(ang + 1.0471975511965976)) / 2)))
draw_sprite_part(sprite_index, image_index, 0, 21, 16, 9, (x + 2 * (cos(ang + 1.5707963267948966)) + xoffset * 0.25), (y + image_yscale * (21 + (sin(ang + 1.5707963267948966)) / 2)))
draw_sprite_part_ext(sprite_index, image_index, 0, 27, 32, 9, x, (y + image_yscale * (27 + sin(ang) / 2)), 1, image_yscale, image_blend, 1)
