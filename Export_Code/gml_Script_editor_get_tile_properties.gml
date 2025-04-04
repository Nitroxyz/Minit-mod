var t_i = argument0
var t_j = argument1
var t_obj_id = argument2
switch t_obj_id
{
    case 266:
        var prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 330, "scr_none", "start right", "froggo_left", "start left", "froggo_up", "start up", "froggo_down", "start down")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        break
    case 267:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        break
    case 248:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        break
    case 249:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        break
    case 174:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        break
    case 109:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "create_upon_room_clear", "create when room is cleared")
        break
    case 114:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "create_upon_room_clear", "create when room is cleared")
        break
    case 165:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 330, "movingplat_setminy", "no limit", "movingplat_setminy1", "1 tile limit", "movingplat_setminy2", "2 tile limit", "movingplat_setminy3", "3 tile limit", "movingplat_setminy4", "4 tile limit", "movingplat_setminy5", "5 tile limit")
        break
    case 108:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "create_upon_room_clear", "create when room is cleared")
        break
    case 150:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "make_treadmill_nonlockable", "Make treadmill nonlockable")
        break
    case 113:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 330, "choose_palette_2", "palette2", "choose_palette_3", "palette3", "choose_palette_4", "palette4", "choose_palette_5", "palette5", "choose_palette_6", "palette6", "choose_palette_7", "palette7", "choose_palette_8", "palette8")
        break
    case 103:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "make_elevator_enter_only", "Direction Up")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 321, "set_elevator_x", "Elevator room X")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 322, "set_elevator_y", "Elevator room Y")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 320, "set_elevator_map", "Elevator map")
        break
    case 104:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "make_elevator_enter_only", "Direction Up")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 321, "set_elevator_x", "Elevator room X")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 322, "set_elevator_y", "Elevator room Y")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 320, "set_elevator_map", "Elevator map")
        break
    case 75:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 330, "scr_none", "start right", "make_steam_start_center", "start center", "make_steam_start_left", "start left", "make_steam_start_up", "start up", "make_steam_start_down", "start down")
        break
    case 420:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 330, "scr_none", "angle=90", "make_spikeball_angle_75", "angle=75", "make_spikeball_angle_60", "angle=60", "make_spikeball_angle_45", "angle=45", "make_spikeball_angle_30", "angle=30", "make_spikeball_angle_15", "angle=15")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 330, "scr_none", "length=32", "make_spikeball_length_48", "length=48", "make_spikeball_length_64", "length=64", "make_spikeball_length_80", "length=80", "make_spikeball_length_96", "length=96", "make_spikeball_length_112", "length=112", "make_spikeball_length_128", "length=128")
        break
    case 184:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 330, "scr_none", "fan off", "set_boxfan_default_on", "fan on")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "set_boxfan_blow_true", "fan blow?")
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "set_boxfan_no_wall", "no collision")
        break
    case 24:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "hide_duplicate_subs", "hide duplicates")
        break
    default:
        prop_map = ds_map_create()
        if (!(ds_map_exists(t_layer[grid_focus_i, grid_focus_j], "properties")))
            ds_map_add(t_layer[grid_focus_i, grid_focus_j], "properties", prop_map)
        editor_add_property(t_i, t_j, t_obj_id, prop_map, 329, "cut_this", "remember when destroyed")
        break
}

