for (var i = 0; i < rodcount; i++)
    draw_sprite_ext(spr_elevator_rod, 0, (start_x + rodoffset_x + cos(degtorad(angle)) * 16 * i), (start_y - sin(degtorad(angle)) * 16 * i), 1, 1, angle, c_white, 1)
if (angle == 90 || angle == 270)
{
    for (i = 0; i < rodcount; i++)
        draw_sprite_ext(spr_elevator_rod, 0, (start_x + 64), (start_y - sin(degtorad(angle)) * 16 * i), 1, 1, 90, c_white, 1)
}
event_inherited()
