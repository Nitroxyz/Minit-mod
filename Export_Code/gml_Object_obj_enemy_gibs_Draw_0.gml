var w = sprite_get_width(sprite_index)
var h = sprite_get_height(sprite_index)
var ldx = lengthdir_x(((-w) / 4), rot)
var ldy = lengthdir_y(((-h) / 4), rot)
switch index
{
    case 0:
        draw_sprite_general(sprite_index, 0, 0, 0, (w / 2), (h / 2), (x + ldx), (y + ldy), 1, 1, rot, c_white, c_white, c_white, c_white, 1)
        break
    case 1:
        draw_sprite_general(sprite_index, 0, (w / 2), 0, (w / 2), (h / 2), (x + ldx), (y + ldy), 1, 1, rot, c_white, c_white, c_white, c_white, 1)
        break
    case 2:
        draw_sprite_general(sprite_index, 0, 0, (h / 2), (w / 2), (h / 2), (x + ldx), (y + ldy), 1, 1, rot, c_white, c_white, c_white, c_white, 1)
        break
    case 3:
        draw_sprite_general(sprite_index, 0, (w / 2), (h / 2), (w / 2), (h / 2), (x + ldx), (y + ldy), 1, 1, rot, c_white, c_white, c_white, c_white, 1)
        break
    default:
        break
}

