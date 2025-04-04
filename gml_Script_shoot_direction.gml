if key_up
{
    shootdir = 90
    obj_gun.depth = depth + 1
    if (move_state != 67)
    {
        if (sprite_index != spr_plr_jump)
        {
            if (sprite_index == spr_player_idle)
            {
                image_speed = 0
                image_index = 0
                iindex = 0
            }
            sprite_index = spr_player_U
        }
    }
}
else if key_down
{
    obj_gun.depth = depth - 1
    shootdir = 270
    if (move_state != 67)
    {
        if (sprite_index != spr_plr_jump)
        {
            if (sprite_index == spr_player_idle)
            {
                image_speed = 0
                image_index = 0
            }
            sprite_index = spr_player_D
        }
    }
}
else
{
    obj_gun.depth = depth + 1
    if (facing == 1)
        shootdir = 0
    else
        shootdir = 180
    if (move_state != 67)
    {
        if (sprite_index != spr_player_idle && sprite_index != spr_plr_jump)
            sprite_index = spr_player_C
    }
}
