for (var ti = 0; ti < 32; ti++)
{
    for (var tj = 0; tj < 32; tj++)
    {
        var ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
        var tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
        var roomnumber = ti_s + tj_s
        var filename = roomnumber + ".rm"
        if file_exists(filename)
        {
            var roomdata = data_manager_load_json(filename)
            var inst_cur = 0
            while ds_map_exists(roomdata, ("inst" + string(inst_cur)))
            {
                var _map = json_decode(ds_map_find_value(roomdata, ("inst" + string(inst_cur))))
                var t_obj = asset_get_index(ds_map_find_value(_map, "obj"))
                var t_spr = sprite_get_name(object_get_sprite(t_obj))
                if ds_map_exists(_map, "spr")
                    ds_map_replace(_map, "spr", t_spr)
                else
                    ds_map_add(_map, "spr", t_spr)
                var str = json_encode(_map)
                ds_map_destroy(_map)
                ds_map_set(roomdata, ("inst" + string(inst_cur)), str)
                inst_cur++
            }
            str = json_encode(roomdata)
            ds_map_destroy(roomdata)
            save_file(filename, str)
        }
    }
}
