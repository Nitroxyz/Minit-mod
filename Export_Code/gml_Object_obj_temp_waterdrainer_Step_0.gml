if instance_exists(obj_treadmill_locker)
{
    if obj_treadmill_locker.locked
    {
        instance_destroy()
        ds_list_add(global.getlist, string(uid))
        qu_set(237)
    }
}
