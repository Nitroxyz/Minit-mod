draw_frame(0, 0, 272, 272)
draw_frame(0, 272, 272, 360)
draw_frame(272, 0, 640, 360)
draw_sprite(tilesets[current_tileset], 0, 8, 8)
for (var i = 0; i < 16; i++)
{
    for (var j = 0; j < 16; j++)
        draw_sprite(tileset_manager_overlays, real(string_char_at(masks, (i + 16 * j + 1))), (8 + i * 16), (8 + j * 16))
}
