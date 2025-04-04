animate_actor()
if (blow && default_state)
{
    if (!audio_is_playing(snd_ventwhoosh))
        audio_play_sound(snd_ventwhoosh, 100, true)
    if instance_exists(obj_player)
    {
        switch image_angle
        {
            case 0:
                if (obj_player.x > x && place_meeting(obj_player.x, y, obj_player))
                    obj_player.hspd += clamp(((x + 64 - obj_player.x) / 32), 0, 1)
                break
            case 90:
                if (obj_player.y < y && place_meeting(x, obj_player.y, obj_player))
                {
                    obj_player.vspd -= clamp(((obj_player.y - (y - 88)) / 32), 0, 1)
                    with (obj_player)
                    {
                        vspd = max(vspd, (-jumpspeed))
                        if (move_state == 67 && vspd > 0)
                            move_state = 66
                    }
                }
                break
            case 180:
                if (obj_player.x < x && place_meeting(obj_player.x, y, obj_player))
                    obj_player.hspd -= clamp(((obj_player.x - (x - 64)) / 32), 0, 1)
                break
            case 270:
                if (obj_player.y > y && place_meeting(x, obj_player.y, obj_player))
                    obj_player.vspd += clamp(((y + 64 - obj_player.y) / 32), 0, 1)
                with (obj_player)
                    vspd = min(vspd, 8)
                break
        }

    }
    if (blowtimer > 0)
    {
        if ((blowtimer % 5) == 0 && irandom(3) == 0)
        {
            blowtimer = blowtimer_max
            var t = instance_create(x, y, obj_steam_cloud)
            t.hspd = 2 * cos(degtorad(image_angle))
            t.vspd = -2 * sin(degtorad(image_angle))
        }
        blowtimer--
    }
    else
    {
        blowtimer = blowtimer_max
        t = instance_create(x, y, obj_steam_cloud)
        t.hspd = 2 * cos(degtorad(image_angle))
        t.vspd = -2 * sin(degtorad(image_angle))
    }
}
