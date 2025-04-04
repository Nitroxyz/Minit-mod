var map_wrapper = ds_map_create()
var mn = 0
while file_exists("map" + string(mn))
    mn++
var mapname = "map" + string(mn)
for (var j = 0; j < 100; j++)
{
    for (var i = 0; i < 100; i++)
    {
        var str_i = string(i)
        var str_j = string(j)
        if (string_length(str_i) == 1)
            str_i = "0" + str_i
        if (string_length(str_j) == 1)
            str_j = "0" + str_j
        var roomnumber = str_i + str_j
        var fn = roomnumber + ".rm"
        if file_exists(fn)
        {
            var _buffer = buffer_load(fn)
            var room_string = buffer_read(_buffer, buffer_string)
            buffer_delete(_buffer)
            ds_map_add(map_wrapper, roomnumber, room_string)
        }
    }
}
var map_str = json_encode(map_wrapper)
ds_map_destroy(map_wrapper)
save_file(mapname, map_str)
