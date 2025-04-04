if instance_exists(obj_player)
{
    if (obj_player.sprite_index == spr_mech_hurt)
        return;
    switch obj_player.shootdir
    {
        case 0:
            if (obj_player.image_blend == c_white)
                draw_sprite_ext(mySprite, iindex, (obj_player.x + 12), (obj_player.y + 1), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
            break
        case 180:
            if (obj_player.image_blend == c_white)
                draw_sprite_ext(mySprite, iindex, (obj_player.x - 12), (obj_player.y + 1), (-image_xscale), image_yscale, image_angle, image_blend, image_alpha)
            break
        case 90:
            if (obj_player.facing == 1)
            {
                if (obj_player.image_blend == c_white)
                    draw_sprite_ext(mySprite, iindex, (obj_player.x + 4), (obj_player.y - 7), image_xscale, image_yscale, 90, image_blend, image_alpha)
            }
            else if (obj_player.image_blend == c_white)
                draw_sprite_ext(mySprite, iindex, (obj_player.x - 6), (obj_player.y - 7), image_xscale, image_yscale, 90, image_blend, image_alpha)
            break
        case 270:
            if (obj_player.facing == 1)
            {
                if (obj_player.image_blend == c_white)
                    draw_sprite_ext(mySprite, iindex, (obj_player.x + 5), (obj_player.y + 8), image_xscale, image_yscale, 270, image_blend, image_alpha)
            }
            else if (obj_player.image_blend == c_white)
                draw_sprite_ext(mySprite, iindex, (obj_player.x - 3), (obj_player.y + 8), image_xscale, image_yscale, 270, image_blend, image_alpha)
            break
    }

}
