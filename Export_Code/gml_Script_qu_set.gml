if instance_exists(obj_controller)
{
    player_auto()
    with (obj_controller)
    {
        state = argument0
        state_step = 0
        alarm[1] = -1
    }
}
