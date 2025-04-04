with (obj_camera)
{
    y = clamp((obj_player.y - 96), ymin, ymax)
    __view_set(0, 0, x)
    __view_set(1, 0, y)
}
