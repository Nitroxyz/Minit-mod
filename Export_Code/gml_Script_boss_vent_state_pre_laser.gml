spin_angle += spin_speed
spin_angle = wrap(spin_angle, 0, 360)
spin_angle = round(spin_angle)
if (spin_speed != 30)
    spin_speed = approach(spin_speed, 30, 1)
hover_x = xstart + hover_dist * sin(hover_angle)
hover_angle += hover_spd
hspd = lerp(hspd, sign(xstart - x), 0.4)
vspd = approach(vspd, (2 * (sign(ystart + 32 - y))), 0.1)
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
    stopped_timer--
    if (stopped_timer == 120)
    {
        if (hp < (hp_max / 1.7))
        {
            audio_play_sound(GrenadeLaunch, 100, false)
            t = instance_create(x, y, obj_carrybot_bomb)
            t.vspd = -1
            if instance_exists(obj_player)
                t.hspd = (sign(obj_player.x - x)) * abs(t.hspd)
        }
    }
    else if (stopped_timer < 60 && (stopped_timer % 4) == 0)
    {
        if (!audio_is_playing(snd_lazer_charge))
            audio_play_sound(snd_lazer_charge, 100, false)
        instance_create(x, (y - 24), obj_steam_cloud)
        instance_create(x, (y + 24), obj_steam_cloud)
        shake_screen(3)
    }
}
else
{
    if (hp < (hp_max / 1.9))
        stopped_timer = 150
    else
        stopped_timer = 200
    bullet_hell_angle = 90
    bullet_hell_speed = 0.5
    laser_x_1 = x + (lengthdir_x(168, bullet_hell_angle))
    laser_y_1 = y + (lengthdir_y(168, bullet_hell_angle))
    laser_x_2 = x + (lengthdir_x(168, (bullet_hell_angle + 180)))
    laser_y_2 = y + (lengthdir_y(168, (bullet_hell_angle + 180)))
    stopped_timer = stopped_timer_max / (1.3 * (min(abs(laser_direction), 1.2)))
    state = 624
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
