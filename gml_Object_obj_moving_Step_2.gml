event_inherited()
switch state
{
    case 0:
        if place_meeting(x, (y - 1), obj_player)
        {
            image_speed = 0.4
            obj_player.plat_id = id
            obj_player.p_type = object_index
            obj_player.p_x = x
            state = 1
            alarm[0] = 1
        }
        break
    case 1:
        break
    case 2:
        flag = 0
        if place_meeting(x, (y - 1), obj_player)
        {
            with (obj_player)
            {
                if place_meeting(x, (y - 2), obj_wall)
                    other.flag = 1
            }
            if (flag == 0 && y > min_y)
            {
                image_speed = 0.05
                y--
                obj_player.y--
            }
        }
        else
        {
            if instance_exists(obj_player)
            {
                obj_player.plat_id = -1
                obj_player.p_type = -1
                obj_player.p_x = -1
            }
            state = 3
            alarm[0] = 30
        }
        break
    case 3:
        if place_meeting(x, (y - 1), obj_player)
        {
            state = 1
            image_speed = 0.4
            alarm[0] = 6
            obj_player.plat_id = id
            obj_player.p_type = object_index
            obj_player.p_x = x
        }
        break
    case 4:
        if place_meeting(x, (y - 1), obj_player)
        {
            state = 1
            alarm[0] = 1
            obj_player.plat_id = id
            obj_player.p_type = object_index
            obj_player.p_x = x
        }
        else if (y < ystart)
        {
            if (!(place_meeting(x, (y + 1), obj_player)))
                y++
        }
        else
        {
            state = 0
            backer.visible = false
        }
        break
}

if (y != yprevious)
{
    if (!audio_is_playing(evnoise))
        evnoise = audio_play_sound(Elevator, 100, true)
}
else if audio_is_playing(evnoise)
    audio_stop_sound(evnoise)
