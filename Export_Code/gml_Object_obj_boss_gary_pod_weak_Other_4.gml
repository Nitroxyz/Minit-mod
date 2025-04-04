pod.visible = true
instance_create(((__view_get(2, 0)) - 64), ((__view_get(3, 0)) - 16), obj_mouse)
with (obj_mouse)
{
    image_speed = 0.1
    image_xscale = -1
    while place_meeting(x, y, obj_wall)
        y--
    depth = 8
}
with (obj_door_auto_U)
    unhide_event = 280
