var lpush = argument1
lpush -= 304
var room_num_x = round(real(string_copy(argument0, 1, 2)))
room_num_x--
var s_room_num_y = string_copy(argument0, 3, 2)
var s_room_num_x = string(room_num_x)
if (string_length(s_room_num_x) < 2)
    s_room_num_x = "0" + s_room_num_x
if instance_exists(obj_camera)
{
    with (obj_camera)
        obj_camera.xmin -= 304
}
scr_roompop((s_room_num_x + s_room_num_y), lpush, 0)
if (t_leftopen != "0")
    scr_roompop_left((s_room_num_x + s_room_num_y), lpush)
