vehicle = 2
shoot_state = 86
var hor = key_right - key_left
var vert = key_down - key_up
var pd = point_direction(0, 0, hor, vert)
var pdist = point_distance(0, 0, hor, vert)
if (pdist == 0)
{
    hspd = approach(hspd, 0, (sub_accel / 2))
    vspd = approach(vspd, 0, (sub_accel / 2))
}
else
{
    hspd = approach(hspd, lengthdir_x(sub_movespd, pd), sub_accel)
    vspd = approach(vspd, lengthdir_y(sub_movespd, pd), sub_accel)
}
if (effect_timer[0] > 0)
    effect_timer[0]--
else
{
    effect_timer[0] = 6
    if (hspd == 0 && vspd == 0)
    {
    }
    else
        instance_create((x - image_xscale * 15), (y - 4), obj_water_bubble_catbreath)
}
var spd_abs = point_distance(0, 0, hspd, vspd)
if (spd_abs < 0.1 && pdist == 0)
{
    sprite_index = spr_player_sub_idle
    image_speed = 0.5
}
else
{
    sprite_index = spr_player_sub
    image_speed = spd_abs
}
if ((!key_shoot2held) && hor != 0)
    image_xscale = sign(hor)
if (!audio_is_playing(snd_sub_motor))
    sub_motor_sfx = audio_play_sound(snd_sub_motor, 5, false)
audio_sound_pitch(sub_motor_sfx, approach(audio_sound_get_pitch(sub_motor_sfx), (0.6 + spd_abs * 0.5), 0.005))
audio_sound_gain(sub_motor_sfx, min(1, (spd_abs + 0.25)), 30)
if key_dismount
{
    var screen_edge = collision_rectangle((bbox_left - 16), bbox_top, (bbox_right + 16), bbox_bottom, obj_switch_room, 0, 0)
    if (!screen_edge)
    {
        if (!(collision_rectangle((bbox_left - 8), (bbox_top - 8), (bbox_right + 8), (bbox_bottom + 8), obj_shootdoor, 0, 1)))
        {
            player_exit_sub()
            return;
        }
    }
}
if (!in_water)
{
    vspd -= 2
    move_state = 80
}
