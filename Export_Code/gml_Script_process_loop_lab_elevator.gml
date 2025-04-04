var loop_position = 1024
var loop_distance = 1024
if (argument_count > 0)
    loop_position = argument[0]
if (argument_count > 1)
    loop_distance = argument[1]
if instance_exists(obj_demo_end_elevator_big)
{
    if (obj_camera.y > (obj_camera.ymin + loop_position))
    {
        obj_demo_end_elevator_big.y -= loop_distance
        obj_player.y -= loop_distance
        process_try_center_camera_targeted(obj_demo_end_elevator_big)
        with (ACTOR)
        {
            if (object_index != obj_player && object_index != obj_trashcan && (!(object_is_ancestor(object_index, obj_wall))))
                y -= loop_distance
        }
    }
    with (ACTOR)
    {
        if (object_index != obj_player && object_index != obj_trashcan && (!(object_is_ancestor(object_index, obj_wall))))
            y++
    }
    obj_player.y = max(obj_player.y, obj_camera.y)
}
