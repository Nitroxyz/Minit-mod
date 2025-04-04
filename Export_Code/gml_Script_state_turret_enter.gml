image_speed = 1
if ((iindex + image_speed) >= image_number)
{
    move_state = 101
    previous_state = move_state
    shoot_state = 2
    sprite_index = spr_turret_shoot
    iindex = 0
    shooting = 0
    grounded = 1
    mask_index = spr_turret_empty
    vehicle = 3
    image_speed = 0
    image_index = 0
    image_speed = 0
    player_play()
}
iindex_set()
