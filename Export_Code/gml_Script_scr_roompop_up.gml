var upush = argument1
upush -= 192
var room_num_y = round(real(string_copy(argument0, 3, 2)))
room_num_y--
var s_room_num_x = string_copy(argument0, 1, 2)
var s_room_num_y = string(room_num_y)
if (string_length(s_room_num_y) < 2)
    s_room_num_y = "0" + s_room_num_y
if instance_exists(obj_camera)
{
    with (obj_camera)
        obj_camera.ymin -= 192
}
scr_roompop((s_room_num_x + s_room_num_y), 0, upush)
if (t_upopen != "0")
    scr_roompop_up((s_room_num_x + s_room_num_y), upush)
