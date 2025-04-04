global.tile_conversion_table = data_manager_load_json("tile_conversion_table")
for (var ti = 0; ti < 128; ti++)
{
    for (var tj = 0; tj < 128; tj++)
    {
        var ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
        var tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
        var fname = ti_s + tj_s + ".rm"
        if file_exists(fname)
        {
            var roomdata = data_manager_load_json(fname)
            var inst_cur = 0
            while ds_map_exists(roomdata, ("inst" + string(inst_cur)))
            {
                var _map = json_decode(ds_map_find_value(roomdata, ("inst" + string(inst_cur))))
                var t_obj = asset_get_index(ds_map_find_value(_map, "obj"))
                if (t_obj == 12 && ds_map_exists(_map, "spr"))
                {
                    var t_spr = ds_map_find_value(_map, "spr")
                    t_spr = process_convert_tile_sprite_indexes(t_spr)
                    ds_map_replace(_map, "spr", t_spr)
                }
                var _str = json_encode(_map)
                ds_map_replace(roomdata, ("inst" + string(inst_cur)), _str)
                inst_cur++
            }
            var str = json_encode(roomdata)
            ds_map_destroy(roomdata)
            save_file(fname, str)
        }
    }
}
game_end()
