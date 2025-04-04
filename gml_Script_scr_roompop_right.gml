var rpush = argument1
rpush += 304
var room_num_x = round(real(string_copy(argument0, 1, 2)))
room_num_x++
var s_room_num_y = string_copy(argument0, 3, 2)
var s_room_num_x = string(room_num_x)
if (string_length(s_room_num_x) < 2)
    s_room_num_x = "0" + s_room_num_x
if instance_exists(obj_camera)
{
    with (obj_camera)
        obj_camera.xmax += 304
}
scr_roompop((s_room_num_x + s_room_num_y), rpush, 0)
if (t_rightopen != "0")
    scr_roompop_right((s_room_num_x + s_room_num_y), rpush)
