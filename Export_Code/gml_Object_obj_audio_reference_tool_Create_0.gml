if (instance_number(obj_audio_reference_tool) > 1)
{
    instance_destroy()
    return;
}
audio_values_o = -1
for (var i = 0; i < array_length_1d(global.audio_default_volumes); i++)
    audio_values_o[i] = global.audio_default_volumes[i]
depth = -10000000
audio_cur = 0
audio_level = 0
