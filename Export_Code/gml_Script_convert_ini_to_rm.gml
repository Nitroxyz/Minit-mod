for (var ti = 0; ti < 11; ti++)
{
    for (var tj = 0; tj < 11; tj++)
    {
        var ti_s = (string_length(string(ti)) == 2 ? string(ti) : ("0" + string(ti)))
        var tj_s = (string_length(string(tj)) == 2 ? string(tj) : ("0" + string(tj)))
        var roomnumber = ti_s + tj_s
        var filename = working_directory + "rs" + roomnumber + ".ini"
        if file_exists(filename)
        {
            ini_open(filename)
            var wrapper = ds_map_create()
            var t_quest = ini_read_string("room", "quest", "-1")
            var t_upopen = ini_read_string("room", "upopen", "0")
            var t_downopen = ini_read_string("room", "downopen", "0")
            var t_leftopen = ini_read_string("room", "leftopen", "0")
            var t_rightopen = ini_read_string("room", "rightopen", "0")
            ds_map_add(wrapper, "quest", t_quest)
            ds_map_add(wrapper, "upopen", t_upopen)
            ds_map_add(wrapper, "downopen", t_downopen)
            ds_map_add(wrapper, "leftopen", t_leftopen)
            ds_map_add(wrapper, "rightopen", t_rightopen)
            var inst_cur = 0
            while ini_section_exists("inst" + string(inst_cur))
            {
                var t_obj = ini_read_string(("inst" + string(inst_cur)), "obj", "obj_wall")
                var t_layer = ini_read_string(("inst" + string(inst_cur)), "layer", "player")
                var t_image_xscale = ini_read_string(("inst" + string(inst_cur)), "image_xscale", "1")
                var t_image_yscale = ini_read_string(("inst" + string(inst_cur)), "image_yscale", "1")
                var t_direction = ini_read_string(("inst" + string(inst_cur)), "direction", "0")
                var t_image_angle = ini_read_string(("inst" + string(inst_cur)), "image_angle", "0")
                var t_id = ini_read_string(("inst" + string(inst_cur)), "id", "0")
                var t_x = ini_read_string(("inst" + string(inst_cur)), "x", "0")
                var t_y = ini_read_string(("inst" + string(inst_cur)), "y", "0")
                var t_i = ini_read_string(("inst" + string(inst_cur)), "i", "0")
                var t_j = ini_read_string(("inst" + string(inst_cur)), "j", "0")
                var _wrapper = ds_map_create()
                ds_map_add(_wrapper, "obj", t_obj)
                ds_map_add(_wrapper, "layer", t_layer)
                ds_map_add(_wrapper, "image_xscale", t_image_xscale)
                ds_map_add(_wrapper, "image_yscale", t_image_yscale)
                ds_map_add(_wrapper, "direction", t_direction)
                ds_map_add(_wrapper, "image_angle", t_image_angle)
                ds_map_add(_wrapper, "id", t_id)
                ds_map_add(_wrapper, "x", t_x)
                ds_map_add(_wrapper, "y", t_y)
                ds_map_add(_wrapper, "i", t_i)
                ds_map_add(_wrapper, "j", t_j)
                var meth = 0
                while ini_key_exists(("inst" + string(inst_cur)), ("method" + string(meth)))
                {
                    var tmeth = ini_read_string(("inst" + string(inst_cur)), ("method" + string(meth)), "scr_none")
                    ds_map_add(_wrapper, ("method" + string(meth)), tmeth)
                    meth++
                }
                var t_str = json_encode(_wrapper)
                ds_map_destroy(_wrapper)
                ds_map_add(wrapper, ("inst" + string(inst_cur)), t_str)
                inst_cur++
            }
            ini_close()
            var fname = roomnumber + ".rm"
            save_wrapper_to_file(fname, wrapper)
        }
    }
}
