if (state == stun_state)
{
    if (image_blend == c_white)
        draw_sprite_ext(stun_sprite, iindex, (x + draw_offset_x), (y + draw_offset_y), image_xscale, image_yscale, (image_angle + (random_range(5, -5))), image_blend, image_alpha)
}
else
    draw_self_actor()
draw_sprite(spr_guardian_gears, gear_frame, (x - 24), (y + abs(draw_offset_y)))
draw_sprite(spr_guardian_gears, gear_frame, (x + 25), (y + abs(draw_offset_y)))
