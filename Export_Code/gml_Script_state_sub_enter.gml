sprite_index = spr_sub_enter
image_speed = 1
if ((iindex + image_speed) >= image_number)
{
    move_state = 79
    shoot_state = 86
    sprite_index = spr_player_sub
    vehicle = 2
    hspd = 0
    vspd = 0
    shooting = 0
    cat = 0
    old_move_state = 79
    mask_index = spr_player_sub
    image_speed = 0
    if place_meeting(x, y, obj_wall)
    {
        if (!(place_meeting(x, (y - 8), obj_wall)))
        {
            while place_meeting(x, y, obj_wall)
                y--
        }
        else if (!(place_meeting(x, (y + 8), obj_wall)))
        {
            while place_meeting(x, y, obj_wall)
                y++
        }
    }
    player_play()
    collision_state = 78
}
iindex_set()
