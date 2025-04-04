var _x = argument0
var _y = argument1
var _rot = argument2
rocket_pct_vel += ((sign(global.rocket_heat - rocket_pct)) * 0.03)
rocket_pct_vel *= 0.82
rocket_pct += rocket_pct_vel
rocket_pct = clamp(rocket_pct, 0, 1)
if (rocket_pct == 0 || rocket_pct == 1)
    rocket_pct_vel = 0
var _pct = rocket_pct
draw_sprite_ext(spr_rocketmeter_bar, 0, _x, (_y - 9), 1, _pct, _rot, c_white, 1)
draw_sprite_ext(spr_rocketmeter, 0, _x, _y, 1, 1, _rot, c_white, 1)
get_input()
var _buttonpressed = j_b
draw_sprite(spr_rocketmeter_button, (global.controller_b_frame * 2 + _buttonpressed), _x, (_y - 1))
draw_set_font(fnt_nesultra)
draw_set_halign(fa_center)
var _col = c_black
if _buttonpressed
    _col = 16777215
draw_set_colour(_col)
draw_text((_x + 1), (_y - 8), global.controller_b_name)
draw_set_halign(fa_right)
draw_set_colour(c_white)
var _temp = round(_pct * 100 + 21)
var _string = string(_temp)
if (_pct > 0.95)
{
    if (random_string_timer > 0)
        random_string_timer--
    else
    {
        random_string = random_char() + random_char() + random_char()
        random_string_timer = 3
    }
    _string = choose(_string, random_string, random_string, random_string)
}
if (global.rocket_cost < 0.5)
{
    draw_text((_x + 7), (_y + 28), _string)
    draw_sprite(spr_degree, 0, (_x + 9), (_y + 32))
    cooler_index = wrap((cooler_index + 0.2), 0, 4)
    draw_sprite(spr_cooler_UI, cooler_index, (_x - 1), (_y + 21))
}
else
{
    draw_text((_x + 7), (_y + 12), _string)
    draw_sprite(spr_degree, 0, (_x + 9), (_y + 18))
}
draw_sprite(spr_rocket_hud, global.rocket_is_ready, (_x - 16), (_y - 24))
draw_set_font(global.font[global.language])
draw_set_halign(fa_left)
