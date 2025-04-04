if instance_exists(obj_info_console_button)
    button = instance_find(obj_info_console_button, 0)
if (enterOnly == 0)
{
    if (obj_player.y > y && place_meeting(x, obj_player.y, obj_player))
    {
        while (obj_player.y > y || place_meeting(x, y, obj_player))
            y++
        player_auto()
        running = 1
        if (obj_player.vehicle == 1)
            obj_player.move_state = 65
        else if (obj_player.vehicle == 0)
            obj_player.move_state = 69
        if (!audio_is_playing(Elevator))
            audio_play_sound(Elevator, 100, true)
        state = 6
    }
    else
        state = 1
}
else
{
    ceiling_exit = 0
    with (obj_switch_room)
    {
        if (dir == 90)
            y -= 1000
    }
    if (obj_player.y < y && place_meeting(x, obj_player.y, obj_player))
    {
        running = 1
        obj_camera.center = 0
        while (!(place_meeting(x, (y - 2), obj_player)))
            y--
        player_auto()
        if (obj_player.vehicle == 1)
            obj_player.move_state = 65
        else if (obj_player.vehicle == 0)
            obj_player.move_state = 69
        state = 1
        if (!audio_is_playing(Elevator))
            audio_play_sound(Elevator, 100, true)
    }
    else
    {
        while place_meeting(x, y, obj_wall)
            y--
        state = 4
        if audio_is_playing(Elevator)
            audio_stop_sound(Elevator)
    }
}
