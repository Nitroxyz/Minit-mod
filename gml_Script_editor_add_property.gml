var t_i = argument[0]
var t_j = argument[1]
var t_obj_id = argument[2]
var t_dsmap = argument[3]
var t_interface = argument[4]
var t_prop = argument[5]
var t_message = argument[6]
var meth = 0
while ds_map_exists(t_dsmap, ("method" + string(meth)))
    meth++
if (t_interface == obj_editor_checkbox)
{
    ds_map_add(t_dsmap, ("method" + string(meth)), "scr_none")
    prop_button[meth] = instance_create(prop_pane_x, (prop_pane_y + 12 * meth), obj_editor_checkbox)
    prop_button[meth].property = t_prop
    prop_button[meth].message = t_message
    prop_button[meth].method = meth
    if ds_map_exists(t_layer[grid_focus_i, grid_focus_j], ("method" + string(meth)))
    {
        if (ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], ("method" + string(meth))) != "scr_none")
        {
            prop_button[meth].checked = 1
            editor_set_property(meth, prop_button[meth].property)
        }
        else
        {
            prop_button[meth].checked = 0
            editor_set_property(meth, "scr_none")
        }
    }
}
if (t_interface == obj_editor_listmenu)
{
    ds_map_add(t_dsmap, ("method" + string(meth)), argument[5])
    prop_button[meth] = instance_create(prop_pane_x, (prop_pane_y + 12 * meth), obj_editor_listmenu)
    prop_button[meth].method = meth
    for (var i = 5; i < argument_count; i += 2)
    {
        t_prop = argument[i]
        t_message = argument[(i + 1)]
        prop_button[meth].property[((i - 5) / 2)] = t_prop
        prop_button[meth].message[((i - 5) / 2)] = t_message
    }
    if ds_map_exists(t_layer[grid_focus_i, grid_focus_j], ("method" + string(meth)))
    {
        var t_meth = ds_map_find_value(t_layer[grid_focus_i, grid_focus_j], ("method" + string(meth)))
        i = 0
        for (i = 0; i < array_length_1d(prop_button[meth].property); i++)
        {
            if (prop_button[meth].property[i] == t_meth)
            {
                prop_button[meth].prop_cur = i
                editor_set_property(meth, t_meth)
            }
        }
    }
}
if (t_interface == obj_editor_elevator_map_chooser || t_interface == obj_editor_elevator_room_x || t_interface == obj_editor_elevator_room_y)
{
    ds_map_add(t_dsmap, ("method" + string(meth)), "scr_none")
    prop_button[meth] = instance_create(prop_pane_x, (prop_pane_y + 12 * meth), t_interface)
}
