with (obj_menu_cat)
{
    target_x = pf_wp_select_start.x
    target_y = pf_wp_select_start.y
    target_facing = 1
}
with (TITLE_OPTIONS)
    instance_destroy()
titlemenu_fn_save_options()
with (par_title_logos)
    target_x = target_x_centered
with (TITLE_MANAGER)
{
    state = 0
    event_perform(ev_other, ev_user0)
}
with (obj_title_computer)
    on = 0
