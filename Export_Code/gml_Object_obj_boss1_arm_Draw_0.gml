var i = 0
var off = 1 - (image_xscale % 1)
if (off == 1)
    off = 0
var coss = cos(degtorad(image_angle))
var sinn = sin(degtorad(image_angle))
for (i = 0; i < ceil(image_xscale); i++)
    draw_sprite_ext(sprite_index, 0, ((x + xprevious) / 2 + coss * (i * 9 - off * 9)), ((y + yprevious) / 2 + sinn * (i * 9 - off * 9)), 1, 1, image_angle, c_white, 1)
