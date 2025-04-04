with (obj_menu_cat)
{
    target_x = pf_wp_select_options_select.x
    target_y = pf_wp_select_options_select.y
    target_facing = 1
}
with (par_title_logos)
    target_x = xstart
obj_title_computer.on = 1
state = 6
instance_create(0, 0, TITLE_OPTIONS)
