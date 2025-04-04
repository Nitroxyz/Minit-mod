if keyboard_check(vk_shift)
{
    for (var i = 0; i < timeline_layer_count; i++)
    {
        timeline_layer_iindex[(argument0 - 2), i] = timeline_layer_iindex[argument0, i]
        timeline_layer_x[(argument0 - 2), i] = timeline_layer_x[argument0, i]
        timeline_layer_y[(argument0 - 2), i] = timeline_layer_y[argument0, i]
        timeline_layer_rotation[(argument0 - 2), i] = timeline_layer_rotation[argument0, i]
        timeline_layer_flip[(argument0 - 2), i] = timeline_layer_flip[argument0, i]
        if (i == 0)
        {
            timeline_layer_sound[(argument0 - 2)] = timeline_layer_sound[argument0]
            timeline_layer_effect[(argument0 - 2)] = timeline_layer_effect[argument0]
        }
    }
}
else
{
    timeline_layer_iindex[(argument0 - 2), timeline_layer_cur] = timeline_layer_iindex[argument0, timeline_layer_cur]
    timeline_layer_x[(argument0 - 2), timeline_layer_cur] = timeline_layer_x[argument0, timeline_layer_cur]
    timeline_layer_y[(argument0 - 2), timeline_layer_cur] = timeline_layer_y[argument0, timeline_layer_cur]
    timeline_layer_rotation[(argument0 - 2), timeline_layer_cur] = timeline_layer_rotation[argument0, timeline_layer_cur]
    timeline_layer_flip[(argument0 - 2), timeline_layer_cur] = timeline_layer_flip[argument0, timeline_layer_cur]
}
