var x1 = argument0
var y1 = argument1
var x2 = argument2
var y2 = argument3
var xscl = (x2 - x1 - 16) / 8
var yscl = (y2 - y1 - 16) / 8
draw_sprite(spr_frame4_blackinner, 0, x1, y1)
draw_sprite_ext(spr_frame4_blackinner, 1, (x1 + 8), y1, xscl, 1, 0, c_white, 1)
draw_sprite(spr_frame4_blackinner, 2, (x2 - 8), y1)
draw_sprite_ext(spr_frame4_blackinner, 3, x1, (y1 + 8), 1, yscl, 0, c_white, 1)
draw_sprite_ext(spr_frame4_blackinner, 4, (x1 + 8), (y1 + 8), xscl, yscl, 0, c_white, 1)
draw_sprite_ext(spr_frame4_blackinner, 5, (x2 - 8), (y1 + 8), 1, yscl, 0, c_white, 1)
draw_sprite(spr_frame4_blackinner, 6, x1, (y2 - 8))
draw_sprite_ext(spr_frame4_blackinner, 7, (x1 + 8), (y2 - 8), xscl, 1, 0, c_white, 1)
draw_sprite(spr_frame4_blackinner, 8, (x2 - 8), (y2 - 8))
