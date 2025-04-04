__view_set(2, 0, 320)
__view_set(13, 0, 320)
var t_0 = __view_get(0, 0)
if (t_0 > -22)
{
    __view_set(0, 0, (t_0 - 1))
    return 0;
}
else
{
    __view_set(0, 0, -22)
    return 1;
}
