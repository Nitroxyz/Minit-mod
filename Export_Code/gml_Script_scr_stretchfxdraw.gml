var dx1 = stretchcur * sprite_width
var dx2 = stretchcur * sprite_width - 2 * dx1
var dy1 = stretchcur * sprite_height
var dy2 = stretchcur * sprite_height - 2 * dy1
var dxs1 = thirdwid / dx1
var dxs2 = thirdwid / dx2
var dys1 = thirdhei / dy1
var dys2 = thirdhei / dy2
draw_sprite_part_ext(sprite_index, 0, 0, 0, thirdwid, thirdhei, startx, starty, dxs1, dys1, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, thirdwid, 0, thirdwid, thirdhei, (startx + dx1), starty, dxs2, dys1, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, (2 * thirdwid), 0, thirdwid, thirdhei, (startx + dx1 + dx2), starty, dxs1, dys1, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, 0, thirdhei, thirdwid, thirdhei, startx, (starty + dy1), dxs1, dys2, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, thirdwid, thirdhei, thirdwid, thirdhei, (startx + dx1), (starty + dy1), dxs2, dys2, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, (2 * thirdwid), thirdhei, thirdwid, thirdhei, (startx + dx1 + dx2), (starty + dy1), dxs1, dys2, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, 0, (2 * thirdhei), thirdwid, thirdhei, startx, (starty + dy1 + dy2), dxs1, dys1, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, thirdwid, (2 * thirdhei), thirdwid, thirdhei, (startx + dx1), (starty + dy1 + dy2), dxs2, dys1, c_white, 1)
draw_sprite_part_ext(sprite_index, 0, (2 * thirdwid), (2 * thirdhei), thirdwid, thirdhei, (startx + dx1 + dx2), (starty + dy1 + dy2), dxs1, dys1, c_white, 1)
stretchangle += stretchv
stretchcur = 0.33 + 0.02 * cos(stretchangle)
