draw_frame(x, y, (x + 89), (y + 48))
var i = 0
var j = 0
for (i = 0; i < map_w; i++)
{
    for (j = 0; j < map_h; j++)
        draw_sprite(sprite_index, global.room_state[i, j], (x + 5 + i * 5), (y - 0.5 + 5 + j * 5))
}
draw_sprite(sprite_index, image_index, (x + room_x * 5 + 5), (y - 0.5 + room_y * 5 + 5))
