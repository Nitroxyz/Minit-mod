draw_offset_x = choose(-1, 1)
draw_offset_y = choose(-1, 1)
if (alarm[0] > 0)
{
    alarm[0]--
    return 0;
}
else
{
    alarm[0] = -1
    draw_offset_x = 0
    draw_offset_y = 0
    return 1;
}
