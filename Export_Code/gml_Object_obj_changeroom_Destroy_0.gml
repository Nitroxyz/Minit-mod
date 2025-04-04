sprite_index = spr_wall
sprite_delete(old_room)
if instance_exists(obj_camera)
{
    obj_camera.active = 1
    obj_camera.x = -2
    obj_camera.y = -2
}
if instance_exists(obj_player)
{
    with (obj_player)
    {
        if place_meeting(x, y, obj_wall)
        {
            if (!(place_meeting((x - hspd), y, obj_wall)))
            {
                while place_meeting(x, y, obj_wall)
                    x -= sign(hspd)
            }
        }
    }
}
GAME_MANAGER.state = 15
