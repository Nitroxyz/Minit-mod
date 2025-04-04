if (__view_get(0, 0) < -4)
{
    __view_set(0, 0, round(approach(__view_get(0, 0), -2, 19)))
    __view_set(0, 0, ((__view_get(0, 0)) + spd))
    spd = min(maxspd, (spd + acc))
}
else if (__view_get(0, 0) > 0)
{
    __view_set(0, 0, round(approach(__view_get(0, 0), -2, 19)))
    __view_set(0, 0, ((__view_get(0, 0)) + spd))
    spd = max((-maxspd), (spd - acc))
}
else if (__view_get(1, 0) > 0)
{
    __view_set(0, 0, -2)
    __view_set(1, 0, -2)
    player_play()
    scr_init_autodoors()
    instance_destroy()
}
else if (__view_get(1, 0) < -4)
{
    __view_set(1, 0, round(approach(__view_get(1, 0), -2, 12)))
    __view_set(1, 0, ((__view_get(1, 0)) + spd))
    spd = min(maxspd, (spd + acc))
}
else
{
    __view_set(0, 0, -2)
    __view_set(1, 0, -2)
    player_play()
    scr_init_autodoors()
    instance_destroy()
}
