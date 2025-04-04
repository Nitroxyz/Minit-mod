var room_num = room_get_name(room)
var room_num_y = round(real(string_copy(room_num, 5, 2)))
room_num_y = string(room_num_y)
if (string_length(room_num_y) < 2)
    room_num_y = "0" + room_num_y
return room_num_y;
