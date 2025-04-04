for (var i = 0; i < tile_dist; i++)
{
    var ldx = lengthdir_x((i * 16), direction)
    var ldy = lengthdir_y((i * 16), direction)
    draw_sprite(spr_warning, 0, (x + ldx), (y + ldy))
}
