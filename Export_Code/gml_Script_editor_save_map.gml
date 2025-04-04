global.world_height = 32
global.world_width = 32
var filename = "map.ini"
ini_open(filename)
ini_write_string("main", "start_room", "0808")
ini_write_string("main", "map_width", map_width)
ini_write_string("main", "map_height", map_height)
ini_write_string("main", "map_name", map_name)
ini_write_string("main", "spawnx", spawnx)
ini_write_string("main", "spawny", spawny)
for (var i = 0; i < global.world_width; i++)
{
    for (var j = 0; j < global.world_height; j++)
    {
        var i_s = string(i)
        var j_s = string(j)
        if (string_length(i_s) < 2)
            i_s = "0" + i_s
        if (string_length(j_s) < 2)
            j_s = "0" + j_s
        ini_write_string("map", (i_s + j_s), "0")
    }
}
for (var ti = 0; ti < 32; ti++)
{
    for (var tj = 0; tj < 32; tj++)
    {
        var ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
        var tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
        var roomnumber = ti_s + tj_s
        filename = roomnumber + ".rm"
        if file_exists(filename)
        {
            var roomdata = data_manager_load_json(filename)
            var tq = ds_map_find_value(roomdata, "quest")
            if (tq != "-1")
                ini_write_string("map", (i_s + j_s), "2")
            ds_map_destroy(roomdata)
        }
    }
}
ini_close()
