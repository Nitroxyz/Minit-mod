if (cutlist_id != self)
{
    if ((!instance_exists(cutlist_id)) && (!instance_exists(obj_changeroom)))
    {
        ds_list_add(global.cutlist, cutlist_uid)
        instance_destroy()
    }
}
