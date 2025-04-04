if instance_exists(obj_player)
{
    target_x = obj_player.x
    target_y = obj_player.y
    target = 14
}
else
    target = undefined
if mp_grid_path(mpg, path, x, y, target_x, target_y, true)
{
    next_x = path_get_point_x(path, 1)
    next_y = path_get_point_y(path, 1)
}
