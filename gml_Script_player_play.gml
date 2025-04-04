if instance_exists(obj_player)
{
    with (obj_player)
    {
        stopped = 0
        control_state = 87
        if (vehicle == 2)
            collision_state = 78
        else
            collision_state = 58
    }
}
