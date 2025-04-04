if keyboard_check(vk_shift)
{
    audio_cur -= 10
    if (audio_cur < 0)
        audio_cur += array_length_1d(global.audio_default_volumes)
}
else
{
    audio_cur -= 1
    if (audio_cur < 0)
        audio_cur += array_length_1d(global.audio_default_volumes)
}
audio_level = global.audio_default_volumes[audio_cur]
