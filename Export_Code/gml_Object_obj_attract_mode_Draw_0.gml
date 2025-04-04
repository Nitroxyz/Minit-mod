draw_self()
if (timer > 0)
    timer--
else
{
    blink = (!blink)
    timer = 25
}
draw_set_color(c_black)
draw_rectangle(0, 0, room_width, (0 + room_height * 0.075 + 2), false)
draw_rectangle(0, (room_height * 0.925), room_width, room_height, false)
draw_rectangle((room_width / 2 - string_width(myString) / 2 - 8 - 1), (room_height * 0.75 - 2 - 1), (room_width / 2 + string_width(myString) / 2 + 8 + 1), (room_height * 0.75 + 18 + 2 + 1), false)
if blink
{
    draw_set_colour(c_white)
    draw_rectangle((room_width / 2 - string_width(myString) / 2 - 8), (room_height * 0.75 - 2), (room_width / 2 + string_width(myString) / 2 + 8), (room_height * 0.75 + 18 + 2), false)
}
draw_set_colour(c_black)
draw_rectangle((room_width / 2 - string_width(myString) / 2 - 6), (room_height * 0.75), (room_width / 2 + string_width(myString) / 2 + 6), (room_height * 0.75 + 18), false)
draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_font(fnt_nesultra)
angle += 5
for (var i = 0; i < string_length(myString); i++)
{
    var _str = string_char_at(myString, (i + 1))
    var _y = (sin(degtorad(i * 30 + angle))) * 2
    var _x = cos(degtorad(i * 45 + angle))
    draw_text((room_width / 2 - string_width(myString) / 2 + i * 8 + 2), (room_height * 0.75 + _y), _str)
}
