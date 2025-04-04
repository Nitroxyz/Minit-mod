var arg;
var i = 0
repeat argument_count
{
    arg[i] = argument[i]
    i++
}
var ds = ds_grid_create(5, argument_count)
i = 0
repeat argument_count
{
    var arr = arg[i]
    var arr_len = array_length_1d(arr)
    var j = 0
    repeat arr_len
    {
        ds_grid_set(ds, j, i, arr[j])
        j++
    }
    i++
}
return ds;
