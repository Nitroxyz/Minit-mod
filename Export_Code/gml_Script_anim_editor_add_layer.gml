timeline_layer_asset[timeline_layer_count] = argument0
timeline_layer_name[timeline_layer_count] = "obj_custom" + string(timeline_layer_asset[timeline_layer_count])
for (var i = 0; i < timeline_length; i++)
{
    timeline_layer_iindex[i, timeline_layer_count] = 0
    timeline_layer_x[i, timeline_layer_count] = 0
    timeline_layer_y[i, timeline_layer_count] = 0
    timeline_layer_rotation[i, timeline_layer_count] = 0
    timeline_layer_flip[i, timeline_layer_count] = 1
}
timeline_layer_count++
