if instance_exists(obj_player)
{
    with (obj_player)
    {
        old_move_state = move_state
        control_state = 88
        player_reset_control_flags()
    }
}
