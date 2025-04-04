draw_set_font(global.font[global.language])
var xview = 1
var yview = 0
var wview = 304
var hview = 192
draw_set_halign(fa_center)
draw_set_colour(c_white)
draw_text((xview + wview / 2 - 1), (yview + 2), var_status)
draw_sprite(spr_status_suit_body, 0, (xview + wview / 2 - 2), (yview + hview / 2))
draw_set_color(c_black)
draw_set_halign(fa_right)
draw_sprite_ext(spr_status_gear_window, 0, (xview + wview - 4), (yview + hview * 0.25), -1, 1, 0, c_white, 1)
draw_text((xview + wview - 5), (yview + hview * 0.25 - 1 + global.hud_text_offset), loc_read_line(562))
for (var i = 0; i < 5; i++)
{
    draw_sprite_ext(spr_status_gear_item, (!has_gear_suit[i]), (xview + wview - 8), (yview + hview * 0.25 + 20 + 17 * i), -1, 1, 0, c_white, 1)
    if has_gear_suit[i]
        draw_text((xview + wview - 8), (yview + hview * 0.25 + 20 + 17 * i - 3 + global.hud_text_offset), gear_suit_name[i])
}
draw_set_halign(fa_left)
draw_sprite(spr_status_gear_window, 0, (xview + 2), (yview + hview * 0.25))
draw_text((xview + 4), (yview + hview * 0.25 - 1 + global.hud_text_offset), loc_read_line(563))
for (i = 0; i < 5; i++)
{
    draw_sprite(spr_status_gear_item, (!has_gear_arms[i]), (xview + 6), (yview + hview * 0.25 + 20 + 17 * i))
    if has_gear_arms[i]
        draw_text((xview + 7), (yview + hview * 0.25 + 20 + 17 * i - 3 + global.hud_text_offset), gear_arms_name[i])
}
draw_set_color(c_white)
draw_sprite(spr_vhs_icon, 0, (xview + wview * 0.25), (yview + hview * 0.8 + 8))
var pals = 0
for (var iii = 0; iii < 16; iii++)
{
    if global.palette_unlocked[iii]
        pals++
}
pals -= 2
var cart_string = string(pals) + "/14"
draw_text((xview + wview * 0.25 + 32), (yview + hview * 0.8 + 8 + 6), cart_string)
draw_sprite(spr_health_icon, 0, (xview + wview * 0.25 + 84), (yview + hview * 0.8 + 8))
var hp_string = (string(global.max_hp - 6)) + "/10"
draw_text((xview + wview * 0.25 + 32 + 84), (yview + hview * 0.8 + 8 + 6), hp_string)
