var room_num = room_get_name(room)
var room_num_x = round(real(string_copy(room_num, 3, 2)))
room_num_x = string(room_num_x)
if (string_length(room_num_x) < 2)
    room_num_x = "0" + room_num_x
return room_num_x;
