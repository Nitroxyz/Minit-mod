c_anim_reset_all()
c_anim_index_stun = -1
c_anim_cur_stun = -1
c_anim_cur_real_stun = -1
c_anim_image_speed_stun = -1
c_anim_queue_stun = -1
c_anim_queue_repeat_stun = -1
c_anim_loopflag = 0
c_anim_queue = -1
c_anim_queue_speed = -1
c_anim_queue_repeat = 0
c_anim_inst = self
c_anim_index = argument0
var i = 0
var t_anim_map = data_manager_load_json("anim/" + argument0)
if ds_map_exists(t_anim_map, "sound")
{
    var t_sound_list = ds_map_find_value(t_anim_map, "sound")
    var t_effect_list = ds_map_find_value(t_anim_map, "effect")
}
else
{
    t_sound_list = ds_list_create()
    t_effect_list = ds_list_create()
}
while ds_map_exists(t_anim_map, ("layer" + string(i)))
{
    var t_layer_str = ds_map_find_value(t_anim_map, ("layer" + string(i)))
    var t_layer_map = json_decode(t_layer_str)
    c_anim_asset[i] = ds_map_find_value(t_layer_map, "asset")
    if ds_map_exists(t_layer_map, "name")
        c_anim_asset_name[i] = ds_map_find_value(t_layer_map, "name")
    else
        c_anim_asset_name[i] = "obj_custom" + string(c_anim_asset[i])
    var t_x_list = ds_map_find_value(t_layer_map, "x")
    var t_y_list = ds_map_find_value(t_layer_map, "y")
    var t_rot_list = ds_map_find_value(t_layer_map, "rotation")
    var t_flip_list = ds_map_find_value(t_layer_map, "flip")
    var t_iindex_list = ds_map_find_value(t_layer_map, "iindex")
    c_anim_length = 0
    for (var j = 0; j < ds_list_size(t_x_list); j++)
    {
        if (i == 0)
        {
            if (ds_list_find_value(t_sound_list, j) != undefined)
            {
                c_anim_sound[j] = ds_list_find_value(t_sound_list, j)
                c_anim_effect[j] = ds_list_find_value(t_effect_list, j)
            }
            else
            {
                c_anim_sound[j] = -1
                c_anim_effect[j] = -1
            }
        }
        c_anim_x[j, i] = ds_list_find_value(t_x_list, j)
        c_anim_y[j, i] = ds_list_find_value(t_y_list, j)
        c_anim_rotation[j, i] = ds_list_find_value(t_rot_list, j)
        c_anim_flip[j, i] = ds_list_find_value(t_flip_list, j)
        c_anim_iindex[j, i] = ds_list_find_value(t_iindex_list, j)
        c_anim_length++
    }
    ds_map_destroy(t_layer_map)
    ds_list_destroy(t_x_list)
    ds_list_destroy(t_y_list)
    ds_list_destroy(t_rot_list)
    ds_list_destroy(t_flip_list)
    ds_list_destroy(t_iindex_list)
    i++
    c_anim_asset_count++
}
ds_list_destroy(t_sound_list)
ds_list_destroy(t_effect_list)
ds_map_destroy(t_anim_map)
for (i = 0; i < c_anim_asset_count; i++)
{
    c_anim_inst[i] = instance_create((x + image_xscale * (c_anim_x[0, i])), (y + (c_anim_y[0, i])), asset_get_index("obj_custom" + string(c_anim_asset[i])))
    c_anim_inst[i].image_angle = image_xscale * (c_anim_rotation[0, i])
    c_anim_inst[i].image_xscale = image_xscale * (c_anim_flip[0, i])
    c_anim_inst[i].iindex = c_anim_iindex[0, i]
    c_anim_inst[i].master = id
}
