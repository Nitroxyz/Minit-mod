var room_num_name = ""
room_num_x = string(argument0)
room_num_y = string(argument1)
if (string_length(room_num_x) < 2)
    room_num_x = "0" + room_num_x
if (string_length(room_num_y) < 2)
    room_num_y = "0" + room_num_y
room_num_name = room_num_x + room_num_y
return room_num_name;
