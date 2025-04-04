switch state
{
    case 0:
        if place_meeting(x, y, obj_player)
        {
            qu_set_dialogmode()
            obj_player.move_state = 2
            obj_player.control_state = 2
            obj_player.shoot_state = 2
            obj_player.collision_state = 2
            obj_player.visible = false
            if instance_exists(obj_gun)
                obj_gun.visible = false
            state = 1
            hspd = 0
            vspd = -0.5
            obj_camera.active = 0
            enginesound = audio_play_sound(snd_escapepod_engine, 100, true)
            garypod_enginesound_mod()
            music_duck(0, 1000)
        }
        else
        {
            y = ystart + (round(3 * sin(angle)))
            angle += angle_speed
        }
        break
    case 1:
        x += hspd
        y = max((y + vspd), (ystart - 48))
        vspd = approach(vspd, 0, 0.025)
        if (vspd > -0.1)
        {
            hspd = approach(hspd, 60, 0.2)
            image_angle = (darctan2((-vspd), hspd)) + (random_range(-4, 4))
            if (image_angle < 10 || (image_angle % 360) > 350)
            {
                if (pooftimer > 0)
                    pooftimer--
                else
                {
                    pooftimer = clamp((8 - hspd / 4), 2, 8)
                    var tsnd = audio_play_sound(snd_escapepod_poof, 100, false)
                    audio_sound_gain(tsnd, ((random_range(0.3, 0.6)) * global.SOUND_MASTER_GAIN), 0)
                    var t = instance_create((x - dcos(image_angle) * 38 + dsin(image_angle) * -6), (y + dsin(image_angle) * 38 + dcos(image_angle) * -6), obj_steam_cloud)
                    t.hspd = -0.5 * dcos(image_angle)
                    t.vspd = -0.5 * dsin(image_angle) + (random_range(0.2, 1.2))
                    t.depth = depth + 1
                    if (!irandom(3))
                        t.depth = depth - 1
                    t = instance_create((x - dcos(image_angle) * 38 + dsin(image_angle) * 6), (y + dsin(image_angle) * 38 + dcos(image_angle) * 6), obj_steam_cloud)
                    t.hspd = -0.5 * dcos(image_angle)
                    t.vspd = -0.5 * dsin(image_angle) + (random_range(0.2, 1.2))
                    t.depth = depth + 1
                    if (!irandom(3))
                        t.depth = depth - 1
                }
            }
        }
        else
        {
            vspd -= 0.0225
            image_angle = random_range(89, 91)
            if (pooftimer > 0)
                pooftimer--
            else
            {
                pooftimer = 8
                tsnd = audio_play_sound(snd_escapepod_poof, 100, false)
                audio_sound_gain(tsnd, ((random_range(0.3, 0.6)) * global.SOUND_MASTER_GAIN), 0)
                t = instance_create((x + (choose(-6, 6))), (y + 38), obj_steam_cloud)
                t.hspd = 0
                t.depth = depth + 1
                if (!irandom(3))
                    t.depth = depth - 1
            }
        }
        garypod_enginesound_mod()
        if (x > (obj_camera.xmax + 360))
        {
            var ttt = instance_create(0, 0, obj_game_restart_fade)
            ttt.state = 1
            ttt.room_target = 5
            state = 2
            audio_sound_gain(enginesound, 0, 1000)
            achievement_set("ACH_COMPLETE")
            if (global.items_collected == 32)
                achievement_set("ACH_100PCT")
            if (global.max_hp == 6)
                achievement_set("ACH_DANGER")
            if (global.playtime < 3600)
                achievement_set("ACH_SPEEDRUN")
            save_savefile_endgame()
        }
        else if (obj_camera.x < obj_camera.xmax && x > (obj_camera.x + offset))
        {
            offset += 0.6
            obj_camera.x = min((x - offset), obj_camera.xmax)
            __view_set(0, 0, obj_camera.x)
            __view_set(1, 0, (obj_camera.y + (choose(-1, 1, 0))))
        }
        break
}

