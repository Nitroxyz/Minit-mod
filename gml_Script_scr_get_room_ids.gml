var room_center = global.current_room
rooms = -1
rooms[0] = room_center
var xmin = obj_camera.xmin
var xmax = obj_camera.xmax
var ymin = obj_camera.ymin
var ymax = obj_camera.ymax
while (xmin < -3)
{
    room_center = get_room_id(180, 1, room_center)
    rooms[array_length_1d(rooms)] = room_center
    xmin += 304
}
room_center = global.current_room
while (xmax > 0)
{
    room_center = get_room_id(0, 1, room_center)
    rooms[array_length_1d(rooms)] = room_center
    xmax -= 304
}
room_center = global.current_room
while (ymin < -3)
{
    room_center = get_room_id(90, 1, room_center)
    rooms[array_length_1d(rooms)] = room_center
    ymin += 192
}
room_center = global.current_room
while (ymax > 0)
{
    room_center = get_room_id(270, 1, room_center)
    rooms[array_length_1d(rooms)] = room_center
    ymax -= 192
}
