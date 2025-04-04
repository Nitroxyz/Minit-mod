if (timeline_length > 1)
{
    var t_timeline_layer_iindex = -1
    var t_timeline_layer_x = -1
    var t_timeline_layer_y = -1
    var t_timeline_layer_rotation = -1
    var t_timeline_layer_flip = -1
    for (var i = 0; i < timeline_layer_count; i++)
    {
        for (var j = 0; j < (timeline_length - 1); j++)
        {
            t_timeline_layer_iindex[j, i] = timeline_layer_iindex[j, i]
            t_timeline_layer_x[j, i] = timeline_layer_x[j, i]
            t_timeline_layer_y[j, i] = timeline_layer_y[j, i]
            t_timeline_layer_rotation[j, i] = timeline_layer_rotation[j, i]
            t_timeline_layer_flip[j, i] = timeline_layer_flip[j, i]
        }
    }
    timeline_layer_iindex = t_timeline_layer_iindex
    timeline_layer_x = t_timeline_layer_x
    timeline_layer_y = t_timeline_layer_y
    timeline_layer_rotation = t_timeline_layer_rotation
    timeline_layer_flip = t_timeline_layer_flip
    timeline_length--
}
