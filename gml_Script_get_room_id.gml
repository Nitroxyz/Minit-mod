var scale = 1
if (argument_count >= 2)
    scale = argument[1]
var room_num = global.current_room
if (argument_count == 3)
    room_num = argument[2]
var room_num_x = round(real(string_copy(room_num, 1, 2)))
var room_num_y = round(real(string_copy(room_num, 3, 2)))
var room_num_name = ""
switch argument[0]
{
    case 180:
        room_num_x -= scale
        if (room_num_x < 0)
            room_num_x = 0
        break
    case 0:
        room_num_x += scale
        break
    case 90:
        room_num_y -= scale
        if (room_num_y < 0)
            room_num_y = 0
        break
    case 270:
        room_num_y += scale
        break
}

room_num_x = string(room_num_x)
room_num_y = string(room_num_y)
if (string_length(room_num_x) < 2)
    room_num_x = "0" + room_num_x
if (string_length(room_num_y) < 2)
    room_num_y = "0" + room_num_y
room_num_name = room_num_x + room_num_y
return room_num_name;
