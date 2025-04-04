if player_check_timer
{
    player_check_timer--
    if place_meeting(x, y, obj_player)
    {
        while place_meeting(x, y, obj_player)
            obj_player.y--
    }
}
event_inherited()
switch state
{
    case "init":
        if place_meeting(x, (y - 1), obj_player)
        {
            if obj_player.grounded
            {
                state = "contact"
                iindex = 1
                image_speed = 0
                audio_play_sound(snd_savepoint_stepon, 100, false)
            }
        }
        break
    case "contact":
        if (!(place_meeting(x, (y - 1), obj_player)))
        {
            state = "init"
            holdtimer = holdtimermax
            iindex = 0
            image_speed = 0
            audio_play_sound(snd_savepoint_stepoff, 100, false)
        }
        else if ((!obj_player.key_right) && (!obj_player.key_left))
        {
            obj_player.x = approach(obj_player.x, (x + image_xscale * 24), 0.5)
            if (holdtimer > 0)
                holdtimer--
            else
            {
                state = "animate"
                audio_play_sound(SavepointActivate, 100, false)
                with (obj_player)
                    player_auto()
            }
        }
        break
    case "animate":
        if (!(place_meeting(x, (y - 1), obj_player)))
        {
            state = "init"
            holdtimer = holdtimermax
            iindex = 0
            image_speed = 0
            if audio_is_playing(SavepointActivate)
                audio_stop_sound(SavepointActivate)
            audio_play_sound(snd_savepoint_stepoff, 100, false)
            player_play()
        }
        else
        {
            obj_player.x = approach(obj_player.x, (x + image_xscale * 24), 0.5)
            iindex = approach(iindex, (image_number - 1), 0.4)
            if (abs(image_number - 1 - iindex) < 0.4)
                event_perform(ev_alarm, 0)
        }
        break
    case "save":
        iindex = 1
        image_speed = 0
        catmood_update(2, 60)
        state = "savenotification"
        saved = 1
        scr_flash(0.4, 4)
        break
    case "savenotification":
        state = "saved"
        if (obj_controller.state != 228)
        {
            if mini
            {
                if (obj_player.vehicle == 1)
                {
                    obj_player.move_state = 65
                    obj_player.shoot_state = 84
                    UI_entermech()
                }
                else
                {
                    obj_player.move_state = 69
                    obj_player.shoot_state = 2
                }
            }
            else
            {
                obj_player.vehicle = 1
                obj_player.move_state = 65
                obj_player.shoot_state = 84
                UI_entermech()
            }
            player_play()
        }
        else
        {
            obj_player.move_state = 65
            obj_player.shoot_state = 84
            UI_entermech()
            player_play()
            player_auto()
        }
        global.hassuit = "yes"
        break
    case "saved":
        saved = 1
        if (!(place_meeting(x, (y - 1), obj_player)))
        {
            audio_play_sound(snd_savepoint_stepoff, 100, false)
            state = "init"
            holdtimer = holdtimermax
            iindex = 0
        }
        break
}

animate_actor()
