if place_meeting(x, (y + 1), obj_wall)
    surf = instance_place(x, (y + 1), obj_wall)
else if place_meeting(x, (y - 1), obj_wall)
    surf = instance_place(x, (y - 1), obj_wall)
else if place_meeting((x + 1), y, obj_wall)
    surf = instance_place((x + 1), y, obj_wall)
else if place_meeting((x - 1), y, obj_wall)
    surf = instance_place((x - 1), y, obj_wall)
else
{
    c_destroy = 1
    instance_destroy()
}
