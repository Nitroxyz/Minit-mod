instance_create(((__view_get(2, 0)) / 2), ((__view_get(3, 0)) - 16), obj_mouse)
with (obj_mouse)
{
    image_speed = 0.1
    image_xscale = -1
    while place_meeting(x, y, obj_wall)
        y--
}
with (obj_door_auto_U)
    unhide_event = 628
with (obj_wall)
{
    if (object_index != obj_bridgenode)
        depth = other.depth - 1
}
