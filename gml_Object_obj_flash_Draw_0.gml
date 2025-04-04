if (round(timer) == 1)
{
    var vx = __view_get(0, 0)
    var vy = __view_get(1, 0)
    draw_set_color(c_white)
    draw_rectangle(vx, vy, (vx + (__view_get(2, 0))), (vy + (__view_get(3, 0))), false)
}
