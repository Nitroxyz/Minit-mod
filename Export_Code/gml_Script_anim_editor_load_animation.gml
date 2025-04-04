anim_editor_reset_all()
var i = 0
var t_anim_map = data_manager_load_json(argument0)
while ds_map_exists(t_anim_map, ("layer" + string(i)))
{
    var t_layer_str = ds_map_find_value(t_anim_map, ("layer" + string(i)))
    var t_layer_map = json_decode(t_layer_str)
    timeline_layer_asset[i] = ds_map_find_value(t_layer_map, "asset")
    if ds_map_exists(t_layer_map, "name")
        timeline_layer_name[i] = ds_map_find_value(t_layer_map, "name")
    else
        timeline_layer_name[i] = "obj_custom" + string(timeline_layer_asset[i])
    var t_x_list = ds_map_find_value(t_layer_map, "x")
    var t_y_list = ds_map_find_value(t_layer_map, "y")
    var t_rot_list = ds_map_find_value(t_layer_map, "rotation")
    var t_flip_list = ds_map_find_value(t_layer_map, "flip")
    var t_iindex_list = ds_map_find_value(t_layer_map, "iindex")
    timeline_length = 0
    for (var j = 0; j < ds_list_size(t_x_list); j++)
    {
        timeline_layer_x[j, i] = ds_list_find_value(t_x_list, j)
        timeline_layer_y[j, i] = ds_list_find_value(t_y_list, j)
        timeline_layer_rotation[j, i] = ds_list_find_value(t_rot_list, j)
        timeline_layer_flip[j, i] = ds_list_find_value(t_flip_list, j)
        timeline_layer_iindex[j, i] = ds_list_find_value(t_iindex_list, j)
        timeline_length++
    }
    ds_map_destroy(t_layer_map)
    ds_list_destroy(t_x_list)
    ds_list_destroy(t_y_list)
    ds_list_destroy(t_rot_list)
    ds_list_destroy(t_flip_list)
    ds_list_destroy(t_iindex_list)
    i++
    timeline_layer_count++
}
var t_events_map = -1
if ds_map_exists(t_anim_map, "events")
{
    t_events_map = json_decode(ds_map_find_value(t_anim_map, "events"))
    var t_sound_list = ds_map_find_value(t_events_map, "sound")
    var t_effect_list = ds_map_find_value(t_events_map, "effect")
}
else
{
    t_events_map = ds_map_create()
    t_sound_list = ds_list_create()
    t_effect_list = ds_list_create()
}
for (j = 0; j < timeline_length; j++)
{
    if (ds_list_find_value(t_sound_list, j) != undefined)
    {
        timeline_layer_sound[j] = ds_list_find_value(t_sound_list, j)
        timeline_layer_effect[j] = ds_list_find_value(t_effect_list, j)
    }
    else
    {
        timeline_layer_sound[j] = -1
        timeline_layer_effect[j] = -1
    }
}
ds_list_destroy(t_sound_list)
ds_list_destroy(t_effect_list)
ds_map_destroy(t_events_map)
ds_map_destroy(t_anim_map)
