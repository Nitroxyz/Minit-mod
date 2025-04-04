if (!global.dump_tool)
{
    if (ds_list_find_index(global.cutlist, uid) == -1)
    {
        var temp = instance_create(x, y, obj_labtube_adder)
        temp.cutlist_id = id
        temp.cutlist_uid = uid
        return 0;
    }
    else
        return 1;
}
else
{
    var meth_cur = array_length_1d(method)
    method[meth_cur] = "cut_this"
}
