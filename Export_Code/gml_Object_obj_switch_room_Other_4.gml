if (flag1 == 1)
    return;
var cur_x = x
var cur_y = y
if (x < 0 && image_xscale == 1)
    dir = 180
else if (x > __view_get(2, 0))
    dir = 0
else if (y < 0 && image_yscale == 1)
    dir = 90
else if (y > __view_get(3, 0))
    dir = 270
target_room = get_room_id(dir)
