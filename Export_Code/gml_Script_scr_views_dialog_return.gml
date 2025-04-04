var t_0 = __view_get(2, 0)
var t_1 = __view_get(0, 0)
if (t_0 > 277)
{
    __view_set(0, 0, (t_1 + 1))
    __view_set(2, 0, (t_0 - 2))
    __view_set(13, 0, __view_get(2, 0))
    __view_set(11, 1, __view_get(2, 0))
    __view_set(2, 1, (320 - (__view_get(2, 0))))
    __view_set(13, 1, __view_get(2, 1))
    return 0;
}
else
{
    scr_views_setup()
    return 1;
}
