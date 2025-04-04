for (var i = 0; i < timeline_layer_count; i++)
{
    timeline_layer_iindex[(argument0 + 1), i] = timeline_layer_iindex[argument0, i]
    timeline_layer_x[(argument0 + 1), i] = timeline_layer_x[argument0, i]
    timeline_layer_y[(argument0 + 1), i] = timeline_layer_y[argument0, i]
    timeline_layer_rotation[(argument0 + 1), i] = timeline_layer_rotation[argument0, i]
    timeline_layer_flip[(argument0 + 1), i] = timeline_layer_flip[argument0, i]
    if (i == 0)
    {
        timeline_layer_sound[(argument0 + 1)] = timeline_layer_sound[argument0]
        timeline_layer_effect[(argument0 + 1)] = timeline_layer_effect[argument0]
    }
}
