if instance_exists(obj_door_auto_U)
{
    with (obj_door_auto_U)
        state = 1
    scr_init_visible_enemies()
}
else
    scr_init_enemies()
