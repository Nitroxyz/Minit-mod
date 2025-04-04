event_inherited()
if running
    animate_actor()
if (button != self)
{
    if button.pressed
    {
        var pc_flag = 1
        if (instance_exists(obj_main_console) && global.lab_unlocked == 0)
            pc_flag = 0
        if pc_flag
        {
            running = (!running)
            shake_screen(5)
            if running
            {
                if (!audio_is_playing(Elevator))
                    audio_play_sound(Elevator, 100, true)
            }
            else if audio_is_playing(Elevator)
                audio_stop_sound(Elevator)
        }
    }
}
if (enterOnly == 0)
{
    switch state
    {
        case 0:
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
            break
        case 1:
            if running
            {
                if (place_meeting(x, (y - 1), obj_player) && (obj_player.vehicle == 1 || global.elevator_maptarget == "map4" || MAP_MANAGER.map_current == "map4"))
                {
                    if (abs(obj_player.x - (x + 32)) < 24 && abs(obj_player.hspd) < 1)
                    {
                        player_auto()
                        state = 2
                        with (obj_switch_room)
                        {
                            if (dir == 270)
                            {
                                target_map = other.targetMap
                                target_room_override = other.targetRoom
                            }
                        }
                    }
                }
            }
            break
        case 2:
            state = 3
            if (!audio_is_playing(Elevator))
                audio_play_sound(Elevator, 100, true)
            break
        case 3:
            obj_player.y++
            y++
            process_try_center_camera()
            var t_flag = 0
            var t_switch = self
            with (obj_player)
            {
                if place_meeting(x, y, obj_switch_room)
                {
                    t_switch = instance_place(x, y, obj_switch_room)
                    t_switch.allow_player_auto = 1
                }
            }
            if (t_switch != self)
            {
                with (t_switch)
                    event_perform(ev_other, ev_user15)
            }
            break
        case 6:
            if (y != ystart)
            {
                if (obj_player.control_state != 88)
                {
                    player_auto()
                    obj_player.image_speed = obj_player.default_image_speed
                    if (obj_player.vehicle == 1)
                        obj_player.move_state = 65
                    else if (obj_player.vehicle == 0)
                        obj_player.move_state = 69
                }
                obj_player.y--
                y--
                process_try_center_camera()
            }
            else
            {
                with (obj_player)
                    player_auto_end()
                running = 0
                obj_camera.center = 1
                state = 7
                iindex = 0
                if audio_is_playing(Elevator)
                    audio_stop_sound(Elevator)
                audio_play_sound(snd_stop_elevator, 5, false)
                shake_screen(20)
                save_savefile()
            }
            break
        case 7:
            if (!(place_meeting(x, (y - 1), obj_player)))
            {
                if (reset_timer > 0)
                    reset_timer--
                else
                    state = 1
            }
            else
                reset_timer = reset_timer_max
            break
    }

}
else
{
    if ((!ceiling_exit) && instance_exists(obj_player))
        obj_player.y = max(obj_camera.ymin, obj_player.y)
    switch state
    {
        case 0:
            if (obj_player.y < y && place_meeting(x, obj_player.y, obj_player))
            {
                running = 1
                obj_camera.center = 0
                while (!(place_meeting(x, y, obj_player)))
                    y--
                player_auto()
                if (obj_player.vehicle == 1)
                    obj_player.move_state = 65
                else if (obj_player.vehicle == 0)
                    obj_player.move_state = 69
                y++
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
            break
        case 1:
            state = 2
            if (!audio_is_playing(Elevator))
                audio_play_sound(Elevator, 100, true)
            break
        case 2:
            if (!(place_meeting(x, (y + 1), obj_wall)))
            {
                if (obj_player.control_state != 88)
                {
                    player_auto()
                    obj_player.image_speed = obj_player.default_image_speed
                    if (obj_player.vehicle == 1)
                        obj_player.move_state = 65
                    else if (obj_player.vehicle == 0)
                        obj_player.move_state = 69
                }
                obj_player.y++
                y++
                process_try_center_camera()
            }
            else
            {
                with (obj_player)
                    player_auto_end()
                obj_camera.center = 1
                state = 4
                running = 0
                iindex = 0
                if audio_is_playing(Elevator)
                    audio_stop_sound(Elevator)
                audio_play_sound(snd_stop_elevator, 5, false)
                shake_screen(20)
                save_savefile()
            }
            break
        case 4:
            if (!(place_meeting(x, (y - 1), obj_player)))
            {
                if (reset_timer > 0)
                    reset_timer--
                else
                    state = 5
            }
            else
                reset_timer = reset_timer_max
            break
        case 5:
            if running
            {
                if (place_meeting(x, (y - 1), obj_player) && (obj_player.vehicle == 1 || global.elevator_maptarget == "map4" || MAP_MANAGER.map_current == "map4"))
                {
                    if (abs(obj_player.x - (x + 32)) < 24 && abs(obj_player.hspd) < 1)
                    {
                        player_auto()
                        state = 6
                        ceiling_exit = 1
                        with (obj_switch_room)
                        {
                            if (dir == 90)
                            {
                                y = ystart
                                target_map = other.targetMap
                                target_room_override = other.targetRoom
                            }
                        }
                    }
                }
            }
            break
        case 6:
            state = 7
            if (!audio_is_playing(Elevator))
                audio_play_sound(Elevator, 100, false)
            break
        case 7:
            obj_player.y--
            y--
            process_try_center_camera()
            t_flag = 0
            t_switch = self
            with (obj_player)
            {
                if place_meeting(x, y, obj_switch_room)
                {
                    t_switch = instance_place(x, y, obj_switch_room)
                    t_switch.allow_player_auto = 1
                }
            }
            if (t_switch != self)
            {
                with (t_switch)
                    event_perform(ev_other, ev_user15)
            }
            break
    }

}
