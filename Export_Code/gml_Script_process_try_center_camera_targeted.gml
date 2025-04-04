with (obj_camera)
{
    y = clamp((argument0.y - 160), ymin, ymax)
    __view_set(0, 0, x)
    __view_set(1, 0, y)
}
