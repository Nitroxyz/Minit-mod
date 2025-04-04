if instance_exists(obj_demo_end_elevator)
{
    if (obj_camera.y > (obj_camera.ymin + 128))
    {
        obj_demo_end_elevator.y -= 128
        obj_player.y -= 128
        process_try_center_camera()
    }
}
