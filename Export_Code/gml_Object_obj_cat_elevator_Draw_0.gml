for (var i = 0; i < ((room_height div 16) + 6); i++)
{
    draw_sprite(spr_elevator_block, i, (bbox_left - 8 - xoff), (i * 16 - yoff))
    draw_sprite(spr_elevator_block, (i + 1), (bbox_right + 8 + xoff), (i * 16 - yoff))
}
draw_sprite(sprite_index, image_index, x, y)
draw_sprite(spr_player_idle, iindex, x, (y - 28))
draw_sprite(spr_gun, 0, (x + 12), (y - 28 + 3))
if (stage == 1)
{
    draw_set_font(fnt_nesultra)
    draw_set_halign(fa_center)
    draw_set_colour(c_black)
    draw_rectangle(0, (room_height * 0.1 - 1), room_width, (room_height * 0.1 + 12 + 2 + 4), false)
    draw_rectangle(0, (room_height * 0.1 - 1 + 17), room_width, (room_height * 0.1 + 12 + 2 + 15), false)
    draw_set_colour(c_white)
    draw_text(x, (room_height * 0.1), message_thankyou)
}
if (stage == 2)
{
    draw_set_font(fnt_nesultra)
    draw_set_halign(fa_center)
    draw_set_colour(c_black)
    draw_rectangle(0, (room_height * 0.1 - 1), room_width, (room_height * 0.1 + 12 + 2), false)
    draw_rectangle(0, (room_height * 0.1 - 1 + 24), room_width, (room_height * 0.1 + 12 + 2 + 24), false)
    draw_set_colour(c_white)
    draw_text(x, (room_height * 0.1), message_completion)
    draw_text(x, (room_height * 0.1 + 24), message_time)
}
