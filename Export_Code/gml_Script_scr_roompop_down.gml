var dpush = argument1
dpush += 192
var room_num_y = round(real(string_copy(argument0, 3, 2)))
room_num_y++
var s_room_num_x = string_copy(argument0, 1, 2)
var s_room_num_y = string(room_num_y)
if (string_length(s_room_num_y) < 2)
    s_room_num_y = "0" + s_room_num_y
if instance_exists(obj_camera)
{
    with (obj_camera)
        obj_camera.ymax += 192
}
scr_roompop((s_room_num_x + s_room_num_y), 0, dpush)
if (t_downopen != "0")
    scr_roompop_down((s_room_num_x + s_room_num_y), dpush)
