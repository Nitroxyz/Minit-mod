global.respawn_mode = 0
with (all)
{
    if (object_index != GAME_MANAGER && object_index != obj_switch_master && object_index != DATA_MANAGER)
        instance_destroy()
}
with (GAME_MANAGER)
    instance_destroy()
