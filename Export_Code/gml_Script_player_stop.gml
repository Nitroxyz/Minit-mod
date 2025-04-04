if instance_exists(obj_player)
{
    if (obj_player.stopped == 0)
    {
        with (obj_player)
        {
            player_reset_control_flags()
            stopped = 1
            if (vehicle == 0)
            {
                if (move_state != 2)
                    old_move_state = move_state
                old_shoot_state = shoot_state
            }
            else
            {
                if (move_state != 2)
                    old_move_state = move_state
                if (shoot_state != 2)
                    old_shoot_state = shoot_state
            }
            move_state = 2
            collision_state = 2
            control_state = 2
            old_image_speed = image_speed
            image_speed = 0
            key_dismount = 0
        }
    }
}
