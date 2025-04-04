if (!in_water)
{
    if ((!dashing) && place_meeting(x, y, WATER))
    {
        switch vehicle
        {
            case 0:
                player_start_swim()
                break
            case 1:
                var _w = instance_nearest(x, y, WATER)
                var _d = point_direction(_w.x, _w.y, x, y)
                player_take_hazard_damage(_d)
                if place_meeting(x, (y - 10), obj_wall)
                {
                    if (!(place_meeting((x + 8), (y - 10), obj_wall)))
                    {
                        while place_meeting(x, (y - 10), obj_wall)
                            x++
                    }
                    else if (!(place_meeting((x - 8), (y - 10), obj_wall)))
                    {
                        while place_meeting(x, (y - 10), obj_wall)
                            x--
                    }
                }
                if (move_state == 67)
                    alarm[6] = 10
                break
            case 2:
                instance_create(x, y, obj_splash)
                audio_stop_sound(Splash)
                var sfx = audio_play_sound(Splash, 100, false)
                audio_sound_pitch(sfx, random_range(0.8, 0.9))
                in_water = 1
                move_state = 79
                break
        }

    }
}
else if (!(place_meeting(x, y, WATER)))
{
    switch vehicle
    {
        case 0:
            break
        case 1:
            break
        case 2:
            vspd += lengthdir_y(0.5, point_direction(0, 0, hspd, vspd))
            hspd += lengthdir_x(0.5, point_direction(0, 0, hspd, vspd))
            audio_play_sound(Splash, 100, false)
            instance_create(x, y, obj_splash)
            move_state = 80
            break
        default:

    }

    in_water = 0
}
