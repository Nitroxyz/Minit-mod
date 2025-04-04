with (obj_player)
{
    key_jump_held = 1
    key_jump = 0
}
stopped_timer -= 0.5
bullet_hell_angle -= bullet_hell_speed
bullet_hell_speed += 0.025
if (!obj_boss_gary.visible)
    obj_boss_gary.visible = true
if (flashtimer > 30)
    flashtimer -= (3 + bullet_hell_speed * 3)
else if (flashtimer > 0)
    flashtimer -= (3 + bullet_hell_speed * 3)
else
{
    flashtimer = flashtimer_max
    obj_boss_gary.visible = false
}
laser_x_1 = x + (lengthdir_x(168, bullet_hell_angle))
laser_y_1 = y + (lengthdir_y(168, bullet_hell_angle))
laser_x_2 = x + (lengthdir_x(168, (bullet_hell_angle + 180)))
laser_y_2 = y + (lengthdir_y(168, (bullet_hell_angle + 180)))
if (laser_x_1 < 12 || laser_x_1 > 292)
{
    while (laser_x_1 < 12 || laser_x_1 > 292)
    {
        laser_x_1 -= lengthdir_x(2, bullet_hell_angle)
        laser_y_1 -= lengthdir_y(2, bullet_hell_angle)
    }
}
if (laser_y_1 < 12 || laser_y_1 > 180)
{
    while (laser_y_1 < 12 || laser_y_1 > 180)
    {
        laser_x_1 -= lengthdir_x(2, bullet_hell_angle)
        laser_y_1 -= lengthdir_y(2, bullet_hell_angle)
    }
}
if (laser_x_2 < 12 || laser_x_2 > 292)
{
    while (laser_x_2 < 12 || laser_x_2 > 292)
    {
        laser_x_2 -= lengthdir_x(2, (bullet_hell_angle + 180))
        laser_y_2 -= lengthdir_y(2, (bullet_hell_angle + 180))
    }
}
if (laser_y_2 < 12 || laser_y_2 > 180)
{
    while (laser_y_2 < 12 || laser_y_2 > 180)
    {
        laser_x_2 -= lengthdir_x(2, (bullet_hell_angle + 180))
        laser_y_2 -= lengthdir_y(2, (bullet_hell_angle + 180))
    }
}
if (collision_line(laser_x_1, laser_y_1, x, y, obj_player, false, false) || collision_line(laser_x_2, laser_y_2, x, y, obj_player, false, false))
{
    if (!hitlast)
    {
        hitlast = 1
        with (obj_player)
        {
            alarm[3] = 90
            audio_play_sound(CatHurt, 100, false)
            vspd = -2
            hspd = 2 * (sign(80 - x))
            if (move_state != 66)
                key_jump = 1
            if (vehicle == 1)
                sprite_index = spr_mech_hurt
            global.cur_hp--
            global.cur_hp = clamp(global.cur_hp, 1, global.max_hp)
        }
        audio_play_sound(bgm_boss_stab, 100, false)
        shake_screen(10)
        scr_flash(0.4, 2)
        if (stopped_timer <= 0)
        {
            with (obj_player)
            {
                stun = 1
                vspd = -3
                hspd = sign(80 - x)
                qu_face(id, -1)
                player_updategundir()
            }
            if audio_is_playing(snd_ventboss_lazer_loop)
                audio_stop_sound(snd_ventboss_lazer_loop)
            obj_boss_gary.visible = true
            obj_boss_gary.state = 658
            obj_boss_gary.hspd = 1
            instance_destroy()
            return;
        }
    }
}
else if hitlast
    hitlast = 0
if ((stopped_timer % 4) == 0)
{
    var t = instance_create(laser_x_1, laser_y_1, obj_dustcloud)
    with (t)
    {
        hspd = 0
        vspd = 0
    }
    t = instance_create(laser_x_2, laser_y_2, obj_dustcloud)
    with (t)
    {
        hspd = 0
        vspd = 0
    }
}
if (!audio_is_playing(snd_ventboss_lazer_loop))
    audio_play_sound(snd_ventboss_lazer_loop, 100, true)
else
    audio_sound_pitch(snd_ventboss_lazer_loop, (0.825 + bullet_hell_speed / 8))
