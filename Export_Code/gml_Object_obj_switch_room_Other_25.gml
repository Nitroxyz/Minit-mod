if (obj_player.control_state == 87)
{
    if (requirey != 0)
    {
        if (sign(obj_player.vspd) == sign(requirevy))
            flag0 = 1
    }
    else if (requirex != 0)
    {
        if (sign(obj_player.hspd) == sign(requirevx))
            flag0 = 1
    }
    else
        flag0 = 1
}
if allow_player_auto
    flag0 = 1
if flag0
{
    obj_player.collision_state = 2
    screen_offset_x = ((obj_camera.xmax != -2 || obj_camera.xmin != -2) ? floor(((clamp(obj_player.x, obj_camera.xmin, obj_camera.xmax)) + 2) / 304) : 0)
    screen_offset_y = ((obj_camera.ymax != -2 || obj_camera.ymin != -2) ? floor(((clamp(obj_player.y, obj_camera.ymin, obj_camera.ymax)) + 2) / 192) : 0)
    var t_ang = point_direction(0, 0, screen_offset_x, screen_offset_y)
    var t_room = get_room_id(t_ang, abs(screen_offset_x + screen_offset_y))
    if (target_room_override == -1)
        target_room = get_room_id(dir, 1, t_room)
    else
        target_room = target_room_override
    ready = 0
    with (obj_switch_room)
    {
        if (id != other.id)
            instance_destroy()
    }
    if (!roomcenter_flag)
        game_changestate_reposition_camera()
}
