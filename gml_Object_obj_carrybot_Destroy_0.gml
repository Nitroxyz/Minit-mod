event_inherited()
if (flying_audio != undefined)
{
    if audio_is_playing(flying_audio)
        audio_stop_sound(flying_audio)
}
if (!c_destroy)
{
    if hasObject
        instance_create(x, (y + 12), holdingObject)
}
