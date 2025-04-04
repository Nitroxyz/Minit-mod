var _rot = argument2
var _max = global.sub_hp_max
var _cur = global.sub_hp
var _pct = _cur / _max
draw_sprite_ext(spr_lifebar_border, 0, argument0, argument1, 1, 1, _rot, c_white, 1)
draw_sprite_ext(spr_lifebar, 0, argument0, argument1, 1, min(_pct, 1), _rot, c_white, 1)
for (var i = 0; i < _cur; i++)
{
    var ii = i / _max * 96
    var ii2 = (i + 1) / _max * 96
    draw_sprite(spr_lifebar_div_bottom, 0, argument0, (argument1 - ii))
    draw_sprite(spr_lifebar_div_top, 0, argument0, (argument1 - ii2 + 2))
}
draw_set_color(c_white)
draw_set_font(fnt_nesultra)
draw_set_halign(fa_left)
var _string = string(max(1, floor(pct_slowed * _max)))
if (_string == "1")
{
    _string = "!!!"
    if (blink_timer > 0)
        blink_timer--
    else
    {
        blink_timer = 15
        blink = (!blink)
        if blink
            audio_play_sound(snd_hud_danger, 5, false)
    }
}
else
    blink = 1
draw_set_alpha(blink)
draw_text((argument0 + 16), (argument1 - pct_slowed * 96 - 2), _string)
draw_set_alpha(1)
draw_set_font(global.font[global.language])
draw_set_valign(fa_bottom)
if ui_is_initialized
    draw_text((argument0 - 10), (argument1 - 100), loc_read_line(514))
draw_set_valign(fa_top)
