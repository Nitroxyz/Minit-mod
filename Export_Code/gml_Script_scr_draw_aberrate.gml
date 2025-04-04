if (image_blend == c_black)
{
    var rot = random(2) - 1
    var rotx = (random(alarm[0] / 8)) - alarm[0] / 16
    var roty = (random(alarm[0] / 8)) - alarm[0] / 16
    switch irandom(3)
    {
        case 0:
            draw_sprite_ext(sprite_index, image_index, (xprevious + 1.5 * rotx), (yprevious - roty), image_xscale, image_yscale, (image_angle + rot), red, random_range(0.85, 0.9))
            break
        case 1:
            draw_sprite_ext(sprite_index, image_index, (xprevious - rotx), (yprevious + roty), image_xscale, image_yscale, (image_angle + rot), green, random_range(0.85, 0.9))
            break
        case 2:
            draw_sprite_ext(sprite_index, image_index, (xprevious + rotx), (yprevious + 1.5 * roty), image_xscale, image_yscale, (image_angle + rot), blue, random_range(0.85, 0.9))
            break
    }

}
rot = random(2) - 1
rotx = (random(alarm[0] / 8)) - alarm[0] / 16
roty = (random(alarm[0] / 8)) - alarm[0] / 16
switch irandom(3)
{
    case 0:
        draw_sprite_ext(sprite_index, image_index, (x + 1.5 * rotx), (y - roty), image_xscale, image_yscale, (image_angle + rot), blue, 0.3)
        break
    case 1:
        draw_sprite_ext(sprite_index, image_index, (x + rotx), (y + 1.5 * roty), image_xscale, image_yscale, (image_angle + rot), red, 0.3)
        break
    case 2:
        draw_sprite_ext(sprite_index, image_index, (x - rotx), (y + roty), image_xscale, image_yscale, (image_angle + rot), green, 0.3)
        break
}

