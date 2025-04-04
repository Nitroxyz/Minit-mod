anglechange = argument7 / argument4 * 0.017453292519943295
i = argument6 * 0.017453292519943295
ax = argument0 + cos(i) * argument2
ay = argument1 - sin(i) * argument2
bx = argument0 + cos(i) * (argument2 + argument3)
by = argument1 - sin(i) * (argument2 + argument3)
repeat argument5
{
    i += (argument8 * anglechange)
    cx = argument0 + cos(i) * argument2
    cy = argument1 - sin(i) * argument2
    dx = argument0 + cos(i) * (argument2 + argument3)
    dy = argument1 - sin(i) * (argument2 + argument3)
    draw_triangle_colour(ax, ay, bx, by, dx, dy, argument9, argument9, argument9, 0)
    draw_triangle_colour(ax, ay, cx, cy, dx, dy, argument9, argument9, argument9, 0)
    ax = cx
    ay = cy
    bx = dx
    by = dy
}
