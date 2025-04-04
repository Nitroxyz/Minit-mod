var uid_counter = 0
var str = ""
var map_cur = 0
while file_exists("map" + string(map_cur))
{
    process_mapmanager_load("map" + string(map_cur))
    var map_wrapper = MAP_MANAGER.map_loaded
    for (var xx = 0; xx < 32; xx++)
    {
        for (var yy = 0; yy < 32; yy++)
        {
            var s_xx = (string_length(string(xx)) == 1 ? ("0" + string(xx)) : string(xx))
            var s_yy = (string_length(string(yy)) == 1 ? ("0" + string(yy)) : string(yy))
            var roomnumber = s_xx + s_yy
            var inst_cur = 0
            if ds_map_exists(map_wrapper, roomnumber)
            {
                var roomdata = json_decode(ds_map_find_value(map_wrapper, roomnumber))
                while ds_map_exists(roomdata, ("inst" + string(inst_cur)))
                {
                    var inst_wrapper = json_decode(ds_map_find_value(roomdata, ("inst" + string(inst_cur))))
                    ds_map_delete(inst_wrapper, "id")
                    ds_map_add(inst_wrapper, "id", uid_counter)
                    uid_counter++
                    var inst_wrapper_string = json_encode(inst_wrapper)
                    ds_map_destroy(inst_wrapper)
                    ds_map_delete(roomdata, ("inst" + string(inst_cur)))
                    ds_map_add(roomdata, ("inst" + string(inst_cur)), inst_wrapper_string)
                    inst_cur++
                }
                str = json_encode(roomdata)
                ds_map_destroy(roomdata)
                ds_map_delete(map_wrapper, roomnumber)
                ds_map_add(map_wrapper, roomnumber, str)
            }
        }
    }
    str = json_encode(map_wrapper)
    ds_map_destroy(map_wrapper)
    file_delete(MAP_MANAGER.map_current)
    save_file(MAP_MANAGER.map_current, str)
    map_cur++
}
