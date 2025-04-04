if (state == 20)
{
    draw_set_color(c_black)
    draw_rectangle(0, 0, 128, 64, false)
    draw_set_color(c_white)
    draw_text(2, 2, global.abilities)
    var hasMissiles = get_bitwise_flag(global.abilities, 1)
    draw_text(2, 14, ("Rockets: " + string(hasMissiles)))
    var hasDjump = get_bitwise_flag(global.abilities, 2)
    draw_text(2, 26, ("DJump: " + string(hasDjump)))
    var hasDash = get_bitwise_flag(global.abilities, 4)
    draw_text(2, 38, ("Dash: " + string(hasDash)))
}
else if (state == 28)
{
    draw_set_color(c_black)
    draw_rectangle(0, 0, 128, 64, false)
    draw_set_color(c_white)
    draw_text(2, 2, "MEOW MEOW MEOW MEOW DEMO EXPIRED MEOW MEOW-VE OVER!")
}
