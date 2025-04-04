draw_self()
draw_set_color(c_black)
if (wid == 0)
    draw_rectangle(0, 0, room_width, room_height, false)
else
{
    draw_rectangle(0, 0, (x - 125 * image_xscale), room_height, false)
    draw_rectangle((x - 125 * image_xscale), 0, (x + 125 * image_xscale), (y - 125 * image_yscale), false)
    draw_rectangle((x - 125 * image_xscale), (y + 125 * image_yscale), (x + 125 * image_xscale), room_height, false)
    draw_rectangle((x + 125 * image_xscale), 0, room_width, room_height, false)
}
draw_set_color(c_white)
