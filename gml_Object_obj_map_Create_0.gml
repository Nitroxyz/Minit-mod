image_speed = 0.2
var room_num = global.current_room
room_x = round(real(string_copy(room_num, 3, 2)))
room_y = round(real(string_copy(room_num, 5, 2)))
map_h = array_length_2d(global.room_state, 0)
map_w = array_height_2d(global.room_state)
boss_hudx = (__view_get(2, 0)) / 2 - 60
boss_hudy = -1
if instance_exists(obj_boss1)
{
    boss_mode = 1
    boss_target = obj_boss1.id
}
else
{
    boss_mode = 0
    boss_target = -1
}
