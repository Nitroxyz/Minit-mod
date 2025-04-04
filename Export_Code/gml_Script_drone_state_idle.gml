sprite_index = spr_drone_idle
image_speed = 0.2
move_dir = point_direction(0, 0, image_xscale, 0)
hspd = approach(hspd, lengthdir_x(top_spd_idle, move_dir), acc)
vspd = 0
var _p = collision_rectangle(bbox_left, y, bbox_right, (y + 320), obj_player, 0, 0)
if (_p || hp != hp_max)
{
    iindex = 0
    sprite_index = spr_drone_pissed
    image_speed = 0.2
    state = 326
    var _sfx = audio_play_sound(snd_drone_siren, 10, false)
    audio_sound_pitch(_sfx, random_range(0.9, 1.1))
}
if (enemy_bounce && place_meeting((x + hspd), y, obj_enemy))
{
    image_xscale *= -1
    hspd = (-hspd) * 0.25
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd) * 0.25
    image_xscale *= -1
}
x += hspd
y += vspd
animate_actor()
