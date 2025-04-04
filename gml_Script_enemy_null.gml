if (!global.dump_tool)
{
    e_null = instance_create(0, 0, eny_null)
    e_null.parent = id
    hide = 0
}
else
{
    var meth_cur = array_length_1d(method)
    method[meth_cur] = "enemy_null"
}
