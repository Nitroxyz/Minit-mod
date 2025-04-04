draw_set_color(c_black)
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
draw_set_color(c_white)
var _x = x
var _y = y
var view_0 = 0
var view_1 = 0
var view_2 = display_get_gui_width()
var view_3 = display_get_gui_height()
if (intro > 640)
{
    if (ready == 0)
        ang += (20 * (alarm[0] / 120))
    repeat (4)
    {
        ang += 90
        draw_triangle(_x, _y, (_x + (lengthdir_x(700, (ang + wide)))), (_y + (lengthdir_y(700, (ang + wide)))), (_x + (lengthdir_x(700, (ang - wide)))), (_y + (lengthdir_y(700, (ang - wide)))), 0)
    }
}
else
{
    intro += 64
    draw_sprite_ext(White10, 0, (view_0 + view_2 / 2), (view_1 + view_3 - 32), (intro / 10), (intro / 10), 45, c_white, 1)
}
if (ready == 0)
{
    if (wide > 0)
        wide -= 0.6
    else
        wide = 0
}
draw_set_color(c_black)
draw_rectangle(view_0, view_1, view_2, (view_1 + widescreen), false)
draw_rectangle(view_0, view_3, view_2, (view_3 - widescreen), false)
surface_set_target(application_surface)
if (sin(blink) >= 0)
{
    if (widescreen == 40)
    {
        draw_set_color(c_white)
        draw_set_halign(fa_center)
        draw_set_valign(fa_top)
        draw_text_outline((view_0 + view_2 / 2), (view_1 + view_3 - 55 + global.ui_text_offset), "GOT THE MECH SUIT")
        if (ready == 1)
            draw_minit_time()
    }
}
if (widescreen < 40)
    widescreen += 4
if (ready == 1)
{
    blink += 0.3
    draw_set_valign(fa_top)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var myx = view_0 + view_2 / 2
    var myy = view_1 + view_3
    draw_tutorial(myx, myy, "PRESS JUMP TO CONTINUE")
}
surface_reset_target()
