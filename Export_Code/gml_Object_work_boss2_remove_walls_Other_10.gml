switch state
{
    case 0:
        if (timer > 0)
            timer--
        else if (instance_exists(obj_shootdoor_dummy) && obj_shootdoor_dummy.visible == true)
        {
            var t2 = instance_find(obj_shootdoor_dummy, 0)
            var t3 = t2.master
            if (shootdoors == self)
            {
                shootdoors[0] = t2
                t2.x = -500
                t2.y = -500
                t2.visible = false
            }
            else
            {
                shootdoors[array_length_1d(shootdoors)] = t2
                t2.x = -500
                t2.y = -500
                t2.visible = false
            }
            if (t3 != self)
            {
                shootdoors[array_length_1d(shootdoors)] = t3
                t3.x = -500
                t3.y = -500
                t3.visible = false
            }
            audio_play_sound(snd_boss2_ShieldNodeDestroy, 5, false)
        }
        else
        {
            var flag = 0
            while ((!(position_meeting(xcur, ycur, obj_wall))) || position_meeting(xcur, ycur, obj_wall2))
            {
                if (xcur < 296)
                    xcur += 8
                else
                {
                    xcur = 8
                    if (ycur > 0)
                        ycur -= 8
                    else
                        flag = 1
                }
            }
            while ((!(position_meeting(xcur2, ycur2, obj_wall))) || position_meeting(xcur2, ycur2, obj_wall2))
            {
                if (xcur2 < 296)
                    xcur2 += 8
                else
                {
                    xcur2 = 8
                    if (ycur2 < 192)
                        ycur2 += 8
                    else
                        flag = 1
                }
            }
            if (position_meeting(xcur, ycur, obj_wall) && (!(position_meeting(xcur, ycur, obj_wall2))))
            {
                var t = instance_position(xcur, ycur, obj_wall)
                if (instances == self)
                    instances[0] = t
                else
                    instances[array_length_1d(instances)] = t
                audio_play_sound(snd_boss2_ShieldNodeDestroy, 5, false)
                instance_create(t.x, t.y, obj_bulimp)
                if (t.x == 296)
                {
                    t.old_sprite = t.sprite_index
                    t.sprite_index = spr_wall2
                    xcur = 8
                    if (ycur > 0)
                    {
                        ycur -= 8
                        flag = 0
                    }
                    else
                        flag = 1
                }
                else
                {
                    t.x = -500
                    t.y = -500
                }
            }
            if (position_meeting(xcur2, ycur2, obj_wall) && (!(position_meeting(xcur2, ycur2, obj_wall2))))
            {
                t = instance_position(xcur2, ycur2, obj_wall)
                if (instances == self)
                    instances[0] = t
                else
                    instances[array_length_1d(instances)] = t
                instance_create(t.x, t.y, obj_bulimp)
                if (t.x == 296)
                {
                    t.old_sprite = t.sprite_index
                    t.sprite_index = spr_wall2
                    xcur2 = 8
                    if (ycur2 < 192)
                    {
                        ycur2 += 8
                        flag = 0
                    }
                    else
                        flag = 1
                }
                else
                {
                    t.x = -500
                    t.y = -500
                }
            }
            if (flag == 1)
                state = 1
            timer = timerstart
        }
        break
    case 1:
        for (var i = 0; i < 21; i++)
        {
            for (var j = 0; j < 14; j++)
            {
                if (i == 0 || i == 20 || j == 0 || j == 13)
                {
                    if (!(position_meeting((i * 16 - 8), (j * 16 - 8), obj_wall)))
                    {
                        if (sidewalls == self)
                            sidewalls[0] = instance_create((i * 16 - 8), (j * 16 - 8), obj_wall)
                        else
                            sidewalls[array_length_1d(sidewalls)] = instance_create((i * 16 - 8), (j * 16 - 8), obj_wall)
                    }
                }
            }
        }
        timer = timerstart
        state = 2
        instances_cur = array_length_1d(instances) - 1
        break
    case 2:
        if (timer > 0)
            timer--
        else
        {
            timer = timerstart
            with (obj_boss2_sub_holder)
            {
                if (visible == false)
                {
                    visible = true
                    return;
                }
            }
            with (obj_boss2_arm_socket)
            {
                if (visible == false)
                {
                    visible = true
                    return;
                }
            }
            with (obj_boss2_body_seg)
                visible = true
            with (obj_boss2_sub)
                visible = true
            t = instance_create(obj_boss2_sub.x, obj_boss2_sub.y, obj_enemydeath_explosion)
            t.depth = obj_boss2_sub.depth + 1
            global.boss_hud_active = 1
            global.boss_hud_target = id
            state = 2.5
        }
        break
    case 2.5:
        if (hp != hp_target)
        {
            hp = approach(hp, hp_target, 5)
            if ((hp % 15) == 0)
                audio_play_sound(UImove, 5, false)
        }
        else
        {
            state = 3
            global.boss_hud_target = instance_find(obj_boss2_sub, 0)
        }
        break
    case 4:
        if (timer > 0)
            timer--
        else
        {
            timer = timerstart
            with (obj_boss2_arm_socket)
            {
                instance_destroy()
                return;
            }
        }
        break
    case 5:
        if (timer > 0)
            timer--
        else
        {
            timer = timerstart
            if (instances_cur >= 0)
            {
                t = instances[instances_cur]
                t.x = t.xstart
                t.y = t.ystart
                with (t)
                {
                    if (sprite_index == spr_wall2)
                        sprite_index = old_sprite
                }
                t2 = instance_create(t.x, t.y, obj_dust_cloud_jump)
                t2.depth = t.depth - 1
                instances_cur--
                if (instances_cur >= 0)
                {
                    t = instances[instances_cur]
                    t.x = t.xstart
                    t.y = t.ystart
                    with (t)
                    {
                        if (sprite_index == spr_wall2)
                            sprite_index = old_sprite
                    }
                    t2 = instance_create(t.x, t.y, obj_dust_cloud_jump)
                    t2.depth = t.depth - 1
                    instances_cur--
                    audio_play_sound(snd_boss2_ShieldNodeCreate, 5, false)
                }
            }
            else
            {
                if (shootdoors != self)
                {
                    for (i = 0; i < array_length_1d(shootdoors); i++)
                    {
                        t = shootdoors[i]
                        t.x = t.xstart
                        t.y = t.ystart
                        t.visible = true
                        instance_create(shootdoors[i].x, shootdoors[i].y, obj_dust_cloud_jump)
                    }
                }
                for (i = 0; i < array_length_1d(sidewalls); i++)
                {
                    with (sidewalls[i])
                        instance_destroy()
                }
                audio_play_sound(snd_boss2_ShieldNodeCreate, 5, false)
                with (obj_wall2)
                    instance_destroy()
                with (obj_boss2_seg_wall)
                    instance_destroy()
                instance_destroy()
                music_play_main(1)
            }
        }
        break
}

