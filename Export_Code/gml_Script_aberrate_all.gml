if (argument_count > 0)
{
    obj_fullscreen_shader.offset_x = (random_range(argument[0], argument[1])) * (choose(-1, 1))
    obj_fullscreen_shader.offset_y = (random_range(argument[0], argument[1])) * (choose(-1, 1))
}
else
{
    obj_fullscreen_shader.offset_x = (random_range(0.003, 0.008)) * (choose(-1, 1))
    obj_fullscreen_shader.offset_y = (random_range(0.003, 0.008)) * (choose(-1, 1))
}
