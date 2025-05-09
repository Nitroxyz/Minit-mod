anim_cur = 0
while file_exists("anim" + string(anim_cur))
    anim_cur++
var t_anim_map = ds_map_create()
var t_sound_list = ds_list_create()
var t_effect_list = ds_list_create()
for (var i = 0; i < timeline_layer_count; i++)
{
    var t_layer_map = ds_map_create()
    ds_map_add(t_layer_map, "asset", timeline_layer_asset[i])
    ds_map_add(t_layer_map, "name", timeline_layer_name[i])
    var t_x_list = ds_list_create()
    var t_y_list = ds_list_create()
    var t_rot_list = ds_list_create()
    var t_flip_list = ds_list_create()
    var t_iindex_list = ds_list_create()
    for (var j = 0; j < timeline_length; j++)
    {
        if (i == 0)
        {
            ds_list_add(t_sound_list, timeline_layer_sound[j])
            ds_list_add(t_effect_list, timeline_layer_effect[j])
        }
        ds_list_add(t_x_list, timeline_layer_x[j, i])
        ds_list_add(t_y_list, timeline_layer_y[j, i])
        ds_list_add(t_rot_list, timeline_layer_rotation[j, i])
        ds_list_add(t_flip_list, timeline_layer_flip[j, i])
        ds_list_add(t_iindex_list, timeline_layer_iindex[j, i])
    }
    ds_map_add_list(t_layer_map, "x", t_x_list)
    ds_map_add_list(t_layer_map, "y", t_y_list)
    ds_map_add_list(t_layer_map, "rotation", t_rot_list)
    ds_map_add_list(t_layer_map, "flip", t_flip_list)
    ds_map_add_list(t_layer_map, "iindex", t_iindex_list)
    var str = json_encode(t_layer_map)
    ds_map_add(t_anim_map, ("layer" + string(i)), str)
    ds_list_destroy(t_x_list)
    ds_list_destroy(t_y_list)
    ds_list_destroy(t_rot_list)
    ds_list_destroy(t_flip_list)
    ds_list_destroy(t_iindex_list)
    ds_map_destroy(t_layer_map)
}
ds_map_add_list(t_anim_map, "sound", t_sound_list)
ds_map_add_list(t_anim_map, "effect", t_effect_list)
ds_list_destroy(t_sound_list)
ds_list_destroy(t_effect_list)
str = json_encode(t_anim_map)
save_file(("anim" + string(anim_cur)), str)
ds_map_destroy(t_anim_map)
