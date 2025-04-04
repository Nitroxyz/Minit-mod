spin_angle += spin_speed
spin_speed = approach(spin_speed, (30 * image_xscale), 15)
spin_angle = wrap(spin_angle, 0, 360)
spin_angle = round(spin_angle)
spin_speed = approach(spin_speed, 20, 0.25)
if instance_exists(obj_player)
    image_xscale = sign(obj_player.x - x)
if instance_exists(obj_player)
    hover_x = lerp(hover_x, obj_player.x, 0.3)
hover_angle += hover_spd
hspd = approach(hspd, sign(xstart - x), 0.1)
if (!(place_meeting((x + sign(hspd) * 16), y, obj_wall)))
    x += hspd
else
{
    var t = instance_place((x + sign(hspd) * 16), y, obj_wall)
    with (t)
    {
        if place_meeting(x, y, obj_bridgenode)
            other.x += other.hspd
        else
        {
            other.hspd *= -1
            audio_play_sound(snd_ventboss_bounce, 100, false)
            shake_screen(10)
        }
    }
}
vspd = approach(vspd, sign(ystart + 32 - y), 0.1)
if (!(place_meeting(x, (y + sign(vspd) * 16), obj_wall)))
    y += vspd
else
{
    t = instance_place(x, (y + sign(vspd) * 16), obj_wall)
    with (t)
    {
        if place_meeting(x, y, obj_bridgenode)
            other.y += other.vspd
        else
        {
            other.vspd *= -1
            audio_play_sound(snd_ventboss_bounce, 100, false)
            shake_screen(10)
        }
    }
}
if (stopped_timer > 0)
{
    stopped_timer -= 0.5
    bullet_hell_angle -= (bullet_hell_speed * sign(laser_direction) * (min(abs(laser_direction), 1.2)))
    bullet_hell_speed = approach(bullet_hell_speed, 1.5, 0.005)
    laser_x_1 = x + (lengthdir_x(168, bullet_hell_angle))
    laser_y_1 = y + (lengthdir_y(168, bullet_hell_angle))
    laser_x_2 = x + (lengthdir_x(168, (bullet_hell_angle + 180)))
    laser_y_2 = y + (lengthdir_y(168, (bullet_hell_angle + 180)))
    if (laser_x_1 < 28 || laser_x_1 > 276)
    {
        while (laser_x_1 < 28 || laser_x_1 > 276)
        {
            laser_x_1 -= lengthdir_x(2, bullet_hell_angle)
            laser_y_1 -= lengthdir_y(2, bullet_hell_angle)
        }
    }
    if (laser_y_1 < 28 || laser_y_1 > 180)
    {
        while (laser_y_1 < 28 || laser_y_1 > 180)
        {
            laser_x_1 -= lengthdir_x(2, bullet_hell_angle)
            laser_y_1 -= lengthdir_y(2, bullet_hell_angle)
        }
    }
    if (laser_x_2 < 28 || laser_x_2 > 276)
    {
        while (laser_x_2 < 28 || laser_x_2 > 276)
        {
            laser_x_2 -= lengthdir_x(2, (bullet_hell_angle + 180))
            laser_y_2 -= lengthdir_y(2, (bullet_hell_angle + 180))
        }
    }
    if (laser_y_2 < 28 || laser_y_2 > 180)
    {
        while (laser_y_2 < 28 || laser_y_2 > 180)
        {
            laser_x_2 -= lengthdir_x(2, (bullet_hell_angle + 180))
            laser_y_2 -= lengthdir_y(2, (bullet_hell_angle + 180))
        }
    }
    if (collision_line(laser_x_1, laser_y_1, x, y, obj_player, false, false) || collision_line(laser_x_2, laser_y_2, x, y, obj_player, false, false))
    {
        with (obj_player)
            player_take_damage(1)
    }
    if ((stopped_timer % 4) == 0)
    {
        t = instance_create(laser_x_1, laser_y_1, obj_dustcloud)
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
        audio_sound_pitch(snd_ventboss_lazer_loop, (0.825 + bullet_hell_speed / 4))
}
else
{
    if audio_is_playing(snd_ventboss_lazer_loop)
        audio_stop_sound(snd_ventboss_lazer_loop)
    stopped_timer = stopped_timer_max
    state = 621
    laser_direction = (-laser_direction) * 1.1
    spin_speed = 30
    chosen_stop_angle = choose(360, 90, 180, 270)
}
var shieldcount = 0
for (var i = 0; i < 4; i++)
{
    var d = 90 * i + spin_angle
    if instance_exists(shields[i])
    {
        shieldcount++
        shields[i].image_angle = d
        shields[i].x = x
        shields[i].y = y
    }
}
if (shieldcount > 0)
{
    if audio_is_playing(snd_ventboss_spin_state)
    {
        audio_sound_pitch(snd_ventboss_spin_state, (spin_speed / 60 + 0.5))
        audio_sound_gain(snd_ventboss_spin_state, (spin_speed / 40), 1)
    }
    else
        audio_play_sound(snd_ventboss_spin_state, 100, true)
}
else if audio_is_playing(snd_ventboss_spin_state)
    audio_stop_sound(snd_ventboss_spin_state)
