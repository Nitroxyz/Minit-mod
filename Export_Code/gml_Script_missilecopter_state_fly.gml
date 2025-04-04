missilecopter_enginesound_mod()
stun_state = 315
sprite_index = spr_missilecopter_fly
image_speed = (point_distance(0, 0, hspd, vspd)) * 0.2
animate_actor()
if instance_exists(obj_player)
    var player = obj_player
else
    return;
var dir_from_player = point_direction(player.x, (player.y + 32), x, y)
var target_x = player.x + (lengthdir_x(target_distance, dir_from_player)) * 1.5
var target_y = player.y + (lengthdir_y(target_distance, dir_from_player)) * 1
if (x < target_x)
    hspd = approach(hspd, max_spd, 0.1)
else if (x > target_x)
    hspd = approach(hspd, (-max_spd), 0.1)
if (y < target_y)
    vspd = approach(vspd, max_spd, 0.1)
else if (y > target_y)
    vspd = approach(vspd, (-max_spd), 0.1)
if (x < player.x)
    image_xscale = 1
else if (x > player.x)
    image_xscale = -1
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd) * 0.5
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = (-vspd) * 0.5
}
y += vspd
if (timer > 0)
    timer--
else
{
    timer = shoot_wait
    audio_play_sound(snd_missilecopter_reload, 5, false)
    sprite_index = spr_missilecopter_load
    image_speed = 0.25
    iindex = 0
    state = 398
}
