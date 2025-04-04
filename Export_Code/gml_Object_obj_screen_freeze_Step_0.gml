switch state
{
    case 0:
        state = 1
        with (all)
        {
            if (!((object_index == obj_screen_freeze || object_index == obj_map || object_index == obj_controller || object_index == obj_hud || object_get_parent(object_index) == 7)))
            {
                ds_list_add(global.pause_list, id)
                instance_deactivate_object(id)
            }
        }
        break
    case 1:
        state = 3
        obj_controller.state = "menu"
        break
    case 3:
        if (obj_controller.state == "unpause")
            state = 4
        break
    case 4:
        var i = 0
        for (i = 0; i < ds_list_size(global.pause_list); i++)
            instance_activate_object(ds_list_find_value(global.pause_list, i))
        ds_list_destroy(global.pause_list)
        instance_destroy()
        break
}

