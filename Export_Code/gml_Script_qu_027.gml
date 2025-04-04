switch state_step
{
    case 0:
        qu_wait(1)
        obj_counter = 0
        break
    case 1:
        music_duck(1, 0)
        music_xfade(mu_elevator_fight, 0)
        qu_set_dialogmode()
        player_auto()
        qu_wait(1)
        global.elevator_fight_room = get_room_id(270, 1)
        break
    case 2:
        process_loop_lab_elevator(128, 128)
        with (obj_trashcan)
        {
            var t = instance_create(x, (y + 6), obj_wall3)
            t.visible = false
            t = instance_create(x, (y + 6 - 16), obj_wall3)
            t.visible = false
            t = instance_create(x, (y + 6 - 32), obj_wall3)
            t.visible = false
        }
        hud_text_set(20, 356, 0)
        qu_wait(1)
        break
    case 3:
        process_loop_lab_elevator(128, 128)
        if qu_trigger()
        {
            player_play()
            hud_text_reset()
            state_step++
            step_timer = 80
        }
        break
    case 4:
        process_loop_lab_elevator(128, 128)
        if (step_timer > 0)
            step_timer--
        else if (obj_counter == 0 || (obj_counter % 3) != 0)
        {
            if (!instance_exists(obj_frog))
            {
                obj_counter++
                var voidpos = irandom(7)
                for (var i = 0; i < 8; i++)
                {
                    if (i != voidpos)
                    {
                        t = instance_create((40 + 32 * i), (obj_camera.y + 12), obj_guardian_bullet)
                        var cloud = instance_create(t.x, t.y, obj_hidecloud)
                        cloud.parent = t.id
                        with (t)
                        {
                            vspd = 2
                            init_state = state
                            state = 2
                        }
                    }
                }
                step_timer = 80
            }
            else
                step_timer = 30
        }
        else
        {
            step_timer = 1
            qu_wait(1)
        }
        break
    case 5:
        process_loop_lab_elevator(128, 128)
        if (step_timer > 0)
            step_timer--
        else if (!instance_exists(obj_frog))
        {
            if (obj_counter < 10)
            {
                state_step--
                obj_counter++
            }
            else
            {
                step_timer = 80
                qu_wait(1)
                global.elevator_fight_room = get_room_id(270, 1, global.elevator_fight_room)
            }
            voidpos = irandom(6)
            for (i = 0; i < 7; i++)
            {
                if (i != voidpos)
                {
                    t = instance_create((56 + 32 * i), (obj_camera.y + 12), obj_frog)
                    cloud = instance_create(t.x, t.y, obj_hidecloud)
                    cloud.parent = t.id
                }
            }
            with (obj_frog)
            {
                init_state = 322
                state = 2
            }
            step_timer = 160
        }
        else
            step_timer = 30
        break
    case 6:
        process_loop_lab_elevator(128, 128)
        if (step_timer > 0)
            step_timer--
        else if (instance_number(obj_drone) == 0)
        {
            obj_counter++
            if (obj_counter < 16)
            {
                t = instance_create(88, (obj_camera.y + 12), obj_drone)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                t = instance_create(216, (obj_camera.y + 12), obj_drone)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                with (obj_drone)
                {
                    no_screen_exit = 1
                    process_drone_piss_off()
                    init_state = state
                    state = 2
                }
                step_timer = 160
            }
            else
            {
                step_timer = 20
                qu_wait(1)
            }
        }
        else
            step_timer = 30
        break
    case 7:
        process_loop_lab_elevator(128, 128)
        if (step_timer > 0)
            step_timer--
        else if (instance_number(obj_drone) == 0)
        {
            obj_counter++
            if (obj_counter < 18)
            {
                t = instance_create(152, (obj_camera.y + 12), obj_drone)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                t = instance_create(72, (obj_camera.y + 12), obj_drone)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                t = instance_create(232, (obj_camera.y + 12), obj_drone)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                with (obj_drone)
                {
                    no_screen_exit = 1
                    process_drone_piss_off()
                    init_state = state
                    state = 2
                }
                step_timer = 160
            }
            else
            {
                step_timer = 20
                qu_wait(1)
                global.elevator_fight_room = get_room_id(270, 1, global.elevator_fight_room)
            }
        }
        else
            step_timer = 30
        break
    case 8:
        process_loop_lab_elevator(128, 128)
        if (step_timer > 0)
            step_timer--
        else if (obj_counter < 20)
        {
            if (!instance_exists(obj_drone))
            {
                obj_counter++
                t = instance_create(152, (obj_camera.y + 12), obj_drone)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                with (obj_drone)
                {
                    no_screen_exit = 1
                    enemy_bounce = 0
                    process_drone_piss_off()
                    init_state = state
                    state = 2
                }
            }
            var x_proj = 48
            if instance_exists(obj_player)
            {
                if (obj_player.x < 150)
                    x_proj = 256
            }
            for (i = 0; i < 5; i++)
            {
                t = instance_create(x_proj, (obj_camera.y + 14 + 32 * i), obj_guardian_bullet_h)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                with (t)
                {
                    destroyontouch = 0
                    hspd *= sign(150 - x_proj)
                    init_state = state
                    state = 2
                }
            }
            step_timer = 150
        }
        else
        {
            qu_wait(1)
            global.elevator_fight_room = get_room_id(270, 1, global.elevator_fight_room)
        }
        break
    case 9:
        process_loop_lab_elevator(128, 128)
        if (step_timer > 0)
            step_timer--
        else if (obj_counter < 24)
        {
            if (!instance_exists(obj_carrybot))
            {
                obj_counter++
                t = instance_create(152, (obj_camera.y + 12), obj_carrybot)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                with (obj_carrybot)
                {
                    init_state = state
                    state = 2
                    holdingObject = obj_frog
                    holdingSprite = object_get_sprite(holdingObject)
                }
            }
            x_proj = 48
            if instance_exists(obj_player)
            {
                if (obj_player.x < 150)
                    x_proj = 256
            }
            for (i = 0; i < 5; i++)
            {
                t = instance_create(x_proj, (obj_camera.y + 14 + 32 * i), obj_guardian_bullet_h)
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                with (t)
                {
                    destroyontouch = 0
                    hspd *= sign(150 - x_proj)
                    init_state = state
                    state = 2
                }
            }
            step_timer = 150
        }
        else
        {
            qu_wait(1)
            global.elevator_fight_room = get_room_id(270, 1, global.elevator_fight_room)
        }
        break
    case 10:
        process_loop_lab_elevator(1024, 640)
        if (step_timer > 0)
            step_timer--
        else if (obj_counter < 32)
        {
            if (instance_number(obj_enemy) < 5)
            {
                obj_counter++
                t = instance_create((60 + 8 * irandom(23)), (obj_camera.y + 12), choose(251, 250, 275))
                cloud = instance_create(t.x, t.y, obj_hidecloud)
                cloud.parent = t.id
                with (t)
                {
                    if (object_index == obj_frog)
                    {
                        init_state = 322
                        state = 2
                    }
                    else if (object_index == obj_drone)
                    {
                        no_screen_exit = 1
                        process_drone_piss_off()
                        init_state = state
                        state = 2
                    }
                    else if (object_index == obj_carrybot)
                    {
                        init_state = state
                        state = 2
                        holdingObject = obj_frog
                        holdingSprite = object_get_sprite(holdingObject)
                    }
                    else
                        event_perform(ev_other, ev_room_start)
                }
                step_timer = 120
            }
            else
                step_timer = 30
        }
        else if (!instance_exists(obj_enemy))
        {
            step_timer = 1
            qu_wait(1)
            global.elevator_fight_room = get_room_id(270, 1, global.elevator_fight_room)
            set_room_state(0)
            music_xfade(MUSIC_MANAGER.current_main_theme, 1000)
        }
        else
        {
            with (obj_enemy)
            {
                if (!(is_within_view(x, y, 0, 12)))
                    instance_destroy()
            }
        }
        break
    case 11:
        if instance_exists(obj_demo_end_elevator_big)
        {
            if (obj_demo_end_elevator_big.state == 4)
            {
                player_play()
                qu_reset()
            }
        }
        break
}

