if hasObject
    draw_sprite_ext(holdingSprite, 0, x, (y + 12), image_xscale, 1, 0, c_white, 1)
if (state == stun_state)
{
    if (image_blend == c_white)
        draw_sprite_ext(stun_sprite, iindex, (x + draw_offset_x), (y + draw_offset_y), image_xscale, image_yscale, (image_angle + (random_range(5, -5))), image_blend, image_alpha)
}
else
    draw_self_actor()
