if (!global.dump_tool)
{
    hfloat = 0
    vfloat = 0.4
    hspd = hfloat
    vspd = vfloat
    hadj = 0
    vadj = 0
    xtemp = x
    ytemp = y
}
else
{
    var meth_cur = array_length_1d(method)
    method[meth_cur] = "froggo_down"
}
