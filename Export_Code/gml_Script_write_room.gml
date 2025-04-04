if file_exists(write_dir + "\\" + room_get_name(argument0) + ".ini")
    file_delete(write_dir + "\\" + room_get_name(argument0) + ".ini")
ini_open(write_dir + "\\" + room_get_name(argument0) + ".ini")
map_id = string_copy(room_get_name(argument0), 0, 2)
room_x = string_copy(room_get_name(argument0), 2, 2)
room_y = string_copy(room_get_name(argument0), 4, 2)
ini_write_string("Room Data", "map_id", map_id)
ini_write_string("Room Data", "room_x", room_x)
ini_write_string("Room Data", "room_y", room_y)
inst_cur = 0
with (all)
{
    if (id != other.id && object_get_name(id) != "obj_switch_room")
    {
        ini_write_string(("inst" + string(other.inst_cur)), "obj", string(object_index))
        ini_write_string(("inst" + string(other.inst_cur)), "id", string(id))
        ini_write_string(("inst" + string(other.inst_cur)), "x", string(x))
        ini_write_string(("inst" + string(other.inst_cur)), "y", string(y))
        ini_write_string(("inst" + string(other.inst_cur)), "image_xscale", string(image_xscale))
        ini_write_string(("inst" + string(other.inst_cur)), "image_yscale", string(image_yscale))
        ini_write_string(("inst" + string(other.inst_cur)), "direction", string(direction))
        ini_write_string(("inst" + string(other.inst_cur)), "image_angle", string(image_angle))
        var meth = 0
        for (meth = 1; meth < array_length_1d(method); meth++)
        {
            ini_write_string(("inst" + string(other.inst_cur)), ("method" + (string(meth - 1))), method[meth])
            if (meth < array_length_1d(arguments))
                ini_write_string(("inst" + string(other.inst_cur)), ("argument" + (string(meth - 1))), arguments[meth])
        }
        other.inst_cur++
        instance_destroy()
    }
}
ini_close()
