var scale = 1
var buffer = scale
var originX = argument0
var originY = argument1
var text = argument2
draw_set_valign(fa_top)
draw_set_halign(fa_center)
draw_set_color(c_black)
draw_text((originX + buffer), originY, string_hash_to_newline(text))
draw_text((originX - buffer), originY, string_hash_to_newline(text))
draw_text(originX, (originY + buffer), string_hash_to_newline(text))
draw_text(originX, (originY - buffer), string_hash_to_newline(text))
draw_set_color(c_white)
draw_text(originX, originY, string_hash_to_newline(text))
