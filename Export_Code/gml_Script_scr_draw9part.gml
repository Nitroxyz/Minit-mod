var d1 = argument0
var d2 = argument1
var d1mag = d1 / argument2
var d2mag = d2 / argument2
draw_sprite_part_ext(sprite_index, 0, 0, 0, thirdwid, thirdwid, startx, starty, d1mag, d1mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, thirdwid, 0, thirdwid, thirdwid, (startx + d1), starty, d2mag, d1mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, (2 * thirdwid), 0, thirdwid, thirdwid, (startx + d1 + d2), starty, d1mag, d1mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, 0, thirdwid, thirdwid, thirdwid, startx, (starty + d1), d1mag, d2mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, thirdwid, thirdwid, thirdwid, thirdwid, (startx + d1), (starty + d1), d2mag, d2mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, (2 * thirdwid), thirdwid, thirdwid, thirdwid, (startx + d1 + d2), (starty + d1), d1mag, d2mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, 0, (2 * thirdwid), thirdwid, thirdwid, startx, (starty + d1 + d2), d1mag, d1mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, thirdwid, (2 * thirdwid), thirdwid, thirdwid, (startx + d1), (starty + d1 + d2), d2mag, d1mag, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, (2 * thirdwid), (2 * thirdwid), thirdwid, thirdwid, (startx + d1 + d2), (starty + d1 + d2), d1mag, d1mag, c_white, 1)
