for (var i = 0; i < flowcount; i++)
{
    instance_activate_object(flows[i])
    with (flows[i])
        instance_destroy()
}
instance_activate_object(flow_bottom)
with (flow_bottom)
    instance_destroy()
instance_activate_object(flow_top)
with (flow_top)
    instance_destroy()
if (audio_is_playing(snd_lavaflow) && instance_number(obj_lavaflow_source) == 1)
    audio_stop_sound(snd_lavaflow)
