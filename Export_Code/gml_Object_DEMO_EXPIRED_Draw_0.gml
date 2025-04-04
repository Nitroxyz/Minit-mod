if surface_exists(global.hudsurf)
{
    surface_set_target(global.hudsurf)
    draw_clear_alpha(c_black, 1)
    xview = 2
    yview = 0
    wview = 304
    hview = 192
    draw_set_colour(c_black)
    draw_rectangle(xview, yview, (xview + wview), (yview + hview), false)
    draw_set_color(c_white)
    draw_set_halign(fa_center)
    draw_set_font(global.font[global.language])
    draw_text((xview + wview / 2), (yview + hview * 0.3), "MEOW MEOW MEOW MEOW \nDEMO TIME HAS EXPIRED\nTIME TO MEOW-VE OVER\nMEOW")
    surface_reset_target()
}
