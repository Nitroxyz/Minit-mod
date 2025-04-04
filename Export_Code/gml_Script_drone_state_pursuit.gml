if (!instance_exists(obj_player))
{
    state = 325
    if audio_is_playing(flying_audio)
        audio_stop_sound(flying_audio)
    return;
}
else
{
    move_dir = point_direction(x, y, obj_player.x, obj_player.y)
    hspd += lengthdir_x(acc, move_dir)
    vspd += lengthdir_y(acc, move_dir)
    if audio_is_playing(flying_audio)
    {
        audio_sound_pitch(flying_audio, ((point_distance(0, 0, hspd, vspd)) / top_spd_alert + 0.75))
        audio_sound_gain(flying_audio, (1 - (point_distance(x, y, obj_player.x, obj_player.y)) / 300), 0)
    }
}
if (vspd > 0)
    sprite_index = spr_drone_down
else if (vspd < 0)
    sprite_index = spr_drone_up
if (hspd < 0)
    image_xscale = -1
else if (hspd > 0)
    image_xscale = 1
if (enemy_bounce && place_meeting((x + hspd), (y + vspd), obj_enemy))
{
    var _other = instance_place((x + hspd), (y + vspd), obj_enemy)
    var _pd = point_direction(_other.x, _other.y, x, y)
    hspd = lengthdir_x(3, _pd)
    vspd = lengthdir_y(3, _pd)
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd) * 0.5
    image_xscale *= -1
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = (-vspd) * 0.5
}
if no_screen_exit
{
    y = max((camera_get_view_y(view_camera[0]) + 8), (y + vspd))
    if (vspd < 0 && y == (camera_get_view_y(view_camera[0]) + 8))
        vspd *= -1
}
else
    y += vspd
animate_actor()
