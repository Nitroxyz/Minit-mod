image_speed = 0.2
var room_num = room_get_name(room)
room_x = round(real(string_copy(room_num, 3, 2)))
room_y = round(real(string_copy(room_num, 5, 2)))
map_h = array_length_2d(global.room_state, 0)
map_w = array_height_2d(global.room_state)
