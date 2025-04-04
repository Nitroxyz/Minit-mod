if (argument_count > 0)
{
    var roomnumber = argument[0]
    global.current_room = roomnumber
}
else
    roomnumber = global.current_room
if (roomnumber == global.room_start)
{
    if instance_exists(obj_editor_cbox_startroom)
    {
        with (obj_editor_cbox_startroom)
            checked = 1
    }
}
else if instance_exists(obj_editor_cbox_startroom)
{
    with (obj_editor_cbox_startroom)
        checked = 0
}
var grid_layer_old = grid_layer
editor_clear_properties_pane()
editor_clear_room_grid()
if (!(ds_exists(MAP_MANAGER.map_loaded, 1)))
    process_mapmanager_load()
var map_wrapper = MAP_MANAGER.map_loaded
if ds_map_exists(map_wrapper, roomnumber)
    var roomdata = json_decode(ds_map_find_value(map_wrapper, roomnumber))
else
    return;
quest = ds_map_find_value(roomdata, "quest")
upopen = real(ds_map_find_value(roomdata, "upopen"))
downopen = real(ds_map_find_value(roomdata, "downopen"))
leftopen = real(ds_map_find_value(roomdata, "leftopen"))
rightopen = real(ds_map_find_value(roomdata, "rightopen"))
var t_doors = 0
if (!(is_undefined(ds_map_find_value(roomdata, "doors"))))
    t_doors = ds_map_find_value(roomdata, "doors")
mapdoor_u = get_bitwise_flag(t_doors, 2)
mapdoor_r = get_bitwise_flag(t_doors, 1)
mapdoor_l = get_bitwise_flag(t_doors, 4)
mapdoor_d = get_bitwise_flag(t_doors, 8)
mapdoor_s = get_bitwise_flag(t_doors, 16)
mapdoor_e = get_bitwise_flag(t_doors, 32)
if ds_map_exists(roomdata, "maptarget")
{
    obj_editor.properties_roomtarget_x = ds_map_find_value(roomdata, "roomtarget_x")
    obj_editor.properties_roomtarget_y = ds_map_find_value(roomdata, "roomtarget_y")
    obj_editor.properties_maptarget = ds_map_find_value(roomdata, "maptarget")
}
for (var i = 0; i < array_length_1d(obj_editor_quest_chooser.property); i++)
{
    if (obj_editor_quest_chooser.property[i] == quest)
        obj_editor_quest_chooser.prop_cur = i
    else if is_undefined(quest)
    {
        obj_editor_quest_chooser.prop_cur = 0
        quest = "-1"
    }
}
if (upopen != 0)
    button[14].image_blend = c_green
else
    button[14].image_blend = c_white
if (downopen != 0)
    button[15].image_blend = c_green
else
    button[15].image_blend = c_white
if (leftopen != 0)
    button[12].image_blend = c_green
else
    button[12].image_blend = c_white
if (rightopen != 0)
    button[13].image_blend = c_green
else
    button[13].image_blend = c_white
var inst_cur = 0
while ds_map_exists(roomdata, ("inst" + string(inst_cur)))
{
    var _map = json_decode(ds_map_find_value(roomdata, ("inst" + string(inst_cur))))
    var t_obj = asset_get_index(ds_map_find_value(_map, "obj"))
    var t_id = ds_map_find_value(_map, "id")
    var t_i = ds_map_find_value(_map, "i")
    var t_j = ds_map_find_value(_map, "j")
    var t_x = ds_map_find_value(_map, "x")
    var t_y = ds_map_find_value(_map, "y")
    var t_xscale = ds_map_find_value(_map, "image_xscale")
    var t_yscale = ds_map_find_value(_map, "image_yscale")
    var t_direction = ds_map_find_value(_map, "direction")
    var t_angle = ds_map_find_value(_map, "image_angle")
    if ds_map_exists(_map, "spr")
        var t_spr = ds_map_find_value(_map, "spr")
    else if (object_get_sprite(t_obj) != -1)
        t_spr = sprite_get_name(object_get_sprite(t_obj))
    else
        t_spr = "spr_none"
    i = real(t_i)
    var j = real(t_j)
    grid_layer = ds_map_find_value(_map, "layer")
    t_layer = room_editor
    switch grid_layer
    {
        case "player":
            t_layer = room_editor
            break
        case "foreground":
            t_layer = room_editor_f
            break
    }

    if (!(ds_exists(t_layer[i, j], 1)))
        t_layer[i, j] = ds_map_create()
    ds_map_add(t_layer[i, j], "obj", t_obj)
    ds_map_add(t_layer[i, j], "spr", t_spr)
    ds_map_add(t_layer[i, j], "xscale", real(t_xscale))
    ds_map_add(t_layer[i, j], "yscale", real(t_yscale))
    ds_map_add(t_layer[i, j], "uid", real(t_id))
    ds_map_add(t_layer[i, j], "rotation", real(t_angle))
    var meth = 0
    while ds_map_exists(_map, ("method" + string(meth)))
    {
        meth_id = ds_map_find_value(_map, ("method" + string(meth)))
        ds_map_add(t_layer[i, j], ("method" + string(meth)), meth_id)
        meth++
    }
    inst_cur++
}
grid_layer = grid_layer_old
editor_show_minimap()
