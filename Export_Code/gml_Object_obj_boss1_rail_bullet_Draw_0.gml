draw_sprite_part(sprite_index, image_index, 0, 0, 24, 12, x, (y - 12))
if (endpt > 0)
{
    if (endpt > (y + image_yscale * 24))
    {
        draw_sprite_part_ext(sprite_index, image_index, 0, 12, 24, 24, x, y, 1, image_yscale, c_white, 1)
        draw_sprite_part(sprite_index, image_index, 0, 36, 24, 12, x, (y + image_yscale * 24))
    }
    else
    {
        var t_yscl = (endpt - y) / 24
        draw_sprite_part_ext(sprite_index, image_index, 0, 12, 24, 24, x, y, 1, t_yscl, c_white, 1)
    }
}
else
{
    draw_sprite_part_ext(sprite_index, image_index, 0, 12, 24, 24, x, y, 1, image_yscale, c_white, 1)
    draw_sprite_part(sprite_index, image_index, 0, 36, 24, 12, x, (y + image_yscale * 24))
}
