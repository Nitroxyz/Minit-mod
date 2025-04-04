if (fs_override == 0)
{
    ds_grid_set(menu, 0, 0, loc_read_line(546))
    ds_grid_set(menu, 0, 1, loc_read_line(543))
    ds_grid_set(menu, 0, 2, loc_read_line(545))
    ds_grid_set(menu, 0, 3, loc_read_line(544))
    ds_grid_set(menu, 0, 4, loc_read_line(564))
    ds_grid_set(menu, 0, 5, "RUMBLE")
    ds_grid_set(menu, 0, 6, loc_read_line(575))
    ds_grid_set(menu, 0, 7, loc_read_line(549))
}
else
{
    ds_grid_set(menu, 0, 0, loc_read_line(543))
    ds_grid_set(menu, 0, 1, loc_read_line(545))
    ds_grid_set(menu, 0, 2, loc_read_line(544))
    ds_grid_set(menu, 0, 3, loc_read_line(564))
    ds_grid_set(menu, 0, 4, "RUMBLE")
    ds_grid_set(menu, 0, 5, loc_read_line(549))
}
