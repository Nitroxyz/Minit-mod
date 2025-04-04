if (!global.dump_tool)
{
    if (ds_list_find_index(global.getlist, string(uid)) != -1)
        instance_destroy()
    else
        visible = true
}
