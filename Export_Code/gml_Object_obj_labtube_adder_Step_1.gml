if (cutlist_id != self)
{
    if instance_exists(cutlist_id)
    {
        if (cutlist_id.iindex == 2 && (!instance_exists(obj_changeroom)))
        {
            ds_list_add(global.cutlist, cutlist_uid)
            instance_destroy()
        }
    }
    else
        instance_destroy()
}
