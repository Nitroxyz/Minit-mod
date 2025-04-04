event_inherited()
if (dad != undefined && instance_exists(dad))
{
    if ds_exists(dad.myFlies, 2)
    {
        var _pos = ds_list_find_index(dad.myFlies, id)
        if _pos
            ds_list_delete(dad.myFlies, _pos)
    }
}
if (flying_sfx != undefined)
{
    if audio_is_playing(flying_sfx)
        audio_stop_sound(flying_sfx)
}
